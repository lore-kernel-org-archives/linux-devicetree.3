Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A743955C6
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346916; cv=none; b=Ny7yE5rSl//WZWFZBcSQmssRjH19S3wrJeblqnEJBMmD+5RiSDfpJeBeR37IIN5XDhiHWGfpakRufirm8RKuHhdSAnjJt13lExF8w2rroXSSLO1+0aZio6/ulClMaqLU28VNvuBVk7kA5Reotca/KHrbq4jeCaZYMv+Dw/SYyik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346916; c=relaxed/simple;
	bh=JcRwUjyhHZPVmy/AOkucuDfQud/RlmpabDdbAg+rMTw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XpatlPSLDdBMt50DOj1HoKJnBmmIjU3haz6zLSaDSyaYjRWp5pLyjeV985y24SXFdSaJkFUti2w1Jx+JKEWgye799kRoaIFQMsGFbqstp6R2P46ozUGLLnKgZl2GHzDBeH0GdCT3C2z7fX4yl2yqNE1lt0ewpn3UJCFsTcichoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHisXROo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHisXROo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAA41F000E9;
	Thu, 21 May 2026 07:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779346915;
	bh=2IdMgy3CJBu4Ni8Hf1YP9LH68OOQIC/wOSk3MgD67xw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KHisXROojS948Bz+G+nnYdcmVHAgTlq8iSFNTgBVI7KUUsOUoptlbO4RJj1bsa9wC
	 /nQPYeYyVeAlxhLiC2rHqGZhYlLFFRrV4XxqQx5WYE4jcAesbxSXtypQ+1pWOd2pfl
	 7xbyb8vWE5/vf4DFrCD+a20tWt3XnaQtpipkAQGlwK3lgQbycW/4aJg4tWH1/8jJca
	 vDj/ELf97R9yj448qkHaY2xYPue3rzXrHHCOFa1dmiFfR1R0bypTW9FyIAXbdwz66O
	 zPPQS3A+a4W5nVj4qSd3vPskAvo6W59Ry5nMstCFBTxFtAImZLxemL023mfk/0lDDy
	 91NE+2WeyZASQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521064445.1740782-2-fustini@kernel.org>
References: <20260521064445.1740782-2-fustini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 07:01:53 +0000
Message-Id: <20260521070154.9CAA41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `reg-names` property is missing `minItems: 1`, implicitly re=
quiring exactly 2 items and breaking single-region nodes that attempt to us=
e `reg-names`.
--

commit 4e6445ae92ce6111a15e470ab7f01dc3081a9f0b
Author: Nicholas Piggin <npiggin@gmail.com>

dt-bindings: iommu: riscv: Add bindings for Tenstorrent RISC-V IOMMU

This commit extends the riscv,iommu binding to support the Tenstorrent
RISC-V IOMMU. It adds a second register range for M-privileged registers
like PMAs and PMPs.

> diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/D=
ocumentation/devicetree/bindings/iommu/riscv,iommu.yaml
> index d4838c3b3741f..0ce9f7abd120b 100644
> --- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml

[ ... ]

> @@ -32,22 +32,34 @@ properties:

[ ... ]

> +  reg-names:
> +    items:
> +      - const: base
> +      - const: machine

[Severity: Medium]
Will this implicitly require exactly two items for reg-names?

In dt-schema, defining an array property with a list of items sets both
the minimum and maximum to the length of the list unless overridden.

If standard single-region IOMMUs attempt to provide a single reg-names
entry, will they fail schema validation because the schema expects exactly
two items?

Should minItems: 1 be added to the reg-names property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521064445.1740=
782-2-fustini@kernel.org?part=3D1
