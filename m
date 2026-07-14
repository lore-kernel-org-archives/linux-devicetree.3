Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A9D3C8717
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784061571; cv=none; b=Q0oS8HnsKxSnaxOZ/bsjVh7kYfiqF0L2ldEWk00EPkT3yOkJUZcoRsoNxNpPecBYRfuE/WmoG7S8VrV9epJW8DP3rPFTpqgj44GyjmBOSvhkmabLTs3QseXhybCGR6v3ITFqqPBVDeDh3HhwwTmT9CaxpQvLWSUetWKSiwSy34k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784061571; c=relaxed/simple;
	bh=CJq9th8fCOu7Xs8KDMR+eNqWqtgN+pr5jXFlYUeoOR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BYUOSrTOzsZA8ZxBmNdXOnWLNrLu1M0/Qrf8AgBCtWzXWcunQJ4u6H9Bg/UQcM46+jH1DJqrhN12hauzXYPCF5BhreqzE9SCL6MZhbPckk+CE8J+Wm9wEy1yQR4noe1nt15eFNQsS4UfGmJwOrk2Vn3GSlkZJw4SanhNGlHOx4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsVQMpei; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsVQMpei"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA671F00A3A;
	Tue, 14 Jul 2026 20:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784061569;
	bh=pCp0jhOxizLfOHyjrRbKssw2hFbEiYsRp70qyWKbs0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AsVQMpeiUvM8Dlfkn9c25Wja7u4V6VBYE0xRDe+ZW9EkR5jjF7ijw6pEEhZ6ipW77
	 B0ev5agyODZdtzBGlpzJHzWPsfE1QYxlPyYmft1YFzPFNOeYMbRsrDp05J/B7uKCXs
	 kdPKFNNZJ7jyv2CyeuAV9RFfpnMe8fHB9GaalnEHwbMDQpxsUc+M+KU4MN3ZQIa9g3
	 MQMHmZN7mzu4W+/qkA0XvtpuHxea/+DmFz3pqmYFwOu8SZiuQEHGXBnvrVyxECUP8u
	 2qQxnkLapbi4HJ7apaJePmupgU73sZmemlctpNtOKkt0QQ7j1iT/u/1EB73x9C24IT
	 hRaG5fpUOIIfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 34/35] phy: rockchip: usbdp: Re-init PHY on mux
 change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-34-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <20260714-rockchip-usbdp-cleanup-v13-34-6cb3e769d4c5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:39:28 +0000
Message-Id: <20260714203929.0DA671F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Forcing a PHY re-initialization during a dynamic mode switch perma=
nently disables the DP lanes and leaves stale lane routing, breaking the DP=
 link.
--

--- Patch [34]: [PATCH v13 34/35] phy: rockchip: usbdp: Re-init PHY on mux =
change ---
commit 81cf1b50e4dbd6c92b948c08ec8401f3568e9429
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init PHY on mux change

Ensure that the right part of the PHY are powered up when the mode changes.
This ensures the PHY is re-initialized during cable orientation changes or
switching from DP-only into a mode with USB support.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index e597cdfe8d790..87d6df6821760 100644
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
When a dynamic mode switch happens (such as connecting a USB 3 device to an
active Type-C DP dock), rk_udphy_update_power_state() will call
rk_udphy_init():

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_update_power_state() {
	...
	} else {
		/* Mode change =3D> re-init */
		ret =3D rk_udphy_init(udphy);
	...
}

rk_udphy_init() then explicitly clears CMN_DP_LANE_EN_ALL, physically disab=
ling
the DP lanes:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_init() {
	...
	regmap_update_bits(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET,
			   CMN_DP_LANE_MUX_ALL | CMN_DP_LANE_EN_ALL,
			   ...
			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
	...
}

Since rk_udphy_update_power_state() does not restore the lane configuration=
 and
the DRM driver does not call phy_power_on() again (it only retrains the link
via phy_configure()), does this permanently disable the DP lanes and break =
the
DP link during a mode switch?

>  }
> =20
>  static void rk_udphy_typec_mux_unregister(void *data)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-rockchip-u=
sbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com?part=3D34
