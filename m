Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023434;
	b=a0/pp6CjTElpViZEdPGPXIdaxyOyndF/qH40GYefBxEfqJZVp8o0G3EjMcYLzDnB4RnW
	 EbeE0BKh6a9miPcX0UoPXo5byyfwuhJ988AjPhKHD4uu90pUQCjzGJx//hCpkxN+9r189
	 Jnrju37mSrEKzog8vce7kSYDCR37tjZHzZaVYRoEBXps/GGuroMS5C1eM1i3mR9WzPt+l
	 TT1K2Hf5KC1G0BJhwo7mpKKZyjeoQRSjcdgNQET/v/XfjqVoNe28ibQQwJzZ+rM3c2T3p
	 r5BAVPY7pKq2/E1yt9hFxYbljlYFTSc6sRSTSWIx+MtPGXTP6flzqbTlHNpCixR6dvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023434;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ShLC17P8YWO1TsZERqx/vi8oGgh36RSBBtzFBkxcMQw=;
	b=Zt73HuPyKxRM/InNY+8D/c8UMk+CcIkYGsaAGahz9XhtiXpbaPAO6IVUGy2AiwVcmUh1
	 bWrhAqoZ4mB+JtqMXqAGWaXYTYKfmIcSZKVVYoZyRbZHSGs1QoafbecNlzPgr2AYCPmMW
	 d+pz5E/W8Dvl8o8eYC4nf+BGvbRDN3sMq/ZkI+3700ybwGe9s75dEXeubzh5u+c8n5CWC
	 KlEE4LDk1tz/pmMHXPqb+17xHyMKtVBwSpllycWCnisbyhXLnliqa6M/iLUw3qE51QaYr
	 F8xkyUI2CnWuIxtGZya9Vsn0/vZOIg0yWOXdHYM/zZB4jOh8cnQJc2XLaeJahs1smtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HvH6kCYz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50124606CA78
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HvH6kCYz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6FD1F000C6;
	Wed, 18 Nov 2026 17:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795023434;
	bh=ShLC17P8YWO1TsZERqx/vi8oGgh36RSBBtzFBkxcMQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HvH6kCYzWqKFxSFx82Yf2opEJhXYwtqxpSpNkL/XfOymjD49H9kPs7Gw4ysxF8k+M
	 CVLu3k1CNOoPynwpoWi98cDvLi0PcIQZGWjk4u5fQCCx/dQHLqn1QZdzw/uNPJss6e
	 CEquwk4LgevFdWu4AxKwO+oAwryGVfP5scDIeQKFumOBTkPkFU8U8s6OcAe1dYDmS7
	 ap5CmJdrBeFxNqRcyIf2kwwzFVdolw+LYTKW8sKxYBhqoMnkWLgF4uG3IxfSeVsycR
	 zmSG6PqhlvXr6Q+ZeZJxRvvacdjCWMYiXqfPIyGyjBS4l27O8ziKXIe4jWWaMzJcsC
	 3zRkqeP9pE+0w==
Message-ID: <sashiko-outbox-221667@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/12] arm64: dts: qcom: sdm670-google: Enable vbus
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-pmi8998-vbus-v2-12-3c77a72b280a@ixit.cz>
References: <20261118-pmi8998-vbus-v2-0-3c77a72b280a@ixit.cz>
 <20261118-pmi8998-vbus-v2-12-3c77a72b280a@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 17:37:13 +0000
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
- [Low] arm64: dts: qcom: sdm670-google: enabling pm660_vbus fails
  dtbs_check
--

commit 6df670bdbe84094d0f566a1be877a69fbfe53de2
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: sdm670-google: Enable vbus support

This commit enables the pm660_vbus regulator with current limits on
Google SDM670 devices.

> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm670-google-common.dtsi
> index 8f91faf8a9cc5..9c95855b56e7b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -609,6 +609,13 @@ &pm660_rradc {
>  	status =3D "okay";
>  };
> =20
> +&pm660_vbus {
> +	regulator-min-microamp =3D <500000>;
> +	regulator-max-microamp =3D <1500000>;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Does enabling pm660_vbus cause dtbs_check to fail on sdm670-google DTs?

In arch/arm64/boot/dts/qcom/pm660.dtsi, pm660_vbus uses compatible =3D
"qcom,pm660-vbus-reg", "qcom,pmi8998-vbus-reg", matching the driver,
whereas Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator=
.yaml
requires const: qcom,pm8998-vbus-reg (missing the "i") and omits
qcom,pm660-vbus-reg and qcom,pmi8998-vbus-reg from the allOf rule for
regulator-min-microamp and regulator-max-microamp.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-pmi8998-vb=
us-v2-0-3c77a72b280a@ixit.cz?part=3D12
