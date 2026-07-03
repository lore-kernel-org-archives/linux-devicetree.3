Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B74347BD9
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 23:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783122694; cv=none; b=mnZSMFS2j9FUA9PZC6+Dupp+FQzm4L17zYLhj8QlMrKNSH7ELVH+rRmiOgn5L5faKxYwj2DpGJom/sJ9/1Jgp3p91HHs2q7fOlC7W6agLUSXOypiME2pZpoGZ+Ugm2UedxUCFPqa16P4r/NDgA5Htmn1mjQ1sY3hMiGLFqXO73I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783122694; c=relaxed/simple;
	bh=lEJ+rW2uS8TqYig//Hbf/9A+xPzsiO0/w0QsRz++RFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nFIMq8wjeQrrDWTHdy+REwPpl1Xu0FxOsw2ekl8sRN9h8GGwM10iZiffQqNFDDpanyU8h6zD9enXxLncGhgLIFedrfIc3s7CEHC1j1PSr/4mxM9SgQmYkm8i6xTa30Eg9NG+cM23fI1naHU0kvk3P+TWE76K5ufnto1FycQ4spY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTATIyXZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTATIyXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A671F000E9;
	Fri,  3 Jul 2026 23:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783122692;
	bh=UPfEXxLHhA+P7h6eArkgTVJ6+sIdc4LAfYITKWYSX/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UTATIyXZuvn9LqERurVtfT5+2NgAB3GvV+yk8ADSon05vw/9S18+XpvMWNm7ARRBk
	 SJI1josmgr9F8ZHQmsOOf1tjIC3ZJUt14bdTm2Gps8CVfUWqRRXzxw62jL/q8S2pTA
	 PtCRLBd6Doj2EszjJ6fIBiX+pDZ5ERAtIEm0uPeyFzmo8xOqRJRt0j+kSUy8+kcG9p
	 SEwrL3WCb5tTG3a7wOdVpHI2DHollw2kjWLqnuygPJeFxmr4TgIw2cK0GdbixZgBAL
	 skjfrWUxAcR0TZn6fg3Bf3WCNCRA9gZCdDEFW/bZQqw1DQrMf7kfkGYpwRyjW6c1gP
	 KbrvXX1ZQCuZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 19/36] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-19-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
 <20260703-rockchip-usbdp-cleanup-v10-19-a392711ca8a9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 23:51:31 +0000
Message-Id: <20260703235132.15A671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch defers PHY hardware re-initialization during Type-C orie=
ntation changes by setting a `phy_needs_reinit` flag, assuming a subsequent=
 call to `rk_udphy_update_power_state()` will apply the change. However, fo=
r USB3-only connections, this subsequent call is often never made, resultin=
g in broken USB3 functionality.
--

commit af712ecc489de5c647a8e305c7beca4b1c6dd5cb
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init the PHY on orientation change

This patch updates the rockchip usbdp PHY driver to track orientation
changes by checking if the cable orientation is reversed. If the orientation
changes, it flags the PHY as needing re-initialization so that the lane=20
muxing can be reconfigured.

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
> +

[Severity: High]
Does this deferral of PHY initialization break USB3-only connections?

By only setting the phy_needs_reinit flag here, the actual hardware update
appears to be deferred until rk_udphy_update_power_state() is called to=20
consume it.

For USB3-only connections (especially on fixed-role ports or boards without=
 a
mode-switch property), is rk_udphy_update_power_state() guaranteed to be
called after this orientation change?=20

If it isn't called, it seems a reverse-plugged USB3 device might fail to
connect because the reverse lane routing is never written to the hardware.=
=20
Additionally, if a DisplayPort device (which does trigger a power state=20
update) is plugged in reverse and then replaced with a normal USB3 device,=
=20
could the software state reset to normal while the hardware remains stuck=20
in reverse?

> +	udphy->flip =3D flipped;
>  	rk_udphy_set_typec_default_mapping(udphy);
>  	rk_udphy_usb_bvalid_enable(udphy, true);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-rockchip-u=
sbdp-cleanup-v10-0-a392711ca8a9@collabora.com?part=3D19
