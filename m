Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3011E19D092
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866652; cv=none; b=l7jCfXtxdXaG41VCZtmWEeYj0s/7++9bDJ4Nwz7bXPc+gm2Awu8kgphpWlA6dyT9tNHBGZJKCdXlbdRHRTvN84e1xzdQwhL8JxksirG6G8sZJSVKa/MxOBhRYbVyHZ6JR20l/mzoXHfhKJyRossXDOY3l0b/IeU6Dwg+QKPWusw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866652; c=relaxed/simple;
	bh=qa++woPKzYNeEvJ/48W99TbEdvx7Td6TBZc/QYqF/0s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nWSyFZNposPJ5KD9Q25GcNl9nAyjAJajzRuZNVDm1f9FwIPxhkhD+KpKsRf8CkWvv4HweFqb1OFDiitseSOfd5W1Jz9o0HxK8NPvJpL770Mo0iDkoL4j2gF5PxDLDhF2U1y4yu50wgt19Lsa60dyJIMeszymY5nEhxbMH8Fo+TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWZ4c4VU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWZ4c4VU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE121F000E9;
	Fri, 19 Jun 2026 10:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781866650;
	bh=6bWz2r9c8jz2qGryRs8xH5ugDD189e2j0a8pPFoyCKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gWZ4c4VUVWnnBGNKGq+mDuSfROEf6ArASXZ+kbp7oPPyGj6yQUdgce0YUcXru+dGO
	 GQxsDOYH87elXWWMGHXMTzHs9NqZCLRQKaRPfQsIchX53C+0y+sDux+cMNUxbNXgNv
	 aSeNdzp6FuXqEE/wT5kBu4egK2wDfCjGjt8bi+eQcdL5XEMXSX7Qv/pIGcCQkeL+Vx
	 tQ3iGEsaXbk8tjOnidXkeVafaCG5v3gyX7FhdT0VIzoew+3RTJWgs/9wER5arhALmB
	 zAZ9FD91Q1bQIGSJK0nNBkL97h6+1OmSh5Xebaftb3sJGgE06csmYwmnTIG14lZson
	 Ie0iRejEmPZYg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chien Peter Lin" <peter.lin@sifive.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260619105834.1277302-2-peter.lin@sifive.com>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-2-peter.lin@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 10:57:30 +0000
Message-Id: <20260619105730.9CE121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The descriptions for the newly added RISC-V Worlds ISA extension=
s use placeholder 'TBD' text instead of a valid specification commit hash.
- [Low] The newly added multi-letter ISA extensions `smlwid` and `smlwidlis=
t` are not sorted alphanumerically.
--

commit 16fbfa5650f850f6481cd820aa9d7deb379f7452
Author: Yu-Chien Peter Lin <peter.lin@sifive.com>

dt-bindings: riscv: Add Worlds ISA extensions

This commit adds device tree bindings for the RISC-V Worlds ISA extensions.
These extensions are used to tag transactions with World IDs that hardware
uses to enforce isolation across execution contexts.

> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 2b0a8a93bb214..1bc8b1aa67c06 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -193,12 +193,35 @@ properties:
>              ratified at commit d70011dde6c2 ("Update to ratified state")
>              of riscv-j-extension.
> =20
> +        - const: smlwid

[Severity: Low]
This isn't a bug, but are these extensions placed in the correct alphabetic=
al
order? Multi-letter extensions are typically required to be sorted
alphanumerically, and "smlwid" appears to be inserted out of order relative
to other "sm" extensions.

> +          description: |
> +            The standard Smlwid extension for M-mode control of lower
> +            privilege World ID via the mlwid CSR as ratified at commit
> +            TBD ("TBD") of riscv-worlds.

[Severity: Medium]
Is the "TBD" placeholder intended to be kept in the final binding? Device t=
ree
bindings usually require a specific commit hash to reference a frozen or
ratified specification.

> +
> +        - const: smlwidlist
> +          description: |
> +            The standard Smlwidlist extension for M-mode control of lower
> +            privilege World IDs via the mlwidlist CSR as ratified at com=
mit
> +            TBD ("TBD") of riscv-worlds.

[Severity: Medium]
Does this also need to be updated with the actual ratification commit hash
instead of the placeholder?

> +
>          - const: smstateen
>            description: |
>              The standard Smstateen extension for controlling access to C=
SRs
>              added by other RISC-V extensions in H/S/VS/U/VU modes and as
>              ratified at commit a28bfae (Ratified (#7)) of riscv-state-en=
able.
> =20
> +        - const: smwdeleg
> +          description: |
> +            The standard Smwdeleg extension for M-mode delegation of low=
er
> +            privilege World ID control to S-mode via the mwiddeleg CSR, =
as
> +            ratified at commit TBD ("TBD") of riscv-worlds.

[Severity: Medium]
Is the exact specification commit hash available to replace the placeholder
text here?

> +
> +        - const: smwid
> +          description: |
> +            The standard Smwid extension for M-mode World ID control via=
 the
> +            mwid CSR as ratified at commit TBD ("TBD") of riscv-worlds.

[Severity: Medium]
Can we include the specific commit hash of riscv-worlds here instead of
using the temporary text?

[ ... ]

> @@ -262,6 +285,12 @@ properties:
>              ratified in RISC-V Profiles Version 1.0, with commit b1d8066=
05f87
>              ("Updated to ratified state.")
> =20
> +        - const: sswid
> +          description: |
> +            The standard Sswid extension for S-mode control of lower
> +            privilege World IDs via the slwid CSR as ratified at commit
> +            TBD ("TBD") of riscv-worlds.

[Severity: Medium]
Is the placeholder expected to be replaced with the actual ratification
commit before this is merged?

> +
>          - const: supm
>            description: |
>              The standard Supm extension for pointer masking support in u=
ser

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619105834.1277=
302-1-peter.lin@sifive.com?part=3D1
