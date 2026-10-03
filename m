Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9973A37269A
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 01:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991190; cv=none; b=MskpzNUrhLsgNizHwNbu9sKshtPtw1XvmDG3emsgNCyeq0Np1gem0J8MlKrq8NwvMmOB3oXyZ4PIxprZyqCzrFDUJIYHCxx2O7tUOxAtxPyy57RixfvFfZy8sERNyhMJkd//jhBbhGlaxLv9+TBuo/2eKBTFYImbCs+IjmvXY4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991190; c=relaxed/simple;
	bh=/R08r8W4f67xU3+tLrTvnJTSmScys0E6G829rHIod4Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HYdKUMUEuTGjN/pK4Gij8GQVOxaW4gfOMfe5BSq7Ntumvq6yxVQdkP2NdsfGbCg34xRZqB8xsnKDyieodArZ60P1+gWnz1T2DGqhpEzzHLb+Z8Dxy7bARQ1TJqe9Nn63OSk5sFrOycU8p5DkeLhU0xCXG7RJ8C89VAZOXgFSP78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALaAIFUB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALaAIFUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F451F000FF;
	Sat,  3 Oct 2026 01:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790991189;
	bh=g/yWUR5jDojuReu2hlxfb0q7LvVu6bXJ2bDEwn39gk0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ALaAIFUB8K/g3t7GfZGskqNeQ3ko3FEJtplUmMdX74eOOgIdMHIaqVAZuFJVpJ9vN
	 9X8jZUQFdevrXx1L4+qmnzEuE3UllkeOAhJy9KCTiOxsL6DGIQARNM6C8JNO0psvk5
	 9+kHDJw48LjwfaKwOybj22xjuBqwy6bqVuVh+xtw9Lz6b8UuGNEqDOvCLcfEuEBcVR
	 T6gaKIt+XxvMkTZNb/K8UOakq0ugDwJpDYq/h/A+AklwDKjnMfTD8VuXOlkVWzJGnh
	 XO8D9xOPrCeTvNsEkBd/5b7ZS9nhElExd0xLnYkVud5EoRv8JaC0OyxLMlJ1ir37vJ
	 Fxrg5eZXoBEsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: aspeed: Add Intel AVCRP board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Glazik" <dawid.glazik@linux.intel.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <63367a27ef8c7f27a9d273b65b02b02009d149c6.1790344811.git.dawid.glazik@linux.intel.com>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
 <63367a27ef8c7f27a9d273b65b02b02009d149c6.1790344811.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 01:33:09 +0000
Message-Id: <20261003013309.58F451F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: aspeed: incorrect alphabetical sorting of compatible l=
ist
--

commit 935e4a0e4317495a07a6555e784a49d89b6d676d
Author: Dawid Glazik <dawid.glazik@linux.intel.com>

dt-bindings: arm: aspeed: Add Intel AVCRP board

This commit adds a new compatible string for the Intel AVCRP BMC board
to the ASPEED device tree binding schema.

> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 8ec7a3e74a21d..2c8180e49b2f3 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -106,6 +106,7 @@ properties:
>                - ibm,rainier-bmc
>                - ibm,sbp1-bmc
>                - ibm,system1-bmc
> +              - intel,avcrp-bmc
>                - ibm,tacoma-bmc

[Severity: Low]
This isn't a bug, but does this insertion break the alphabetical sorting of
the compatible list?

The list of compatible strings for AST2600 based boards in this binding is
maintained in strict alphabetical order. Since 'ibm' comes before 'intel',
the correct placement for 'intel,avcrp-bmc' should likely be after all
'ibm,*' entries, specifically between 'ibm,tacoma-bmc' and
'inventec,starscream-bmc'.

Follow-up patches in the series continue this incorrect placement.

>                - inventec,starscream-bmc
>                - inventec,transformer-bmc

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790344811.gi=
t.dawid.glazik@linux.intel.com?part=3D1
