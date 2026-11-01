Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576324;
	b=nqU1byRxVBFaZ9UMFGZqlYsBjoY08KgA7ztvIK5OUiPeGe/4FqLl/ROtJzIhLJTt7KzZ
	 zUqMwAe9GIEaetH6GO7MKU9QvTLD0F/Zn42n4gbjpdF58we+VV/9okpR7lkiia6I/oLL0
	 Ik7CEP36/dPkCm61CfGqw9G/U/TZghTfofEJAnI5sNti3xrUgp7aAm/JVSkkN6EDtYNG9
	 aDD+vzgTlfbkAw29MEa7Yq3gCKxSxgLHksqGQdeRYh5dzEFg+LPEgGMmb8LC4ndmDb6gY
	 cW5y9VdspqHla67tEvLfdBcfH18JHfq8TLOWJFXcIFn5yfpXHWJ4BukJR0zUfgw8Ncw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576324;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Juti9EcHeNFsMBB/29LIEyiqTgwCQ4NeUM7qAEas7Fk=;
	b=Yfp+Jq50seSQQY0SYVPQ+l3r79phmTP4N6rJjSykx9iL6lxkKzP9Mea4Rpiq+AHEzEog
	 ze1ZD47Or8myyGZcEDKEraDL+OlgPMX57X67ptg1JTAnqMsbKG/Ln9f6t2QXMWJIJP3s5
	 rt/LbGhiIHxDI6pkjN1pO4VkAc7G9ZrOIj2SOIEUKc6ajYGHdi4kMOIaj3DMjesXXe7mf
	 xcKiGuFuo5mkA29KS07g1sMGD0L2nJNBhE5YIvXW7uCf4Tf0y4hUIG/GjxelY+/zjAq0w
	 cPSa/ozfj1lKlucz7dFpyccvOjZVf+JUSt9Gm0Awe7Pkrht2DrH7b57x/OE9nO7tmnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojzU3fya;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC8606A330
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 23:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojzU3fya
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344DF1F00919;
	Sun,  1 Nov 2026 23:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793576323;
	bh=Juti9EcHeNFsMBB/29LIEyiqTgwCQ4NeUM7qAEas7Fk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ojzU3fyawC8EDIJXmoX6BReXYnKNFTQgMk7zQ83apVqS6NPtLj9RX2d62VFD0Zy5j
	 0LBnCuO7tL8Qdil4eT8xiGbD56IJnJlUm9Go6XzNZK82SKgpRR5nhmrqPp2UKAdV8p
	 SXeQUJGzIeMUYy9U7y+mZHFBGXfYQiGfDfBK7Iw+ZTZDGIfVZl7Y2/NmbM0PbuLpUg
	 NIVbJYt3MiM4PvGzxd5cL6oFEDsoQIsJQj3QqhKtEwAxRCUUC+Yhk1y7TaFYp3egKg
	 a1SSq040J8dW420d+j3U1ANmW/cOuF1G0/vwG+wTHYO1N+P6Rpa0NWKYxnHZvwcwQC
	 gWudeSGBfWUhg==
Message-ID: <sashiko-outbox-192760@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/12] arm64: dts: qcom: sm6350-lena: Add flash LED
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-pdx213-upstream-3-v3-1-cdc3be96d257@erebion.eu>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-1-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 23:38:42 +0000
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
- [Medium] arm64: dts: qcom: sm6350-lena: invalid led-max-microamp in pm615=
0l_flash
--

commit c063589d95e3f37ff34d230113ce64e10e062736
Author: erebion <erebion@erebion.eu>

arm64: dts: qcom: sm6350-lena: Add flash LED

This commit adds a devicetree node for the camera flash LED on the Sony
Xperia 10 III (pdx213).

> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 6e2bbf4f060ac..6942a117d41cf 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts

[ ... ]

> @@ -302,6 +304,19 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&pm6150l_flash {
> +	status =3D "okay";
> +
> +	led-0 {
> +		function =3D LED_FUNCTION_FLASH;
> +		color =3D <LED_COLOR_ID_WHITE>;
> +		led-sources =3D <1>;
> +		led-max-microamp =3D <1500000>;
> +		flash-max-microamp =3D <1000000>;

[Severity: Medium]
Is led-max-microamp =3D <1500000> in pm6150l_flash intended here, or was a =
lower
continuous torch current limit such as 150000 uA meant instead?

In Documentation/devicetree/bindings/leds/common.yaml and
Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml,
led-max-microamp specifies the maximum continuous torch current, whereas
flash-max-microamp specifies the pulsed strobe flash current. The binding
schema constrains led-max-microamp to a maximum of 500000 uA for a single
channel (or 1000000 uA for two ganged channels):

Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml:
      led-max-microamp:
        anyOf:
          - minimum: 5000
            maximum: 500000
            multipleOf: 5000
          - minimum: 10000
            maximum: 1000000
            multipleOf: 10000

Setting led-max-microamp to 1500000 uA causes dtbs_check validation to fail
and sets the continuous torch limit higher than flash-max-microamp
(1000000 uA).

At runtime, when qcom_flash_led_probe() calls qcom_flash_register_led_devic=
e()
in drivers/leds/flash/leds-qcom-flash.c for a single-channel LED
(led-sources =3D <1>), the driver clamps led-max-microamp to the hardware p=
er-
channel maximum of 500000 uA (TORCH_CURRENT_MAX_UA):

drivers/leds/flash/leds-qcom-flash.c:qcom_flash_register_led_device() {
	...
	current_ua =3D min_t(u32, current_ua, TORCH_CURRENT_MAX_UA * led->chan_cou=
nt);
	led->max_torch_current_ma =3D current_ua / UA_PER_MA;
	...
}

This allows up to 500 mA in continuous torch mode rather than a board-speci=
fic
torch limit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-pdx213-ups=
tream-3-v3-0-cdc3be96d257@erebion.eu?part=3D1
