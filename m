Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087228;
	b=gl0aZuOUf4ALHegA1Rv7WCOv2t4WktSHdH2ahUvcoXlRS5jomeK8BCI51HJTD/3hHNis
	 vOZZckzWLix+YUl0f3ZIm4c2Pz/13EPIbwqnFrjOPTibeYbkN3OKsp9NM6izvmfTX/x9V
	 5MHiSi2jTSpGwJIfL8MxgfQHj74C5MKITa5dqMFDQcLfqk+XwWtIXHaeNZdg2peQTX4+g
	 lMjSxSijLKit9G8cUJdY/8UaTB4YZ1VmN6r7kfE6zsfC8eR0lJfjufaIiY2Z9cZmWXG7h
	 gI4CTS+rQCBXaJVNaOsfW+UaE6iphOc5mar24Ma+X7GPJWtuHfuIIp6shG8fIatDYGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087228;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZpbhEMR3IL+hSBgMes9DiprGYSf3b5S89m5t0duDR0o=;
	b=kOfLcHjy7Iy631Zy7azaJXQoBAuLNU8uTiXWaQtGMT9hAUO0MbrhU60IANvrwyl3EhS1
	 0RRLsQ77xq15cziC8cOWJi3KJyytpN315TsXyjRCIJJ8Sbx8EEZ7Hq+naJTa+hurVdU4v
	 Ej1v7V8DoWHlJIoTL7+EvzT8ELqdiSp+emWuLUdhlQ5LzO8pTTKEQWziKJRTY1W0HdSYH
	 Po+6/uLxIE3t29fl3e0bnsZJ7LXOrDDR2iu/ZtDoS891s+zwbEX3bblWroOslb285ymTD
	 4+TofxJdx7b0mrdTdNlOBK4JZsIZiBvuvP1tgN59SLF8PhRKkKLeDC3gC2QNJ31s+XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dbSiDbxD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C34606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dbSiDbxD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295861F01825;
	Tue, 27 Oct 2026 07:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793087227;
	bh=ZpbhEMR3IL+hSBgMes9DiprGYSf3b5S89m5t0duDR0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dbSiDbxDry3uEnOxYKwigiWuhzLbMaw+w20HKh1v89npzvKLigQbNoJknoH8oadqq
	 9/V3cN4E4N1wHWxLNv5Xee2oHqQmlD0LdRSCniHqPQZhZTzMR9Al2W0GRJs+oR0rN9
	 /seduITUDbMTYUYxRSHXYsEqBU7zU90Kzkz1WYW5B66Wwc/USimG1ucQo/NKK5RehA
	 pwyd/7WGaFFJbiZs9HDjA7IbQnfgtqz2y2ch5Y0y4R6clSCXUzV/XBc+h6/YIMFAM7
	 gm1YMXBfSOvYpniweO9KFXJpBlW0V3W/CFGYlv9XFYUdT6RErS/RlCzguJ5qr96L9M
	 0pCxF3ydzS4+w==
Message-ID: <sashiko-outbox-186232@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Microsoft Surface Laptop
 8th Edition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-mahua-surface-laptop-v2-3-7dd903a12d22@oss.qualcomm.com>
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
 <20261027-mahua-surface-laptop-v2-3-7dd903a12d22@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 07:47:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: SAM compatible mismatch breaks ssam_platform_hub=
_probe()
- [Medium] arm64: dts: qcom: stdout-path points to Surface SAM EC UART on u=
art22
- [Medium] arm64: dts: qcom: missing qcom,uefi-rtc-info property on pmk8850=
_rtc
--

commit dc92104026c28877c07bc41ec0441b8b4cc8661a
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition

This commit adds the device tree for the Microsoft Surface Laptop 13.8" 8th
Edition based on the Qualcomm Mahua SoC.

> diff --git a/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13=
p8.dts b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
> new file mode 100644
> index 0000000000000..9acba318ab52b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
> @@ -0,0 +1,1176 @@

[ ... ]

