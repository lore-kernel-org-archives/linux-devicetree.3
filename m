Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911625;
	b=aF+N0AVDaUOKVr/laYSBmOgjbr1qVhwvFZh0ZR8hV6OZBtxLC131GojMan++JKuST6cn
	 vYu42CZVZkkiUuOqlRtN1oKZMFkNlm59QOuF9WWrEtIYgwwlzNs0adRL69R0JQHP6xlob
	 Fh7AL3hK9FLiTbhtZz6EEqvTzYQZSYsSeQoB8XHuuHOedt5IkpVPhAf48wd/bApa7AX1h
	 tZd54/Nz2Pxztp+p/hIy7qaeQz+EA0PmJpSsfWj0QmP/ZAonQcKOR0ip36mN2rITYU4gf
	 hUxvz+GmL9UoVqqP23CSf9cmhEcBTXuKTCa0sLAcMyBrFGHxpxEwim5unrb4FFa9Rcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911625;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iwSvkRkpOWBGW83akrluHEHwbKajB2SPuhhgAy7lKS4=;
	b=LwLAMugKOyzUenfC7rb+rBW6GhnvqweT5nRNLuLZRm6J/ujxCHND6wVF3NXxroCWsY8H
	 iGy5H4NK6aw6hu0HMOmFzFIpxGoN65cbTgevF6VoTkw59D6CrTE+sRpdzCqTizsBhgHVd
	 T3oGgZ8D72cwn1irOIV6D+zqLxFckqmuNahNIdvOCEAPKvWDUvTqmAmc2z1NCNrz7OLD/
	 tk7NIqoye91XW91EFORcaZIZln/SIgrFecCNV1MlMpHpQzfnfon2KmYJgy/zQWiAUzhkv
	 P7MwZjfoCvHducvI2hzRLw/kArJf66o7KTeQu5Dt3o6nFr2JMpcRBWCz24wtwu6r9BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=giNRF5hd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0462D606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=giNRF5hd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5451F0089F;
	Thu,  5 Nov 2026 20:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793911624;
	bh=iwSvkRkpOWBGW83akrluHEHwbKajB2SPuhhgAy7lKS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=giNRF5hdOlfUKZoMn89w0g+ovzxvBC7sm4VXwW3l6X4uUaiiXrSHAJRbsaFe5tjgk
	 hja0QnOeNDM/7ZShjz7C2/daLBuLXG4/JPr8vZYsiCpd9gzxca4+nn9zHeoo/1FnK7
	 6iR5admW5tNOSofCppH1NFSQOMDpbnOGj4Zbmv1KFzyViNvyUKh0sKGEhpmIU/r2z8
	 fY2s4Rd5S6LYcndJgkw20u+UxfVxibHUf1Gpg3TNnBi4+Vw5skNGpjpX1VsK9bCBpU
	 Y5Cqc3PfOKP6+AoIrGSUwBHr5n3qnQUXKONLIshWDRmejFrlJbE+C37npO062MDRNk
	 IIAF3FgrWFJCw==
Message-ID: <sashiko-outbox-200133@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4 2/3] arm64: dts: qcom: Add
 sm8250-oneplus-common.dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Hannenheim" <git@fhannenheim.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-kebab_dts-v4-2-c6bbe6ded92e@fhannenheim.net>
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-2-c6bbe6ded92e@fhannenheim.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 20:47:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: duplicate KEY_VOLUMEDOWN on gpio-keys and pon_=
resin
- [Low] arm64: dts: qcom: unused vreg_s6c_0p88 regulator in sm8250-oneplus-=
common
--

commit 564ff98ec1e681e7bcc2a9e910efbd58280623b5
Author: Frieder Hannenheim <git@fhannenheim.net>

arm64: dts: qcom: Add sm8250-oneplus-common.dtsi

This commit adds the common device tree include for OnePlus devices
based on the Qualcomm SM8250 SoC.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sm8250-oneplus-common.dtsi
> new file mode 100644
> index 0000000000000..6d7793c792f05
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi

[ ... ]

> +	vreg_s6c_0p88: smpc6-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vreg_s6c_0p88";
> +		regulator-min-microvolt =3D <880000>;
> +		regulator-max-microvolt =3D <880000>;
> +		regulator-always-on;
> +		vin-supply =3D <&vph_pwr>;
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible =3D "qcom,pm8150-rpmh-regulators";
> +		qcom,pmic-id =3D "a";
> +		vdd-s1-supply =3D <&vph_pwr>;
> +		vdd-s2-supply =3D <&vph_pwr>;
> +		vdd-s3-supply =3D <&vph_pwr>;
> +		vdd-s4-supply =3D <&vph_pwr>;
> +		vdd-s5-supply =3D <&vph_pwr>;
> +		vdd-s6-supply =3D <&vph_pwr>;
> +		vdd-s7-supply =3D <&vph_pwr>;
> +		vdd-s8-supply =3D <&vph_pwr>;
> +		vdd-s9-supply =3D <&vph_pwr>;
> +		vdd-s10-supply =3D <&vph_pwr>;
> +		vdd-l2-l10-supply =3D <&vreg_bob>;
> +		vdd-l3-l4-l5-l18-supply =3D <&vreg_s6a_0p95>;

[Severity: Low]
Is vreg_s6c_0p88 intended to be connected to regulators-0 via
vdd-l1-l8-l11-supply =3D <&vreg_s6c_0p88>, or can smpc6-regulator be droppe=
d?

Right now vreg_s6c_0p88 is defined in the root node, but nothing in
sm8250-oneplus-common.dtsi or sm8250-oneplus-kebab.dts references it.

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
As reported by Sashiko on v3 [1], why is KEY_VOLUMEDOWN defined in both
gpio_keys (on pm8150_gpios 7) and pon_resin?

In gpio_keys, key-vol-down configures pm8150_gpios 7 with KEY_VOLUMEDOWN:

	gpio_keys: gpio-keys {
		...
		pinctrl-0 =3D <&vol_down_l &vol_up_n>;
		pinctrl-names =3D "default";

		key-vol-down {
			label =3D "Volume Down";
			linux,code =3D <KEY_VOLUMEDOWN>;
			gpios =3D <&pm8150_gpios 7 GPIO_ACTIVE_LOW>;
			debounce-interval =3D <15>;
			linux,can-disable;
			wakeup-source;
		};

At the same time, pon_resin is enabled with KEY_VOLUMEDOWN. On SM8250 with
PM8150, Volume Down is normally routed to PON RESIN_N, and
Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml along with
drivers/pinctrl/qcom/pinctrl-spmi-gpio.c list gpio7 as a pin hole on
qcom,pm8150-gpio.

Should key-vol-down and vol_down_l be removed so that Volume Down is only
handled by pon_resin?

[1] https://lore.kernel.org/r/20261017-kebab_dts-v3-2-5fc3ca52a383@fhannenh=
eim.net

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-kebab_dts-=
v4-0-c6bbe6ded92e@fhannenheim.net?part=3D2
