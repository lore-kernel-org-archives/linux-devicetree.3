Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F0836E49B
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929744; cv=none; b=umzsUNO87udy4vXpjULcNq6g0EerKrMtCIPccbU+YtB5+bqAIuc47Lp6fZlqBDWUh/jC2Y2ZjXygWK85xTw3+v+w2F54p1W+5hbCwBjHW/i+oc88LRAR0uOiIbQQb5wI2NMjo5rIXEnZp99p5LtUEFs7ZxTln9dHhdjD37eXej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929744; c=relaxed/simple;
	bh=Gapt9H+XT8lUUDmt1PCHYO0gjiXGbrf/LBiMcFTGZGI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mjx1HtZeCJ8bKs4g9Ckjk0gHjOkKPkCHPO0UBnRyRkJw0P2kV9M02Bb8FbwUabZs0rehfWo0OH3jRSGwuw+3GUJtGBVE+6b+IjLud9VY2a3k43avkpW0W599cGPRizzXlfyNHL0oWpCctwBNaI+BfPqQcEAn2ntwjE/T4kqawVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnhJB7xE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnhJB7xE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46871F000E9;
	Fri, 28 Aug 2026 15:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787929743;
	bh=RSE+ae3iFdOnAvnZtRmZIh7KLZPrM5YAMBtYa+5ADWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AnhJB7xE/7bKcX7q7/uFDID/4pBmd8ab/K3xj++nLX2dzGeNCWQUhOKr9wzEy5TjQ
	 JuTcsn2ffCEEcCmzOHqcdz4p2JuveSMDkr9VABTcfnMXa08xeUr9jpcE5fhKwbt4cl
	 tmXxbXu8fbUwVtxzj0A7kqNzTvAGrQhKqKHGzyts2sICqhGxwRtr2HvRNp8OVonytQ
	 bpnDgWc8/NLDJ8ptVWqLG+vHR3k6Sw2BJa77D17eLy83rPFm5+CMf+P1PCC3+V/drT
	 DB283Ujx3Hx561JBcM+o5IpRHmBqs4o1EPw2lcRTkUOKWFydwotunwHl56B6/yCN4J
	 3KLC8M2/A/B3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: stm32: Drop bias-disable from STM32MP15xx
 DHCOM SoM sdmmc1_b4_pins_a
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260828150111.173089-1-marex@nabladev.com>
References: <20260828150111.173089-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:09:02 +0000
Message-Id: <20260828150902.D46871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bias overrides for 'opendrain' and 'init' pinctrl states.
--

commit 9ff09c9ba4ada67d4ecaab0a65874ab8bca8e136
Author: Marek Vasut <marex@nabladev.com>
Subject: ARM: dts: stm32: Drop bias-disable from STM32MP15xx DHCOM SoM sdmm=
c1_b4_pins_a

This patch drops the bias-disable property from sdmmc1_b4_pins_a in the=20
STM32MP15xx DHCOM SoM device tree to fix a DT checker warning. It ensures=20
bias-pull-up is the only bias-related property present in the pinctrl=20
subnodes for this state.

> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/b=
oot/dts/st/stm32mp15xx-dhcom-som.dtsi
> index 4cc633683c6b7..0a4263e6209d8 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> @@ -505,9 +505,11 @@ &sdmmc1_b4_pins_a {
>  	 * - mandatory on SoMs without SD voltage translator
>  	 */
>  	pins1 {
> +		/delete-property/ bias-disable;
>  		bias-pull-up;
>  	};
>  	pins2 {
> +		/delete-property/ bias-disable;
>  		bias-pull-up;
>  	};
>  };

[Severity: High]
This isn't a bug introduced by this patch, but should the bias properties=20
also be overridden for the opendrain and init pinctrl states?

Earlier in arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi, the sdmmc1=20
node defines these additional states:

&sdmmc1 {
	pinctrl-names =3D "default", "opendrain", "sleep", "init";
	pinctrl-0 =3D <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
	pinctrl-1 =3D <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
	pinctrl-2 =3D <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
	pinctrl-3 =3D <&sdmmc1_b4_init_pins_a &sdmmc1_dir_init_pins_a>;
...
};

Without similar overrides for &sdmmc1_b4_od_pins_a and=20
&sdmmc1_b4_init_pins_a, they will inherit bias-disable from the base=20
dtsi (stm32mp15-pinctrl.dtsi) when the MMC core automatically selects=20
the opendrain or init states during card initialization and specific modes.

Since internal pull-ups are mandatory on SoMs without an SD voltage=20
translator, couldn't inheriting bias-disable leave the bus lines floating=20
during card initialization and cause storage failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828150111.1730=
89-1-marex@nabladev.com?part=3D1
