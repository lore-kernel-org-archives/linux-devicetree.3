Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D435036605D
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 01:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782782815; cv=none; b=baCWhAhlvEguOpKVZcxxyV/BtlgtZ9h3lIfwKd8cQfK7qawjLnCy6s9aBYtvqKt0wGLFirdS1lvuOoeajhK1TAGxEbjNRmSXtgt7YTCyGBYJ6sx2mssr0ZPply27hvnyvv4hWHMo2ktHSjBESc1KgZV0GvV/Ca50T9q6YcMW8eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782782815; c=relaxed/simple;
	bh=ICs9xWzxpBIW9sTHeCzQyTIIsTZmvTxGOvj7unqVjMc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NV3rlxC65+Ra0KH0rFDEU1/cZhgJS9fVdyv06SsgRzjN3bUlP7/y4Lypd794q4s5sET6wp+BAHomNt2dttm1HvFcpaBQwb3Ot8UWOI55z3fxkWULMhZGey+29T+at/aNGZO/34fEmbdrLD2Kc0z5SDMkr0Z1KD4+8Lhbw1z6w+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6qbLV5P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6qbLV5P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27121F000E9;
	Tue, 30 Jun 2026 01:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782782806;
	bh=/XE5LgVdGr/1cJtz6g/tkCEvRFIMawdoJJT8/aQbTGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c6qbLV5PXKLKqPeiuK9sK4ZJGbVuVxzVy/94IvFBHC8OlEW0swzyPqCpfyPAt/y0p
	 B5uzrh4CDBYWsdLjVms7x97EHwxLzMbuP97Tq4Z9T9jA8zOUPZkcF2adqOWc/JBwkG
	 jgbxLWID86TXzsEqoyA0x5x63UjLuQesTXn+J7Hw3byQ+YNsYwY11E3b8x7BYNde+T
	 eH4FhTSRXgVCHW4sjWzsH6ItSHHEpBmcxXsf/VVtOaLrzW9oEhQlYbp/UljL++uIep
	 XQ7SVgEzMucIFRWnyQ3DNKig2+RGGfIA+PVVHpUqeL+Xj5/8fnUT+occN2bsm2jzOP
	 yR6Trmt15X2ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260630012106.3616821-4-zychennvt@gmail.com>
References: <20260630012106.3616821-1-zychennvt@gmail.com>
 <20260630012106.3616821-4-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 01:26:45 +0000
Message-Id: <20260630012645.E27121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The devicetree node for the NAU8822 audio codec uses a model-specif=
ic name rather than a generic functional name.
--

commit 4b9e8074772f80384175f231ae4886c8f9599142
Author: Zi-Yu Chen <zychennvt@gmail.com>

arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC

Add I2C controller nodes to the MA35D1 SoC dtsi file. Also, enable the I2C2
interface on the MA35D1 SOM board and configure its pinctrl to allow
communication with the onboard NAU8822 audio codec.

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64=
/boot/dts/nuvoton/ma35d1-som-256m.dts
> index f6f20a17e5018..4b9ff6d006314 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
> @@ -55,6 +55,18 @@ &clk {
>  			   "integer";
>  };
> =20
> +&i2c2 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c2>;
> +
> +	nau8822: nau8822@1a {

[Severity: Low]
This isn't a bug, but should this devicetree node use a generic functional =
name
like audio-codec@1a instead of the model-specific nau8822@1a?

The Devicetree Specification (Section 2.2.2 Generic Names Recommendation)
requires node names to describe the general class of device, and using spec=
ific
names can lead to dt-schema validation warnings.

> +		compatible =3D "nuvoton,nau8822";
> +		reg =3D <0x1a> ;
> +		nuvoton,spk-btl;
> +	};
> +};
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630012106.3616=
821-1-zychennvt@gmail.com?part=3D3
