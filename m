Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436902;
	b=a5RX/LIjlgPvDPxVoUQAe34gdFbcr8OvSL+JysrRJunNw8s4ggcUFpyMONUAYegx91+m
	 Cfftxa5lxqk0jh7onMYnhorKxRQqiDvWIhAyCnrthYU5htWjkR7jMg02zI7HwSu5tcVMt
	 DQicq2bkkrFlRHDwg9K2GT3prmIacJH14imQRBkQ9r8VRxU8IWuyqwbB/TraCVXOPjDIp
	 C5a9/g7L+f7uxtBwGadRCWRCHxvgU1BjN8qj2EHaQFqT1wM8YG5Y1omWnQmWQuTcQ4Shh
	 wenLWsdCo/autOFCYRcuiY+XZqbbXlsaCXptghtS+MMo9ibr6PJ354/ji055DPWU/Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436902;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CBppjbShdK4vk8gjft3fkxyy+3WfG+VMJ9GA8AE9zh4=;
	b=DprOJ07Q4edB/X43rXlb5q+4WfjdPPv9BWNdklVYbqg2uudmsosFAgKriNx2np5FrtFV
	 bo7OzIOG1IrgCdJkjOG7t/PIQ4YNynlH3FZOoOGYQkml7m8R8eSalQRh5/xYJYOLfzjpC
	 vl2yMfQfXm2+KkPUYmFDHtwbr/TbpWgpu4+a8ImK6adKN23VXTJjJGAy8Z5n4Y91N7tZ7
	 +RMfa7JQknzEWU0bEWsYJgkawNh5+oP5WDSnb+7d6bU2d41O/LF6RT8wypg2ct1JPD59L
	 NNaSoIgMXqFLm+6t+U/PkqyLHlxN1AgYwQnehu8zRZ0dg+ZZEr/vsoVEP0PVCI32JoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ryfk6bUs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3778D606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ryfk6bUs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432F81F000C6;
	Mon, 23 Nov 2026 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436901;
	bh=CBppjbShdK4vk8gjft3fkxyy+3WfG+VMJ9GA8AE9zh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ryfk6bUsvM1U9Ev/g0UTN42UutBAOb/U6KVUzgMBO+bT+1BwqxhaZoM3PQhQjQK9z
	 BhmkoldRaqY4hSWqV1TBtpVJFk/lq30a66OY6g8wFK/wpCq84sJA9RcidUXJpEyJKg
	 47bxYxnsUn3PsEP6Fbl9y+uwFbbzi/8jqVU+cV2ozuNvHJtdSEzW92J8u573OsNkbk
	 apBmccjyW4Giy7vK4697xJF0Deal8TjiVLRVtvHCNGZobemJGjsAtSAxC410/wLvYj
	 ggGZjTKCSMbL3Rrug53rmfc3dTTXWijiTJmx3+qV6RYVNh3JFm2kjiudPNR3kw/IrT
	 fmpXvrOT9W5Rw==
Message-ID: <sashiko-outbox-229216@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C
 controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123121729.2418019-1-akash.kumar@oss.qualcomm.com>
References: <20261123121729.2418019-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:28:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: qcom: shikra: unmatched cypress,cypd6129/cypd6229
  compatibles
- [High] arm64: dts: qcom: shikra: unconsumed vbus_boost_5v disabled
  after boot
--

commit 3ae712ea5d9b843ce48bb12bea9832d0a56a64ed
Author: Akash Kumar <akakum@qti.qualcomm.com>

arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller support

This commit adds CYPD6129/CYPD6229 Type-C PD controller nodes and connector
endpoints on the Shikra CQM, CQS, and IQS EVK boards, and switches the
corresponding USB controllers to OTG mode.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqm-evk.dts
> index bde3b7d81acec..46835a44cfbbf 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts

[ ... ]

> @@ -29,6 +30,43 @@ &audiocorecc {
>  	status =3D "okay";
>  };
> =20
> +&i2c3 {
> +	status =3D "okay";
> +
> +	typec@40 {
> +		compatible =3D "cypress,cypd6129";
> +		reg =3D <0x40>;

[Severity: High]
Does any driver bind to typec@40 with "cypress,cypd6129" (or
"cypress,cypd6229" in shikra-iqs-evk.dts)?

ucsi_ccg_of_match_table in drivers/usb/typec/ucsi/ucsi_ccg.c only matches
"cypress,cypd4226", and ucsi_ccg_device_id only matches "ccgx-ucsi".
Without a matching driver entry, typec@40 never probes on CQM, CQS, or
IQS, leaving USB OTG role switching and SuperSpeed orientation switching
non-functional.

In addition, Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
only allows "cypress,cypd4226" at reg 0x08 and does not define
wakeup-source, so these nodes also fail dtbs_check.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-iqs-evk.dts
> index 5df30ad8211f8..4fde2ddb53931 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts

[ ... ]

> @@ -23,6 +24,84 @@ aliases {
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	vbus_boost_5v: regulator-vbus-boost-5v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vbus_boost_5v";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpio =3D <&tlmm 79 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +	};
> +};
> +
> +&i2c3 {
> +	status =3D "okay";
> +
> +	typec@40 {
> +		compatible =3D "cypress,cypd6229", "cypress,cypd6129";
> +		reg =3D <0x40>;
> +		interrupts-extended =3D <&tlmm 50 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 =3D <&usb0_intr_state>;
> +		pinctrl-names =3D "default";
> +		wakeup-source;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		connector@0 {
> +			compatible =3D "usb-c-connector";
> +			reg =3D <0>;
> +			label =3D "USB2-Type-C";
> +			data-role =3D "dual";
> +			power-role =3D "dual";
> +			vbus-supply =3D <&vbus_boost_5v>;

[Severity: High]
Will regulator_late_cleanup() turn off vbus_boost_5v 30 seconds after
boot?

Neither ucsi_ccg, ucsi_register_port(), nor the Type-C class parses or
enables vbus-supply on UCSI connector child nodes.  Because vbus_boost_5v
has no active consumer and omits regulator-always-on, its use_count stays
0 and regulator_late_cleanup() disables it, cutting off the shared 5V VBUS
boost rail for both Type-C ports.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123121729.2418=
019-1-akash.kumar@oss.qualcomm.com?part=3D1
