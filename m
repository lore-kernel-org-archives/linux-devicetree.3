Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872D44A3D5E
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167242; cv=none; b=LCGIOpWFCXMWpc97R4JbZgtX1K/Oe/Ve5X71kxq+ZlPwQ05Ex5iniWoM4Fw7HlYgsyjhPwoOakmCBJb9oQSObd71wSjkDN7bhL5TBFTM2rtZYcWY4nIon/rV2SxIEm3AxAwfo5JZmIHiH/Y6ctHVr/B00SRvb8GMMb0pBB7r/54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167242; c=relaxed/simple;
	bh=3hRXbJasXoM81czqjR7eGpw1dGLycd23pv6neYBlHAg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CEx6mGdf45CObsO1xMPKrN35IiA6DWPY/FLAeeImfG49NuZ/6Mu2p9XN6V6oWktyLLiLsX/4ycl3nYCk99lcGyYuquOuSFUgb6mCRLFBTjMB0EbHn/3vQprKoHYwrPorlKUti8+xy9bfQ6UJrZXjPQEjIljFkcOEHy7xAZWvZgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmX9vIhH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmX9vIhH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6D71F000C4;
	Fri, 16 Oct 2026 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792167240;
	bh=M0F+riEqn8NEjDeHBauwvhCI6l7wpn8Dg+H5KuMKm+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lmX9vIhHvHItEylsXw8lmgbDW9/kwqm1dG2bNBd0ap4WHIkVns+7vmfY3w1XG9wtI
	 lnfsda5U9Duqz8DKxUZYxg2wpsd+9TaLLhXomU6gew1nRcm1YZyy3vT0zLbHnCqs6o
	 JErPXyTa9JVe8QE0yzpatVJb/vlKO7BIRv0s5AEvyk+Y/s32ELtRWx7m5ecU4TjWMm
	 jVZEiOd+zC+uB26nOiDTTWBBB2hQwDjNtFfYCPPMVMcevvg9SgsTO68melUouwaBqs
	 9yUCigz/9AGQlmJlQ7u2v1Lcnv4m7PvgKgqHfvzHxmrw3LUQ/DXFLv5j8sdcXUDgec
	 bd2EZNrHQGxBQ==
Message-ID: <sashiko-outbox-174613@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: gpu: nvidia,gk20a: Require the fuse
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016160700.3831336-2-sashal@kernel.org>
References: <20261016160700.3831336-1-sashal@kernel.org>
 <20261016160700.3831336-2-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 16:13:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing minItems: 4 for nvidia,gm20b makes fuse clo=
ck optional
--

commit ce5f108aa60b7d673901db80f95bfdff4aaaa9a2
Author: Sasha Levin <sashal@kernel.org>

dt-bindings: gpu: nvidia,gk20a: Require the fuse clock

This commit modifies the nvidia,gk20a binding to make the fuse clock
required for all GPUs in this family. It specifies the exact order
of the clocks depending on the GPU compatible string.

> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Do=
cumentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> index 4d856a8b674c5..af0ada6e02557 100644
> --- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> +++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> @@ -86,6 +80,39 @@ required:
>    - reset-names
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,gm20b
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GPU clock
> +            - description: Power clock
> +            - description: Reference clock
> +            - description: Fuse clock
> +
> +        clock-names:
> +          items:
> +            - const: gpu
> +            - const: pwr
> +            - const: ref
> +            - const: fuse

[Severity: Medium]
The commit message states the intent is to make the fuse clock required for
all of them, but will this schema actually enforce it for nvidia,gm20b?

Because the global schema defines `minItems: 3` and `maxItems: 4` for `cloc=
ks`
and `clock-names`, the array validation in this `allOf` conditional for
`nvidia,gm20b` inherits `minItems: 3`.

A device tree with only 3 clocks (gpu, pwr, ref) will successfully validate
against the first 3 items in the list, making the `fuse` clock implicitly
optional.

Should `minItems: 4` be explicitly added to both `clocks` and `clock-names`
in this `then` block to ensure the fuse clock is properly enforced?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016160700.3831=
336-1-sashal@kernel.org?part=3D1
