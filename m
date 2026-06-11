Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059C4282F3F
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173827; cv=none; b=CNgByQuCMmuBUa/TPVtzPscdiYNjU3Qfj5FjOb/HtzI6fG40ZhkV1yTAk0pUHfU6+/FJEL2JxdHTciuRIqXwYnA6Nm92xydoV515WJXc9f4O+UAmFFSYo0jMYN+tE8d60TmgMDPp+f+r9hktlidIOtFmMu31x0wIGmXrRo1IvPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173827; c=relaxed/simple;
	bh=MNVziRs/XTkFNv2V2kHRJKlcL/afc28woUhHfBM4eW0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LWmFsxNMkN0//3FTl4Fg0szQmjfkc4lNKMIR8wBTqTdvD37lyoW5dB/CgWcz5H5PYmoPNkzsCZEocr8aRbfrgKuec95NNXDsU12FUu22mgEMs4l3wDIa2d92JZr37QrVW0ajRU6sTIAk2be30DYJuj3hhAQQLYEePIN53Tv7IpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ja8V2Zr9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ja8V2Zr9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6206E1F00893;
	Thu, 11 Jun 2026 10:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781173825;
	bh=xrTEWkdpiughuwzgUP8ti9wplAlwmYlUyHghobCDMw8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ja8V2Zr92q9wbuO3X+GkUNBQsKC/gf78xG+VGe401lANEYn2rp2WmdWNlmqHnMGzX
	 FYEp+IVqIf2aXmNhY64RNGtPmpj8D8G3F2hsfgxVMpeo+ftk0fpzCu201n5oZdk6tV
	 ofwn7ED0PrvffU1DEaazyNI1EKhnwqR2N1l5Le6ovhe0LEKu5YCwgVyAq0klgWGU4c
	 fUspyL3vAcBiGg+NHifPNT1nRjt51MDOoNampbKLi+J40Wr/snh5HoNXXTk8HfK0DD
	 MekYzcRevu1tXci5JykNB6FPqkXmoLtdew/oUkyCZJvuSOrqDqP4S6VkCuABDQqWqX
	 zc2y8JBa8vUTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC
 EFUSE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-mt6323-nvmem-v1-1-b5e1b9ce51f2@protonmail.com>
References: <20260611-mt6323-nvmem-v1-1-b5e1b9ce51f2@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 10:30:24 +0000
Message-Id: <20260611103025.6206E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `efuse` subnode acts as an NVMEM provider but fails to referenc=
e the common NVMEM provider schema (`/schemas/nvmem/nvmem.yaml#`).
--

commit 6bc9ae8fe8f4cc07cc7210883f39574a57c6be49
Author: Roman Vivchar <rva333@protonmail.com>

dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE

This commit adds the device tree binding documentation for the MediaTek
mt6323 EFUSE, which is included in the mt6323 PMIC for storing calibration
data.

> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
[ ... ]
> @@ -145,6 +145,23 @@ properties:
>      required:
>        - compatible
> =20
> +  efuse:
> +    type: object
> +    unevaluatedProperties: false

[Severity: Low]
Does this subnode need a reference to the common NVMEM provider schema?

Because unevaluatedProperties is set to false, any standard NVMEM properties
such as read-only, #address-cells, or #size-cells will trigger schema
validation errors if added to a device tree. Including a reference to
/schemas/nvmem/nvmem.yaml# would allow these standard properties to pass
validation.

> +    description:
> +      The efuse is responsible for storing calibration data, such as the=
rmal
> +      sensor calibration.
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mt6323-efuse
> +
> +      nvmem-layout:
> +        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
> +
> +    required:
> +      - compatible
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-mt6323-nvm=
em-v1-0-b5e1b9ce51f2@protonmail.com?part=3D1
