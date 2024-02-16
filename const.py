ONYX_MAX_MUT_NUC_SIZE = 63
ONYX_MAX_MUT_AA_SIZE = ONYX_MAX_MUT_NUC_SIZE/3

ONYX_MUT_TYPES_ALEDB = ["SNP", "INS", "DEL"]
ONYX_MUT_TYPES_PANVARS = ["substitution", "insertion", "deletion"]

ONYX_MUT_NUC_SIZE_REDUNDANT_THRESHOLD = 21  # According to Viji (current Onyx operator)
ONYX_MUT_AA_SIZE_REDUNDANT_THRESHOLD = int(ONYX_MUT_NUC_SIZE_REDUNDANT_THRESHOLD/3)

SYNTHETIC_BRESEQ_TRUNC_MUT_SEQ_CHANGE = "+TAATAGTGA"

WEIRD_BRESEQ_DASH = '‐'

MUTATION_TYPE_COLOR_PALETTE = {
    'insertion':'#4C72B0',
    'nonsynonymous substitution':"#DD8452",
    'synonymous substitution':"#55A868",
    'truncation':"#C44E52",
    'deletion':"#937860",
}
