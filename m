Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCE7395AF5
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718778; cv=none; b=pZaw6sJFckZ3QfAoGNXvbjrnIklR8UzsQuBxGty3aU1KI+qWvTHVt6d4pRVMkBX3fg9xaqp4yr3q++FiUbUpNrktSHRTaCmtYldrqKVoKDmkUc+Oau9djKv832YOLMhBheejzKLMVZ8MozW7+S7RydLY1ZL0xqV1zpmaY4+RpMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718778; c=relaxed/simple;
	bh=Pu0DqeWrBVf7y3IZugsyei2ThnCc5nAKQwrQItr9RK8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JW5k7SlvKmrC6qKoT3Qn6HBHBBE5VXoa5HrgTOzSl/l/IebYFRZXpQe4ZHbphlG8hlenF+d+Im/H+B6jzZCAKrihVbSaMzZPfGz4J37LEdb5QccQJ+u0+yahTlMuzNqoXnUuwsV7yqMJ4zVSLsX4hdspb0cRJfoeoTsJk+swOBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jp5o+K7e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jp5o+K7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6181F000E9;
	Fri, 10 Jul 2026 21:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718776;
	bh=oOBlRc8oXCuipNEM5tX4COdpO+MQ27JUSVb5sLg1x30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jp5o+K7exQfCYNqiAH91nIY9YercSfYk0/7l3VsdKAbpFPfcRyjb3u+P703KGUXBx
	 M532dRfiXgWNelYE3OwQRB//QDLzEDcslmBUbr5JikzphWKvRCvfEqCqbIABNFq47i
	 fZdxuk3zB93GYKSymGlBXUMVThJDWfao1h4mb/qlWrRSfbivvARABzDnzbq39abAhK
	 TpTC5OUTpXvy6IXkpHpcVqKgdO9+/lqL6Ec8xC5BJ3Akk4dNPVcraj+sJhEICCx05/
	 KBfwvPwcr72gvgVLOWpnpt7BCApL/6/jhx2kC9uYARmKv+abCjW6GdXEjflE6ol+2u
	 lx6KdinDoDc8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 28/36] phy: rockchip: usbdp: Only enable USB3 when
 not in high-speed mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-28-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-28-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:26:15 +0000
Message-Id: <20260710212616.3E6181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] rk_udphy_power_on returns 0 (success) for unsupported modes, trick=
ing callers into accessing unclocked PHY registers
--

--- Patch [28]: [PATCH v12 28/36] phy: rockchip: usbdp: Only enable USB3 wh=
en not in high-speed mode ---
commit fac8dba407b679ba8fc75d417de958451d90f46f
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Only enable USB3 when not in high-speed mode

Ensure that USB3 mode is not accidently enabled during PHY re-init
for systems that are configured as high-speed only via DT.

Closes: https://sashiko.dev/#/message/20260626212424.C215E1F000E9%40smtp.ke=
rnel.org

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 2099ae2e51d1c..af915cc377275 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1009,7 +1009,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  		if (ret)
>  			return ret;
> =20

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in how
rk_udphy_power_on() handles unsupported modes.

At the beginning of rk_udphy_power_on(), if the hardware isn't configured
for the requested mode, the function logs an info message and returns 0:

	if (!(udphy->mode & mode)) {
		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
		return 0;
	}

Because it returns success, callers might assume the PHY was successfully
powered up and clocked. For example, if we look at rk_udphy_dp_phy_power_on=
():

	ret =3D rk_udphy_power_on(udphy, UDPHY_MODE_DP);
	if (ret)
		return ret;

	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);

If UDPHY_MODE_DP is requested but not supported (for instance, if the
device tree configures it as USB-only), rk_udphy_power_on() will skip
the setup sequence and return 0.

Would the caller then proceed to access unclocked memory-mapped registers
in rk_udphy_dp_lane_enable() and trigger a kernel panic (SError)?

Should rk_udphy_power_on() return an error code like -EOPNOTSUPP instead
of 0 when an unsupported mode is requested?

> -		if (udphy->mode & UDPHY_MODE_USB)
> +		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
>  			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->phy_needs_reinit =3D false;
>  	} else if (udphy->phy_needs_reinit) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D28
