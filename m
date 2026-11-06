Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793936474;
	b=rCMRSK9INn/bl3FFzHl47AqUluTh9wjUSCUfUDhX6lAuIqUSSvujZX973xNFmiJL44fA
	 Ti4R77M7Y+qPQ1ZXrKzQPPLjhwE7nDNBlEuj0OL816aFvijj71Mq6xmWAW/oD+y0qJbCH
	 U1/zBaskwoG5Zi5auWrM1YAMPvMxkn+NIwqZeh9UaMdjtOR5fxLNzfaPTNPDFZR/wHdSE
	 Sv90Zz/0dj2U6m1RWWJ7iNz2m76WtYDTo8Pd+w+FX7/XoJSuTVa23pO0XPvjnfb7MjVtO
	 RyA7SrOwYiptiR92yU+Zj+ylS5D/e6sJ2v29mDJZhehlUdGwGmH4QVQewx59AfhIKOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793936474;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8MABe69qeLx4KL+iHoLgp3OzXx5gauXqsbF5hTe3cdw=;
	b=UtxJEYhBnvEAmPB2WLXDqe0AVIjr+w3MITkKj2/f0EjulKPYGfc0u17HpyQN9oZJvQMJ
	 6CyerGMYXhRhsbayD3BVG6sniUXuVUag4ahyOdFQKYkYZkHbPMZrX47j9c3Dzbdo04YJ9
	 /ZwgO+lnNg2f3WUn4Cok5kCxf06zDnZYLMkItF0sJTKznfmajBXsxnsZ4dTqh7LOwCg6i
	 wrGKsipNPRaqVhVx97JvpezANx233r56htwB0u3gSbClkOF0vckldnSFVJxlC3J7Uj9WN
	 q9PnF9bP1fl8JSKuQsijuXtAheL9IzvsN1S6RuIQQtCOL5v6PCkTNyEvIpyTkVrpEOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RL6yj0Ik;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFB9606A31B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RL6yj0Ik
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BF61F008A1;
	Fri,  6 Nov 2026 03:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793936473;
	bh=8MABe69qeLx4KL+iHoLgp3OzXx5gauXqsbF5hTe3cdw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RL6yj0IkGxf+eTimXbB+bQ8muOrLyR0CguV2pN1wEDJyI/N3bha5nPkZv3mum15ui
	 szfIVTcz48IkaSqPLDfwbJzlS9HSv9ljykxQdJRRrPCCZT2IWFTWUcFjFnvMb6NeJW
	 sw8x7iQw8r6b1zcG7FZ6wmyF2josRDw/lsaScx1sEY682Dk6uV7fZUdvBjqU6jsNWL
	 c18r0S/z3P4V55ICQKnC4BnhXfumUiJnYom7or9G3XF71wgzVjbqoDKFXqcd1sApoY
	 w6vHogSk+F1zTF3HNsysni0tOb03kgKHWUneoGijjvyKSOAGhJi6VJquuBGq09fC4K
	 QGObxusawsz9g==
Message-ID: <sashiko-outbox-200659@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm8150: Add CAMSS and CCI
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gigena" <mail@andrewgigena.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-5-39ee37787b00@andrewgigena.dev>
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-5-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 03:41:12 +0000
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
- [Low] arm64: dts: qcom: sm8150: inverted CLK/DATA comments in CCI pinctrl=
 nodes
--

commit 338e8b9406e2ae8eb1e75907ca56f8da311da07c
Author: Andrew Gigena <mail@andrewgigena.dev>

arm64: dts: qcom: sm8150: Add CAMSS and CCI nodes

This commit adds the CAMSS and CCI controller nodes to the SM8150 SoC
devicetree, along with the corresponding TLMM pinctrl states for the CCI0
and CCI1 I2C buses.

> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 293fcbacff346..a1fd3a4ed2e5e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -2736,6 +2736,86 @@ wake-pins {
>  					bias-pull-up;
>  				};
>  			};
> +
> +			cci0_default: cci0-default-state {
> +				cci0_i2c0_default: cci0-i2c0-default-pins {
> +					/* CLK, DATA */
> +					pins =3D "gpio17", "gpio18";
> +					function =3D "cci_i2c";
> +
> +					bias-pull-up;
> +					drive-strength =3D <2>; /* 2 mA */
> +				};
> +
> +				cci0_i2c1_default: cci0-i2c1-default-pins {
> +					/* CLK, DATA */
> +					pins =3D "gpio19", "gpio20";
> +					function =3D "cci_i2c";
> +
> +					bias-pull-up;
> +					drive-strength =3D <2>; /* 2 mA */
> +				};
> +			};
> +
> +			cci0_sleep: cci0-sleep-state {
> +				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
> +					/* CLK, DATA */
> +					pins =3D "gpio17", "gpio18";
> +					function =3D "cci_i2c";
> +
> +					drive-strength =3D <2>; /* 2 mA */
> +					bias-pull-down;
> +				};
> +
> +				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
> +					/* CLK, DATA */
> +					pins =3D "gpio19", "gpio20";
> +					function =3D "cci_i2c";
> +
> +					drive-strength =3D <2>; /* 2 mA */
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_default: cci1-default-state {
> +				cci1_i2c0_default: cci1-i2c0-default-pins {
> +					/* CLK, DATA */
> +					pins =3D "gpio31", "gpio32";
> +					function =3D "cci_i2c";
> +
> +					bias-pull-up;
> +					drive-strength =3D <2>; /* 2 mA */
> +				};
> +
> +				cci1_i2c1_default: cci1-i2c1-default-pins {
> +					/* CLK, DATA */
> +					pins =3D "gpio33", "gpio34";
> +					function =3D "cci_i2c";
> +
> +					bias-pull-up;
> +					drive-strength =3D <2>; /* 2 mA */
> +				};
> +			};
> +
> +			cci1_sleep: cci1-sleep-state {
> +				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
> +					/* CLK, DATA */
> +					pins =3D "gpio31", "gpio32";
> +					function =3D "cci_i2c";
> +
> +					bias-pull-down;
> +					drive-strength =3D <2>; /* 2 mA */
> +				};
> +
> +				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
> +					/* CLK, DATA */
> +					pins =3D "gpio33", "gpio34";
> +					function =3D "cci_i2c";
> +
> +					bias-pull-down;
> +					drive-strength =3D <2>; /* 2 mA */
> +				};
> +			};

[Severity: Low]
Are the /* CLK, DATA */ comments inverted across the cci0_default,
cci0_sleep, cci1_default, and cci1_sleep pinctrl subnodes?

Looking at the TLMM GPIO line names in
arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi:

    &tlmm {
        gpio-line-names =3D
            ...
            "CCI_I2C_SDA0",
            "CCI_I2C_SCL0",
            "CCI_I2C_SDA1",
            "CCI_I2C_SCL1", /* GPIO_20 */
            ...
            "CCI_I2C_SDA2",
            "CCI_I2C_SCL2",
            "CCI_I2C_SDA3",
            "CCI_I2C_SCL3",
            ...

gpio17, gpio19, gpio31, and gpio33 are the SDA (DATA) lines, while gpio18,
gpio20, gpio32, and gpio34 are the SCL (CLK) lines. Should these comments
say /* SDA, SCL */ or /* DATA, CLK */ instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-sm8150-v7.=
4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev?part=3D5
