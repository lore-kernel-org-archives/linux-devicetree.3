Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E662FDDA9
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424947; cv=none; b=nuryHfFtr/cZmhVwZyW5QLW5+w63x7Oh/U48BbFGgC3Tyzi/d0SrMx5wL7MLnw7Z0gCLzZqqmnkVoy3sNilN/h91/7u7R5qjTnhxmehu+omRFIeK9xqp4ztM7sUZbJvGQNHxU/0xeJ/7e3t/UAZXXxkApiHe5oVj9JE2zoaXVMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424947; c=relaxed/simple;
	bh=YJiVc/A8oo7Y+esyalbRAf6ZSza2Px9jgfvyLJRRulY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i2AuqTzLfeJi4F+R+EO/XkhU2Yq4d9RHHfLbMa5uW3ayI7I259d3ftfWogqY3fx82Bc5EOFZpeFgn0S8Cm54Akyqrm18+A3n8H7pA/NEkNUNxcGKuM3OBbqOCzmgBiE6psZjrpNgqiQLWYGeifMeao2X/dNC8eQNzK0KHvj2FYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3EPHs7x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3EPHs7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585941F000E9;
	Sun, 14 Jun 2026 08:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781424946;
	bh=QRTPg0bFeG6+BjTcyS16YvgwayJFsYRD/RwJ5wRsRYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O3EPHs7xdxChJo4uvUCDlA2grQgM57JMvKP8aidnkAt4vkhonB/h/Ty8K/jB++jm1
	 /Ibu3ULMpl1PJxSBqC7jNfP2JumuzGtwobO5xjGxJmwuzNpFbG6QLhz4fBTYbPOTLi
	 fvoq+hTizAlkLK9q7UJJDuQRbbrjxONi5CFfxsyRLO/OnSXFp+LZkicq+p2OAtXGD0
	 a8ODDApI5wVlXRzZSr5i68KUSWhM0oIA8y71Nrgauf5mbsAAyA5Y4+sIAhMKC0Rmq8
	 w3wStnwFu/6NDDWUt4Oj9rjYHUoico/nnuoO3nEnh5rT40OrbVi1Z1hI2E+DgJfGYJ
	 l/iT9ljWP8fxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: monaco-pmics: Add ADC support
 for PMM8620AU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260614-adc5_gen3_dt-v2-3-32ec576c5865@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-3-32ec576c5865@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 08:15:45 +0000
Message-Id: <20260614081546.585941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The ADC interrupt handler `adc5_gen3_isr()` may dereference a NULL=
 pointer `adc->handler` if an interrupt fires before the thermal auxiliary =
driver has registered its event notifier.
--

commit 2afa9a558734cf9fc6ad1120da9026df8390137c
Author: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU
   =20
This commit adds ADC nodes for PMM8620AU PMIC instances on the Monaco
platform. It exposes the DIE_TEMP and VPH_PWR channels.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot=
/dts/qcom/monaco-pmics.dtsi
> index e990d7367719b..232bcb942b54c 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
[ ... ]
> @@ -20,6 +21,27 @@ pmm8620au_0_rtc: rtc@6100 {
>  			interrupts =3D <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
>  		};
> =20
> +		pmm8620au_0_adc: adc@8000 {
> +			compatible =3D "qcom,spmi-adc5-gen3";
> +			reg =3D <0x8000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			interrupts =3D <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;

[Severity: High]
This is a pre-existing issue, but by enabling the qcom,spmi-adc5-gen3
interrupts here, does this expose a NULL pointer dereference in the
ADC driver's interrupt handler?

In drivers/iio/adc/qcom-spmi-adc5-gen3.c:adc5_gen3_isr(), the handler
checks the device driver state rather than the function pointer:

		adev =3D adc->tm_aux;
		if (!adev || !adev->dev.driver) {
			dev_err(dev, "adc_tm auxiliary device not initialized\n");
			return IRQ_HANDLED;
		}

		adc->handler(adev);

If an interrupt fires after the driver core sets adev->dev.driver but
before the thermal driver calls adc5_gen3_register_tm_event_notifier()
to set adc->handler, will this result in a kernel panic by dereferencing
a NULL adc->handler?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614-adc5_gen3_=
dt-v2-0-32ec576c5865@oss.qualcomm.com?part=3D3
