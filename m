Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399DA3B19B7
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506560; cv=none; b=Mh6Pl3dQXhGaCYDFZ4XVeSp/ySf2dHnjcz4LaVke1Cl0Hi74+PU3FTa1Jan/Pw7Hki3pqEzJp+3obwcXSxnjwlKXbfnyIrhI7NtjYVokaz+xglOf+/fNSSnPuPGa9wWV1IhY/G8psaAIrOw5+s2QksGk9/exAtD/ChdUmElvtQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506560; c=relaxed/simple;
	bh=NhDPTq7mXsbUypiWbHR5gFk6IcF+ux19r0TCN6+CMQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fRx9QqMMlmnX1TzHC6muJbM1cdjfNusMcEhpyvsqtdL7Chs9o2IBnthWCrVhEEo1xdOxFjcZI00AOR90sgR1mgFdYVfZaFbwVpfScYAx3HSRRB/mvij/CgCrXEfPnKLeRFKDraRzI9A8+wOGIOq9kpucgjXUFkvNd433FInuig4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XneBRBkH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XneBRBkH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3E21F000E9;
	Mon, 15 Jun 2026 06:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781506558;
	bh=T3LSXmzpTFTRTdihU3q1t/l6ZEL6HXyu5BiFM+333F4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XneBRBkHOo9ZVEpE/4VFLpoHJy9dIn6hqbNRVDwQI+Vxdczxv2WNz+2jadKLIxu34
	 JjYIYwFli7FKKbhV1UOk4odAX1P6iOcB0sc52R4bn1b2Fc9ykIr9hcfhDHx4Cz6d5K
	 B3F6r3MZq8VK0gGsFm86cpOMn9VZ/f1DOcNY6JJLhrTGo96U7siWxgvQhl0pwE3dVY
	 T5d6/ggx3lSlhDlEvf59lIXdlfPU6falTN51XElomK1oK7HfkEbbyA+tsv5SVe4wGd
	 p1MSUlh00EhVditTkzz6r1MGm51ChN+sTiBfCOQIKy+heVgcKpBRSMDFhgQGEalJ/z
	 PrsfseoX+ROzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260615065003.76661-2-a0987203069@gmail.com>
References: <20260615065003.76661-2-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 06:55:58 +0000
Message-Id: <20260615065558.8E3E21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The top-level `clock-names` property enforces a strict positiona=
l sequence (`core`, `axi`, `ahb`, `pix0`, `pix1`) that conflicts with the `=
nuvoton,ma35d1-dcu` variant, causing valid device trees to fail schema vali=
dation.
--

commit 644d6513333f2ad52d35609ed1c0190fdeaa8192
Author: Joey Lu <a0987203069@gmail.com>

dt-bindings: display: verisilicon,dc: generalize for single-output variants

This commit generalizes the verisilicon,dc schema to support single-output
variants. It extracts variant-specific constraints into allOf/if blocks and
adds support for the Nuvoton MA35D1 SoC.

> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yam=
l b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
[ ... ]
>    clock-names:
> +    minItems: 2
> +    maxItems: 5
>      items:
>        - const: core
>        - const: axi
>        - const: ahb
>        - const: pix0
>        - const: pix1
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
> +          items:
> +            - description: DC Core clock
> +            - description: Pixel clock of output 0
> +
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2

[Severity: Medium]
Will this cause validation failures for valid device trees?

The top-level clock-names defines a strict positional sequence where the=20
second item must be "axi". However, the clocks definition for the=20
nuvoton,ma35d1-dcu variant indicates it uses "core" and "pix0".

Since the variant's clock-names block doesn't redefine the items array, won=
't
dt-schema evaluate "pix0" against the inherited "axi" constraint at index 1=
=20
and fail?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615065003.7666=
1-1-a0987203069@gmail.com?part=3D1
