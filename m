Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE2835E944
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 03:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786679876; cv=none; b=uZZsjy7P14KBQI1nW3Rz2/NdmOeqJBYkdTPue+nfSmEyJNjpCTZzLvjurp2MV6Ka6KZqBDlWBo1/N9HKTy1qceF3RJLkeALlWdcipcITLtG0++hGkphOkcrKPYk3Ujd8auBRHAU69o14oWe308ddmULKrsn0axdbZjjkSbAYqI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786679876; c=relaxed/simple;
	bh=XUdOIJVwFmqATchMnmkNPs/TRAozTpopVr5H9ZiMTas=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t9X1vtfN5NeN9S2D+vtBA5sG87xZnKOPSofo9ZGhnL97lJtaR04zoaUmCjlcqhVW4lHBmi6LSfK+2EG2H1+ePxmOXI8mb5d1b1pmw8qURAC4NWj9Z60lRP2KPHVvCeIthYcKRjlFFaYskIwj5OZK8HR8l//Z/h8kGotv94bWc+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYWu9VBh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYWu9VBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9F91F000E9;
	Fri, 14 Aug 2026 03:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786679875;
	bh=6ON5mIt7Is6oZwpsbZ6ExbGPRA+cK+XyojDc4+eYXXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nYWu9VBhUPnMF84np4azvhqPstk9/3p9sOcsq/BuBRmGoCZAdWJeINtf+kNyTDMHI
	 Q3sSxexrUxGCIZS7eKjKTeuM30aWqJBVFphZkSYHhAwVNZAn7KYrhWWb8D+EnUctEE
	 ZJLPu9dLcOSNA6F29v5EaBgjUn7D1qzk5L88MBdSeSaCajnW3bIEsgJo2/LCmSM19F
	 cMioH2xgVwcLXOpF6PrC84/oRIyEIUaF+KaR5CI4yiJ984FRsV4KoZlP2FmfZSiJ2N
	 ctPu6pZAkIGMOBBJ32a/sFA4FD3WH5xWG5KyQGrC7IuskYKV5d/0zjrGP6mvOMj2hX
	 UirNYTDY5YPpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 19/38] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-19-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-19-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 03:57:48 +0000
Message-Id: <20260814035752.9B9F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing hardware re-initialization for active USB connections upon=
 orientation swap.
- [High] Data race in `rk_udphy_dp_phy_configure` due to missing `udphy->mu=
tex` acquisition.
--

--- Patch [19]: [PATCH v14 19/38] phy: rockchip: usbdp: Re-init the PHY on =
orientation change ---
commit c57df7f56eefba79468e8b70c0ccc01c090e116d
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init the PHY on orientation change

This commit addresses DisplayPort functionality breaking upon cable
re-plugging with swapped orientation. It tracks the orientation flip and
sets a flag to trigger PHY re-initialization.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index e44d19c9d1193..4b454798c4ed4 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -631,7 +632,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch=
_dev *sw,
>  		goto unlock_ret;
>  	}
> =20
> -	udphy->flip =3D orien =3D=3D TYPEC_ORIENTATION_REVERSE;
> +	if (udphy->flip !=3D flipped)
> +		udphy->phy_needs_reinit =3D true;

[Severity: High]
This is a pre-existing issue, but does setting this flag actually
re-initialize the hardware synchronously if the USB PHY is already active?

If a pure USB 3.0 Type-C device is plugged in a flipped orientation, the
Type-C subsystem calls rk_udphy_orien_sw_set() which defers the state via
phy_needs_reinit.

Since USB controllers like DWC3 do not typically power-cycle the PHY on
orientation changes, won't the hardware remain in the previous orientation,
causing SuperSpeed USB connections to silently fail and fall back to USB 2.=
0?

> +
> +	udphy->flip =3D flipped;
>  	rk_udphy_set_typec_default_mapping(udphy);
>  	rk_udphy_usb_bvalid_enable(udphy, true);
> =20

Additionally, while reviewing this file, I noticed another pre-existing
issue regarding concurrency:

[Severity: High]
This isn't a bug introduced by this patch, but does
rk_udphy_dp_phy_configure() race with Type-C events?

The DP controller driver calls phy_configure() which executes
rk_udphy_dp_phy_configure() holding only the generic phy->mutex:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
        struct rk_udphy *udphy =3D phy_get_drvdata(phy);
        ...
}

Concurrently, Type-C events like unplug or orientation swap trigger
rk_udphy_orien_sw_set() or rk_udphy_typec_mux_set(), which modify shared
state (udphy->dp_lane_sel, udphy->lane_mux_sel, and udphy->dp_lanes) while
holding udphy->mutex.

Because rk_udphy_dp_phy_configure() accesses and writes to this shared
hardware state without acquiring udphy->mutex, can the DisplayPort PHY be
programmed with inconsistent lane assignments if a Type-C unplug or
orientation event occurs during DisplayPort link training?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D19
