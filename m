Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774F031E827
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 02:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780886355; cv=none; b=rE+W49uB7Vwf4lqRWku3Qou47wwQaCGJ7b1wrwUtnBiIOD2hQ9OybFbqQ/F2UQQBvI/GIQ1p6UgSPkNQDr9c9WCx59IgOKMVJdLbQBoCvgLEgeeFij1KSbUdl/cBW87yyHl/bs6fLglWPHlIrGhvCqRj0nr7KTOx3KYt7vWECUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780886355; c=relaxed/simple;
	bh=+XAn5KRRhyG9uPDOu5VAYtgn//0sd/e+s3Icgy1N5qE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LxbfXdNfHkkeLNgDZ5oMnQM8zm+na1Gy2lEhd0io70OVuJ9eqVAlLdxXo15GeTh8vLcY5y45sFGMnY9w3RTxPsxkDaB4k7AJmPpygflCejmAqBlNcw03aC7mdXtMBrIMMf2hSUX67rezZoVkrVmdIIfpCnwhRK3ZAAqb3Li2pFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZGyQmgy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZGyQmgy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE8A1F00893;
	Mon,  8 Jun 2026 02:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780886352;
	bh=By41hwZ3oYMiT9VMiCD6WiaqRF0N5WwwItEnK2Y+1Wg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VZGyQmgyguknXG5iDTq6PQ4qQtOQrt4PKue0CPpZIQcULv2g/Co85tu2QPJYUyGYa
	 hYGa27hE5uIpKCfoQ8aQgsWlWvGT3ZnOCewipBcbwtAX2Yfs7uL5K6NeYXD/LFV1fl
	 jvdjmfeJLQR35KlW7763cHbyxfEA6w6jnnd9tyodelHb/BTetOK7JjB0yZMBFJSWRt
	 p8wjzyVAWWRB9w3IWXqAfxwY5d8vlZiQzE1IKJJubL/GH6M9CE2YwM2DHYWlBbPcIN
	 YFfDrp2Oeqf8G/ogyt/7DEj3cQXsroOSU6TqQBgmaYalmlRJ+4BvSR3s6hkNhI4fzK
	 u4zlvrHIk1JAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608023237.305036-2-a0987203069@gmail.com>
References: <20260608023237.305036-2-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 02:39:11 +0000
Message-Id: <20260608023911.CEE8A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The top-level `clocks` definition retains a fixed `items` array wit=
h descriptions that conflict with the Nuvoton single-output variant, errone=
ously documenting its second clock as `DMA AXI bus clock`.
- [Low] The schema does not strictly enforce the single-output variant cons=
traint for `nuvoton,ma35d1-dcu`, allowing a device tree to incorrectly defi=
ne an invalid `port@1`.
--

commit 5f08249fbf664513d5ae1c658d2a7ebfc4f0b03e
Author: Joey Lu <a0987203069@gmail.com>

dt-bindings: display: verisilicon,dc: generalize for single-output variants

The existing schema hard-codes the five-clock/three-reset/dual-port topology
of the DC8200 IP block. This commit reworks the schema to express variant
specific constraints via allOf/if blocks, allowing reuse for single-output
variants like the Verisilicon DCUltraLite used in the Nuvoton MA35D1 SoC.

> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yam=
l b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> index 9dc35ab973f20..db0260d874c53 100644
> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml

[ ... ]

> @@ -26,6 +27,7 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> +    minItems: 2
>      items:
>        - description: DC Core clock
>        - description: DMA AXI bus clock
> @@ -34,24 +36,19 @@ properties:

[Severity: Low]
Since the top-level clocks property retains a fixed items array, does this
cause the Nuvoton variant's second clock to incorrectly inherit the descrip=
tion
"DMA AXI bus clock" instead of its actual "pix0" clock?

Should the items array for clocks be moved to the per-variant if/then blocks
(similar to how clock-names is handled) so that the hardware interface is
documented accurately for each variant?

[ ... ]

> -additionalProperties: false
> +allOf:

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nuvoton,ma35d1-dcu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: pix0
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: core

[Severity: Low]
Because unevaluatedProperties: false operates globally, any property define=
d at
the top level (such as port@1 in the global ports object) is permitted for =
all
variants unless explicitly disallowed.

Since nuvoton,ma35d1-dcu is a single-output variant, should this block
explicitly forbid port@1 (e.g., by adding ports: properties: port@1: false)=
 so
that device trees with invalid multiple ports cannot silently pass schema
validation?

> +
> +unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608023237.3050=
36-1-a0987203069@gmail.com?part=3D1
