Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109579;
	b=rs6CZsi3zp/TazoM9hdTgRbETFj+fH16rMX9hpm+oIog3xq1aGmi2YBztRjGlbKU+6x4
	 pR+qcgwOKwNsAQja2vPPLAOevTK/39n73DDqeAh7FezR6RhYtme/qXofX+9teDWgBJNBk
	 +iQs1cckOc24ygDVwQPPCmXAhjN6nMbc3mFPmdw4W5Oy+HLtjIHefVu8YYMjo/8nGOQY+
	 wJuYtxELqktrTNvSMRIeFZzgmIkks3Vh3A22u9DcOQdU6rnUI4pHDHMus2U08BHh8szZB
	 xEWFNR7TaBl67jEnLvMUQjxRqZWGnMW/yRQ9nUoEvd7kwbic8ida+rO9UJTXl+PWPcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109579;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=408CZNgbLQ8mEh8jmzB8JUYt71yKpzRFl09iXo1hCSw=;
	b=wBFT+flmOlBfLnp3baACEsUiGzxFGsmXFsHsA53ZPYGqsLuoJ1RFqXy/zmvJnQD0YDvD
	 +oz6QQjhtITLW1OzoaAZbUCgKg6eun7qg8WcFRggFXxMhsuBBQq6iFQ01V51Cf1fIM0pb
	 ctMspY0C9kWM1IY7E4OSw7RpllydGV29qvo8Vxn5pvP8OWeJ0agQ4s3xitLLYQLxIdSyp
	 A1rwESScaACTjweDPbUk4se47JBbEZSg2EOuz+j2hQsGRhbP8WDlTUNxvxgNJ9N4MDHrA
	 +HtfUGBMVRnU0QjZE0gKhf0L1y0WoD29uDXLpQVF4k8+Z+IMHypDRv05h72wIsQmZDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="k/u6Xc+/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D27606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k/u6Xc+/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5566A1F01825;
	Tue, 27 Oct 2026 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793109578;
	bh=408CZNgbLQ8mEh8jmzB8JUYt71yKpzRFl09iXo1hCSw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k/u6Xc+/2AwjjirJOoljUkiIuEI2sOPR6VL7JcqufPlX0FYbAo85q7HdWP6BndS1L
	 BvkbO5DL4OZW3q/2xr+j4K4yBLgpKiGa4WAbbFVwMqm3GeYiQh22OOylls/vP7TReb
	 CaPVvJw6APfguBRO4Bit8eum+y0G5I5utJmJQicM9es3LbA7ZXjLm48j0EVf8XlMzM
	 kAn/ZSevF/feJI8b0pv5zRh1jRDU9+y8FBj+KhbnoG++M/l3mNwchhHQX5KW5fwvWW
	 iqxsoCtuHW1xmcop+y0T/H8eyVMfXHR37zTOh4ITG7E4R8G621vK8Edr+JydhRPlpf
	 ENEu8baAcpfkA==
Message-ID: <sashiko-outbox-186677@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: add lltc,ltc2387
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolae-Daniel Deaconescu" <Nicolae-daniel.Deaconescu@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027134409.76824-2-Nicolae-daniel.Deaconescu@analog.com>
References: <20261027134409.76824-1-Nicolae-daniel.Deaconescu@analog.com>
 <20261027134409.76824-2-Nicolae-daniel.Deaconescu@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 13:59:37 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: iio: adc: conflicting uint32 type for adi,gain-milli
- [Medium] dt-bindings: iio: adc: lltc,ltc2387: undocumented synthetic -x4 =
compatibles
- [Low] dt-bindings: iio: adc: lltc,ltc2387: example indentation and proper=
ty order
--

commit 3bc833c852704e956c19734cf54a047dca662012
Author: Sergiu Cuciurean <sergiu.cuciurean@analog.com>

dt-bindings: iio: adc: add lltc,ltc2387

