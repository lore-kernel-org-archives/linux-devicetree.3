Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EFB3AF66E
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309043; cv=none; b=SJ6RS1ETNwIlmsukSQxYnMzCwsBCJEMnRmbMBg7OJA/O5YTMJ8QRA/7bxp+DxdQNqOXSDxN2XvHpOJDfXCDhl7pJahwfmf3v5GpJiKLt4H5kZV26jCC0TE4fh4jnBna+sau0jpH3jD8uSeO9EAEXxkWOnyCJH/xchTDyfOuMwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309043; c=relaxed/simple;
	bh=driTZOTY4tMmQn0OTuS2M08FJcDdI6Ka1K3s6flZGX8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qSAeNZKchT1NajCADLdxQ4OTCzhZxta05xM1FG1BX0oFzBr0sB6Q2Gzh6W1hfN7GoAIjzRyJgGbXr7G/DWbkt1kfelGzKpZDdp2gU8ZZzAvRyr106wdkWGX6w+LeR8rKzKJ31Wuy6w/WWfMJGyRTd3NV8NSQFmOMZNjzIjW5zQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FixlUPfJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FixlUPfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CEB1F000E9;
	Wed, 29 Jul 2026 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785309041;
	bh=Ya7WFfACsN8SiyIAJ8LcPlyvFTmFkomS2zr5mWGusAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FixlUPfJshDA8QLwhdFXjBtnjtRVEW6qCDQaOEcR/noteixKYNH1nr7mkCTovpDjz
	 UVteKHAj7JLMw+OKItmt44nGLqaq0YNxbwz3tWZKZJevtSd1G013yB7aTxzAoZNvPs
	 SH7eATn8NLMFAE9G1sxtm5fdDU4nEGPDD8AnNV/VeP3egFdHOTqabb5FcN9YJfc7E1
	 EruCiTX5i7h16vQheK4PeGxDrv8FgN3uCNykzocK/if0LAPylXBtHtUXaeeqEUM6tD
	 xOgV0RcOyccQBWe/AKT+y5grU7RQzn3Sk84CBPEHfD7xE7jz1j4cNa8hlvzxg0+o7q
	 3EliRCZN+z6+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: Add Axiado SGPIO controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729-axiado-ax3000-sgpio-controller-v2-1-976f4ed11438@axiado.com>
References: <20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com>
 <20260729-axiado-ax3000-sgpio-controller-v2-1-976f4ed11438@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 07:10:41 +0000
Message-Id: <20260729071041.68CEB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema Validation Logic Bug: The `if` condition for `axiado,ax30=
00-sgpio` incorrectly uses `const` instead of `contains: const`.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: gpio: Add Axiado SGPIO controlle=
r ---
commit f6cc693f3d06f8cf16f8579009218084ca514b3e
Author: Petar Stepanovic <pstepanovic@axiado.com>

dt-bindings: gpio: Add Axiado SGPIO controller

This commit adds a Devicetree binding for the SGPIO controller found on the
Axiado AX3000 and AX3005 SoCs. The controller operates as a shift-based
interface to multiplex multiple GPIO signals over a small set of physical l=
ines.

> diff --git a/Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml b/D=
ocumentation/devicetree/bindings/gpio/axiado,sgpio.yaml
> new file mode 100644
> index 0000000000000..448f01c367dc1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: axiado,ax3000-sgpio

[Severity: Medium]
Does this condition correctly match the compatible string?

Since the compatible property is evaluated as an array of strings in the
device tree, using const to match directly against a scalar string will alw=
ays
evaluate to false.=20

Because this condition always fails, it allows invalid device tree
configurations to silently pass validation since the ngpios constraint for =
the
axiado,ax3000-sgpio variant will not be enforced during a dt_binding_check.

Would it be better to use contains: const: axiado,ax3000-sgpio instead?

> +    then:
> +      properties:
> +        ngpios:
> +          const: 128

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-axiado-ax3=
000-sgpio-controller-v2-0-976f4ed11438@axiado.com?part=3D1
