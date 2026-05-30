Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9748C31354F
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780153755; cv=none; b=LbG2cezgOYRmSi1fgVxdT+GYjeUYhz2yva61HCsPFvU3rIeJcWrkuVrntWiy+pXikNBgqb6puaHR4apAezeWFqfq42LSYrXnT/H2a0ARxEEH+ovCksunTfnJJTRu6UYeCtcaAAWzC7mN0tblfqLfXipH1y7WpTNdrfMyTVZ0TrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780153755; c=relaxed/simple;
	bh=Qb7PS6zmHiceCP3U2Wy6rsBpg9/Gkt+jxkIsl4Nc+KY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tSJK28Ax9ZRYSRJWz5TO8xWFs9B9CxgXl2aPHXUcEkhVT7nCR3KoPXtgDZe9sc9mhwPLHQQ7MF6mWs03NA8QVPdsJpLsQm86LRrf6M6EYAUbAsgSXbqY7WaOZh2npdJL8okXMMN9egu5+PO2XPNMrFdnAQpj37fAA8E4nnGfFJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmFpsMhg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmFpsMhg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189C81F00893;
	Sat, 30 May 2026 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780153754;
	bh=FucqiQ2qPdysKvkXuyD7r6KzExKnA0j1IfnrQ9XeTU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kmFpsMhgqqhp445VLZaivOFdrwbkn6R+aFUwawoPFeS5AEXko2hdI/852TNqqGynp
	 xlZzIrYOWDoAO9cVN1fajiqVA/TYKb4RP1NTC751S0AIZHzAv/xtqH8Z8rI7nuKxe/
	 9iytDDIYM802GEABWfT7oHfAlz7QUdd5Baom6ZGJlIr2WrZ/9IkXNCpdnr4x7pywGp
	 xL5Bcng5v/PhY3cekaEOPt4XWsLyrGd4El81lEnEjIR/VYSEBJK8EcAFvyuu2SNqpv
	 qbiQsQ6xhZ+kf9ungvrSz1V3F0TP3dNavuqCLNwHziDfFCHymZBZhAZS+wCSdX2TTx
	 +bFy5DqUVOjbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve pinctrl subnode and property descriptions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yassine Oudjana" <yassine.oudjana@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260530145800.1029920-3-y.oudjana@protonmail.com>
References: <20260530145800.1029920-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 15:09:13 +0000
Message-Id: <20260530150914.189C81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Commit message inaccuracy regarding capitalization of the pinmux de=
scription.
--

commit a7cfb3754d286ad6671b0ee2b11ae49fbb660dff
Author: Yassine Oudjana <y.oudjana@protonmail.com>

dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and =
property descriptions

This commit updates the Mediatek MT6779 pinctrl binding descriptions to fix
grammar, wrap lines at 80 characters, and remove unneeded literal style
indicators.

> Change "subnodes" to "subnode" in subnode description for better
> grammatical accuracy, capitalize pinmux description, wrap all descriptions
> at 80 characters, and remove literal style indicators from descriptions
> that don't need their new lines preserved.

[Severity: Low]
The commit message mentions it will "capitalize pinmux description". Is this
intended change missing from the patch?=20

Looking at the diff for the pinmux description, the text was wrapped to 80
characters, but terms like "gpio" were left uncapitalized.

> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.y=
aml

[ ... ]

>              description:
>                Integer array, represents gpio pin number and mux setting.
>                Supported pin number and mux varies for different SoCs, an=
d are
> -              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h d=
irectly.
> +              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
> +              directly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530145800.1029=
920-1-y.oudjana@protonmail.com?part=3D2
