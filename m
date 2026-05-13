Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F2218787A
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778647472; cv=none; b=XsXJTTtvaFDQ4hvDjjIrkudZRY0QQ8FO3r5xHEe3K9uSjyIEyzo6EVByedaTY9hp+3nbHSgdgVhChZFR/Ja+SOJWYCA3i8fnBP5LRjdfeikO3efycByBWItbQy3gW1vRzqSI+W2DQeASVjVuKGsk97qqefkiKrYs5nvSj2XGoSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778647472; c=relaxed/simple;
	bh=t4RtnszXpsDcKjSCAvGTCEstz7b4+VLdZeJQtJ94+ys=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DQANmVY3wzahiUPhRECbtFX0DW2MWKjCwamUXXR1S4eKgNGykbAPbnc9X4ThiTyGUIAO0nDcIl87KCqfEqc52fzNZaErT1oFr/REWb8YF/Gf58cm9/tYCcD2OXHwAwP3H8hKX6tEKUDPl/7MU3LaSDDFYOV38Lurkz5F0vyuXYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUqegIq0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUqegIq0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31A3C2BCB7;
	Wed, 13 May 2026 04:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778647472;
	bh=t4RtnszXpsDcKjSCAvGTCEstz7b4+VLdZeJQtJ94+ys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YUqegIq0WTf2EkK47n9j9vWnuwGOZyHyQY0OPJzauYPPHAYkJ6TksSziQOb54QsIT
	 4FVul56jezddcAfOFHd0XUiwxMblK78NnOAgBN6S8FRRkxecPii6hnKg3bn9pg849m
	 x7CzPtnKd8v26QOpPNx4E49FoWhQKcR2R1WuWEhiyPMA9QjlNCQYr8KW5DuA+L4cSH
	 eI1t4EQMP8HdjGhWFS2+bc0SZWQ3IrlQKu7JRJJniIzbdJKmnaPIzgXzVoRG4hrd5X
	 4ITUTRCvmHOOoFQxTEAFVTAgHIyPyWDEQ/FT8wEvy7+mhQTZZglcU6dT5LjRUjeRWs
	 qTe61/+ftMQxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/16] dt-bindings: mfd: mediatek: mt6397: add mt6323
 PMIC EFUSE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260512-mt6323-v2-3-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-3-3efcba579e88@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 04:44:31 +0000
Message-Id: <20260513044431.E31A3C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing reference to core NVMEM schema (`$ref: /schemas/nvmem/nv=
mem.yaml#`) in the `efuse` node definition.
--

commit ce0eef2651d566e649c71112862db7f2d4dc1545
Author: Roman Vivchar <rva333@protonmail.com>

dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE

This commit adds the device tree binding documentation for the MediaTek
mt6323 EFUSE, which is used to store calibration data on the mt6323 PMIC.

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

Should this node include a reference to the core nvmem schema?

Because the node sets unevaluatedProperties: false without referencing
/schemas/nvmem/nvmem.yaml#, would dtbs_check incorrectly reject standard
nvmem properties like read-only or wp-gpios?

Additionally, if the core nvmem schema is referenced, does the explicit
reference to nvmem-layout.yaml become redundant?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-mt6323-v2-=
0-3efcba579e88@protonmail.com?part=3D3
