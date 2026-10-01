Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04054B7A21
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863120; cv=none; b=Etqh+UvzJFu/BkRkxoErabxLjJU91wdWj9wez5R8i3Re28TqYqfZPU9LbB5fGbAnXUmB60IWBZ7CZDJDazdRdXbYRWfnAxUUnZqFtzC3tkgJWITcRobHLq0FBoL5a7F/RWbsKqPGu4K6qZcOeWpXoX+29DsX/0PGwYEkGmp5Rv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863120; c=relaxed/simple;
	bh=w/xRXoBwDcTNBshYLCMyTT91aSpAqCMCv9dhHInpr5w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=geh823pR5uiMug5AngaNUR9ieWAgSP/eWGvzSRZyAPwsbSvR2OyJShEfhF2mGwRGJR7YuZwBzb+j/bWglObWkoVydkjWOmxPsAZ6JWMvseH1CJhsBV0ph2lnwvwMRTzzR8S0SoOfaQ0rS7coyboTe+DVV3uy0PVyhHcZ8yxLzUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8+TP1Vg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8+TP1Vg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459FD1F000FF;
	Thu,  1 Oct 2026 13:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790863119;
	bh=uGzRqUzn1r+NzLCHjx4N8AymIOycEKHqsofGGwTYUK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l8+TP1VgbMaDOdG2burpFqAxloEMKGxfmexV+3Ipq93KVrF7f0yamZy23oWnoXJhM
	 Z/ITb5FpgHta8DNAVxq34Izbfn3Fjtx9oIpA5QYPnoZ2++l6Pufk3XSNj5iETHo+Yl
	 VbLFtSjb8OHDZ8s+JkP2DYGt9EpBVIJpp0yZCfRIqCnK8rDdMVVcu4jZ+BElzSeLO2
	 9gMltE/7Chcf/01p+XAVU9mFr009nS+h1YSfyOrtD9+t47vDBRqQOnwsZg7u6HLCom
	 afdZG08PfZuFnKVW2RnU6WcryyxoegeGNqyDGPByLntZrZcOdI8GuikMx6cwBzMfDt
	 YxAqukAxaq+Gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
References: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:58:38 +0000
Message-Id: <20261001135839.459FD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: incorrect compatible strings for I2C GPIO expanders
--

commit 1d7a662c567d09ded1460a7741dd86e406ccdb82
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: shikra-evk: Add GPIO expanders

This commit adds the EVK GPIO expander definitions on the I2C3 bus.
It describes the TCA9538 and TCA9539 expanders used by EVK boards.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/d=
ts/qcom/shikra-evk.dtsi
> index 7fbd6d1de19ad..1c49cb52ce12b 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
[ ... ]
> +&i2c3 {
> +	status =3D "okay";
> +
> +	expander0: gpio@20 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x20>;

[Severity: Low]
Is this the correct compatible string for the hardware present at this I2C
address?

The ti,tca9539 IC is hardcoded to respond at 0x74-0x77 and cannot physically
respond at I2C address 0x20. Are the chips present at 0x20 and 0x21 actually
TCA9535 or PCA9535 ICs, which use the 0x20-0x27 address range?

> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +	};
> +
> +	expander1: gpio@21 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x21>;
> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +	};
> +
> +	expander2: gpio@38 {
> +		compatible =3D "ti,tca9538";
> +		reg =3D <0x38>;

[Severity: Low]
Is this compatible string accurate for this address?

The ti,tca9538 IC is hardcoded to the 0x70-0x73 range and cannot respond at
0x38. Are the ICs located at 0x38 and 0x3c actually TCA9554 or PCA9554
expanders?

> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +	};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-shikra-gpi=
o-expander-v3-1-d30c1e8067db@oss.qualcomm.com?part=3D1
