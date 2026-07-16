Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E0E3C3C0F
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222798; cv=none; b=OK8LZsF7FpzbymtyQyhRhJpgeJ5itT7ygmxj3Ojsz1cmeavsxEiTc+dpg9AaIxQnygiFu8Wc/ZumzR2jPOeiwQzR9dSmRA1VYDERdF7znbSpYy0Xu5LB+D3gJ1f6dU4I7WyMJBbxfCLTJt4j2k7+t9CvUzencK+HO8JnWWDsNy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222798; c=relaxed/simple;
	bh=v9ftN1BR2VUpjVIqqNIxCY1KXNb2FHuTC9ylCvWyM8M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q9LCwoqGVtZtGxCKxXBWyKZQbnCf4mwIdSrFSqSjc3OuulXVm6mZLML7fcy/Da7TljgFnC5xbUFA9BlVTbnFQMh0urB+nZwnM1hXvO+e7TTWPaxzDkedQendSOKPgIRY0KDsBlFLAyHs36sn5EI+XXj8P53c8rMG2zeCBy0o21Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vf6BHY2I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vf6BHY2I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445E41F000E9;
	Thu, 16 Jul 2026 17:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784222797;
	bh=95kvY6pzBiVQmlYXlSZoveUtuKrvIlelm8uZR/Edzdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vf6BHY2I0v3K5+OxZMCdCBfg8zTwZQlZgk+RHItRjHWBZSN7IKS3mQsJifYl/7KfN
	 vcpXia9IeFgcmRKEq2bpfSxlRUWFhIj/rH6s0wF9ah81m9Sv4SCmWSmAJ32yzWEhGR
	 UHj9Zov+qhfnB4rogEwChrtuJXPDWmfZSVNKdCXkmWEUNidCEWL+Umhh5kNaxE62iU
	 hRNLSQp4Hj2Ob/CdmcqozaxVOAe2XmxwlpfiqjyNCQdbBGptcBYD/LbQ8U8Q800t9g
	 UWrddX+L3F26OtavIsoTJCw2oOTL26vs+/5pqBzjiiF8RTLy5U2f3PERqXQoObUqAH
	 LAokdbxcZEQXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] clk: samsung: Introduce Exynos9610 clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandru Chimac" <alex@chimac.ro>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716-exynos9610-clocks-v2-4-c13ce8ef1861@chimac.ro>
References: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
 <20260716-exynos9610-clocks-v2-4-c13ce8ef1861@chimac.ro>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 17:26:36 +0000
Message-Id: <20260716172637.445E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Clock ID collision for `dout_cmu_usb_usb30drd` due to reused `CLK_=
DOUT_CMU_USB_BUS` ID.
- [High] The `dout_cmu_core_cci` divider incorrectly targets the `CORE_BUS`=
 hardware register.
- [High] All PCLK clock gates for CMGP I2C and USI mistakenly map to IPCLK =
register offsets.
- [High] OCC clocks in the core domain suffer from register, naming, and pa=
rent copy-paste errors.
- [High] Several configured clock registers are omitted from the `clk_regs`=
 save/restore arrays.
- [High] The `dispaud_cmu_info` structure is bound to the wrong sysreg save=
/restore array.
- [High] Six clock gates will be orphaned due to nonexistent parent clock r=
eferences (typographical errors).
- [High] The `CLK_DOUT_CLK_CPUCL0_CPU` divider is instantiated with a bit w=
idth of 0.
- [High] Mux width is too narrow for `mout_cmu_cpucl0_switch`.
- [High] The probe function is marked `__init` but registered as a persiste=
nt platform driver, creating an execute-after-free risk.
--

--- Patch [4]: [PATCH v2 4/5] clk: samsung: Introduce Exynos9610 clock cont=
roller driver ---
commit 5ae09894e4056fd99b1810f99f65fba5b78df46a
Author: Alexandru Chimac <alex@chimac.ro>

clk: samsung: Introduce Exynos9610 clock controller driver

This commit introduces the Common Clock Framework driver for the Exynos 9610
SoC. It provides support for numerous clock domains, including TOP, APM,
CAM, CMGP, CORE, CPUCL0, DISPAUD, FSYS, G2D, G3D, PERI, and USB.

