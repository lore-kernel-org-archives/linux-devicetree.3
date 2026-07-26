Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867F73D955F
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087929; cv=none; b=D8149CnD1NiWmstZT8poI4R1F3ZwHGodAtVhSqIZNUplm7qAqxtPQZF8FjoQmFJppYRZ8kwV54a03iCbzaUswavSBeTlkUU6XesNTH0QvP/e6eYlHEbyzfTpSPOOljU/7xqgeh5uNT+Btbqq11epkV8Fp52LF4qVSQ/VOiEexDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087929; c=relaxed/simple;
	bh=q3+fW3sAmWwLL7ebEcVP73Phkm1W2OQDLLq1+54kNyk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AE0cGdOi7T/VMMFQ5zFRFrktO7ljY3M+Rbeg8yrfFC5VCrU28WEF7bHiWENSzjQcbe5FurCKVfIKvd46vsF+14Hh48+r0m+wDnwsFpCC/ZCdq9nt7OiGToUu2nKk0BMo637x6r+WAs+Edhkjp0x4Ui7EK3MLdf6wJ3B9zG1ffyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWl7HTx1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWl7HTx1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588371F000E9;
	Sun, 26 Jul 2026 17:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785087926;
	bh=Bhza7mApeDl0+TJOyoTgjFS6PoZmjtIloXZ7dW5d6Aw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AWl7HTx1RT//Vvg3wnJgIkQyJnND0F+WgK8XIc3Fo8DveziHWwr+J6kdzfl7MnQJG
	 VwGwoQII19YDsE+t0ddcqH6AkcuwkIVSsJr9KwEoOcyjkkGMXYhNGbwhIOu+ZaehN/
	 wt1DSpgX6nm58U22UxUze7SIhhdOFSfo8fw/YTxyGfvtvrT7Et9dff7sUN8+dXpVNg
	 ln06r1kE/wJyiIWTxkvpcLyuZ5ZiEfiKlvYp81UoI+o+OuPZcUV+sbET53R1LdDhXZ
	 1X0SvZ4Ph4E+Beyu1GJbKZxeX0639ZMc/zSyD4xKOdmMkAzars9DjujdjN079azp34
	 5aaJZaiYQYjBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: Add GPIO-locked fixed clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>
References: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
 <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 17:45:25 +0000
Message-Id: <20260726174526.588371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema's `anyOf` constraint makes the essential `locked-gpio=
s` property optional, and the binding is missing `clock-frequency`, breakin=
g validation for fixed clocks.
--

--- Patch [1]: [PATCH v4 1/2] dt-bindings: Add GPIO-locked fixed clock ---
commit fe524126bff4b0741b4910f69b3229a3794694dd
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

dt-bindings: Add GPIO-locked fixed clock

This commit adds a device tree binding for a fixed-rate clock whose
availability depends on one or more GPIO lock-status signals. Describe a
GPIO-locked fixed clock provider that exposes a fixed-rate clock whose
availability is tied to a lock-status signal.

> diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixed-cl=
ock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.=
yaml
> new file mode 100644
> index 0000000000000..4d17889c51ad9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: gpio-locked-fixed-clock
> +
> +  "#clock-cells":
> +    const: 0
> +

[Severity: Medium]
Is clock-frequency intentionally omitted from the properties list? Because
additionalProperties is set to false, a clock node that omits the clocks
property will have no valid way to specify its rate, which would cause
standalone fixed clocks to fail validation.

> +  clocks:
> +    description: Input clocks whose validity is monitored by this provid=
er.
> +
> +  clock-output-names:
> +    description: Names of the clock provided by this controller.
> +    maxItems: 1
> +
> +  locked-gpios:
> +    description: |
> +      GPIOs to check the lock state.
> +    minItems: 1
> +    maxItems: 32
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +
> +anyOf:
> +  - required:
> +      - clocks
> +  - required:
> +      - locked-gpios

[Severity: Medium]
Does this anyOf condition inadvertently make locked-gpios optional? If a no=
de
specifies clocks but omits locked-gpios, the first branch is satisfied and
the schema will silently pass validation. This seems to allow configurations
that bypass the core purpose of a GPIO-locked clock provider.

> +
> +additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-feature-cl=
ock-guard-v4-0-e9c8b372b71c@bruker.com?part=3D1
