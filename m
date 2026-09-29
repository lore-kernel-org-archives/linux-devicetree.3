Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACB950EBFE
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678157; cv=none; b=H7cGBjM6rt1wgOGMLLtARsiqGxNRwSn6TUC7zFYZPW8OFxsIP7gIdvbqnWiZOHf8GFqyYMsj1s39DWEM8J3+wcTQE3M2IO4AuY98EwuS4H2Jb5IMSIgm/TmcdAzEnFXDAnEpUd3HjnyKjqbPY4hnvxs+xjpxaHCNalF05Ct67Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678157; c=relaxed/simple;
	bh=saNXAxjjzrICZyTMltFAaK53vk1/nNyhUxo4WfsaLIU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EWmW2B1acnBlxzGyqmCyU5FJT0q7bPwMdtg5RgewX6wpa4Tz1ywe3YXTTLk3TNUPmCDH6Exqomv3rzqszV/mhdUmx9r6x52gkBaGXbaDhbtOb3mrQaSekk0hhV+NB+50trmLJF14rTWQYTkBLsyuc1XtGEyJ1yButPO9D7FSB6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFuh2z51; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFuh2z51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7174B1F00898;
	Tue, 29 Sep 2026 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790678139;
	bh=5LWypxLEy/kxY6bpy2gnVkW9d+QunDtcuCEFLwxb/E4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eFuh2z510xrvCk6mrafZyL0vmxA8fJ2MhSNzomPWaiv3dh2Xu3M282OCS09C5GIbk
	 sGAhzUFjmoEfNB6pRVMl7jbJ7QHBDWNgxPf5y57FqGQlwgOWMqEddKTEJ2QpcfStiX
	 oglTTomMoPgVT6AuAX0UIhRpFKTws9Ln7daGRBVV5Xw5ylrZkb4rlskOIqt/8xyruT
	 X9XPrL7iOwtuA6ymdUEcyaEWArFQuLotgXRJIxCca4mTDhPpGi9yLzB9aZG09ExoYm
	 xyzJAfewIsB4BXhowfMVnjnpQM7JEgJh2Nl1GsBvpdQfFqmr0KoYcIkpasaklSbem+
	 Wu6eX4bL5ZRyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V
 Meles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Han Gao" <gaohan@iscas.ac.cn>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929-rv-meles-v1-3-effdd14a76e8@iscas.ac.cn>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-3-effdd14a76e8@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 10:35:38 +0000
Message-Id: <20260929103539.7174B1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing function =3D "gpio" in wifi_host_wake_pins pinctrl node
--

commit de373882dd24540cebce78cb7e64ca51c97365ba
Author: Han Gao <gaohan@iscas.ac.cn>

riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles

This commit adds device tree nodes to enable the AP6256 Wi-Fi module on the
Milk-V Meles. It configures the SDIO interface, PMIC clocks, regulators,
and GPIO pins for the Wi-Fi module's operation and host-wake interrupts.

> diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/risc=
v/boot/dts/thead/th1520-milkv-meles.dts
> --- a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts

[ ... ]

> +&padctrl1_apsys {
> +	wifi_enable_pins: wifi-enable-0 {
> +		gpio-pins {
> +			pins =3D "GPIO0_20";
> +			bias-disable;
> +			drive-strength =3D <7>;
> +			input-disable;
> +		};
> +	};
> +
> +	wifi_host_wake_pins: wifi-host-wake-0 {
> +		gpio-pins {
> +			pins =3D "GPIO0_21";
> +			bias-disable;
> +			input-enable;
> +			input-schmitt-enable;

[Severity: Medium]
Does this pinctrl node also need a function =3D "gpio" property to ensure t=
he=20
pin is properly muxed?

If the bootloader configures GPIO0_21 for an alternate function, the missing
function assignment means the pinctrl-th1520 driver might skip creating a
PIN_MAP_TYPE_MUX_GROUP mapping. The dw-apb-gpio driver will request the
interrupt via gpiochip_irq_reqres(), which locks the IRQ but never calls
pinctrl_gpio_request().

This could leave the pin in its alternate function state, preventing the
host-wake interrupt from triggering and potentially breaking wake-on-WLAN
functionality.

> +		};
> +	};
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-rv-meles-v=
1-0-effdd14a76e8@iscas.ac.cn?part=3D3
