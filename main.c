
extern int src1(void);
extern int src1a(void);
extern int src2(void);
extern int kernel(void);

int main()
{
    src1();
    src1a();
    src2();
    kernel();

    return 0;
}
