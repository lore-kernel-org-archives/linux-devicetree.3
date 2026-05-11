Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986342E0925
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778539938; cv=none; b=r0iHbJS7oGi6HOpiUhFu2my1H9VuDuCJnLUDsibg+CvdBqcKtU/KrqBklFI85bJrA0vlFn5TqB9rgKAL/a7tMsP0sycoJL43OlvHTknJkNTX7QZJ804fcg4OfhaCjIBZKI022ICa5z40t0NG0iIfi5OeKpZOT5i7K/L5TnZ47M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778539938; c=relaxed/simple;
	bh=J1i/6VUaZSLqpnCBmgSruO24HnVbYbJWK3/va8toPrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mEDD+H6qOpoknF1raR7wjBF8S9TMnQtx/pICVzgsI3m1jVIwmq89h2eJPQTcCNhIUzbDvk5/ZWTpnDA+OQpHIpNRDy1cxwZEfnTMLlXne9A9PmLryyAeJczbBqQUt4LEM6P3m383MmIFaG+JnS8QRWpc8HL/onjrDGy9yK+GuyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3Hdq2qm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3Hdq2qm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C550C2BCB0;
	Mon, 11 May 2026 22:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778539938;
	bh=J1i/6VUaZSLqpnCBmgSruO24HnVbYbJWK3/va8toPrM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=O3Hdq2qmTwbCwkT4Qqro/qnKBQT7cNEtzJsGXtQND94PXLl69bFozLG0mpCcAT0SL
	 GVRwtIwCnsaheL4OGsgK2Y8447HGaQu8ti/Mpzo8NoLCJElnvgvuDGXm0wn8TWD2Dg
	 ZyvPqKzisXZXljqEJ5UjmGbtAjjOJj/p2YlVVM1dwNMuApZe6HKa/1CH24Ccp+PiDb
	 MURCipTN0Wimf5GJhV7wFLKRL7U8FGsYetCAQj+/sLeAOtzGX96fp2tlMFS9o9kyjc
	 hVDIwRQmYlNMNyTwMmCI85abcCn0Ww2bHNrjmt+KDrwKH4pOU/c691Dp2AQzpr+S70
	 0dFC99iq39tgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] spi: dt-bindings: cdns,xspi: add sdma-io-width
Reply-To: sashiko@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260511031732.3199-2-jszhang@kernel.org>
References: <20260511031732.3199-2-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:52:17 +0000
Message-Id: <20260511225218.0C550C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added device tree property `sdma-io-width` lacks a vendor=
 prefix.
--

commit 90424bd22513430cb3aefe4494640a5d950b2a77
Author: Jisheng Zhang <jszhang@kernel.org>

spi: dt-bindings: cdns,xspi: add sdma-io-width

This commit adds the sdma-io-width property to the Cadence XSPI controller
device tree binding to configure the Slave DMA data port I/O width.

> diff --git a/Documentation/devicetree/bindings/spi/cdns,xspi.yaml b/Docum=
entation/devicetree/bindings/spi/cdns,xspi.yaml
> index 38a5795589de2..1fd4b6dfd4178 100644
> --- a/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
> @@ -40,6 +40,12 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  sdma-io-width:

This isn't a bug, but should this property include a vendor prefix? Custom
hardware properties typically use a vendor prefix like cdns,sdma-io-width.

> +    description: Slave DMA data port I/O width (in bytes)
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 1
> +    enum: [ 1, 4 ]
> +
>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511031732.3199=
-1-jszhang@kernel.org?part=3D1
