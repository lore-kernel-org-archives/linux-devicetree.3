Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164F622652D
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955041; cv=none; b=UaolGsqc0vlNSF5qrmkAHmB1MmPrdccGA7GCYWSHUtffu0bRqvpbD+M7sOvboRZa4B4hhd49YXJAn6qoMEd+lME8PWFtKmNdzkKSRnQj3gJ4+0OYhMbKfq7pUh9K5xKtWZ10g2S8ciC0ZrNdEXD1tlq5EFJ3xQESaLvAuPgoQC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955041; c=relaxed/simple;
	bh=OPRWrj+CtsKDlA2IjJBvPDOZUyNFzLn+xW7LOOh2D+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mfOqwGaiA469WaGdTflS/1MBWve6Hd0+1kDFF3o8BXbRNDXG6DV5Fm3xLYLXzcI5ur4KTcr/WB6S+uXqknCVyafzQMGYKpgJDaxwrV40Wu80AIFGG2inkIRadVpF7T9BSW8CEdMIhadQI1OREZcv7kVNtB3uwSrSzUcnXXKM3rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhUbkGL/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhUbkGL/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC961F000E9;
	Thu, 28 May 2026 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779955039;
	bh=oUPE4DueYjOojqonznuzyBBrcFl1hFO5zRJiaseLkSw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MhUbkGL/jqiZlnBoGxp43b2kbk15HK3bZXQMY7vCYf7sFSwide4Monv1kXMzx4Gk5
	 yK1EYZBmVQgdAk2lKJzGR4KsR91zJ0aJIZzdba8ewjaveb+S9Tpf87jgG3/ZjBjwFJ
	 ShWjOIDdq9XR9sXdwNa4JHoUayVCkHdzpPAGqdHX4rvS2wbUMO/Lb0jsVI04DLT1bc
	 fnlwSvsm7FISxm/YdWCRhRo8MWidtm1yiKYoIXBn5AE38KooqR60RyDG1yFeRuTj/k
	 Ara/s7ykoP4CZezNxZfArp1EHixJAeMsdflTqzgWeKuEX69UqwJcz+LW2HnVTv8FVD
	 JNqcaTqOt+zOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v30 1/5] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528-upstream_i2c-v30-1-5d4f9adc3530@aspeedtech.com>
References: <20260528-upstream_i2c-v30-1-5d4f9adc3530@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 07:57:19 +0000
Message-Id: <20260528075719.BDC961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims the binding requires two `reg` regions=
, but the schema specifies `minItems: 1`, making the second region optional.
--

commit 1bb6224b110a8990b3c95cd44d683d1ba249d994
Author: Ryan Chen <ryan_chen@aspeedtech.com>

dt-bindings: i2c: Split AST2600 binding into a new YAML

This commit separates the AST2600 I2C controller bindings from the older
AST2400/AST2500 schemas into a dedicated file. It also updates the schema
to enforce AST2600-specific constraints like interrupts, clock frequencies,
and register regions.

> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yam=
l b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> new file mode 100644
> index 0000000000000..abc614315dffb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-i2c-bus
> +
> +  reg:
> +    minItems: 1

[Severity: Medium]
The commit message states that this binding adjusts AST2600-specific
requirements to "require two reg regions (controller register block + buffer
block)".

Should minItems be set to 2 here to enforce that requirement? Setting it
to 1 makes the second region optional, which allows device tree nodes with
only a single reg region to silently pass schema validation.

> +    items:
> +      - description: controller registers
> +      - description: controller buffer space

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-upstream_i=
2c-v30-0-5d4f9adc3530@aspeedtech.com?part=3D1
