Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626033;
	b=JUCW5jicQo1ZzXgxnIJvNYJYhyv76ZyJdQzo5WtQPdzJ+cK/Y/VtGXb7tYGl8NvFKIEw
	 x/SjjpzS5gKLxk9dHJAVDU7gGDLNkB7nDnvNdyjTFomO1ZITr3rnwzje6YQzbglUCSDcb
	 Wfh6gWHEpylnEF785n0H811keF6gQSZWMEYMmQD+hidgcIg8ypQ7Px6GJkzlk/u8U22LS
	 iCEvOzF2DLH2s9EXMFJhZGcKkayiyHIurEJQwpxWwozsan/T7YBQcjK3PE2gKZuXCKYVV
	 3DJI9hpWigC/NqpjCPhxbuHpV3sw4at4NCFm/RhjWSdYENIHpHlTsZfseEaeil7WTQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626033;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7ejxccbTIVAN32pUGdmV2s8mVSG6ykLKTT51aF4MtYM=;
	b=yCPuuiuUm+JoG4/c6tt0d8FS/EsN4CCvEOBwyqfCQ+hZAoyO1G3jhU+LKigHktfmaL5Y
	 NTyuC4bbw+sKTjX9pb3JRuFX3YjVU2KbscVnTAZJ982HIl7cyZAX9gJ7+s/rqieaSz79F
	 1DYDYE2hxLiKKh0e6jgcjiq/pmGhl7uYur45Oo58PYQNIylQz69vpOxfBo4+X2I1sOqzE
	 7rmDlwUbSlD6rnqeqBcHCssqaPC7EOy6wmddp5Xh5orsV9eodaUUKVN44899T1BgBRDWN
	 7oP77SuEdNc8s2LKnKN1TVWQGrZeClkhhCfP2VssZzBjq6oSlM1Uaba4WeE7Gg7VNgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5XdN+Gc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9735606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5XdN+Gc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371001F000C4;
	Sat, 14 Nov 2026 03:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794626033;
	bh=7ejxccbTIVAN32pUGdmV2s8mVSG6ykLKTT51aF4MtYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B5XdN+Gc7FOPBmPY3s1hUDnAx3lslyv54apNlEEQpCwjBQCLQprW7dfYj5d2UWUAa
	 k17WzNqZLv705ysGFigglApkm98+pdgT/exiEZnZmWVTPiyYzP2LB3M5o+0EguD9BP
	 TVL3t5hUV12mLM5aZwEDOGPoanr+sv0RCa5y2SuV4vkqKf2CNvBz7jQM5QGGrMnmdI
	 r7PiZX4QuayRHi4Vj1jcg7ohHpNeSL2yEvp0GZ00Fy3AStaF0FCM85bMXC9C4j8b50
	 edsSywQO7x28MSrdj4V7Z4XQENeip7RwCEzdgfDg1PBgqvbp8CJolH8WcJ7tDGwtyb
	 aJoDzXtyxERcQ==
Message-ID: <sashiko-outbox-214086@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 06/12] dt-bindings: npu: rockchip: add
 rockchip,rk3576-rknn-core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <381d2bc99486ca312e1d02f482eccd37def29831.1794615323.git.gahing@gahingwoo.com>
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <381d2bc99486ca312e1d02f482eccd37def29831.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 03:13:52 +0000
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

commit a0f34734ea2ccc04a47837d4a01f9cdb7cf55a23
Author: Jiaxing Hu <gahing@gahingwoo.com>

dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core

This commit adds the rockchip,rk3576-rknn-core compatible string to the
Rockchip RKNN core binding and defines per-SoC clock, reset, and regulator
constraints in an allOf conditional block.

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
> =20
>  additionalProperties: false

[Severity: Low]
This isn't a bug, but since rockchip,rk3576-rknn-core and
rockchip,rk3588-rknn-core differ across clocks, clock-names, resets,
reset-names, and sram-supply, would it be cleaner to split
rockchip,rk3576-rknn-core into its own schema document rather than
loosening the top-level properties and overriding all of them in allOf?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794615324.gi=
t.gahing@gahingwoo.com?part=3D6
