Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E837339FCD7
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884145; cv=none; b=Klkp44+FsRievSXA0aF/jKlOtR+wYYZDlNyEQPompEagRRkf1MHjbMcb97xehHq8l/mKFFE1IFZerRO3b1RRCpolbK2TLGRMMbdoKkemzeyruzZU/XmFi6yq0a+eUCm0epTe0v8/m+DwaPrDlssN+U9Othlqiqa9acMI3gNJTks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884145; c=relaxed/simple;
	bh=b3CoD0yATcSbW9meB13fyVRpDZLz75ni3T0CvqLp/lM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iG7tAo6/bGAiURPDFBxkXBDVpSQcOAlC9O5jFpe3KW0PcyuhOrO1ZpHoJPvy6gZ+U/dA6j7g9OWkxOX01/LdT1oSKAZb7kC5gGupeBvXabm+whKdLiTLEgt6mogk/JMOCCbAppPp4XK4618WHbW5D1NVApABoihclSqvVXXGYmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CO6a8JZa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CO6a8JZa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2225A1F000E9;
	Fri, 19 Jun 2026 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884143;
	bh=fs248ZtmCWHxz8JyKDVma/eFwS9PEcpqwK8zqoCy6sM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CO6a8JZaK9syYcZGMFm0CwVwPyZoIO5rPeQhfuqioBW36dyC9S/Dolx1H90ixRvzf
	 aSbtk9SXRGud/30NrQHHe0jNFnYfliGqY2uXNXkyyUhqn0G4hRkN/Ql37Tb1qReUaR
	 1qpjjoKZaJVHRT5yNhqyGuGWOAwTx/wiAx7Loba10PD4Js/k48My0IfHnLWvV1/70y
	 5e5SebNnmKMLB5mpg6lWQ/oMV+UXXjEwQyPhUxPhteee1dLls7trFv0hGvtpg1P0h1
	 M9+AhFkbVXBVBPVNM3NXZooyMy8PKZmWBbNp52GGVkz3VlxCWSAlQhTja3eOQ28Ft3
	 A9c6niJkS/MhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/23] phy: rockchip: usbdp: Update mode_change after
 error handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-2-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
 <20260619-rockchip-usbdp-cleanup-v6-2-3bb1f54b3f35@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 15:49:02 +0000
Message-Id: <20260619154903.2225A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] System crash due to concurrent MMIO access after PHY reinitial=
ization failure.
- [High] State desync and resource leak in PHY mode tracking during Type-C =
role transitions.
--

commit e7082d92230eb75aff8a9e06c20d96b4d548e34c
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: phy: rockchip: usbdp: Update mode_change after error handling

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Link: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.ke=
rnel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index fba35510d88ce..a5ffdf7a6e76b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udp=
hy, u8 mode)
>  	}
> =20
>  	if (udphy->status =3D=3D UDPHY_MODE_NONE) {

[Severity: High]
This isn't a bug introduced by this patch, but I have a question about how
PHY mode transitions are tracked when the Type-C mux switches from a state
with USB (like DP+USB) to a state without it (like DP-only).

In this scenario, the mode variable gets updated, but the USB flag is not
cleared from the status field. Later, when the USB subsystem calls
rk_udphy_usb3_phy_exit(), it sees that the current mode lacks the USB flag
and returns early. This bypasses rk_udphy_power_off().

Does this mean the USB flag is permanently leaked in the status field? If
the remaining DP consumer subsequently powers off, it seems the status would
still contain the USB flag, preventing the driver from properly shutting
down the hardware and leaving APB clocks active.

>  		ret =3D rk_udphy_setup(udphy);
>  		if (ret)
>  			return ret;
> =20
>  		if (udphy->mode & UDPHY_MODE_USB)
>  			rk_udphy_u3_port_disable(udphy, false);
> -	} else if (udphy->mode_change) {
>  		udphy->mode_change =3D false;
> +	} else if (udphy->mode_change) {
>  		udphy->status =3D UDPHY_MODE_NONE;
>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);
> @@ -1017,6 +1016,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  		ret =3D rk_udphy_setup(udphy);
>  		if (ret)
>  			return ret;

[Severity: Critical]
This is a pre-existing issue, but what happens if the setup or init fails
here during a Type-C orientation change?

If rk_udphy_init() fails due to something like an LCPLL lock timeout, it
asserts all resets, including the APB resets, before returning the error.
This function then propagates that error, but it doesn't restore the prior
state of sibling PHYs (like DP) which might already be active.

Since the DP framework would still consider the PHY active, could it
subsequently invoke rk_udphy_dp_phy_configure()? If that happens and it
attempts MMIO access to the PMA regmap while the APB bus reset is still
asserted, would this trigger a bus hang and a kernel panic?

> +		udphy->mode_change =3D false;
>  	}
> =20
>  	udphy->status |=3D mode;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-rockchip-u=
sbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com?part=3D2
