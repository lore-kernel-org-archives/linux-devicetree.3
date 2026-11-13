Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606005;
	b=SdQ5d/WbTmScrSBrSeSCNjT0gvLbUwraF+ZDNOFRDJBPYLdngLb6Nu4wJzQq0SXx4mxy
	 H99giwC7utzAe1AeISn/ogM6G2vzMHQWyl28wzSuy7nN7vb6B59ltoZNoASs8n255GLsy
	 pBB95uvUef+HHlkxiP7S1QW6y45kkg9G2pGcfGoB+PfwQ5txey/x9oEx9HN6DcOma1BFI
	 7Mz5uyot9MlrtbLLdhk4eLsW817dx0OBETJGvNJTVJw/2HuAsd/ot6h7AlKlxvwKIkWwa
	 4u5ff1658vAe8fN+l9klPL8+ToLVIRmdzqBq36ZqlJeYKPQPgMlOTeJrMs8+VJoNMZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606005;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zJcfyCif+0I9n6IJDvvZ1QIY2qW1xYC8JSY1Feha7bM=;
	b=5UKuVMtcr9m7ijE/2qr28LxCtPfS/HdHvXawZG7sURDwy0JG81XOoMDn7e6YIiTH8Tm3
	 hi6S4luCM6lGUXKpydGChUScTkmBuhaDN9NQ8t3kHd668N1vXr9CKocvHMAHxyYaktiEI
	 jV0m5jxLGrInoj1FQIun8jflyZxvD6b5wdRQNmKue5JISyG2b1g+ca2noutaO6DxQiJVd
	 EbE91Tz2FIyk2t0+odHvCkM9Fr5qtCfVL5w5UrqWDyg+TABEiwM9MpaZtqhmyZXD7zZpa
	 rY1L0H5EBpPw0a7LdEkNyPA0NcidC55wIOgyidQJuPZ2PUXDnmIU6eydDStM0lR7OBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WbMczjZU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2571A606A8B2
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 21:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WbMczjZU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826EC1F000C5;
	Fri, 13 Nov 2026 21:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794606004;
	bh=zJcfyCif+0I9n6IJDvvZ1QIY2qW1xYC8JSY1Feha7bM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WbMczjZU5MR6WHSSugG1RT/ZL1FxqYZ9uwNDYC/F/yh7JdzmduGoG0MZnUvrk8XXP
	 zrLTYtEGSsv2nf4bmuRnLad31vpwfAqRW0Pk/sZeJ3PyKZU0fcqUtMfeWlpuwA/HNt
	 dZtuT7sSPLF/ITq/dHrMdNvGkPQ1SxQd6/k5eZOUwMx9G/fR5rkFnK05+syKqoicim
	 xMrUCm2y+O2l9OLmhTZ+aqdTgZ90A6tDNvlaEK9Lm5kdd7i6D+Pwhq/ZoTFnJ7miJE
	 zzUees2vo4iKMQkmGr5g0pZ8vwiQCP3aMJvHPuLDVzfYgTWoPUWFJMStzvpJfbvU4O
	 ii30UBCi5MyBw==
Message-ID: <sashiko-outbox-213728@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: dsa: lantiq,gswip:
 add reset-gpios
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-mxl-gsw1xx-reset-v3-1-863e82074893@telaak.dev>
References: <20261112-mxl-gsw1xx-reset-v3-0-863e82074893@telaak.dev>
 <20261112-mxl-gsw1xx-reset-v3-1-863e82074893@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 21:40:04 +0000
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
- [Low] dt-bindings: net: dsa: lantiq,gswip: split GSW1xx into separate
  schema
--

commit 3590cf6c71e15fdb259e4e21a87a5fb546f5d150
Author: Joseph Telaak <joseph@telaak.dev>

dt-bindings: net: dsa: lantiq,gswip: add reset-gpios

This commit adds the reset-gpios property to the lantiq,gswip binding for
standalone GSW1xx switches and updates the RGMII slew-rate descriptions to
note that a hardware reset restores power-on defaults.

> diff --git a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml =
b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
> index 49af5573e452d..89f78a1bc113d 100644
> --- a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
> @@ -40,6 +40,11 @@ properties:
>        - const: mdio
>        - const: mii
> =20
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the hardware reset input of a standalone switch.
> +
>    mdio:
>      $ref: /schemas/net/mdio.yaml#
>      unevaluatedProperties: false

[ ... ]

> @@ -173,6 +180,7 @@ allOf:
>          mdio:
>            required:
>              - compatible
> +        reset-gpios: false
>      else:
>        properties:
>          reg:

[Severity: Low]
This isn't a bug, but would it make sense to split the standalone MDIO-based
GSW1xx switches into a separate binding schema instead of adding more
per-compatible exclusions here?

The SoC-integrated GSWIP variants and standalone GSW1xx switches sit on
different buses and already override or disable almost every top-level
property outside compatible and ports (reg, reg-names, mdio, gphy-fw, and n=
ow
reset-gpios) in the allOf if-then-else block.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-mxl-gsw1xx=
-reset-v3-0-863e82074893@telaak.dev?part=3D1
