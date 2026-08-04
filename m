Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB9343849B
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842574; cv=none; b=UgYPzohTyWsyTkvBkZf1YQd+V+EHoUj5ES8p3yXhY2YZrrJFTT/UKcscU5HO4oajIkWzf1sLKbnO6HAcQbdn/27hQsgLWSEXgOHn9TdVIAufgBhDaG54hO/fxEr4LeN7IRCCPs5Wi284pcq4AQEuKo5mmMq1pwC22FYRJGGhf8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842574; c=relaxed/simple;
	bh=hhpit80d0jnves/VrFA+nOu5u4Bbv0xxHvY1VdNn/fM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MlPyq6qBpyhBjN8xYreUPaVzOXFbTne7vqbszMnVaHpp/IlPQdMWRi+yYJbW7ihDSSDyF7BC43WGGAxhfZEBgKs9EBsdJncR8X9ApfE4ZGeY0RInrokWqp5MvljMvrn4tOqP1AHYEK3lWdYwiog4x+mDo5YR8vxeyZNC+aCbfUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9Sn2A9K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9Sn2A9K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9999E1F000E9;
	Tue,  4 Aug 2026 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785842572;
	bh=KqD4O3rMpHeOKmqOnRHu7myAmp25DW8CWXsCocVqdyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W9Sn2A9K3lmv50Z16Tdq0g+SdABXf49T348fOP0MjlcrnhSlBiaA8N5/Bs0iVCweg
	 qZD/Qo1kYifLkSlJOucfwuVQ3L4bXz7kzBM3mFEm/AOdgnUxGRLulLHg8OmJAzWv+6
	 u8p587v6P0/TF58n1/Daqc7xUIrHkG8TFluyJRRTgvUyQU0MAR7uk4UavGb67m4UAF
	 syI2pfXJzm7ojJiFM5p6vILJ6AzOdiXmOef9lboz37q0ZFbg7Iqn8hQPDrSC4flooX
	 MYd7FqO/kxz6lZGFVnmoaYWRTf0uWpapscF8UCmQfKdZT0EV/R2VQxTOWPSLVJTYkE
	 6UUPS/SYQeRug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] riscv: dts: eswin: add I2C controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804104431.1391839-8-pinkesh.vaghela@einfochips.com>
References: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
 <20260804104431.1391839-8-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 11:22:51 +0000
Message-Id: <20260804112252.9999E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect pinctrl assignment for AON I2C controllers, mapping them=
 to LSP I2C pins instead of AON I2C pins.
--

--- Patch [7]: [PATCH v3 7/8] riscv: dts: eswin: add I2C controller support=
 ---
commit dd055880a3b8b5096248d3b1a4bdcec3e5acbe01
Author: Pritesh Patel <pritesh.patel@einfochips.com>

riscv: dts: eswin: add I2C controller support

This commit adds I2C nodes for the EIC7700 SoC and enables corresponding
slave devices for the HiFive Premier P550 board.

> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/=
arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index 3101fd90d1714..50c15e08a57f8 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts

[ ... ]

> @@ -130,6 +130,62 @@ &gpio111_pins {
>  	input-disable;
>  };
> =20
> +&aon_i2c0 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0_pins>;

[Severity: High]
Should this use the AON pins (&i2c10_pins) instead of the LSP pins?

Assigning &i2c0_pins here configures the pads for the Low Speed Peripheral
i2c0 controller, leaving the AON I2C bus disconnected from the external
pads and preventing communication with the EEPROM.

> +
> +	eeprom@50 {
> +		compatible =3D "atmel,24c02";
> +		reg =3D <0x50>;
> +	};
> +};
> +
> +&aon_i2c1 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1_pins>;

[Severity: High]
Similarly, should this use &i2c11_pins for the aon_i2c1 controller?

Routing the AON controller to the LSP i2c1 pins will cause the ADC and
power sensor to fail on boot due to being physically disconnected.

> +
> +	adc@10 {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804104431.1391=
839-1-pinkesh.vaghela@einfochips.com?part=3D7
