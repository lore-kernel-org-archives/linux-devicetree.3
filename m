Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06F741D4E9
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448018; cv=none; b=kUo8BKeXZ2xVyqRCYmwnOdKPn/l9t5SS60XUYVkYiq1tmTgLJF1DyTT2JLHPEcbBNQYAToMW+xfOCR4qYpyHrhWQVV8VM6Lgp89Gfo0uik4LAtQl1ay+xs4+Sds93ChtNVVQremFj26NzL2xea7SLiC5PHeZsoqYI3yAHVIns3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448018; c=relaxed/simple;
	bh=mTvg6KcNWngMK9UYnZj2cCjCP/WJFUTI3inxM+yZ1es=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RwRR2jMlQ9oSknheSQm2dRnJkqcY+WQ5DKd/DzZuiHxdVW2pKow1K1WEFmUQEQsJ85u3cRZQwU8eQYCZFJTWWfZ7XGPIA0fb02qC5jpnKzXG4wMij7Zb62E6ideIj0nmADnFn/Pc9/+mwHdfk592MTJdx2VTUE67BT7I4TS4iio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGT1UxWL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGT1UxWL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6971F00893;
	Thu,  8 Oct 2026 08:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791448017;
	bh=1CAsfYXouPqaPw4SppP8YN6Wq5UXbGRuoARLoWBg7oc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FGT1UxWLPTie1j3ovS8QLZAZ8ZuoYPfd3fSxcOP+R9PpZhoqB9FWtqDdPY6+y1Vm/
	 PQ3mDM6Dm7rRAbheBij+U7K/b7HZOfrFs2xRWnVuOpLYaO80AJWCmK1c7lwJHUAa1n
	 Ke964HOC5WCgweWaRj1uSqmrrLnWpa6kZySif66hNEkiHWxkMb2auNr8gKxqFi6TWZ
	 wTeqKXL5PuOZu64PzGFuLQfkSOHayFlWPBR3mDhL3DhRhJAmeb2QFjOm9j/ZqYzldV
	 wrl3AgPIsDFeyQ1plPXPwGLd5B41yP9mZoHxLzwzE3AFZBct3K82pof+SzlQIfxmVA
	 +BRyT2VF5bV9w==
Message-ID: <sashiko-outbox-163838@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable
 the ethernet port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lucas Tanure" <tanure@linux.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20261007082627.63807-8-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-8-tanure@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 08:26:56 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: magic number used for GPIOH_6 interrupt instead of macro
--

commit f585da8dc95da5050c5f6a8bd4b1962e662ae547
Author: Lucas Tanure <tanure@linux.com>

arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

This commit enables the gigabit ethernet controller on the Khadas VIM4 boar=
d,
configuring it to communicate with the external Realtek RTL8211F PHY over
RGMII. It also configures the RGMII delays and sets up the PHY interrupt
wiring.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dt=
s b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 0fa83362b4179..4a2b0b5636559 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts

[ ... ]

> @@ -256,6 +257,27 @@ xtal: xtal-clk {
>  	};
>  };

[ ... ]

> +&ext_mdio {
> +	external_phy: ethernet-phy@0 {
> +		/* Realtek RTL8211FD-CG */
> +		reg =3D <0>;
> +		max-speed =3D <1000>;
> +
> +		interrupt-parent =3D <&gpio_intc>;
> +		/* RGMII_INT on GPIOH_6 */
> +		interrupts =3D <154 IRQ_TYPE_LEVEL_LOW>;

[Severity: Low]
Is there a reason to use the magic number 154 here instead of the predefined
GPIOH_6 macro from dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h? Using the
macro directly might improve maintainability and readability.

> +	};
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007082627.6380=
7-1-tanure@linux.com?part=3D7
