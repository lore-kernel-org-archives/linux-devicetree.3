Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348CE3ABD96
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253680; cv=none; b=Uzj0n9B1eOmc4ZoEUxU5FnHlJxNX4pQ2fP4Ktc5JQx93+nSNVRa0P5EQziZ6vNMKUTqrPTGmv70uwv9iDq6uAk2eUcr4T8BCyQWMv4oE3hPEpfbS9WMNADOkmCyfPemyaSl9RJUZSlHA6JNfgSwP7l9mDznKJwi8iD77yLv/7FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253680; c=relaxed/simple;
	bh=KrsYoWoltV5/GgkGY+jkNpxb9fDRySTfH033YwNoYNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BSK3Rm9H7J4kwFZIW8l2bBh0q0K2ygEyz399YXE10+69T0gpAMKrKbTUjKhsvr3zChnhgdVn60v9GeBG5mPbA0gXFN1pyakyDgomNvJclNICJAYPrCtSX+4nXm1WGD9owCexHtBHebkusCoBoIOaokLgH0zMHnJmx3NAEiylGh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhzFnETQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhzFnETQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858F41F000FF;
	Thu, 24 Sep 2026 12:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790253678;
	bh=6ZfaNOxl/lcxzEKVgnXo4203IO0Zvc86/9khNuvpe5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IhzFnETQORjkRZUxNPYhs8SOB0ny+iR9WS1apjtvoCrBBWo4ZurNiL3lJ0njwSaGd
	 Ba01d/Tqp08PMo88BIcruh3EfKoA4bukNRitc263Q9MAuLaJmPsWxa1qG8GggRWGYI
	 a4IgIoXDx0pZvtXNSpTV6QQaBc58zOWJNa4BRPqOcZjpsy0AiUvZVzp11KFeG78dDs
	 U3Vnw8gwRCiMFIjHPdsJDvTpiQHfO8mSo9hU/I3Fsm37Bw9wToDgs5+kpT0YjumQ51
	 p/X4ZolLL/Ci5QQFvQ/7lAWcDhXZrP8Ou/QSI4Dtb/uffZhq9MR+ifPVNoI7ZaN/1D
	 VxORKrfoujeeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924-shikra-gpio-expander-v1-1-71929498ea44@oss.qualcomm.com>
References: <20260924-shikra-gpio-expander-v1-1-71929498ea44@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 12:41:18 +0000
Message-Id: <20260924124118.858F41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dts: I2C GPIO expanders placed under UART node
- [Medium] dts: I2C addresses mismatch hardware compatible strings
--

commit 32fcaaddae686bf893114a2f4648aee0e464eb7f
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: shikra-evk: Add GPIO expanders

This commit adds definitions for TCA9538 and TCA9539 GPIO expanders used on
the shikra-evk board. It maps them at various I2C addresses.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/d=
ts/qcom/shikra-evk.dtsi
> index 0115fc9095b3b..04faf09b21ae0 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> @@ -29,4 +29,32 @@ tpm@0 {
> =20
>  &uart0 {
>  	status =3D "okay";
> +
> +	expander0: pca953x@38 {

[Severity: High]
Are these I2C GPIO expanders placed under the correct parent node?

Because they are defined as children of uart0, they will likely fail to pro=
be
and cause device tree validation errors since UART controllers do not
instantiate I2C devices. The commit message mentions the I2C3 bus, should
these be placed under a node like &i2c3 instead?

> +		compatible =3D "ti,tca9538";
> +		reg =3D <0x38>;

[Severity: Medium]
Does the ti,tca9538 compatible string match the hardware at I2C address 0x3=
8?

The TCA9538 hardware strictly uses addresses 0x70 through 0x73, while
address 0x38 typically corresponds to PCA9554A. Using a mismatched compatib=
le
string might cause failures if chip-specific quirks are needed later.

> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +	};
> +
[ ... ]
> +
> +	expander2: pca953x@20 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x20>;

[Severity: Medium]
Is ti,tca9539 the correct compatible string for address 0x20?

The TCA9539 hardware strictly uses addresses 0x74 through 0x77, whereas
address 0x20 usually belongs to TCA9535 or PCA9555. Using the wrong compati=
ble
string can inaccurately describe the hardware and lead to issues.

> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-shikra-gpi=
o-expander-v1-1-71929498ea44@oss.qualcomm.com?part=3D1
