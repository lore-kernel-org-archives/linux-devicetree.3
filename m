Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250DB3B5DE9
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726519; cv=none; b=JA7QR0WdM9fllWLve1WzbcdnrSROs/idC3MwfHkRBl5Ps69MdF/TEdq3LkcY67CBQ1wXDCICmjstRi0Uet24hSTLAhm6F0D2qN+JwrnrvSf697wlhTgOXAdFX2UioWwWV7N+AJDa6BLS1r95AGXlwfkEQqqJCAX2EAuUo//qnw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726519; c=relaxed/simple;
	bh=4hJHH1qYgbPz1D9+iHdB9HNcY/3eTOW8l4h6marRoqk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nUC0ojNf6F2J7p6JNHBP0R++qU1yLf9zHrhktqDTWblA9IqonIfJhlgsQGZFTPOVhWUdP3NyfttTKSXBzO/wu7zxLcobj0z3686J9l8KjA3885Dq9Lm9eqSZS7ZKZ+H+fUEJJ38upg4anZZBPVx2+Pr38L6fyvBGuJ21Ws5uXrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PuMqeBff; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PuMqeBff"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4F31F0089B;
	Sun, 11 Oct 2026 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791726517;
	bh=4bEgZScUzq4uMFVG56/NKgLSalJmL7cqkg+9mJCVKrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PuMqeBffg49Kfsi6/9807smTzE+2VLeIuISneQmDSciRy3+t3vcJiFjgdsyr38i0Z
	 zMorMpD9GEPQiMDYHUD+utXnDFlVTRx1gIMhurWeHkhFTl1rfnejcMnvh74xqskcUA
	 fqU7QnE3cdECddQQ0GFgApzniiQi51Mw6545VtaSszPtfdJQGT36YTt7as6guZlECP
	 h5phFu5RpiFV++2+izRm8zxuup6BQpHlr36zKKVxDJyTGksRzzVep6scjHmsCjfGoQ
	 TCnBotKnjG3ETAVOVo+/GG3+QodD2JCTAyyDm0ZtW2x/yDzyEg7CH8L52qYLcTiygK
	 TFFx6qkkv94og==
Message-ID: <sashiko-outbox-167276@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: thead: Enable bluetooth on
 BeagleV-Ahead
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thomas Gerner" <thomas.gerner@muenchen-mail.de>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <22787b9b20b62ac010a0fd8de0aa1f564fa577ce.1791720467.git.thomas.gerner@muenchen-mail.de>
References: <cover.1791720467.git.thomas.gerner@muenchen-mail.de>
 <22787b9b20b62ac010a0fd8de0aa1f564fa577ce.1791720467.git.thomas.gerner@muenchen-mail.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 13:48:36 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: missing pinctrl state name for pinctrl-1 in bluetooth node
--

commit d08d8ee5ff25b62d26075da6c5a8d9e0d4d9c5bc
Author: Thomas Gerner <thomas.gerner@muenchen-mail.de>

riscv: dts: thead: Enable bluetooth on BeagleV-Ahead

On the BeagleV-Ahead the bluetooth module of the Ampak AP6203BM is
identified by the btbcm driver as BCM4362A2. The module is connected by
UART4, several gpio pins and an I2S interface.

> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/ri=
scv/boot/dts/thead/th1520-beaglev-ahead.dts
> index e16484a476534..bf64eb667745f 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts

[ ... ]

> @@ -314,3 +380,26 @@ &uart0 {
>  	pinctrl-0 =3D <&uart0_pins>;
>  	status =3D "okay";
>  };
> +
> +&uart4 {
> +	pinctrl-0 =3D <&uart4_pins>;
> +	pinctrl-names =3D "default";
> +	uart-has-rtscts;
> +
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "brcm,bcm4329-bt";
> +		device-wakeup-gpios =3D <&gpio2 29 GPIO_ACTIVE_HIGH>;
> +		interrupt-parent =3D <&gpio2>;
> +		interrupts =3D <30 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names =3D "host-wakeup";
> +		max-speed =3D <921600>;
> +		pinctrl-0 =3D <&bluetooth_in_pins>;
> +		pinctrl-1 =3D <&bluetooth_out_pins>;
> +		pinctrl-names =3D "default";

[Severity: Medium]
Does this leave the pins in pinctrl-1 unconfigured?

Since there is no second name provided in pinctrl-names, the pinctrl subsys=
tem
assigns the auto-generated name "1" to pinctrl-1. The driver core only requ=
ests
standard states like "default", which could mean the pin configuration defi=
ned
in bluetooth_out_pins (such as drive strength, bias, and slew rate for the
wakeup and shutdown GPIOs) is silently ignored and never applied.

> +		shutdown-gpios =3D <&gpio2 28 GPIO_ACTIVE_HIGH>; 	/* BT-REG-ON */
> +		vbat-supply =3D <&reg_vbat_3v3>;
> +		vddio-supply =3D <&reg_vbat_1v8>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791720467.gi=
t.thomas.gerner@muenchen-mail.de?part=3D1
