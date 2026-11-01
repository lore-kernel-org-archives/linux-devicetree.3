Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576751;
	b=QdMYBgtTRZUWdZtQn/yML787z8+YAD+wycB+lUdjYtUOF6u+SOFImJ0TRnCcTm7wYjEr
	 rDXDHi2WQ4px+zWk+jjzHzRd+vrs9BvmFmXtNOsfwJJXeYsomG3VINjKN8zBKBNLcwySx
	 D/Y+Wl16DWEC2FoIZAYSlAEwiwRfx3xxC1PpcphK4fgni3vfd1k+9D2A2wsS4drisuhSN
	 cpZHQIMw1pQL94b/EnRi/8S3XDFroy4HhBcbj8HGDMb2uKtHeRF+RaQlSaOA40xKDMTk4
	 hafje24EDpZWg97xUuyCPWmU69YLYzFzvi6EeLvMsjhvXEw3n9LANTjWs6AjgzCrrkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576751;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xXHCGGyQnn/cptqFN5RVWdiNNAVc8hK4zH082w0NMYA=;
	b=aczZIGVtSeMzfqiHkfMBm3CSE87lDgKmKXQLfn0YvRNmFO/jVQ2JNiEa0PO+RZ9hNz/H
	 9RS7PSXq0rEGZTIepOcQQrbPOCZabfLEEj0cfivX2LYY7c3/KTdTU8Qi/1WksTHR8uFPY
	 CQAztk+JRi27h1ISAk5AixoH53U1SUing/9UMDqzdNqxzKYaIQJZ4h01EPcjE+9IUGAT8
	 jIEVrBl7HO99ZRgnZIctNtKoQLx3Uv963w8xE+Wy0LnVIy08nEbO8PO9ZMMku8DV5yxqt
	 4dXz//J8BtBiw07kDmniVx8dxKQdSaF3k4V6DwJp1yb2WeYfqCQTtROiyVq8uGF02xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uls0BIlh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A78606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 23:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uls0BIlh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9DFC1F000C1;
	Sun,  1 Nov 2026 23:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793576751;
	bh=xXHCGGyQnn/cptqFN5RVWdiNNAVc8hK4zH082w0NMYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uls0BIlh2yt3FYfzHJa8mdyB6tQoN2iAO3t3hy6vrTcfCH0yIbU6LhH27HlZ+N3nT
	 e22KYbnzPahwOGKZlRu9qbzrBd9RmlU73sfSMMa5NzGb04S038eT8VpJ8SFDPSw1m5
	 FLsAZVswUvNNkt1U4OapBy5Y1mUL/HIKglGhK8soEQXCnCe/gghq5h3RvXyPu2UcdR
	 aSgHjQNnoI4+QqYKrdqJAeYis1P5TjZ0p3zr+Y0TRFFka+fYozuQ8qsqkXrN9HYdQX
	 EbxionRpUArKx3d0nvzTRuILFWgRyBMK2z29u2wnC9kjszbMyXjBFxq+IuH7xpgRA7
	 OZXWSGg1w4rGA==
Message-ID: <sashiko-outbox-192770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/12] arm64: dts: qcom: sm6350-lena: Enable
 Bluetooth
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-pdx213-upstream-3-v3-5-cdc3be96d257@erebion.eu>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-5-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 23:45:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: missing bias-bus-hold on qup_uart1_cts in defa=
ult state
--

commit c6c43a5057066bea59381415e228911af9075c62
Author: erebion <erebion@erebion.eu>

arm64: dts: qcom: sm6350-lena: Enable Bluetooth

This commit configures the UART1 pinmux, sleep states, and regulators to
enable the WCN3991 Bluetooth controller on the Sony Xperia 10 III.

> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index ce351a3fa8727..f1958f4bad05a 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
[ ... ]
> @@ -387,6 +391,32 @@ &qupv3_id_1 {
>  	status =3D "okay";
>  };
> =20
> +/* UART1: HS UART for Bluetooth */
> +&qup_uart1_rts {
> +	/* We'll drive RTS, so no pull */
> +	drive-strength =3D <2>;
> +	/delete-property/ bias-pull-down;
> +	bias-disable;
> +};

[Severity: Medium]
Should this also override qup_uart1_cts to replace bias-disable with
bias-bus-hold in the default state, similar to qup_uart1_sleep_cts below
(and sm7225-fairphone-fp4.dts)?

In arch/arm64/boot/dts/qcom/sm6350.dtsi, qup_uart1_cts configures gpio61
with bias-disable:

	qup_uart1_cts: qup-uart1-cts-default-state {
		pins =3D "gpio61";
		function =3D "qup01";
		drive-strength =3D <2>;
		bias-disable;
	};

Because qca_serdev_probe() -> hci_uart_register_device_priv() ->
serdev_device_open() opens the UART port at probe time and keeps it open
even when Bluetooth is powered off via qca_hci_shutdown() ->
qca_power_off(), qcom_geni_serial_startup() holds an active runtime PM
reference on uart1 whenever the system is awake.

As a result, uart1 only switches to the sleep pinctrl state during
system-wide suspend in qcom_geni_serial_suspend() ->
pm_runtime_force_suspend(). When Bluetooth is turned off while the system
is awake, uart1 stays in the default pinctrl state, leaving gpio61 with
bias-disable instead of bias-bus-hold while the WCN3991 is unpowered.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-pdx213-ups=
tream-3-v3-0-cdc3be96d257@erebion.eu?part=3D5
