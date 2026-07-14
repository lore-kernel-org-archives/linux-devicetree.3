Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C6E3E51EF
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784058553; cv=none; b=CLPxBCdqnDCFu+AH7W7RnGntrJVZhyZ8SBuqiOQCWIYXx3k+3Fvi9mjY862yoZs5qE4CzCBYVAQsEctU7kXKg9YAPH3UFwDbLXl8lmLgdFh3vx7pnXroHokiruFFhpkeCf0ncPXceeAKusp0Z7x3v4R+OQsMQDk8os73yzh3M/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784058553; c=relaxed/simple;
	bh=DlosG/yGAi3Qsr++l20kT9WjRGZmVMronMYzSCtweJs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vFX0r8StK9DMcmyRpZQ3gU9nLGvdivezkUeH+vG7EQJKrghq2ZM+HqqKWKeOdPqxUl/DN3RNuGQJ8Zf6ccJdA0PaC98hysnXZT2UE/hcgvJw+TUedDJ4Hukr1slHIJqCYw8B4GuOkAbBxccmdv9/Im4LJgYT6t4LaZhdbqEF+g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dd2jOJME; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dd2jOJME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E391F00A3A;
	Tue, 14 Jul 2026 19:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784058552;
	bh=gpmN7x6mHbDfc5aSZg5UyFbzOaVVRm2tcc+RLzcQ77U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dd2jOJMEj6gZ8LIfmMZdeH8Nfpu8dC/ZItw2srE6h73rtd4CIc9XaP4vLijdV752q
	 EtPvGRTX3+iH0xW4OTNjd8KT12Y3i6snbOUIYW8bZ7NEJT4vsmx8l8a5sIWGbD2OyJ
	 vwEDcJ/YuvXi6X8X+eUHa6wEQ13P+H3aeVCgWYCfv049ekh8m5YCv+kJC3uQs4IOP1
	 5aBDPMgBrOavgzeXgJEQ0zTXY48gQsgMd/0cgIRtXV7tdMmis37OfoOMlliJOy3mjK
	 gJJvNVtbI1GJbTKLssVNjZyeVTrqOwnTxa6P242ifWcT/OfiFwqdAhIARZQz0MT+jI
	 bKLAOkaDfZ+oQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 10/35] phy: rockchip: usbdp: Add missing mode_change
 update
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, olteanv@gmail.com, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-10-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <20260714-rockchip-usbdp-cleanup-v13-10-6cb3e769d4c5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 19:49:10 +0000
Message-Id: <20260714194911.E6E391F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Incomplete bug fix: rk_udphy_mode_set early return prevents PHY re=
-initialization on cable flip.

Pre-existing issues:
- [High] Exiting DisplayPort Alt Mode bypasses mode update, permanently bre=
aking USB 3.0.
--

--- Patch [10]: [PATCH v13 10/35] phy: rockchip: usbdp: Add missing mode_ch=
ange update ---
commit 2fda37a8a08c68a5b07d269f553cf22878463e2b
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Add missing mode_change update

This patch introduces a helper to update available modes and set the
mode_change flag for the Rockchip USBD PHY. This resolves missing
re-initialization of the PHY to ensure DisplayPort functions correctly.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 982315535caf7..7540c897dde13 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -617,6 +617,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_=
udphy *udphy, bool hpd)
>  	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigg=
er, hpd);
>  }
> =20
> +static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
> +{
> +	if (udphy->mode =3D=3D mode)
> +		return;

[Severity: High]
Does this early return prevent PHY re-initialization when the cable is
flipped?

If the user flips a Type-C cable while the USB controller keeps the PHY
powered on, rk_udphy_set_typec_default_mapping() is called and it updates
the software lane assignments. It then calls
rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB).

If the mode is already UDPHY_MODE_DP_USB, this helper returns early, leaving
mode_change set to false. Subsequent calls might then skip initializing the
PHY, causing the hardware lane routing to miss the new orientation.

> +
> +	udphy->mode_change =3D true;
> +	udphy->mode =3D mode;
> +}
> +
>  static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
>  {
>  	if (udphy->flip) {
[ ... ]
> @@ -1361,10 +1370,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux=
_dev *mux,
>  			usleep_range(750, 800);
>  			rk_udphy_dp_hpd_event_trigger(udphy, true);
>  		} else if (data->status & DP_STATUS_HPD_STATE) {
> -			if (udphy->mode !=3D mode) {
> -				udphy->mode =3D mode;
> -				udphy->mode_change =3D true;
> -			}
> +			rk_udphy_mode_set(udphy, mode);

[Severity: High]
This is a pre-existing issue, but does exiting DisplayPort Alt Mode
permanently break USB 3.0?

When the Type-C port exits Alt Mode (for example, the monitor goes to sleep
or is disconnected logically), the framework calls typec_mux_set with
state->mode =3D TYPEC_STATE_USB and state->alt =3D NULL.

This function calculates the mode correctly, but the update itself is inside
an if block:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_typec_mux_set() {
    ...
    if (state->alt && state->alt->svid =3D=3D USB_TYPEC_DP_SID) {
        ...
        } else if (data->status & DP_STATUS_HPD_STATE) {
            rk_udphy_mode_set(udphy, mode);
            rk_udphy_dp_hpd_event_trigger(udphy, true);
        ...
    }
    ...
}

Because state->alt is NULL, the update is skipped and udphy->mode remains
stuck in UDPHY_MODE_DP. Later, when the USB controller tries to initialize,
it checks !(udphy->mode & UDPHY_MODE_USB) and aborts, leaving USB broken
until the device is replugged.

>  			rk_udphy_dp_hpd_event_trigger(udphy, true);
>  		} else {
>  			rk_udphy_dp_hpd_event_trigger(udphy, false);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-rockchip-u=
sbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com?part=3D10
