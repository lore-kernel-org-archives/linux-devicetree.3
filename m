Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36443B05AB
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785609790; cv=none; b=VExtcORgdIKd2DAQMM7Jwd67mAtpPwyHy6kwcJr4oV2UQ0OMZ3RKpq9afuZhLe19I46C9UABcubVLJxqtHoo9CN/ojFuZORh3FnEQJ77GMS5PJqWyt5fSzyrksLixaoV43xuwIGCQpPyOxLDxtYPh3MIIZRXvbEZZBoYYQgzV8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785609790; c=relaxed/simple;
	bh=vPbTPIJKtd42+6PRFZA455zD4U0fZJ5/3Ksu0I2v8WY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uZqb4KJ8h5svDNudp3wKmxs8ijk3J5BUSPIW0oAuWxIRGpYq8u/CorOOIGm7rF07L8o/n3t76tE6fXeA7QwSM3p5B2ROHpSTCgDK+0K1ZDadIDVCYte0baRko5WlmRB7BFjhsk5ESYq4GH/2m/OG5BPJeORXCFA4I3WeJLeSHUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKua8SDT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKua8SDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6001F00ADB;
	Sat,  1 Aug 2026 18:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785609788;
	bh=ng+7WW5fP9GSCl9Jrutm0zGxm+0DqYmmI2JTAFVDahg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EKua8SDT4jmvDI82Jz/+RpGKXMHMLjkoEIOHjUcw3R64h2lyEfPDg/py6jSTtOsSc
	 KIo+oviQB5zgbaqmzZhn1sMQqsbYTN1xXXQsIw/fpCQCTyvPTa4Rx3A5KWAGBpIEsN
	 eCq08WIPPC+gkiTwWDsoREojKtIIQ5/R93fZdjlTKiivcXtPplYzoO8ds5XaxEnizo
	 YSxXPAaoOUA+94NQeM0j9Ipac00lqrqemYmvFtKYDzCFbce33s+Wd9kiaT/E3+/rlR
	 C1Yo1PWS9Zh6Iiy1pbfX1o26LJZBKTV3R+dQzMt7W43oDJE2xIboQ2yFzUI0u2KfA3
	 CEACtwmem3A9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260801-dell-xps-9345-ec-v3-3-9f4bdb5a5dad@vinarskis.com>
References: <20260801-dell-xps-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com>
 <20260801-dell-xps-9345-ec-v3-3-9f4bdb5a5dad@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 18:43:07 +0000
Message-Id: <20260801184308.1A6001F00ADB@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The device tree patch extends and references a non-existent label `=
pmk8550_vadc`, which will cause a fatal `dtc` compilation error.
- [Low] The patch uses undefined function-like macros (e.g., `ADC5_GEN3_AMU=
X3_GPIO_100K_PU(1)`), which will cause a syntax error during device tree co=
mpilation.
--

--- Patch [3]: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345: i=
ntroduce EC ---
commit e7703c5dfab63d67ae0d89c48a05547baa5abd7f
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC

Describe embedded controller, its interrupt and required thermal zones.
Add EC's reset GPIO to reserved range, as triggering it during device
operation leads to unrecoverable and unusable state.

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch=
/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index ce7b10ea89b6d..8d8d8014049bb 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
[ ... ]
> @@ -759,8 +759,32 @@ retimer_ss0_con_sbu_out: endpoint {
[ ... ]
> +	embedded-controller@3b {
> +		compatible =3D "dell,xps13-9345-ec";
> +		reg =3D <0x3b>;
> +
> +		interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 =3D <&ec_int_n_default>;
> +		pinctrl-names =3D "default";
> +
> +		io-channels =3D <&pmk8550_vadc ADC5_GEN3_AMUX3_GPIO_100K_PU(1)>,
[Severity: Low]
Does this file include the node definitions and bindings for pmk8550_vadc?

The pmk8550_vadc phandle does not appear to be defined in this file or its
typical includes, which will cause a dtc compilation error when the device
tree is built.

Additionally, is ADC5_GEN3_AMUX3_GPIO_100K_PU intended to be used as a
function-like macro taking an argument here?

The dt-bindings headers usually define this as a parameterless macro.
Supplying an argument like (1) will cause a preprocessor error during the
device tree compilation.

> +			      <&pmk8550_vadc ADC5_GEN3_AMUX4_GPIO_100K_PU(1)>,
[ ... ]
> @@ -1025,6 +1049,57 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
>  	};
>  };
> =20
> +&pmk8550_vadc {
> +	sys_therm0: channel@14c {
> +		reg =3D <ADC5_GEN3_AMUX3_GPIO_100K_PU(1)>;
[Severity: Low]
Will appending to pmk8550_vadc work if the base node does not exist?

Similar to the io-channels property in the embedded-controller block,
attempting to append properties to an undefined pmk8550_vadc node will
result in a path not found error from the device tree compiler.

The reg assignment also uses the same function-like macro syntax which
will trigger a preprocessor failure.

> +		qcom,hw-settle-time =3D <200>;
> +		qcom,ratiometric;
> +		label =3D "lpddr5_therm";
> +	};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-dell-xps-9=
345-ec-v3-0-9f4bdb5a5dad@vinarskis.com?part=3D3
