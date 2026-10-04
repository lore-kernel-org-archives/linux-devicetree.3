Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F813957E
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129222; cv=none; b=pwxeIZUK1cOLy7IEP2WUcdiznEMj3odhLkR9j34IP2OPGVehUxtIgJf8N2cRFj9QnJ1Tne5aRmIH3O59oiBSiVx+EyzLnAuioYqK2bvrWVtUtq433CWdU2SznEnqJL7R4fFSYk6L0JUJdIvtfo73swwRg+GyCEjuPONxH3xyWxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129222; c=relaxed/simple;
	bh=dHFd4e58cGpz5w9DFQKjQAaR5ewBcq76qWg1EahkFqk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B+yK8KgvliUbrU3B5yLHmrvS+CwBCfjCvmSYwrLDXp+f3LLjC429qpAFcafzhsDeWQhCKo5WkqUdu5S6Qpp9TWXdDOmGnHF+lEhT2C52nBU2h6ktx1XCQ5OZo/04oPF3n8+L4KEX2vVt8LYFFBIsjkRnCAMMpG/oz+cIxjaMzlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtqJ3z8+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtqJ3z8+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547C01F000FF;
	Sun,  4 Oct 2026 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791129218;
	bh=lLB+dxOQN0xza3F2Z+TWaOIY+921znehfcyCVsET8Uw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gtqJ3z8+Kh6cvgj1zrazVnUvnIHuXVr9SFX+o7/9MjDZD1kSdnUa6GHGIhbObWRbo
	 S5aXuSMmZNJ4Igiq7epc5rcyWwd4hEmeci0JM6tDGYSeBk13AbJETfIulcN2kUEDwJ
	 mxKzqrS+7oOK4TSkoHPzLQOdI04htisyASAdmUCwBkfwFeBjAHQD/Q3UL0uI/cUud8
	 ltPYsvxK+CSZgHhDYChdCGP3HVIOw2g0eRwBYU5xIeHmUrtpS6FrkG3MpB9C+ED63F
	 NlZtwiGOnsCN+nXMDc9eWooaZwdSqhIzF3RaIpPzpHsn231f26cPQ95n+e7v6aFaqT
	 ldixfQ8Da2mcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/9] ARM: tegra: lg-x3: Add light sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261004154456.145362-5-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
 <20261004154456.145362-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 15:53:37 +0000
Message-Id: <20261004155338.547C01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm: dt: incorrect interrupt trigger polarity for APDS9900 sensor
--

commit 9cb1ebe47a901b15c3fac941849ede08f1799d2f
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: lg-x3: Add light sensor node

This commit adds the device tree node for the Avago APDS9900 ambient
light and proximity sensor to the tegra30-lg-x3 dtsi file.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/=
dts/nvidia/tegra30-lg-x3.dtsi
> index d5365253c740b..4cd2bbc94f9d7 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
[ ... ]
> @@ -1106,6 +1106,19 @@ nfc@28 {
>  			firmware-gpios =3D <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
>  		};
> =20
> +		light-sensor@39 {
> +			compatible =3D "avago,apds9900";
> +			reg =3D <0x39>;
> +
> +			interrupt-parent =3D <&gpio>;
> +			interrupts =3D <TEGRA_GPIO(K, 2) IRQ_TYPE_EDGE_RISING>;

[Severity: Low]
Is IRQ_TYPE_EDGE_RISING the correct interrupt polarity for this sensor?

The device tree describes the APDS9900 interrupt as IRQ_TYPE_EDGE_RISING, b=
ut
the APDS9900 has an active-low open-drain interrupt pin, meaning it asserts
via a falling edge or low level. This appears to be a mismatch between the =
DT
hardware description and physical hardware.

While the Linux tsl2772 driver currently hardcodes IRQF_TRIGGER_FALLING
(masking the issue in Linux), could this latent hardware description bug br=
eak
interrupt handling for any OS or future driver refactoring that relies on t=
he
DT-provided flags? Booting an OS that relies on the DT interrupt trigger fl=
ags
will configure the GPIO interrupt for a rising edge, which will fail to
trigger when the sensor pulls the line low.

> +
> +			vdd-supply =3D <&vdd_3v0_proxi>;
> +			vddio-supply =3D <&vdd_1v8_sen>;
> +
> +			led-max-microamp =3D <100000>;
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004154456.1453=
62-1-clamor95@gmail.com?part=3D4
