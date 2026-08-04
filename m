Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73903FBB72
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827135; cv=none; b=ncLebqSJ0Oofzwmhtg+MG6UhM+1LU4KLgzbmr+IlQvk3LVM9y8FdmTtY2OWo5IpheA9wTVSXBqRyp+LOx8UAjxK7+UI8eiZN4VDChotjVgPkC/Hvn8jq6XxRuvY+9XOL29gSGtb7UKLqpCfAUuMGLtWNBFMHXPkINl8l3YeBnOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827135; c=relaxed/simple;
	bh=FvvXZcWBLZ6FydB1iLb/Wue28lfErSnOUq8Pb/SUk9o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tiaqxnpYVAYDWXbCskguJ7fVFnUw3z76oVBqkj3poy2JZx82pWNKmYEphTdsRZV1fFGsuWGrPIABUJ6MRLVsue7UZdFe5TmB0PzqWrfJs6XmpGpc5IMMvCtokpdw8cp2WCEvf9SpewQH28p4nT2mIrUPElat9vpaP+IfQNIjP2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aowexJyV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aowexJyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525341F000E9;
	Tue,  4 Aug 2026 07:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785827133;
	bh=RRoHm4+pv9vGjM/jxUd+G/xmtcVajVG0KdR2FAvk+Ps=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aowexJyVezHnihxTAoZf+R8wXIUoqPd7dtVtpO67wOdYLETgDJiH6cwnp0B8lwcbf
	 qI0S23L8LX+GQ4gsRz9tJVBHF+Z4/XsssnXkL34rWklnUhazmlDkWETiFjunNWqn1p
	 WhXWtxR3wTDcyVN3+foUp7rUKrRR2JocOtXR+kyirv/Fn1MifdFElhqLNvoNJb+r05
	 70tQYOMGVm17VK8YaHsdCcPaNl2hLLef7UdvoN6qgaWrq4SMS0RU1xrf3mEd5RHuQe
	 6LDUYuTuC39172XrOqug6JiTOVdmqBg8qjuTvFqraepHD4rRsgRh8Yj2QhAAfDx4pL
	 JjFgCbBGGBjPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: snps,dwmac: Add
 snps,pagepool-tx-buf-quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803070513.4657-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260803070513.4657-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260803070513.4657-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 07:05:32 +0000
Message-Id: <20260804070533.525341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The property `snps,pagepool-tx-buf-quirk` encodes Linux-specific=
 software implementation details ('page pool' and 'skb') and dictates softw=
are memory management policy, violating the core rule that Device Tree bind=
ings must remain OS-agnostic and describe only hardware.
- [Low] The patch adds a new Device Tree flag (`snps,pagepool-tx-buf-quirk`=
) without any corresponding driver code in the series to parse or handle th=
e property.
--

--- Patch [1]: [PATCH net-next 1/3] dt-bindings: net: snps,dwmac: Add snps,=
pagepool-tx-buf-quirk ---
commit 8d997cfca114fafc51861d3c95f903b66f45af7f
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

dt-bindings: net: snps,dwmac: Add snps,pagepool-tx-buf-quirk

This commit adds a new device tree flag to enable the use of page pool buff=
ers
instead of streaming skb buffers for transmit. This aims to avoid high IOMMU
invalidate wait times on certain platforms.

> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml

[ ... ]

> @@ -545,6 +545,14 @@ properties:
>        Enables the TSO feature otherwise it will be managed by MAC HW cap=
ability
>        register.
> =20
> +  snps,pagepool-tx-buf-quirk:
> +    $ref: /schemas/types.yaml#/definitions/flag

[Severity: Low]
Is this flag used by any driver code in this series?=20

Adding a device tree binding without the corresponding driver implementation
makes it difficult to review how the property is actually consumed by the
kernel.

> +    description:
> +      Enable use of page pool buffers instead of streaming buffers for t=
ransmit.
> +      This avoids IOMMU invalidate wait time on platforms where that cos=
t is
> +      high, with the trade-off of copying data from the skb into dma-map=
ped
> +      page pool buffers.

[Severity: Medium]
Does this description violate the rule that device tree bindings should rem=
ain
OS-agnostic?=20

The terms page pool buffers and skb encode Linux-specific networking stack
implementation details. Should this property instead describe the underlying
hardware characteristics, such as the high IOMMU latency itself, rather than
dictating a software memory management policy?

> +
>    mdio:
>      $ref: mdio.yaml#
>      unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803070513.4657=
-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D1