This commit adds devicetree bindings for the Linear Technology LTC2387-16
and LTC2387-18 SAR ADCs as well as the Analog Devices ADAQ23875, ADAQ23876,
and ADAQ23878 uModule ADCs.

> diff --git a/Documentation/devicetree/bindings/iio/adc/lltc,ltc2387.yaml =
b/Documentation/devicetree/bindings/iio/adc/lltc,ltc2387.yaml
> new file mode 100644
> index 0000000000000..f912260c8f790
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/lltc,ltc2387.yaml
> @@ -0,0 +1,138 @@

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - adi,adaq23875
> +      - adi,adaq23876
> +      - adi,adaq23878
> +      - lltc,ltc2387-16
> +      - lltc,ltc2387-16-x4
> +      - lltc,ltc2387-18
> +      - lltc,ltc2387-18-x4

[Severity: Medium]
Are lltc,ltc2387-16-x4 and lltc,ltc2387-18-x4 actual IC part numbers, or do
they represent a board/FPGA topology where four discrete LTC2387 chips share
conversion and clock signals and have their samples packed together by an A=
XI
ADC core?

The LTC2387-16 and LTC2387-18 are single-channel SAR ADCs, and neither the
commit message nor the binding description documents these -x4 compatible
strings. Should multi-chip board or FPGA topologies be described using
standard devicetree properties rather than encoding a chip count into
synthetic compatible strings?

[ ... ]

> +  adi,gain-milli:
> +    description:
> +      Gain of the fully-differential amplifier that the ADAQ2387x modules
> +      integrate ahead of the LTC2387 die, expressed as gain * 1000. It is
> +      fixed on the ADAQ23875 and set by pin strapping on the ADAQ23876 a=
nd
> +      ADAQ23878, so it must match the board. The bare ltc2387-* parts ha=
ve
> +      no amplifier.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [370, 730, 870, 1380, 2000, 2250]

[Severity: Medium]
Does defining adi,gain-milli with $ref: /schemas/types.yaml#/definitions/ui=
nt32
cause a property type conflict with existing Analog Devices ADC bindings?

In Documentation/devicetree/bindings/iio/adc/adi,ad4000.yaml and
Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml, adi,gain-milli is
already defined as uint16:

  adi,gain-milli:
    ...
    $ref: /schemas/types.yaml#/definitions/uint16

Because vendor properties share a global type namespace across schemas in
dtschema, shouldn't adi,gain-milli use /schemas/types.yaml#/definitions/uin=
t16
here (and /bits/ 16 <870> in the example below) to avoid a dt_binding_check
conflict and keep the devicetree ABI consistent across ADI ADC bindings?

[ ... ]

> +examples:
> +  - |
> +    adc {
> +            compatible =3D "lltc,ltc2387-16";
> +            clocks =3D <&clk 0>;
> +            io-backends =3D <&axi_adc>;
> +            pwms =3D <&pwm 0 0>, <&pwm 1 0>;
> +            pwm-names =3D "cnv", "clk_gate";
> +            vref-supply =3D <&vref>;
> +    };
> +  - |
> +    adc {
> +            compatible =3D "adi,adaq23878";
> +            clocks =3D <&clk 0>;
> +            io-backends =3D <&axi_adc>;
> +            pwms =3D <&pwm 0 0>, <&pwm 1 0>;
> +            pwm-names =3D "cnv", "clk_gate";
> +            vref-supply =3D <&vref>;
> +            adi,use-two-lanes;
> +            adi,gain-milli =3D <870>;
> +    };

[Severity: Low]
This isn't a bug, but both examples indent the properties inside the adc no=
de
by 8 spaces instead of 4 spaces, and the second example places
adi,use-two-lanes before adi,gain-milli instead of in alphabetical order
within the vendor-specific property group, which triggers warnings from
scripts/dtc/dt-check-style --mode=3Dstrict.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027134409.7682=
4-1-Nicolae-daniel.Deaconescu@analog.com?part=3D1
