Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8995A358360
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776852505; cv=none; b=dsq491Hjd2Vdui0nBIhi1ZU9mdMBE7ZQfCU0CLKB3cpYL7p2TjTmxYAlJnJKUnCTR/hR8A9pp8/6LOe3zi02ctPiW/3b8sArIfoOEzPuDpVuobglsxfDwsH/E0HrSlOGK50Y8m31MaJ1QXcZk3aHkTszgN41xeu6FOFL8FOAtRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776852505; c=relaxed/simple;
	bh=0DtMWw6VM8mrg3W/AaPv6cHqvbpEt/HUkRxOWkRJ4Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=iEfMefM+dni+Z/l7bk0zi7hkJytY0tIcXLGcS2LyGj1pVpmUKnd6OF5iNzxlAWgqNIYOIYdBOk1XNvDeHJkHeECy1o5Veyr8XOVrDEscei127nKPiGPvqGFVi8uNuoVWCqFdIno5KTiqsvtfaisRVnba4lIg17NABPvsDoCyPl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=fvCqhW9J; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="fvCqhW9J"
Date: Wed, 22 Apr 2026 10:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776852501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWShHqAw4U1uydaiXNZxk2uNajr8xD5Ld6tysqlIMiI=;
	b=fvCqhW9J1GeX5Xa9UNtlR8L0Uhx9BDqLHq8lNurRvJ6qjFJz+uWUwvNm+vFXpD5lfI3PRm
	gwGQJMq7UdP1c9kt6OgnIzoaO1Fenx5MnUUZmNo2mkzOHofdFmhnC7ob7+aHH2qeOMYBv7
	RVncjzTRe2PFiiTGdDlrh1AuFijBOi8phSYH2unXhOugPcKQ1ljrEZhOS7jydHY5STkDCf
	xFL7jduRVdserRUDj1IXe+lp22zi7qScot+HppBgleSN1Q5Gz13NFODx5N05RmohDZWHQK
	fV8Ze2qcRDsWxhmp7pd5hrFhJyV4HvL2QEyDRuBCWk3uKMUjE6JyxKAmhlqUeg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Stefan K=?UTF-8?B?w7Y=?=v=?UTF-8?B?w6k=?=r-Draxl <christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH v4 2/2] arm64: dts: amlogic: add support for Amediatech X98Q
References: <20260422095840.26139-1-christian.koever-draxl@student.uibk.ac.at> <20260422095840.26139-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260422095840.26139-3-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdw45o.mk8sa216w5vw@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT

On Wed, 22 Apr 2026 09:58, christian.koever-draxl@student.uibk.ac.at wrote:
>From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>
>Add dts enabling core hardware for the Amediatech X98Q TV box.
>
>The board features:
>- Amlogic S905W2 (Meson S4) SoC
>- 1 GiB RAM (2 GiB variants exist)
>- eMMC and microSD card slot
>- SDIO-based WiFi module (unsupported)
>- RMII Ethernet with internal PHY
>- IR receiver and UART console
>- Status LED
>
>Enabled peripherals:
>- eMMC (HS200)
>- SD card interface
>- SDIO bus (WiFi, no driver yet)
>- Ethernet (RMII)
>- UART_B
>- IR receiver
>- PWM-controlled CPU regulator
>- PWM and Fixed regulators for core and IO rails
>
>Known limitations:
>- No support for the onboard WiFi module
>- Missing multimedia (HDMI/audio)
>
>Signed-off-by: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>---
> arch/arm64/boot/dts/amlogic/Makefile          |   1 +
> .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 249 ++++++++++++++++++
> 2 files changed, 250 insertions(+)
> create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
><...>
>+&sd {
>+	status = "okay";
>+	pinctrl-0 = <&sdcard_pins>;
>+	pinctrl-1 = <&sdcard_clk_gate_pins>;
>+	pinctrl-names = "default", "clk-gate";
>+	bus-width = <4>;
>+	cap-sd-highspeed;
>+	max-frequency = <50000000>;
>+	disable-wp;
>+
>+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
>+
>+	vmmc-supply = <&vddao_3v3>;
>+	vqmmc-supply = <&vddao_3v3>;
>+};
>+
>+     /*
>+      * Wireless SDIO Module (Amlogic W150S1)
>+      * Note: There is no driver for this at the moment.
>+      */
>+

I didn't mean to indent, just to align the '*'.
Sorry it wasn't clear.

>+&sdio {
>+	status = "okay";
>+	pinctrl-0 = <&sdio_pins>;
>+	pinctrl-1 = <&sdio_clk_gate_pins>;
>+	pinctrl-names = "default", "clk-gate";
>+	#address-cells = <1>;
>+	#size-cells = <0>;
>+	bus-width = <4>;
>+	cap-sd-highspeed;
>+	sd-uhs-sdr50;
>+	sd-uhs-sdr104;
>+	max-frequency = <200000000>;
>+	non-removable;
>+	disable-wp;
>+
>+	no-sd;
>+	no-mmc;
>+	mmc-pwrseq = <&sdio_pwrseq>;
>+	vmmc-supply = <&vddao_3v3>;
>+	vqmmc-supply = <&vddio_ao1v8>;
>+};
>+
>+&uart_b {
>+	status = "okay";
>+};
>-- 
>2.53.0

--
Best regards,
Ferass
