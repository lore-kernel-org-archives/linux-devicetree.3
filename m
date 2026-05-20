Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D333D4F8
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259053; cv=none; b=Hmmi3pv5PFHIMD2321GR0IPES5m8gtArNse3bz/7Gtx/umzBICiFf/H7ZdhG1pSwmRF9QtCpAYfHXDtd0G4OidrPLwQkezt9ZXXVDJdQ2bC1Z/uEnfaHSsPbMzaGqWDu632Y6/xLPdnvfarLS3Y8rdKNuvipSsxoXH5R0gAf5Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259053; c=relaxed/simple;
	bh=oR5Tie59HxqNRibtRMe23ShsTfWkYxM+gw0bQURF4ek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LydG8oGEWiecVkbyHuVOP+hyBi8+AdfSawTGpE/O406lHiXekBt6FpysPh/2AWHIqSFvWmkSeSPGOadqC5MMjFinqbBbqxRM1Vcwm/lj/CQIDJ8V/Y7IiXwJf4CSSUzjchhJ6YDAToWw4hQXEzmctIjZVCEbZJKfi8mQceTC39I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGSEGCih; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGSEGCih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB98D1F000E9;
	Wed, 20 May 2026 06:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779259049;
	bh=OBrTj7/CXHn3VUxK9XD/uq3BmclSnzpRpuLBSM/H4B4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EGSEGCihdaSNHyNXiQ8iZpE7P0B7UYM0fz9symeBVraTftRyl/zDgzfr2XeakibdT
	 IhzU4bcBBR/05s/GvliABS3jZGDlFIuU3C+CSpD1D8VLpp54gE49fikEVk8gsyL15k
	 wPOgwtZMvvWmVj6pydlqtCmE+h2720vgtprtEcdzu7UZgKMUSL7pS88wBT1FzZ1Xm3
	 xCddrUweRhgRZgYYeIVkDnK0K6dpehEtzfUy8FIFoXm8N5yQDb/2+gEJWrdTi0MBg5
	 uVvmAJJiCK9ALqYpmqTcLk+rZo9WxyJ0o8P0/fX+PAPZ49UtkOe/9My6WKpc1KuzsS
	 y3Ur5KJSkxRsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260520061855.1623468-4-fustini@kernel.org>
References: <20260520061855.1623468-4-fustini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 06:37:29 +0000
Message-Id: <20260520063729.AB98D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing Schema Constraints for Hardware Variant
--

commit 171e0844b229701117691d7ea692a719866e79d9
Author: Nicholas Piggin <npiggin@gmail.com>

dt-bindings: iommu: riscv: Add bindings for Tenstorrent RISC-V IOMMU

This commit extends the RISC-V IOMMU binding to cover the Tenstorrent
variant. It adds a second register range for machine-mode (M-privileged)
registers such as PMAs and PMPs.

> diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/D=
ocumentation/devicetree/bindings/iommu/riscv,iommu.yaml
> --- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml

[ ... ]

> @@ -75,6 +88,31 @@ required:
> =20
>  additionalProperties: false
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - tenstorrent,riscv-iommu
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: IOMMU base registers
> +            - description: Tenstorrent IOMMU machine mode registers.
> +        reg-names:
> +          items:
> +            - const: base
> +            - const: machine
> +              description:
> +                Region containing platform specific MMRs for machine-mode
> +                configuration, such as PMA and PMP registers.

[Severity: Medium]
Should minItems: 2 be explicitly specified for the reg property in this
block?

Since the top-level schema allows minItems: 1, a device tree could
provide only a single register range and silently pass validation if
the tooling does not automatically infer the minimum items from the items
list within the conditional block.

Additionally, since the Tenstorrent variant introduces a second distinct
register region, should reg-names be added to a required list within this
conditional block to guarantee the regions are always properly disambiguated
by software?

> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520061855.1623=
468-4-fustini@kernel.org?part=3D1
