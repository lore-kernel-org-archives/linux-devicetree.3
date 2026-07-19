Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAD12D0C9D
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784486550; cv=none; b=uur4K7K3t9EPqlNZJH5HsLODfpVEjgvForlf2YADfzE8KSI8tetgHotm6jbyVmHfVQ2jmU+VU3yNARhItvPHvDSqbGdvb+Ox7ADKbPb8Wcgo4wZg1oR471EuWXbjrzXwgOvP0Yv2/hhTA3iklz6rBTX6GuMm00JR09/4zs3zT88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784486550; c=relaxed/simple;
	bh=RbezpwxweQGwU2koH0l6KGFV2HaT+tS7fUzVaGVDmuw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cxC9By7cCj/hQ3w2TpWTqIPKaILhphvr/GR7m8ViHxs8+Ye9z1rMwAQWvi0pVujYfEtOuZJ0Zhyh8tX0nwuv0rVgkq/SDcFy642Z8gWql0eHoyLrlSagQWgBLNHUBUuXXYNI/qjy/bAjWBxTVY6QjTWEbNOP9Do09V1UedvhscU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBsaX4zY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBsaX4zY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFAB1F000E9;
	Sun, 19 Jul 2026 18:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784486548;
	bh=atgylDGGc/LguJqW4H/uvz3Yg4v2sKtaAC/hg5I+j7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EBsaX4zYCm8jNioH8ID3/5fX57q+SMQ1abzDaf6hEuDVqv0Itdj6t6AUVQzpPd8m3
	 76VgautBrfZUKz2FmmDqzr+VKe6oi3Je6QC3BCX3WVt5Bu1LSEx0rc4gS16/2OT2Ml
	 vsUMAUCuGwT0HAZ+xDm8qLSQtpoQyyMT/9nMrqe/ua0rjOaOprDr6UB+cNTUVsLSU+
	 wljcaQZfIFYgCNtopEPgFlSt5Yf416BvsKjAkMVwfj00CW56bk2mPq3Cz0FDkf5SlS
	 xlZdvLVi8R8vfMXhPFYCszPZ9Sk3yGuSrcvOmF4LS09Br1RZYJzKBHNGbLLCRN0Dut
	 Q2OlByqtVFSmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260719183431.124061-1-challauday369@gmail.com>
References: <20260719183431.124061-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 18:42:27 +0000
Message-Id: <20260719184228.4BFAB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The regular expressions used for matching pin configuration node=
s contain invalid syntax (negative lookaheads unsupported by the RE2 engine=
) and overly restrictive patterns that reject standard Device Tree node nam=
ing conventions.
--

--- Patch [1]: [PATCH v3] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl=
: Convert to DT schema ---
commit e4c63aad2379e3c473b66cca58b14faae98c368f
Author: Udaya Kiran Challa <challauday369@gmail.com>

dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT schema

Convert Microchip PIC32 Pin Controller devicetree binding
from legacy text format to DT schema.

> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzd=
a-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic32m=
zda-pinctrl.yaml
> new file mode 100644
> index 0000000000000..7a36e5ff61ddf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinct=
rl.yaml
> @@ -0,0 +1,153 @@

[ ... ]

> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  '^(?!pinctrl_)[a-z]+[0-9]*_[a-z0-9_]+$':

[Severity: Medium]
Will this negative lookahead cause a schema compilation error during
make dt_binding_check?

The dt-schema tool requires RE2-compatible regexes, which do not support
negative lookaheads. Additionally, strictly requiring an underscore in the
node name violates standard Device Tree node naming conventions.

> +    type: object
> +    $ref: pinmux-node.yaml#

[ ... ]

> +    unevaluatedProperties: false
> +
> +  '^pinctrl_[a-z0-9_-]+$|^[a-z]+[0-9]+-[0-9]+$':

[Severity: Medium]
Is this pattern too restrictive for container nodes?

By requiring a pinctrl_ prefix or strictly ending in a number, this pattern
rejects valid generic node names like uart-pins, which could break schema
validation for conformant device trees.

> +    type: object
> +    description: |
> +      Container node for grouped pin configuration sub-nodes.
> +
> +    patternProperties:
> +      '^[a-z]+[0-9]+-[a-z]+$':

[Severity: Medium]
Does this child sub-node pattern improperly reject standard single-instance
interfaces?

The regex requires a number before a hyphen, which means valid generic names
like spi-mosi will fail to match.

> +        type: object
> +        $ref: pinmux-node.yaml#

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719183431.1240=
61-1-challauday369@gmail.com?part=3D1
