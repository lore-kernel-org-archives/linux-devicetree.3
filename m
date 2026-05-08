Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F69F194C96
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 22:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778277749; cv=none; b=utWA7+9V61rKAKtblYXc+00JSFcX7ok1rp4i6sivlh+W/EtwP1qt3rmzJnM7bLZADjEmFy7V4DT0EzLb0H7NGgNDOmjFBCOosRHNwK9b5jepFi75t0HdskAmjVwr7Uf2VM/TCcxh+/WMg4pQ68XTG2HYWmiOR9LYwKvl8cWbqt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778277749; c=relaxed/simple;
	bh=DhZZOyYlThJb5de56XmNBEjV49XOwCLF2+f+FH9JytE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MM5QXeGJ4KMAj26hulhBqjwScfv2dt9y1uO3fgrwhcpiL0aYno/QTYbH5AJgETcmkJY8y0jXZ+KSLqKRYvGeiG6zYAqd4b6Le60rA4VBBQyi67c9knbTgH7oGIjCz1X4K7Uhg/driJ6lDaENjKMKi5aqlLc6qkFz8RQCQ70+ejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFwPGST/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFwPGST/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD668C2BCB0;
	Fri,  8 May 2026 22:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778277749;
	bh=DhZZOyYlThJb5de56XmNBEjV49XOwCLF2+f+FH9JytE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dFwPGST//i4b7amJLHCXkYHQey7WCy5FS6lgHAfqB2oagLym7AxiZNOri0gDHx15r
	 09jujRHA/xGaXoovdSKcUa/R/moYR+sKoqKqTkfIvH7aoK7NpkSf+hesSYXa8hH4c5
	 QXBYLEEyHBzeSZ/QOKzFiFa8HD9VsLIIFpVgTbOQYigHK4ZWgFT2DYyH7VknOzwAHI
	 4vxVRaN7sg7hwFWDL5XV4rN0jgQV1P7/IiHpieUiNRTBy+WPHNCCwhX83Lnyoe7U+W
	 NduLYThE0xiCptCBAwJhLBA97eyYxFr6Y6652vqBUFMoVrpmBr1NMLTi0FRPdPvM7a
	 HhWAPjiCjAgKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 01/10] dt-bindings: iio: frequency: add ad9910
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508-ad9910-iio-driver-v4-1-d26bfd20ee3d@analog.com>
References: <20260508-ad9910-iio-driver-v4-1-d26bfd20ee3d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 22:02:28 +0000
Message-Id: <20260508220228.BD668C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The binding defines `#clock-cells` indicating clock provider cap=
abilities but fails to include it in the `required` list and the `examples`=
 block.
- [Medium] The `lock-detect-gpios` dependency is written with an unquoted c=
omma (`[ adi,pll-enable ]`), causing it to evaluate to two non-existent pro=
perties.
--

commit 02fb206b49b457eba593a7f4a35e17f11545fbf5
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

dt-bindings: iio: frequency: add ad9910

DT-bindings for AD9910, a 1 GSPS DDS with 14-bit DAC. It includes
configurations for clocks, DAC current, reset and basic GPIO control.

> diff --git a/Documentation/devicetree/bindings/iio/frequency/adi,ad9910.y=
aml b/Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml
> new file mode 100644
> index 0000000000000..3b76871630c90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml

[ ... ]

> +dependencies:
> +  adi,charge-pump-current-microamp: [ 'adi,pll-enable' ]
> +  adi,refclk-out-drive-strength: [ 'adi,pll-enable' ]
> +  lock-detect-gpios: [ adi,pll-enable ]

Does this dependency evaluate to two non-existent properties instead of
"adi,pll-enable"? In YAML flow collections, an unquoted comma acts as an
element separator, so this gets parsed as a list containing "adi" and
"pll-enable".=20

Since neither property exists, this could cause device trees using
lock-detect-gpios to fail schema validation.

Could we enclose the property name in quotes (e.g., [ 'adi,pll-enable' ])
like the other dependencies?

> +  interrupts: [ interrupt-names ]
> +  clocks: [ clock-names ]
> +  '#clock-cells': [ clock-output-names ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - dvdd-io33-supply
> +  - avdd33-supply
> +  - dvdd18-supply
> +  - avdd18-supply

Since the binding defines #clock-cells, indicating clock provider
capabilities, shouldn't it be included in this required list?

According to the dt-bindings guidelines, when hardware has provider
capabilities, the corresponding standard properties must be explicitly
required to ensure schema validation catches incomplete device tree nodes
before runtime.

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        dds@0 {
> +            compatible =3D "adi,ad9910";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <1000000>;
> +            clocks =3D <&ad9910_refclk>;
> +            clock-names =3D "ref_clk";

[ ... ]

> +            adi,pll-enable;
> +            adi,charge-pump-current-microamp =3D <387>;
> +            adi,refclk-out-drive-strength =3D "disabled";

Should #clock-cells also be added to this example block?

The dt-bindings guidelines state that all required properties must be
included in the examples section to pass schema validation.

> +        };
> +    };
> +...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-ad9910-iio=
-driver-v4-0-d26bfd20ee3d@analog.com?part=3D1
