# Bash awk script 

Bash_awk is a BASH utility, it divides each line into fields according to the specific input field separator (FS) and allows modifying it with the output field separator (OFS), it also allows modifying the output record separator (ORS).

## Usage

First make it executable with `chmod 755 bash_awk.sh` command.

The script works with the following awk variables:

- Columns: Use the variables $1 $2 $3 ... $n to use these number of columns, when $0 is selected it prints all the columns.
- FS: Which is either a single character or a regular expression, controls the way awk splits an input record into fields.
- OFS: Replace the current separator of your file with another.
- ORS: Replace the default ORS (new line) with some other string.

### Default Options

These are the default options, the CLI flags to set them are:

- **`-c, --columns [1,2,3...n]`**: select the number of columns to print, for example 1,2,3 (the first, second and third column), or 0 to select all columns.
- **`-o, --old_separator [FS]`** Is the current separator of your file, for example CSV files use "," or ";".
- **`-p, --output_field_separator [OFS]`**: Replace the current separator of your file with another.
- **`-u, --output_record_separator [ORS]`**: Replace the default ORS (new line) with some other string.
- **`-f, --file [FILE]`** Full PATH of a file to read.

### Script Initialization

Multiple script usage examples:

```bash
# Reading the CSV file:
bzmore csv.csv 
------> csv.csv <------
Year;Industry_aggregation_NZSIOC;Industry_code_NZSIOC;Industry_name_NZSIOC;Units;Variable_code;Variable_category;Value
2020;Level 1;99999;All industries;Dollars (millions);H01;Financial performance;733.258
2020;Level 1;99999;All industries;Dollars (millions);H04;Financial performance;660
2020;Level 1;99999;All industries;Dollars (millions);H05;Financial performance;54.342
2020;Level 1;99999;All industries;Dollars (millions);H07;Financial performance;18.285
2020;Level 1;99999;All industries;Dollars (millions);H08;Financial performance;654.872
2020;Level 1;99999;All industries;Dollars (millions);H09;Financial performance;3.273
2020;Level 1;99999;All industries;Dollars (millions);H10;Financial performance;7.509
2020;Level 1;99999;All industries;Dollars (millions);H11;Financial performance;26.821
2020;Level 1;99999;All industries;Dollars (millions);H12;Financial performance;119.387

# Replace the FS ";" with a new OFS "<->"
./bash_awk.sh -c 0 -o ";" -p " <-> " -f csv.csv 
Year <-> Industry_aggregation_NZSIOC <-> Industry_code_NZSIOC <-> Industry_name_NZSIOC <-> Units <-> Variable_code <-> Variable_category <-> Value
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H01 <-> Financial performance <-> 733.258
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H04 <-> Financial performance <-> 660
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H05 <-> Financial performance <-> 54.342
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H07 <-> Financial performance <-> 18.285
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H08 <-> Financial performance <-> 654.872
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H09 <-> Financial performance <-> 3.273
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H10 <-> Financial performance <-> 7.509
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H11 <-> Financial performance <-> 26.821
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H12 <-> Financial performance <-> 119.387

# Replace the default ORS "\n" with a new ORS "--->>"
./bash_awk.sh -c 0 -o ";" -p " <-> " -u "\n--->>\n" -f csv.csv 
Year <-> Industry_aggregation_NZSIOC <-> Industry_code_NZSIOC <-> Industry_name_NZSIOC <-> Units <-> Variable_code <-> Variable_category <-> Value
--->>
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H01 <-> Financial performance <-> 733.258
--->>
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H04 <-> Financial performance <-> 660
--->>
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H05 <-> Financial performance <-> 54.342
--->>
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H07 <-> Financial performance <-> 18.285
--->>
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H08 <-> Financial performance <-> 654.872
--->>
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H09 <-> Financial performance <-> 3.273
--->>
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H10 <-> Financial performance <-> 7.509
--->>
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H11 <-> Financial performance <-> 26.821
--->>
2020 <-> Level 1 <-> 99999 <-> All industries <-> Dollars (millions) <-> H12 <-> Financial performance <-> 119.387
--->>

# Align the columns 1, 2 and 3 with the "column" command, for this use the same OFS configured with the column command, in this example "|".
./bash_awk.sh -c 1,2,3 -o ";" -p "|"  -f csv.csv | column -t -s "|"
Year                                   Industry_aggregation_NZSIOC   Industry_code_NZSIOC
2020                                   Level 1                       99999
2020                                   Level 1                       99999
2020                                   Level 1                       99999
2020                                   Level 1                       99999
2020                                   Level 1                       99999
2020                                   Level 1                       99999
2020                                   Level 1                       99999
2020                                   Level 1                       99999
2020                                   Level 1                       99999

```
