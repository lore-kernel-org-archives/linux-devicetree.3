Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AF823394B
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781704404; cv=none; b=BWBmLjm2DUCwZoXv4AcWpCRCe8iBISbVA5hJIpfHeXdgFVSdoqpiaO1Q4DyuWz8tQN+jem6plJrM+OwJImCxA0vBF6E97BYsyVaO3ys43rJu/l1iiGb8JT2HH+HsWI/sN7+ROA/0fHnoVfoIVR9ChdAGUKAvDU89Xks8hCaBrcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781704404; c=relaxed/simple;
	bh=mWeqXK093MQ3QIyHH0lQqTZQwv9E/kbNLN8X4TwtzEA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=he3w7iSMgXPXpfbunRzKzh6JbDsJBstcthIDo+NyPBDPVazfvXpVhaG9CcKxfHYOf53n9U6kgfeSy/9lDW2WnJR41WFfeehGAOECOOxTwo4qBCRET+zFidZW3qvgc3cBJ6AkG+5E2Bf9h1c5F+HVBULP2sqqMasDydBNVrtw4vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnEem+E3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnEem+E3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94271F000E9;
	Wed, 17 Jun 2026 13:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781704403;
	bh=Z1bET5h57JYGiirEYkxMqy1bjKod96QN65wFZsRuL4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JnEem+E309+YqzKeNe6r+8rS4QC7iBFyBzBXs7/W4zCMI+e9E6shNN7SXX3TFmcTF
	 1AtCPecR2aeQOSwzuri4AON8+vubdhpZYki65mx2NQEiAejcWK41bZJoT4lD4oGEFl
	 AmX6D/ILFnGYx595YxOuY3e46kM4+6EB6jTfbjMPg2+pnNPNFBgeCJpQqtQ5LpxoaD
	 EAQNoxI+CnOvwy3LWvi4Jpy/LXy9wrc3ui4641XNnUzGQSgHqhaiCFf2utDXURlKkm
	 w9NtAK0Niyp6lLyVheFltXHfuxiGZj0emZLh+QQnPFWlTsOAGmyxsvLh8UMAIbMggw
	 FsUehKjfjSTSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] arm64: dts: nuvoton: npcm845-evb: Add peripheral
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomer Maimon" <tmaimon77@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617133212.287768-5-tmaimon77@gmail.com>
References: <20260617133212.287768-1-tmaimon77@gmail.com>
 <20260617133212.287768-5-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 13:53:22 +0000
Message-Id: <20260617135322.D94271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect type for PWM fan cooling-levels property causes intermed=
iate cooling states to turn fans off.
- [Medium] The `&fiux` node is missing the `status =3D "okay";` property, s=
o the controller will remain disabled.
- [Medium] The FIU aliases intentionally violate device tree bindings to wo=
rk around a hardcoded driver array, improperly swapping physical mappings.
- [Medium] The `ipmb@10` and `ipmb@11` nodes lack the `I2C_OWN_SLAVE_ADDRES=
S` bitmask in their `reg` property.
--

commit cf191e9e7fae85040690a2905adeff456af8e03b
Author: Tomer Maimon <tmaimon77@gmail.com>

arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

Enable peripheral support for the npcm845 evaluation board by wiring up the
soc controller nodes to the board design. Add board aliases, gpio-backed
mdio buses, reserved-memory, and flash partitions. Enable various peripheral
controllers and interfaces with board-specific pinctrl and phy connections.

> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/a=
rm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> index 5edf5d13342da..1092dc5bb7aba 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts

[ ... ]

> @@ -10,6 +10,42 @@ / {
> =20
>  	aliases {
>  		serial0 =3D &serial0;
> +		ethernet1 =3D &gmac1;
> +		ethernet2 =3D &gmac2;
> +		ethernet3 =3D &gmac3;
> +		mdio-gpio0 =3D &mdio0;
> +		mdio-gpio1 =3D &mdio1;
> +		fiu0 =3D &fiu0;
> +		fiu1 =3D &fiu3;
> +		fiu2 =3D &fiux;
> +		fiu3 =3D &fiu1;

[Severity: Medium]
Do these aliases intentionally violate the device tree bindings for the soc?

The device tree bindings explicitly map the fiu1 node to the fiu1 hardware,
fiu2 to fiu3, and fiu3 to fiux.

Mapping fiu1 to &fiu3, fiu2 to &fiux, and fiu3 to &fiu1 appears to swap
the physical mappings to match the hardcoded npxm8xx_fiu_info array in
spi-npcm-fiu.c.

Should the driver be fixed instead of working around it by conflicting with
the physical hardware intent here?

[ ... ]

> +&fiux {
> +	nuvoton,spix-mode;
> +};

[Severity: Medium]
Will the fiux controller remain disabled without setting its status?

The commit message mentions enabling the controllers, but the base soc
dtsi file defaults the fiux node to status =3D "disabled".

Is a status =3D "okay" property needed here to ensure the kernel actually
probes it?

[ ... ]

> +&pwm_fan {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";

[ ... ]

> +	fan@0 {
> +		reg =3D <0x00>;
> +		fan-tach-ch =3D /bits/ 8 <0x0 0x1>;
> +		cooling-levels =3D <127 255>;
> +	};

[Severity: High]
Does this cooling-levels definition cause intermediate thermal states to
turn the fans completely off?

The npcm750-pwm-fan.c driver parses cooling-levels strictly as an array of
8-bit unsigned integers via of_property_read_u8_array(). Because the
/bits/ 8 directive is missing, the device tree compiler generates two
32-bit big-endian integers (00 00 00 7f 00 00 00 ff).

When the driver counts the elements using of_property_count_u8_elems(), it
will find 8 states instead of 2. The parsed levels become:
[0, 0, 0, 127, 0, 0, 0, 255]

Could this result in a 0% duty cycle when requesting intermediate states
like state 0, 1, or 2, risking hardware overheating? Should this be written
as cooling-levels =3D /bits/ 8 <127 255>; instead?

[ ... ]

> +&i2c2 {
> +	status =3D "okay";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	ipmb@10 {
> +		compatible =3D "ipmb-dev";
> +		reg =3D <0x10>;
> +		i2c-protocol;
> +	};
> +};
> +
> +&i2c3 {
> +	status =3D "okay";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	ipmb@11 {
> +		compatible =3D "ipmb-dev";
> +		reg =3D <0x11>;
> +		i2c-protocol;
> +	};
> +};

[Severity: Medium]
Are the I2C_OWN_SLAVE_ADDRESS bitmasks missing from these reg properties?

According to the ipmb-dev device tree bindings, ipmb devices must operate
as i2c slaves. Passing a raw address like reg =3D <0x10> tells the i2c core
to treat it as a master-side client target.

This can trigger a warning in i2c_slave_register() and might cause address
collisions or break reception. Should this be defined as
reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>; to instruct the underlying
controller to listen in slave mode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617133212.2877=
68-1-tmaimon77@gmail.com?part=3D4
