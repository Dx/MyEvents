#import <UIKit/UIKit.h>

extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
void MREP_25BA2C4288F544A5BD6822F687A63A92(void *, void *);
void MREP_B9256CEEDEDF4811993F2A36CE10DAF6(void *, void *);
void MREP_B654F41714394AD0BDDD7B2116CB114C(void *, void *);
void MREP_C2AD73E491DD4D0FBACEF97F958E9176(void *, void *);
void MREP_28ED34E8BFE74DB69024D201545D98A8(void *, void *);
void MREP_1DA04FB98B304829AD6E8840D36D0F4D(void *, void *);
void MREP_D7C509EF71AF404E9418F8B8415557A1(void *, void *);
void MREP_693B769E42D54F92AA1DC26AE93F690B(void *, void *);
void MREP_DB505CD125FB4BF98E0082BBC1B82677(void *, void *);
void MREP_A3DA1E6EB1E045A7A72D0F32CAE7C480(void *, void *);
void MREP_024DC4702AEC494C8E471EAB8A7F2B99(void *, void *);
void MREP_67E7AD79507640DE9E2CAB9DB350F3CA(void *, void *);
void MREP_24396EE904314BF6B6B8F787679CF3EB(void *, void *);
void MREP_BE43C980DED24BF0B52CD03A1A47301D(void *, void *);
void MREP_0653FB27E5A744FD8B7DE8870D3EDA26(void *, void *);
void MREP_4D4EF6D3814B44D5A3D8DABA4B79FFE5(void *, void *);
void MREP_C99F074909B24753BF3EF8910C28E892(void *, void *);
void MREP_FF7BFB0100E34596B83EDA2E4EE14674(void *, void *);
void MREP_583F245B49C942DF87907047C062B377(void *, void *);
void MREP_762E3818B8874A6B854EB8DA1453026E(void *, void *);
void MREP_82CD8AA20415400DB197DC1302A4DB30(void *, void *);
void MREP_C5C4CE95BCB845979FB23D6F99B21FA6(void *, void *);
void MREP_B87000F8A18B484CB68FC5F16A26E010(void *, void *);
void MREP_156EBEDD9FA04AE79D2F324DE612259D(void *, void *);
void MREP_3773FE4258EE4FF88A5B1B71707CB480(void *, void *);
void MREP_B9D346690B14408DB28AA9E22D5051F3(void *, void *);
void MREP_F6D2F3E5C9A34837864AA0F11028FE18(void *, void *);
void MREP_AF5AA4FE7DF04C9896C1AADD2447CF87(void *, void *);
void MREP_4F0873C438B5473DBF103905AA21002B(void *, void *);
void MREP_60D1608BD4D740DB8657D4B314CBFA7A(void *, void *);
void MREP_065E59B3CF75480883DC28B1208531C4(void *, void *);
void MREP_65067B2009164B55A526BEEB1ABA5082(void *, void *);
void MREP_EFCB07E329374525BC9B3F9D0E6650EA(void *, void *);
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
	try {
	    void *self = rb_vm_top_self();
MREP_25BA2C4288F544A5BD6822F687A63A92(self, 0);
MREP_B9256CEEDEDF4811993F2A36CE10DAF6(self, 0);
MREP_B654F41714394AD0BDDD7B2116CB114C(self, 0);
MREP_C2AD73E491DD4D0FBACEF97F958E9176(self, 0);
MREP_28ED34E8BFE74DB69024D201545D98A8(self, 0);
MREP_1DA04FB98B304829AD6E8840D36D0F4D(self, 0);
MREP_D7C509EF71AF404E9418F8B8415557A1(self, 0);
MREP_693B769E42D54F92AA1DC26AE93F690B(self, 0);
MREP_DB505CD125FB4BF98E0082BBC1B82677(self, 0);
MREP_A3DA1E6EB1E045A7A72D0F32CAE7C480(self, 0);
MREP_024DC4702AEC494C8E471EAB8A7F2B99(self, 0);
MREP_67E7AD79507640DE9E2CAB9DB350F3CA(self, 0);
MREP_24396EE904314BF6B6B8F787679CF3EB(self, 0);
MREP_BE43C980DED24BF0B52CD03A1A47301D(self, 0);
MREP_0653FB27E5A744FD8B7DE8870D3EDA26(self, 0);
MREP_4D4EF6D3814B44D5A3D8DABA4B79FFE5(self, 0);
MREP_C99F074909B24753BF3EF8910C28E892(self, 0);
MREP_FF7BFB0100E34596B83EDA2E4EE14674(self, 0);
MREP_583F245B49C942DF87907047C062B377(self, 0);
MREP_762E3818B8874A6B854EB8DA1453026E(self, 0);
MREP_82CD8AA20415400DB197DC1302A4DB30(self, 0);
MREP_C5C4CE95BCB845979FB23D6F99B21FA6(self, 0);
MREP_B87000F8A18B484CB68FC5F16A26E010(self, 0);
MREP_156EBEDD9FA04AE79D2F324DE612259D(self, 0);
MREP_3773FE4258EE4FF88A5B1B71707CB480(self, 0);
MREP_B9D346690B14408DB28AA9E22D5051F3(self, 0);
MREP_F6D2F3E5C9A34837864AA0F11028FE18(self, 0);
MREP_AF5AA4FE7DF04C9896C1AADD2447CF87(self, 0);
MREP_4F0873C438B5473DBF103905AA21002B(self, 0);
MREP_60D1608BD4D740DB8657D4B314CBFA7A(self, 0);
MREP_065E59B3CF75480883DC28B1208531C4(self, 0);
MREP_65067B2009164B55A526BEEB1ABA5082(self, 0);
MREP_EFCB07E329374525BC9B3F9D0E6650EA(self, 0);
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
	initialized = true;
    }
}
