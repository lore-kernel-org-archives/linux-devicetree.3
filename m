Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513EE3563E1
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522968; cv=none; b=JWSL17RHJ6PAP7RDXyuZ/UqWA9fM3F6kXnm2Agcf+5/uYiU1ulnC3M2A/Dt+3mXTdamy4LWGQS35B3UmobXmzy4tm4znoiU6xMH8S9FhKZu/X8wCPfd5bPnzhs9CLgBN0J8Z4NSkDQh/tUVEwZgjCp48ZBl/16/DligJMwyqPoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522968; c=relaxed/simple;
	bh=iIivjL/mrVSor4UaVj2Alp1DnnzNa1YPIUFrNWpQVMI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gO0BGd7Ch/uCS4FrKJNdlPpeUoEYhMW9qIW+L15Ui8m3W4UvjSlt3seMeIvyTZVaLAs3ybt9ofU1Qyt3IgmSi7XT0voItCCK/mrqnFYeeaEBSflGwqAjcM0PwbcM+yRNjWbPjyjoW2TaB6isc1hZeK4n6XfQbqJ+b3057/RCZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSKCu6Ed; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSKCu6Ed"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936E31F00AC4;
	Fri, 31 Jul 2026 18:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785522966;
	bh=u+EEKFkx1CvMwxElREtx01YCS+pviy0z1H9BaNNUGXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kSKCu6Ed0tJm/O3UIIhykF/rV0DcQfTEI1flpYnmCGmgB6p10c5jZzUqwH0SU08Te
	 i8JggPzpK69oNwwEjy8+zHsG8QkB9tdxVZ4pYQougE31pBttXs4/+9KJErkhbxpcIs
	 Tz5k0vieK4DqpnKzE7eyB9XBxOAaz4ImQ2d2A3bH+tSrcIAi5tApxGwHsJh2CvJ49X
	 LxLkRxaTn0IU/POJfMqLy+XzPAUyfMRS/CZKJRlfh6MAt34N3PMd9f+DohnCp7CdWH
	 FNIsAx5f8UeOEawH/x1drMwbA50jNkyJrEXth1C3czt9aMJqrobME34aPNdl8K5b1o
	 Py2mQ0TrZZ2mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:36:06 +0000
Message-Id: <20260731183606.936E31F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The newly defined context bank subnodes are entirely inaccessible =
to the targeted `sm8550-iris` platform.
- [Medium] Missing required properties in the common schema's subnode valid=
ation block.
- [Medium] Schema validation conflict for migrated child schemas due to unc=
onditionally required `iommus` property.
--

--- Patch [1]: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context=
 bank subnodes to common schema ---
commit f7ccdc698c2e9a5f1a41568fd6c456d9da607bec
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

dt-bindings: media: qcom,venus: Add context bank subnodes to common schema

This commit describes each VPU SMMU stream as its own context bank subnode
to associate it with its reachable IOVA range. It adds non-pixel, pixel,
and video-firmware to the common schema, replacing the single iommus
property approach.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> index b21bed3148484..bfd8b1ad47312 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
[ ... ]
> @@ -91,21 +91,6 @@ properties:
>      deprecated: true
>      additionalProperties: false
> =20
> -  video-firmware:
> -    type: object
> -    additionalProperties: false
> -
> -    description: |
> -      Firmware subnode is needed when the platform does not
> -      have TrustZone.
> -
> -    properties:
> -      iommus:
> -        maxItems: 1
> -
> -    required:
> -      - iommus
> -
>  required:
>    - compatible
>    - power-domain-names

[Severity: Medium]
Does the unconditionally required iommus property in this file break migrat=
ions?

Since the common schema makes iommus optional when the new subnodes are
present via a oneOf block, if a platform like sc7180 is migrated to use the
new subnode layout (dropping the parent iommus), it will fail
make dt_binding_check because qcom,sc7180-venus.yaml still unconditionally
mandates iommus in its local required list.

> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.ya=
ml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> index 59a3fde846d21..ccae41bed757b 100644
> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> @@ -47,6 +47,50 @@ properties:
>      minItems: 1
>      maxItems: 4
> =20
> +  dma-ranges: true
> +
> +  #address-cells:
> +    const: 2
> +
> +  #size-cells:
> +    const: 2
> +
> +  non-pixel:

[Severity: High]
Are these newly defined context bank subnodes accessible to the targeted
sm8550-iris platform?

The commit message notes this limitation applies to every VPU generation and
specifically mentions fixing an issue on sm8550. However,
qcom,sm8550-iris.yaml does not appear to include a $ref to
qcom,venus-common.yaml and sets unevaluatedProperties: false.

Would adding non-pixel or pixel subnodes to the sm8550 device tree result in
an immediate validation failure because the properties are undeclared in the
iris schema?

[ ... ]
> @@ -55,4 +99,11 @@ required:
>    - memory-region
>    - power-domains
> =20
> +oneOf:
> +  - required:
> +      - iommus
> +  - required:
> +      - non-pixel
> +      - pixel

[Severity: Medium]
Should #address-cells, #size-cells, and dma-ranges be enforced here when the
subnodes are used?

The commit message explains that adding the subnodes requires these support=
ing
properties on the parent video-codec node. Without enforcing them in this
oneOf block alongside non-pixel and pixel, device trees can omit these
properties and still pass validation.

Could this cause of_translate_dma_region() to fail or return incorrect IOVAs
at runtime if the properties are omitted?

> +
>  additionalProperties: true

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-vpu_iommu_=
iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com?part=3D1
