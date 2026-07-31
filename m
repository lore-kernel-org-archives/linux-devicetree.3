Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43870445AE2
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513685; cv=none; b=EIjSwJeQoKkaW7pDnUxUp8U+S2vjlXOlp+itQz/YPZkkghw6xue/5VUEy/iMn6pXuAzqwLeHcUZh5CRHWHdJpVfZ6vKjdoDKhpRpvRs5goeqt5t5FSctOoW5D0/g+GI2yQfWC/+VdPzkKVjKjnzTWqz51Ja90hG7rDxCQH35Fzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513685; c=relaxed/simple;
	bh=EMj8oTwjyml6VnTEKS9QrKvLGDpxHDABXaAwqLFW5dA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vE6fymF/S7rBxMqVH6wn0Kx8ughC5rmQ6bmO3cxYwlYyxt76pH5TaGkfDtZLTmXr8CLxYc1mOPOch7JNKrM1w35wrpGr3FgXt1FBbjxsQSd085SXA87ZqMHpOf2EHalqiNBv6zh9qfEA8vF19w1lIroSwRBkPsGstS2X6C1eWII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNaFbKQC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNaFbKQC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924011F00AC4;
	Fri, 31 Jul 2026 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785513683;
	bh=vtE+5Ut7yiyr8V3Q1M4T+6/nEUeb7NcXoX+zzHlfKJ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LNaFbKQCUdCs1LKy1SCZVD6AH4JRwqugybg7pgCKpSb5rWFYB6Y4NY7NVklAmmZ5r
	 H68TGDijt7aCIKwDO3a1aeDe123JkMLIJ9nJ1pOcqmC/seoSy5M/Sm89gHH6I3yT9L
	 4O5Toro3eQx9maIDD/CqWJDuLgB1R8mGqUQmJDs7FEsm751OqT14v60iBk9A0FkTcf
	 FMGGihur9d7Zyi//6xheTuDJCGaME6z1PCwjadhxTjQZJAKWvW6cJUInz3fyoyS1SK
	 9NRfZNU0Nf+RBCXANt+KvLlMZsBhZmzP7EZwrMn75Pk3CPpdYcqlRSHGH0KSDcfUdH
	 6tepv+Zy7dDyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
 <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:01:22 +0000
Message-Id: <20260731160122.924011F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using `fixed-layout` directly on the partition node merges the NVM=
EM provider and layout concepts, violating NVMEM architecture and breaking =
modern runtime layout parsing.
--

--- Patch [1]: [PATCH v9 01/10] dt-bindings: mmc: Document fixed-layout NVM=
EM provider support ---
commit 9b7b4f5fdbeee58fc9a0bd8fb5f052592d78dc38
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

dt-bindings: mmc: Document fixed-layout NVMEM provider support

This commit allows an eMMC hardware partition node to describe an NVMEM
layout so the partition can be exposed as an NVMEM provider. It adds
fixed-layout as an accepted compatible string on the partition node.

> diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Docume=
ntation/devicetree/bindings/mmc/mmc-card.yaml
> --- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> @@ -38,7 +38,9 @@ patternProperties:
>      properties:
>        compatible:
>          contains:
> -          const: fixed-partitions
> +          enum:
> +            - fixed-partitions
> +            - fixed-layout

[Severity: High]
Does allowing fixed-layout directly on the partition node break the NVMEM
layout parser?

The NVMEM core's modern layout parser, nvmem_add_cells_from_fixed_layout(),
calls of_nvmem_layout_get_container(). This function hardcodes a lookup for
a child node exactly named "nvmem-layout".

If the layout is placed directly on the partition node rather than in a chi=
ld
node, this lookup returns NULL and parsing silently aborts, preventing the
NVMEM cells from registering.

[ ... ]

> @@ -86,6 +88,25 @@ examples:
>                      read-only;
>                  };
>              };
> +
> +            partitions-boot2 {
> +                compatible =3D "fixed-layout";

[Severity: High]
Will the NVMEM cells defined under this example silently fail to register at
runtime?

Because there is no nvmem-layout child node, applying the fixed-layout
compatible directly to the partition node merges the provider and layout
concepts. This violates the NVMEM architecture expected by the parser.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-block-as-n=
vmem-v9-0-f72935817dbf@oss.qualcomm.com?part=3D1
