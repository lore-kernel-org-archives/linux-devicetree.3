Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967071DB95E
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 06:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935066; cv=none; b=N1FMAvV+YDNth3uK6S8Gjd6VLI45T6R3YdJATS6mAo9/ON/S0UvrZaLEE3NEtq1chnSPgJAOFkQs2wb/kf7vVYzI8qlkNRT73Oai72IF3MQjfanxqvuUpZH660LCpakDMYSbmrSh4OQN7ZEgRqCAoCnAOjWs62AkAYId6n83T5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935066; c=relaxed/simple;
	bh=uLGW6pogrQ0eNUFVU5WpS6671DiReK1S5uVdWBfXAxI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WBCezaWjipblGb9+LrCAjfJVLRs+htfL5qNlp7/D0cD3U7e5toSSdQZfgAl++EHmUj2+uIUKcDG6WPtOovpbfZxWI68PrAMFkBrIYhlRnfC4BcffJjP4OlZIG75LOzKCbTPfJou5ynezGlA7AGaYo9YffsM51anHuMZ1e0NQq8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FalZJDGC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FalZJDGC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030121F00A3A;
	Wed,  9 Sep 2026 06:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788935065;
	bh=cHPwqSHpy0dzdxn20RPPo1AYnC14etEiAkf47cuXPNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FalZJDGCS8IUaKjlMApTYM5CEa+3QC3/Q37t/8sa9ro9J5Pe9Fu4O1b5JNj0N2Cpv
	 5ZGPGmNYPxKnYllWl2eISW+OG5cisFU5Ca4LOtiDqvfDCUjVNDbSjxz6nC9oUFyvhy
	 x+nMRaVquJVRwrvE7xwz1pK+lj3Z2XteppTew9AIJZpA/gpnEw+A7KKqhn7UQvf8hq
	 Nh2XDzE4FHRyXzKNsWXnCJSdNQaax5njvuu/PlEcTHU2C7RP4vWMHHu1gjkojzwRFu
	 sB9jNHLQ80xi81E0aMZ4R1S2QfBTk8AMaujiFfO1QwAVTZLxCR8MKNAngdLxkeuseR
	 rubmLpt5Z7zTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH PRELIMINARY 4/5] arm64: dts: qcom: shikra-cqs-evk:
 enable the first Ethernet port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908-shikra_ethernet_dts-v1-4-69c0c5c7c124@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-4-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 06:24:24 +0000
Message-Id: <20260909062425.030121F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Ethernet PHY remains permanently unpowered because the `vdda-2p5-s=
upply` property is ignored and the regulator defaults to off.
--

commit b5b6a106e748058add8ac1a40dcbd3ae6ad2a0d0
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

arm64: dts: qcom: shikra-cqs-evk: enable the first Ethernet port

This commit enables ethernet0 for the Shikra CQS EVK board with a DP83867
RGMII PHY. It also adds a fixed 2.5V regulator controlled by a GPIO to power
the PHY.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqs-evk.dts
> index e62ba5aef71ff..7b30c67c68e8c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -21,6 +21,42 @@ aliases {
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	rgmii_phy_supply: regulator-rgmii-phy {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "rgmii-phy-pwr";

[Severity: High]
Will this regulator ever be enabled by the core?=20

Since no consumer driver will explicitly request it (see below), and the no=
de=20
is missing the regulator-always-on property, it appears the regulator core=
=20
will leave it disabled at boot.

> +		regulator-min-microvolt =3D <2500000>;
> +		regulator-max-microvolt =3D <2500000>;
> +		gpio =3D <&tlmm 149 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 =3D <&rgmii_phy_pwr_default>;
> +		pinctrl-names =3D "default";
> +	};
> +};

[ ... ]

> +		rgmii_phy: ethernet-phy@7 {
> +			compatible =3D "ethernet-phy-id2000.a231";
> +			reg =3D <0x7>;
> +			reset-gpios =3D <&tlmm 135 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <50000>;
> +			vdda-2p5-supply =3D <&rgmii_phy_supply>;

[Severity: High]
Does the kernel actually use the vdda-2p5-supply property?=20

It seems this custom property is completely ignored because no driver,=20
including the DP83867 driver or the MDIO core, parses vdda-2p5-supply.=20
Without a driver acting as a consumer, the PHY will fail to power on.

It looks like this same pattern might also be replicated in patch 5/5 for=20
the second Ethernet port.

> +		};
> +	};
>  };

[ ... ]

> +&tlmm {
> +	rgmii_phy_pwr_default: rgmii-phy-pwr-default-state {
> +		pins =3D "gpio149";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +		output-low;

[Severity: High]
Is it intentional to drive the enable GPIO low here at boot?=20

The regulator is defined as active-high above, so this default pinctrl=20
state explicitly turns off the active-high regulator. Combined with the=20
ignored supply property, this would leave the Ethernet PHY permanently=20
unpowered and non-functional unconditionally at boot.

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-shikra_eth=
ernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com?part=3D4
