Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1E9145B11
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060312; cv=none; b=JWmzcglqfr5o3MUkAS07pQs1kx47j6Nf27MiAuhkuRzyBoT5Zvekv/+rYShi50kL1fF2GeQVk85BNvvB7X2UpAMMnjw+xaJmWQsv6it55CCQ+o5GP5Gp4PS4LgI0tsjWaJEVtCnLB53ZbW5OcTyNYvuxlffPCRx8+ZtYAGaONL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060312; c=relaxed/simple;
	bh=6EVKqureO+7LMBTYiN08s9dFl+9YODN67gJ7lXm1FGs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a2OKYWeIRjKTKA31ZVhbbWKk6EUZBYUK1E0FyaElWVzE6T55V0j/L6IrarDGIVUas5WT6/EKO0NDc/D+GMfCaMPXXiX8UzaLhSUCKLgeim0wQv+RWcyVE0mwn/B0ulFqJJZGSQse92xHLO2SCoS+gLE/PUca/4gWWFggi1MExkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+Pna2mK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+Pna2mK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BD11F000E9;
	Tue, 14 Jul 2026 20:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784060311;
	bh=8hbwMHL0hv3QRuegcydzd3LFE/jUCard0s2EiWa2pME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R+Pna2mKrGLZM7Rnh4kMW6mYjK/FmQp2XfOC7SoVD2pRFE0ldAhW1HfCxwp86tVeM
	 vnDA6BjasG1mq3Zc9tw+R5nzVq9mCfp2X1ZNJ4PucpxWrf4c4WRdRaJuJoKNz4lWSl
	 1vs6dlN2gWBCZO8+mMtcHqTMFjLQRGmlP+VCvnUhriXp0TS3aSwfDwznQBbC+jU/2C
	 McOPCI2xGIqTeGnB7qm0fLsMWDFc+mMzmxaT3t2oA2FRcIAi7i4+VElDns9D4yNkrn
	 mwJHUwIHgIPHOl7uyFg0gibfeEInasU3iZ7phY3ITZmxsJyOGoFz/aHcE2vH4PUDBx
	 CklvUCpHl3/Jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 32/35] phy: rockchip: usbdp: Rename mode to hw_mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-32-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <20260714-rockchip-usbdp-cleanup-v13-32-6cb3e769d4c5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:18:30 +0000
Message-Id: <20260714201830.D7BD11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing explicit switch cases for TYPEC_STATE_SAFE and TYPEC_STATE=
_USB in rk_udphy_set_typec_state().
--

--- Patch [32]: [PATCH v13 32/35] phy: rockchip: usbdp: Rename mode to hw_m=
ode ---
commit 10965afd6a33e65f3dd20fa9afe790f44181de1b
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Rename mode to hw_mode

This commit renames the mode field to hw_mode in the rk_udphy struct. This
change clarifies that the field represents the modes currently supported by=
 the
hardware, which are set by the USB-C state machine or device-tree routing,
rather than software-requested modes.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index a6fe634574bbc..405b3d9436023 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -616,12 +616,12 @@ static void rk_udphy_set_typec_state(struct rk_udph=
y *udphy, unsigned long state
>  			udphy->lane_mux_sel[2] =3D PHY_LANE_MUX_DP;
>  			udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_DP;
>  		}
> -		mode =3D UDPHY_MODE_DP_USB;
> +		hw_mode =3D UDPHY_MODE_DP_USB;

[Severity: High]
Is it possible the default branch in this switch statement improperly catch=
es
TYPEC_STATE_SAFE and TYPEC_STATE_USB?

If the Type-C framework sets the state to TYPEC_STATE_SAFE (0) or
TYPEC_STATE_USB (1), rk_udphy_is_supported_mode() (as introduced in commit
"phy: rockchip: usbdp: Properly handle TYPEC_STATE_SAFE and TYPEC_STATE_USB=
")
explicitly allows these modes and passes them to rk_udphy_set_typec_state().

However, the switch statement appears to lack explicit cases for them:

	case TYPEC_DP_STATE_D:
	default:
		if (udphy->flip) {
		...

These states would fall into the default branch here and incorrectly config=
ure
hw_mode =3D UDPHY_MODE_DP_USB and udphy->dp_lanes =3D 2, instead of pure US=
B mode.

Could this regression leave the DisplayPort hardware blocks powered on and
incorrectly muxed when DP AltMode is exited or the cable is disconnected?

>  		udphy->dp_lanes =3D 2;
>  		break;
>  	}
> =20
> -	rk_udphy_mode_set(udphy, mode);
> +	rk_udphy_mode_set(udphy, hw_mode);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-rockchip-u=
sbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com?part=3D32
