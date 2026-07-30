Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84227439325
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418512; cv=none; b=jQYaXZK2ANjiNw6/p+6j31nWCHvlH3ZBbDWSo5YW1T9G4mB+JPkx/SX9l0zii2+ek05YBCpcRP0gNobJpyc/jStM1X4RqF6rVsFIFjtSONBHmHBlps60MT8HWhrn8cPPvsdOBEsqzGafKzHpc67GajZP8xN7Zl/HU50il+VNK4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418512; c=relaxed/simple;
	bh=u6nqHozKx7Hm/iMR+RuovtbdcBsde3DoxDAyTEqyAz0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jp82HqyJOSO0QgdI9JzVdzo4WYXaEEqo9oz2iVrQr850k9fHNI1rFWqg0oK6ShYp98q4ELQRl5WFih26NuwtCRDi/e83eR/wXwq4QdfHhs3RzAFzfPky31XXDRKFPX+Qte++vpWf5SQIrCqRbZI3WE5mhg/zPUSOcyWFKGb2RCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAI10ddC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAI10ddC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6A31F00A3A;
	Thu, 30 Jul 2026 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785418511;
	bh=R8sgiiWHJJWFtXPqwIxjob4e5132uAVTmJcjCmHeaFM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZAI10ddC6Vc2c4Dym7qsE1aUroYJKkjtoN8sfjT8E5TprzKBmEGBU4kR6OA1upk3Q
	 Q25pElaslKcya98jp1+8jQi/UiXbTQoKycXO/xsp+2ypdZdN0UYmk5WPemM+2F71KU
	 54rAigVV7XU6KAJ2upfCgipA6sv6CDDupGUpR5IVCg+yAlsriz6JxBamIVYTYV7xEo
	 zqPvKmy9N2dpcLwAymxjT0QVmXuIGhWWy+ZsV50b9fue973lneZ8a4sa7UyTcVpE7u
	 RZHvh/vQz7l/vUov7SWazyLTUVWxJKk1NfClEwEgpOkXTmw6zxRyNpYE5VF8B6wnPn
	 2McYlrPU/H4xA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: support CAN1-CAN2-UART4
 adapter for RK3588 Jaguar
Reply-To: sashiko-reviews@lists.linux.dev
To: "Quentin Schulz" <foss+kernel@0leil.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-jaguar-can-v1-2-9b566bd785da@cherry.de>
References: <20260730-jaguar-can-v1-0-9b566bd785da@cherry.de>
 <20260730-jaguar-can-v1-2-9b566bd785da@cherry.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 13:35:10 +0000
Message-Id: <20260730133511.2F6A31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `max-speed` property is incorrectly applied directly to the =
UART controller node, where it is ignored.
- [Low] Device tree compilation fails due to undefined labels `can0`, `can1=
`, and `can2`.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: rockchip: support CAN1-CAN2-UART4 ad=
apter for RK3588 Jaguar ---
commit 6be47f689c18a743663d59bd2b78cb3a800f23a2
Author: Quentin Schulz <quentin.schulz@cherry.de>

arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 Jaguar

RK3588 Jaguar has a proprietary Mezzanine connector which exposes among
other things CAN1 and CAN2 controllers as well as UART4.

Add support for the CAN1-CAN2-UART4 Mezzanine adapter for RK3588 Jaguar
which exposes two CAN busses (CAN1 and CAN2) and an RS-232 UART, limited
to 250Kbps.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2-uart4.d=
tso b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2-uart4.dtso
> new file mode 100644
> index 0000000000000..9dfb81e5d0a0b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2-uart4.dtso
> @@ -0,0 +1,27 @@
[ ... ]
> +
> +&can1 {
> +	status =3D "okay";
> +};
> +
> +&can2 {
> +	status =3D "okay";
> +};

[Severity: Low]
Does this patch depend on another patch series that adds the CAN controller
nodes?

The labels &can1 and &can2 (as well as &can0 in the base file) do not appear
to exist in the upstream rk3588.dtsi base files. Compiling this causes a sy=
ntax
error because the referenced labels cannot be found.

> +
> +/* RS232 */
> +&uart4 {
> +	/* ST3232B only guarantees 250Kbps */
> +	max-speed =3D <250000>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Is the max-speed property effective when placed directly on the UART
controller node?

According to the device tree bindings (serial-peripheral-props.yaml),
max-speed is meant for serial peripherals (child nodes of the UART).
Standard kernel UART drivers typically do not parse or enforce the
max-speed property on the controller node itself.

Will this actually limit the baud rate, or will it be ignored by the driver?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/=
boot/dts/rockchip/rk3588-jaguar.dts
> index ed6c1162bd821..0446834e84d5d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
[ ... ]
> @@ -201,6 +201,16 @@ &can0 {
>  	status =3D "okay";
>  };
> =20
> +&can1 {
> +	assigned-clocks =3D <&cru CLK_CAN1>;
> +	assigned-clock-rates =3D <300000000>;
> +};
> +
> +&can2 {
> +	assigned-clocks =3D <&cru CLK_CAN2>;
> +	assigned-clock-rates =3D <300000000>;
> +};

[Severity: Low]
Are the &can1 and &can2 labels defined in another pending patch for the
rk3588.dtsi base tree? Without them, attempting to set these assigned-clocks
will result in the same compilation failure mentioned above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-jaguar-can=
-v1-0-9b566bd785da@cherry.de?part=3D2
