Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1F29C327
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909749; cv=none; b=mvtiXjLBdZuJg9kACryxJc28/pnDTG6nCDJsfj20mYRMDm9qwCPDBDOSmeKeeA7WV42G5X8Wv6Z9HQfsn+IpfJH3OfWmW2XKKqBewQmXAhBpAYc5q09XK3HkSopklN/F5sI908HyUMBR8gt0A+8dzWDy5N/xgA7EPVuM9ZNDT1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909749; c=relaxed/simple;
	bh=LJ49kNrY1n0vGYjC+qrRfdYjcMYPLMPONklJUJE+vHw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EAKkGMTwEtQG2d3QNKWR7XQC5NCPY0sGWhQQ2m81Hgq52Q6tBgGFIlleRmgSvl+IV5hr8vjmCBBkqgD16je29LwFG8eaCykWkxzsCcbCx2Bro4eZ9oeqs0Ln5km+f3eBW9nl2Wh2f+ulMhjNd7tUcBO84rVAYEuQguEJBkj7dy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAzY8YQz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAzY8YQz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB1C1F000E9;
	Sun, 16 Aug 2026 19:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786909747;
	bh=1+7KMgMYFiqGLLWDJpNvo3mE5tHk4g/whuI8C2ja/qs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cAzY8YQz5JVYVGeRgeIDjUQygKb+qBR5pwglcWNxBAjhIATvhdczEEFl70SrJehBd
	 Zwu06nvlwBb915wG2BzREbgqAKP2g1YQbRJnXMrKqjWBJ/kLndb77GENo6WVaumGXP
	 7ZIHhG5Yme/2WlmMCjxPcc9bi2yJ9r1w5eEBlRlkNryowCxs4HtTBRui8mvkNGFy68
	 7Usu5sIa6nkKeLEfWC89iJfHuETAv79n/xTpKCIJdvPegumngk7B3gLKUCh1TVZxD0
	 tN96jBpiuU3ysC7IeKfIMXp0RKk7jiP2kCpjcecqmvFMN1WI3cy5wTlFJZ/eNu5X3y
	 Zcur2zNt3Ajwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588
 crypto engine binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Olesinski" <dawidro@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816194112.552100-2-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260816194112.552100-1-dawidro@gmail.com>
 <20260816194112.552100-2-dawidro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 19:49:07 +0000
Message-Id: <20260816194907.9CB1C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema fails to use conditional `if-then` blocks to enforce =
variant-specific resource constraints for resets, allowing invalid configur=
ations to silently pass validation.
- [Medium] The `rockchip,rk3588-crypto` compatible string incorrectly decla=
res `rockchip,rk3568-crypto` as a fallback despite having incompatible hard=
ware resource requirements.
--

--- Patch [1]: [PATCH v3 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3=
588 crypto engine binding ---
commit e7f36faa96ab3720550555cbd2cbc8b8549dc8d0
Author: Dawid Olesinski <dawidro@gmail.com>

dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine binding

This commit adds a YAML device tree binding for the Rockchip V2 cryptograph=
ic
hardware accelerator present on the RK3568 and RK3588 SoCs. It defines
clocks, resets, and interrupts, noting that RK3588 accesses these via the
ARM SCMI firmware interface while RK3568 uses direct CRU access.

> diff --git a/Documentation/devicetree/bindings/crypto/rockchip,rk3588-cry=
pto.yaml b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.=
yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
> @@ -0,0 +1,83 @@
[ ... ]
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: rockchip,rk3568-crypto
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-crypto
> +          - const: rockchip,rk3568-crypto

[Severity: Medium]
Is it safe to declare rockchip,rk3568-crypto as a fallback for
rockchip,rk3588-crypto here?

Since the older RK3568 hardware requires 3 resets and the RK3588 provides
only 1 (via SCMI), wouldn't an older OS probing the RK3588 device using
this fallback string fail to probe due to missing resources?

> +
> +  reg:
> +    maxItems: 1
[ ... ]
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: aclk
> +      - const: hclk
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 3
> +
> +  reset-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - const: aclk
> +      - const: hclk

[Severity: Medium]
Should there be an allOf with an if-then conditional block to enforce the
exact number of resets based on the compatible string?

With minItems set to 1 globally, an incomplete device tree node for RK3568
with only one reset would silently pass dt_binding_check validation, even
though the hardware requires all three.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816194112.5521=
00-1-dawidro@gmail.com?part=3D1
