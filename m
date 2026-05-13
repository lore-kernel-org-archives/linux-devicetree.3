Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9FD3C989B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778709282; cv=none; b=OEc53wb5lCPjJ0h2zOajABgkzns3TKACByy5b5YHYXEAy0p55m13EP2iiZvAXW/ZV68JUaltiNVYxusnQZXm9MQMZ98cKvzo0iH7dxZdwHQH0Jby9OxJuWNeoXgYl+AF5qQupd6AlbSwZslFPIkz1kOFYbbblcDS7+D27P3U8Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778709282; c=relaxed/simple;
	bh=gXODwqqodfmZH/US/nHhrttmcRTTeNLRCKig9P4EtrA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P/lRvSAmL34jez6fFd6kL35yZaGhShuSFxjrFj6JKYm1QUUBbjfTctaT//Wh/N0vZb39O9FPX5eIka/jy7h+wVZvseJm+FcpN/RjarMVqm2DUTTLrqwGVJl22I6yu5/BURqdhfW+nWINlAKzhhiYEPsAJD/E0IWglJXLqER/j3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdSqb93q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdSqb93q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17B8C19425;
	Wed, 13 May 2026 21:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778709282;
	bh=gXODwqqodfmZH/US/nHhrttmcRTTeNLRCKig9P4EtrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DdSqb93qulgMFkSqU5WNCn7JFJZHFPELc4fOiCA5+ORXeyyshqkHEiRfZxfzUgT2p
	 9yhL/wiW7qZP5kbQdCrBbgDfpjoAfbhHlyQhg4EBNpWuBXSe1BnKFilJimpBtm6yaL
	 R3R4xOGH/2QVWa24mxyVhfc+Bgj/V+4KXNfpmny9ZTzYUBI6Z1zz2SHMqNhB69SUkr
	 Tlxe64csuWghVU5lwrbDrgHIoQPSqbTvhuEHv3UgJXYnJFzWawlNTe/+DjN5qDamK/
	 6zOvIlKzVFMljVvRTU0/3pWie48JuO2kxjLn539eRdDHj9mz1hWwOJM80K3iw2HTrb
	 z3FIvwENpfMgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jagadeesh Kona" <jagadeesh.kona@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512-glymur_camcc-v3-2-a7196fee2779@oss.qualcomm.com>
References: <20260512-glymur_camcc-v3-2-a7196fee2779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 21:54:41 +0000
Message-Id: <20260513215441.E17B8C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect hardware clock mapping for P_CAM_CC_PLL2_OUT_EVEN in cam=
_cc_parent_data_1.
- [High] Mismatch between parent map and frequency table for cam_cc_xo_clk_=
src leading to clock configuration failure.
- [High] Inconsistent hardware register offsets for CSI4 clocks.
- [Medium] Cross-Config Consistency Kconfig violation for CLK_GLYMUR_CAMCC.
--

commit 5405dbfa49980ee6b2cd4bb1348b52c906b3f710
Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

clk: qcom: camcc-glymur: Add camera clock controller driver

Add support for the camera clock controller for camera clients
to be able to request for camcc clocks on Glymur platform.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index df21ef5ffd686..754c3b823f3f8 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -45,6 +45,17 @@ config CLK_ELIZA_TCSRCC
>  	  Support for the TCSR clock controller on Eliza devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
> =20
> +config CLK_GLYMUR_CAMCC
> +	tristate "Glymur Camera Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_GLYMUR_GCC
> +	default m if ARCH_QCOM

This isn't a bug, but is it intentional to use default m if ARCH_QCOM here?
Existing sibling configurations for the same SoC family (such as
CLK_GLYMUR_DISPCC and CLK_GLYMUR_GPUCC) omit this default.

> +	help
> +	  Support for the camera clock controller on Qualcomm Technologies, Inc

[ ... ]

> diff --git a/drivers/clk/qcom/camcc-glymur.c b/drivers/clk/qcom/camcc-gly=
mur.c
> new file mode 100644
> index 0000000000000..b21e6830a72b4
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-glymur.c
> @@ -0,0 +1,2280 @@

[ ... ]

> +static const struct parent_map cam_cc_parent_map_1[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL2_OUT_EVEN, 3 },
> +	{ P_CAM_CC_PLL2_OUT_MAIN, 5 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_1[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &cam_cc_pll2.clkr.hw },
> +	{ .hw =3D &cam_cc_pll2.clkr.hw },

Does this correctly map the EVEN and MAIN outputs? Both are currently mapped
to the undivided &cam_cc_pll2.clkr.hw structure, and it appears the
cam_cc_pll2_out_even post-divider structure is missing from the file
entirely.

Other PLLs like PLL0 and PLL1 have proper post-divider structures defined
for their EVEN outputs. Could this cause the framework to miscalculate
the rate of the EVEN output by treating it as the full MAIN frequency?

> +};

[ ... ]

> +static struct clk_rcg2 cam_cc_xo_clk_src =3D {
> +	.cmd_rcgr =3D 0x13948,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D cam_cc_parent_map_6_ao,
> +	.freq_tbl =3D ftbl_cam_cc_xo_clk_src,

Will this configuration cause rate operations on cam_cc_xo_clk_src to fail?
The frequency table relies on P_BI_TCXO, but the mapped
cam_cc_parent_map_6_ao only contains P_BI_TCXO_AO:

static const struct parent_map cam_cc_parent_map_6_ao[] =3D {
	{ P_BI_TCXO_AO, 0 },
};

When the clock framework searches for the source, qcom_find_src_index()
might return -ENOENT.

> +	.hw_clk_ctrl =3D true,

[ ... ]

> +static struct clk_rcg2 cam_cc_csi1phytimer_clk_src =3D {
> +	.cmd_rcgr =3D 0x15104,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,

[ ... ]

> +static struct clk_rcg2 cam_cc_csi4phytimer_clk_src =3D {
> +	.cmd_rcgr =3D 0x15124,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,

Is the .cmd_rcgr offset correct for this clock block?

The address 0x15124 is immediately sequential to the CSI1 RCGR (0x15104),
which suggests this might actually be the CSI2 offset. Additionally, the
corresponding branch clocks for CSI4 use .halt_reg at 0x15250 and
0x15254, which are spaced unusually far from the 0x15124 RCGR.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-glymur_cam=
cc-v3-0-a7196fee2779@oss.qualcomm.com?part=3D2
