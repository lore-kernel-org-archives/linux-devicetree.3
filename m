Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794121735;
	b=rangB8X3P0FjY9ImOIy435HX0rEwwnfn62kYB6quEhdmFCD7bvPncZe2+wg5olAnENLT
	 YXw55hSlOT1NzVzQOd6CLjge6kxxSdCBCvcdIXozZscvy60dSEDs5/vJ7KWzEww/27d+z
	 V/VwzIM6BCZzjX3CJcaLmOzLbP1dqCE9EgOZOZAU+kWGneYItXSUFAs6yA9ZoSQTIilgk
	 3vEqgOyW7tZDo2L8bNqrLwcqlGubecsVO6O+VmO+N79jc4wCqhDbm1UlgLv5Cn2VwjzXh
	 l3LZJ6+x5fJ2DHlkvZwGPkE3DshbKhv+hbhoTSfyE8cqJpX8/QEcjGq/srxZZF2cheg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794121735;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4aC6Y65FawVLd18fYX+QIdDnmHDg4rv0agcFyygzLQY=;
	b=GSSOeu7siz6jLonSRuNolWLF0Pux9iS5jJ6qEfOoG4WQu1njRTM07ZegJyjruSymCIzP
	 kS8LUa/7z+/XVl/J0A8mPhAKxw6T4E2FmDHk7Y8Cie13E6IEh6XnpOBewqu6cXmaW3V+Q
	 Vm7I3SJghtfczta4W9bQHzbJ4IMv7/kmwnycEEeC1z6JbtyEHELIcUtxwsrMZ6DiURZF/
	 YydcUR56vl0b3r93LapAYZot3z2bRyksfkvZc+EBUUDTrq15yLSEL4yOre3EP9yIxMgu2
	 TqeViL4EcZkDJLzorOZ7F/1LTiLbU5R9eAbmblpXdr8ROsP/sQjmt11KXgGtj0gEkVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSLqVElw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339BD606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSLqVElw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741671F0089F;
	Sun,  8 Nov 2026 07:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794121734;
	bh=4aC6Y65FawVLd18fYX+QIdDnmHDg4rv0agcFyygzLQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nSLqVElw1Nh7iTWoJHxZpXgHTvMO4BfdTs6GvQa3SDGoUkVemlwJO83hkCV5QLgDb
	 dAXQvS7ZR3e/1mBQU/81yX/c+dxhdMqlQ38yFKaT8OOECHnc+CMwF4j6auB11FC/4p
	 xWgx2xOtUm2ux7JVCIxv+hOGzc6npnQ80h33xZhSykEJ6yJtltP1nsv91iWrxLy+4J
	 XVsGhj3gkQhScBuo4Xj0dJXH6rBO/STCPU7SYhqyFD5CtAnqY8Oh9B4zl/9PXAHyJB
	 R6RIHRFNDBwTnqrHTRhA5R4un48/HfxcQiykUMT7J5yMJqmKmRDaOF6BY2IogGXenX
	 AVFt7Vnr8mdeQ==
Message-ID: <sashiko-outbox-203604@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 06/16] dt-bindings: npu: rockchip: add rockchip,
 rk3576-rknn-core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108065917.135194-7-gahing@gahingwoo.com>
References: <20261108065917.135194-1-gahing@gahingwoo.com>
 <20261108065917.135194-7-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 07:08:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: npu: rockchip: unwieldy per-compatible allOf in
  rknn-core
--

commit edf78bc9ce3ec5680602d5af7f88949dc691184d
Author: Jiaxing Hu <gahing@gahingwoo.com>

dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core

This commit adds the rockchip,rk3576-rknn-core compatible string to the
RK3588 NPU core binding and defines per-SoC clock, reset, and power supply
constraints in an allOf block.

> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.=
yaml
> index caca2a4903cd1..2eb9337819e67 100644
> --- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
> @@ -21,6 +21,7 @@ properties:
> =20
>    compatible:
>      enum:
> +      - rockchip,rk3576-rknn-core
>        - rockchip,rk3588-rknn-core
> =20
>    reg:
> @@ -33,14 +34,18 @@ properties:
>        - const: core # Main NPU core processing unit registers
> =20
>    clocks:
> -    maxItems: 4
> +    minItems: 4
> +    maxItems: 6
> =20
>    clock-names:
> +    minItems: 4
>      items:
>        - const: aclk
>        - const: hclk
>        - const: npu
>        - const: pclk
> +      - const: aclk_cbuf
> +      - const: hclk_cbuf
> =20
>    interrupts:
>      maxItems: 1
> @@ -54,9 +59,11 @@ properties:
>      maxItems: 1
> =20
>    resets:
> +    minItems: 1
>      maxItems: 2
> =20
>    reset-names:
> +    minItems: 1
>      items:
>        - const: srst_a
>        - const: srst_h
> @@ -75,7 +82,36 @@ required:
>    - resets
>    - reset-names
>    - npu-supply
> -  - sram-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-rknn-core
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          maxItems: 4
> +        resets:
> +          minItems: 2
> +        reset-names:
> +          minItems: 2
> +      required:
> +        - sram-supply
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 6
> +        clock-names:
> +          minItems: 6
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          maxItems: 1
> +        sram-supply: false

[Severity: Low]
Would it be cleaner to split rockchip,rk3576-rknn-core into a separate
binding schema document?  Because RK3576 and RK3588 differ across clocks,
clock-names, resets, reset-names, and sram-supply, sharing this schema
requires loosening the top-level properties and overriding all five of them
in a per-compatible allOf block.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108065917.1351=
94-1-gahing@gahingwoo.com?part=3D6
