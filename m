Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702EC1E49F
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778559500; cv=none; b=XpDTYeJfiRAfbJEL6MGYj+8DqcvVmMuCQHYwGZjPPGnC1SSq1bteHIe+Nq+zNZHFqcDHhOam8njqYDzoW4OzCnl+7F55hnv4haNmQygmoUj7UzmTlsDv+HluKVMhxHyew6fNeKrgQzwcTy+hIABeygByJUYvPOrAH4k66TfE9SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778559500; c=relaxed/simple;
	bh=6OBqOqnFhbHjAXGPFI1F382wZFUlmxOgbBiThnHiQzw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AWT0drSuodci/XRiWO3fF01cX89oWXOLM/VXIPV5Fj1FyL27P6yYqcNgfbZ8/IFyccQgO+zU9+itTaTTU2PUX93BO/kyIDctYoLYqibNbP3PhvemqpeJhyE0IYE0yBEXNiTS5DnTdGJjMAqmKBLn4rf3D3+qVhOQv09mn5a+iV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQeAS0Fv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQeAS0Fv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BD2C2BCB0;
	Tue, 12 May 2026 04:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778559500;
	bh=6OBqOqnFhbHjAXGPFI1F382wZFUlmxOgbBiThnHiQzw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jQeAS0FvfuxEmYvEH+WqsYTobNg6oDPorQFWC4t78Nd3wH9WNiefJ/Yv1nKjp9fwt
	 eMVVFVYHGf7O91EPy+dx9/zShxIqrugbgaTRJmwOBsDRedAtUwal1/rqHHDfGfs3in
	 JJZys23bdhuIbszm8tUWaf5t+FxxecsurkdEp0kx5v30ILzWVUnSeuGepLjvKX8V+/
	 WT3TsG+eUeLD/7KUwDWl4QFTViw0/iF25zErEYtqgg2OZLpXEkZ+Fzjq8ZUwanDdUb
	 tyiZQhknS0cntK2p3P0VVZIpRD2l+KnL9PXhHgcfFmcGHBoIJzV2okvgqbvNhRtVhJ
	 4UrVnwc4DpFtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: clock: Add Amlogic A9 PLL clock
 controller
Reply-To: sashiko@lists.linux.dev
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-b4-a9_clk-v1-2-41cb4071b7c9@amlogic.com>
References: <20260511-b4-a9_clk-v1-2-41cb4071b7c9@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 04:18:19 +0000
Message-Id: <20260512041820.19BD2C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema conditional block for MCLK PLLs fails to enforce the =
required second clock input, allowing incomplete device tree nodes to pass =
validation.
--

commit 5fa007b81417dc37662d2d766cd8ecfc23758d15
Author: Jian Hu <jian.hu@amlogic.com>

dt-bindings: clock: Add Amlogic A9 PLL clock controller

This commit adds the PLL clock controller device tree bindings for the
Amlogic A9 SoC family.

> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.=
yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml
[ ... ]
> +  clocks:
> +    items:
> +      - description: pll input oscillator gate
> +      - description: fixed input clock source for mclk_sel_0
> +      - description: u3p2pll input clock source for mclk_sel_0 (optional)
> +    minItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: in0
> +      - const: in1
> +      - const: in2
> +    minItems: 1
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,a9-mclk0-pll
> +              - amlogic,a9-mclk1-pll
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +
> +        clock-names:
> +          maxItems: 3

Does this conditional block also need to specify minItems: 2 for the clocks
and clock-names properties?

The global property definition describes the second clock as a fixed input
clock source without the (optional) designation given to the third clock.

Since the global minItems is 1, omitting a stricter minItems constraint
here causes a schema validation regression where an incomplete device tree
node specifying only a single clock for an MCLK PLL will silently pass,
even though it is missing the mandatory second input.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-b4-a9_clk-=
v1-0-41cb4071b7c9@amlogic.com?part=3D2
