Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078400;
	b=da2A0DWzASKMx5eb+Vjoj7Hyu4l9gPJ3QeYjM3OyqLVrpG1aOpPaeCxrcdeyZt+V1clu
	 U5ciFb/6t199FHtIvAUNkg9nBq/dPbGRMcU7gbBIBr/q4nQgkOS70hPbqAaK6IhOxZxwy
	 P1uGY6wiENTMEstGT89z70JZ/+Zl9dBB+jaJBQGpTarqrEJzH7Nfu60Ls5tAh/fH1HqH3
	 iAmk+cfd5dYOKDseiAETJjFpfiZX4caC20f1mT0ZpaTrLwCXpmncpmJEi8Jyk2Bp2hp8W
	 wB8gJTbv+zIR3Ho9EF7dEp2PGvg+egRflvVASE1kxdPMOMa5QUh4c1sGdv7fxoz3GFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078400;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s/mO4xxLeeo1cl4ncYIKjqt7Mr3lBDgAOP1dwP3sW48=;
	b=Mam/p4eERosO89JmA1TQzjjXz/wjmTHoB2Ybz6wSND/oWNnPaV6nfW58ML1hzyK7jlen
	 46Kyv1PFWMT3n8sF48EAOAcdavm70I6VYc6vNCbW3Jl12CUlpcGES2o4upEnn9casBTX8
	 yz/Bu2ej+vf1QtmeeP0835cX2Ao6gbWJ8//GzOQff6bmaWHMeAR9nr4+x6nhwWPBrVd/8
	 QBkZBaKOhhIeduhuxQU5h54iHqJ/GmU0PrW1WV652CquvAVVZfYteE+xEWSy09VMDXdmm
	 NQzfqIssniAyAk0xPn0wLBIwvf46+ECBrtM7sf5qmzLDoVmoazm9BUoKK8nnQyvk/ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g+15G17H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B138606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g+15G17H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8611F01825;
	Tue, 27 Oct 2026 05:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793078399;
	bh=s/mO4xxLeeo1cl4ncYIKjqt7Mr3lBDgAOP1dwP3sW48=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g+15G17HzTba77vCZzKSJDyOERQe7O2xb7v9596/n++sjyi0nLeavO3D1F5RlT7xF
	 kkC1d0oq3LBijwV3BGQzLBUoyvYcXw3KfYEjE0S5eFNpjEVjGY9dvCsocnU3f5MlzU
	 iVEmH5W92bC2GJPcBKZ1818iyG4QPtAfCKLrAeN/gtHVfMVRD94x0JFhp/mPb1Pxwo
	 njwc84KubFVj3WweoHkEnpUiiafrIieJl/UfTCQO+CDupoahhLtHdSUAbyVkyW0tSI
	 3tnb42FuZqmJc79qMW7/AdAELM/bHIAP9GOwsWn/f3KflFIW9zxUkhrkEISdD65NiG
	 Lng+Zrfo5ZDnA==
Message-ID: <sashiko-outbox-186108@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: add Giantec GT9764 camera
 lens actuator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261027051048.213177-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261027051048.213177-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261027051048.213177-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 05:19:59 +0000
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
- [Medium] dt-bindings: media: i2c: raw register values and required delay =
in gt9764
- [Low] MAINTAINERS: GIANTEC GT9764 entry inserted out of alphabetical order
- [Low] dt-bindings: media: i2c: properties out of coding-style order in gt=
9764
--

commit 80388585d1ff4bac6d88529ce264488610410998
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: media: i2c: add Giantec GT9764 camera lens actuator

This commit adds a Devicetree binding schema and MAINTAINERS entry for the
Giantec GT9764 I2C lens voice coil actuator.

