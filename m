Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DA9522EF2
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 20:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789761875; cv=none; b=uIw6cnLFMxLekNNaIjtj2ybk2i7/y+x2CWQvBUCRFUIPDddWiXKDgdiou8FT+51IWYXJhjStFF67r4FlodaUKhV5zJbOCbWBnAlnrQA6x9KfVtc8X93agYbqwdev6rgfLm03td10VjwQ1HPw/NnSwfb2vpHVhaxVkf8i9o6MEJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789761875; c=relaxed/simple;
	bh=EKASp1JEJ1QJglGL+gt2LxpGeMDjOe++fT2NLJx1uS0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hhHYEwTibG6VqMqOrZfZJzE2u8OKofdILUG2nLQrQFdSDioGL+egqo+T4wMDb5+ovciE95wBIK2P3JEKfOtsY5wKkld4SZmohkKLVOW8atrQCFK3MwnsoAvRSxlOzy6baQZxRwvCRS+b8aMvxp+NS2/IDnomDx6HN8YPSPJgQxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvwRfxov; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvwRfxov"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A811F000FF;
	Fri, 18 Sep 2026 20:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789761873;
	bh=9s+AZJTbHLhivymyIrmopRBtmErp/DZCoLY6+3HgIQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DvwRfxovhtjuE+jBfVoSTT43h3LqE1LfL0ixKoKOhnV+5G5EBcqluUqdfn24/6RR0
	 csij/gyxX1rVNR3l3kxYjhKlKw4zyGLZ+yceC1ZZ5lLlsxC0k3U6Cuokp/ED2lwooy
	 BB8t0FA49WPGywxs8z5jIQn2/7OJf0hLPs8KrqHydia/DFrq/ytrg880PiJPwLTuKs
	 Cy5I/cgZpee8nnXjivctYuKlR7cmdMSeqVzIVtItboE/oatJkeqT1jvAw9QwR3g+Fr
	 4aDWoiZxwnDzNyvrPrdAQ/0t/yYLeP88IKXFtdgITOHg24JDB7/yDtw/dl9PFmtD+A
	 4s7QvDAY3kIIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm64: fsl: add Olimex i.MX8MP boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zoltan HERPAI" <wigyori@uid0.hu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918195559.130443-2-wigyori@uid0.hu>
References: <20260918195559.130443-1-wigyori@uid0.hu>
 <20260918195559.130443-2-wigyori@uid0.hu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 20:04:32 +0000
Message-Id: <20260918200432.C3A811F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: broken compatible string sequence for Olimex i.MX8MP
--

commit fac5462a0966914cfbc1e0773b00c8f06fddde88
Author: Zoltan HERPAI <wigyori@uid0.hu>

dt-bindings: arm64: fsl: add Olimex i.MX8MP boards

Document board compatible bindings for the Olimex i.MX8MP-SOM and
-EVB boards.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 656f2596e1d53..aef15322293e1 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1146,6 +1146,8 @@ properties:
>                - gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
>                - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
>                - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
> +              - olimex,imx8mp-som      # Olimex i.MX8MP-SOM
> +              - olimex,imx8mp-som-evb  # Olimex i.MX8MP-SOM-EVB

[Severity: Low]
Does adding the EVB string directly to this enum permit it to bypass the SoM
component string dependency? It seems this validates a 2-item sequence inst=
ead
of the standard 3-item sequence (Carrier -> SoM -> SoC) expected for SoM-ba=
sed
carrier boards.

>                - prt,prt8ml             # Protonic PRT8ML
>                - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without =
frontplate

[ ... ]

> @@ -1225,6 +1227,11 @@ properties:
>            - const: kontron,imx8mp-osm-s               # Kontron i.MX8MP =
OSM-S SoM
>            - const: fsl,imx8mp
> =20
> +      - description: Olimex i.MX8MP boards
> +        items:
> +          - const: olimex,imx8mp-som     # Olimex i.MX8MP-SOM
> +          - const: olimex,imx8mp-som-evb # Olimex i.MX8MP-SOM-EVB

[Severity: Low]
Does this block enforce a backwards 2-item sequence with the most specific
board listed last?=20

Also, it appears the mandatory SoC fallback (fsl,imx8mp) is entirely omitted
here. Will this cause dt_binding_check or dtbs_check to fail when run on a
properly constructed 3-item compatible array?

> +
>        - description: PHYTEC phyCORE-i.MX8MP FPSC based boards
>          items:
>            - enum:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918195559.1304=
43-1-wigyori@uid0.hu?part=3D1
