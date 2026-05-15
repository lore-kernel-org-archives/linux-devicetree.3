Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD0344CAEC
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846400; cv=none; b=frtUB/LiKxsWO4Z0K6K3Yg82F534nRH4Bv/J0ckhfYI9TOaPBqbKxWMUiUBhhoTSX4fzq+wmwLgmn91Gr9uPsP/7p6gEknXGcN4gQKOBj+lbKNG8EgTNdOEF0EdEEHWyB1QWdAIw1q3Z9+raRSkTqaMfrqyUEQg3mMA+oEXyMt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846400; c=relaxed/simple;
	bh=+52I+J/OgT+Y8T5o0hZIVWeq0a2hUc2CW6uDVYq7H7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RNMGQHvCRD4QsIZ4QzR48u3B+1fGYBa4nj5g3xFQMUs5HpjE9qmZ6y5IMx3gyzYt2qmN6AKv/qJ5EIf92RnFMcKqc7W5+7xFQm60XDW7mr0GHNmCss1g8itoqDRczBWZlKpy9dAxLb+LsblzwoeT7wQouttnZ0O7fLvRoRTzLLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnMB2NHO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnMB2NHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9D2C2BCB0;
	Fri, 15 May 2026 11:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778846399;
	bh=+52I+J/OgT+Y8T5o0hZIVWeq0a2hUc2CW6uDVYq7H7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pnMB2NHOOhwzF4bwCNtPwfgkVoAaskYOEq9UOXHdQgNp450r3D8mXyl/X3WkyrrRW
	 eemc0NFKGfG0lk2+/A+fqWD6FNuyhBiSqCrsDgykguxDR6eGJDyt4NOs0s8PKj6DGs
	 XHy5wq8pHVHeXAtBy+S17GHRXBN7eXDSbYXZTmUuShIIF2x3J2Kt7YG1WrrWy0ZRvq
	 L9WrS9+lEaukf3/AcRsBG8T9MxMak9sT2zmXQgQ8CmFJRuGFFed/l+GiyBeI+HzbK2
	 1dudEQ3AJ1qsus3rKgAfwAcCwTK/pEFQBBqMZBw2K737fJ66TiTT6TfCBzRlSNCAj/
	 Efz5yr6c73kNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/4] riscv: dts: spacemit: k1-musepi-pro: add SD
 card support with UHS modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260515-orangepi-sd-card-uhs-v10-4-094af27e310d@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-4-094af27e310d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:59:58 +0000
Message-Id: <20260515115959.3D9D2C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The SD card detect GPIO (`cd-gpios`) is configured with incorrect =
active polarity (`GPIO_ACTIVE_HIGH`), which will invert card detection.
- [Medium] The UHS-I I/O voltage supply (`aldo1`) is incorrectly marked `re=
gulator-always-on`, preventing the MMC core from physically power-cycling t=
he SD card during error recovery.
--

commit 6129b29ed8762cd8d45153d74898125f35ee85bc
Author: Trevor Gamblin <tgamblin@baylibre.com>

riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes

This commit updates the Muse Pi Pro devicetree with SD card support to match
the OrangePi RV2. It enables the sdhci0 controller, configures the pmic
regulators for card power and I/O switching, and adds UHS-I mode support.

Link: https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-=
0-aefd3b7832df@gmail.com/T/#

> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/=
boot/dts/spacemit/k1-musepi-pro.dts
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts

[ ... ]

> +	pmic@41 {
> +		compatible =3D "spacemit,p1";
> +		reg =3D <0x41>;

[ ... ]

> +		regulators {
> +			buck4: buck4 {
> +				regulator-min-microvolt =3D <500000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-ramp-delay =3D <5000>;
> +				regulator-always-on;
> +			};
> +
> +			aldo1: aldo1 {
> +				regulator-min-microvolt =3D <500000>;
> +				regulator-max-microvolt =3D <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;

Will marking aldo1 as regulator-always-on prevent the MMC subsystem from
power-cycling the SD card during error recovery?

If a UHS-I voltage switch fails, the MMC core calls regulator_disable() on
vqmmc to drop the voltage to 0V and reset the card's internal state
machine.

The commit message notes this matches the OrangePi RV2, but the OrangePi
RV2 leaves aldo1 without the regulator-always-on constraint.

> +			};
> +		};
> +	};
> +};
> +
> +&sdhci0 {
> +	pinctrl-names =3D "default", "uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio K1_GPIO(80) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;

Does using GPIO_ACTIVE_HIGH invert the card detection logic?

With the internal pull-up enabled, the physical pin inherently reads high
when the slot is empty. To map the physical low state of a card insertion
to a logical true, this usually requires GPIO_ACTIVE_LOW.

The commit message mentions matching the OrangePi RV2, which uses
GPIO_ACTIVE_LOW for this same pin.

> +	no-mmc;
> +	no-sdio;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-orangepi-s=
d-card-uhs-v10-0-094af27e310d@gmail.com?part=3D4
