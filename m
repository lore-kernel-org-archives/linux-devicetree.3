Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC4C3803DC
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792250791; cv=none; b=aWFCvglIH3WmMQWx+GP04+hqvnvEkxd16PK1tHxnrVh54NDImgXQXlkmJbhjEHVgnVLZGNgJ2YpWiV7E2QLBCVzktKU/WcQtPsMDr8W4NP7itNpel/UpiX3mFZrlPfnwljSdSfLPSS6Db2CK0Xumj4LLI1i7adEq00zi07NMNgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792250791; c=relaxed/simple;
	bh=hJVodDmlbBkg2bxojpgn5BB4oHlMuP2WAOrlR01/DXA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=r1wWsQWMXHPOLy70uSeuhDe3dxrTRTcMRJ6zrw4taNKSNBLJlgGo+G78w6V2J5kPCY96IZuIERCO0jEK3U7P2T7QjfI4G2sqFAYstw/OQF+8mYCs8FyTuhpMnEjlzsDpTI0r8431289bygLcmp+RwkQPJhLvVwIfOpZGsy8djxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lm1PyNvi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lm1PyNvi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F551F000C4;
	Sat, 17 Oct 2026 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792250790;
	bh=FHqWeqWhG/qbaWsDAh8iKz48uTFEkbDn1oz0iRgHgs4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lm1PyNviauSRIlFUesR8RdX6v4LwzeO0cX6d/WLyNdokel1oigSt5wfvikxsQISLQ
	 zZIpG0mRNCClIuEISDzi3bhATCqMAiJum5fXBdy+NI4fQ3nUZhHUIKjlN8L6dHLomM
	 UlOmb1cGRIi/l2KwG/gMZvA8OKpgKYxzq4GL/LKmiBi35Cr2Yzf3uE6l0xtdRyQAk9
	 r5FxkaIk34p5QaXWPjX7Xh4RK3J2nxvlI0srFbRiqbo14FYB+98jtB7G39KOxX2cgC
	 MZm6U/53xssEWieivOyNzXDSo3pspls3z6p6MUvRt9euaU7Cxt+aVgLj0tFdr2fGtV
	 zaP5gaRTw4pjg==
Message-ID: <sashiko-outbox-175583@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Hannenheim" <git@fhannenheim.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017-kebab_dts-v3-2-5fc3ca52a383@fhannenheim.net>
References: <20261017-kebab_dts-v3-0-5fc3ca52a383@fhannenheim.net>
 <20261017-kebab_dts-v3-2-5fc3ca52a383@fhannenheim.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 15:26:29 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: duplicate KEY_VOLUMEDOWN on gpio-keys and pon_=
resin
--

commit 7ef24e1b9b48012e8e7fa23614b055d4480b386c
Author: Frieder Hannenheim <git@fhannenheim.net>

arm64: dts: qcom: Add sm8250-oneplus-common.dtsi

This commit adds a common device tree include file for OnePlus devices
based on the Qualcomm SM8250 SoC, defining shared reserved memory
regions, regulators, PMIC GPIOs, PON keys, and UFS configuration.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sm8250-oneplus-common.dtsi
> new file mode 100644
> index 0000000000000..6d7793c792f05
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi
> @@ -0,0 +1,607 @@

[ ... ]

> +	gpio_keys: gpio-keys {
> +		compatible =3D "gpio-keys";
> +		label =3D "Volume keys";
> +
> +		pinctrl-0 =3D <&vol_down_l &vol_up_n>;
> +		pinctrl-names =3D "default";
> +
> +		key-vol-down {
> +			label =3D "Volume Down";
> +			linux,code =3D <KEY_VOLUMEDOWN>;
> +			gpios =3D <&pm8150_gpios 7 GPIO_ACTIVE_LOW>;
> +			debounce-interval =3D <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +
> +		key-vol-up {
> +			label =3D "Volume Up";
> +			gpios =3D <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_VOLUMEUP>;
> +			debounce-interval =3D <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};

[ ... ]

> +&pm8150_gpios {
> +	vol_up_n: vol-up-n-state {
> +		pins =3D "gpio6";
> +		function =3D "normal";
> +		power-source =3D <1>;
> +		input-enable;
> +		bias-pull-up;
> +	};
> +
> +	vol_down_l: vol-down-l-state {
> +		pins =3D "gpio7";
> +		function =3D "normal";
> +		power-source =3D <1>;
> +		input-enable;
> +		bias-pull-up;
> +	};
> +};
> +
> +&pon {
> +	mode-bootloader =3D <0x2>;
> +	mode-recovery =3D <0x1>;
> +};
> +
> +&pon_pwrkey {
> +	status =3D "okay";
> +};
> +
> +&pon_resin {
> +	linux,code =3D <KEY_VOLUMEDOWN>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Should KEY_VOLUMEDOWN be registered in both gpio_keys (via key-vol-down
on pm8150_gpios 7) and pon_resin?

With both nodes enabled, both the gpio-keys driver and the pm8941-pwrkey
driver probe and register active wakeup-capable input devices for
KEY_VOLUMEDOWN. Depending on how the physical button is wired on these
boards, wouldn't this either emit duplicate KEY_VOLUMEDOWN events across
two separate input devices on every button press, or leave one of the two
input drivers monitoring an unconnected or wrong PMIC pin?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-kebab_dts-=
v3-0-5fc3ca52a383@fhannenheim.net?part=3D2
