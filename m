Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55138F659
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281316; cv=none; b=qWk1Ryk1BCRE2SY8UW5C0ITpbgkZtryDk4WU9fbHQsW9wpjABnW9pKAm4DWDiMHYOWrFdcrHPtgUdA2LY0fOiTpBNmG6EW7OzsE27RSSo7S5o1qKrfJYb5IXGCfVvQyhwPr0adV2Tst6ZSmwuMQcXTRJb0O/FZul2wK5Kxi8byo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281316; c=relaxed/simple;
	bh=nHLFqk7uTKHilGq47CFsRkR/6AYC7LNRrVx9m17WTjw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O5Uc+oNjCc+aseQBoF/8aJM2m3pyztPAZ0M7M+amMEFZ6yHZfRWRVnEwpDYJ/L+0pKJiaaship8yUwNRSNNs88dfYokmtuhh/2osmdum1Be9NqiK8/5iPFxJowi+iOTHp+zjzchbr1KHHz5r0aAuIvjFTx71XAos/elfKzVbIPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgODOwPE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgODOwPE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471DC1F000E9;
	Fri, 12 Jun 2026 16:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281311;
	bh=xCs/IQzKJMEiATbdHAMNlzyS9L7I2jgvyvN+8O4FWOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cgODOwPE9Qu/vsFy3P4HSs/2f3CNmSbtwgC2yElU2QVyt3YJ6XzuT0+T3kqT4Ie5w
	 KWoHGiZh1V0ZGVIJuk6C/cCcbDStRLCrGrlyPcmOIf7XTJu8yOdfkm4JeeYfBEHMhC
	 Rie8S3gpI3/O2iBSEPgC1hYDGU7gooFYXbqvm+oYSqbz6ZJacgvQzz7z0xEvi6iIDu
	 QPeQfA+tRYGZJTHKvHcoWc+zvaV1cGfWgDlYvn0FYBullJHnc4gOd2H5VPnUKlf+pv
	 gg/15BdH2In4xanjfD5cWWwmdkSX1mvkfqjodwfSdBij4NacQ0SIok2kIlrCcW94Yq
	 Zc1IJT9WzXnPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] dt-binding: pinctrl: samsung: Add
 exynos8855-pinctrl compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612163020.411761-3-alim.akhtar@samsung.com>
References: <20260612163020.411761-3-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 16:21:49 +0000
Message-Id: <20260612162151.471DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing SoC-specific compatible string for Exynos8855 wake-up inter=
rupt controller.
--

commit 87a449ad3230af2abf934581a9ca7d771b0d6dd7
Author: Alim Akhtar <alim.akhtar@samsung.com>

dt-binding: pinctrl: samsung: Add exynos8855-pinctrl compatible

This commit documents pin controller support for the Exynos8855 SoC. It adds
the samsung,exynos8855-pinctrl compatible string to the allowed properties
list in the samsung,pinctrl.yaml schema.

> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.ya=
ml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 7b006009ca0e7..c4773701c92e3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -53,6 +53,7 @@ properties:
>        - samsung,exynos7870-pinctrl
>        - samsung,exynos7885-pinctrl
>        - samsung,exynos850-pinctrl
> +      - samsung,exynos8855-pinctrl

[Severity: Low]
Should this patch also define a corresponding SoC-specific compatible string
for the child wake-up interrupt controller (samsung,exynos8855-wakeup-eint)
under properties:compatible:oneOf:items:enum in the following file:
Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.=
yaml?

Standard device tree guidelines require an SoC-specific compatible string
for all hardware blocks to accommodate potential future quirks, rather than
relying exclusively on a fallback like samsung,exynos850-wakeup-eint.

>        - samsung,exynos8890-pinctrl
>        - samsung,exynos8895-pinctrl
>        - samsung,exynos9610-pinctrl

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612163020.4117=
61-1-alim.akhtar@samsung.com?part=3D2
