Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7276A296BDC
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283294; cv=none; b=rGHXU53CNkJ9YSxt0M6897/l1crOszaPfT993FWraCwX/KqwVXnLlJdRbs+EMITHPrQ18Dey++vvqDbHrsFO4c2TdJtAg7JAJIxTMIEOHs+lo+qgXZhWQd+5rrpyvkskzTtChVf2nQ/GtP5KDHJ4M9OILGQQu39riLuur3l9trg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283294; c=relaxed/simple;
	bh=1MosHPMuC14CyBybLyW/nptqgW3weNXHReNcwRgxPjc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LYuXhJD6AznUlOyAp4u1jV9Dt1lPngjPRmQL9pjna2pLkdu0Lsv/0CzwAtFY1pFlobkZqBrnYrTFhLEIxhDPOgs33LASFbHgmLHUey5XqATvQcgkuzfh9VHDhpAX7bgBr5t+XOKxH5huANcdy46wr/izos2iTESFc6wKA3g2NrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCn4U6cL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCn4U6cL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FC51F000E9;
	Wed, 20 May 2026 13:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779283293;
	bh=yhjhpUvTsOpaD9p4A9rBDLk0r1AwC3i7oRJNa9e1U7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OCn4U6cLL553nWrfS5DTaK9IkjoXds8hNkhsLgXn0aCSprqMw1seGXtbFE46WKuYH
	 ViztkaOsbQv38yDVtse6jNO3DhG7+7sumlFA1P+7A5UQ8tLgFpIKw/nXXLq2xvhYri
	 6xhVitHok6i0GnweLM848nM4ANR8sgoIYvOiz8Q7BtX2wcK8hqdEbXVmLULhX/neio
	 A9LyTCGw+hWRAq98R/35eAM3rjne0noiIGf3C/O32+2JCDV3qJvFKXpQ6ZaWBe93n0
	 dldldW2k9VGLqN99nXCJcZbnU6TpEAMCcChxMVvd7W4DNuzCzLMMInC7B0UsYgjV11
	 KgaummJYj/HYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Heider" <a.heider@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260520130624.1763487-1-a.heider@gmail.com>
References: <20260520130624.1763487-1-a.heider@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 13:21:32 +0000
Message-Id: <20260520132132.E0FC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Inverted SD card detect polarity in `cd-gpios` property.
--

commit b8da2f3ea83cbd0820dd4246075e26e687bac678
Author: Trevor Gamblin <tgamblin@baylibre.com>

riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes

This commit updates the Muse Pi Pro device tree to add SD card support,
enabling the sdhci0 controller with a 4-bit bus, UHS-I modes, and voltage
switching.

Link: https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-=
0-aefd3b7832df@gmail.com/T/#

> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/=
boot/dts/spacemit/k1-musepi-pro.dts
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
[ ... ]
> +&sdhci0 {
> +	pinctrl-names =3D "default", "uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio K1_GPIO(80) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;

[Severity: High]
Should this cd-gpios property use GPIO_ACTIVE_LOW?

With an internal pull-up enabled, the physical card-detect switch usually
connects the pin to ground when a card is inserted, driving the signal low.
Using GPIO_ACTIVE_HIGH might cause the MMC subsystem to assume a card is
inserted when the slot is empty, and report a removal event when a card is
actually inserted.

The commit message mentions matching the OrangePi RV2 configuration, which
would typically use GPIO_ACTIVE_LOW for a pulled-up card detect signal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520130624.1763=
487-1-a.heider@gmail.com?part=3D1
