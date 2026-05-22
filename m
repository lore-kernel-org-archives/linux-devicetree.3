Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1564CA6B
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779458569; cv=none; b=Re8V8mA19pACr0/X+MjVi/7ajpnrqCsaKC9EwnXGHxkaa/HMCo87zL4RWZCMVfAHCd6tbuP98mkVU5P89ni1H3SHZCwpJOxBDDDpt5qW+MqcY0Cxcg9vwXYUEezuj7Y4CkuhxIWe2GB4QJowXcAQsn2vs1wqK4Lw83pwLDhYL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779458569; c=relaxed/simple;
	bh=5GJhtz10eoAUPnIJHVbSrTjqvfHQ07cWkQqnRM4Xtpk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZvLVN8ig93j+ckAqAR7H4DCNlZfQZdphMqn1y/c50tPMIJxeRIyXjf2apUfkaPrFIBYrbLvqE2OZQz2oSUzM3XJxoTGZWCw3Xbd+1SaOJbWLG8se8DrwA3VzJUSTLbWdtUnPyCziJ+ewwJfr+sih7WakwKwtJNAjrXBb5g87JMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhDKNGQ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhDKNGQ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472651F000E9;
	Fri, 22 May 2026 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779458565;
	bh=m/S+nDlfF6NWozcsDTveRkT3xko+wy/bVvTFVg8lzCE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mhDKNGQ26roaM3AqMyIhsV1Slbu5jTuvesA6dOzDZLYPZAHwHKnhr4yClmNrXBQuL
	 RoB2SdZVzH1cObpgttx8fLKQ4rRzLJWCurrt+ioBT/LDIFKYLUYEwiwQM5GtMnswE1
	 BNzSU0Au+8ZPYC2pizCdOIba+H0q7y0qLoSaBE1MB7ag3ebP+cs5hQEeXcYrOFv8KL
	 U+95a34tdD4hDC0ESM2eUNm2l/LYxaQu7nL4E8Vf1I4Spvc2/88nMXY2yvwfnOEQje
	 gvia1hPXT3k7OTOhh2DiH/bAfh6rcPFioQjGoKuChGFchNDdUtIPnjQT1wL4mcXJKB
	 SQXFTK2fofB8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/11] arm64: dts: ti: k3-am62-verdin: Add Toradex
 Capacitive Touch Display 10.1" DSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522132014.226721-18-ivitro@gmail.com>
References: <20260522132014.226721-18-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 14:02:44 +0000
Message-Id: <20260522140245.472651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect interrupt trigger polarity for the ILI2132 touch control=
ler.
--

commit e23b19a55c448169a4462f9aea9b95fee61f05ad
Author: Vitor Soares <vitor.soares@toradex.com>
arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" =
DSI

This commit adds a device tree overlay for the Toradex Capacitive Touch
Display 10.1" on the Verdin DSI_1 interface. It configures the SN65DSI83
DSI-to-LVDS bridge and the Ilitek ILI2132 touch controller. It also updates
the Makefile to provide ready-to-use DTBs in both WiFi and non-Wifi SoM
variants.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-displa=
y-adapter/

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inc=
h-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-=
dsi.dtso
> new file mode 100644
> index 0000000000000..de0148ddd5969
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.d=
tso
[ ... ]
> +	touch@41 {
> +		compatible =3D "ilitek,ili2132";
> +		reg =3D <0x41>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_dsi1_int>, <&pinctrl_i2s_2_bclk_gpio>;
> +		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
> +		interrupt-parent =3D <&main_gpio1>;
> +		interrupts =3D <49 IRQ_TYPE_EDGE_RISING>;

[Severity: High]
Should this interrupt trigger be configured as IRQ_TYPE_EDGE_FALLING instea=
d?

The comment above indicates the hardware signal is TOUCH_INT#, which implies
an active-low signal. If the touch controller holds the interrupt line low
until the touch data is read by the host over I2C, waiting for a rising edge
might cause a deadlock where the line never goes high because the kernel wo=
n't
read the data without seeing an interrupt first.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522132014.2267=
21-13-ivitro@gmail.com?part=3D5
