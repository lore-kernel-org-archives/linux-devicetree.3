Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D861304972
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 18:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782410958; cv=none; b=ItdotGS+1tzRQtOWkMfbaADrtBd/KXc9GraV3HZYrHakFPSWJoSLPaX9M5k/SvrcWB9RSpuUpl3HzyQccS7kCiHVsbZh1BBnreKEEBxmSoyhNqqY+RF+Xk8LHctXoqNbHdpxR0c9zB/cv4Iu48F+4/+oG2Sv5DezmzMFBdd9GdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782410958; c=relaxed/simple;
	bh=fB5m7/zUBNT8/czaCuLH0Jji44I1TW+UjyYZ8xvfkas=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kRBTTACW+qpFn2lBH8HmwWg9NyQKY9jfDVpO37ZZDYl7OCMB94Mmw4IlaObmrYk5U3g5SH+1dL6DXj7M01rSOuDlYTR2hqD3XFjUPSPhS3ji9iQZIq78F9zxiCzgyOlHmClD/1SyAz0lPzjgbVcp4WJ4bkt+hk0R5MoSf/WixB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNg1WJC7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNg1WJC7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024651F00A3A;
	Thu, 25 Jun 2026 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782410957;
	bh=z7AqSzxt+g9e3qTlqyT0n5Wyzzm1hya7KV6dbGrs9Yc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GNg1WJC7WzUlDUyNSEVLSKhC6D5Fx9z9c16vg36T9AI1luVU5EVOX3bsWMntXZYPc
	 lhoU+3l3iCTVCxln7AsjoikVk5dAeQfcLC4Banrp8ow4B+eXGK/b42LfgPMLEeBsam
	 DMMF5GoP+NESRxbUXmax823+V8fX6qN44mkEEbTKkxrSIHLaZMt2XgnrBd8hRBp0MN
	 3lT8QLGgtYwSWP3R2NLFB9oxTH6WuW6NcTeoDkjQcHAfZ5W3004bTAEgMNqj9N8fEL
	 pbNN0L1+FdjlqlCVKxuMhgndIYPmelWLRX88txHAHCHIlOdEfvhJE//vu19Tm/5HEZ
	 2cLCr7zqNXQrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 20/27] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-20-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
 <20260625-rockchip-usbdp-cleanup-v7-20-38eb3cf654fd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 18:09:15 +0000
Message-Id: <20260625180916.024651F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch attempts to fix PHY lane muxing on cable orientation cha=
nges by setting `phy_needs_reinit =3D true`, but this fails to re-initializ=
e the PHY for USB3-only connections, leaving USB3 broken on reverse orienta=
tion plugs or flips.
--

commit d1dadcaee0ea260b3047754297edae7462107b62
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
phy: rockchip: usbdp: Re-init the PHY on orientation change

This commit changes the cable orientation logic to reconfigure lane muxing
and sets a flag to re-initialize the PHY if the cable is re-plugged with a
swapped orientation.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index b08f0c142b0d2..3fa97a8c2555a 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -636,7 +637,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch=
_dev *sw,
>  		goto unlock_ret;
>  	}
> =20
> -	udphy->flip =3D orien =3D=3D TYPEC_ORIENTATION_REVERSE;
> +	if (udphy->flip !=3D flipped)
> +		udphy->phy_needs_reinit =3D true;
> +
> +	udphy->flip =3D flipped;

[Severity: High]
Does setting phy_needs_reinit here actually trigger a re-initialization for
USB3-only connections?

When the Type-C controller detects a cable orientation change, it calls
rk_udphy_orien_sw_set(). The driver updates udphy->flip and defers hardware
re-initialization until rk_udphy_power_on() is called.

However, for USB3-only connections, DWC3 does not cycle phy_init() or
phy_power_on() on a simple replug since the PHY remains powered. This means
rk_udphy_power_on() is never invoked and the PHY is never re-initialized wi=
th
the new lane muxing, which could cause USB 3.0 link training to fail when a
cable is flipped.

A later patch in the series (phy: rockchip: usbdp: Properly handle
TYPEC_STATE_SAFE and TYPEC_STATE_USB) attempts to address Type-C state
changes, but its logic appears to abort for both TYPEC_STATE_USB and modal
states. Even if corrected, its transition check would be false for a simple
cable flip that remains in USB mode, meaning this issue would persist.

>  	rk_udphy_set_typec_default_mapping(udphy);
>  	rk_udphy_usb_bvalid_enable(udphy, true);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-rockchip-u=
sbdp-cleanup-v7-0-38eb3cf654fd@collabora.com?part=3D20
