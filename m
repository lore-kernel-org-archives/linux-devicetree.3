Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F98F32B127
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780155332; cv=none; b=o9In+mlg4doz34SbA93EzVDlB3BoNGnBO4YzeAyhVhItLt+o7/u/HCS8EIEkmNuG5ncBIc3I0oq/3AbWzowD99cFM7ohD0y4hzG07t3/EP8iwBpiMxFDg1XEITSJ1xrIfIXfeUeWOblBwU0drs/18foB8+ia0FMGwDfF5pF3Ia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780155332; c=relaxed/simple;
	bh=PqkysRhzAufVdUh78nFR3Mv01mlCbuMk0wAkm+usMs0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hq+TBAYek3PHAfth8M8x8eF7YxYdAa8EyNRKaDIghiDnMYxa54YlxX8+NFDdL65iTWoV+HCazoHXGAOYUx7ErXaCrUE35wNGgXTgzKnCf9aa2BBcPXMeKoZ3gd8C6D5+KyJbtCaALjUw1sO+maj/uJoiwgO71/jsMd0ZBQuDgek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+5VMxwE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+5VMxwE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF771F00898;
	Sat, 30 May 2026 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780155330;
	bh=Sf07hg1deNE1iE38f7t1rnDdTdMuZyo8X//wZzaPuPo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k+5VMxwE4rj0787Wff8kAQy88i2LThnQ5cv084vUhhsr/WXxI+EaDnG50JjCtKOsY
	 HBrtJCOjQkNErBi4cRYz590Cso0xdbpUEEkotrmDWwFhyz7B3RqntAO4tyOj2nLGhC
	 lPnoOxlcrmKiZlvSffoibgftBijwfBBWpmOTnVNP/hdtZhAStftOZTA/ZzDrkCrt5I
	 8/mEc8ygk7tlx7ggXNVEG8DAVbf8YzZhOWTzC98Hf7NUswTcJYn9MlbMyVqxHRlG+c
	 +SPrOcVYbXihGZmzEoeCLQUhkg7ORCW37ERyxzIC1IhsvyardoPaFvkIYl5D1UeBZl
	 QWVFMSy8Y+Pyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/6] dt-bindings: pinctrl: mediatek: Add bindings for
 MT6735 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yassine Oudjana" <yassine.oudjana@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260530145800.1029920-6-y.oudjana@protonmail.com>
References: <20260530145800.1029920-6-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 15:35:30 +0000
Message-Id: <20260530153530.ABF771F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit introduces pinmux macros and a driver for the MT6735 pin=
 controller but completely omits documenting the corresponding compatible s=
trings (e.g., `mediatek,mt6735-pinctrl` and `mediatek,mt6735m-pinctrl`) in =
a YAML schema file (such as `mediatek,mt6779-pinctrl.yaml`).
--

commit 07ce040d313a0955bafec476cf793da45ce851b5
Author: Yassine Oudjana <y.oudjana@protonmail.com>

dt-bindings: pinctrl: mediatek: Add bindings for MT6735 pin controller

This commit adds device tree bindings for the MT6735 pin controller.
It introduces macros corresponding to unique pin-function combinations to be
used as values for the pinmux property.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index b539be153f6a4..1e833d0e7f47a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21083,6 +21083,12 @@ F:	drivers/pinctrl/mediatek/pinctrl-rt2880.c
>  F:	drivers/pinctrl/mediatek/pinctrl-rt305x.c
>  F:	drivers/pinctrl/mediatek/pinctrl-rt3883.c
> =20
> +PIN CONTROLLER - MEDIATEK MT6735
> +M:	Yassine Oudjana <y.oudjana@protonmail.com>
> +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
> +

[Severity: Low]
Does this patch omit the YAML schema file for the binding?

The patch introduces the pinmux macros for the MT6735 pin controller, but it
doesn't seem to document the corresponding compatible strings (e.g.,
mediatek,mt6735-pinctrl) in a YAML schema file.

Failing to provide the compatible string in the schema will cause device tr=
ee
nodes using this hardware to either bypass strict dtbs_check validation or
generate warnings.

Should the YAML schema update be included alongside this header?

>  PIN CONTROLLER - MICROCHIP AT91
>  M:	Ludovic Desroches <ludovic.desroches@microchip.com>

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530145800.1029=
920-1-y.oudjana@protonmail.com?part=3D5
