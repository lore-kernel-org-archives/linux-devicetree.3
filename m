Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3AF376A03
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554177; cv=none; b=jN0KMuDnlmbnU5NQJtObOdTdrfZZlY9LNebJ0fEKIorPsTfXqKcAgh/FAQ9pfayaBJtLqSfeyJzFWgZkUL0UxB5R+9xW4GjqbioazzScrNJLXo3+eXFuVs8fIH5sxTb6F3s7tnorcoNkazFZPh13rNCWu/Mdt16sAETXruCGIII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554177; c=relaxed/simple;
	bh=ebm17HKiRs1oW5vkDPVe3fOyMG3TKlDeiCNiC0C7gPs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rR4QnPenSbZPHBBDboe/zih3qRPo+Sa9hCTxjTEoDBF3Ehi+JwuicpbZIwu/Va7OOHVX5FEPoZdML3fFfokruZjtZs3sWnfbJ3Jc0n1b1q8AvPrnWH/LGkFIOK+e/7Ow/dLlcNcEfZw6SwOvch/PrllZ72YYZyXdlV2Du/RaDHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7S4O1Mq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7S4O1Mq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D09C1F000E9;
	Mon, 24 Aug 2026 06:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787554173;
	bh=WVKofbwypdLcAjHSIsUQmDzMjf1JfxhteZlvTO5ckXQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q7S4O1MqOE2c3KZBegGkgPKIlcoxPbqI2akNF8Yfv/U2tP+0wZkllvrV+QTZ/wBH0
	 CIeJ6OflvGPUGho2WUkVobOVZlNNoN+dBsUgOYBaZrbzkcC6d21gZ3ybB41vTSuRcn
	 izDCpZkyMHDBIHjSt5HhSxxo+xKPQLDj3f+dgwITCKOdzIez+HbBLK1EAaYioU6c/C
	 ebHn/1Z28jGQdn3sSarypPNpDUXuxCSx+cHLEoP2VlnBTWMuCl77rmfj4x3QD47L7S
	 vrR4Fv8d42xiCrgOzfN/2N/XCHXUpXKxZMsOfjCEyps/Z/yJYTogtGywC6KuGOHFag
	 U+IRoXf0KHvaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] phy: qcom: snps-femto-v2: Move PHY init registers
 to config tables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: vkoul@kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-phy-v1-4-257d68a3210b@oss.qualcomm.com>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
 <20260824-phy-v1-4-257d68a3210b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 06:49:32 +0000
Message-Id: <20260824064933.2D09C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The mask and value arguments for the `USB2_PHY_USB_PHY_REFCLK_CTRL=
` register write are swapped in the `hs_5nm_phy_pre` configuration table.
- [High] The `USB2_AUTO_RESUME` bit is never cleared in `qcom_snps_hsphy_su=
spend()` due to an incorrect mask of 0.
--

--- Patch [4]: [PATCH 4/5] phy: qcom: snps-femto-v2: Move PHY init register=
s to config tables ---
commit 5e719820e4a23178ca8190ffc88ff2f741947939
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

phy: qcom: snps-femto-v2: Move PHY init registers to config tables

This commit refactors the SNPS Femto v2 PHY driver to use per-compatible
configuration tables for fixed pre- and post-override register sequences.
This allows the driver to share the common sequence while adding SoC-specif=
ic
sequences for future platforms.

> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/=
qualcomm/phy-qcom-snps-femto-v2.c
> index eb0b0f61d98e0..a34027b215f9b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
[ ... ]
> @@ -383,13 +395,42 @@ static const struct override_param_map sc7280_snps_=
7nm_phy[] =3D {
>  	{},
>  };
> =20
> +static const struct phy_reg_config hs_5nm_phy_pre[] =3D {
> +	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, UTMI_PHY_CMN_CT=
RL_OVERRIDE_EN },
> +	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, POR },
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, 0 },
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, PLLBTUNE, PLLBTUNE },
> +	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK },

[Severity: High]
This is a pre-existing issue, but are the mask and value arguments swapped
here?

The phy_reg_config structure expects the order { offset, mask, val }. By
passing REFCLK_SEL_DEFAULT as the mask and REFCLK_SEL_MASK as the value,
qcom_snps_hsphy_write_mask() will evaluate:

    reg &=3D ~REFCLK_SEL_DEFAULT;
    reg |=3D REFCLK_SEL_MASK & REFCLK_SEL_DEFAULT;

Because REFCLK_SEL_DEFAULT is 0x2 and REFCLK_SEL_MASK is 0x3, bit 0 is excl=
uded
from the mask and remains unchanged. If bit 0 was set by the bootloader, the
final register value incorrectly becomes 0x3 instead of 0x2, selecting the
wrong reference clock.

(Notice that in another patch of this series, hs_6nm_phy_pre correctly uses
REFCLK_SEL_MASK as the mask, but hs_5nm_phy_pre was not corrected here.)

> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, VBUSVLDEXTSEL0, VBUSVLDEXTSEL0 =
},
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL1, VBUSVLDEXT0, VBUSVLDEXT0 },
> +	{ UINT_MAX, 0, 0 },
> +};

[ ... ]

While looking at how qcom_snps_hsphy_write_mask() is used in the driver, I
noticed another pre-existing issue in qcom_snps_hsphy_suspend(), which is n=
ot
modified by this patch:

[Severity: High]
This isn't a bug introduced by this patch, but does qcom_snps_hsphy_suspend=
()
fail to clear the USB2_AUTO_RESUME bit?

drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:qcom_snps_hsphy_suspend() {
    ...
    qcom_snps_hsphy_write_mask(hsphy->base,
                               USB2_PHY_USB_PHY_HS_PHY_CTRL2,
                               0, USB2_AUTO_RESUME);
    ...
}

By passing 0 as the mask, qcom_snps_hsphy_write_mask() will do:

    reg &=3D ~0;
    reg |=3D USB2_AUTO_RESUME & 0;

This leaves the register entirely unaffected, and the auto-resume bit is
left set indefinitely instead of being cleared.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-phy-v1-0-2=
57d68a3210b@oss.qualcomm.com?part=3D4
