Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D553633F383
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403507; cv=none; b=ECCWGHfaJ5w52W8syGDWHzksiopjxC4uTnfNF4NB1asWPSiTJ7sBVlGBlrkuAztqamCFOfW0T1JRWpG/Kj/W+pKhPaXw47C+up4qaN7KKxiae2adxFRs4tVLKi070XJrfXiVu0fipoW9Za3hILgbo3ldw8e8ISxUYUQYyQ3yPO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403507; c=relaxed/simple;
	bh=3Py6946VVSuShzOUs7XUrzL306uJdBdyHQtFtK053J0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=e25zJS2NmN4NKHFcdZCCuXLc3rAVDq2kGJomCEXWOiN4YvwF+sQrx+5SIJ+JPFvatEoXoXvrFqWImnZEnImwHZCkN+d/Nt7Oenu3Gsqxmq3CTTaGLSRDEnISzw5XZC+rq/Q7+JtcOB6UlgoNFrxpDnZBS6iFgiNiXgwlYh2NqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YO/IQlrl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YO/IQlrl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBB41F000C8;
	Mon, 19 Oct 2026 09:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792403506;
	bh=iw2cwwuPSDRhCd4qw9kGwc97oFjV13+AS/DapKRzU9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YO/IQlrlD2bl59jSRB6jAeXRb7CFsHc4zeHpuN5pLWUttjs8/kRA8r3aROztt1RhA
	 UZgasAqZztWuqowyEsEGtos6dOhG+aaAPsgLsAoaMf/gnTxjMboOoejXfQ2aYyW2Y3
	 rHnxAqir6VVfhr/VHPIzebYRTYBPRpjOIikwuuCyKIdlMROQYiTM34mYUdIffRWTbq
	 dRJ33q+Vlw8bo1hoOjF5cuqvMdnMTYjYwOedPXcqT9bV7ELyhmNP5q4MDOqfrnojhV
	 yO5BeP7WjMX1VNrBC6PrS2W87NVFk21Fwym4ZcuDw0vNn/7NonLqDnwU7tVS6ZONkz
	 Z8FtJ9T03RZ/Q==
Message-ID: <sashiko-outbox-176925@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: shikra: enable WCN SW_CTRL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linghui Wu" <linghui.wu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019093911.3199891-4-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261019093911.3199891-4-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 09:51:45 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: shikra: unconfigured trigger type on wcn3988-pmu=
 wake IRQ
--

commit 0d919d176f5987f0cfa1c7fc5b73e582dabc0bf6
Author: Linghui Wu <linghui.wu@oss.qualcomm.com>

arm64: dts: qcom: shikra: enable WCN SW_CTRL

This commit marks the wcn3988-pmu node as a wakeup source on the Shikra
CQM, CQS, and IQS SOMs so the power sequencing driver registers the
SW_CTRL GPIO as a dedicated wake IRQ.

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
> index ebc3052d57a99..5edcabd9dae17 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> @@ -85,6 +85,7 @@ wcn3988-pmu {
>  		pinctrl-names =3D "default";
> =20
>  		swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +		wakeup-source;

[Severity: High]
Does enabling wakeup-source on wcn3988-pmu leave the TLMM GPIO 88 wake IRQ
without a configured trigger type and stuck on handle_bad_irq?

When wakeup-source is present, pwrseq_qcom_wcn_probe() in
drivers/power/sequencing/pwrseq-qcom-wcn.c maps swctrl-gpios to an IRQ and
registers it as a dedicated wake IRQ:

    wake_irq =3D gpiod_to_irq(swctrl_gpio);
    if (wake_irq < 0)
            return dev_err_probe(dev, wake_irq,
                                 "Failed to get the SW_CTRL wake IRQ\n");

    ret =3D devm_device_init_wakeup(dev);
    if (ret)
            return dev_err_probe(dev, ret,
                                 "Failed to enable wakeup\n");

    ret =3D dev_pm_set_dedicated_wake_irq(dev, wake_irq);

In drivers/pinctrl/qcom/pinctrl-msm.c, msm_gpio_init() initializes the GPIO
IRQ chip with no default trigger type and handle_bad_irq:

    girq->default_type =3D IRQ_TYPE_NONE;
    girq->handler =3D handle_bad_irq;

Because tlmm uses a hierarchical IRQ domain with wakeup-parent =3D <&mpm>,
gpiod_to_irq() -> gpiochip_to_irq() creates the mapping with IRQ_TYPE_NONE.
Then dev_pm_set_dedicated_wake_irq() -> __dev_pm_set_dedicated_wake_irq()
in drivers/base/power/wakeirq.c requests the IRQ without any
IRQF_TRIGGER_* flags:

    err =3D request_threaded_irq(irq, NULL, handle_threaded_wake_irq,
                               IRQF_ONESHOT | IRQF_NO_AUTOEN,
                               wirq->name, wirq);

In __setup_irq(), because neither the request flags nor the existing
irq_data specifies any trigger bits, __irq_set_trigger() is skipped and
neither msm_gpio_irq_set_type() nor qcom_mpm_set_type() is called. As a
result, the TLMM and MPM trigger registers remain unconfigured and
desc->handle_irq stays set to handle_bad_irq instead of handle_level_irq
or handle_edge_irq.

Should the trigger type be configured before or when registering the wake
IRQ, or specified via an interrupts property?

> =20
>  		vddio-supply =3D <&pm8150_s4>;
>  		vddxo-supply =3D <&pm8150_l12>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019093911.3199=
891-1-linghui.wu@oss.qualcomm.com?part=3D3
