Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794730824;
	b=xGE8nShFUXclXdgq7Y/RxdiJnoKi8qXcpqnW0baF+9ac6sTYC8+vzt7+4tNSonfeXRE6
	 tVLI1sQGqssVw3U5NuNQPZ6qWIpmaK9JlEOAmljjEEawLowXqbpAJM3Kubo90sIc/A4ea
	 2+UUJpcNzzhFSg3rsdtn3xmlrm5KWWnfij1NSidARiNTQXh3EpitoIl8imJGtkl6Nf3AR
	 itl2wz4UdpZdexTnEL5Ks4PTxYA5EdEbWNHJjaMczqZSZNE8HXqR2r9xHNkfdquetncHw
	 jQHbkGB4PBZhbpvUTvREAJM3K+x0J2aqgiPiNWNW/6JMFmFGYVzePB57I05hWwB5+tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730824;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wiqRcT68FQsuUkGDmKWpW1mLF08ZDDYilIO/lO/654o=;
	b=KBcPFH36pE6s6urV4RtYZobjC0W6Lx3GUHYhzbd9s2ykFkMQO4Uz4Ind59Ohb0uBCBXl
	 ZdzLU8q9BKWDfSTA4BCiiRe2r0C2CEX0H/P1QuWfMJI1CNLwOl2K9oHe2Mq0b/h8jg5iP
	 fDcRXG1iZXWAogI73ddEQmuwtxHm0U0U2kw5pjJ6RyDYyYUrEHHtfQW+RDTRSsOeM9CwP
	 5ksYDfoq9y70DaW7e6W6+7EEVozjD3f01wI0SHmP6GWW7KVllQdprRt4RIkKfG7Zj6mKP
	 NnQ8lYwbaFfWaQ2AYgHwurw44CnOcMpbgTpwo/Jc7rpJItMRtsb77rT60amM37ApIcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JjWbat6A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804FF606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JjWbat6A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020C41F000C4;
	Sun, 15 Nov 2026 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794730824;
	bh=wiqRcT68FQsuUkGDmKWpW1mLF08ZDDYilIO/lO/654o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JjWbat6APWVJDQuldg4dyoahpWRx3xB1eDmYAfZtts5P4sr4Q2SYUgpuH9Bg3aHZk
	 kHHTBzGH7yMsP/pHMlle9S+Ip1mZP6agjtgsSEMB78ld732oCtyXiav3hqLvbGAaJp
	 xzWWI9jtik2X3AuArbJCLx7/RmSn2QsEd0f6ggh8N60C+D8BNBGBcgdtCHwy+Ls+nA
	 qCNGD7SFHDdreaukEROhGYeY489KX2rwT3bvDskupKQ9Zd1Ipk0AZBh1a/foVftM41
	 ZgRsKRPwQyeJ0VAtNImXbx0ehqLarKaT8GNyuJo/jCtGIk+JezQ8SUjnW2DIGImojN
	 hCJYqW6aBskxQ==
Message-ID: <sashiko-outbox-215290@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: i2c: rtl9300: add 'rtl9607c-i2c'
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Zavertkin" <misha.zavertkin@mail.ru>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <c7b57529342608c59468aef247250aa8f017d5cf.1794728344.git.misha.zavertkin@mail.ru>
References: <cover.1794728344.git.misha.zavertkin@mail.ru>
 <c7b57529342608c59468aef247250aa8f017d5cf.1794728344.git.misha.zavertkin@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 08:20:23 +0000
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
- [Low] dt-bindings: i2c: rtl9301: per-compatible conditional pile-up
  for rtl9607c
--

commit 43c34d3c3c011204c713fd4d1ed08c55685b830d
Author: Michael Zavertkin <misha.zavertkin@mail.ru>

dt-bindings: i2c: rtl9300: add 'rtl9607c-i2c'

This commit adds the realtek,rtl9607c-i2c compatible string with required
clocks and pinctrl properties, and deprecates realtek,rtl9607-i2c.

> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
> index 5873cfdc5b3e0..7c00918f33c8d 100644
> --- a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml

[ ... ]

> @@ -57,6 +61,10 @@ properties:
>    clocks:
>      maxItems: 1
> =20
> +  pinctrl-0: true
> +
> +  pinctrl-names: true
> +
>  patternProperties:
>    '^i2c@[0-9ab]$':
>      $ref: /schemas/i2c/i2c-controller.yaml
> @@ -96,6 +104,16 @@ allOf:
>        required:
>          - realtek,scl
>          - clocks
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: realtek,rtl9607c-i2c
> +    then:
> +      required:
> +        - clocks
> +        - pinctrl-0
> +        - pinctrl-names
> =20
>  required:
>    - compatible

[Severity: Low]
Would it be cleaner to split realtek,rtl9607c-i2c into a separate schema
document rather than adding a fourth per-compatible if-then block to
allOf?

Unlike RTL9300 and RTL9310, which multiplex 8 or 12 shared SDA lines across
controllers and select the SCL line via realtek,scl, RTL9607C has a single
SCL/SDA pair per controller and uses pinctrl instead of realtek,scl.
Keeping realtek,rtl9607c-i2c in this shared schema also leaves the unused
realtek,scl property and multi-channel i2c@[0-9ab] child nodes permitted
for it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794728344.gi=
t.misha.zavertkin@mail.ru?part=3D2
