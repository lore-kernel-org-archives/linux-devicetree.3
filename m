Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931D937BE64
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624761; cv=none; b=O1+QMmibMtAac/72zvNZ8cuCxUcQtmzqB+f7YOUpCGUoiYsPlNgJE6wSa5DpiRnHtqB9GZDtEgSvaRVIgVvn9NjVGX7itTmcl31DjGqapVGtdx9A1vBGxte92Z+1UgL95BnF6IdMyXsr14oKx8NqqC0a2UlcFoGag6GMang/JwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624761; c=relaxed/simple;
	bh=zO6rs79kLeS1uVczs2Y0CQzGlQABuYiGvs7UHK9weC0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I9JC0oZhHvuTyjsdCf+TJBZvvoQDYeeEhczrrtOy63+mXlLkhXSclnPWxP2fSKsIARWnhNHVzrTSv4GayAKEPyrwuxNEJM/YkXU7+tXWaOJp/Ar7Ju+es2qEBmgkTold1wam/0lgAaWw3wo+ZfUdHu9ieJmF8OJ36dfloOMNhoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQ++RArF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQ++RArF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94AE1F000E9;
	Thu,  9 Jul 2026 19:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783624760;
	bh=HIiUoS3LI7eqCsR4iLN3iH1cPlsSNqFsiPN9R/mx4VI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BQ++RArFOU1cdzMQn5Wv6CoksJi0Yn7D6E/KEWk1Uxlv2EWZPms38xW35u+/Of5UW
	 OoNhbWeIosMWavwmLKaXll6HghaRBL6+jLoAtuKVdoP9cGsH3o2QAm5KuUhugNymjN
	 0j5HpraqO4HShwtQXWKwy9Akoz/2kq8vRn+p393b8A+DIz65KWYNMWoJLC+7LRAjN7
	 HJhuTprF2ThhOQMro1PhH5U/ISp7HWniMPZLpkhjtG2MLJBaDfdsoQmw0zb7WbajqC
	 hN7yvNFpWnNYb5mhZjYQiz2QgUE0sow4RZVZoBPza/TbpXN9OIgeU2fauSs+Ycobf7
	 FQ6KXQGtI7x3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 08/36] phy: rockchip: usbdp: Amend SSC modulation
 deviation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-8-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
 <20260709-rockchip-usbdp-cleanup-v11-8-a149ac60f76c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 19:19:19 +0000
Message-Id: <20260709191919.B94AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to update `udphy->mode` when exiting DisplayPort =
Alt Mode, leaving the PHY in a broken state for USB3.
- [High] The DisplayPort configure callback allows requesting more lanes th=
an available, which corrupts the configuration of active USB lanes.
--

--- Patch [8]: [PATCH v11 08/36] phy: rockchip: usbdp: Amend SSC modulation=
 deviation ---
commit 721fb4287b2e4de65248e4437ba81583781df56f
Author: Frank Wang <frank.wang@rock-chips.com>

phy: rockchip: usbdp: Amend SSC modulation deviation

This commit moves the SSC modulation deviation into the private config of
the clock for the 24M and 26M configurations.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index e3f5a26c876a5..cb6acadfbccfb 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -350,7 +350,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_=
cfg[] =3D {
>  	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
>  	{0x1a44, 0xd0}, {0x1a48, 0x01},
>  	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
> -	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
> +	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
> +	{0x00d4, 0x30}
>  };

[ ... ]

[Severity: High]
This is a pre-existing issue, but I noticed that the driver might fail to
update udphy->mode when exiting DisplayPort Alt Mode.

In rk_udphy_typec_mux_set():

	if (state->alt && state->alt->svid =3D=3D USB_TYPEC_DP_SID) {
		struct typec_displayport_data *data =3D state->data;

When the Type-C mux state changes to TYPEC_STATE_USB or TYPEC_STATE_SAFE,
state->alt is set to NULL. This causes the block above to be skipped,
bypassing the assignment of udphy->mode and udphy->mode_change.

Could this leave udphy->mode stuck in UDPHY_MODE_DP and prevent the USB3
port from being re-enabled?

[Severity: High]
This is a pre-existing issue, but does the DisplayPort configure callback
allow requesting more lanes than available?

In rk_udphy_dp_phy_verify_lanes():

		/* valid lane count. */
		udphy->lanes =3D dp->lanes;

The requested lane count is accepted and saved without validating it against
the actual number of available DP lanes.=20

If the DP controller requests 4 lanes while the PHY is in 2-lane DP + USB
mode, udphy->lanes is inappropriately set to 4.

Later in rk_udphy_dp_phy_configure():

			rk_udphy_dp_set_voltage(udphy, udphy->bw, dp->voltage[i],
					dp->pre[i], lane);

This out-of-bounds lane configuration is applied in a loop.

Could this corrupt the analog state of lanes that are actively being used by
the USB3 controller?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-rockchip-u=
sbdp-cleanup-v11-0-a149ac60f76c@collabora.com?part=3D8
