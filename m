Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C3433FE26
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952219; cv=none; b=kGBlBGPu6kG3CVLcFqVPyKAhP7m6VQElH1VEg6+YC/WBLt2RuqAh/E42/2kUjCkyLyBWNLhMzip4N8F1cQKdUEii8ve30fANXeoSrJf3OWHzkXb7LymODx62kTc0gbf401nEHQ2mPgUBHatXecc4oNnTEVIvAos6NQpZB0VXWlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952219; c=relaxed/simple;
	bh=w3ha7YjNduI1AW8Dcfd7Z6Pr5K1W/HkLNo9EMz5Nk/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eAQjQvjDGClyzbd/lORDzlj66g0CDEIBJtnOAn7jomGX39tggbJxBfj82JhKgsBZDfX3wFQh0SE9yi7YCgzERQHr1Z1A/Xd4uhqUZyiYyZ5TRNKNCdh6M6WGep5DlZxpQFmZU21zTccGwcO4lZgUipruhFl2cD9ka989lPI/KZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkRq9JxG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkRq9JxG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB031F00893;
	Mon,  8 Jun 2026 20:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780952218;
	bh=p+pAnaFYz4LN3/gr9gxLKS0x4nm8jM9VUUABQYDAC9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OkRq9JxG2huXGaW6AbS2G6OR1s8/F1A7C1hD0uBoCeyQvnIwEBUPgNMULZ9K5qAcm
	 2MQCfb3jiiyhReXua2PI1uDKzfmeOjHmDfqlYLeOlqX/irIJ0UUsc9lzroedqwNPy0
	 a7kNMjxMg5Zt+TuTF79un9/5e3LYmJDPQhvDzCzgg78lq54AAqx3gx1Oub9CSzZHZo
	 k7XQ8HBSV0DCAmEDzp4ewIE4VQK2nLy4PrMRhRqE8x13CPvIhXDun+hr2YwJJ3No3p
	 Xgh6DgA8nGjhZ+EXKWhYhJHKinIQJCbeJOKacqcAQbF8+m0fuWF2Oubd5rBTb8UW/N
	 K1jZn7eMmCYwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] ARM: dts: ti: Add specific compatibles for SCM
 conf nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-3-4eba9ec1212a@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-3-4eba9ec1212a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 20:56:57 +0000
Message-Id: <20260608205658.1CB031F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete refactoring: Several SCM conf nodes still retain a st=
andalone 'syscon' compatible string.
--

commit f27db69296633e59ec29af047a99e08ea07397ae
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

ARM: dts: ti: Add specific compatibles for SCM conf nodes

The commit adds specific compatible strings to "syscon" and "simple-bus"
nodes in TI OMAP device trees. This addresses device tree binding
requirements that "syscon" must come with a specific compatible, and also
resolves contradictions when used with "simple-bus".

> diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/t=
i/omap/dra7-l4.dtsi
> index c8d325b0f57b2..9df7648c4b793 100644
> --- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
> @@ -64,7 +64,7 @@ scm: scm@0 {
>  				ranges =3D <0 0 0x2000>;
> =20
>  				scm_conf: scm_conf@0 {
> -					compatible =3D "syscon", "simple-bus";
> +					compatible =3D "ti,dra7-scm-conf", "syscon", "simple-bus";
>  					reg =3D <0x0 0x1400>;
>  					#address-cells =3D <1>;
>  					#size-cells =3D <1>;

[Severity: Medium]
Does this patch miss other standalone "syscon" nodes in the updated files?

In arch/arm/boot/dts/ti/omap/dra7-l4.dtsi, there are other SCM conf nodes
that still only have compatible =3D "syscon", such as scm_conf1@1c04:

				scm_conf1: scm_conf@1c04 {
					compatible =3D "syscon";
					reg =3D <0x1c04 0x0020>;

and scm_wkup@0:

			scm_wkup: scm_conf@0 {
				compatible =3D "syscon";
				reg =3D <0 0x1000>;

[ ... ]

> diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/=
ti/omap/omap4-l4.dtsi
> index 4c78a0b28fab3..c1afc49f456cf 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
> @@ -681,7 +681,7 @@ omap4_pmx_core: pinmux@40 {
>  			};
> =20
>  			omap4_padconf_global: omap4_padconf_global@5a0 {
> -				compatible =3D "syscon",
> +				compatible =3D "ti,omap4-sysc-padconf-global", "syscon",
>  					     "simple-bus";
>  				reg =3D <0x5a0 0x170>;
>  				#address-cells =3D <1>;

[Severity: Medium]
Similarly, arch/arm/boot/dts/ti/omap/omap4-l4.dtsi appears to retain
a standalone "syscon" compatible in its scm_conf@0 node:

				scm_conf: scm_conf@0 {
					compatible =3D "syscon";
					reg =3D <0x0 0x800>;

This same pattern of skipped nodes appears in
arch/arm/boot/dts/ti/omap/omap5-l4.dtsi (scm_conf@0) and the sibling file
arch/arm/boot/dts/ti/omap/omap2420.dtsi (scm_conf@270).

Should these nodes also be updated to fully comply with the
writing-bindings.rst requirements?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-n-dt-bindi=
ngs-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com?part=3D3