> diff --git a/Documentation/devicetree/bindings/media/i2c/giantec,gt9764.y=
aml b/Documentation/devicetree/bindings/media/i2c/giantec,gt9764.yaml
> new file mode 100644
> index 0000000000000..febffa359abbe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/giantec,gt9764.yaml
> @@ -0,0 +1,71 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: giantec,gt9764
> +
> +  reg:
> +    maxItems: 1
> +
> +  vddio-supply:
> +    description: Digital I/O supply.
> +
> +  vdd-supply:
> +    description: Actuator supply, independently switched for the lens.
> +
> +  giantec,aac-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 255
> +    description: Module-specified AAC mode configuration (register 0x06).
> +
> +  giantec,aac-timing:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 255
> +    description: Module-specified AAC timing configuration (register 0x0=
7).
> +
> +  settling-time-us:
> +    minimum: 1
> +    description:
> +      Minimum interval after programming a lens position before issuing
> +      another position command, based on the lens module's damping respo=
nse.
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddio-supply
> +  - vdd-supply
> +  - giantec,aac-mode
> +  - giantec,aac-timing
> +  - settling-time-us

[Severity: Medium]
Should this binding reuse or extend
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml instead of
encoding raw 8-bit register values and a required settling delay in
Devicetree?

In the Dongwoon/Giantec 10-bit AAC VCM register layout (covered by
dongwoon,dw9768.yaml and drivers/media/i2c/dw9768.c for dongwoon,dw9768 and
giantec,gt9769), register 0x06 is a composite register packing the AAC mode
selector in bits [7:5] (for example, 0x40 =3D 2 << 5 for AAC3 mode) and the
clock prescaler in bits [2:0] alongside reserved bits [4:3], while register
0x07 encodes the vibration period count. Exposing registers 0x06 and 0x07
directly as giantec,aac-mode and giantec,aac-timing with maximum: 255 puts =
raw
register bytes into the DT ABI and allows reserved bit combinations.

In addition, settling-time-us is redundant with the AAC mode, clock prescal=
er,
and vibration period parameters, from which the driver can compute the move=
ment
delay directly (as dw9768_cal_move_delay() does in drivers/media/i2c/dw9768=
.c).

Listing giantec,aac-mode, giantec,aac-timing, and settling-time-us in
required without defaults also forces every board DT to specify tuning valu=
es
even though the hardware has power-on defaults for registers 0x06 and 0x07.
Could this use optional, constrained properties with defaults like
dongwoon,dw9768.yaml?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        lens@c {
> +            compatible =3D "giantec,gt9764";
> +            reg =3D <0x0c>;
> +            vddio-supply =3D <&camera_io>;
> +            vdd-supply =3D <&camera_af>;
> +            giantec,aac-mode =3D <0x40>;
> +            giantec,aac-timing =3D <0x7c>;
> +            settling-time-us =3D <7000>;
> +        };
> +    };

[Severity: Low]
This isn't a bug, but in properties, required, and examples of
Documentation/devicetree/bindings/media/i2c/giantec,gt9764.yaml, should the
non-vendor-prefixed property settling-time-us (if kept) be placed before the
vendor-specific giantec,* properties, and vdd-supply before vddio-supply, to
match the natural sort order in
Documentation/devicetree/bindings/dts-coding-style.rst and
Documentation/devicetree/bindings/writing-schema.rst?

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c9..4c6aacb8487a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10867,6 +10867,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
>  F:	drivers/media/i2c/gc08a3.c
> =20
> +GIANTEC GT9764 LENS VOICE COIL DRIVER
> +M:	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/giantec,gt9764.yaml
> +
>  GALAXYCORE GC2145 SENSOR DRIVER
>  M:	Alain Volmat <alain.volmat@foss.st.com>
>  L:	linux-media@vger.kernel.org

[Severity: Low]
Is GIANTEC GT9764 LENS VOICE COIL DRIVER inserted out of alphabetical order=
 in
MAINTAINERS? It is currently placed between GALAXYCORE GC08A3 CAMERA SENSOR
DRIVER and GALAXYCORE GC2145 SENSOR DRIVER instead of between GFS2 FILE SYS=
TEM
and GIGABYTE WATERFORCE SENSOR DRIVER.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027051048.2131=
77-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
