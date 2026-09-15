Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4301C480DCA
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500494; cv=none; b=ph2DxG0umXZa15wHtFPXIYOPWCP79C7and4ovVf3ZbVRqwJEVwuLJ0Xl6OXY0XoCi7GRl0Jp+ZZ1xntOLQzFq52qXw2KOJz3MgHhhKQ5a8e7XBQqKbvuoHbrAYT3D7JP4Hi/+E558zT8EOlp/7zyTXWEV7Jbx7uTIvYlvYQ5Fgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500494; c=relaxed/simple;
	bh=Pk2ONP42wA6NuxM2Ry2KX/yNrPk/DcQ+wMOUSGhs8AE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PpM+ex+nFe01bwWdsiwBFruDMIXuKeymowUMIgCgIgAxiaiue+3LkTasLA44P4NOStu5cW7CymvN/6f32wc/MAzksSYSNdLk/GY/53PBPZknFB/Uj8jNkuoWAE1Tr/ahkHvTlcfMVKL4PCMjtClz4q/3iBjQP524sGLmaxLCwJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UA/gEC9N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UA/gEC9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C43C1F00893;
	Tue, 15 Sep 2026 19:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789500492;
	bh=C9Wz04UMZSUa7h4co/0FXRrLPchylUUQ5hQEGsh565M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UA/gEC9Nu/6NI67E/pd701pSlTxT5Tu4O3GaUPEsLhaCr9ZtX7Dsi8tZ3MRdC7hv6
	 U6i6iwMdlBqBJOQHvCEWpasA0rSagECcHAUijnSBA3WvoyAO3/TpgD2CP7Bio0eSFx
	 oKkwhuB0labV0RgvWLc7xvkOmn3sAcwmYdtCYwF0EkdgDeC1937iVGv6PuxvELQWqJ
	 U0CPFau78joSftESpU6huMZtnnZAlA1T4TLmdea9mo2PeAxBguTSKN7r+CCb6OY16x
	 KeqkJUEuApMk7c6x0y9FqYA4JhmfjQs9n6XnC9uV/x4bltIABbnLtIIdhb3nlspdKD
	 3SIO/QOIewG6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/15] dt-bindings: iio: adc: adi,ad4134: Add high
 data throughput example
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <958894021cf7bd3012567d1dfabd7f2008fe8d31.1789494473.git.marcelo.schmitt@analog.com>
References: <cover.1789494473.git.marcelo.schmitt@analog.com>
 <958894021cf7bd3012567d1dfabd7f2008fe8d31.1789494473.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 19:28:12 +0000
Message-Id: <20260915192812.7C43C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: iio: adi,ad4134: conflicting ODR pin configuration in =
example
--

commit be1a4d1c0eae8c4f9247540fa11bc671216046b8
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

dt-bindings: iio: adc: adi,ad4134: Add high data throughput example
   =20
Add device tree example for AD4134 operation in 4-wire SPI mode with 4
lines to transfer data samples to the host controller.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> index ad67d1cdacec8..133996917ee22 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml

[ ... ]

> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        adc@0 {
> +            compatible =3D "adi,ad4134";
> +            reg =3D <0>;
> +
> +            spi-max-frequency =3D <1000000>;
> +            spi-rx-bus-width =3D <1>, <1>, <1>, <1>; /* 4 lanes of 1 bit=
 each */
> +
> +            pwms =3D <&ad4134_odr_generator 1 1000000 0>;
> +            reset-gpios =3D <&gpio0 86 GPIO_ACTIVE_LOW>;
> +            odr-gpios =3D <&gpio0 87 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does this example create a logical hardware conflict?

Both a PWM (pwms) and a GPIO (odr-gpios) are assigned to the exact same
physical ODR pin. Additionally, odr-gpios is explicitly documented to be us=
ed
for minimum I/O mode, but this example configures adi,spi-mode =3D "4-wire"=
.=20

Could this cause developers copying this example to create device trees with
conflicting and semantically incorrect properties for the chosen SPI mode?

> +            powerdown-gpios =3D <&gpio0 88 GPIO_ACTIVE_LOW>;
> +
> +            clocks =3D <&sys_clk>;
> +            clock-names =3D "clkin";
> +
> +            avdd5-supply =3D <&avdd5>;
> +            dvdd5-supply =3D <&dvdd5>;
> +            iovdd-supply =3D <&iovdd>;
> +            refin-supply =3D <&refin>;
> +            avdd1v8-supply =3D <&avdd1v8>;
> +            dvdd1v8-supply =3D <&dvdd1v8>;
> +            clkvdd-supply =3D <&clkvdd>;
> +
> +            mux-states =3D <&ad4134_sdo_dout0_mux 0>, <&ad4134_sdo_dout0=
_mux 1>;
> +            mux-state-names =3D "data_read", "reg_access";
> +
> +            adi,spi-mode =3D "4-wire";
> +        };
> +    };
>  ...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789494473.gi=
t.marcelo.schmitt@analog.com?part=3D13
