Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB643DB649
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883401; cv=none; b=Qjj2K3RSfVz8Ps/MXVPO333CfJNdqutQHX59Fas2zVNMlzGsyZSb146sMZ7VBhBh8fHLMYBJJqKkkILV6bKxddCiFa3P2L0hmsklvq6sPzfhwU3jDrDwLNcmozE6pH6p3tAYjoqrpf6/EqjaxPiGGb/31K+Va2UD1TRR525jFAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883401; c=relaxed/simple;
	bh=bOV95BQdIusGOpa5Rng/9tELd3mSRdddwd6FkuvaPfo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ugF+00CTvq3gLbS9L1gHJO+RTfPr6P0cXJothfyRj1zk1vTT4MeDg64kU9ygmWKmFl2jDzVS0DhdBKcBz+w+9IvdgS3yJv/iitAIbY8TgDzp7cGFzlEWnxq3KbCw3GBsyrMdlZBq6i6xBmE72UE0Ub6ybYQ8x5U8t/MsTJu4iKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+tSUcVR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+tSUcVR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E841F000E9;
	Fri, 24 Jul 2026 08:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883400;
	bh=8E/ty29O6sKPiZsT9cZXyKOSb+tquv4ZO5wVxgzTjxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S+tSUcVRZJ6obkaSgWGxSLhz5y6mlNR6Odaxc6CZdp7l7chUqY/TbGbOu9u5HE/Gp
	 FikcAgUSjWyi5dYWWq3NKbff3wcK/s8f2E35fBYdZK+OZdMTXPI8NdHeuZcn14gsoR
	 zaM70riUFwWYgmKT8sYvr3DuaoZKy7KsEwUAd+tP0hme3dZqyMaVa2EvX8rLtNwHEC
	 SFClt1nFsGodPjajbiJ8Avp+bqieA/Jp2nWVFxCz2uR6OLKCTI0rvvsvF+iHXtgsiZ
	 AWGofqnW0+fWGpUYrnD1L2r0Muft8rV2GpFkGX+mqinPBQC5Sndm+nxQ/7un+1yWNE
	 J/xR68p++CXdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/5] dt-bindings: pwm: dwc: Add eswin compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724084320.1586-1-dongxuyang@eswincomputing.com>
References: <20260724084153.1473-1-dongxuyang@eswincomputing.com>
 <20260724084320.1586-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:56:39 +0000
Message-Id: <20260724085639.A7E841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Strict positional constraint on independent optional resets prev=
ents using only the second reset ('timer').
--

--- Patch [2]: [PATCH v13 2/5] dt-bindings: pwm: dwc: Add eswin compatible =
---
commit 5ab967af16c3b9f7a1cfa80ab82369dd37f82452
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

dt-bindings: pwm: dwc: Add eswin compatible

This commit adds the eswin,eic7700-pwm compatible string to the DesignWare=
=20
PWM IP binding. It constrains the resets property for this specific hardwar=
e=20
variant to exactly one combined reset line, and modifies the base reset=20
properties to require at least one reset.

> diff --git a/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm=
2.yaml b/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm2.yaml
> index 1f9d72f9f3590..c65174e2045a7 100644
> --- a/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm2.yaml
> +++ b/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm2.yaml
[ ... ]
> @@ -44,11 +43,13 @@ properties:
>        - const: timer
> =20
>    resets:
> +    minItems: 1
>      items:
>        - description: Interface bus (presetn) reset
>        - description: PWM timer logic (timer_N_resetn) reset
> =20
>    reset-names:
> +    minItems: 1
>      items:
>        - const: bus
>        - const: timer

[Severity: Medium]
Does this strict positional constraint on reset-names prevent a generic
device from using only the second reset?

The generic compatible allows up to two independent resets, meaning any
combination should be valid. However, if a platform wires only the
independent timer reset and provides a single element array with just
"timer", the dt-schema validates it sequentially against the items list.
Because it expects the first position to be "bus", providing just the
timer reset will result in a validation error for an otherwise valid
hardware configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724084153.1473=
-1-dongxuyang@eswincomputing.com?part=3D2
