Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28092367B8E
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812589; cv=none; b=s9xwwChy2yQCemUUf7FMoYckT7NP267F4FVoe8yeb/ux+jlk/yOg5WEWDs/YSXJ9/b2RSj0Iz8FBigr6DQflscma4uPLxvEijOCXeuAF+tmG8YzP4pVKtaFq9JNpB+qD7r2gxx4sj0mt3t82CsXABh3a2ntE7aejZ6PgeSLx9f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812589; c=relaxed/simple;
	bh=0A/4IuTBKUPfmXHYgVTCwq+ba99vzgmoCHdKwoP8JG8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XOWCVmpSL57XHNECkE2RCYmnQH4LXtP2mzXtkarB5bjvq/Lu1u//HOxT5viC7TlVNsBlUT7R2fTlxW5x3elWwVKPUtNrcsgpxVmgWMph3JUT4/2Ee9Tr7erWpyEyWKYn2VZuqBADevAe67ssHNs+evpZsFoB6RnQ1kfV8xQTaos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdBhCkqt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdBhCkqt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571BC1F0089B;
	Mon, 12 Oct 2026 13:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791812587;
	bh=HU8W7WyvQhr6+WPeL0/gx4fQymldhTyReuYTGv/aPN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XdBhCkqtSGb0JMR0LcYhaWbbRIwpLceLXs+GpbyJhFZflUgf2/lFwshzZsHeFlgJA
	 3nQuAKSmOt+F6NJaSTVFnwdML2KTYo4g2f8etbqB3Vpa2FBE1suWJaAXgasuR4qQ1f
	 c1GWQ24uo+qrWYa++bkmdi31OcgpDnzG8HnwuVAOsVs6Ov3/1RwfE/ktkyNkZsUqxt
	 9fWirxuQym+a4PZzyUdEGPD1gBDQkJrEBnIM5sUifbdBP4oBzA4gUbx8OqNFldlh5C
	 4rGLXnZDHxjRm1Pjsafp/bAPbeflk1rh0fROezPZ7pbBoA29iTRaeXo7J/pxnGg/dH
	 mVcY6PrMm7H6Q==
Message-ID: <sashiko-outbox-168203@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/13] phy: qcom: edp: Add Nord PHY configuration
 data tables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org
In-Reply-To: <20261012-nord-drv-dt-v2-12-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-12-a2ab9af954d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 13:43:06 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] build: unused static symbols break compilation under Werror
--

commit bc3d5c7d159a12dc8bac2f06bcc9089584cfa877
Author: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

phy: qcom: edp: Add Nord PHY configuration data tables

This commit adds Nord-specific AUX channel, VCO divider, LDO and TX
resistor calibration data. These tables are sourced from HPG Tables
2-1-a, 2-1-b and 2-1-d.

> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/p=
hy-qcom-edp.c
> index 3e857d1056680..cb5f6e0ae607b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1741,6 +1741,39 @@ static int qcom_edp_com_configure_pll_nord(const s=
truct qcom_edp *edp)
>  	return 0;
>  }
> =20
> +static const u8 edp_phy_aux_cfg_nord[DP_AUX_CFG_SIZE] =3D {
> +	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02,=
 0x04,
> +};
> +
> +static const u8 edp_phy_vco_div_cfg_nord[4] =3D {
> +	0x00, 0x00, 0x02, 0x01,
> +};

[Severity: Low]
Does this code introduce unused static variables?

These arrays, as well as tx_res_cfg_nord below, are defined as static but a=
re
not referenced anywhere in this commit. Defining unreferenced static arrays
triggers a -Wunused-const-variable compiler warning.

If the kernel is built with CONFIG_WERROR=3Dy, this warning is promoted to =
an
error and breaks the build. While a later patch in this series (commit
1393c79f29bd788a83ce23c45373ba39e69132d0) references these tables,
intermediate patches must compile cleanly to maintain git bisectability.

> +
> +static int qcom_edp_ldo_config_nord(const struct qcom_edp *edp)
> +{
> +	const struct phy_configure_opts_dp *dp_opts =3D &edp->dp_opts;
> +
> +	writel(0xd0, edp->tx0 + TXn_LDO_CONFIG);

[Severity: Low]
Does this code introduce an unused static function?

Similar to the static arrays above, qcom_edp_ldo_config_nord is defined as
static but never called in this commit. This triggers a -Wunused-function
warning, which will also break the build under CONFIG_WERROR=3Dy.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-nord-drv-d=
t-v2-0-a2ab9af954d2@oss.qualcomm.com?part=3D12
