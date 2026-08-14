Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA9030E85D
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 04:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786683182; cv=none; b=EuQaJIjY4yDMrfBCT9lvna2Xo1r0kpwah0aU5qCUP0p/UlXnK0UIOqflt754xt5Ey9jqR/bqM25wRdPUhakQZXuWfN3yp2iBxBUPZViF0LhqM7Z2C7jiwbM/uMK6KQdqQ14f+nHg4Gn1PHKJCwfpDIRP3YwWYAvN8aWJ9Kewpr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786683182; c=relaxed/simple;
	bh=O2ww6r0Qx9bs2RtDGjRUto2uZVr7Aa4rq6eY1shg+dY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h38GQic5C+AhrwGu0xhL7HRq6ygEMnt5p5pfl1Ews1tNIPtD1fLb8N/gTUqblNAk1vT5uJ9GV8St7KjJc0E71xxusl0bGL4Kya8msRdOwiBN8z46p27cX/OoDjrUkLPNR0Ok6Z8iH+QoqFk+ZLkLovfIUU5fNPxnElEe+hAfsCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKj+laII; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKj+laII"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD631F000E9;
	Fri, 14 Aug 2026 04:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786683181;
	bh=LWo/Iwk1pAe7b8ebfLJ1YqTGdKxen3/2b6UlCECV1YY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KKj+laIIijVJ+VT1fL9Yc3/ALQhApeVXAS/GT1a1jLX63inEgsnIPDWpXz4ba20/r
	 USjm1qoOwplWaeV67ySUd6uS51oQFouFDkR0KgbPEcWs04uw9xcEaF6aMqleNpRCRh
	 9GOZgM0p6Ydziwb/CVpB5/B+ia9BiXEVZkVG/FW0LDZuwQgYlIn3DJ/ZntNUG9DpQP
	 +5rsHzdkSIRH2tfa7nu42q/SeEyt0wbd9La5Mjvq8007UC1J4nyi+0ISRysVHjK7y4
	 Z+jc9oQsqe3IHv15ti64hdO28fKVzsrryHiLQnD65UfpmHJQuOgzarI7XqwtL2/YHY
	 0ddUcodnPlkPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 25/38] phy: rockchip: usbdp: Avoid xHCI SErrors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-25-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-25-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 04:52:59 +0000
Message-Id: <20260814045300.7CD631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The initial power-on path (`udphy->status =3D=3D UDPHY_MODE_NONE`)=
 in `rk_udphy_power_on` fails to verify `!udphy->hs` before re-enabling the=
 U3 port, which can incorrectly enable the USB3 port for high-speed-only co=
nfigurations.
--

--- Patch [25]: [PATCH v14 25/38] phy: rockchip: usbdp: Avoid xHCI SErrors =
---
commit a6a982bf14ce7b1d3186386afd971d5fcada88b4
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Avoid xHCI SErrors

The USBDP PHY provides the PIPE clock to the USB3 controller, which
means the PHY must be fully running when anything tries to access
the xHCI registers. This patch avoids the problems by disabling the USB3
port before re-initializing it.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index e67c1df792ed2..c7f09040185b6 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1000,12 +1000,15 @@ static int rk_udphy_power_on(struct rk_udphy *udp=
hy, u8 mode)
>  			rk_udphy_u3_port_disable(udphy, false);

[Severity: High]
This is a pre-existing issue, but does this branch also need to check for
!udphy->hs before re-enabling the U3 port?

If a system is restricted to high-speed and the DisplayPort PHY powers on
while udphy->status is UDPHY_MODE_NONE, could this incorrectly enable the
USB3 port and cause xHCI SErrors?

The patch correctly adds the !udphy->hs check to the re-init branch below,
but it appears to be missing here in the initial setup branch of
rk_udphy_power_on().

>  		udphy->phy_needs_reinit =3D false;
>  	} else if (udphy->phy_needs_reinit) {
> -		if (udphy->mode =3D=3D UDPHY_MODE_DP)
> -			rk_udphy_u3_port_disable(udphy, true);
> +		rk_udphy_u3_port_disable(udphy, true);
> +		udelay(10);
> =20
>  		ret =3D rk_udphy_init(udphy);
>  		if (ret)
>  			return ret;
> +
> +		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
> +			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->phy_needs_reinit =3D false;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D25
