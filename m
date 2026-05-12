Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7372319CD03
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556019; cv=none; b=dNrWzqVzEB41F4sNO8BCcvfy1wQFr1YaOkqs1QtYDIJ9q++KZYWp/gKfrLWTcOoZcp3wkxoDQaPklsxPSbuQ/o0fqOlswrFSiQ8vdTrzMG5lflp6pPoFbc3ryzm8giScGcaaxTRNoDH1f3vINUIHLaZz3CRPFSDraYEaWO6TIes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556019; c=relaxed/simple;
	bh=U6qf8qChtcqLohPhCGCQezCQJ/enXGnZURrnBSTIh30=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UrToiSJShDlDx5TWM5itWi943q6dXf7PqTi3efaM+MR8uO4Gjctd+5JFeFTdCqgbKdz9eC3FSrfx/HFgQaJnS/yiinmYnGdymlkHJdtVf+7GFPnQIOHhrCTYekVXAJj0/l78cE848/tMBLG1Amu6/MCNLMbp4GZLBe9iUNRMoAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQedIWxe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQedIWxe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A14C2BCB0;
	Tue, 12 May 2026 03:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778556019;
	bh=U6qf8qChtcqLohPhCGCQezCQJ/enXGnZURrnBSTIh30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UQedIWxearSImMPcdm9NLaXhgy03QE3VyU70Dn/2FSjWM9s0DwgYQidj5bnZPbGEl
	 P7fWvsLV8wtuO31pPGOSIO8IMowdZTaLbfxwqQrnJ6cqLEwRSEna6kzHaKuVQ5L1j4
	 nt5wY7fq0dJAQUYRyFPpPka24pVU+gj0ANV/rWrQQaEI0WZXEXaR5/E4pQHmbcAtyk
	 xS7anXBm/R7w0ZE9ub3ncudRQyZO5LX89DRYjjuBiHOCuRvi4GBowiEyjIhnaFJ0RW
	 0shhH6gdBKy3e1gMZGt49dvJiE+nG5QwF2nK/FPpxUJ8G6UMWP7jAG+h3/BlnDg+dK
	 qwphFVJkr8zvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 6/8] riscv: dts: spacemit: k1-orangepi-rv2: add SD
 card support with UHS modes
Reply-To: sashiko@lists.linux.dev
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-6-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-6-ae48c0b2b2cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:20:18 +0000
Message-Id: <20260512032018.B9A14C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] `vmmc-supply` is mapped to an always-on regulator (`buck4_3v3`) wh=
ile enabling UHS modes (`sd-uhs-sdr*`), which will break SD card initializa=
tion after a warm reboot or driver reset.
- [Low] The device tree specifies `cd-gpios =3D <&gpio K1_GPIO(80) GPIO_ACT=
IVE_HIGH>;` alongside the `cd-inverted;` property, creating an ambiguous do=
uble-inversion.
--

commit b95f288bf0d85d42bac4ccd6d594e14cf818a232
Author: Iker Pedrosa <ikerpedrosam@gmail.com>

riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes

Add complete SD card controller support with UHS high-speed modes,
including configuring the card detect GPIO and connecting the vmmc and
vqmmc supplies.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-rv2.dts
> index c95ca38e3d4a1..1ed76e0ff8064 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
[ ... ]
> +&sdhci0 {
> +	pinctrl-names =3D "default", "uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> +	cd-inverted;

This isn't a bug, but does this create a confusing double-inversion?

According to the MMC bindings, if a GPIO is used for card detect, its
polarity should be natively described in the phandle flag (e.g.,
GPIO_ACTIVE_LOW) and cd-inverted should be omitted. Combining
GPIO_ACTIVE_HIGH with cd-inverted forces the MMC core to perform an XOR
logic.

Would it be better to just use GPIO_ACTIVE_LOW and drop cd-inverted?

> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vmmc-supply =3D <&buck4_3v3>;

Will this cause SD card initialization to fail after a warm reboot?

UHS modes require switching the SD card's signaling voltage from 3.3V to
1.8V. Since there is no software command to revert a card from 1.8V back
to 3.3V, it strictly requires a full physical power cycle.

However, if buck4_3v3 is configured with regulator-always-on elsewhere
in the device tree, mmc_power_cycle() will silently fail to cut the
physical power. After a warm reboot or driver error recovery, the host
controller will reset to 3.3V while the card remains stuck expecting
1.8V signaling.

If the hardware lacks a load switch to toggle the SD slot power, should
the UHS modes be disabled to prevent this?

> +	vqmmc-supply =3D <&aldo1>;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-orangepi-s=
d-card-uhs-v9-0-ae48c0b2b2cf@gmail.com?part=3D6
