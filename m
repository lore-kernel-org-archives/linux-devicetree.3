Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2A73876BB
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317584; cv=none; b=AJhbpvrAzVJbLsN48Iweon/KBa9MGltpUkePq9Z/qbjQgKwJcZtGc3QFAPeeu7FI7d0P8fgiP8Qs3K+A/wVPq2JZZDyp5L86VCzN1BbHSOn5y+hnyFu7GTK242w+J1ZWJPR6tBlJTpJe1yKPOEW8/vMbiniQbe/DhRUkuVtkzfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317584; c=relaxed/simple;
	bh=5HyaDaWPtwI09+g3spWCR9xjRUTFEzTuC8TbG5B0aDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kZlDvlsf1yFyske8KIHi9E95X1sOfHr5EHqgo7/rT9YekPpLb1fXLZSqZO2mYcBcMRU953jQ7VW2uV4IHHLVRjEpMbN8JjxYjZf8944o8J1TdPrZEHaEKGVfMZPZu1+C+U0+TlhuiaD9GQJ/E232vuiE4frM0YPA4eeNDQhDje4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eERx2Be7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eERx2Be7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53D31F000FF;
	Fri, 25 Sep 2026 06:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790317583;
	bh=PZtlzkXKO4akb9shkggXVC0e7SLhp8rJviQel+zSOUk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eERx2Be7cTMGdlpEr3jmlrA5U0sosDr2fPWnm8Sb1G1QzWvPTV9trJxLYdnVYDdDG
	 GQ1FIWvUWoAMH6+vTGqe5l6MRXjGbAaz3fmoFPDi1SY4kKbn5Jcbq+N5n9RYzNJ5Tj
	 4hEuqDkL1GQnV4bJWw0RzqcOJjJC/TboWYO8sSHF5sO0MARDqxEFq2pggPGMC0F8gk
	 BW4ZC1xfL0l/xWSz+ST7gB7SkW4Y0UQOVz1iDSYkvNr2LRiVt5b6wRemhbQSLATC6W
	 dPNw/rdJw988AJ5kA4qRtooPguLn9ZEJJOMl1fs87mrzfjwhIWdjLhcF3PCoJJbvLg
	 4S3eSt0knILVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add WCN clock to
 Bluetooth node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yepuri Siddu" <yepuri.siddu@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260925-bt-wcn-clk-enable-v1-2-30bee88c4de4@oss.qualcomm.com>
References: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
 <20260925-bt-wcn-clk-enable-v1-2-30bee88c4de4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 06:26:22 +0000
Message-Id: <20260925062622.C53D31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dt-bindings: incorrect WCN clock placement breaks WiFi power seque=
ncing
- [High] bluetooth: hci_qca: unbalanced clock and pwrseq disable on error p=
ath
--

commit 508a8593da851a2bfa09fc351881cb48702acb33
Author: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add WCN clock to Bluetooth node

This commit explicitly declares the WCN clock dependency in the Bluetooth n=
ode
for the shikra CQM and IQS SOM boards. It is intended to allow the hci_qca
driver to vote for the clock during Bluetooth power sequencing.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-cqm-som.dtsi
> index 8ac42ff625a0e..4e03e459c7c16 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> @@ -220,6 +220,8 @@ bluetooth {
>  		vddxo-supply =3D <&vreg_pmu_xo>;
>  		vddrf-supply =3D <&vreg_pmu_rf>;
>  		vddch0-supply =3D <&vreg_pmu_ch0>;
> +
> +		clocks =3D <&rpmcc RPM_SMD_RF_CLK2>;

[Severity: High]
Does this code place the WCN clock in the correct node?

The WCN PMU driver (drivers/power/sequencing/pwrseq-qcom-wcn.c) manages the
shared WCN RF clock for both Bluetooth and WLAN. It retrieves the clock from
its own PMU device node via devm_clk_get_optional(dev, NULL).

If the main RF clock is placed inside the bluetooth node instead of the
wcn3988-pmu node, the PMU driver's ctx->clk evaluates to NULL.

If WiFi is powered on while Bluetooth is off, will the PMU driver attempt to
enable the clock but do nothing, leaving the hardware clock disabled and
causing the WiFi subsystem to silently fail or crash?

>  	};
>  };
> =20
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-iqs-som.dtsi
> index 4ff97945274dd..227283ab74a81 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> @@ -242,6 +242,8 @@ bluetooth {
>  		vddxo-supply =3D <&vreg_pmu_xo>;
>  		vddrf-supply =3D <&vreg_pmu_rf>;
>  		vddch0-supply =3D <&vreg_pmu_ch0>;
> +
> +		clocks =3D <&rpmcc RPM_SMD_RF_CLK1>;

[Severity: High]
Is the WCN clock placement correct here?

Similar to the CQM SOM, if the clock is placed in the bluetooth node instead
of the wcn3988-pmu node, will this deprive the PMU power sequencer of its
clock reference and break WiFi power sequencing?

>  	};
>  };

I also have a question regarding the pwrseq path mentioned in the commit
message.

drivers/bluetooth/hci_qca.c:qca_regulator_enable() {
    ...
		if (qcadev->susclk) {
			ret =3D clk_prepare_enable(qcadev->susclk);
			if (ret)
				pwrseq_disable(power->pwrseq);
		}
		return ret;
}

[Severity: High]
If clk_prepare_enable(qcadev->susclk) fails here, pwrseq_disable() is called
and the error is returned. This error propagates up through qca_power_on() =
to
qca_setup(). Upon failure, qca_setup() jumps to the out label and invokes
qca_power_off():

drivers/bluetooth/hci_qca.c:qca_power_off() {
    ...
	if (power && power->pwrseq) {
		if (qcadev->susclk)
			clk_disable_unprepare(qcadev->susclk);
		pwrseq_disable(power->pwrseq);
		set_bit(QCA_BT_OFF, &qca->flags);
		return;
	}
    ...
}

Because qca_power_off() lacks state tracking for the pwrseq path, will this
unconditionally execute clk_disable_unprepare(qcadev->susclk) and
pwrseq_disable(power->pwrseq) again?

Could this unbalanced clock unprepare trigger a kernel WARN, and could the
double pwrseq_disable() cause a reference count underflow, potentially lead=
ing
to crashes or resource corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-bt-wcn-clk=
-enable-v1-0-30bee88c4de4@oss.qualcomm.com?part=3D2
