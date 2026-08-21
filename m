Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889472D73A6
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312828; cv=none; b=JrN5yIx+Kf6nl8rh0AfM2fXA+82adByM/CJ6qrvtrIIS9eqneYn62oRGXkSMEG+h6sbIFiwefiOVynZgMQoxXq+yJ/h+nHmEH6L2qo7SivcCKSVuOaqc8yNouDUknOUhzT4hQZOOUi/y9OrCLFnXq57kpgA12yEqM5+UsSWRIjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312828; c=relaxed/simple;
	bh=mJaGbc5yEUCb4+UnJxZpKGhvttZaerW7WQPWtHiYH8M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mUH6ft9StvOETPkXN9clGZBFJoMnZ5Av01Vk1ol3mH6OkKusI7sqvFofM89Uza7TTydzL0/V05zCMRqugZqJGB5MdswTqv+apMlFuNJqKbUSovmw6jvUheo089B8gpMaq5Y2N6ncawqoD5158V+NP/RfW8zeWQ/7ZwQnqjz+qY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GI130Cx2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GI130Cx2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABF51F000E9;
	Fri, 21 Aug 2026 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787312823;
	bh=9N9+F2DuQRO5jPYdBLQUGmEZbnXzG6aql0Q4E19ulGA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GI130Cx2BYisuBoCv9kelOy12NkZZWygaHl088VzJKOONjIwY+Lo13paD/bevxTpz
	 m4k07L7KnObi439a2EjI1AIW3iKQfYyM1OIE7aAImXcPXLvqhDxRAOr/crs9aey30K
	 NPBHAM84vLbavM3qmsMzSI3ZXXOesMN0ABB0IzhQeBQ8enZ0XIkxjTd5+UlBU5xPw2
	 2RqL4VnL3/w5EHf+6Co8PFDxvbryzz5sx3E9rR29vohpxzCPC22Qqe2ZhUKpxxq+Qx
	 x6ep0ipFc5fXbq3rd/Zru0XLGFebPrqm7euaUzDGXOvKsqIMxB/i7RUZmNwx9HmnsR
	 OBqvNJr1t+jPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] arm64: dts: qcom: Add Motorola One
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821-next-patches-v3-3-cd64bcef6e21@gmail.com>
References: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
 <20260821-next-patches-v3-3-cd64bcef6e21@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 11:47:03 +0000
Message-Id: <20260821114703.8ABF51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing touchscreen device node despite being claimed as support=
ed in the commit message.
- [Low] Invalid node names for 'regulator-fixed' devices failing schema val=
idation.
--

--- Patch [3]: [PATCH v3 3/7] arm64: dts: qcom: Add Motorola One ---
commit 8ba9a47fea266dad9cdd80e285fa6a60029f2405
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add Motorola One

Add a devicetree for the Motorola One smartphone, which is based
on the Jacala/MSM8953 SoC.

>     Supported functionality as of this initial submission:
>     * I2C peripherals (Touchscreen,NFC)

[Severity: Medium]
The commit message mentions touchscreen support, but it appears the device
node is missing from the I2C buses in the device tree. Are the touchscreen
nodes missing from this submission?

> diff --git a/arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts b/arch/ar=
m64/boot/dts/qcom/msm8953-motorola-deen.dts
> new file mode 100644
> index 0000000000000..66ecfab69c365
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts
[ ... ]
> +	vph_pwr: vph-pwr-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vph_pwr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	/* Fake VBUS 5V supply till we wire pmi8950 one */
> +	fusb302_vbus: otg-vbus {
> +		compatible =3D "regulator-fixed";

[Severity: Low]
Will these node names cause dtbs_check warnings?

It looks like vph-pwr-regulator and otg-vbus do not match the required node
name pattern for fixed regulators in fixed-regulator.yaml. Should they
start with "regulator" to pass validation?

[ ... ]
> +&i2c_2 {
> +	status =3D "okay";
> +};
> +
> +&i2c_3 {
> +	status =3D "okay";
> +};

[Severity: Medium]
Are these I2C buses left empty because the intended touchscreen device node
is missing?

[ ... ]
> +	ts_int_default: ts-int-default-state {
> +		pins =3D "gpio65";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-pull-up;
> +	};

[Severity: Medium]
Since the touchscreen device node seems to be missing, are these pinctrl
configurations currently unused?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-next-patch=
es-v3-0-cd64bcef6e21@gmail.com?part=3D3
