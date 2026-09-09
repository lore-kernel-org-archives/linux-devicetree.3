Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B938434B662
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966599; cv=none; b=Ii/9M+YSVmuPDqWJI5CBnJ/6xZfY3mZ9haKi8GVuKKZDrQtPD4hlkHD2Wxb01i++IwJWCITuqexFE7IkTaptEILlNzTgJLL4+ipNAr7J5Na36BAOSQ2ms0QvuWjdxVXsn3GKyF73MHmlDZu2hEMm3QvbjiYgYQLNYNHbA73QRbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966599; c=relaxed/simple;
	bh=AxiBGSqKfvyWBojfUeEbCWrEBZhYFu0/5oHt+AQks04=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M8EVplfHOf9nUg/ZeqkFQ1MR9kguFqpIJS1RveGl35nTkqI7mPcd9Rb0mkYU0FTIQgbIKaVxmtBANCKAUhXBaU56Oytd8/ElMi+1ShAhSLQQYZRkeMrcuyNzDFV8VlcEu351Vi31a7zraYMXY2hGjVD9FlqJTM5+EG60V2eAfrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lj8x0NG6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lj8x0NG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AB41F00A3E;
	Wed,  9 Sep 2026 15:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966597;
	bh=QF1NYZ+GDugBjhxbjaVDfSE+04XhwSeZE3LibH6+CYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lj8x0NG6GsCy5X5tDu+lMmVE1GA26lm3ZZ6RDu6AYVUV+ioQHAsh9eDmNNQlY9E27
	 aOkFJRyNqtWBFTJxWzxN1SB1sVheah6DbTvasFXHhzfz5vo4g0Y1NOWM7MaJuc21Ye
	 bFC4+9Npl9fgszzkCztU5XJzSeq9fLYezOo4QBqZ5AXPhpAoiU5UrVWaFowEEKBobD
	 5iY1Si2a6uj9ffF+uTzQoFNRm1k6xcphmp7V77uWz8A9yGznHhmOnFgEbudSAj1G9M
	 cMn6wDQahyM+QDSuqoXEZu4p5hSuu/H8Qbx/UtCBVB0tGR56StR7a0WtushYSjQ9LP
	 goAm9Lvaw1z8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/13] dt-bindings: media: qcom,sm8550-iris: Add
 context bank subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-2-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-2-2fe43ae45495@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 15:09:56 +0000
Message-Id: <20260909150957.27AB41F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Missing 'ranges' property in the newly added 'soc' wrapper node in =
the example.

Pre-existing issues:
- [High] Missing matching updates for related Iris family device binding (q=
com,milos-iris.yaml) to address the same hardware SMMU limitation.
--

commit b9e07ce021dac6c49fe1c64b1aac26288fe5cc3f
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: dt-bindings: media: qcom,sm8550-iris: Add context bank subnodes

This commit addresses an SMMU hardware limitation where non-pixel streams
cannot address the low 600MB of IOVA space by moving stream constraints
into subnodes. It updates the dt-bindings example to use the new subnode
format and adds required 1:1 DMA translation properties.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yam=
l b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 0400ca1bff05d..dd80526838f11 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml

[Severity: High]
This isn't a bug introduced by this patch, but this series fixes the
identical hardware flaw for sm8550 and sm8750 while leaving milos behind.
Should there be a matching update for the related Iris family device binding
(qcom,milos-iris.yaml) to address the same hardware SMMU limitation?

The qcom,milos-iris.yaml binding continues to use the flawed dual-stream
top-level approach, leaving it exposed to the SMMU page faults:

Documentation/devicetree/bindings/media/qcom,milos-iris.yaml:video-codec no=
de
        iommus =3D <&apps_smmu 0x1960 0>,
                 <&apps_smmu 0x1967 0>;

When the Iris VPU on Milos performs DMA for non-pixel streams below the
600MB IOVA boundary, the hardware SMMU will fault because the ranges are
not correctly restricted. Video decoding/encoding workloads triggered by
userspace applications will hit this IOVA allocation boundary over time.

The dt-bindings subsystem guide explicitly mandates matching updates for
related files in the same family. While the later driver patch falls back
to the old behavior for platforms lacking subnodes to maintain backward
compatibility, that old behavior is exactly what causes the crash this
series aims to fix.

[ ... ]

> @@ -150,70 +150,86 @@ examples:
>      #include <dt-bindings/power/qcom-rpmpd.h>
>      #include <dt-bindings/power/qcom,rpmhpd.h>
> =20
> -    video-codec@aa00000 {
> -        compatible =3D "qcom,sm8550-iris";
> -        reg =3D <0x0aa00000 0xf0000>;
> -        interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;

[Severity: Low]
Does this soc wrapper node also need an empty ranges property to properly
translate memory addresses for its children?

The patch wraps the video-codec child in a soc node to demonstrate 1:1 DMA
translation. However, a bus node mapping 1:1 memory addresses for its
children must have an empty ranges property. Without it, the child's reg
addresses cannot be translated to the root CPU address space, making the DT
example technically invalid when running standard DT validation tools.

> +
> +        video-codec@aa00000 {
> +            compatible =3D "qcom,sm8550-iris";
> +            reg =3D <0x0 0x0aa00000 0x0 0xf0000>;
> +            interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-vpu_iommu_=
iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com?part=3D2
