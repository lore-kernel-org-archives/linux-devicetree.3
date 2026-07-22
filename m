Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC343D0C1D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754088; cv=none; b=dbgPg3+9xCly7nYurIr1lyBX2I1dwj1m9PrPReh3VT9Fgaol5Jov1Za38yEr9T4d/jsWLWJcO2rRyiIofdpAT1qMUDpl6t1J3poNgdfUyWTcjbsZh7Gz3V1PUpTJ8s2WgwSL6qKQyE3bAWnw2OlSWXazqNGelYVUh50ScXztpcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754088; c=relaxed/simple;
	bh=V5ae4wt+kFCmaTfJNXyQlTVPd/ouJQl5QdD2PULpWQs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AVNei/wX4Asq7J1H0F1X4JozR1LAf9yW70bmDaNHrpl5zbGm9VKZ10rOG5ETYGk3R0yRFW8gskzEYbw6x4sOt+ESopfAKK74e37YRwkSYVylPb5GNIe6dXhOxF3tjbWNsaPjQGP5ddoFEuJVKZm5FlIqTH0i2GAVnhqtHQ0eg5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxOkWcnP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxOkWcnP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98EC1F000E9;
	Wed, 22 Jul 2026 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784754087;
	bh=Cm87xeJ8xYYZ/JRXmc8/tRJsdHELRd4xWvsa7j5sRl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nxOkWcnPtapGrQVUQR3EfA+/RzaTx07JX5ZQDF8Lq82IsVrqdkzRi/qg/FLyPEelP
	 qAEzunvq+PdO/b1PFuFIb320npYDmu+gmsILnnJorB/F27purIK67xtGzRhD8PJfqC
	 Sv5kvrogF7vw1TIjUdZspZk4yNGSpF349b/xC5DJGlWH+N5pkjd4h9fS20YE+GKejr
	 znDtTr8gOG23q3Wae18IFrzQHmLt7Mc4xR2tFUTwE3FSduKHZ2eWoITOfoD2XP+4ud
	 fqPJGqAGyyZBt/+1rr+rQMWO0zYF3GYMpAUIJu5nWWZ9kF0qHRNMAN0+0Li7Wy3Tk3
	 7ESAq46d1eTqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] clk: samsung: Introduce Exynos9610 clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandru Chimac" <alex@chimac.ro>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-exynos9610-clocks-v3-4-c672a2a30889@chimac.ro>
References: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
 <20260722-exynos9610-clocks-v3-4-c672a2a30889@chimac.ro>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 21:01:26 +0000
Message-Id: <20260722210126.D98EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] The CMGP USI PCLK gates mistakenly reuse the IPCLK register offset=
s instead of their respective PCLK register offsets.
- [High] CMGP USI operational clocks bypass their dedicated baud-rate divid=
ers, feeding undivided clocks to peripherals.
- [High] The CORE CMU's CCI OCC gate mistakenly reuses the standard CCI gat=
e register offset instead of the OCC register offset.
- [High] The `CLK_DOUT_CLK_CPUCL0_CPU` divider is configured with a width o=
f 0, making it functionally invalid and permanently fixed.
- [High] The `gout_cmu_shub_bus` gate clock is missing from the APM domain,=
 leading to an orphaned clock subtree.
- [High] Critical G2D and MSCL gate clocks are omitted from the `g2d_gate_c=
lks` array.
- [High] Essential clock gate registers are omitted from `_clk_regs` snapsh=
ot arrays, causing state loss on suspend/resume.
- [High] The CMU_CORE divider clocks are not registered, breaking the CMU_C=
ORE clock tree.
- [High] A capitalization typo in the G3D switch mux clock name causes its =
downstream consumers to become orphaned.
- [High] Mismatch between fixed clock provider and consumer names for the C=
MGP RCO oscillator.
- [Low] The top divider clock macro names contain a probable typo `MFD` ins=
tead of `MFC`.
--

--- Patch [4]: [PATCH v3 4/5] clk: samsung: Introduce Exynos9610 clock cont=
roller driver ---
Hi Alexandru,

I was reviewing this patch and have a few questions about the clock definit=
ions.

commit f73db154ba8395abbaed22642b48034329d35223
Author: Alexandru Chimac <alex@chimac.ro>

clk: samsung: Introduce Exynos9610 clock controller driver

This commit introduces the Common Clock Framework driver for Exynos9610,
adding support for multiple CMU domains including TOP, APM, CAM, CMGP,
CORE, CPUCL0, DISPAUD, FSYS, G2D, G3D, PERI, and USB.

> diff --git a/drivers/clk/samsung/clk-exynos9610.c b/drivers/clk/samsung/c=
lk-exynos9610.c
> new file mode 100644
> index 0000000000000..7e7284541bb4e
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos9610.c

