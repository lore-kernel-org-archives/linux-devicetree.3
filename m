Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571199;
	b=lxekDPJ8TpZcSJnnVWWLQhQbByjqGywmgbtl/O/D2CpSBqmQZFx2bAf377jiK8zHPwbI
	 IMN2cGqEXuhMCPcJuljCZ4POhZdN5KUd2Ryr8IpF/aniZvJ+dIn2AKNZWak3GOGXhZeD0
	 B7lcTUjXB6ovPaetmfn9Z8vrHm5WPlQ6LuACi7JmwO4ovPG8w2CEXna0A6CfCwsDbk2yF
	 Rzd8oS65IkBu6d/zlEphjUutnZ9lk8cxBNy+STcZ6Rkxqu4pfb4wj+VBH3FjxHtN9GUvB
	 AQ/ANOm0eiZDxMnUHxHEarKd28mWKbv7cQURQBomIiZ/kBKgWkpaW6qWZUiBlLBvTnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571199;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oseZBgCFKNkhD5VFwPu5kwuitDJLghzMpRfeHEI1Vjs=;
	b=jZ/mvUZvwTvB0feVBOTvlbQsUJu/hCp/wt6Zmsx8VdqXobKEuXvoF9ottOyzDOHLqgCV
	 GE9E/cDqsQAT0Mo8fQimuYHmv5+dSF/8UUWbNX8vbqFHOfPMhRQAIyGDV0qT/cTbUQci5
	 +HTf39ToyWuy3xH1XoDYjlVvtyXr3HXewV10tCs4M21a+QqFDa0XPqBSsLviKIg1o4FDG
	 MDnkFNacXxX6AC5YValRqcKp4d2W+c3jAQJwaeXfLUiY4hVtOFjSqQDzxsVVj1ofzEIXY
	 /h2PXK24VNTTJcWgg0XcLkOM2M7PB6MzI2b7ZK4GAW0uPOyYphenQfNpANh7pbmqaZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMsU1DIg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED42C606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMsU1DIg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537161F000C1;
	Sun,  1 Nov 2026 22:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571198;
	bh=oseZBgCFKNkhD5VFwPu5kwuitDJLghzMpRfeHEI1Vjs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BMsU1DIgjNPznExi4S8RQWqwQugSheCZE3KS6tgd6CYKzNAM7clinECeYxxP9Cv+9
	 nF3kEMTrubEoEBJocw4cXYqvPkIOEz0swMBJd8CJU3DQ9OIlp1L/uXiz0dyiLO6jMw
	 WF8cUcMZY1fvPT2dC2Vo6SBa8GpyOEORqN7EUNfRTOrPCImnr5y9fO6uQUqEaxUXbS
	 p0KDz0ym31olcCIuO6V5TKzspqRsaDQFquxAwnYHOHQRcqG50TlsgbQesVhdbLIEhc
	 tnFzZbd0U9ccoIPEiHq4Me5AAT7nLJrW2uaeLH++bKVN8V+jWAd51vdst7QmDUzqjD
	 6Zs246hZgd+zw==
Message-ID: <sashiko-outbox-192704@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: rk3588s-nanopi: switch to
 generic eth phy compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joachim Eastwood" <joachim.eastwood@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261101-nanopi-m6v2-v1-2-e401ea64b394@gmail.com>
References: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
 <20261101-nanopi-m6v2-v1-2-e401ea64b394@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 22:13:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: rockchip: per-PHY reset-gpios not deasserted before C2=
2 ID read
--

commit 743d7222bfed74bfab2871d223949437c61ab32b
Author: Joachim Eastwood <joachim.eastwood@gmail.com>

arm64: dts: rockchip: rk3588s-nanopi: switch to generic eth phy compatible

This commit switches the rgmii_phy1 Ethernet PHY node in
rk3588s-nanopi.dtsi from the explicit RTL8211F PHY ID compatible
("ethernet-phy-id001c.c916") to the generic Clause 22 compatible
("ethernet-phy-ieee802.3-c22") to support the MotorComm YT8531C PHY on
NanoPi M6V2.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm6=
4/boot/dts/rockchip/rk3588s-nanopi.dtsi
> index 22b0cdee22b40..4977ccb668f39 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> @@ -269,7 +269,7 @@ &i2s5_8ch {
> =20
>  &mdio1 {
>  	rgmii_phy1: ethernet-phy@1 {
> -		compatible =3D "ethernet-phy-id001c.c916";
> +		compatible =3D "ethernet-phy-ieee802.3-c22";

[Severity: High]
Will this cause PHY registration to fail with -ENODEV when the reset GPIO is
still asserted during MDIO probe?

In arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi, rgmii_phy1 defines
per-PHY reset properties on the ethernet-phy@1 child node:

	rgmii_phy1: ethernet-phy@1 {
		compatible =3D "ethernet-phy-ieee802.3-c22";
		reg =3D <0x1>;
		pinctrl-names =3D "default";
		pinctrl-0 =3D <&rtl8211f_rst>;
		reset-assert-us =3D <20000>;
		reset-deassert-us =3D <100000>;
		reset-gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
	};

With "ethernet-phy-ieee802.3-c22", fwnode_get_phy_id() returns -EINVAL, so
fwnode_mdiobus_register_phy() in drivers/net/mdio/fwnode_mdio.c calls
get_phy_device() -> get_phy_c22_id() to read MII_PHYSID1 and MII_PHYSID2 ov=
er
MDIO before fwnode_mdiobus_phy_device_register() associates the DT node:

	is_c45 =3D fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45"=
);
	if (is_c45 || fwnode_get_phy_id(child, &phy_id))
		phy =3D get_phy_device(bus, addr, is_c45);
	else
		phy =3D phy_device_create(bus, addr, phy_id, 0, NULL);
	if (IS_ERR(phy)) {
		rc =3D PTR_ERR(phy);
		goto clean_mii_ts;
	}
	...
	} else if (is_of_node(child)) {
		rc =3D fwnode_mdiobus_phy_device_register(bus, phy, child, addr);

Per-PHY reset-gpios and pinctrl-0 are only acquired and deasserted later via
fwnode_mdiobus_phy_device_register() -> phy_device_register() in
drivers/net/phy/phy_device.c:

	err =3D mdiobus_register_device(&phydev->mdio);
	if (err)
		return err;

	/* Deassert the reset signal */
	phy_device_reset(phydev, 0);

If the bootloader leaves gpio3 RK_PB7 asserted at boot, or if the driver is
unbound and rebound (since phy_device_remove() calls phy_device_reset(phyde=
v,
1) to assert the reset line), get_phy_c22_id() reads the PHY ID registers
while the PHY is held in hardware reset and fails with -ENODEV before
reset-gpios can ever be deasserted.

Note that the Rockchip vendor DTS only works with "ethernet-phy-ieee802.3-c=
22"
because it places legacy snps,reset-gpio on the gmac node, which
stmmac_mdio_reset() deasserts before scanning the MDIO bus.

As documented in Documentation/devicetree/bindings/net/ethernet-phy.yaml,
when a PHY requires a reset to be deasserted before its ID registers can be
read, shouldn't the compatible string keep the explicit "ethernet-phy-id..."
form (or be overridden in the M6V2 board DTS), or should the reset properti=
es
be moved to the mdio1 bus node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-nanopi-m6v=
2-v1-0-e401ea64b394@gmail.com?part=3D2
