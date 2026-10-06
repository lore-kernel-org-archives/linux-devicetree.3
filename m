Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248052367B8
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 05:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791265196; cv=none; b=k9iXW5GEWi/lEKsa50GatRe8ZhPg3OjRg8nV1Tu0qlvIKc65JoGremEKC/7T5N5O1YG8AV/NEIVhodXgf8R12lu7TpKd8zftXIKg3BL57dZ8vs0PiLESmQJxC5Sp2m+HJA//tJ1m6bCgpaR9HxCC1Pr9LSxu/tq/eWJYIAEv5RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791265196; c=relaxed/simple;
	bh=rDmzdgD7cl8r/jPti7+BLwtO9xlS5cAHnrqs5TlZgUs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eTB4Mrt46I2gI44oOYP9aJOrka5pIhRfMzVd2ynUz+lnN+MbL521q5QFr2IZzm5agYUQ77+5H4ywj31NNj/Bpt2lILYjcGO51dahkIvqdhPeGd5h8LzFufdmOoyP6ZXNXK6sqtn7aJBlvxacwrujjqwf+FOLWZhyH5SNdYQFZtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Avi1Bp0j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Avi1Bp0j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9581F000FF;
	Tue,  6 Oct 2026 05:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791265194;
	bh=AOTDTwvUjfG+CeUVq+YszO8ijPdMCTwLskk52Cum6wU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Avi1Bp0jm/5dCCGnVWsfV3JwTJ4DwV7PO0LqlXSm3WR6kGOJasuY374TUSnQvFH45
	 Q1WCXQlEpuAh3RawujdriVFiIZdEl2+/HJVM963Qn965T2CrlsUDV/yNYCo5mpDeOK
	 WXE0xS/HLP7Lfoh7Y/DdfTGzSlo5N2GkNhhdOST846mQDGWzgdzZmW9wwNpgbZHtCR
	 P9AIpH11o/wdN8dhu/zW9pW9zWVxVVsugo0re62EbBjYc2yNrwWAwG6Hv/692A/CJ9
	 ZUWHoGZOKTYZF9aNaLqUEQIVrZU8rcjSu8FwMrfJc8yWdCNK/nore3TOvenOVnj7tC
	 IhD+fMWD3qH9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20261006-phy-v5-6-cbe9330a6449@oss.qualcomm.com>
References: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
 <20261006-phy-v5-6-cbe9330a6449@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 05:39:53 +0000
Message-Id: <20261006053954.5D9581F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] phy: qcom: missing SIDDQ clear in 6nm PHY post-tuning
- [Low] build: missing <linux/bitfield.h> for FIELD_PREP_CONST
--

commit bd845c9b97c7b3b1c9ec07fec6daa12f9b0766d5
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

phy: qcom: snps-femto-v2: Add IPQ9650 support

Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650.
The PHYs on this SoC require a dedicated init sequence and override
parameters before they can be enabled.

> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/=
qualcomm/phy-qcom-snps-femto-v2.c
> index 2e37b39dabbaa..3ed4292fc8c30 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -29,12 +29,15 @@
> =20
>  #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
>  #define POR					BIT(1)
> +#define ATERESET				BIT(0)
> =20
>  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
>  #define SIDDQ					BIT(2)
>  #define RETENABLEN				BIT(3)
>  #define FSEL_MASK				GENMASK(6, 4)
>  #define FSEL_DEFAULT				(0x3 << 4)
> +#define FSEL_24MHZ				FIELD_PREP_CONST(FSEL_MASK, 2)

[Severity: Low]
Is it possible this could cause build failures on architectures where
linux/bitfield.h is not transitively included? Relying on transitive
header inclusions might break when implicit include chains differ.

[ ... ]

> @@ -418,6 +442,32 @@ static const struct phy_reg_config hs_5nm_phy_post_t=
uning[] =3D {
>  	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
>  };
> =20
> +static const struct phy_reg_config hs_6nm_phy_pre_tuning[] =3D {
> +	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, UTMI_PHY_CMN_CT=
RL_OVERRIDE_EN },
> +	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, POR },
> +	{ USB2_PHY_USB_PHY_FSEL_SEL, FSEL_SEL, FSEL_SEL },
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, PLLBTUNE, PLLBTUNE },
> +	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT },
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, VBUSVLDEXTSEL0, VBUSVLDEXTSEL0 =
},
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL1, VBUSVLDEXT0, VBUSVLDEXT0 },
> +};
> +
> +static const struct phy_reg_config hs_6nm_phy_post_tuning[] =3D {
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2, VREGBYPASS, VREGBYPASS },
> +	{ USB2_PHY_USB_PHY_UTMI_CTRL5, ATERESET, 0 },
> +	{ USB2_PHY_USB_PHY_HS_PHY_TEST1, TESTDATAOUTSEL, 0 },
> +	{ USB2_PHY_USB_PHY_HS_PHY_TEST1, TESTCLK, 0 },
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, VATESTENB_MASK, 0 },

[Severity: Medium]
Does this sequence intentionally omit clearing the SIDDQ deep sleep bit?

If the analog PHY defaults to deep sleep (SIDDQ=3D1), omitting the clear
operation could leave the PHY powered down and non-functional during boot
or interface initialization.

Looking at hs_5nm_phy_post_tuning(), it explicitly clears the SIDDQ bit:
    { USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ, 0 }

Could the 6nm hardware behavior identically match the 5nm/7nm and other
Synopsys PHYs where SIDDQ defaults to 1, requiring it to be cleared here?

> +	{ USB2_PHY_USB_PHY_HS_PHY_TEST0, TESTDATAIN_MASK, 0 },
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
> +					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N },
> +	{ USB2_PHY_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM },
> +	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, 0 },
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0 },
> +	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-phy-v5-0-c=
be9330a6449@oss.qualcomm.com?part=3D6
