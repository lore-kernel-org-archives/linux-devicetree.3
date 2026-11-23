Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437639;
	b=YSUBIxbyxBhSYORWtl7gTR7YdJUQ9q11z4JobGHKk+MW3bZx9KhdfFtpgNFrgAVk5fs3
	 ElgvnzUuRVvYiKvjGDARzZiKTv0Z21RG/ps3p9gW7q9KyT1XxE+tfArodPP/uxzFW2wqR
	 zHUsXZe3F6ymwtcXxq4hAUdRblC8KDtZdzkHmH9fEwZ83+QiFOW6lx4zIS/sZe7NfleRu
	 HPxLmleUskSIupHwezOoRKmcWkInz5V3UCLK4mjLZhEkfYgWLFeTekfnQv0hdOjTY4FqB
	 veGyAwyFoshROoukof3X/nx4cHD+RvgrJa58H82LAKJQhgJnA/d+7aT6aXj81CHSt6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437639;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=15SCLMNLiaDyKp/ZD7yxGdEOJ9mX1irBvjua/Xr15qY=;
	b=xRF6UbotK3XivFAGYiph3MtLys0rQzXJQ1nYoOR5vdXUe+SNuclA6d3zxelEg0jNWUPx
	 SQA74FXtaaQLr9WUX6U5Zu/G5COmx32G1pjw6uHbFY+7en5zTipwcecaGCdRp8Huwv2Dy
	 PewPoDTy+c5ne5DTIHMdDn8HY9QwlVxVV3BUr80bXNBtYD6i7shyqOQcRdCQ3AVDjI2eX
	 L693hzV93cC2el6PgAgkaqvkc3NSJSnTNp8CrdpIeWDxnR6wSQDqioXqM/ORPN+F7WeU2
	 10bQyBxeptbxwjvF6q83mWs711ggZYda+ug+yVAjZlQTThAhaMC5FAAzgGIe77H+qSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TAk3DVLC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A84606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TAk3DVLC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1CE1F000C0;
	Mon, 23 Nov 2026 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437638;
	bh=15SCLMNLiaDyKp/ZD7yxGdEOJ9mX1irBvjua/Xr15qY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TAk3DVLCqJLQOaDeNeaq/OShSvX39aR57zTr+ddtEAzjWk9gNgVIIulieJPhLQ/Gm
	 e0wcujxiRKqGttXVtWvvcAHI4xpbebrl6Y/mSO7ipKWncBgYCESbm5X3IadcBAR69i
	 FPlVnlano/0djt3BsFJtTqqpXEpjggcp2q8ab8Rc+5KN7l260LZN1Gdkkb0EjEirF0
	 8HFo5O21dlGiOKdpjV9XIhB6K1LdcyGaJofINvbMBMdl5BDn+Q0myIV4ED5KZeq1Wh
	 uupW6Eqc4SDSV0Fb1H6CiAz+3pwY1VUh33M1LP4qntYYMmLcdk2cLkbMSRzGhHQPh2
	 zgB01pw4uaucg==
Message-ID: <sashiko-outbox-229239@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229
 Type-C controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123122857.2424213-1-akash.kumar@oss.qualcomm.com>
References: <20261123122857.2424213-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:40:38 +0000
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
- [High] arm64: dts: qcom: shikra-iqs-evk: unclaimed vbus_boost_5v
  disabled after boot
--

commit 4e4a90b9b2797fb5455e941c73f032deb3b89920
Author: Akash Kumar <akash.kumar@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller support

This commit adds Cypress CYPD6129 and CYPD6229 Type-C PD controller nodes
for the Shikra CQM, CQS, and IQS EVK boards and connects their ports to the
corresponding USB controllers and PHYs.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-iqs-evk.dts
> index 5df30ad8211f8..4fde2ddb53931 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -15,6 +15,7 @@ / {
>  	chassis-type =3D "embedded";
> =20
>  	aliases {
> +		i2c3 =3D &i2c3;
>  		mmc0 =3D &sdhc_1;
>  		mmc1 =3D &sdhc_2; /* SDC2 SD card slot */
>  		serial0 =3D &uart0;
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
[ ... ]
> +		connector@1 {
> +			compatible =3D "usb-c-connector";
> +			reg =3D <1>;
> +			label =3D "USB3-Type-C";
> +			data-role =3D "dual";
> +			power-role =3D "dual";
> +			vbus-supply =3D <&vbus_boost_5v>;

[Severity: High]
Will regulator_late_cleanup() disable vbus_boost_5v 30 seconds after boot?

CYPD6229 is a UCSI controller driven by ucsi_ccg, where the PD controller
switches per-port VBUS autonomously from the upstream 5V boost rail.
Neither ucsi_ccg, ucsi_register_port(), nor typec_register_port() requests
or enables vbus-supply from usb-c-connector child nodes.

Because vbus_boost_5v has regulator-boot-on without regulator-always-on and
no driver ever claims it, its use_count remains 0 and
regulator_late_cleanup() turns it off, cutting 5V VBUS to both Type-C ports
and breaking host mode.  Marking vbus_boost_5v with regulator-always-on
(and dropping the unclaimed vbus-supply properties from the connectors, as
done on purwa-iot-evk.dts) would keep the upstream boost rail enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123122857.2424=
213-1-akash.kumar@oss.qualcomm.com?part=3D1
