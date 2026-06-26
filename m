Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE92E19995E
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 21:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782508726; cv=none; b=mN2XLoDc6zsovQZQ40sWRY/rsq8u4ARAnp7MutkPjmxn7fL9xeZZ6pOfHgmCXmWPugZGdetlTBKw5jZqjg4jTIegibThwhKvblcvGXSanb9Boj9caCViwelA9UfNCJTOvj1/VNiX3FOeAJn2beW8lQMQCHObwEDhvncyZ0hEbFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782508726; c=relaxed/simple;
	bh=7qsi23xPPPgb3GCPYzKVCotbjRoQitja/bwrveBgw1U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GedafYjtLX05SJbCeQsaDo8M7TneXOeRRcbhcoog1oeB+Gb3skvHkbahVXB8hKOi0ztyklIUzeqYQrLEwW0V5FxOG0xmZh4qK+rKTyEjIijIBoeQL4xRYOC02IgmlmHXKin3ESUP1q9S2NZ1ZEtPUrTbrk7hTvaigiAuGX3+DRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9Acj8kI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9Acj8kI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182AD1F000E9;
	Fri, 26 Jun 2026 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782508725;
	bh=kJDWhwpIegHAhg50uijjwBHDJLTPo5vc4osFFAqo36E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G9Acj8kINyLKX5gQ/grqaH68ZQdbEScJHvXourk4J+0OvTKUb7zZ2lMWLNnVcb2SX
	 gDq1V5hkXbCRD0izCi8cZBbKPk8nn1TfoW1CYhojv6KAk7kcgGVionJSEJyttI+nij
	 zYDCad1E+UEWR5lFD1ATbp4S3KBwT31iBc+UEwucrqvsLjYiSzyekH6ghMXV5mJgnA
	 mq3qMXks9ZcLGHJzlUXuCyfPy4TEPTAtfkVOVjn4bzv94gtJZBeHoBu8UMvwHVizCY
	 ufyySeCMtHl64jW3XUJkJkF98w7a0mzpC6+o7GtBdytXOxoSWR6n+dijCVzferx11V
	 QYZPisp7D7Eow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 20/29] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-20-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
 <20260626-rockchip-usbdp-cleanup-v8-20-47f682987895@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 21:18:44 +0000
Message-Id: <20260626211845.182AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware lane muxing is never actively updated for USB-only device=
s upon replug or orientation change, breaking USB SuperSpeed in reverse ori=
entation on ports that do not power-cycle the PHY.
--

commit 52b656ef41c03fa9932c56f88505027225e05d96
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init the PHY on orientation change

This commit updates the driver to record cable orientation changes and set =
the
phy_needs_reinit flag. It aims to fix DP functionality breaking when the ca=
ble
is re-plugged with a swapped orientation.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 1bb22fc18c9f9..3d222768dc3c9 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -626,6 +626,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_=
dev *sw,
>  				 enum typec_orientation orien)
>  {
>  	struct rk_udphy *udphy =3D typec_switch_get_drvdata(sw);
> +	bool flipped =3D orien =3D=3D TYPEC_ORIENTATION_REVERSE;
> =20
>  	mutex_lock(&udphy->mutex);
> =20
> @@ -637,7 +638,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch=
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
This is a pre-existing issue, but does this actually flush the re-initializ=
ation
to the hardware if the USB PHY is already running?

When a user replugs a USB-only Type-C device in reverse orientation on a po=
rt
where the USB controller does not power-cycle the PHY on unplug, for exampl=
e in
host mode, rk_udphy_orien_sw_set() notes the orientation change and sets
udphy->phy_needs_reinit =3D true.

However, because the USB controller keeps the PHY powered on,
udphy->status & UDPHY_MODE_USB remains true.

When rk_udphy_typec_mux_set() is called later to handle the mux event, it
appears to skip actively re-initializing the PHY if the USB mode is already
active:

    if ((udphy->mode & UDPHY_MODE_USB) && !(udphy->status & UDPHY_MODE_USB)=
 &&
        udphy->usb_in_use && !udphy->hs)
        return rk_udphy_power_on(udphy, UDPHY_MODE_USB);

    return 0;

Could this leave the hardware stuck in the old orientation state and break =
USB
SuperSpeed, causing it to fall back to USB 2.0 upon reverse replug?

>  	rk_udphy_set_typec_default_mapping(udphy);
>  	rk_udphy_usb_bvalid_enable(udphy, true);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-rockchip-u=
sbdp-cleanup-v8-0-47f682987895@collabora.com?part=3D20
