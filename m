Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792937505;
	b=HdtN1gU0GzwsmwIHLwGELczBee32FeCbihisjPybkWBw80zufdLOqIq1H1vJJCi43Ohw
	 a4C4ryIRP8qK3j6dCx5TsYvzc0dHhulDnb8TKs4jqQCw8MmkkRDeNexyNMB97Wv76lkok
	 0/i7qv2bQEwunz8svKwHz+YLx3cZhwITGPALU+wdsXr36ixe3vKbMJ463K0z2/AgsoV5f
	 mo8g16KK298m6f3XbixkvCT+lYuWCokLAA49mLAlXHwh3Lx0K+qSrutOHqtOd1hcM9quM
	 whQ8RpZB0iiLpkyLwEXix92Jf0f0m0keO3Wa2D41X0fiwnM8zO5+AOVN5eqT4a5VbFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937505;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=llJsrECdkDpfrBeXb0WwCvFAtT1r0Hc3ZJY96YDwlI0=;
	b=t5WNC8k/EVGRABxZeCjI7xSNR8p5EpreTjsIggb4vStTVTQ8jmlf1KOnHo/eH17JeWzq
	 cG3qQJXXQ5KJFi9/uIpyyKgcGIy6RYrJwwDzexORhkqKntDp6mQwz6rD9jJNaUtwZVM8S
	 on6RZALQpGa5xGObZehD52CHhemkE/HDPRsFmUFpQexVbsxctH100zu41pqXj2RWfZ3s6
	 ElSGYBf1MyZfSFMxII2e/dF/goOHe8xS1tnnFlQcb09/aiSamkJ59enXppVWxMxcneLXL
	 4ltBq8FhSkxZzn2PUs1lcRXvTGpbZTpPCiua34azvWOrHVpMPS9l50L01IPNQX1R0HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cmkjsu+J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB1B606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 14:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cmkjsu+J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86DB1F01825;
	Sun, 25 Oct 2026 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792937505;
	bh=llJsrECdkDpfrBeXb0WwCvFAtT1r0Hc3ZJY96YDwlI0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cmkjsu+JWLlcp48VUTqrLkCwE4+wptBuqE+8UGIJc9pW8o3/Ai03dXYn6NPoHU8LX
	 nmKepymOntrD0nPI+vjWvidGbtBMMVny3sHCyykU8at5mvcz6LN6WGhfUDM1k+ZH5x
	 DfzkxGIeEOMtTkMXGNZf60Q66L9wKzMT3jX3XaYaiUDgGcjGRN94Iydcr8qtSiN7lF
	 JSKL/eQLMKqsJlDyfhsNEjLzUexvcSnE7zG5ELpPYuNpIEckSPBw/a8+PadvgbfRDx
	 KIEmJvKIboWCVFBJcHk+2MNiEF0sEdgepLIdIk4iwnIq5ishZz5/oru9Z7GAQRv2n5
	 6IBsKxEx3AJrw==
Message-ID: <sashiko-outbox-184241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: mmc: ingenic: Add the X1600
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261025140325.73204-2-olivier@mgcrea.io>
References: <20261025140325.73204-1-olivier@mgcrea.io>
 <20261025140325.73204-2-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 14:11:44 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: mmc: ingenic: dmas and dma-names required for ingen=
ic,x1600-mmc
--

commit 43640170e1ca344d80f3c0f4831c11fa293a023e
Author: Olivier Louvignes <olivier@mgcrea.io>

dt-bindings: mmc: ingenic: Add the X1600

This commit adds the ingenic,x1600-mmc compatible string with
ingenic,x1000-mmc as a fallback to the Ingenic MMC device tree binding
schema.

> diff --git a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml b/Doc=
umentation/devicetree/bindings/mmc/ingenic,mmc.yaml
> index bb4e0be0c8935..6b26a17982f37 100644
> --- a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
> @@ -25,6 +25,9 @@ properties:
>        - items:
>            - const: ingenic,jz4770-mmc
>            - const: ingenic,jz4760-mmc
> +      - items:
> +          - const: ingenic,x1600-mmc
> +          - const: ingenic,x1000-mmc

[Severity: Medium]
The commit message notes that the X1600 MSCs have no request lines to the
system DMA controller and use their own integrated DMA controller instead.

However, in Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml, the
top-level required list still unconditionally includes dmas and dma-names:

required:
  - compatible
  - reg
  - interrupts
  - clocks
  - clock-names
  - dmas
  - dma-names

Won't dtbs_check fail when validating X1600 MMC device tree nodes that
omit dmas and dma-names? Should dmas and dma-names be moved to a
conditional block under allOf so that they are disallowed (or not
required) when compatible contains ingenic,x1600-mmc?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025140325.7320=
4-1-olivier@mgcrea.io?part=3D1
