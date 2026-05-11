Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6DA47CC96
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537189; cv=none; b=IDhDv230OcLjWsstPjow2w1T0hwCc2xzme3DEiBHFvlPKYGomkPtOicGDerC2Gh3s6NkG2Kc1hXyEbxONUjYT8Ptk9HLM8NuHD75I+slivP5ARMc8oqoPQp+XGKFP6meQIF7eoohHYJit5yPKC/BTq1GE3EfkrBrWxl5i3cWvJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537189; c=relaxed/simple;
	bh=sVFgF6PdNGdOlftsOMf4tieRD9+3x4DiFZtJx/7HN8M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pabj5vbn9oSuHshO1pb1uAGP1ZoIKFPr2m2BeYlJsbN8tbXRP3Y/q1+ml1yPUYLQ6jPBQ+uDMv6iTwMBNFvs0kC3XUFholkgaz6rvoYBQQvIrkhLbmeedMGmaF9aoMfTFhGHCU+aAjNHSDtxyt29dkW4AVL6qQ/LbFtOBMarn88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuqS30Yf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuqS30Yf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDBEC2BCB0;
	Mon, 11 May 2026 22:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778537188;
	bh=sVFgF6PdNGdOlftsOMf4tieRD9+3x4DiFZtJx/7HN8M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DuqS30YfJTwpZ+3g8AmmZ6TraDJuUE5RMzmH+gZ4c3c8tBYxmRpbuqN3RTT4MgrF1
	 EZC63AmeeOlkEBi3usWg8I5Mb7Gkk9ByamlEjLmsII1CssoNZ4pbyvPyFngqD37eWk
	 pAYLSDDbH6segDFMqPmq6z+xCBYNduA8bPLqUjdwQx09mzy8p93gZeBcByjhZH3j7n
	 wjQ/wdcodmQFMsknzli+XA230nxGCRFYWmAC6hjB4z6QMT/rcNmaHGHkzQKMCBeq+b
	 iZjQ2KyY3qXAQqdxZIdWxtB2zOFDC8WxXzaL89A1LviTGfGiq8eujPzybwD6lluQqV
	 Ze49T9V9GVcjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: Add GPIO locked fixed clock
Reply-To: sashiko@lists.linux.dev
To: "Vyacheslav Yurkov via B4 Relay" <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-feature-clock-guard-v2-2-6c25458d5340@bruker.com>
References: <20260510-feature-clock-guard-v2-2-6c25458d5340@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:06:27 +0000
Message-Id: <20260511220628.4BDBEC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unnecessary new binding for a trivial GPIO polarity inversion, fun=
damentally misunderstanding Device Tree abstractions.
- [High] Broken `anyOf` constraint allows incomplete and invalid clock conf=
igurations.
- [Medium] Ambiguous clock aggregation logic and missing size constraints o=
n array properties.
- [Low] Improper use of the generic `gpio-names` property for custom GPIO a=
rrays.
- [Low] Non-generic device tree node name used in the example.
--

commit 616ccdf709928d91bd05dbe7b50cd0691ab27dd7
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

dt-bindings: Add GPIO locked fixed clock

This commit introduces a new device tree binding for a fixed clock whose
state is controlled by an external GPIO.

>     Describe device tree binding for a fixed clock, which state can only =
be
>     determined by the external GPIO. It's similar to gated-fixed-clock, b=
ut
>     the GPIO direction is inverted.

Device tree natively handles signal polarities via the GPIO specifier flags
like GPIO_ACTIVE_LOW. If a gated clock has an active-low enable signal,
could the existing gpio-gate-clock binding be used instead of creating a new
binding just for an inverted GPIO direction?

> diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixed-cl=
ock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.=
yaml
> new file mode 100644
> index 0000000000000..e0256bbd441de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
> @@ -0,0 +1,77 @@

[ ... ]

> +  clocks:
> +    description: Input clocks that externally locked.

Since #clock-cells is set to 0, meaning this controller provides exactly
one output clock, how do multiple parent clocks logically map to the single
output? Should this property have a maxItems: 1 constraint?

[ ... ]

> +  gpio-names:
> +    description: Names corresponding to each GPIO.
> +    minItems: 1
> +    maxItems: 32

Is it appropriate to use the generic gpio-names property here? In device
tree bindings, gpio-names is typically strictly intended to pair with the
standard gpios property, rather than naming custom prefixed arrays like
locked-gpios.

[ ... ]

> +anyOf:
> +  - required:
> +      - clocks
> +  - required:
> +      - locked-gpios

Does this anyOf constraint allow for invalid clock configurations?

If clocks is omitted, there is no parent clock and no clock-frequency prope=
rty
supported to define an intrinsic rate. If locked-gpios is omitted, the clock
operates without a locking GPIO, defeating the purpose of the binding.

Should both of these properties be explicitly required instead?

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    clk_gpio_locked: gpio-locked-fixed-clock {

This isn't a bug, but device tree specifications generally require node nam=
es
to be generic and reflect the class of the device (like clock or
clock-controller) rather than mirroring the compatible string.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-feature-cl=
ock-guard-v2-0-6c25458d5340@bruker.com?part=3D2
