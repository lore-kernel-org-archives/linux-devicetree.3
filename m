Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFFB25A354
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 03:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784344760; cv=none; b=a37xoytFz/blagJP4obAYY798XKoSHDLJ0SabyfuG83AYbHdATayJFOSOmLcvj7X6RoH8+JLT7Pz9Az84VA7csu9PoP6j1MHc983Y2U0D7JYOVTbbtpyWahxLQkYZvTfVrBfTFzSawpb6Y3mVz48H1fOrgD7kU6Cdnxbi1YHcLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784344760; c=relaxed/simple;
	bh=DSCNEw/ge/qlO25WBVEbXrCequYrhe2o0VU6FxfRoIU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mY8BFWoDR9MKa2/mW5p8PTcU2AJJh6YelWjs4xSCFOtPRHhe9Qw0k5Ua/FcuI+SqDhc+Xv0hIM3zNTneAxRy8MzMpmvVc3kCc+JYFvF54lt7hckr9UiUnOQkQ8NI28WRZjCNeCXYxIYdOCpWMaEmyAMJnOYOptrAFKM8pYdIU7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vif4lhcf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vif4lhcf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCDC1F000E9;
	Sat, 18 Jul 2026 03:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784344759;
	bh=8hswH5SY+ol+rA06OBext9z9Ry74y5yrt8cC4kWViWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vif4lhcfbkv1BZ1yRL34Ejr94OTSTKCcZuz1bbTWFo3rIOR4XKB6md34tcHHsGv5w
	 FV3Mxu19pSftzbPjLE9pfxQyCXYUYL3u4JWPySkJEVsHbgZaaJLUkC+sEhEZymt8vN
	 KdVg8SaUo/3OM/95oCxCBEaQcM4oDIN4Zw5qtcr3pFXUc+Ggy+NeKAG/bnMLTzC4zQ
	 dANORh+wFHlEDNoeWtQJvUDfsRjAAhvFgMjy+J+t8Vq4W9MyqfoIRWF6Ciwdm7z985
	 nuBdQy+3sFj0hfU+i9nEK25IAiTRsTjnAd6BkbCjviDy70zxdasACfvgISiO/eBax8
	 ESLhGRy6G8T9g==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 1/8] dt-bindings: npu: rockchip: add
 rockchip,rk3576-rknn-core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260718031146.3368811-2-gahing@gahingwoo.com>
References: <20260718031146.3368811-1-gahing@gahingwoo.com>
 <20260718031146.3368811-2-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 03:19:18 +0000
Message-Id: <20260718031918.DDCDC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema allows `sram-supply` to be specified for RK3576 even tho=
ugh the hardware does not support it.
--

--- Patch [1]: [RFC PATCH v2 1/8] dt-bindings: npu: rockchip: add rockchip,=
rk3576-rknn-core ---
commit af7a16605153304ec36efac86040bd1175195ecd
Author: Jiaxing Hu <gahing@gahingwoo.com>

dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core

This commit documents the RK3576 NPU core by adding it to the compatible
enum. It also moves sram-supply from the globally required list to an
if-then block specifically for RK3588, as the RK3576 does not use it.

> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.=
yaml
> index caca2a4903cd1..985cde6b2f523 100644
> --- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml

[ ... ]

> @@ -75,7 +76,16 @@ required:
>    - resets
>    - reset-names
>    - npu-supply
> -  - sram-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-rknn-core
> +    then:
> +      required:
> +        - sram-supply

[Severity: Low]
Does this change inadvertently allow sram-supply to be specified for RK3576?

Because sram-supply is defined in the top-level properties block, removing
it from the global required list makes it implicitly optional for RK3576,
rather than forbidding it.

Device tree nodes for RK3576 could mistakenly include sram-supply without
triggering a validation error during dt_binding_check.

Would it be appropriate to add an else block setting sram-supply: false to
fully restrict it?

>  additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718031146.3368=
811-1-gahing@gahingwoo.com?part=3D1
