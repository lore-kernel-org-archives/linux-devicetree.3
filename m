Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CDD36196E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786617750; cv=none; b=s4/JPAWtJg72c4EEWVSbANyh/+HWDDqPWQGlaFfZ4f+gf8M16qArelvLdv3NxLIrwVJJh7MOd1ddgCEfTw/BXpEdPGPmk0awtNgYlzJBtYhcgCTW819ziVF62rVH2/9TXpSKKV1zDqo8XE7tmWr4VOlqJsOc80pCcNq00RiR8/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786617750; c=relaxed/simple;
	bh=LvslOFoyTsYWjz30QWpL3Vsf6PxuJGGQfhwhJk8qFm8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DfX61Y6Rn2f4pkXRSqYD9UcQOxy9YGY1bS7M1chC3uNchk4RjGGSzUV13tRr87GxApmPbJA9uzDXtVq4wZsASdI2oiMt5SEz6+DLpJbmHOb2SeCDoQmdllR+cI+bopC4ELNMpjVSdLuYSkSw3J5jay+AbinaJ9l6UhWLRAtMXgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPzXUagH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPzXUagH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9471F000E9;
	Thu, 13 Aug 2026 10:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786617748;
	bh=LkwPA8TrDvw9HAE94S5TeGSkgdxy2uklzdTSxhyrR90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BPzXUagHU7UOj+zt2KmCBCifkzL687meAFPx4DimlqSkuAfD+Jvy5mDiYmPBx8qwR
	 0ENVrri4W8X2+8YvafT+b3PYuFpYOLMGsOG2dSaeU5JZIVucNklTGtLj7v2b6HtUK5
	 mJngCUHbuC3qDPUL149bcZzsRsSc+U7Ohs9EfQ9/9gyNv21tHgPkJSRnwzOseZLKGm
	 8LVJ+CqqysGPwTBmUCJKK3ZQkj8X1LBbh8yJHecFU/uL6d3PEiewVDWS+yRhRz2b0d
	 asYwRxiVBZNUVTraPnv6McpfJxrVHLU9v2LASbxraFF3Vdj3gPJm0HnhuY0GHuO9+Y
	 MYZMsBv2/B/HQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: serial: snps-dw-apb-uart: add
 ambarella,cv75-uart
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260813-cv75-v3-c-v3-1-9352b3fd6026@ambarella.com>
References: <20260813-cv75-v3-c-v3-0-9352b3fd6026@ambarella.com>
 <20260813-cv75-v3-c-v3-1-9352b3fd6026@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:42:28 +0000
Message-Id: <20260813104228.6C9471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The 'ambarella' vendor prefix is newly introduced in this binding b=
ut is not documented in vendor-prefixes.yaml.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: serial: snps-dw-apb-uart: add am=
barella,cv75-uart ---
commit 09140ea99754febddffd7c03dfcd93c0fffe28fb
Author: Long Zhao <longzhao@ambarella.com>

dt-bindings: serial: snps-dw-apb-uart: add ambarella,cv75-uart

Add the Ambarella CV75 compatible string to the Synopsys DW APB UART
binding.

> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.ya=
ml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> index 49f51b0028795..cec5c679f1a9d 100644
> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -51,6 +51,7 @@ properties:
>            - const: renesas,rzn1-uart
>        - items:
>            - enum:
> +              - ambarella,cv75-uart

[Severity: Low]
Has the ambarella vendor prefix added to properties:compatible been formally
documented in vendor-prefixes.yaml?

If this prefix is omitted from vendor-prefixes.yaml, evaluating this schema
with dt-schema will encounter the undocumented ambarella prefix. This will
cause make dt_binding_check to report a schema validation warning or error
during the build.

>                - anlogic,dr1v90-uart
>                - brcm,bcm11351-dw-apb-uart
>                - brcm,bcm21664-dw-apb-uart

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-cv75-v3-c-=
v3-0-9352b3fd6026@ambarella.com?part=3D1
