Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3196D25B0B2
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784000695; cv=none; b=lNVBLa2NDIn0h+Lo7KPTiBkYpBp8/HNVpgdLnNBYl0jY+Mn/8JULXw42JUUgr5c0nMuui3zqoh4WEP0nMegCmIdIB+rb+Zjb2TKCGICqNYE5pHE/8bvxsGoTkU6uiloiDPV0jpOFku30TsJKCxZcY/w+Ink4TRBCyyELuq1KIfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784000695; c=relaxed/simple;
	bh=j+xQllf1P4tgc926vFhFEQXVmBq2KVdwlFAM1L82l2U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Khtx/nxuGT7azW/bjPhErLgdtjXIuxJ9uk3gEhwzbBxyaZGZH3Ll99DW1I89YyGIKiL000pwnWg/0Ws+NaV7satPIMjQQ5QhnLfTf+DjfPJ7CSJKl+uYjWrHhQO0HhDziV5yPyvzLvvJAWmg6KoOln03jOAUCbOowYoXsrwcZ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cuxJzWkO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cuxJzWkO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA771F000E9;
	Tue, 14 Jul 2026 03:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784000693;
	bh=7SFkWPNc5dNoR9IYYMEFv7rum/QxLOYRhTJMUWX5Dwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cuxJzWkOFMrwP5xuiWwq/u2hVBrhtHYXmPnaUarB9TFFGNnfbFZf8/LtvfdmgqGNR
	 JgJzZjl3XfUpp6HAKNAjDGqlC+RwQL7eQeqsRfbUHK8tt5WNjDy1eGO7nmGcn0xOPg
	 7zm4Bg85JJy2IoNcoezt4eixMg35CsfIlV9u5NKSb7OgTvK0RNAqS4BXhu0TbR57hP
	 u6MLBMJG+++MhBhXBalmrKfMwCd/LQFHmHHhL9mn9BpnsoVKiJ5y+QWiMqcLxR27RJ
	 S4vMZHtjXb6xsp14Zgddv2sJB1QpW1fPt6SH48skFTZmWcQiMjUO/rJlM3Uk24qZYS
	 KW/hTXijdCAKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 2/3] riscv: dts: starfive: Correct pwm nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hal Feng" <hal.feng@starfivetech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714033050.44952-3-hal.feng@starfivetech.com>
References: <20260714033050.44952-1-hal.feng@starfivetech.com>
 <20260714033050.44952-3-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 03:44:53 +0000
Message-Id: <20260714034453.8AA771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing electrical pad configuration properties in `pwm1_pins` a=
fter node split.
--

--- Patch [2]: [PATCH v22 2/3] riscv: dts: starfive: Correct pwm nodes ---
commit af3d5e9905acdead9e2816d09f13f054b179cbde
Author: Hal Feng <hal.feng@starfivetech.com>

riscv: dts: starfive: Correct pwm nodes
   =20
Each of the StarFive JH7100/JH7110 SoCs has 8 OpenCores PTC IP cores.
One OpenCores PTC IP core can output one PWM channel. Change the register
size to 0x10, since an OpenCores PTC IP has only 4 32-bit registers.

Fixes: 8d01f741a046 ("riscv: dts: starfive: jh7110: Add PWM node and pins c=
onfiguration")
Fixes: 5e598b99fedf ("riscv: dts: starfive: jh7100: Add PWM node and pins c=
onfiguration")

> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7100-common.dtsi
> index ae1a6aeb0aeaa..85106545090ea 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi

[ ... ]

> -	pwm_pins: pwm-0 {
> -		pwm-pins {
> +	pwm0_pins: pwm0-0 {
> +		pwm0-pins {
>  			pinmux =3D <GPIOMUX(7,
>  				  GPO_PWM_PAD_OUT_BIT0,
>  				  GPO_PWM_PAD_OE_N_BIT0,
> -				  GPI_NONE)>,
> -				 <GPIOMUX(5,
> +				  GPI_NONE)>;
> +			bias-disable;
> +			drive-strength =3D <35>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate =3D <0>;
> +		};
> +	};
> +
> +	pwm1_pins: pwm1-0 {
> +		pwm1-pins {
> +			pinmux =3D  <GPIOMUX(5,
>  				  GPO_PWM_PAD_OUT_BIT1,
>  				  GPO_PWM_PAD_OE_N_BIT1,
>  				  GPI_NONE)>;
>  		};
>  	};

[Severity: Medium]
Should pwm1_pins also include the electrical pad configuration properties?

When the pwm_pins node was split, properties like bias-disable, drive-stren=
gth,
input-disable, input-schmitt-disable, and slew-rate were configured for
pwm0_pins. However, pwm1_pins only has the pinmux configured.

When the kernel applies the pinctrl state for pwm1 during probe, it will on=
ly
configure the pinmux and skip the pad electrical settings. Does this leave =
the
PWM1 pad in an undefined or default electrical state that could cause weak
signal drive or other signal integrity issues depending on the hardware def=
aults?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714033050.4495=
2-1-hal.feng@starfivetech.com?part=3D2
