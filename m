Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6B13612DB
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 18:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372204; cv=none; b=RnVtolOlajoJ1dgtHsvAlqlwHpbSnov+jA5kBg6CM1+Yk9Yfp/21wOSW9htMh9HHoKfm/DN7ERCCcQKSnaySrhChn+eQUxBsP8Hodc7TXb+l0aylVmyYjCUN1FOjJVQ42aMBQYs4ZBfsOJLAWQx+kwRlCBROM9z429/xkDgb8qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372204; c=relaxed/simple;
	bh=Ot8m2i8hwYgc+WYz+HK0BC/IOXzpOGQqbfhN2AgKWvw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=guwNEhuqngLkZTmCPSC2KRf9wp53CPzAQLK4wnj6uAKsyZqsvJmj4DaOWpknIYc2XzWkzwTfSuHxmw4qCc3b27/6KitCR/AzwaDwBjL5HdMjZ8eIVGIAkPozbALQK7SPIqcgqADcVG9afcTJnXdKruEbpX1JwodHsy0vnmgOxCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnYD+MDj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnYD+MDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C9D1F000E9;
	Wed,  2 Sep 2026 18:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372203;
	bh=t+eKQwnIaeNdIBp53e7bgrgXK5SZnza78cXrJEMf7sI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RnYD+MDjCpQzQUEaS4wtNo5Ys+tMNNVQe/eG6TOlUZozD0p0+A9WaqUaeev3DYx2Z
	 GaFt15mqJYnLwMcD746+RrtuQpdoh7jfYh1v/6iQj4+PzNanmsklT8ETzSDctQMP/S
	 UcwDEvHyD8cytuyKhIcM7zwA7hjuORxa6bAToSm5xT1h2Wl0keaAxOwyBAJAq1iIga
	 i7ujbVhN73+q3JyWIuCA+ghC+YgydUwCmVqqOLzvgx2b1H4irBYu/hpVFTdNZG+CeI
	 MV/E8ZhEvW8pVbZfTSczJEeE+ffJEE/J12rRjuYErUShPbCJRYfEYlvCaWIpWNv8KG
	 S4aDizC4ENpqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Drake" <dan@reactivated.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-bcm2712-iommu-submit-v4-2-9dbb657578c1@reactivated.net>
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
 <20260902-bcm2712-iommu-submit-v4-2-9dbb657578c1@reactivated.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:03:22 +0000
Message-Id: <20260902180323.54C9D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The dt-bindings example references an undefined label `&iommuc`, wh=
ich will cause `dt_binding_check` to fail.
--

commit 0480841ae8d1ade3732fd370d08a92d5abd7260e
Author: Daniel Drake <dan@reactivated.net>

dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
   =20
Add bindings for the Broadcom BCM2712 IOMMUs and their shared TLB cache.

> diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.y=
aml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
> new file mode 100644
> index 0000000000000..5ca8ce469ec31
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml

[ ... ]

> +examples:
> +  - |
> +    iommu@5200 {
> +        compatible =3D "brcm,bcm2712-iommu";
> +        reg =3D <0x5200 0x80>;
> +        brcm,iommu-cache =3D <&iommuc>;
                                ^^^^^^^
[Severity: Low]
Will this cause make dt_binding_check to fail when compiling the extracted
example?

The example references an undefined label &iommuc. This usually results in a
reference to non-existent node or label error from dtc during validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-bcm2712-io=
mmu-submit-v4-0-9dbb657578c1@reactivated.net?part=3D2