> +/ {
> +	model =3D "Microsoft Surface Laptop 8th Edition (13.8 inch)";
> +	compatible =3D "microsoft,surface-laptop-8-13p8", "qcom,mahua";

[Severity: High]
Will ssam_platform_hub_probe() fail to match this root compatible string?

When ssam_serial_hub_probe() probes the microsoft,surface-sam node on
uart22, it registers surface_aggregator_platform_hub. In
drivers/platform/surface/surface_aggregator_registry.c,
ssam_platform_hub_probe() looks up the board's software_node group against
ssam_platform_hub_of_match:

drivers/platform/surface/surface_aggregator_registry.c:
static const struct of_device_id ssam_platform_hub_of_match[] =3D {
	...
	/* Surface Laptop 8th Edition (13.8") */
	{ .compatible =3D "microsoft,surface-laptop-8-13in", (void *)ssam_node_gro=
up_sl7 },
	{ },
};

static int ssam_platform_hub_probe(struct platform_device *pdev)
{
	...
	nodes =3D (const struct software_node **)acpi_device_get_match_data(&pdev-=
>dev);
	if (!nodes) {
		nodes =3D (const struct software_node **)of_machine_get_match_data(ssam_p=
latform_hub_of_match);
		if (!nodes)
			return -ENODEV;
	}

Because ssam_platform_hub_of_match checks for
microsoft,surface-laptop-8-13in while the root node here uses
microsoft,surface-laptop-8-13p8, of_machine_get_match_data() returns NULL
and ssam_platform_hub_probe() fails with -ENODEV, leaving the keyboard, fan,
and platform profile unregistered.

> +
> +	aliases {
> +		i2c0 =3D &i2c0;
> +		i2c4 =3D &i2c4;
> +		i2c5 =3D &i2c5;
> +		i2c8 =3D &i2c8;
> +		i2c10 =3D &i2c10;
> +
> +		serial0 =3D &uart22;
> +		serial1 =3D &uart14;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};

[Severity: Medium]
Should stdout-path be omitted here since serial0 points to uart22?

In this device tree, uart21 (the debug UART) is disabled and uart22 is
dedicated to the Surface Aggregator Module embedded controller at 4000000
baud:

&uart22 {
	status =3D "okay";

	embedded-controller {
		compatible =3D "microsoft,surface-sam";
		...
		current-speed =3D <4000000>;
		...
	};
};

Setting stdout-path to serial0:115200n8 causes of_alias_scan() to resolve
of_stdout to uart22 and directs any earlycon, bootloader, or userspace
console consumer honoring /chosen/stdout-path to reconfigure uart22 to
115200 8N1 and write console output to the binary SAM EC link. Other
Qualcomm-based Surface device trees omit stdout-path.

[ ... ]

> +&pmk8850_rtc {
> +	qcom,no-alarm;
> +};

[Severity: Medium]
Is qcom,uefi-rtc-info missing from pmk8850_rtc?

Commit 823c3b6a6743 ("firmware: qcom: scm: Allow QSEECOM on Surface Laptop
8th Edition") added microsoft,surface-laptop-8-13p8 to
qcom_scm_qseecom_allowlist so the RTC driver can access the RTC offset
stored in UEFI variables.

However, pmk8850.dtsi does not set qcom,uefi-rtc-info on pmk8850_rtc, and
pmk8850_rtc here only sets qcom,no-alarm without nvmem-cells or
qcom,uefi-rtc-info. In drivers/rtc/rtc-pm8xxx.c,
pm8xxx_rtc_probe() -> pm8xxx_rtc_probe_offset() checks:

	/* Use UEFI storage as fallback if available */
	rtc_dd->use_uefi =3D of_property_read_bool(rtc_dd->dev->of_node,
						 "qcom,uefi-rtc-info");
	if (!rtc_dd->use_uefi)
		return 0;

Without qcom,uefi-rtc-info, rtc_dd->use_uefi remains false,
pm8xxx_rtc_read_time() returns the unadjusted PMIC counter value, and
pm8xxx_rtc_set_time() -> pm8xxx_rtc_update_offset() fails with -ENODEV.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-mahua-surf=
ace-laptop-v2-0-7dd903a12d22@oss.qualcomm.com?part=3D3
