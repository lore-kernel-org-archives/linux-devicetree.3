Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216153C1F57
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362698; cv=none; b=B/L6rGx8UnMwzjYrubKSmrpbNvFohfpGEJRvc4rHa9n8G8l/16ba5wBEaWiPwp3taVX2lE7lNDIQTRfGRnxtFOBR0JFE9HgyE4R7S1jF9Wa8SG5Vmdy5/ycNrDrpohEvz/H0kkFQbfe2cjMzcBjXXuOOpr8NYDQAWpO/QSuY0Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362698; c=relaxed/simple;
	bh=4T1DXHbfeQ7bmybR5+Gx6Ys4TpTOSLyTO7sftci72qk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PvsM+kl2xBG2p3XS6zNPH7F5Lg9BOgslBfbLbys9klsdNLj0xZAha+E5dKZNTFRhV2CnEvyPeL3NNMHQ7C8Y+SsWu94t7PpSVyWFMVn83T52SsAf47MbjK5C4Fs94LNXWWtZhD48z/pJELvU2sFkfcd1FgAMDEOolHiF3SvYyfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMNMlshp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMNMlshp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCF11F000E9;
	Mon, 10 Aug 2026 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786362696;
	bh=pcAc4IfEBzKPxTFDRduZGPESMIijrLsaySSE0kBOc58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RMNMlshpKLo0c3L7P9xrg8fWuJQeG7iQjEf1JGQpNynEypYIqFTxQgulAqb3b7uCg
	 CgThMWJMPF1dxr37zClvyoFV1G4AkOJsLBCHZO9LxNdsHt2NA+bdT0AgfjkvtRS55w
	 oVhYXTdbeoFKgibVu6UkARLDiozOG+kk/kOAydylv9svL/2udAMKZcssUa4/GWjW+P
	 iNcBRzzbGkpO4zEknm68bCTFtjUScmpZOylx+j+HycKxmuO7rYACOzD+/TJerUdIIi
	 U/neOLBL+tj1HuKWe2UujQdPEj1Gght+UO0eUZ++peOd3I6N+Fwxhac8mHpE+1Tva5
	 +/Azuq/PK5ndw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/10] phy: qcom-ipq806x-usb: add MSM8974 HS PHY support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260810-msm8974-usb3-v1-4-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-4-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:51:35 +0000
Message-Id: <20260810115136.4DCF11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The MSM8974 initialization sequence reuses the shared IPQ806x sequ=
ence instead of providing its own, directly contradicting the commit messag=
e and unconditionally overwriting the PHY_CTRL register.
- [High] Setting the active-low HSUSB_CLAMP_MPM_DPSE_DMSE_EN_N bit disables=
 the DP/DM MPM clamps, contradicting the commit message.
- [Low] Duplicate and redundant macro definitions for BIT(26) in the PHY_CT=
RL register.
--

--- Patch [4]: [PATCH 04/10] phy: qcom-ipq806x-usb: add MSM8974 HS PHY supp=
ort ---
commit 90246a8322244753151c5fb6777bd8d442742a72
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

phy: qcom-ipq806x-usb: add MSM8974 HS PHY support

This commit adds support for the MSM8974 DWC3 wrapper by introducing a new
compatible string and driver data. It claims to implement a dedicated init
sequence for MSM8974 to preserve reference frequency selection straps.

> Add the qcom,msm8974-usb-phy-hs compatible with its own init
> sequence: unlike the IPQ806x one, it must not overwrite the whole
> PHY_CTRL register, as the power-on values of the reference frequency
> selection straps have to be preserved. Only enable the UTMI clock and
> the DP/DM MPM clamps, signal VBUS valid towards the link, and disable
> retention.

> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qu=
alcomm/phy-qcom-ipq806x-usb.c
> --- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> @@ -17,6 +17,7 @@
>  #define HSUSB_PHY_CTRL_REG		(0x10)
> =20
>  /* PHY_CTRL_REG */
> +#define HSUSB_CLAMP_MPM_DPSE_DMSE_EN_N	BIT(26)
>  #define HSUSB_CTRL_DMSEHV_CLAMP		BIT(24)
>  #define HSUSB_CTRL_USB2_SUSPEND		BIT(23)
>  #define HSUSB_CTRL_UTMI_CLK_EN		BIT(21)
[ ... ]
> @@ -27,9 +28,13 @@
>  #define HSUSB_CTRL_ID_HV_CLAMP		BIT(9)
>  #define HSUSB_CTRL_OTGSESSVLD_CLAMP	BIT(8)
>  #define HSUSB_CTRL_CLAMP_EN		BIT(7)
> +#define HSUSB_CTRL_CLAMP_MPM_DPSE_DMSE	BIT(26)

[Severity: Low]
This isn't a bug, but does this bit need to be defined twice? It was just
defined as HSUSB_CLAMP_MPM_DPSE_DMSE_EN_N a few lines above.

[ ... ]
> @@ -273,7 +283,8 @@ static int qcom_ipq806x_usb_hs_phy_init(struct phy *p=
hy)
>  		HSUSB_CTRL_RETENABLEN  | HSUSB_CTRL_COMMONONN |
>  		HSUSB_CTRL_OTGSESSVLD_CLAMP | HSUSB_CTRL_ID_HV_CLAMP |
>  		HSUSB_CTRL_UTMI_OTG_VBUS_VALID | HSUSB_CTRL_UTMI_CLK_EN |
> -		HSUSB_CTRL_CLAMP_EN | 0x70;
> +		HSUSB_CTRL_CLAMP_EN | HSUSB_CLAMP_MPM_DPSE_DMSE_EN_N |

[Severity: High]
The commit message mentions we should "enable the DP/DM MPM clamps". Since
this bit has an _EN_N suffix, standardly indicating it is active-low, does
setting it to 1 here actually disable the clamps instead of enabling them?

> +		phy_dwc3->drvdata->fsel;
> =20
>  	/* use core clock if external reference is not present */
>  	if (!phy_dwc3->xo_clk)
> @@ -282,9 +293,14 @@ static int qcom_ipq806x_usb_hs_phy_init(struct phy *=
phy)
>  	writel(val, phy_dwc3->base + HSUSB_PHY_CTRL_REG);

[Severity: High]
The commit message states that the MSM8974 init sequence "must not
overwrite the whole PHY_CTRL register". Does unconditionally writing to
this register with writel() break the preservation of the power-on values
for the reference frequency selection straps?

[ ... ]
> @@ -458,6 +474,18 @@ static const struct phy_drvdata qcom_ipq806x_usb_hs_=
drvdata =3D {
>  		.owner		=3D THIS_MODULE,
>  	},
>  	.clk_rate =3D 60000000,
> +	.fsel =3D 0x70,
> +};
> +
> +static const struct phy_drvdata qcom_msm8974_usb_hs_drvdata =3D {
> +	.ops =3D {
> +		.init		=3D qcom_ipq806x_usb_hs_phy_init,

[Severity: High]
The commit message indicates that MSM8974 was intended to have "its own init
sequence", but here it is assigned the shared qcom_ipq806x_usb_hs_phy_init
function. Should this point to a dedicated initialization function for
MSM8974 to avoid the writel() register overwrite mentioned above?

> +		.exit		=3D qcom_ipq806x_usb_hs_phy_exit,
> +		.owner		=3D THIS_MODULE,
> +	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-msm8974-us=
b3-v1-0-1a47e1185524@oss.qualcomm.com?part=3D4
