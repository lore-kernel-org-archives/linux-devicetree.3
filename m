Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468909;
	b=aJCUTo82j6RoJhCD/eKDCjZSiYUDXRWBmZ2RivsjiLLB6mkhGug8wnkHTbucEcCbwlkV
	 /TO8wYdDJryuMkhA56ivuuQ+iv/dCR2vE73tkKgwP4mlwNG3KQJbxvn//Rzg3AH4kA3++
	 9jcAWxelTKCcwRa8JAETZ0SNLu5pokN0ybIHuq6HKYZ1yhVflE+skr8mtk5x8y6KZuiIV
	 EGEPEECCqUUacm/5zcSMzUcF3OyiHlJ4BHbPHRMj8Mm/9YBYUx+ucX/uH95gP35dgndyD
	 ZySe++946bXAxQuh3aat3jYZQMcSJhmfGAbNhajUqMx7IoWYY6RsXbcZC+SdQBfcc5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468909;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MU9w5JM7vloSl4/dyPJWXYyuanIV+41xdDiEO8Wkbqg=;
	b=ho9J+IDJv3Z55k6WgQey+yvOd3FNXdeIj1AlSpS40riefqruv0Vf8+DFOzODN/lNGXFZ
	 DrjU2W4asgaRkaS0btvi3mwp6dKGs0hPy0KhriSaDEy2VtINobwHUS0hc9OOU4VK/HgNH
	 ZzfqUAo+A4EyVGfImTUBxKGNOy+qPHpe7DwE8h7pwwwmzGpqEf1amb1D+8PdGC2os2nlG
	 rrfP5wJk8zDdYR26DSK1Fv2ay9wezT1xvwPWSo64xX0d+n+2cKXUZrNdSwUXw8b3hVR+w
	 w3PD2MsX9aK+355SkQmVKPkuX7K/p06W13gRGzSg6Gu3r8Y6maizedb5pxsUtNSKzMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FvYyPWZP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A22606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FvYyPWZP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA761F00A05;
	Thu, 12 Nov 2026 07:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794468909;
	bh=MU9w5JM7vloSl4/dyPJWXYyuanIV+41xdDiEO8Wkbqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FvYyPWZPmupktlba/QeOMfXccbmXm46Tna1w9eCWuHmhietgYnbb4jlwwsO94B5sK
	 lEFmyHOEnntAwSVJjsKzeXWMfTJjAznn7smnIIG+koMKOG+u1Nf9NatAT3ZHT3PNI0
	 F5HPIgWOaVyW/OvU+1f+TKVz+FQTzKPzaazoibPnvrE6CdhXpBkFhVrQmMH1GiT9Ql
	 8ulkncLUUXu7O9jj2oHteLvFHb7mYx0owjYjuY/qTogYgv6/X//ujbsoVYcjnIIReK
	 JE1wSEqUK/drJhbfPSM7lffqLMsLNc3GGsvmSZAmQ1lqi12CDz+3qd4MhKsaphZvgi
	 vTbRvZcN5UYGQ==
Message-ID: <sashiko-outbox-210615@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: shikra: enable WCN SW_CTRL
 wakeup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linghui Wu" <linghui.wu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112072009.3815276-4-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-4-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:35:08 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: shikra: unconfigured trigger type on
  wcn3988-pmu wake IRQ
--

commit a2fb22de0f4bb902b0590abe34c32d49b1aa90fd
Author: Linghui Wu <linghui.wu@oss.qualcomm.com>

arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup

This commit adds the wakeup-source property to the wcn3988-pmu nodes on
the Shikra CQM and IQS SoMs so the WCN power sequencer uses the SW_CTRL
GPIO as a wake IRQ.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-cqm-som.dtsi
> index 95eb7255fb227..c7b894b6126c1 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> @@ -102,6 +102,7 @@ wcn3988-pmu {
>  		pinctrl-names =3D "default";
> =20
>  		swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +		wakeup-source;
> =20
>  		vddio-supply =3D <&pm4125_l7>;
>  		vddxo-supply =3D <&pm4125_l13>;
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-iqs-som.dtsi
> index 99e974f6ca7e1..321bc64237280 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> @@ -85,6 +85,7 @@ wcn3988-pmu {
>  		pinctrl-names =3D "default";
> =20
>  		swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +		wakeup-source;
> =20
>  		vddio-supply =3D <&pm8150_s4>;
>  		vddxo-supply =3D <&pm8150_l12>;

[Severity: High]
Does enabling wakeup-source here leave the SW_CTRL wake IRQ without a
configured trigger type?

In pwrseq_qcom_wcn_probe(), the driver maps swctrl_gpio via gpiod_to_irq()
and passes it to dev_pm_set_dedicated_wake_irq():

drivers/power/sequencing/pwrseq-qcom-wcn.c:pwrseq_qcom_wcn_probe() {
	...
		wake_irq =3D gpiod_to_irq(swctrl_gpio);
		if (wake_irq < 0)
			return dev_err_probe(dev, wake_irq,
					     "Failed to get the SW_CTRL wake IRQ\n");

		ret =3D devm_device_init_wakeup(dev);
		if (ret)
			return dev_err_probe(dev, ret,
					     "Failed to enable wakeup\n");

		ret =3D dev_pm_set_dedicated_wake_irq(dev, wake_irq);
	...
}

gpiochip_to_irq() creates the hierarchical TLMM/MPM mapping with
IRQ_TYPE_NONE, where msm_gpio_init() initializes the flow handler to
handle_bad_irq, and __dev_pm_set_dedicated_wake_irq() requests the
threaded IRQ without any IRQF_TRIGGER_* flags. Because both the requested
flags and existing trigger type are IRQ_TYPE_NONE, __setup_irq() skips
__irq_set_trigger().

Neither msm_gpio_irq_set_type() nor qcom_mpm_set_type() runs for GPIO 88,
leaving TLMM and vMPM trigger registers unprogrammed and the flow handler
set to handle_bad_irq when the wake IRQ is armed on suspend.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112072009.3815=
276-1-linghui.wu@oss.qualcomm.com?part=3D3
