Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFD91DF73A
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370972; cv=none; b=QDgoQnRUW2TviomJQ46+vRFfdzh/9Ya5Oj884KDU2ryHUZDIKbja/PpK+F4EEsO/hc7OtjZy1hQ7LsaIEvnerRUE/i/Mhat/YkIVeu10HQzwVYg/J2em6Uy+gmzDl8LfCRKuJFG+ud/BvUm82oKGv5kS4P5N+r702sfHVe5IIs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370972; c=relaxed/simple;
	bh=owqCG5FSUHJ5bUQD6QLYvQKy0dtQBdh+JA8YXBDKuc8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QrImNTkOKmVjla346F4yjE2LlmJT7jLb416T+W4cQABUFWKy9e7Vkm4J+XhmVbEUMCdUNUafZv7wWSUuagZV2zVOTGx1e3PYJ5EVj0cdCUarv5YiM3QowQaFf49rwdbqSUOvKo3a8MQKaWFTsgHmhpDZx8tZ2RnYb+Qu74qtF8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9OAiJPY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9OAiJPY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137A21F000E9;
	Thu, 21 May 2026 13:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779370970;
	bh=124QBCQN+qcyWvzju+2fg/oCI6fgJppRP9F1NsepgLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F9OAiJPYBovzKqLTV7xH6FZ8My4Ap4h7yclQQyhALlRXEiSw9KiBHbNx9O0DwPnT+
	 iZWTwvzlb+0tv90/VkzKozHKQIOLhzE6xmtM0elpzdW9iNNkJdvIgyBJtsyO77D9hG
	 PQELHzExQAJS/UZrBOln49e7QIVlqXaXtjwOACATFR3C+irs2F44goH0vFY3zdBBrq
	 FoCdDKFlD73egJLVsmHJUo37x6kC+TOtdLh4Xgwr0P2w3KkMrMXbg5JciezoJ3wH6w
	 KC7TgPiTyc/XOjd8wVHJwMQpjwFJoxAsNCwVYi0AhDDESN9uubWRQ0b7oTTATupZsN
	 bTf8iqQR2nNkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/18] arm64: dts: qcom: sm8150: Fix PCIe wake GPIO
 polarity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-wake-v1-5-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-5-d822567be258@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:42:49 +0000
Message-Id: <20260521134250.137A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The dt-binding examples for Qualcomm PCIe controllers are not updat=
ed to reflect the `wake-gpios` polarity change.
--

commit ceea67812f2db3dd214265d1322e7b8e9c36e293
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sm8150: Fix PCIe wake GPIO polarity

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 0e101096209ab..8da494de4308a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -1905,7 +1905,7 @@ pcie0: pcie@1c00000 {
>  			phy-names =3D "pciephy";
> =20
>  			perst-gpios =3D <&tlmm 35 GPIO_ACTIVE_HIGH>;
> -			wake-gpios =3D <&tlmm 37 GPIO_ACTIVE_HIGH>;
> +			wake-gpios =3D <&tlmm 37 GPIO_ACTIVE_LOW>;

[Severity: Low]
Should the dt-binding example for this controller be updated to reflect the
polarity change?

The example in Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml
still instructs developers to use GPIO_ACTIVE_HIGH for wake-gpios. Leaving
the documentation with the old polarity risks propagating the incorrect
configuration to new board designs.

> =20
>  			pinctrl-names =3D "default";
>  			pinctrl-0 =3D <&pcie0_default_state>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-wake-v1-0-=
d822567be258@oss.qualcomm.com?part=3D5