[ ... ]

> +static const struct samsung_fixed_rate_clock top_fixed_clks[] __initcons=
t =3D {
> +	/* OSCCLK for CMGP */
> +	FRATE(0, "oscclk_rco_cmgp", NULL, 0, 30000000),

[Severity: High]
Could this cause a parent resolution failure? The fixed-rate clock is=20
registered as "oscclk_rco_cmgp", but the CMGP domain multiplexers and gates=
=20
declare their parent dependency as "oscclk_rco". This string mismatch looks=
=20
like it might orphan the CMGP clock tree subset that relies on the RCO=20
oscillator.

[ ... ]

> +static const struct samsung_mux_clock top_mux_clks[] __initconst =3D {
[ ... ]
> +	MUX(CLK_MOUT_CMU_G3D_SWITCH, "mout_cmu_g3d_SWITCH", mout_cmu_g3d_switch=
_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH, 0, 2),

[Severity: High]
Is the uppercase SWITCH intended here? Downstream consumers such as the gat=
e=20
CLK_GOUT_CMU_G3D_SWITCH expect the parent name "mout_cmu_g3d_switch" (entir=
ely=20
lowercase). The mismatch might prevent the CCF from resolving parentage for=
=20
the G3D clock tree.

[ ... ]

> +static const struct samsung_div_clock top_div_clks[] __initconst =3D {
[ ... ]
> +	DIV(CLK_DOUT_CMU_MFD_MFC, "dout_cmu_mfc_mfc", "gout_cmu_mfc_mfc",
> +	    CLK_CON_DIV_CLKCMU_MFC_MFC, 0, 4),
> +	DIV(CLK_DOUT_CMU_MFD_WFD, "dout_cmu_mfc_wfd", "gout_cmu_mfc_wfd",
> +	    CLK_CON_DIV_CLKCMU_MFC_WFD, 0, 4),

[Severity: Low]
Is MFD a typo for MFC here? The clock strings and corresponding parent gate=
s=20
use MFC, so using MFD in the macro identifiers might break naming consisten=
cy.

[ ... ]

> +static const struct samsung_div_clock cpucl0_div_clks[] __initconst =3D {
[ ... ]
> +	DIV(CLK_DOUT_CLK_CPUCL0_CPU, "dout_clk_cpucl0_cpu", "mout_clk_cpucl0_pl=
l",
> +	    CLK_CON_DIV_DIV_CLK_CPUCL0_CPU, 0, 0),

[Severity: High]
Does a width of 0 intentionally disable this clock divider? A 0-width divid=
er=20
creates a bitmask of 0, making the clock framework unable to read or write =
the=20
actual hardware value. This might fix the divider to a constant state and=20
break cpufreq transitions for the little CPU cluster.

[ ... ]

> +static const struct samsung_gate_clock apm_gate_clks[] __initconst =3D {
[ ... ]
> +	GATE(CLK_GOUT_CLK_APM_OSCCLK_RCO_CLK, "gat_clk_apm_oscclk_rco_clk", "os=
cclk",
> +	     CLK_CON_GAT_CLK_APM_OSCCLK_RCO_CLK, 21, 0, 0),
> +	GATE(CLK_GOUT_APM_APBIF_GPIO_ALIVE_PCLK, "gout_apm_apbif_gpio_alive_pcl=
k",

[Severity: High]
Should there be a gate definition for CLK_CON_GAT_GATE_CLKCMU_SHUB_BUS here=
?=20
The CLK_DOUT_CMU_SHUB_BUS divider defines its parent as "gout_cmu_shub_bus"=
,=20
but the corresponding GATE definition appears to be missing from the=20
apm_gate_clks array, which would orphan all downstream SHUB clocks.

[ ... ]

> +static const unsigned long cam_clk_regs[] __initconst =3D {
[ ... ]
> +	CLK_CON_GAT_GOUT_CAM_IS6P10P0_ACLK_XIU_D_CAM,
> +	CLK_CON_GAT_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_CAM0,
> +	CLK_CON_GAT_GOUT_CAM_IS6P10P0_PCLK_PPMU_CAM,
> +	CLK_CON_GAT_GOUT_CAM_LHM_AXI_P_CLK,

[Severity: High]
Are CLK_CON_GAT_GOUT_CAM_LHS_ACEL_D_CLK and=20
CLK_CON_GAT_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_CAM1 missing from this=20
cam_clk_regs state-save array? Omitting them could result in losing their=20
state during a suspend/resume cycle.

[ ... ]

> +static const struct samsung_gate_clock cmgp_gate_clks[] __initconst =3D {
[ ... ]
> +	GATE(CLK_GOUT_CMGP_USI00_CLK, "gout_cmgp_usi00_clk",
> +	     "mout_clk_cmgp_usi00", CLK_CON_GAT_GOUT_CMGP_USI00_CLK,
> +	     21, 0, 0),

[Severity: High]
Should the parent here be the dedicated divider "dout_clk_cmgp_usi00" inste=
ad=20
of the upstream mux "mout_clk_cmgp_usi00"? Using the mux as the parent=20
bypasses the baud-rate dividers, which might make it impossible for periphe=
ral=20
drivers to scale the clock correctly for serial communication.

[ ... ]

> +	GATE(CLK_GOUT_CMGP_USI_CMGP00_PCLK, "gout_clk_cmgp_usi_cmgp00_pclk",
> +	     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_USI_CMGP00_IPCLK,
> +	     21, 0, 0),

[Severity: High]
Does this macro intentionally pass CLK_CON_GAT_GOUT_CMGP_USI_CMGP00_IPCLK f=
or=20
the PCLK gate? Reusing the IPCLK register offsets for the PCLK gates (up=20
through CMGP04) could clobber the IPCLK configuration and leave the actual=
=20
PCLK gates unmanaged, potentially breaking the CMGP USI interfaces.

[ ... ]

> +static const struct samsung_gate_clock core_gate_clks[] __initconst =3D {
[ ... ]
> +	GATE(CLK_GOUT_CORE_CCI_OCC_CLK, "gout_core_cci_occ_clk",
> +	     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_CCI_CLK,
> +	     21, 0, 0),

[Severity: High]
Should this use CLK_CON_GAT_GOUT_CORE_CCI_OCC_CLK instead of=20
CLK_CON_GAT_GOUT_CORE_CCI_CLK? Utilizing the standard CCI gate register off=
set=20
for the OCC gate will likely cause OCC clock control operations to overwrit=
e=20
the standard CCI clock gate state.

[ ... ]

> +static const struct samsung_cmu_info core_cmu_info __initconst =3D {
> +	.mux_clks		=3D core_mux_clks,
> +	.nr_mux_clks		=3D ARRAY_SIZE(core_mux_clks),
> +	.gate_clks		=3D core_gate_clks,
> +	.nr_gate_clks		=3D ARRAY_SIZE(core_gate_clks),
> +	.clk_regs		=3D core_clk_regs,

[Severity: High]
Are the .div_clks and .nr_div_clks fields intentionally omitted here? Witho=
ut=20
them, the core_div_clks array isn't registered, which might orphan=20
dout_clk_core_busp and break the 25 downstream hardware gate clocks in the=
=20
CORE domain that depend on it.

[ ... ]

> +static const unsigned long fsys_clk_regs[] __initconst =3D {
[ ... ]
> +	CLK_CON_GAT_GOUT_FSYS_LHS_ACEL_D_CLK,
> +	CLK_CON_GAT_GOUT_FSYS_MMC_CARD_ACLK,
> +	CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_ACLK,
> +	CLK_CON_GAT_GOUT_FSYS_PGEN_LITE_CLK,

[Severity: High]
Are the MMC SDCLKIN registers (CLK_CON_GAT_GOUT_FSYS_MMC_CARD_SDCLKIN and=20
CLK_CON_GAT_GOUT_FSYS_MMC_EMBD_SDCLKIN) missing from this fsys_clk_regs=20
suspend/resume array? Leaving them out might cause the MMC subsystem to los=
e=20
state across a suspend/resume cycle.

[ ... ]

> +static const struct samsung_gate_clock g2d_gate_clks[] __initconst =3D {
[ ... ]
> +	GATE(CLK_GOUT_G2D_BUSP_CLK, "gout_g2d_busp_clk", "dout_clk_g2d_busp",
> +	     CLK_CON_GAT_GOUT_G2D_BUSP_CLK, 21, 0, 0),
> +	GATE(CLK_GOUT_G2D_SYSMMU_CLK, "gout_g2d_sysmmu_clk", "mout_pll_g2d_g2d_=
user",
> +	     CLK_CON_GAT_GOUT_G2D_SYSMMU_CLK, 21, CLK_IGNORE_UNUSED, 0),

[Severity: High]
Are gout_g2d_g2d_clk and gout_g2d_mscl_clk intentionally excluded from the=
=20
g2d_gate_clks array? Their absence prevents the CCF from registering and=20
enabling the operational leaf clocks for the G2D and MSCL hardware domains.

Thanks,
Review Bot

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-exynos9610=
-clocks-v3-0-c672a2a30889@chimac.ro?part=3D4
