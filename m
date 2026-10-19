Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340954D7D55
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406066; cv=none; b=GMYOlnwJWJ2zMwGn5Git3LjPDgaJwZaiKm3B0ayhf99VgrJMh94nXy+wFHcKHZZE5QbtEEsKJ1GT/2Xi9L2+uF/W2u5pGwJqITLA6y5aVFSo+iraOqQhpSdGhJI/zbcNGB+/mDPDGgU/Bd8iAAOyWY7cluPkudJENeAPeWfSw0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406066; c=relaxed/simple;
	bh=Wbpsxu+kOiAtoYq9KyyVfsyes/HB/Tp0ZKieBIJFvF0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lc061lDbfivxxLO4irdsTI4ynaaZRve358nRLR4Y9LwkT9YQ3Ko1UWz9jzsUh3/mnJtQ0siGN/AHbkEqTO40kPQqLzeDBsFqFPhkVrXo9DcowAvY5KJs9zyKMT7M3H/Lp+U98RYYuorq5/GXftu4WmNeIwKA1+gvgNs82KE/+8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISWFwIm0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISWFwIm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E761F000C5;
	Mon, 19 Oct 2026 10:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792406063;
	bh=3aQKqW6/c1MMTRivk1CvAvOj3hMI4UMnyi0QCXipvzw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ISWFwIm0dtQ0VwhddEi+T+dcwxEBtWkY7P92joFcKmXMZGjEACOFilk/IqnGhfEeH
	 aaHLnFyhCz3z6mzAXs/DJ6ztjf8Vqs1gb5U/cO8A+pLGKQs4rUf64EI3F9e76nowNm
	 NCtQuOuqK7+S0Ar7TXT6h4DndaYY7KcyZTgXcoc14CyBTJpO4S5dNRh19nhgGvQt+W
	 WaBiqNGFwcFommPD4uBIkvKrU7xpUs3wgHYfhvWtE5HOpDeufvppQammrZ7Gn1J6xR
	 no++I9nc+WEMbvkkD1c8NqeiQzF0uIo6MRlj1bR6SST2RqSAUmMpMOC+4k5JHhFNQ0
	 L3I4lmq/phChg==
Message-ID: <sashiko-outbox-176998@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: samsung: exynos-sysreg: Add
 compatibles for Exynos5515
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aiden Isik" <aidenisik@member.fsf.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-for-next-lucky7-v2-1-c4ecab4b1c4c@member.fsf.org>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
 <20261019-for-next-lucky7-v2-1-c4ecab4b1c4c@member.fsf.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:34:23 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: soc: samsung: missing clocks condition for exynos55=
15 sysreg
--

commit 780d375e416e5c58dedc0e1cdf45e84c270a29e6
Author: Aiden Isik <aidenisik@member.fsf.org>

dt-bindings: soc: samsung: exynos-sysreg: Add compatibles for Exynos5515

This commit adds Exynos5515 sysreg compatible strings for the top, peri,
and fsys blocks to the Samsung Exynos sysreg Device Tree binding schema.

> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml
> index fcdb9ffd26448..c6731a3ea1c47 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> @@ -29,6 +29,9 @@ properties:
>                - samsung,exynos3-sysreg
>                - samsung,exynos4-sysreg
>                - samsung,exynos5-sysreg
> +              - samsung,exynos5515-fsys-sysreg
> +              - samsung,exynos5515-peri-sysreg
> +              - samsung,exynos5515-top-sysreg
>                - samsung,exynos7870-cam0-sysreg
>                - samsung,exynos7870-disp-sysreg
>                - samsung,exynos8895-fsys0-sysreg

[Severity: Medium]
Should samsung,exynos5515-fsys-sysreg and samsung,exynos5515-peri-sysreg al=
so
be added to the allOf conditional block that requires clocks?

In include/dt-bindings/clock/samsung,exynos5515-cmu.h and
drivers/clk/samsung/clk-exynos5515.c, CMU_PERI and CMU_FSYS register
dedicated PCLK gate clocks for their respective SYSREG blocks in
peri_gate_clks and fsys_gate_clks:

drivers/clk/samsung/clk-exynos5515.c:
	/* SYSREG */
	GATE(CLK_GOUT_PERI_SYSREG_PCLK, "gout_peri_sysreg_pclk",
	     "mout_pll_peri_bus_user",
	     CLK_CON_GAT_CLK_BLK_PERI_UID_SYSREG_PERI_IPCLKPORT_PCLK,
	     21, 0, 0),
...
	/* SYSREG */
	GATE(CLK_GOUT_FSYS_SYSREG_PCLK, "gout_fsys_sysreg_pclk",
	     "mout_pll_fsys_bus_user",
	     CLK_CON_GAT_GOUT_BLK_FSYS_UID_SYSREG_FSYS_IPCLKPORT_PCLK,
	     21, 0, 0),

However, in Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sy=
sreg.yaml,
the allOf block sets clocks: false in the else branch when a compatible
string is not listed in the if enum:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - google,gs101-dpu-sysreg
              ...
              - samsung,exynos990-peric1-sysreg
    then:
      required:
        - clocks
    else:
      properties:
        clocks: false

Without listing samsung,exynos5515-fsys-sysreg and
samsung,exynos5515-peri-sysreg in that enum, won't schema validation reject
Device Tree nodes that specify CLK_GOUT_FSYS_SYSREG_PCLK or
CLK_GOUT_PERI_SYSREG_PCLK, while allowing unclocked nodes where
of_syscon_register() cannot attach the PCLK via regmap_mmio_attach_clk()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-for-next-l=
ucky7-v2-0-c4ecab4b1c4c@member.fsf.org?part=3D1
