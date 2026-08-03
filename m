Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA97F361948
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776055; cv=none; b=NGBrYjt48PfMiRgiBPHqEz2vtNMTR7Ce8bRRaIkMBwhA46zHCzZtUrd2i8rKcAR8NBSRaL5OQbOe1JYSmIALJYaV8M89ZtLuIIBQxb5LInRZdbOLX9frJCYgq0KCKjPRov/z2TWzj3VkG3XD7Mm9EbuYyn9bY+aA5axOh33n3i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776055; c=relaxed/simple;
	bh=SIrKx18Tgzc/8XHuX+K9BgWqnrsIjO3L31vtx1YRw/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZwzQSKPSt4GQ3LHyUxBtphHmJj+pOJyck3xL1fnSsKEccmZysP8f2SPjvQ0hmJxqS6gGuhMqWCNCQZnraQ+RDrYU4Gl9atr8DtrhNfBa08w0vXptfmCVPDxWdfrex8UixO7sU+5JLvRoDS6Qgz8PCfTLCX7SXh+8S36Y7VyJCqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSia9HSo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSia9HSo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE81C1F000E9;
	Mon,  3 Aug 2026 16:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776054;
	bh=FTfoWEJzaoRw7vRib7twGYop0XF7u+N9Lq+cFROyPx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LSia9HSo2GVrK0ogRSh4sWqXVpFrIZyHko9QIaMhvWlNkvdxneLgRuDndktihrgE0
	 yKU7eiIQNJI2Dw2XFG80EQGXgfOG+hUGGknTAxb5RrRHxQC+ZgQ/Q8Ctn1QkVYHuUt
	 QsmgTnyCnpGjvT/yetN0sG7Cf0b9G9hZZwHWd4kKUsr4hLwT/2sxMxWg91CuJrefmJ
	 vUqPqQ43b07lhnW7MMcfBWU13lVLWdnF29MX5uFm/9bamaphPlHYAyIK05NpIWkwLL
	 BCAO2iLkoaqg7HmvtOwilki3k2ouS3kq4g2UeJKu9wAdVPKOYpDxf7hI2bSR35OGfw
	 NftOFgdBa+nBw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2] arm64: dts: rockchip: H28K: release RTL8211F
 reset before MDIO probing
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhyi <zyheihei_123@163.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <178577533421.26919.15449256732994709630.h28k-rfc-v2@163.com>
References: <20260803104646.26836-1-zyheihei_123@163.com>
 <178577533421.26919.15449256732994709630.h28k-rfc-v2@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 16:54:12 +0000
Message-Id: <20260803165413.AE81C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The pinctrl configuration for the PHY reset GPIO (`&gmac1_rstn_l=
`) was incorrectly left on the PHY node after the `reset-gpios` control was=
 moved to the MDIO bus node, resulting in the pinmux being applied too late.
--

--- Patch [1]: [RFC PATCH v2] arm64: dts: rockchip: H28K: release RTL8211F =
reset before MDIO probing ---
commit ed5c8c6d0629795b93f02fb617db0f38d4725c0d
Author: Zhyi <zyheihei_123@163.com>

arm64: dts: rockchip: H28K: release RTL8211F reset before MDIO probing

Move the reset-gpios property to the MDIO bus level to ensure the RTL8211F
PHY is released from reset before scanning the bus. This fixes an issue
where the PHY cannot be found during probe.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts b/arch/=
arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
> index 0ec50e9156eb1..7ba3fa46c8610 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
[ ... ]
>  &mdio1 {
> +	reset-gpios =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> +	reset-delay-us =3D <20000>;
> +	reset-post-delay-us =3D <100000>;
>  	rgmii_phy: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
>  		reg =3D <0x1>;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&gmac1_rstn_l>;

[Severity: Medium]
Will this pinctrl configuration be applied too late since it was left on the
PHY node?

During initialization, mdiobus_register() parses reset-gpios from the &mdio1
node and toggles it before scanning for PHY devices on the bus.

The driver core only applies a device's pinctrl when that specific device
is probed. Since the PHY device is only created and probed after the MDIO
bus scan successfully discovers it, the pinctrl configuration is applied
after the reset phase has already completed.

Should the pinctrl-0 =3D <&gmac1_rstn_l> property also be moved to the pare=
nt
&gmac1 node to ensure it is applied before the MDIO bus reset sequence?

> -		reset-assert-us =3D <20000>;
> -		reset-deassert-us =3D <100000>;
> -		reset-gpios =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/178577533421.26919.=
15449256732994709630.h28k-rfc-v2@163.com?part=3D1
