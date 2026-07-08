Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2801E3F12F5
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525240; cv=none; b=hqsRgHd0dm8AkNmdfTsj7LPaTalqPoiHEwPCEpF51OHqzWCeY+02XX2G5s+kwtmSrJfx7hinUWL1UUs/J2mN+CYe/W6OE/p9u8e/wT7IjAYzE4sMObRhO45h/jQxdtprnIldvIyCnmM04RwAlewvLQKLJNhNpFR0OzqF8SyKtEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525240; c=relaxed/simple;
	bh=VOkCgBa7ANqO0eyWYpZNXNEVOAK7OwAmsmLJTn9y1xk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ETMv2puuetoBlvpvv91XZx8Z8KKgn3uO7X9S0nusF4tB1qQWy5TlZtytxuQC1XhPb5EZgdiW0kaOik19bfqKctlpZWVErkJhbaWHeMDtCHX0NxbPO2e1NSZqmk52fG0fw9j5FQgMUZj4dq9orZa/25jSBnMBEWTFHGKN2Ct5XwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKaLzm/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKaLzm/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860721F00A3A;
	Wed,  8 Jul 2026 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783525238;
	bh=4+0E18KSS2mt00yIpJ1iZBSydtuf8yxnI/uI6+9LryM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oKaLzm/ll5+t5FKQKXWsYpxUsR4ie9uBcGvMNW4qZFs5i0yuGD0haCxxClxd38/bV
	 67VhwnEE9LF7HTwLyjv5cqCo5wq+kO5c5JB4GL6t7A/qUVQY4tSoBZDaGfUlE711q5
	 bDHjTYqel8EpqUPtIlwgV+uskGlWXLT0vCYzMobkeQRA1HpQT0M2jMDK6jZDYl6f1F
	 LeMb2QAeQAWFeSyTQdmyd0BH72tRySpYOoL5h3ggwkLP+LAHEko7cAy85qyeg40HK9
	 0O87tUL1+VBtWlz2QJLdnnJOE9FfBAUb4ImLl4DXjT4cjltH/lVnkBZy3B9D1MzA98
	 Q36Arhzvd63wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add GPIO line
 names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-gpio-names-v1-1-9162105b9971@oss.qualcomm.com>
References: <20260708-gpio-names-v1-1-9162105b9971@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 15:40:38 +0000
Message-Id: <20260708154038.860721F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Multiple typographical errors in GPIO line names ('SDL' instead =
of 'SCL', missing 'SPI' in CS name) and in the commit message.
--

--- Patch [1]: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add GPIO lin=
e names ---
commit f90079e8b747e78feb067474d4b03223eaab361c
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

arm64: dts: qcom: monaco-arduino-monza: Add GPIO line names

This commit adds gpio-line-names to the tlmm node in the monaco-arduino-mon=
za
device tree. It documents the pin functions for various headers, flat conne=
ctors,
and the SoC-to-MCU interface on the VENTUNO Q board.

>     Add gpio-line-names to the tlmm node to document the PIN functions on
>     on the VENTUNO Q board. This covers the different headers (JMISC, JHA=
T,

[Severity: Medium]
This isn't a bug, but there's a typo ("on on") in the commit message.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm=
64/boot/dts/qcom/monaco-arduino-monza.dts
> index 8b3ed73feb6ec..24d2704666745 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -426,6 +426,34 @@ &pcieport1 {
>  };
> =20
>  &tlmm {
> +	gpio-line-names =3D "", "", "", "", "",
> +			  "", "", "", "", "",
> +			  "JMISC_SPI_MISO", "JMISC_SPI_MOSI", "JMISC_SPI_SCK", "JMISC_SPI_CS0=
", "JMISC_SPI_CS1",
> +			  "JMISC_CS2", "", "JHAT_P03_I2C_SDA", "JHAT_P05_I2C_SCL", "JHAT_P27_=
EEPROM_SDA",
> +			  "JHAT_P28_EEPROM_SDL", "", "", "", "",

[Severity: Medium]
Should "JMISC_CS2" include the "SPI_" prefix to match the adjacent CS0 and =
CS1
lines?

Is "JHAT_P28_EEPROM_SDL" a typo for "JHAT_P28_EEPROM_SCL"?

> +			  "JHAT_P21_SPI_MISO", "JHAT_P19_SPI_MOSI", "JHAT_P23_SPI_SCLK", "JHA=
T_P24_SPI_CE0", "",
> +			  "", "MCU_I2C1_SDA", "MCU_I2C1_SDL", "", "",

[Severity: Medium]
Is "MCU_I2C1_SDL" also a typo for "MCU_I2C1_SCL"?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-gpio-names=
-v1-1-9162105b9971@oss.qualcomm.com?part=3D1
