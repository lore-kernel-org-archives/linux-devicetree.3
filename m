Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BDC18FDBE
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778548145; cv=none; b=kF5dey2IoZRJgGFTffN7Q9qi+6UHtFuyO/1yF8dLqdkydqwHfNMranTZiDdG3P7Uv4HJ17vh/HIIdlQArgFpi5nkmnNnFOzI+4eFnIh+Oc7k04ctvkuSvQWcAchaln+GQ91plIJshPmQi7BV7vt3ibGIfm3dZTttw9zgEn88vGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778548145; c=relaxed/simple;
	bh=Tqw2WjCS+C1oo8rJDjsho9lb8gn9jXN45OR7OLX5Zfw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iF/hVt6aW6vJl3aSOCESwS9j45CIoo8QIXb4tu/+zzWQClzYVajIfPuoiVFcpcxowR6DgtDdJD4wRE0T88aBgzErO+7Pu9ETVzRcKJuf1sGkqO/A7vzt5JPuClUuhwbBBmDwj5UVxSZANwXgt/rEftGNXFzFH2bgejSJtNIGmtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdMXzbM2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdMXzbM2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12442C2BCB0;
	Tue, 12 May 2026 01:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778548144;
	bh=Tqw2WjCS+C1oo8rJDjsho9lb8gn9jXN45OR7OLX5Zfw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sdMXzbM2gBVJWh5eBpV1FRrtPl7xozuzxo/ieRtO8NYXgm2Z7ui9tLWVZPX+JDOuQ
	 oq/TAXaoU5VwDVXMTE7ABz28Cv3MFrXiNQVHXASjGkvG1lw5Fo6ZoPibvetZRiogg4
	 mcxjqOGMh/kAvIrT/tMXgcz2doWjVxZUoiHLbRC4tUg8UnadYTkaRKGqTp3Flri+8o
	 Tcw/xxrztJrdCw/nDHfVew8bsx+s/uQSRMP170hrwKwL6lhMDkojcj+DuUtKPWRLun
	 Vxf61UHlQW6g9rgrL+Yd+1ZpPlQA5DBp3uvie3TrHKD6zhIMhHKacDJcWxwBD/lVZX
	 4HU/GoRjzv+3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
Reply-To: sashiko@lists.linux.dev
To: "Qian Zhang via B4 Relay" <devnull+qian.zhang.oss.qualcomm.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:09:03 +0000
Message-Id: <20260512010904.12442C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware backpowering flaw during system suspend due to uncoordina=
ted W_DISABLE# GPIO and M.2 power supply.
- [Medium] Missing `pinctrl` definitions for newly added GPIOs.
- [Low] Devicetree schema violation for the fixed regulator node name.
--

commit ea2590eabdbe9514777a7849913aa724f8e8c30b
Author: Qian Zhang <qian.zhang@oss.qualcomm.com>

arm64: dts: qcom: arduino-monza: add WLAN enable and rfkill GPIO

This patch adds support for the QCNFA765 M.2 PCIe WLAN module by modeling
GPIO56 as a fixed regulator for wlan_en, and GPIO54 as an rfkill-gpio node.
The regulator is linked to the PCIe node to provide power sequencing.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm=
64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4dae6..e0ffe87bba90c 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -153,6 +153,25 @@ vreg_nvme: regulator-3p3-m2 {
[ ... ]
> +	rfkill-wlan {
> +		compatible =3D "rfkill-gpio";
> +		label =3D "wlan";
> +		radio-type =3D "wlan";
> +		shutdown-gpios =3D <&tlmm 54 GPIO_ACTIVE_HIGH>;

If the bootloader leaves the pin in an alternate function or undefined stat=
e,
the kernel might fail to control the RF kill state reliably.

Does this node require pinctrl properties to ensure GPIO 54 is muxed correc=
tly
and has the appropriate bias and drive strength?

Additionally, the PCIe controller's vddpe-3v3-supply is disabled by the
pcie-qcom driver during system suspend, dropping power to the M.2 slot.
However, the rfkill-gpio driver lacks PM suspend/resume callbacks.

If the radio is unblocked, the SoC will continue driving GPIO 54 HIGH during
suspend while the M.2 module is unpowered.

Could this inject a logic HIGH into the unpowered module, causing current
leakage that prevents deep sleep states or damages the hardware?

Would it be better to synchronize the power sequence to safely deassert the
W_DISABLE# pin before dropping power, perhaps using the pwrseq-pci framewor=
k?

> +	};
> +
> +	wlan_reg_3v3: wlan-3v3-regulator {

This isn't a bug, but the node name wlan-3v3-regulator appears to violate t=
he
fixed-regulator device tree schema.

According to Documentation/devicetree/bindings/regulator/fixed-regulator.ya=
ml,
fixed regulator node names should match the pattern
^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$.

Should this be renamed to something like regulator-wlan-3v3?

> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "wlan_en";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&vdc_3v3>;
> +		gpio =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;

Similar to the rfkill node, does this regulator need a pinctrl reference to
configure GPIO 56 properly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-linux-next=
-v3-1-3e22737e71eb@oss.qualcomm.com?part=3D1
