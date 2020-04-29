import argparse
import sys
import os
import pandas as pd

def create_arg_parser():
    """Create parser for command line arguments."""
    parser = argparse.ArgumentParser(description='Drop duplicate values ')
    parser.add_argument('input',
                        help='Path to the input file.')
    return parser

if __name__ == "__main__":
    arg_parser = create_arg_parser()
    parsed_args = arg_parser.parse_args(sys.argv[1:])

DF = pd.read_csv(parsed_args.input, sep=",")
DF.drop_duplicates(subset=["Cluster ID"], inplace=True)
DF.drop_duplicates(subset=["Name", "Municipality"], inplace=True)
DF.to_csv(sys.stdout)
