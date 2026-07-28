Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808BD233947
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230762; cv=none; b=KVha7HdiWsKDu8z23dULwtKQnfzG8rQcAhHXsBRA5n2ncAKGY0bE4qo98MIC2Eam3xsKy4imL51bU4ELvh2VeZ7nYJv/XHm0kX964a6m0aEoXrDtyLLET2r4PUx8qk1xyxmYp8psAa+cAd8tj7iqtrj+cNN0fmUSuzBgG2CF378=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230762; c=relaxed/simple;
	bh=f2eik/o0Ih80ZunfQsMgjygmkYD81p3o9jl/SqNUrhI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YDu3xpX+87oKBkDxDSC8U6N4yxGFcT0zXe98WqfMdNcVfKkpd0WWycdf45vQQ6/S5rNREI5bTrNPKVU4RxZzuTLbEITVfNhc2ARjJNUm93XKGnA6/qsLdt6iOATx0Cc8MLUYbmLbXRsjRPuhRMWvOKZnHI5rrMPo+Ve6Zxczoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/UrYr0B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/UrYr0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81A11F000E9;
	Tue, 28 Jul 2026 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785230761;
	bh=DB6QKGnV7EqaVhusA2iMMYcGbQQZowTphNcjHkOeULE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I/UrYr0B7Nd2Ssws5sIkencGjEZlw+Gx2bo8nhwoHdUYQAsFhUz9J8tiatRPrPKu6
	 vlvfOSzQS/epCEn3zgd28JJhEwg27Om15tF5GM11rFEF0juYHmGr02gAZUxGSBnQr3
	 OKDSciFZGkPuoQD1K8TBYXEMsJUaQxxyGCsXPeP+9uiTGjntiGncKsT3d2q4dwA6PR
	 qzywvXEt7gkwpvPSQb2WSf9UZZdZG+63WT8M4NkwYU8kWXQi3SLUbLGdtS1Nedhlmq
	 B9elzTp7y5jzFre49Nc2WM0Eh0zBZfdwtKySHseHLzb6jC14MgQyUZ+6SoP2gen2JY
	 BlQqItZl4YRPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add
 display nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-display-dt-v5-1-892ab9bcecfe@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-display-dt-v5-1-892ab9bcecfe@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:26:00 +0000
Message-Id: <20260728092600.A81A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `irq-gpios` property for the `goodix,gt911` touchscreen =
disables hardware reset and prevents power-saving during system suspend.
--

--- Patch [1]: [PATCH v5] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add di=
splay nodes ---
commit 45b53dce9edf26f8a360e6a4051f18fcd53da6f0
Author: KancyJoe <kancy2333@outlook.com>

arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display nodes

This commit adds nodes for the dual DSI panel, regulators, backlight
controller, touch controller, and GPU on the sm8650-ayaneo-pocket-s2 board
to enable full display support.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/=
arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> index 0dc994f4e48d9..e933cb35a5155 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts

[ ... ]

> @@ -1016,6 +1037,30 @@ wcd_usbss_sbu_mux: endpoint {
>  	};
>  };
> =20
> +&i2c4 {
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	touchscreen@5d {
> +		compatible =3D "goodix,gt911";
> +		reg =3D <0x5d>;
> +
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <162 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios =3D <&tlmm 161 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Does this node need an irq-gpios property to properly support hardware reset
and power saving during suspend?

Without the irq-gpios property, the Goodix driver fails to fetch it in
goodix_get_gpio_config(), leaving ts->irq_pin_access_method as
IRQ_PIN_ACCESS_NONE.

Because the driver cannot drive the IRQ pin as an output to wake the device,
it skips sending the sleep command during suspend:

drivers/input/touchscreen/goodix.c:goodix_suspend() {
    ...
    if (ts->irq_pin_access_method =3D=3D IRQ_PIN_ACCESS_NONE)
        return 0;
    ...
    /* sends GOODIX_CMD_SCREEN_OFF */
}

This causes the touchscreen to remain fully active during system suspend.

Additionally, goodix_reset() is bypassed in goodix_ts_probe(), rendering the
provided reset-gpios ineffective and preventing the driver from recovering a
misconfigured device.

> +		VDDIO-supply =3D <&vreg_l14b_3p2>;
> +		AVDD28-supply =3D <&vreg_l14b_3p2>;
> +
> +		touchscreen-size-x =3D <1440>;
> +		touchscreen-size-y =3D <2560>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&ts_reset_default>, <&ts_irq_default>;
> +	};
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-topic-sm86=
50-ayaneo-pocket-s2-display-dt-v5-1-892ab9bcecfe@linaro.org?part=3D1
