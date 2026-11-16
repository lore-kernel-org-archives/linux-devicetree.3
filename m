Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815514;
	b=Dde0UlONwXInrD7FpE8IYAjf2Pw6Kr9RFfQfqYzt5ncKFqUZSKexSCCbS2udIbcCxZiK
	 nmqSmEl3Dn3hc77hVqm4an1dIdBOxuITnJxxoKYUoDZZ9moX7forj+Oenp7r4tCshtFcp
	 55sHU5DH2IMyeqqzxRDzrrme06wiwrTaf9cIG85nD3ngQTHkNiWwYWqwO7vR74EYHdx7n
	 yjYm774PjWuUDZ0JdQj3FXZMbKYdFbgD/c4kG9/q7aT3Jcm+YkbGBNRZeJp2Wng/Lh5lF
	 M/tXohe9RVbkcj1y52gTuF1dwfQ/oGwO7ppI7V5OBc4MQi4+JbN0jx+gHXWZsCubiGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815514;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a9/7nO64WjDLJVHdVVqjnU49C0kmZkm1LAp+YvEDPlo=;
	b=i0fGXJ10mapdOr/W+5NgNJOJdJMrMDv/PHZHra7wzB3wnv9twvFbQIcAep5fOVCgzT7S
	 6/ypCdSrUslLfqSXIn5e4DgGuh+sHgPE7qRK8LT/RTs+I7Y/h7DovCdNwWEj7lPA54/Wy
	 rMS8+wiTVZ4nPplOekTyV+CdABx3cJPuPQ+iPNSpr/zygCfXTPqqSTMjQo9gf2BWcJAjm
	 SuCojM6x9Ygax4imG8OCQdFjqDfZDIJH0H3NCXJltUdcM0sVVwJdJIVtWT6Ma+S5c4L98
	 Do2aKtPWiir1LK9RKoRvPCLGO7yv/vJOlnnek37NFQ4/STli0UqZ7nzbs1a0QktWIAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="agfw/qAG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4221606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agfw/qAG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012671F000C4;
	Mon, 16 Nov 2026 07:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794815514;
	bh=a9/7nO64WjDLJVHdVVqjnU49C0kmZkm1LAp+YvEDPlo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=agfw/qAGAQp3J1Z+hQ9SbsEZ6G9Ij4Ux0XzItzbm9kp2oEWVH31eKh4YmRZTWYT+m
	 7L/YGs4tuOK+L9ug+KAuyThBOHHwnXGwZ26GdxHkGvjHATW0HU3ykpj8jBNUTIRHOO
	 PN8xQLcb2wxhP/HETHPOL2Hv5THohtZXlUXb7URVKpK1Fi5vAEUmTmHh92+ldvnpcO
	 M9mAv+65Ua5Q9r7fJxXNXnhopKGolkxfP3lVxbeXre90tI50eOZNc+hEX9PL2jvA8c
	 bCFLynxK/0cCZtWrFRUF/Uht3WXUFmczdChkzLcXITN6MjoIO6P4B8SxbwlY03DpwN
	 LhcwEqafla2SA==
Message-ID: <sashiko-outbox-216474@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: proximity: add Imagis ISG5320A
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWRpbCBIw7xzcmV2IFRlcGU=?= <tadilhusrev@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116074013.355363-2-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
 <20261116074013.355363-2-tadilhusrev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:51:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: iio: proximity: imagis,isg5320a: style and example
  issues
- [Low] dt-bindings: iio: proximity: imagis,isg5320a: OS-specific
  description
--

commit e012fe4a93b96b30e3eac1a75009b8703a8aa96e
Author: Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com>

dt-bindings: iio: proximity: add Imagis ISG5320A

This commit adds a Devicetree binding schema for the Imagis ISG5320A I2C
capacitive SAR/grip proximity sensor.

> diff --git a/Documentation/devicetree/bindings/iio/proximity/imagis,isg53=
20a.yaml b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.=
yaml
> new file mode 100644
> index 0000000000000..b23d6bafd39e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
> @@ -0,0 +1,56 @@

[ ... ]

> +description:
> +  Imagis ISG5320A capacitive SAR/grip sensor (I2C), exposed as one IIO
> +  proximity channel (B-channel diff =3D CDC16_T - BSL16_B). As fitted on=
 the
> +  Samsung Galaxy XCover5.
> +
> +properties:
> +  compatible:
> +    const: imagis,isg5320a
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: active-low data-ready / proximity interrupt
> +
> +  vdd-supply:
> +    description: sensor supply
> +
> +  wakeup-source: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

[Severity: Low]
Could the description focus on the hardware characteristics of the ISG5320A
rather than how the Linux IIO driver exposes a single channel or which
board uses it?

Also, vdd-supply can simply be "vdd-supply: true" and should be listed
under required since the sensor needs its VDD rail to operate.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        grip@28 {
> +            compatible =3D "imagis,isg5320a";
> +            reg =3D <0x28>;
> +            interrupt-parent =3D <&gpa2>;
> +            interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +            vdd-supply =3D <&grip_vdd>;
> +            wakeup-source;
> +        };
> +    };

[Severity: Low]
Does the example need a blank line between "#size-cells =3D <0>;" and the
child node?  Without it, "scripts/dtc/dt-check-style --mode=3Dstrict" warns
on required-blank-lines.

Also, the unused <dt-bindings/gpio/gpio.h> include can be dropped, and the
node name should use the generic "proximity@28" instead of "grip@28".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116074013.3553=
63-1-tadilhusrev@gmail.com?part=3D1
