Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792957381;
	b=y3CBX3eiOHipjsKWggxqNo2heknzROriKIXjtGYM/+99Olnpsv65aKdHDrRzGlgDLskP
	 bSCUlmAg8UcIJwdyVPIszyc8kFNRi2qVoaNKK3lbdoL9JPFPCYHU5C8Bpfo/Z8YYU/omm
	 qfIojc4vBkfzpCFB8DhNsPxz+hIcyjKHFenlZwmUMFG1CRQHu9TsBZ8nxEoNXS+2fkGW1
	 VfSaEoqohokjqb7AwjKdobSYLRAbbl7q1arcqMYkWkN8+xmwYqMNDUXNTMutMAK4bw4Xw
	 NzelZydtdGWdYN7ZzhsqpeJ5diLRYAkMzAsivMIAzFYa191j477FSxoiX87biO6DmPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792957381;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kqlg32oSSwB4pQjx2pNduvbW/yCoSss1FXshNF6lS4c=;
	b=hekvbgo4uOolRCRkGufzbuZ1PH/hYPvoGEDMy6e4VPRN+n1Sa40HXHQOb6CNze10q9Wd
	 AAUsjBuh00+VC/Xp8bpquSdds6+1O7TxHZ/QgLgxOq49KbsBzIG7lD36bepE8DLR3OhwQ
	 JMARixeENYlMO/dfb8TOfuqPDj1BjGhoJTZ4WbhL/LdUF7ruu/nr7Ccu/SNM8rKoBAOVm
	 6SyR4xNyTVn2g6oIJopu2DoRZ0Q91wxenxYUIHOi05F7uP2/Opyetn2aQ+E1XiSWhyTsV
	 Gg12utoNA1Q1dkL7u7zGn4KhGCUa16i2QJbBwcCgn6qtRnUudhlNimAMG8jKYplPBqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8MaDGAy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524ED606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 19:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8MaDGAy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9583A1F01825;
	Sun, 25 Oct 2026 19:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792957380;
	bh=kqlg32oSSwB4pQjx2pNduvbW/yCoSss1FXshNF6lS4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O8MaDGAyyjE7zY6RRt/rUYA7RwEejsY8K8v+sMAfWqH13ZueBRy+joRjOdz4vN3aQ
	 T6dBzreEAXDu51NcFgO9u6IkduQk0ZDm28ixTEfZtrWi5Hk/lkIS0h4UHAbD0IHL+N
	 OivduHDj1uwAcxHeFARKY21SFGGXVWT9mSSVJFA1mPzztOmgriPA1bhp7IUerlTweN
	 DkmbbFD45UgQKNpEA5oH0B3v3mrE3QYxY16pytfr12N1qTsMfvwQJG7vDvVeeDm024
	 Ztp2ynypDl2TKct+C1NdKErSKTs0+ZSwUiHV6YiqIL2saXDv6mxPmp9v+NRCN0XdQH
	 wtWYCwoEiUqsg==
Message-ID: <sashiko-outbox-184389@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] thermal/drivers/amlogic: add S4 support
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261025192244.209256-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192244.209256-3-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 19:43:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] thermal/drivers/amlogic: missing S4 bus clock in binding and com=
patible
--

commit dfe5abf7967aecb95213a29d43ea6efa65ceb5d9
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

thermal/drivers/amlogic: add S4 support

This commit adds the amlogic,s4-cpu-thermal compatible string to the Amlogic
thermal driver match table, reusing the T7 parameter data so that the S4 CPU
thermal sensor reads its calibration via the secure monitor.

> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_=
thermal.c
> index 60728de6968ac..c58bac633bedc 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -292,6 +292,10 @@ static const struct of_device_id of_amlogic_thermal_=
match[] =3D {
>  		.compatible =3D "amlogic,a1-cpu-thermal",
>  		.data =3D &amlogic_thermal_a1_cpu_param,
>  	},
> +	{
> +		.compatible =3D "amlogic,s4-cpu-thermal",
> +		.data =3D &amlogic_thermal_t7_param,
> +	},

[Severity: Medium]
Should S4 use amlogic,s4-thermal (either with amlogic,t7-thermal as a
fallback compatible or added to the two-clock condition in the binding)
instead of a standalone amlogic,s4-cpu-thermal compatible?

In drivers/clk/meson/s4-peripherals.c, Amlogic S4 provides both a shared
functional clock (s4_ts_clk) and dedicated per-sensor APB bus clocks for the
PLL/CPU and DDR thermal sensors:

static S4_PCLK(s4_ts_ddr,	CLKCTRL_SYS_CLK_EN0_REG1, 15, CLK_IGNORE_UNUSED);
static S4_PCLK(s4_ts_pll,	CLKCTRL_SYS_CLK_EN0_REG1, 16, CLK_IGNORE_UNUSED);

However, in Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml,
the allOf conditional block only permits two clocks when the compatible
contains amlogic,t7-thermal:

  - if:
      properties:
        compatible:
          contains:
            const: amlogic,t7-thermal
    then:
      properties:
        clocks:
          minItems: 2
      required:
        - clock-names
    else:
      properties:
        clocks:
          maxItems: 1
        clock-names: false

Because amlogic,s4-cpu-thermal falls into the else branch, the schema forbi=
ds
specifying the per-sensor APB bus clock (CLKID_TS_PLL / CLKID_TS_DDR) along=
side
CLKID_TS. If the bootloader does not leave the APB bus clock enabled, or on=
ce
CLK_IGNORE_UNUSED is removed from s4_ts_pll and s4_ts_ddr, register accesse=
s in
amlogic_thermal_enable() and amlogic_thermal_get_temp() during
amlogic_thermal_probe() can access an unclocked peripheral.

Additionally, since S4 passes the sensor index via the amlogic,secure-monit=
or
phandle argument rather than hardcoding u_efuse_off per compatible, does
naming the compatible amlogic,s4-cpu-thermal prevent reusing it for the S4 =
DDR
thermal sensor?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025192244.2092=
56-1-christian.koever-draxl@student.uibk.ac.at?part=3D2
