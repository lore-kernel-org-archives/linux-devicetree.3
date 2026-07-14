Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C0B423E8B
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059781; cv=none; b=SFgWP0MyBmM1iN87YEYVaHDiGrTb1z/SqERgO65qCxahjW2OdJZOVimez9+ohZm0y1ovtwmJnwLPlYUsk3pCUvPGj59QiS5jIS+woJMT9EZ2Z7ZSWJEp2W1NkuoDNOHHez6IlHIkyoCNPLAkLU8gHHJIzhHlcpon2OKw4nMF0V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059781; c=relaxed/simple;
	bh=Lk6/NzUSqSKhxGY+ppBbANU+Ev4gHYoMVj48/H4QyX8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pCQ0EsO1SNSFTz2FMl4/nmoBslsSnIBGW4UH1VhnKLC8RI4Jo4YijZPECsT2h05ejY7VMv2jyQcOhwgMtSlTpFq3Gvdgx6ugkpFLUB8M04RSf9TG4SN/gLA+XhlibC2jNZiJidra6IpVz/DeKnqcn/i7bvfjFGtyBRAMqCYc44A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nx03Wv/d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nx03Wv/d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B857F1F000E9;
	Tue, 14 Jul 2026 20:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784059780;
	bh=pxrjdEhQ20BdCU9qiayJEDZ+LSAkaqGbClsBBdZHk/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nx03Wv/dH0KAw6m9I1/bZqokrtC56pdV84qwpNrcIrsMOU+H0ktaYxefurhqH4G0m
	 fQZTcsiz/u1SkHY1cfknu+nCIKH3I3lZ/uGtmkLqdxHcN0kPyvhJ54qtdaoLzuGmtC
	 aBtjn1tKfVZXA9ZRtdC6H2UzVbAf1rjmiLQMlq6IYRHeFmxAOCmrFLyYZ7de0K9DNg
	 wNKN/6e1bZj6OJmf0YKV4unzS+/KgL0z1uAM2IGu5oGkVc+eQ3JApKo8xKodv0FiGq
	 oWP7OTK9gTHZ1uNx4kDBDcEbUUNo+wABteuQjPoV/BB1/yJcdFUIbUC8dUz5+cUExs
	 jTFPz0WuFou0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 19/35] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-19-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <20260714-rockchip-usbdp-cleanup-v13-19-6cb3e769d4c5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:09:39 +0000
Message-Id: <20260714200939.B857F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The USB3 port is not re-enabled in the system GRF when the PHY dyn=
amically transitions from DP-only to DP+USB mode, permanently breaking Supe=
rSpeed USB functionality.
--

--- Patch [19]: [PATCH v13 19/35] phy: rockchip: usbdp: Re-init the PHY on =
orientation change ---
commit dd525747df45e57b3edc64db460c26dd4373c3df
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init the PHY on orientation change

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index e44d19c9d1193..4b454798c4ed4 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -620,6 +620,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_=
dev *sw,
>  				 enum typec_orientation orien)
>  {
>  	struct rk_udphy *udphy =3D typec_switch_get_drvdata(sw);
> +	bool flipped =3D orien =3D=3D TYPEC_ORIENTATION_REVERSE;
> =20
>  	mutex_lock(&udphy->mutex);
> =20
> @@ -631,7 +632,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch=
_dev *sw,
>  		goto unlock_ret;
>  	}
> =20
> -	udphy->flip =3D orien =3D=3D TYPEC_ORIENTATION_REVERSE;
> +	if (udphy->flip !=3D flipped)
> +		udphy->phy_needs_reinit =3D true;

[Severity: High]
This is a pre-existing issue, but does setting phy_needs_reinit to true exp=
ose
a bug in rk_udphy_power_on() where the USB3 port is not re-enabled when
transitioning from DP-only to DP+USB mode?

If the Type-C connection dynamically transitions from DP-only (where the U3=
 port
is disabled via rk_udphy_u3_port_disable(udphy, true)) to DP+USB
(UDPHY_MODE_DP_USB), rk_udphy_power_on() takes this branch:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
    ...
	} else if (udphy->phy_needs_reinit) {
		if (udphy->mode =3D=3D UDPHY_MODE_DP)
			rk_udphy_u3_port_disable(udphy, true);

		ret =3D rk_udphy_init(udphy);
    ...
}

It explicitly disables the U3 port if the new mode is DP-only, but it
completely lacks the logic to re-enable the port
(rk_udphy_u3_port_disable(udphy, false)) if the mode includes USB.

Could this cause SuperSpeed USB traffic to fail because the U3 port remains
disabled in the usbgrf register?

> +
> +	udphy->flip =3D flipped;
>  	rk_udphy_set_typec_default_mapping(udphy);
>  	rk_udphy_usb_bvalid_enable(udphy, true);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-rockchip-u=
sbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com?part=3D19
