Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F594374A14
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668952; cv=none; b=BmqaGknm/NUwnO8eb5iOuF9+ZSmnBs/4E79+6NeIJYETYo23++D+8/m6ycGpWKoulo8lw2QvjAW/K3/Om5MgMm8TiGB30tjkV3EmHfyryp3OMuu1O6ExaqefjlCs7lALTm0K1jPPTAWSEtE4H1uCjZMMHKwRAlw2gml+7qGrXEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668952; c=relaxed/simple;
	bh=suw/0WgJ+OaMOjEOIgd+Eg9+eAm6WCizVG0ceizie4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UUDUj3jI0+iJ6u+d1JJ0kii1zAHrD8S8yqxDD2R8VzTWHKIPmvq9PNJCVNBBEPbp7/o9mtcEVP+S0IBJjRPyz6bgucDmgGk5uVfkwlIGp0fcXQl0NadmACkOxiT5HvjYL/Is658HsMDDVYIG5NheuXnSyVL2k/q03HAbx+HRZ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZO9sjO6y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZO9sjO6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF3B1F00893;
	Tue, 29 Sep 2026 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790668950;
	bh=qRl020rs7gd79pURTYeJNgPQnbRmsLndyqALKkNt5sM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZO9sjO6yq2UiAujeKHXK3HFdDaVYLUiJ82RpCTbJfE6SVadfdRY64ea+mdEYwYwiR
	 AKo/qG1Ey1+9aP+TTc4YKOa4v8ikC0tKh4hGUM1lm4OV9GmCwoWLMCySN/SB2AgyXi
	 mWeRPZPz0O5oXVvXxL/29P2FzTDw3I+dmV8EZttZZdVTS3QvKxnwu5zdra5R59qrkA
	 jlbVNcjXAf1DkiZLpC4QrD9C5yQSlNYu0LeWCecPhy/pitr2GVeJT3/micKNA1m6uw
	 IuQLXRtuxhebj0tkwOp1SjSJyO9RSNkXzGv8K/Xg+3zC8oAt1lM3vN6XIuC1Zj9WzG
	 /lnbd/069S0nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sue Wang" <suwangquanta@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929075106.74731-3-suwangquanta@gmail.com>
References: <20260929075106.74731-1-suwangquanta@gmail.com>
 <20260929075106.74731-3-suwangquanta@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 08:02:29 +0000
Message-Id: <20260929080230.7DF3B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dts: max31790 undocumented child nodes and properties
- [Low] dts: aspeed-i2c undocumented i2c-scl-clk-low-timeout-us property
--

commit 36f26891634e24be887571e8b0992390654a929b
Author: Sue Wang <suwangquanta@gmail.com>

arm: dts: aspeed: ventura: add Meta Ventura BMC

This commit adds the Linux device tree for Meta (Facebook) Ventura specific
devices connected to the BMC (AST2600) SoC. It configures the hardware need=
ed
to detect liquid leakage, log events, and take necessary actions.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts
> new file mode 100644
> index 0000000000000..62a60741bccb3
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

[ ... ]

> +		i2c3mux0ch5: i2c@5 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <5>;
> +
> +			pwm@20 {
> +				compatible =3D "maxim,max31790";
> +				reg =3D <0x20>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				channel@2 {
> +					reg =3D <2>;
> +					sensor-type =3D "TACH";
> +				};
> +				channel@5 {
> +					reg =3D <5>;
> +					sensor-type =3D "TACH";
> +				};

[Severity: Low]
Does the maxim,max31790 device tree binding support these channel child
nodes and the sensor-type property?

The upstream device tree binding schema explicitly rejects child nodes
matching channel@[0-9]+ and the sensor-type property, which leads to
validation failures during make dtbs_check.=20

Additionally, the kernel driver (drivers/hwmon/max31790.c) does not=20
appear to parse these properties, making them dead configuration.

> +			};
> +
> +			hwmon: hwmon@23 {

[ ... ]

> +&i2c7 {
> +	status =3D "okay";
> +	bus-frequency =3D <100000>;
> +	multi-master;
> +	i2c-scl-clk-low-timeout-us =3D <31744>;

[Severity: Low]
Is the i2c-scl-clk-low-timeout-us property supported by the ASPEED I2C
controller?

The device tree binding schema (aspeed,i2c.yaml) does not allow this=20
property, which causes a schema validation warning. Furthermore, the=20
i2c-aspeed driver does not seem to read this property (it is typically=20
used by drivers like i2c-mpc).=20

Should this property be removed to avoid dead configuration and validation=
=20
warnings?

> +
> +	/* USB Debug Connector */
> +	ipmb@10 {
> +		compatible =3D "ipmb-dev";
> +		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929075106.7473=
1-1-suwangquanta@gmail.com?part=3D2
