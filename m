Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEAA1448D5
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546499; cv=none; b=Fgw11J0HiRU4c/zlIIVEbB5Q+ktUSc1oeHdxXnmvZ3o6lPTV2MKs0DaflRYgFm/XGYTtkApHFsjShVMMpIFDSpsMUpS2Bys9YYhcD13+PWU3rSg8sNlcIx6ozJ6871pQeXy/JwpTo+CtMi+eN0+i9Zh1xHg/x0wqH5lKjpXHVQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546499; c=relaxed/simple;
	bh=KE+pHmU41z0bNBTcIaf1dP8t/yN5NZBxiC61C6PfGWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KPc3SNVrUcLP6wDlpF2+n4rNmsOqLMJ6rdQWbuHLtqmu4WnYmRhr2Ey6iRtk+X/PmP++aET9Rn2uZ/IYydJbp5yZu/jzO6ZOmGFKBNYWnSHhBtWXm9K6yNs37HvsmAsdD8QvMIm2h1W7VJOOJI/W/OIufcSXDn1w5nvvslc1XA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fpul8qXR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fpul8qXR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20865C2BCB0;
	Tue, 12 May 2026 00:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778546499;
	bh=KE+pHmU41z0bNBTcIaf1dP8t/yN5NZBxiC61C6PfGWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Fpul8qXR4eEK9ZoiwEG/mTn9sunFOjFha1YPT8SycvNpfTRAFyBSlDv98ahh6C3pn
	 /PYEONgyM99ND1/6F/gKI61mBMZsvEJxsJ2brLPVZsMuF/59xOe8NPD0CRho45c3u2
	 EkNFo347skRiWQb1AD0wc9CH0GJsLEsZm9cLFfh2u/Jz4cbjuxXVgvOQLIeekG83ZJ
	 r6yaj+/NLFJ/cyNghRTMsUo6h1P2T3GPB342RvZPMSeZPqY3lJ4alY1d6Jd1MJ/BDI
	 O70PVfulKOtR900H5qgKghFM3sAr6fU0I9nfdKInjAQHHbooUOku6uvCX5ghpaCpGF
	 KCg4S9oJT6Bvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: verisilicon,dc: generalize
 for DCUltra Lite variant
Reply-To: sashiko@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511075142.54752-2-a0987203069@gmail.com>
References: <20260511075142.54752-2-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 00:41:38 +0000
Message-Id: <20260512004139.20865C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Relaxing base schema constraints without preserving them for exi=
sting hardware breaks validation for `thead,th1520-dc8200`.
--

commit 381b44c205709ac6503cee93b907e15828645951
Author: Joey Lu <a0987203069@gmail.com>

dt-bindings: display: verisilicon,dc: generalize for DCUltra Lite variant

Extend the verisilicon,dc base schema to accommodate the Nuvoton MA35D1
DCUltra Lite variant by relaxing several constraints including clocks,
resets, ports, and additionalProperties. Add a dedicated sub-schema for
the Nuvoton variant.

> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yam=
l b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> index 9dc35ab973f20..00884529f8c1c 100644
> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml

[ ... ]

>  properties:
>    $nodename:
>      pattern: "^display@[0-9a-f]+$"
> =20
>    compatible:
> -    items:
> -      - enum:
> -          - thead,th1520-dc8200
> -      - const: verisilicon,dc # DC IPs have discoverable ID/revision reg=
isters
> +    # Enumerated in full so the schema validator can verify any compatib=
le
> +    # string against this list, including those from child schemas.
> +    contains:
> +      enum:
> +        - verisilicon,dc
> +        - thead,th1520-dc8200
> +        - nuvoton,ma35d1-dcu
> =20
>    reg:
>      maxItems: 1
> @@ -26,32 +45,24 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    items:
> -      - description: DC Core clock
> -      - description: DMA AXI bus clock
> -      - description: Configuration AHB bus clock
> -      - description: Pixel clock of output 0
> -      - description: Pixel clock of output 1
> +    minItems: 2
> +    maxItems: 5

[ ... ]

> @@ -75,9 +86,8 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - ports
> =20
> -additionalProperties: false
> +additionalProperties: true

Does relaxing these constraints break schema validation for the existing
thead,th1520-dc8200 hardware?

Since thead,th1520-dc8200 relies directly on this base schema and does not
appear to have its own sub-schema, it seems malformed device tree nodes for
this existing hardware could now silently pass validation.=20

For example, missing the verisilicon,dc fallback string, omitting the ports
node, or containing undocumented properties would no longer be caught by the
validator.

Should the legacy constraints for thead,th1520-dc8200 be preserved via an
allOf if-then conditional block in this file, or by moving the existing
hardware to its own dedicated sub-schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511075142.5475=
2-1-a0987203069@gmail.com?part=3D1
