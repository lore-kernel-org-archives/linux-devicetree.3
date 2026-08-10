Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E553AEB29
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363003; cv=none; b=p4TP6kiMMWDnDxVtYIzzzo+evD1aKN1FzLmzmUAmENbClr9m/3NfTYJDeurH6STcT2H/iMwgmgHTC7+xQO3lZ5NNxiSl0FRmIIs2pfi5Rw4jcjsykM6570C6DJ2xiXkyfyfERjWC9y/0uA4COT7I4M1PmVB1bhzn42d7n+ibX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363003; c=relaxed/simple;
	bh=MS/9FHOWOkqhbM1cd0W8axxQ1HjyAkjYEEWn8nrd2EY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nx5yIgvZoysBFOheLqAjIXNOLvnxhKupgH2VSFFeokdyfVdavhE2k76hQ+4YmKdejClnbLAD6Nh+Aw+Cffrax9IteDwxztERfGJBvIrMf0vlmNByDeTSekT7+tyCZb/stUW7jKsNdLZRj8MIdriEuFflsXZUYbwTv0QlesHzgvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S56Neaop; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S56Neaop"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949081F00A3A;
	Mon, 10 Aug 2026 11:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786363001;
	bh=fWImWeNvQrGFxghidMcsgY4EnYILAlnxWZzcqDX2Iek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S56NeaopXYHSBhShCEHN9CyClUe+1a+mtUUtcq0Lke4SGIE5iQFQpmdnFYIuAO+45
	 urnurPD1Y+ObpR5ffJFP6MhYSHFGNdDBmMCt0DWGWxhIltWJ9bFE33wWKQhfOpQVmC
	 L9+MkttboHFNVo+HxyH3+El62vbnCte51UOcmZOJda4puTTU4Tpa/waUv9z/sMdyDy
	 yhaXboLW30uZAgOvXvXpARUUferAVuLYTh+6iFPWNEVMDsBiLHSSZ+IZ47jV9UfxTx
	 GEvgh0BKJYy/Wxpc25e+OpbguueOJlWs8e5NSmeXGabdKcmOcAyiT7bx0nJ52xxSP7
	 abXmReNhUMpHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] phy: qcom-ipq806x-usb: support the MSM8974 SS PHY
 parameters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260810-msm8974-usb3-v1-8-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-8-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:56:38 +0000
Message-Id: <20260810115639.949081F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unconditional modification of shared IPQ806x HS PHY initialization=
 introduces a hardware regression and contradicts the commit message.
- [Low] The PHY_PARAM_CTRL1_MASK macro is left as unused dead code.
--

--- Patch [8]: [PATCH 08/10] phy: qcom-ipq806x-usb: support the MSM8974 SS =
PHY parameters ---
commit ba82cb741a57672fd8113542520d510104c224d2
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

phy: qcom-ipq806x-usb: support the MSM8974 SS PHY parameters

This commit adds platform data for the MSM8974 compatible in the IPQ806x USB
PHY driver. It modifies qcom_ipq806x_usb_ss_phy_init() to use dynamic SS PHY
parameters instead of hardcoding IPQ806x-specific values. This ensures the
correct launch amplitudes are used for MSM8974.

[Severity: High]
Does this code unconditionally apply the active-low clamp disable bit?

drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:qcom_ipq806x_usb_hs_phy_init() {
	val =3D HSUSB_CTRL_DPSEHV_CLAMP | HSUSB_CTRL_DMSEHV_CLAMP |
		HSUSB_CTRL_RETENABLEN  | HSUSB_CTRL_COMMONONN |
		HSUSB_CTRL_OTGSESSVLD_CLAMP | HSUSB_CTRL_ID_HV_CLAMP |
		HSUSB_CTRL_UTMI_OTG_VBUS_VALID | HSUSB_CTRL_UTMI_CLK_EN |
		HSUSB_CTRL_CLAMP_EN | HSUSB_CLAMP_MPM_DPSE_DMSE_EN_N |
		phy_dwc3->drvdata->fsel;
    ...
	writel(val, phy_dwc3->base + HSUSB_PHY_CTRL_REG);
    ...
}

This completely overwrites the PHY_CTRL register for all platforms. Can this
introduce a hardware regression for older IPQ806x hardware by sending an
unintended active-low clamp-disable bit?

Also, does this contradict the commit message's claim that MSM8974 must not
overwrite the whole PHY_CTRL register?

Finally, are there redundant, duplicated bit definitions for BIT(26) in the
same file?

drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c {
    ...
#define HSUSB_CLAMP_MPM_DPSE_DMSE_EN_N	BIT(26)
    ...
}

> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qu=
alcomm/phy-qcom-ipq806x-usb.c
> index 86e8e869a743f..35abe9ae05429 100644
> --- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
[ ... ]
> @@ -433,18 +438,22 @@ static int qcom_ipq806x_usb_ss_phy_init(struct phy =
*phy)
>  	 * TX_DEEMPH_3_5DB [13:8] set based on SoC version
>  	 * LOS_BIAS [7:3] to 9
>  	 */
> -	data =3D readl(phy_dwc3->base + SSUSB_PHY_PARAM_CTRL_1);
> -
> -	data &=3D ~PHY_PARAM_CTRL1_MASK;

[Severity: Low]
Is the PHY_PARAM_CTRL1_MASK macro left as unused dead code now that its usa=
ge
has been removed here?

> -
> -	data |=3D PHY_PARAM_CTRL1_TX_FULL_SWING(0x6e) |
> -		PHY_PARAM_CTRL1_TX_DEEMPH_6DB(0x20) |
> -		PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB(phy_dwc3->tx_deamp_3_5db) |
> -		PHY_PARAM_CTRL1_LOS_LEVEL(0x9) |
> -		PHY_PARAM_CTRL1_LOS_BIAS(0x0);
> +	mask =3D PHY_PARAM_CTRL1_TX_FULL_SWING_MASK |
> +	       PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB_MASK |
> +	       PHY_PARAM_CTRL1_LOS_LEVEL_MASK |
> +	       PHY_PARAM_CTRL1_LOS_BIAS_MASK;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-msm8974-us=
b3-v1-0-1a47e1185524@oss.qualcomm.com?part=3D8
