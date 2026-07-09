Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632FE3BBFD3
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625581; cv=none; b=Vph1hXn5vydhDhKc+mDkBAuN2HrW/e5UQap7ecRT4UcS3s6D5HvtEDAGkzl8S/cgVE8SB5Xgmf6ZUTM0Gyv/FuC1IJM7DID2t29skY4Am9A/ql6wsdRTnhoSW04gPeXrfti0DWeOQxS8Th0fVt7A7e00jlfnzc39Gx21EZWtmCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625581; c=relaxed/simple;
	bh=CIHNTsjbhqy8pzQK5Y/ncWco915t2g13EOOskyPYInc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Afz04uSBQd93OnqbhR+uFmnF5Ca5YkXthkPn2Cao2+2piRqYlPTGm5KejiCDNl3VUQOzrPTxnSazc212WG7jA/JB9rEaADSt7HSoJ8pKuyZHieZfgcdnTiPIn5OuJjCHUaYBmjtHLBdF6FVN86dUIe0zc7z58Oz1AMC4ZXtMrz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNxzs+lh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNxzs+lh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F8E1F00AC4;
	Thu,  9 Jul 2026 19:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625579;
	bh=a7DGsp9t1rh+v54dzdQNVdyfyEhARCwRb1SGP+3jJqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hNxzs+lh07vnBzhJcXbcQwHBcSmPmfvoHA0svS+z8TOHxtjekFZtRzYJKxhuD5/xa
	 8G2AL3HdKeQHzW4178awfRouqR2KZDIjI2QoDYfxtitA9E1KGCKEgr7vfuzz0LPMLU
	 JK7BsM4MwVIOS7QCraCvNq13VAnB5AiY24WAaANq9DSz/gsDVQz5Gld7bIAq3tTR/x
	 rNW8Zv/Ys2OMQKdqP8lXSp+Fd7ScCGZFZFqSaZQphdQwd8wEqNPQMrkpalvShDaDHv
	 QCHRIAvhAG7rwwvFCxgwJqaEkvcDRCZeNtk7jnv/eOuaJtDJGOOaYAT2SLEusS565P
	 mR4o39ztz3gHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 31/36] phy: rockchip: usbdp: Add phy reset
 notification support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-31-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
 <20260709-rockchip-usbdp-cleanup-v11-31-a149ac60f76c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 19:32:59 +0000
Message-Id: <20260709193259.71F8E1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing PHY_NOTIFY_POST_RESET notification on the rk_udphy_setup()=
 error path.
- [High] The return value of phy_notify_reset(..., PHY_NOTIFY_PRE_RESET) is=
 completely ignored.
- [High] The USB3 port is permanently left disabled after a PHY re-initiali=
zation.
--

--- Patch [31]: [PATCH v11 31/36] phy: rockchip: usbdp: Add phy reset notif=
ication support ---
commit 8e70526891d152fa8ddbd23ac5f83716e6e5bc55
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Add phy reset notification support

This commit adds support for reset notifications to gracefully handle the
PHY being disabled. This avoids corrupting the controller's internal state
and fixes lock timeout errors after device replugs.

I noticed a few potential regressions related to error handling and hardware
enablement in this patch.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1005,6 +1005,11 @@ static int rk_udphy_power_on(struct rk_udphy *udph=
y, u8 mode)
>  	}
> =20
>  	if (udphy->status =3D=3D UDPHY_MODE_NONE) {
> +		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);

[Severity: High]
Should the return value of phy_notify_reset() be checked here? If the
consumer's pre-reset notifier returns an error code, proceeding with the
hardware reset could potentially trigger xHCI SErrors, and unconditionally
calling the post-reset notification later might unbalance the PM runtime
reference.

> +
> +		rk_udphy_u3_port_disable(udphy, true);
> +		udelay(10);
> +
>  		ret =3D rk_udphy_setup(udphy);
>  		if (ret)
>  			return ret;

[Severity: High]
Does this error path leak a PM runtime reference by leaving the DWC3
controller permanently in a pre-reset state? It appears the early return
skips balancing the prior PHY_NOTIFY_PRE_RESET notification with a
PHY_NOTIFY_POST_RESET call.

[ ... ]

> @@ -1012,13 +1017,22 @@ static int rk_udphy_power_on(struct rk_udphy *udp=
hy, u8 mode)
>  		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
>  			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->phy_needs_reinit =3D false;
> +
> +		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
>  	} else if (udphy->phy_needs_reinit) {
> +		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);

[Severity: High]
Similar to the check above, does this code need to handle errors returned
from phy_notify_reset() to avoid hardware issues or underflowing the
atomic reset count?

> +
>  		rk_udphy_u3_port_disable(udphy, true);
>  		udelay(10);
> =20
>  		ret =3D rk_udphy_init(udphy);
> -		if (ret)
> +		if (ret) {
> +			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
>  			return ret;
> +		}
> +
> +		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
> +
>  		udphy->phy_needs_reinit =3D false;
>  	}

[Severity: High]
Is the USB3 port intentionally left disabled on this success path? Unlike
the cold power-on branch above it, there is no corresponding call to
rk_udphy_u3_port_disable(udphy, false) when rk_udphy_init() succeeds.
Could this permanently break USB3 connectivity after a PHY re-initialization
or mode change?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-rockchip-u=
sbdp-cleanup-v11-0-a149ac60f76c@collabora.com?part=3D31
