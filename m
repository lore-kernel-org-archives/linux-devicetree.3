Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B3030C608
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 19:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783021472; cv=none; b=O9EPH9U1yzLKPGDrjBmBTT3s4uBlTZx5VM/FB1puDZHDmsKi9A/N4g9ofIYAsYI0fhVdf9wZELBKRR2QcS5NQdGb5lfR/1G/7EkNeotvQK1AxOy73XpCLaUlG9Sv1u2qIYyCxo2U80cr+AXfLxgoljqi2Atd7XH4xSS0V9FTmDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783021472; c=relaxed/simple;
	bh=h5FuyX6blxpweWpiylIfPbz9wiF9PUsdgzCMhndFupk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qjPKpi1jS30qa+pBePCr9a88UXuJukFOI0HEQzsdtr3R9pv804fbirNXDiDOV2YpHpAUZD3917WuXEzv7jbrezXSMjFiJAKZ5PE6pTvxx0/X/TVFp8R51sHbpUT4ZEPbbswXO2Seh8BpdsUWBmFHqT3QVSgOoERyzSoFyNEsm3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKxTZGS/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKxTZGS/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DB81F000E9;
	Thu,  2 Jul 2026 19:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783021470;
	bh=yUghCTQtu38YJjkRSAUtkTgrRtjcQUeSsjIWR/EoBcI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jKxTZGS/sxDMXO8Isam51HR7U4GuQA140fecHQvDIuMi4nkbYBi0+wXM9buQ9bOAq
	 FOQEExe30CJWQVXqAY5imjwHh5Jb/YCtcpX7u6UVUO2ky+Pvzoius1XwJUWx8XcYm0
	 /DXkDxu5S8ix8TUb13B8zdXKaqubVjqvxfcxzE1YVC6wBZrj1+s1xZh4PWvc9jEsf1
	 652kfHWpXQf6avQx7VKCge1vewtslt4Zc/ZTH6Pgv/w0JP5Mjjjw/rlIvHTGYAciYV
	 DfS7XEO+qyJkEYtPI+YFgExA9bSJKhhdF6PKnjux5iJSF2r4Sc+dEM0GOQnqgtFqfm
	 GkbACucxQ8Okg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: rockchip: Add devicetree for the
 Graperain G3568 v2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702193538.2195973-4-coiaprant@gmail.com>
References: <20260702193538.2195973-1-coiaprant@gmail.com>
 <20260702193538.2195973-4-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 19:44:29 +0000
Message-Id: <20260702194430.91DB81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Contradictory IRQ polarity and internal pull-down resistor for the=
 WiFi host-wake interrupt.
--

commit 5e0547ff442a7edaa2500fa690169e0535d25791
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2

This commit introduces the devicetree for the Graperain G3568 v2, an
RK3568-based development board. It configures the hardware description for
various components including ethernet, wireless radio, and peripherals.

Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6dadd=
ec9e400458816dd4c57ba807fc3.pdf
Link: https://blog.gov.cooking/archives/research-graperain-g3568-v2-and-fla=
sh.html

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts b=
/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
> new file mode 100644
> index 0000000000000..5fc043b352042
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts

[ ... ]

> +	wifi-irq {
> +		wifi_host_wake_irq: wifi-host-wake-irq {
> +			rockchip,pins =3D <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +};

[ ... ]

> +	wifi@1 {
> +		compatible =3D "brcm,bcm4356-fmac", "brcm,bcm4329-fmac";
> +		reg =3D <1>;
> +		interrupt-parent =3D <&gpio3>;
> +		interrupts =3D <RK_PD4 IRQ_TYPE_LEVEL_LOW>;

[Severity: High]
Will this combination of an active-low level-triggered interrupt and a
pull-down resistor cause an interrupt storm?

If the WiFi module enters a sleep state and leaves the pin floating, the
pull-down configured in wifi_host_wake_irq will drive the pin low. Because
the interrupt is configured as IRQ_TYPE_LEVEL_LOW, won't the kernel
continuously fire the interrupt handler?

> +		interrupt-names =3D "host-wake";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&wifi_host_wake_irq>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702193538.2195=
973-1-coiaprant@gmail.com?part=3D3
