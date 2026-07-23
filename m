Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EDB470EAB
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772705; cv=none; b=TY3mwoncwo2un0Prv3FsfH/H+NuaVtItewLKz6UfWnK2MgimcrIlbpeZsLR1eiVSw6rbz/HFz491fzgWxBagVE2zoj/XUjpTYLgq9NuCMBMErlYBMT3Zy9P83VPdHKYIA+22A676L3aAbp5IqrzQ0/mhjd1ty9xZTEXW6m8s0+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772705; c=relaxed/simple;
	bh=FDh4iyelWF54aZqoGD1pfYqWx2ufT93RNiarRA07IGc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OlEM1f8IFn15gqgoxbzGa3l2dNILLRk3e5TvGRkh0d+lz6WiLzxrEd6TFrdRHQKPXZK1/l4c1L2HZ8c1EvINsoLQu8O/b+FkCb+I2WP/5TKB4EcqDxomOAJWYo9VG5NkF475og/9FwqnFO+B5tgrAuB0LS3qjxpMk+NMoQ+1O1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdTcvSwo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdTcvSwo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7401F00A3A;
	Thu, 23 Jul 2026 02:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784772704;
	bh=H4511Nvs/uentpgewY8YJ4DdEM2VZy4+YdTkGDt8pIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WdTcvSwo75hZPYtRHQkOevVN5JVX068/PMACpjkG+28L/OvZXhMYAWlEcQbgU7ECE
	 z1+XBTdppu1cLmkLR2U2Tmc/+ckUdR7ovumLZHit+0x4Cr5rMA4grkrAG6Fh0VpPtt
	 CLf2jTupTEOk5GvNyp9ZYDsL31MjL9/GEj2lbuEnh9gFi0X6RnVKEm4ZI7QejbQmea
	 bCUTTwLyj3o2BdTMopD8a3IRwu6FxD9ndLA7sUgSZMofIHRnlPjqXkFQL/cFM67yUi
	 5qK2btfFP6DNa/foQPJn38Ndsbc3qlmci2gLKBadcHH+G4bj0G3mxXwPqoCyP7j6gz
	 s97IDHf1nzqDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] phy: qcom: qmp-combo: Add SM8475 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-sm8475-bup-usbss-v3-2-0dd5da218ab2@proton.me>
References: <20260722-sm8475-bup-usbss-v3-0-0dd5da218ab2@proton.me>
 <20260722-sm8475-bup-usbss-v3-2-0dd5da218ab2@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:11:43 +0000
Message-Id: <20260723021143.8B7401F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `sm8475_usb3dpphy_cfg` structure is missing the `.calibrate_=
dp_phy` callback assignment, which is required for robust DisplayPort link =
training.
--

--- Patch [2]: [PATCH v3 2/2] phy: qcom: qmp-combo: Add SM8475 support ---
commit d1b4bfb2d91dc0cdfa3d2edd1cdd59ff8122136f
Author: Esteban Urrutia <esteuwu@proton.me>

phy: qcom: qmp-combo: Add SM8475 support

This commit adds USB/DP combo PHY support for the SM8475 SoC, introducing
specific RX and PCS USB tables while reusing existing serdes, TX, and PCS
tables. It also adds v1 PLL structures to address link training issues caus=
ed
by reference clock differences on 4nm-v1 PLLs.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index cdcfad2e86b1d..52b07de2c52b5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c

[ ... ]

> @@ -2845,6 +2965,51 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_c=
fg =3D {
>  	.has_pwrdn_delay	=3D true,
>  };
> =20
> +static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg =3D {
> +	.offsets		=3D &qmp_combo_offsets_v3,

[ ... ]

> +	.dp_aux_init		=3D qmp_v4_dp_aux_init,
> +	.configure_dp_tx	=3D qmp_v4_configure_dp_tx,
> +	.configure_dp_clocks	=3D qmp_v3_configure_dp_clocks,
> +	.configure_dp_phy	=3D qmp_v4_configure_dp_phy,
> +
> +	.regs			=3D qmp_v6_usb3phy_regs_layout,

[Severity: Medium]
Is the .calibrate_dp_phy callback missing here?

Other v6 DP PHY configurations (like sm8550 and sar2130p) assign this to
qmp_v4_calibrate_dp_phy. Without the calibration callback, calls to
phy_calibrate() from the DRM driver return 0 without actually adjusting the
DP AUX tuning parameters (QSERDES_DP_PHY_AUX_CFG1).

Can this cause DP Alt Mode link training to fail on stricter sink devices or
with marginal cables that require alternative AUX calibration values?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-sm8475-bup=
-usbss-v3-0-0dd5da218ab2@proton.me?part=3D2
