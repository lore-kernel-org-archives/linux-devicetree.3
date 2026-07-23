Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6576242B326
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801973; cv=none; b=ZBOJX+XG488Yzgug0qRSPE3nwexe+rqJZC2WZ52hvRjfflylNicHbF+5nc4WWPGI0H5RT8QodpkN6rn3BM6xsoXScP74BLXdJpKXmmrFKCAdWlSeIawVGoo1bg2QENzWUct0itdleMaIuTqf0JhVm9+P8dwTe2rrU0OIbgV4Ux8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801973; c=relaxed/simple;
	bh=rA0x+3/a8TFq74PpjC8Nr2dLKde8iABzPYHuFMzGLOQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e29V1OzDycNJknPg42KbwKK4Y+RGFVdXGoyHtJctGW6gqYCguBXfvXbb6l6Cu0xDp4ADnZZgqCoM8U6DeLrplHEAzjNt90Dj070ymbbyGcWzhZVkOp3EehEXFOkBVUNW+X04iu4eneWvsHsg99xuyISNvB7uNoXLNg2ElJGnWOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682511F000E9;
	Thu, 23 Jul 2026 10:19:31 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: hamoa-iot-evk: Describe the
 PCIe M.2 Key E connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Deng" <wei.deng@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-hamoa-m2-dts-v2-v2-3-82254ac101fb@oss.qualcomm.com>
References: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
 <20260723-hamoa-m2-dts-v2-v2-3-82254ac101fb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 10:19:29 +0000
Message-Id: <20260723101931.682511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The power sequencing integration for the dynamically created Bluet=
ooth serdev is fundamentally broken due to device matching and target name =
mismatches, leaving the Bluetooth hardware disabled in reset.
- [Medium] The omission of the `max-speed` property silently degrades the B=
luetooth UART operating baud rate from 3.2 Mbps to 3.0 Mbps.
--

--- Patch [3]: [PATCH v2 3/3] arm64: dts: qcom: hamoa-iot-evk: Describe the=
 PCIe M.2 Key E connector ---
commit aea933a1454bca4e47c0fbb1565df4f442ed9a02
Author: Wei Deng <wei.deng@oss.qualcomm.com>
arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector

This commit replaces the Hamoa IoT EVK's chip-specific wcn7850-pmu with a
generic pcie-m2-e-connector node. It removes the static bluetooth serdev
and relies on the pwrseq-pcie-m2 driver to dynamically create the device
and manage power sequencing.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot=
/dts/qcom/hamoa-iot-evk.dts
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts

[ ... ]

> @@ -538,6 +512,58 @@ vreg_wwan: regulator-wwan {
>  		regulator-boot-on;
>  	};
> =20
> +	wifi-bt-connector {
> +		compatible =3D "pcie-m2-e-connector";
> +		vpcie3v3-supply =3D <&vreg_wcn_3p3>;
> +
> +		w-disable1-gpios =3D <&tlmm 117 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios =3D <&tlmm 116 GPIO_ACTIVE_LOW>;

[Severity: High]
Will this leave the Bluetooth hardware disabled in reset?

Because the hci_qca driver currently fails to match the power sequencer
for the "uart" target, it appears it will never un-assert w-disable2-gpios.

Does the dynamic serdev creation properly handle matching the sequencer
target name for this Bluetooth variant, or will the device fail to probe?

> +
> +		pinctrl-0 =3D <&wcn_wlan_en>, <&wcn_bt_en>;
> +		pinctrl-names =3D "default";

[ ... ]

> @@ -1531,17 +1490,10 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
>  &uart14 {
>  	status =3D "okay";
> =20
> -	bluetooth {
> -		compatible =3D "qcom,wcn7850-bt";
> -		max-speed =3D <3200000>;

[Severity: Medium]
Does the dynamic node creation restore this max-speed property?

Without it, the Bluetooth UART falls back to 3.0 Mbps instead of 3.2 Mbps.

This transition from an integer to a fractional clock divider increases
the risk of UART framing errors and slightly degrades throughput.

> -
> -		vddaon-supply =3D <&vreg_pmu_aon_0p59>;
> -		vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-hamoa-m2-d=
ts-v2-v2-0-82254ac101fb@oss.qualcomm.com?part=3D3
