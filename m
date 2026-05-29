Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADB2351C2D
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041684; cv=none; b=SdCxSC8x7ukeyVhzDsJT+783CLFPc9oTi1t6DJ0MCTizhokxC3EGco11xTqTyqRfRn5dmsFxab4WbuAtWXL3c7/XJtpOuO0Lez6+S/hIB6wz4gmM2OV2G4PGhKIequlsmfNDruULzbe3KpzBfPz7A2xuIRMYbGWMFk3KWEIMoLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041684; c=relaxed/simple;
	bh=KZnh/sIbmjXot/AG6HYfnrJqekMUpeAZQ7q7WQU2zLk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FayO8F+sIBwsm72ij5kyIr/6eVAmnSAHPNlCZrh2uIDmfZleB7AlhhVXyvXdGNv/BZ/7+8m0sG8swg6odzPHl8rCHSJlYla0HN0wx9paLgRQYddF6nRL4LY3Zwsiz6gSRbIoZQHMak+0IEjGAz1pgmtozenULhv0d+uG+uWOFVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1bbjQyo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1bbjQyo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8FE1F00893;
	Fri, 29 May 2026 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780041683;
	bh=HLonyZMich28Ub0fq8UUYE23Ggx1wcepVCJbL2/RjIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U1bbjQyoLKzlOM8QMMKvbzevKYJ77zwAEmnzaI7cl0cVkINjT9oh903gYhErRD5Nm
	 Dby4pClCXH6Zk+irhLgqVApgwS/f1rrRCD300c/k7HPJBxAS54R9dItP8AuUbYHeYM
	 nHAov7Yt24ybFN+q37XJRZ8H1a2FrIquoFWifvyV8igbP+MaATWx6s+GbfZH9WM3WC
	 DeKvbknERNFWTpWBFTCPQ6bvA6dJ5lOspz5yJMCxfMqMgtq9pPyolNCLxhlB9SmZdt
	 YVqvp7Fgx/fKDJiNhse9htS6/Lmllt83DPREB01WBPzBdWBwLY5WlX9LsEUx4moJOr
	 juvAuS69jWfrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/5] dt-bindings: media: qcom,sm8550-iris: Add
 X1P42100 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wangao Wang" <wangao.wang@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-enable_iris_on_purwa-v8-1-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-1-b1b9670459ab@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 08:01:22 +0000
Message-Id: <20260529080123.3D8FE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing required properties in the conditional block for `qcom,x=
1p42100-iris` allows incomplete device tree nodes to pass validation.
- [Medium] Broken schema conditional matching for `qcom,x1p42100-iris` caus=
es valid device tree nodes to fail validation.
--

commit f911896de9da99ee2b5652949237c15bf6d78f44
Author: Wangao Wang <wangao.wang@oss.qualcomm.com>

dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible

Document the new compatible string "qcom,x1p42100-iris". Unlike SM8550 where
the BSE is clocked implicitly, x1p42100 exposes a dedicated BSE clock that
requires explicit configuration.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yam=
l b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 9c4b760508b50..0400ca1bff05d 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml

[ ... ]

> @@ -115,6 +119,23 @@ allOf:
>            maxItems: 1
>          reset-names:
>            maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,x1p42100-iris

[Severity: Medium]
Should this use "contains: enum" or "contains: const" instead of a direct
enum match?

Since the compatible property is evaluated as an array of strings in device
tree validation, a direct enum match will fail against an array. This could
cause the condition to always evaluate to false, falling through to the else
block which restricts clocks to maxItems: 3, causing correctly configured
nodes to fail validation.

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +        clock-names:
> +          minItems: 4

[Severity: Medium]
Since minItems constraints only apply if the property is actually present,
should clocks and clock-names be added to a required list in this block?

Without them, a device tree node omitting the clocks entirely might silently
pass schema validation, even though the fourth clock is mandatory for this
variant to operate.

> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-enable_iri=
s_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com?part=3D1