> diff --git a/drivers/clk/samsung/clk-exynos9610.c b/drivers/clk/samsung/c=
lk-exynos9610.c
> index 0000000000000..39c1650247e8d
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos9610.c
[ ... ]
> static const unsigned long top_clk_regs[] __initconst =3D {
> 	PLL_LOCKTIME_PLL_MMC,
> 	PLL_LOCKTIME_PLL_SHARED0,
[ ... ]
> 	CLK_CON_DIV_CLKCMU_CAM_BUS,
> 	CLK_CON_DIV_CLKCMU_CORE_BUS,
[ ... ]

[Severity: High]
Are some registers missing from the save and restore array?

The CLK_CON_DIV_PLL_MMC_DIV2 and the four CIS dividers=20
(CLK_CON_DIV_CLKCMU_CIS_CLK0 through CLK3) appear to be omitted from=20
top_clk_regs. Could this cause these dividers to revert to power-on default=
s=20
after a suspend and resume cycle?

[ ... ]
> static const struct samsung_mux_clock top_mux_clks[] __initconst =3D {
[ ... ]
> 	MUX(CLK_MOUT_CMU_CPUCL0_DBG, "mout_cmu_cpucl0_dbg", mout_cmu_cpucl0_dbg_=
p,
> 	    CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG, 0, 1),
> 	MUX(CLK_MOUT_CMU_CPUCL0_SWITCH, "mout_cmu_cpucl0_switch", mout_cmu_cpucl=
0_switch_p,
> 	    CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH, 0, 1),

[Severity: High]
Does this mux have a bit width that is too narrow?

The mout_cmu_cpucl0_switch_p parent array has 4 elements, but the width=20
parameter is set to 1 bit. A 1-bit width can only represent indices 0 and 1=
,=20
preventing the selection of parents at indices 2 and 3 when the CPU frequen=
cy=20
scaling attempts to reparent the clock.

[ ... ]
> static const struct samsung_div_clock top_div_clks[] __initconst =3D {
[ ... ]
> 	DIV(CLK_DOUT_CMU_CORE_BUS, "dout_cmu_core_bus", "gout_cmu_core_bus",
> 	    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
> 	DIV(CLK_DOUT_CMU_CORE_CCI, "dout_cmu_core_cci", "gout_cmu_core_cci",
> 	    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),

[Severity: High]
Is the wrong hardware register targeted by this divider?

The dout_cmu_core_cci divider targets CLK_CON_DIV_CLKCMU_CORE_BUS instead o=
f=20
CLK_CON_DIV_CLKCMU_CORE_CCI. Could this cause writes to the CCI divider to=
=20
inadvertently modify the CORE_BUS divider, potentially hanging the core bus?

[ ... ]
> 	DIV(CLK_DOUT_CMU_USB_BUS, "dout_cmu_usb_bus", "gout_cmu_usb_bus",
> 	    CLK_CON_DIV_CLKCMU_USB_BUS, 0, 4),
> 	DIV(CLK_DOUT_CMU_USB_DPGTC, "dout_cmu_usb_dpgtc", "gout_cmu_usb_dpgtc",
> 	    CLK_CON_DIV_CLKCMU_USB_DPGTC, 0, 4),
> 	DIV(CLK_DOUT_CMU_USB_BUS, "dout_cmu_usb_usb30drd", "gout_cmu_usb_usb30dr=
d",
> 	    CLK_CON_DIV_CLKCMU_USB_USB30DRD, 0, 4),

[Severity: High]
Is there an ID collision in this divider array?

The CLK_DOUT_CMU_USB_BUS identifier is reused for dout_cmu_usb_usb30drd.=20
This duplicate definition overrides the earlier USB bus divider registratio=
n.

[ ... ]
> static const struct samsung_gate_clock top_gate_clks[] __initconst =3D {
> 	GATE(CLK_GOUT_CMU_MIF_SWITCH, "gout_cmu_mif_switch",
> 	     "mux_cmu_mif_switch", CLK_CON_GAT_CLKCMU_MIF_SWITCH,
> 	     21, 0, 0),

[Severity: High]
Is there a typographical error in the parent clock name?

This gate requests mux_cmu_mif_switch as its parent instead of the=20
registered mout_cmu_mif_switch. Could this orphan the clock gate and=20
prevent proper clock management for the MIF switch?

[ ... ]
> static const struct samsung_div_clock cpucl0_div_clks[] __initconst =3D {
[ ... ]
> 	DIV(CLK_DOUT_CLK_CPUCL0_CPU, "dout_clk_cpucl0_cpu", "mout_clk_cpucl0_pll=
",
> 	    CLK_CON_DIV_DIV_CLK_CPUCL0_CPU, 0, 0),

[Severity: High]
Could the bit width of 0 for this divider break CPU frequency scaling?

A 0-bit width results in a zero bitmask for the clock divider, causing=20
configuration operations to become no-ops. Will this prevent dynamic=20
frequency scaling for the CPU cluster?

[ ... ]
> static const struct samsung_gate_clock cmgp_gate_clks[] __initconst =3D {
[ ... ]
> 	GATE(CLK_GOUT_CMGP_I2C_CMGP00_IPCLK, "gout_clk_cmgp_i2c_cmgp00_ipclk",
> 	     "mout_clk_cmgp_i2c", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP00_IPCLK,
> 	     21, 0, 0),
> 	GATE(CLK_GOUT_CMGP_I2C_CMGP00_PCLK, "gout_clk_cmgp_i2c_cmgp00_pclk",
> 	     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP00_IPCLK,
> 	     21, 0, 0),

[Severity: High]
Do these PCLK gates accidentally map to the IPCLK register offsets?

This pattern repeats across the CMGP I2C and USI PCLK definitions, where th=
e=20
IPCLK register offsets are used for the PCLK gate clocks. Could toggling=20
the PCLK gates overwrite the IPCLK state while leaving the actual PCLK=20
unconfigured, leading to unclocked peripheral access hangs?

[ ... ]
> static const struct samsung_gate_clock core_gate_clks[] __initconst =3D {
[ ... ]
> 	GATE(CLK_GOUT_CORE_CCI_CLK, "gout_core_cci_clk", "mout_pll_core_cci_user=
",
> 	     CLK_CON_GAT_GOUT_CORE_CCI_CLK, 21, 0, 0),
> 	GATE(CLK_GOUT_CORE_CCI_OCC_CLK, "gout_core_cci_occ_clk",
> 	     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_CCI_CLK,
> 	     21, 0, 0),
> 	GATE(CLK_GOUT_CORE_G3D_CLK, "gout_core_g3d_clk", "mout_pll_core_g3d_user=
",
> 	     CLK_CON_GAT_GOUT_CORE_G3D_CLK, 21, 0, 0),
> 	GATE(CLK_GOUT_CORE_G3D_OCC_CLK, "gout_core_cci_g3d_occ_clk",
> 	     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_G3D_OCC_CLK,

[Severity: High]
Are there copy-paste errors in the CCI and G3D OCC clock definitions?

CLK_GOUT_CORE_CCI_OCC_CLK targets the CLK_CON_GAT_GOUT_CORE_CCI_CLK registe=
r,=20
meaning both clocks will manipulate the exact same hardware bit. Also,=20
CLK_GOUT_CORE_G3D_OCC_CLK uses the mout_pll_core_cci_user parent instead of=
=20
the intended G3D parent. Could this break on-chip controller operations and=
=20
clock gating for the Core and GPU domains?

[ ... ]
> static const struct samsung_gate_clock dispaud_gate_clks[] __initconst =
=3D {
[ ... ]
> 	GATE(CLK_GOUT_DISPAUD_BTM_DPU_ACLK, "gout_dispaud_btm_dpu_aclk",
> 	     "mout_cmu_dispaud_disp_user", CLK_CON_GAT_GOUT_DISPAUD_BTM_DPU_ACLK,
> 	     21, 0, 0),

[Severity: High]
Does this clock gate request an incorrect parent?

It requests mout_cmu_dispaud_disp_user instead of the registered=20
mout_pll_dispaud_disp_user. This error appears on multiple gates in this=20
block. Will this prevent proper clock tree registration for the DPU?

[ ... ]
> static const struct samsung_cmu_info dispaud_cmu_info __initconst =3D {
[ ... ]
> 	.sysreg_clk_regs	=3D drcg_cam_memclk_sysreg,
> 	.nr_sysreg_clk_regs	=3D ARRAY_SIZE(drcg_cam_memclk_sysreg),

[Severity: High]
Is the wrong sysreg save and restore array bound here?

The sysreg_clk_regs field points to drcg_cam_memclk_sysreg (which uses=20
offset 0x1000) instead of drcg_memclk_sysreg. During suspend and resume, co=
uld=20
the DISPAUD domain perform reads and writes to address offset 0x1000 instea=
d of=20
its proper DRCG offset (0x104) and fail to restore the correct setting?

[ ... ]
> static const unsigned long fsys_clk_regs[] __initconst =3D {
> 	PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER,
[ ... ]
> 	CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_ACLK,
> 	CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_FMP_CLK,
> 	CLK_CON_GAT_GOUT_FSYS_XIU_D_ACLK,
> };

[Severity: High]
Is a UFS register missing from this array?

The CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_CLK_UNIPRO register appears to be omitte=
d=20
from fsys_clk_regs. Could this cause the register to revert to power-on=20
defaults after a suspend and resume cycle?

[ ... ]
> static int __init exynos9610_cmu_probe(struct platform_device *pdev)
> {
[ ... ]
> static struct platform_driver exynos9610_cmu_driver __refdata =3D {
> 	.driver =3D {
> 		.name =3D "exynos9610-cmu",
> 		.of_match_table =3D exynos9610_cmu_of_match,
> 		.suppress_bind_attrs =3D true,
> 	},
> 	.probe =3D exynos9610_cmu_probe,
> };

[Severity: High]
Could marking the probe function as __init create an execute-after-free ris=
k?

The exynos9610_cmu_probe function is mapped into a persistent platform driv=
er=20
but marked __init, meaning it resides in memory that is freed after boot.=20
If a compatible device is bound dynamically post-boot, will the driver core=
=20
jump into freed memory? Additionally, the use of __refdata suppresses the=20
section mismatch warning that would normally catch this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-exynos9610=
-clocks-v2-0-c13ce8ef1861@chimac.ro?part=3D4
