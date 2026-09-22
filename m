Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC631434408
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080401; cv=none; b=gziwum/Uxgzw5bJFGBLtGKJ32QIvvxrs77sGDhtgDop7wSCnHlEYQ2inDTSieSNqqBj3x2uhqkypo2t248qYdHEEkdh/sRqunLsN7g8nocxWg1HqHx1QbG8Vo5mV8ghQk8LvJK7OwJd2aUtOZRKuCJAiQ9hLpFjtmiCdtOLcVfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080401; c=relaxed/simple;
	bh=LBdNESU7gGfLLz2QMK7/7cy4ybwpz6cWPaoR6Rn8N1Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O3/t8pt/N4XtX3b1c/E5JQc72OF8rwvrVmHBR8fwe50X9v7L0LD1f4QY0EhbSjbRQT9tcKNUlDLWrS0Wc+urRXouFvFQcVvHMZte+zRBJn5+1nmQ+l4hoN49r0Im6mX1FTehuNm6qyTu2a3vyqCWqSePO9PG8XsXck+bTPY7qxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f12lfOUR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f12lfOUR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E52B1F000FF;
	Tue, 22 Sep 2026 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790080399;
	bh=wW8L3gZ3lGTDPiqy5YvHjA7T/cBBviK9o6cY8wUtBEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f12lfOURewxqCPUgisCY/E5uD7Z0hkM8iU2kTcoX/qQ67OtOwrH1zePKtca2txUnX
	 cqeoLkLn0fj+g/Y9VSLNORI3+UF4aF6SRXUwLXXSyYSC6ZKuC3uYPmOUDmX4fdJQpP
	 vBBR0WN26MgpkjzFLMTmHLnkiUm6DrbcrBfkgUmEhoFxyM7SFopgggfMfXxbf34BfC
	 Oqp3Z+afRwuItwy5N18Lvr04l4B3xphx7g0ikRmNLDe+9sQLZbUcymuQSAT/02sh9m
	 aTO8lBjFgnZSiK8VB8abgnjmLwWBXhg2pPQbmRr2kUKmmCTJnnWC64G0Ljk9x/6j27
	 TTlsl1PP33aJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandru Chimac" <alex@chimac.ro>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922-exynos9610-pinctrl-patch-v1-1-26d8108c1802@chimac.ro>
References: <20260922-exynos9610-pinctrl-patch-v1-1-26d8108c1802@chimac.ro>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 12:33:18 +0000
Message-Id: <20260922123319.1E52B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: pinctrl: over-constraint on exynos9610 clocks
--

commit 16b59636da37f1324cb6823b4e5fa7ff00df75fb
Author: Alexandru Chimac <alex@chimac.ro>
Subject: dt-bindings: pinctrl: samsung: Require clocks for Exynos9610 pinct=
rl nodes

This commit modifies the Samsung pinctrl devicetree binding to require
clocks for Exynos9610 pin controllers. It adds the Exynos9610 compatible
string to an existing conditional block that mandates clock properties.

> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.ya=
ml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 1feb6a6fc6908..e4fdedb29631b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -140,6 +140,7 @@ allOf:
>              enum:
>                - google,gs101-pinctrl
>                - samsung,exynos8890-pinctrl
> +              - samsung,exynos9610-pinctrl
>      then:
>        required:
>          - clocks

[Severity: Low]
Will this cause schema validation errors for the PINCTRL_TOP node?

The commit message notes that PINCTRL_TOP does not have a clock, but adding
the compatible string to this allOf if-then conditional block enforces that
all Exynos9610 pinctrl nodes must have the clocks and clock-names propertie=
s.

Since all pin controller blocks on this SoC (including TOP) share the same
samsung,exynos9610-pinctrl compatible string, this seems to over-constrain
the binding and would cause dtbs_check to fail for PINCTRL_TOP.=20

Should samsung,exynos9610-pinctrl instead be exempted from the else block
(which sets clocks: false) without moving it into this then block where
clocks are strictly required?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-exynos9610=
-pinctrl-patch-v1-1-26d8108c1802@chimac.ro?part=3D1
