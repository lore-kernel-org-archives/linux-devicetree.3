Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A6F2D3A75
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154911; cv=none; b=go5GYLgMk0ZgJmhb9s+LfohbCvKXAkzUNEtNpFYxlTz5y/Ht8FooKATPvRLpBjmrOdmDhjHclfXhNkYTV1xkepudmIimTYdIDrr8PuDjHG4k+S4TXdqHIAk3D/7dgbi1VY2GLHZ1tTcI8EIB6wVSBkj2j9nd5ik5WiOJniAHEz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154911; c=relaxed/simple;
	bh=qR0781TLMnaf2zPa+zKiQIhiuxtvR6b8tuuQSTUj9dw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gaod7gflQTfoKbaRsjBceIo7mOfbNQoscYHM7mbHBhm8jzhrzFYSAaJj3vyCT+aDOm3kIaAYzbuKZKfh8++S0CzZvA06Si7kGZEXd3RpEp4CG7CWwpyfxDgZ63dgGChAD2CeCqzVpXmxv/blLwVfus6rQ2rEDtEGszWADppNMX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDRl7gP6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDRl7gP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D35E1F00893;
	Thu, 11 Jun 2026 05:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781154908;
	bh=vS/HLrPrqUD5L0/qVLKHhriL59swQgz63GW2cDGXLCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HDRl7gP6YrlddTwOw5k3pjbXrCeiRvlKsUfzMZBqt4kH1/dbf3gGPU7W1l4/XxsYV
	 Mq5adtDny0OZkXA6YjU0bZ8Yqm9nh159i1WECtKcwiQNdIkx9NmVxAyxYAIHUgZwSg
	 kG0qhtD3fMLIXBv9IaT4hIYKD2uNKwqZuLeFGhFxaf0i/BcFdd2xe0X1GU6ukGl7hU
	 6OUccnFx0WogyKfEyBoUDltr83e3AAoOkZc5FvSQ+l78cQLDaIB2RaH6xvHuyh0gmf
	 1cxWCLCBHZmSbeVL0N/ilOBuf8eU+hXAM0f2LtE1HghZOb4XjNhXpnelpMU4Uiy5V/
	 qbeJH6gJaLE1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 22/37] arm64: dts: qcom: qcs8550: Move PCIe GPIOs to
 root port node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-wake-v2-22-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-22-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:15:08 +0000
Message-Id: <20260611051508.8D35E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit introduces a build failure by referencing an undefined D=
evice Tree label `&pcie1_port0`.
--

commit 9033bf5c4daddefb447ddf13a1046f9e3fb9d91c
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: qcs8550: Move PCIe GPIOs to root port node

The commit moves PCIe GPIO properties from the Root Complex controller node
to the respective root port nodes in the qcs8550-aim300 device tree. It
also renames the perst-gpios property to reset-gpios to match the bindings
for the root port context.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/bo=
ot/dts/qcom/qcs8550-aim300.dtsi
> index 5eb4626c61290..579b0a4f34ebc 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
[ ... ]
>  &pcie1 {
> -	perst-gpios =3D <&tlmm 97 GPIO_ACTIVE_LOW>;
> -	wake-gpios =3D <&tlmm 99 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 =3D <&pcie1_default_state>;
>  	pinctrl-names =3D "default";
>  };
> =20
> +&pcie1_port0 {

[Severity: Low]
Will this cause a build failure during dtc compilation?

The &pcie1_port0 label does not appear to be defined in sm8550.dtsi or any
included file at this point in the git history.

While this is fixed later in the patch series by commit
0b50a2794d4f364375fa966171b8c7483fa1b1b6 ("arm64: dts: qcom: sm8550: Move
PCIe phy and GPIOs to root port node"), does ordering the board patch before
the base SoC dtsi patch break kernel bisectability?

> +	reset-gpios =3D <&tlmm 97 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 99 GPIO_ACTIVE_LOW>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-wake-v2-0-=
2744251b1181@oss.qualcomm.com?part=3D22
