Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB73C352F86
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 06:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786690155; cv=none; b=janZO3bJAtM/2c/iaPEp+VJ9zChrzDNrUhBSnXUGAGZB2HZUrVpQ9B4gO6zhzxwNrLVH63D6x+Dd9Sf4iwDWhCfqRnzkggZKCfgIT4RspmHGUyNJWS5yeX9VGPirTeflcBIIol0pDbw6hkOLLaqIw+Kt/ulDubificHnhLC8i1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786690155; c=relaxed/simple;
	bh=kmHRBGCddSMSfZBiFwUXVRJTNlCo/PoE4G5sBatSo38=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RRXdUExc0wFLxVZdw4yrWJlkRNux9Kol1UCLdV6qcSCNt030fLqHlnf2cPcFTFOLWZRi29dX+n0K2gh03iIvYwj2QXoWC+ooruUPnG2PeD/3RjpNPnykME91W1sGzUz86s09da9BqJr1Md1uDBepNJw8XWdEXtwLJzpr5ZeCw5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6myGO0v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6myGO0v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163721F000E9;
	Fri, 14 Aug 2026 06:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786690153;
	bh=pX0QRkpMl+k3cGxhQQb+Hcc/sTV7651aKREZ8PPhZpQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F6myGO0vid3/eoqklXyn8tAftg2ACJw49IwSh5Uyv+jl/ZKftd9XZSsf34MBplH/w
	 oXNY3QfaU1KlnznUOifkf+eiOjFJk6qh+gZLBl9+8uFllvXF0pat3rG4sygQfzpSaO
	 65ZVV4QmgS3oPPH+MEA2lZ2Bukncgz6n1MExxeGz3Gs1v71an4VKuuujzTLzLbgnoG
	 7NHrsQ6BP1x2J/zvHnRfETYUQbHqcgCpT/1K/AtDHZTOf8M+ugomXB1xOQHxcSWW/b
	 ++l7Ysjq7/zk7JAy0VCcJLwecPGiKQMEy0+5HoP17cAKsOHI5yf99fhNtv8j9eT4Jj
	 K2YZT6iGQDFvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 37/38] phy: rockchip: usbdp: Re-init PHY on mux
 change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-37-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-37-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 06:49:12 +0000
Message-Id: <20260814064913.163721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] rk_udphy_update_power_state() resets the PHY during Type-C mux cha=
nges without restoring active DP state, causing permanent loss of the DP li=
nk.
--

--- Patch [37]: [PATCH v14 37/38] phy: rockchip: usbdp: Re-init PHY on mux =
change ---
commit e0f454f6eb0c8216453e00dfe50cf7716c4aa60b
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init PHY on mux change

This commit updates the driver to re-initialize the PHY when the mode
changes by replacing a return 0 with a call to rk_udphy_update_power_state(=
).
This ensures the PHY is re-initialized when cable orientation changes or
when switching from DP-only to a mode with USB support.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1392,7 +1392,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_=
dev *mux,
> =20
>  	rk_udphy_set_typec_state(udphy, state->mode);
> =20
> -	return 0;
> +	return rk_udphy_update_power_state(udphy);

[Severity: High]
This is a pre-existing issue, but does forcing rk_udphy_update_power_state()
to run immediately on mux change cause an active DP link to drop permanentl=
y?

When the Type-C mux changes (such as plugging a USB device into a hub to
switch from DP-only to DP+USB), rk_udphy_update_power_state() triggers
rk_udphy_init() to reset the PHY.

rk_udphy_init() clears CMN_DP_LANE_EN_ALL, which physically disables the
active DP lanes. While the power state update restores the USB port status,
there appears to be no logic to re-enable the DP lanes via
rk_udphy_dp_lane_enable() or restore DP configurations.

Since subsequent link retraining via phy_configure() does not re-enable the
lanes, the DP link can permanently fail to train until a full DRM modeset
occurs, leaving the display black.

Additionally, does resetting the PHY mid-stream without a reset notification
sequence for DP (unlike the sequence used for USB) risk APB bus lockups
(SErrors) in the DP controller?

>  }
> =20
>  static void rk_udphy_typec_mux_unregister(void *data)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D37
