Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687237;
	b=eYPLIJdGvpq1ly8DX+pIv0mM52pR0Ns2bRpsw4F2ETAy5IhhPvZPkVzrxPplFkV7YTnt
	 Rn+s8DIqUfhhz5RU0EsTo1T+btusNk82BAZajSxG11w2nsFZAyyJ0CowErWn4alKmz/85
	 xGrBx4m77MYVHRJ9mCqj6bFRxzo9xFDRSKjC02Bn/yNZG7JylFpv0wv38mC00iJLLHaoM
	 /R5oEePWcbBHuOeV8i3SY06gErBRXI5YwJ5NZNXJ+V8IfdPs2R4qkGOik8juXkLoFtZLL
	 GLdn0h8d/s7knQwVu+TBtfA3l9pdqVrMUtDaiQziPSat9FQ5XLfGIqByeJQroQJkV+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687237;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DKL5sAfHpiJGQB7WbkuVw+MHrxtr2DCEknvXEisVFZ0=;
	b=TC2lbmgle5g33+5ebI4kKPY73mqq0xlsyo67apr0wreOapEdTMSNmbqO/46bSF0RTPsZ
	 d0+aih9JOgPQviA2DagTTPdiLFJJDYdXdm1hZ7aGKArPE8pCIoCk9z5PfpGGXjWrqb3NW
	 SbbFnmROPpLjNoh8z2/sVW2Xs9uoRJfSdENBYLR05GyBBs7j7CNBJdh4t1V/oFQL+Qaub
	 pso7wpJSEmjj+ATFm2yT/QEtWZ2SrS9R1riJuvVNxuR3Kxmnc1Z+b5rNuCllC4dWUrtE0
	 0HpcL2NL1fhi56pQGQRXRBtQexfhskRo5ZyzsIse96Bf0kxjphWGO7oyLlAa0brtB1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LpAIlENJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08528606A330
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LpAIlENJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF671F000C4;
	Thu, 26 Nov 2026 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687236;
	bh=DKL5sAfHpiJGQB7WbkuVw+MHrxtr2DCEknvXEisVFZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LpAIlENJrK461faPajAJy3PCDO4v+hYJD0d4JeAEKUzC6fkAXN6sLiqjqk0HgiC97
	 t1ggveDEN72VWPgU3tsqsFL62HONpRh5EDawc0MY+bAuxV6ALYU0OS6P5vqYW77V/V
	 6U+t936fUk9/8Hj/ZmsmnCmR8gTHfQuK2UXL8riiQjhuoM5uhOXG85bHnPggMPRQE2
	 SNaT99tddyLIBM41ed8UWNNJT2NenbIbMkPePUgbRKejkuEXjVvW2MaUbf0QXmwqxK
	 7pIiAFFcNgISLvf5kDC2gEe2nERnwfEhEUAaC0XH6+peDo/c+FsLLd3g2X79a+ZPyY
	 HhlMkP6z/omGg==
Message-ID: <sashiko-outbox-235218@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: iommu: arm,smmu-v3: Allow a clock
 and a reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-smmu-v3-pcie-pd-v4-1-c340c2dbd1d2@gmail.com>
References: <20261126-smmu-v3-pcie-pd-v4-0-c340c2dbd1d2@gmail.com>
 <20261126-smmu-v3-pcie-pd-v4-1-c340c2dbd1d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:00:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: iommu: arm,smmu-v3: clocks property placed after
  interrupts
--

commit da36018f8d6660f4d9d2aa1f6419960b94c2030c
Author: Arun Iyengar <aiyengar1990@gmail.com>

dt-bindings: iommu: arm,smmu-v3: Allow a clock and a reset

This commit updates the arm,smmu-v3 DT binding schema to allow one clock
and one reset property.

> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/D=
ocumentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> index 3c044e4f03d4e..9ab80142a485b 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> @@ -63,6 +63,14 @@ properties:
> =20
>    msi-parent: true
> =20
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Clock of the SMMU's register and memory interfaces.

[Severity: Low]
This isn't a bug, but in DT binding schemas the canonical property order
places clocks after reg and before interrupts.  Should clocks be moved
above interrupts in this schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-smmu-v3-pc=
ie-pd-v4-0-c340c2dbd1d2@gmail.com?part=3D1
