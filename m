Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7CD22126D
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082905; cv=none; b=h3T2eWJ/OCqQGUXEhIrUOQRD8QyO2tonIUB3J4gV/3+68GMSWOXn6W4LS/evNT+l7Bf1db/tZPugOrM8siwOh03W2Mg7eRKc4PL4Rci+4rRsZtmUc/gZpCsxO+AfUG9ur42lzVdlXPV3bORixi0N2bCtR4VBOkXKAx5GswLGGjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082905; c=relaxed/simple;
	bh=cWUN3BEo21DkrwYe4s/CZw6ZsPb61aHGNdnzGibyDns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K0zTm4UMDpNYQdzqM1VzUtENSV/O8mqdnETQ+DFLWkDibkdY5OYFx6Asv9+qBVb40k8h1Wf1czCUVSvVhsqTv8xQsjMC2c3b2V8Z6QT8Uom28/pDhjuq86zjKMtRzAztvHPvLNa5Y58ReS/a1f0APZQ2sM/ciB2rFTvorIxFSEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GW5P819e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GW5P819e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BC31F000E9;
	Sun, 26 Jul 2026 16:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785082903;
	bh=a3Z5hObcr6Bet1sZJuN4wILe52g/t2QaLl02VlKPkjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GW5P819e98nA1I61CG9ijUmBgSaH4BVQ8ueD6/yOil3VdxVoeeiPpz1/NM+m0S4G3
	 sC1DMOV0/0NR1qlnG1WAlmXiExJqUpkhSQttycSYa1HbS71XEeMBXV5xHYGPt4R5ZY
	 I9lz5ah0B8noSYcBV7dv8sYHK5F9I7b2+xUWYYP5cJ6pf/20NvsfYh0RHMoJruKjU0
	 0EPculirVeHYhafOcUxfrmVfWGGqkJbjLITA6OuMBGn2pyzbmJ2csVPOJdW5U94RGn
	 hu5CiwUycWTRYAJ2U4Wbo+qU+SQ0SKlHjnC5O4rG57RgBF+8K0cnoHPPtA9vawhnmN
	 /iChTLLXj92Eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/9] ARM: dts: stm32: add Ruiside ART-Pi2 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Changjie" <liucj1228@outlook.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <MN0PR19MB609139CC747F89EB89FFBB00ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <cover.1785080950.git.liucj1228@outlook.com>
 <MN0PR19MB609139CC747F89EB89FFBB00ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 16:21:41 +0000
Message-Id: <20260726162142.D5BC31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `wakeup-source` property for the User button, preventing=
 it from waking the system from suspend.
--

--- Patch [8]: [PATCH 8/9] ARM: dts: stm32: add Ruiside ART-Pi2 board ---
commit 2a08edcf42f867cb883ef58829a398b9300b3561
Author: Liu Changjie <liucj1228@outlook.com>

ARM: dts: stm32: add Ruiside ART-Pi2 board

Add the STM32H7R7-based ART-Pi2 with 32 MiB of external HyperRAM,
UART4 console pin configuration, user LEDs on PO1 and PO5, and the
user button on PC13. Enable the four-bit microSD slot and reserve a
coherent DMA pool for noMMU DMA allocations.

> diff --git a/arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts b/arch/arm/boot=
/dts/st/stm32h7r7l8-art-pi2.dts
> new file mode 100644
> index 0000000000000..ead1418178af7
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts

[ ... ]

> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		button-user {
> +			label =3D "User";
> +			linux,code =3D <KEY_WAKEUP>;
> +			gpios =3D <&gpioc 13 GPIO_ACTIVE_LOW>;
> +		};

[Severity: Medium]
Since this button is configured with linux,code =3D <KEY_WAKEUP>, does it a=
lso
need the wakeup-source property to enable it as a hardware wake-up interrup=
t?

Without the wakeup-source property, the gpio-keys driver will not call
enable_irq_wake() during suspend, which means pressing this button might not
actually wake the system from sleep as intended.

> +	};
> +};
> +
> +&uart4 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785080950.gi=
t.liucj1228@outlook.com?part=3D8
