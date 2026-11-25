Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608370;
	b=gm0HIGwVYRNKhOTQ2hK24Mgqk7cOzRMj+mp5HjgKsU5ZyP80tJJftINApaEonCv103bc
	 o8yezOhZUinfkIevNP7VDnDpDsUh9qOQH+ZKJ/a97Igm3K2YfwyCuGyxv8+ki41TFGxOr
	 PYGZeeMGE7QBfZD2dDfhz9F/fGEFAcRqqDN7gzkQxg9ogdiJbvI3xVQqEeKF5fDOfsNHA
	 dYQlb2Ei7Bf9nclTIhMNNZu89NgJhpA3Rzstzc+jNP2z2a8DyR9Gb7czm/igUYTbA7Wzs
	 1tq3qkXZ4dP+Euf/nGBb4TdIG/KsLJcELTaUHlrsR0NplUG++5nVK8bMBUsorinh9Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608370;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AlZZrejknUQ9vQGGDTMLz/Mj94MGhDhDB4qy1KpVvW0=;
	b=umJIkeQxivuqklrF+eMyc6dzkFNQvQu7iHTKA/OUlxmYwEOnrMt8flZa+dy4H4/RPZ4B
	 VewH/JA0ZaV+K917z0Kp0Ti9D+HJiLlyNIQBCLoqTBfX6SqqpoXIaAy6lCaD3cglYXhP6
	 yGBZAEXFhYan69rv7TpW/7GDyKYlflpkb1lLO/X5VtoEllBR/YJBTUYARLbFSMOpKlqYc
	 F1R/zukFs52tqO5N5axfPuMNZtLJG93Zq6WxPvtqZwpC0iPG8o2bltNGUk0VGxVkmVhkf
	 dAvtmMNYiP7EVwAcYtrWoC0NCk2BC5cPrJtEhKu5Dt6K2XqqOrLgZLp/YiWywsnS+AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d41izLrj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79981606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d41izLrj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C7E1F000CF;
	Wed, 25 Nov 2026 12:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608369;
	bh=AlZZrejknUQ9vQGGDTMLz/Mj94MGhDhDB4qy1KpVvW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d41izLrjGv5wvKT9xZe86J33z6bqpIwG0JTb0QQ6KGF0lXxUTYePkZhwnmpKjJu6z
	 q69b+9Mld3LuX7Ljoyp0UMdNanwYwf9Sjkbl8y8gIEqzv2DGn0E0VY+D5nbLUtzv6r
	 Be/rSPkgaqp4igt+Wjau9XPszeYGS3x8K/7l9KbIkvXKs2SXNDxcepzzVYERPbY4Wu
	 NTukFbqXNYx0mlt6pIkd2GVlZ6MphGHVqQpj8qeiNOlTEDWP7QEcDIEDF2BN4mtHXQ
	 iphWGw8Cw2l7adn8Ez9om89n6kEn7t8Wed0faVJPvVZGKWnoWYR+OeSRUDfKraye49
	 sM4IhX1BR9tMw==
Message-ID: <sashiko-outbox-233334@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650-valve-deckard: add Type-C
 connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-topic-sm8650-deckard-tcpm-v1-3-4af33e89ea9e@linaro.org>
References: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
 <20261125-topic-sm8650-deckard-tcpm-v1-3-4af33e89ea9e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:06:08 +0000
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
- [High] arm64: dts: qcom: pm8550b_vbus has no matching driver causing
  -EPROBE_DEFER
--

commit cad759f37d6629d6eaf0802cb58c4ae38ebac1a3
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650-valve-deckard: add Type-C connector

This commit enables the PM8550B Type-C controller, VBUS regulator, and
USB-C connector node tied to the usb_1 controller on the Valve Deckard
board.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm=
64/boot/dts/qcom/sm8650-valve-deckard.dts
> index 74bc0728ae7d7..0e68c5a6414c5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
[ ... ]
> @@ -1122,6 +1123,46 @@ &pm8550b_temp_alarm {
>  	io-channel-names =3D "thermal";
>  };
> =20
> +&pm8550b_typec {
> +	vdd-pdphy-supply =3D <&vreg_l5b_3p1>;
> +
> +	status =3D "okay";
> +
> +	connector {
> +		compatible =3D "usb-c-connector";
> +
> +		power-role =3D "dual";
> +		data-role =3D "dual";
> +		try-power-role =3D "sink";
> +		self-powered;
> +
> +		vbus-supply =3D <&pm8550b_vbus>;
> +
> +		source-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
> +					 PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
> +		sink-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
> +				       PDO_FIXED_DATA_SWAP | PDO_FIXED_USB_COMM)>;
> +		op-sink-microwatt =3D <15000000>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				pmic_typec_hs_in: endpoint {
> +					remote-endpoint =3D <&usb_1_dwc3_hs>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pm8550b_vbus {
> +	status =3D "okay";
> +};

[Severity: High]
Will pm8550b_typec defer probe indefinitely when resolving vbus-supply =3D
<&pm8550b_vbus>?

In arch/arm64/boot/dts/qcom/pm8550b.dtsi, pm8550b_vbus is defined with
compatible =3D "qcom,pm8550b-vbus-reg" and no fallback compatible, while
qcom_usb_vbus_regulator_match[] in
drivers/regulator/qcom_usb_vbus-regulator.c only matches
"qcom,pm8150b-vbus-reg" and "qcom,pm4125-vbus-reg".  Because no driver
registers a regulator for pm8550b_vbus, devm_of_regulator_get_optional()
in qcom_pmic_typec_port_probe() returns ERR_PTR(-EPROBE_DEFER),
preventing the Type-C port controller and USB role switch from probing.

In addition, "qcom,pm8550b-vbus-reg" and "qcom,pm8550b-typec" are not
documented in
Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
or Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-topic-sm86=
50-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org?part=3D3
