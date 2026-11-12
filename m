Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485302;
	b=Ja2zAV5gDEwURrLwolZzC5rbbI4sJaKxevsv3WicnXd+0orlEmsg9GE1KSjUMRbdIR+9
	 FDQa0r8Fhqg7C6sTbMKeJQDuRJ0YMDpcw5+gkk7r1/ixSrRtKdlF35lXhz+yiy7gCPmtk
	 R4dnWKfNRa9vWtcCQYRZSIKBAEoh+QuE81mAkPmlRIrVGH1gcOyuSDYxyjqaHgMEwr54m
	 qDiPadk7OWQaq3KswQDop+0c70jLIBcsCQ1f1fasrqZRFnZ0xST70kpiIznwGuHv1LGmS
	 0BxqEbZNogHnBK1dpf01W8EkXNUrDsyPA7BR+hq4JmfbMfhkGGodyZ5iG1qKKV6W8FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485302;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jAicgXvxfdMCzBj3bCKIt4iLm9F4iCik3SMVMHMI4dU=;
	b=rBShaFgJu7TzN0XbakXcU5hb8osD6EL/qoofpGPwlnbVVGdfnobRhgRrqck1wVNCDZKW
	 nxJzeoKBdJNhEvUA0pHWmCvwVev7R3SZ1D3uNlZFBursNgowmeSDKff2I+ab0O7Es4l4b
	 iod+aL9k/W8puL+MxpwCCIauP0HL8rylTVJ0LfG3WdSicaUWgp9PnG2OE3mfLKbH9CnVa
	 Dh5uWaIKvzje4M3c86MJMFBEQZOw/t/VUCC49RLZJ1tGIb6oL/+t0y2Zq7tNd0gzyoKmW
	 f5JMb1gJt/p08F3Fq8wYzhEiKfAcppa6Qnmccw5zTCblBUL0+WnB+B7UYHqPO9ibmtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fkTflfl4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A05606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fkTflfl4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C72F1F00A06;
	Thu, 12 Nov 2026 12:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794485302;
	bh=jAicgXvxfdMCzBj3bCKIt4iLm9F4iCik3SMVMHMI4dU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fkTflfl4u+R5jZnCpAo8Qc1xiessugbgCmcHpTh339s8aBR9OPCagEpS7BCRwZkTO
	 uq1GONzEY3C11a/RDWp/ceF1HB5eBgFaGGjfm4QIo+Gy7/ZkHG6lPCD1r/sIgFyFif
	 DNoolG2LwWQTZprla5rRfpDe6KW4anjB53VZlQBMzUvdSDbteDO2KvdgFb+UPjVR5e
	 VgnSTDPbXySHm9kLQZKEcyDjhelD4+qe6r8ixOIHwqbt9LIMu7cYs9drMzxykWX4WI
	 Xn041hbLWRkVTL9s6SQrG9PAcZa2n7rLYaedUd1dqwiNe97ZPnjGvcAogKnUW7HhEv
	 8PqRXXO5qoJag==
Message-ID: <sashiko-outbox-211070@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Fix missing wake-gpios
 in PCI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112120030.99510-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261112120030.99510-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261112120030.99510-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 12:08:21 +0000
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
- [Medium] arm64: dts: qcom: sm8150: pcie1 wake-gpios uses
  GPIO_ACTIVE_HIGH polarity
--

commit 809c46a66ec46c6ef99060dec4a500e026dc122f
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

arm64: dts: qcom: sm8150: Fix missing wake-gpios in PCI

This commit replaces the unused enable-gpio property on pcie1 with a
wake-gpios property in its pcie@0 root port node.

> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index b9846b424a938..d667e38914519 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -2028,8 +2028,6 @@ pcie1: pcie@1c08000 {
> =20
>  			power-domains =3D <&gcc PCIE_1_GDSC>;
> =20
> -			enable-gpio =3D <&tlmm 104 GPIO_ACTIVE_HIGH>;
> -
>  			pinctrl-names =3D "default";
>  			pinctrl-0 =3D <&pcie1_default_state>;
> =20
> @@ -2042,6 +2040,7 @@ pcie@0 {
> =20
>  				phys =3D <&pcie1_phy>;
>  				reset-gpios =3D <&tlmm 102 GPIO_ACTIVE_HIGH>;
> +				wake-gpios =3D <&tlmm 104 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Should wake-gpios use GPIO_ACTIVE_LOW here, matching pcie0 after commit
463d931d6a66 ("arm64: dts: qcom: sm8150: Fix PCIe WAKE# GPIO polarity")?

PCIe WAKE# is active-low and pcie1_default_state configures gpio104 with
bias-pull-up.  With GPIO_ACTIVE_HIGH, pci_configure_wake_irq() requests the
wake interrupt as IRQ_TYPE_LEVEL_HIGH, which triggers immediately while the
pulled-up WAKE# line is idle during suspend.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112120030.9951=
0-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D2
