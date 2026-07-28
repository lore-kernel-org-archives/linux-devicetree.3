Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE1B3612EC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785275741; cv=none; b=Dk4zCuBn086JkKaCY8h7AdYeUSft0PB2a+WCxvkFWAzRC4lAeDezTU4jHK+RIGXK2OfbODoPslvPiOxKVNeGUUUziL4sPB5Hooxh2m8KC6ZFYpL6N+D9zXvTUwnTiULGcOQ9HjYHf4lqua1MLS6iMiJQzFNSSw3EpWZkFyjoxMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785275741; c=relaxed/simple;
	bh=WjJcJFoFbAl21CGktQZM2Xoni99z6iN3x66p+KmU96o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K+WNwtU1hDD+NZzNb1OphtpsAljY+If9hMrOkbMW5deCUzsHf50o7rraj6M1YbLR3ai1bB0LBJukn4BzTNrjU98qzdLoWuXeTunppLhLDQ8WpknVIiqQCvnwHssK5lpOTZRENC+6LGXx3VzzKBSl5ga3d1N3glQZQUwIJiwfUk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXTKGPEL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXTKGPEL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86B01F000E9;
	Tue, 28 Jul 2026 21:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785275740;
	bh=yGjv3W+k+6yt24rlOu6lTBWVGEWnedAIWqUC/cVW7q4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HXTKGPELuucV19PVLiFaY9ydGov9+hvc94dVnVlZBpehLr1hOFuYZNJqspFKauPRf
	 TBTwkjFR2LiPgoZkcbA6Pj6kUbdgige5JzrYM+//LjkORGyYmgA6mrD8dufmEs4A81
	 CghwFUWPIB6xov/p/spNg/6bBsTMAbhkcfu1SrCcIJRpq8dpE+RlT2LZobmcD0cvTP
	 iYYQaKVu0cNTeKPFnA6Q5WhDaaqKryD3XsIakstju9sibUgqo6dwLEvJhAvNDXMyRj
	 rB4dD9om4p0mjDv01voW0V2XnJV80EDbED/1J+tSMN+7Qqb16I4J1EagTn34eVPMXV
	 6aSo5YCUmCfSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: iio: flow: add Sensirion SLF3S
 liquid flow sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wadim Mueller" <wafgo01@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728214943.29820-3-wafgo01@gmail.com>
References: <20260728214943.29820-1-wafgo01@gmail.com>
 <20260728214943.29820-3-wafgo01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 21:55:39 +0000
Message-Id: <20260728215539.A86B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Hardware mismatch: The DT binding documents an `interrupts` propert=
y for a 4-pin device that lacks a physical interrupt pin.
--

--- Patch [2]: [PATCH v6 2/4] dt-bindings: iio: flow: add Sensirion SLF3S l=
iquid flow sensor ---
commit 926be8ca8c587fafce9ef5ee2b44bb20052e203d
Author: Wadim Mueller <wafgo01@gmail.com>

dt-bindings: iio: flow: add Sensirion SLF3S liquid flow sensor

This commit documents the device tree bindings for the Sensirion SLF3S fami=
ly of
digital liquid-flow sensors on I2C. The driver covers multiple variants whi=
ch
differ only in flow scale factor and calibrated measurement range.

> diff --git a/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.y=
aml b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> new file mode 100644
> index 0000000000000..79718f4f98bd6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - sensirion,slf3s-0600f
> +      - sensirion,slf3s-1300f
> +      - sensirion,slf3s-4000b
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +
> +  interrupts:
> +    maxItems: 1

[Severity: Low]
Is this interrupts property accurate for the hardware?

The SLF3S sensors are 4-pin devices (VDD, GND, SDA, and SCL) and do not app=
ear
to have a physical interrupt pin. Documenting it here might mislead device =
tree
authors into configuring phantom interrupts.

> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        flow-sensor@8 {
> +            compatible =3D "sensirion,slf3s-0600f";
> +            reg =3D <0x08>;
> +            vdd-supply =3D <&reg_3v3>;
> +            interrupt-parent =3D <&gpio0>;
> +            interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;

[Severity: Low]
Could these interrupt properties be removed from the example, since the
hardware does not have an interrupt pin?

> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728214943.2982=
0-1-wafgo01@gmail.com?part=3D2
