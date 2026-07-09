Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFCDF9C0
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601196; cv=none; b=G7Ef4im+9b3xlqWkPuWZR6aDPGZInjxYnn98p4J1r/tqGBSajPqk9a2edfyeEPcljqpj9z3mee5rE8pYAjptDLiMq5lOI5VwzIwcN1vrKTGWNKkKcWrjM4ngjRnz75PEcxYXA9DrPiMkVxKLJu/wcb64VEYy+UvOWVOxFdf73oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601196; c=relaxed/simple;
	bh=1fld66592M7rSQymKZU9c49lbvbSYj8/liNPoHSfAug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bboWNg6PGwxovAd7qxnOOxUsCrN2DcFpOgjJzlhRivZpyHuEwadKPW79h/q4zKVozq6ueWvwQhSjfqjl4um+3wu2PAHenKCjQAp5B+oxTb/eir77UlrNu4sp5wWp6aWTZmWh5rFjDe//v9pQtRmCiRM+YD3AKQJNKrqo07Lxt28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkiBxfsC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkiBxfsC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1971F000E9;
	Thu,  9 Jul 2026 12:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783601194;
	bh=E7xhPjPUMue64RCK01ukbgWofLj4hGjORkv2j47fM/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UkiBxfsC8ujQ3EIyD292bKJjp3gHp+6xCwGsZIk602tyzG6S3072nE/b9uQpQykSb
	 viTGbzSciWmU7u8OxlkLQo3j6fNDwlY7N7CtlSGnRRoZMeZl6XxinGrLPC+//pjjBM
	 d/ryp7Uu3vmqSfwCwpsbP43dbSJGdAVJeh9IL97c37yhiLlq4H5zJVqoGN/0TPX6VF
	 q0PxJfVgJmf8jUM3of8mUI2J2aQlZwS5V2rkQcxHD6qBx/2/PNyiRyL5cnVIBidO5F
	 1p1HslYe0RUNBYli2g6yveQAQN8xijtIjES3AvcQfWTQYfh5Lw92gvBWYwwvndZ6Ii
	 sfaPPVz03GS7w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 12:46:34 +0000
Message-Id: <20260709124634.AB1971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `oneOf` constraint allows invalid hybrid configurations with=
 both top-level `iommus` and a single stream subnode.
- [Low] Unnecessary `#address-cells` and `#size-cells` properties added to =
the parent node will trigger a `dtc` warning because no child nodes have `r=
eg` or `ranges` properties.
--

--- Patch [1]: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add =
vpu sub nodes ---
commit 952135a9f5f9889eefcc3ad627cf18f885374f2d
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

dt-bindings: media: qcom,sm8550-iris: Add vpu sub nodes

VPU hardwares have a limitation where VPU streams are associated with
dedicated addressable address range. To address this limitation, the subset
of stream/s are now represented as sub nodes, so that they can be associated
to the respective addressable range.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yam=
l b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 0400ca1bff05d..bf4d24ce90bd3 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -91,6 +91,51 @@ properties:
>    opp-table:
>      type: object
> =20
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +

[Severity: Low]
Does the addition of #address-cells and #size-cells properties to the parent
node trigger a dtc warning?

Since none of the new child nodes (non-pixel, pixel, firmware, or opp-table)
use a reg or ranges property, the avoid_unnecessary_addr_size compiler warn=
ing
might be triggered during dt_binding_check.

[ ... ]

> @@ -98,9 +143,15 @@ required:
>    - interconnect-names
>    - resets
>    - reset-names
> -  - iommus
>    - dma-coherent
> =20
> +oneOf:
> +  - required:
> +      - iommus
> +  - required:
> +      - non-pixel
> +      - pixel
> +

[Severity: Medium]
Will this oneOf constraint allow invalid hybrid configurations to pass
validation?

If a devicetree incorrectly specifies a top-level iommus property alongside
only one of the subnodes (such as non-pixel), the first branch evaluates to
true and the second branch evaluates to false. Because exactly one branch is
true, the oneOf condition is satisfied instead of rejecting the hybrid stat=
e.

Should the branches explicitly forbid the properties of the other branch to
prevent this?

[ ... ]

> @@ -177,12 +228,21 @@ examples:
>          resets =3D <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>          reset-names =3D "bus";
> =20
> -        iommus =3D <&apps_smmu 0x1940 0x0000>,
> -                 <&apps_smmu 0x1947 0x0000>;
>          dma-coherent;
> =20
>          operating-points-v2 =3D <&iris_opp_table>;
> =20
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +        iris_non_pixel: non-pixel {

[Severity: Low]
Does explicitly setting these properties in the example cause dt_binding_ch=
eck
to emit a warning due to the lack of reg properties in the child nodes?

> +            iommus =3D <&apps_smmu 0x1940 0x0000>;
> +            memory-region =3D <&iris_resv>;
> +        };
> +
> +        iris_pixel: pixel {
> +            iommus =3D <&apps_smmu 0x1947 0x0000>;
> +        };
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-vpu_iommu_=
iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com?part=3D1
