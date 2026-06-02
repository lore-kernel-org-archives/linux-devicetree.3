Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FE93403F8
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 07:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384914; cv=none; b=POJSPD7qldd/sVfvDGDz8u3W6P1GBHJrOKWIBv1s2Ilvc1R69Icxn+vBw2be+LCliXZ7rxBiOUiBM1gd45fQPUKBcDdGemza31/jTfQ+KaqsxIkymB1F8pMRxfz0lTsbqRCzhiWlDZVh9ogjUbkZqCHxXiOh3+GvNXxV8u2D5MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384914; c=relaxed/simple;
	bh=h0YyLcTI1ervzdhwapk6OfypGB3hZoj+T8ThjFnFAdQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iSqEWtzaO6OUhwQ7UBFxUpipVw7mH0W11BfC2ZQMYQ/mv7khLtcdhZ6Sm8stjv04XPrMOy8teawbqezjurDXRBFJqitQZKbh4PwbbJYSbmEJuDcTwHim+oChp0dbxMorv9VI0J399Jb9JP8AiBlXrt/bxcTIUtfsqOt/N2i6ajM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4xN1UNI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4xN1UNI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338AA1F00893;
	Tue,  2 Jun 2026 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780384913;
	bh=Z/pOJhQcSMLZ2hxmYBySGcMeFDbyYrNmTT+8pI2b5kY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B4xN1UNIva4z3r88ZqszSs5UH2LxDEGhzFGhUOfMZ3yBeauBdVM2ydw5/6Bzb2Gbv
	 MtuwkUDLScb0chEU940lNYi2meTr0cvz4Z1tKRuOL3fJS0Xg3oECDm7+3SHggw3Y7k
	 Pka6bjX/7yJX1idqDGbqNthN1yvaqNSvmvErh+8xTev7EC6zCxD8761FC5b5hwtCbh
	 F1KfEL9Mqr/LV0BwOGvTtfgrhOdq2/hmyDU/028tY7pyMHrkGtIdwB6yUm+GVXJYVh
	 hQpNgqdirYoRAEzPUkN+ywIsyH3358N1r7jX/eykD7ZZVH9nLT6K0gZegev2xf2X/l
	 LmkjzABl8Vu+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qian Zhang" <qian.zhang@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260602071028.3810-1-qian.zhang@oss.qualcomm.com>
References: <20260602071028.3810-1-qian.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 07:21:52 +0000
Message-Id: <20260602072153.338AA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `shutdown-gpios` property for `wlan-rfkill` is incorrectly con=
figured as `GPIO_ACTIVE_LOW`, which will invert the rfkill logic and disabl=
e the hardware radio when the subsystem attempts to enable it.
--

commit fef17fc3948ff81196d4df1a40b32c0d905e0ab7
Author: Qian Zhang <qian.zhang@oss.qualcomm.com>

arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support

This commit adds device tree support for the QCNFA725B M.2 module connected
to PCIe0 on the Arduino VENTUNO Q board. It configures the rfkill shutdown
and wlan enable GPIOs, and defines the internal PMIC regulators.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm=
64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4dae6..b90397c7000e3 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -153,6 +153,78 @@ vreg_nvme: regulator-3p3-m2 {
>  		enable-active-high;
>  		startup-delay-us =3D <20000>;
>  	};
> +
> +	wlan-rfkill {
> +		compatible =3D "rfkill-gpio";
> +		label =3D "wlan";
> +		radio-type =3D "wlan";
> +		shutdown-gpios =3D <&tlmm 54 GPIO_ACTIVE_LOW>;

[Severity: High]
The commit message mentions that pulling GPIO54 low disables the radio
transmitter. Will configuring this as GPIO_ACTIVE_LOW cause the rfkill-gpio
driver to inadvertently disable the radio when it intends to enable it?

Looking at the rfkill-gpio driver, it treats shutdown-gpios as an enable li=
ne.
It calls gpiod_set_value_cansleep() passing '!blocked' as the value. So when
the radio is meant to be enabled (!blocked =3D=3D 1), the driver logically =
asserts
the GPIO.

If the GPIO is configured as GPIO_ACTIVE_LOW in the device tree, a logical 1
will drive the physical wire LOW, triggering the hardware kill switch. Shou=
ld
this be configured as GPIO_ACTIVE_HIGH instead to match the driver's intern=
al
logic?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602071028.3810=
-1-qian.zhang@oss.qualcomm.com?part=3D1
