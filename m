Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462579;
	b=4Ce3hE6ht9BSCw+DpzRfm44jvuPVTvGvIzLEpIxBsZSX4fa7QPDJEyO65//f8puXbHTM
	 hL8x5yesyZlAArCgnoyKQ1cnYP2w2EsXqJPEVzpKjI1YAug2NT+705hER4+E71t2Vmto1
	 KhVnh/QEi9ez1nB0V0piis/YmSNXx5a8dfZIFxpZ4J4cHUhQC1pxFVUKS73ZHRaYQV/yl
	 1tdVnEjiq83GETNxWW+CAsewaH6DSJaUORGgkh3IpYXG/cF1I/QXWO2vC2jLWuatmrH2H
	 WMc8CjAiR1vkyJFto9aKXfkJM/l//j9dqY9lX889MObHdb6dolxZb8UpTOZPhCR2hTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462579;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RKnhdPpfYsPGdAzz+fqYgf9HUMKULURvacSCcWaXmsc=;
	b=Z7EKbIaS9MNzSMIQCwhQULxjqnlFXBtQzVaEBHfvjTl8RGI/nZV3svU8Gua5FnUZF3aN
	 dtzArcWr242+LT1Con/wZTm89i+1bNZfIWvgDZetRnASFEzo+VgxNWKnIFF0QpOqbAY4h
	 XpitzO8b8MPU5EpEPwBjFvdzbcWwADgtLm2T2++WGtzB/nFgBllpgHwd0WsM6zLISQCUh
	 EeUrWRzhTCK2yYWjEI/RRlXya4PJ4l4o3waGdZbhwnz9lVPZgk5/sPuIvhKHH7/jhyLHi
	 oNwRSQvRA5Gg7F39KcnirsMv1c5pRAFEtkZVBcYXr1TwwTuBEw9vnR71G/Bwc8MSmtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7HNaqrD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227AC606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7HNaqrD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73661F00A05;
	Thu, 12 Nov 2026 05:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794462579;
	bh=RKnhdPpfYsPGdAzz+fqYgf9HUMKULURvacSCcWaXmsc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y7HNaqrDEfFVm511kZrfRhcHSMWF4LQcRrO3ymTgi/ZoqHAQyFzBPVe+3kta60D59
	 H9d9tSmqVJcVWfetyEo7DclI/Z6lUCZRmWmG0G3hY7hk0Z22jQA951a3I4fClfGVJ7
	 Yl4LUszBRCF7FV7BQgyI8NRutTwzWtuSOU9/FV0Dzs3pFU0bNIeqeFfLM1wlNEv7r6
	 8x60zoIJWqRplv9tECQgwtOQH2PasxFehQhqLDEl4rOEBj+KSaYAN4S/32xm5e1qZ1
	 vgIVswmGJCdUYiJnvU6eAZxZkSthssKm1+KuNP/YIsWuy3UUMwhhjpzjTc3/0qR7sr
	 eaPuGjQCGsN3g==
Message-ID: <sashiko-outbox-210481@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-mtp: Add WCD9390 USB-SS mux for
 DP alt mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balaji Kalkonda" <balaji.kalkonda@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-eliza-wcd-mux-fix-v1-1-70c521781ac1@oss.qualcomm.com>
References: <20261112-eliza-wcd-mux-fix-v1-1-70c521781ac1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 05:49:38 +0000
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
- [Low] arm64: dts: qcom: eliza-mtp: &i2c3 node placed out of
  alphabetical order
--

commit dceba04a5137daf6908c61ec04a54977dab1b62a
Author: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>

arm64: dts: qcom: eliza-mtp: Add WCD9390 USB-SS mux for DP alt mode

This commit adds the WCD9390 USB-SS typec-mux node on i2c3 and wires its
SBU endpoint to the pmic-glink USB-C connector on eliza-mtp.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts=
/qcom/eliza-mtp.dts
> index ee05192adcfb9..d848ae77ab851 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
[ ... ]
> @@ -112,6 +120,34 @@ vph_pwr: regulator-vph-pwr {
>  	};
>  };
> =20
> +&i2c3 {
> +	status =3D "okay";
> +
> +	wcd_usbss: typec-mux@e {
> +		compatible =3D "qcom,wcd9390-usbss";
> +		reg =3D <0xe>;
> +
> +		vdd-supply =3D <&vreg_l7b>;
> +		reset-gpios =3D <&tlmm 152 GPIO_ACTIVE_HIGH>;
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				wcd_usbss_sbu_mux: endpoint {
> +					remote-endpoint =3D <&pmic_glink_sbu>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &apps_rsc {
>  	regulators-0 {
>  		compatible =3D "qcom,pm7550-rpmh-regulators";

[Severity: Low]
Should &i2c3 be placed between &gpu_zap_shader and &mdss to keep the
phandle-referenced nodes in alphabetical order?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-eliza-wcd-=
mux-fix-v1-1-70c521781ac1@oss.qualcomm.com?part=3D1
