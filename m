Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAC2541E48
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080319; cv=none; b=Fi2wUZBsJUWSsU9vC0riMZTrW893AcfVTG3Pxjwy2xlVNXWrScsrIJNYZlrCIOQ/Gc76Z/Vs6reih3RG99d/jXPKhQci41NeeN/6T0rC8qYhZWeWpqjIBKpPC/46HsOTIqnRi1i6A+xT3ZJ6DuF1tZxeSfZwIiiVZhsivWA0BtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080319; c=relaxed/simple;
	bh=4s9mvj/BlRPBBpRWs4pLpG+FJA3+Ho3NxRi95KP7AWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cV14CPIU82FhPM/AuKgfNfYCnfFgwK/exRFzMGLevMTEWIElUVCdx6BYwN/n8gzq353EwCu46xx0gu+p4J4uKlusOn6ZbZAXWcsk78cvMY6/9KJkQMnkuWc4SaTj7EgBJLqPOMubrIy0EDv7VIPoX6DlvrEU/dzbkKiuA4lyZdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbTMsLYt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbTMsLYt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927751F000FF;
	Tue, 22 Sep 2026 12:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790080317;
	bh=7taN+ongyfpFZ7ZiEWD+YA+JeMJ6pmMwvzjqUCI2ekY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bbTMsLYt3xp48D3SnBcUvqf5TNtBa35Fa0+Q6QiMnfnMTfccVQ7Txe66SVKf1CqXW
	 ZBNU5CDUTJDhiJgC4LnbK0kb75JnnBgcrt/5qvwAePcWotrlfnDJUYZjxe7479UlV2
	 Eqsnf9Vs28aX5vpZcMS1v/S1ZXORgDLnRowNbiylwj7yzfT1J9fiW5YeP1/oUMlbGd
	 CToNMmTtBYL01rSbt82/9TKgKAgiwlTwvHKJj/buZKzoj/R2YCrC34xy8kymK9JEAG
	 JRL/aQpl+nSbeOXLSw4NiljIpgXw5Dlj+8ka74CtsmAgCJTvc8QqCIJxl0s8LSzIq/
	 zjUFqxNq2qz5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandru Chimac" <alex@chimac.ro>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
References: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 12:31:57 +0000
Message-Id: <20260922123157.927751F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: unconditional clock requirement breaks PINCTRL_TOP =
node
--

commit 8b1ed6a89af0afe8c1009cac2d735ea6bee6ec4b
Author: Alexandru Chimac <alex@chimac.ro>

dt-bindings: pinctrl: samsung: Require clocks for Exynos9610 pinctrl nodes

This commit updates the Samsung pinctrl bindings to require clocks for nodes
using the Exynos9610 compatible string, as most of these controllers have
designated clocks.

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

[Severity: Medium]
Will this unconditional requirement break schema validation for the clockle=
ss
PINCTRL_TOP node?

The commit message explicitly acknowledges that the PINCTRL_TOP node does n=
ot
have clocks. Since all Exynos9610 pin controllers share the same compatible
string, applying an unconditional required rule for clocks causes a structu=
rally
correct PINCTRL_TOP device tree node to fail dtbs_check validation.

Could the schema be adjusted so that clocks are allowed but not universally
required for this compatible string?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-exynos9610=
-pinctrl-patch-v1-1-f6d816696591@chimac.ro?part=3D1
