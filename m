Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2357E3A1A55
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 22:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778281082; cv=none; b=Vxeo0p/DI4nW3CUDcniFfgfNOO7ByXjUzcNu/E34UcanFP0GnsUr8jKsd16F2zJuvBcpkU1qkaFPr/6+XJM1eUkaD8lCN7WBeNrqvzqLt/zK8FzfxXl2jFSP5WwOSS6Vmxh5DsKLpiSWMGrQJ24f0DjlVz2/+Q+TX6GwIUMPKoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778281082; c=relaxed/simple;
	bh=EvjmBmTgXhr4YvlsAfobvyXZg8+4CPFyDcWDiipdlxU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Av2YIO9BAnIH10UPPs4abCxe2RL3xrCO45LNwf6LQVI1t+xNifeodtFBCZrL7VjvZIwOk7RunNZmBquSOhB0id+6euV1s1zhLQDxA3DOBK+sDGOonAFfvtdXtn2gRQdEjy9UmnjW2+PcKqktjObG9sDirQNYj4BFtkFeAnOFhRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2Q13hhl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2Q13hhl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8012FC2BCB0;
	Fri,  8 May 2026 22:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778281081;
	bh=EvjmBmTgXhr4YvlsAfobvyXZg8+4CPFyDcWDiipdlxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=N2Q13hhlBRweJJe9RqFqT8eYryg/OMaDyPc4dz0AcZFFHqGapLhoII+7Q7t9zUVWS
	 zp2eHI3uCUjaDbijYEiypBaHFA/jHeZyIi5GXO07fpsqikXyUVckY9bs5RDi4GcA+z
	 qEQg9BZvIvzzHoOwJiZgIx0TkVFvxkiqtvhR2b6iPZCOZ3GGGp4AcZxRrBgoDjUCli
	 65d/vPOEe4Ygte9sKBWah88qAJUOQHPsRYiER4eYFkvcYHai/cK68aPTz5nmQNEak2
	 9TPAhUAsa0xv2XH4rfadS4e1yaiND/AUYyBtIu4/7G6LPs760fRRZj90ARcBNmDFWo
	 eu5PRf28WU0cA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/8] media: dt-bindings: add rockchip rk3588 vicap
Reply-To: sashiko@lists.linux.dev
To: "Michael Riesch via B4 Relay" <devnull+michael.riesch.collabora.com@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508-rk3588-vicap-v4-2-6a6cd6f7c90b@collabora.com>
References: <20260508-rk3588-vicap-v4-2-6a6cd6f7c90b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 22:58:00 +0000
Message-Id: <20260508225801.8012FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The patch removes the `items` definitions from the `clocks` and =
`resets` properties but fails to make `clock-names` and `reset-names` requi=
red.
- [Low] The `ports` node uses `additionalProperties: false` alongside a `$r=
ef`, which violates the dt-schema meta-schema and will cause `dt_binding_ch=
eck` to fail.
--

commit 9cfb752de7e6c8e4e818ef36f9918a2d0f7ec9d8
Author: Michael Riesch <michael.riesch@collabora.com>

media: dt-bindings: add rockchip rk3588 vicap

Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit. To
that end, make the existing rockchip,rk3568-vicap documentation more
general and introduce variant specific constraints.

> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vica=
p.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> index 18cd0a5a53181..897ed00c239bd 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml

[ ... ]

> @@ -26,37 +32,23 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    items:
> -      - description: ACLK
> -      - description: HCLK
> -      - description: DCLK
> -      - description: ICLK
> +    minItems: 4
> +    maxItems: 5
> =20
>    clock-names:
> -    items:
> -      - const: aclk
> -      - const: hclk
> -      - const: dclk
> -      - const: iclk
> +    minItems: 4
> +    maxItems: 5
> =20
>    iommus:
>      maxItems: 1
> =20
>    resets:
> -    items:
> -      - description: ARST
> -      - description: HRST
> -      - description: DRST
> -      - description: PRST
> -      - description: IRST
> +    minItems: 5
> +    maxItems: 9

Since the items lists are removed here to allow variant-specific counts,
does this leave the sequence of clocks and resets unvalidated if a device
tree omits clock-names and reset-names?

Because clock-names and reset-names are not added to the required list,
device trees can omit them entirely.

Could clock-names and reset-names be added to the required list, or could
the items lists be moved into the respective if/then blocks to ensure the
expected sequences are preserved?

[ ... ]

> @@ -67,8 +59,15 @@ properties:
> =20
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false

Does using additionalProperties: false alongside a $ref here violate the
dt-schema meta-schema?

The dt-schema meta-schema forbids using additionalProperties when a $ref is
present on the same level, as it does not account for properties evaluated
by the reference. This results in a build-time validation failure when
running make dt_binding_check.

Should this be changed to unevaluatedProperties: false instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-rk3588-vic=
ap-v4-0-6a6cd6f7c90b@collabora.com?part=3D2
