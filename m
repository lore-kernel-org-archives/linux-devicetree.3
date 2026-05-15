Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C093C3422
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845427; cv=none; b=AUpbn8SN3lMdFB+YuZ8HPv14QWc5yTW011dzxeMracegphuUH5By8VcAc+8vrnZ+D/CW3tG2SkSTc057yfzaM1WKdN8J2pvgIMqsmM/L4lMUMyxWy2L8fwX7BIKBJ78BUeSgKAzIIEX0SgEpWyqQA5uSQZoTl26dixPkn+YoPc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845427; c=relaxed/simple;
	bh=gevhjTysHR6hwjDTyGHmxkV3zuZFY3KlNg4d5dguU4I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hhhpIV14TTibsKeRO/V5+Y5nnLBXuEiBCi6Be/HRVkmLK0DInGBSJL2agTGD+HUgoMjaqlw67uicpiW1tWzz8R6ZqQ9N9dhz5woi3WiYKrXDiiCz4O+SQ9RejlQHA9WiVepbnNuuo/8LKZkvTiEZrlEXLHu7WzaGKDvlBDSp/bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzmzqTTs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzmzqTTs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FF1C2BCB0;
	Fri, 15 May 2026 11:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778845426;
	bh=gevhjTysHR6hwjDTyGHmxkV3zuZFY3KlNg4d5dguU4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mzmzqTTsfX8Tp9mpw7ItErJxHviTT4gSu/3h0I1DOpvKwUy6ygOPPsGLucAwPSOfJ
	 EluecdUq6gdGBa7b+nzqHab3Vn/7ZVe6xQqq8awnaHcJQ2710iqigUvfUMgGH679/u
	 C4hupPtn0QFIVVwT51ophmoCYYXtmn2DlId2G4gN9pLHomWUTt7nb9/E0+pBlaEVDB
	 FguLa3juXnuwcZS75eV7LBJQUr+EO0KTpvdqPNpARjGhx3Ax5p2q1peFFbahkCmPja
	 dRH7/Uz1WFbE7o6fouj7o5rlRMf3EKVGTRqSGEwAxUGMkCvwZjkWAIqObAqS2iUZBj
	 gUtKc9BcLaZxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD
 card support with UHS modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-orangepi-sd-card-uhs-v10-3-094af27e310d@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-3-094af27e310d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:43:46 +0000
Message-Id: <20260515114346.A1FF1C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing driver support for UHS pinctrl state switching in SpacemiT=
 SDHCI driver
--

commit dccbc831846f54656728199aecf02388bd320143
Author: Iker Pedrosa <ikerpedrosam@gmail.com>

riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes

This commit adds complete SD card controller support with UHS high-speed
modes for the SpacemiT K1 Banana Pi F3. It configures the sdhci0
controller, including regulators for power switching and dual pinctrl
states for voltage-dependent pin configuration.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv=
/boot/dts/spacemit/k1-bananapi-f3.dts
> index e20daa50a152f..72f77e9edd63d 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
[ ... ]
> @@ -374,3 +376,21 @@ hub_3_0: hub@2 {
>  		reset-gpios =3D <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>  	};
>  };
> +
> +&sdhci0 {
> +	pinctrl-names =3D "default", "uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;

Does the host controller driver (sdhci-of-k1) support switching to the "uhs"
pinctrl state?

The generic mmc and sdhci core subsystems do not automatically parse or
switch to a "uhs" pinctrl state, unlike standard states like "default" or
"sleep".

> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vmmc-supply =3D <&buck4>;
> +	vqmmc-supply =3D <&aldo1>;

If the driver does not manually look up and select the "uhs" state when
dropping the vqmmc-supply to 1.8V for UHS modes, will the pads remain
locked to the 3.3V configuration?

Could this mismatch between the pad configuration and the supplied power
cause signal integrity issues or data corruption when operating in sdr25,
sdr50, or sdr104 modes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-orangepi-s=
d-card-uhs-v10-0-094af27e310d@gmail.com?part=3D3
