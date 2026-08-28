Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7BD388899
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 04:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889649; cv=none; b=IENWjpLxTvvf6CJp2wOz3RB1K1xTKHAguIMbANWsKKuYhS7s9hmTR2mciJ/KvmcP8eSrBbJ0EXGeW2xrrXvsdcD0A9eMd2lH54uZ4qTT9mi4useU9g8P9FAFfnUskA0XkkpYjxAniuEdKxO/zIz1L2yGWJoONrBPPF5cyIjZ0Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889649; c=relaxed/simple;
	bh=kyMgEDKpRT3z4zZl01XJTAmuYogrSj0JexKGsVnerDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DDvPPYOIrYA50N9I1hfg2KvTJgiQ1dNajNko7Nh5FVN7ZFTmKuAHrd+wW3wUH/RgjJsgeQNB1+dYLZT7q9dKS+c+eJEpbVDu0pHzZAJTqJRRrrks9jy4TTLDAIMD9r1uiTAXcOypoglSzLnVVxH4A8bcFTe8suXFTokl43BT7sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3wRF9km; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3wRF9km"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694DC1F000E9;
	Fri, 28 Aug 2026 04:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787889647;
	bh=y4upueArw5e0MR27cdVvzLtTTw8HHJTSMc7NNlq5fGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X3wRF9kmghizex2sUZp4f8fRMx9WxIwjNsESRkpMvi7zDw571o8KlarGHwjZYj7qu
	 eAT595SThaxeCWuzjYYnLqEDyuGRjwJwhcF0YZqHWuP8Tp+BRDxTvhSYyOW/G8ELxL
	 1JAIUD7ADmKrHrzWDD5AN4mFHwCH9gno2nxCCm0ByaKE0+9N/frQKaHO+YwXfYrKCr
	 fHWhCuXuH3Cnp3s7v54pxFHOyReJOLr2bJP1IZ3DZ7j4W5copu8mWNDEk/60hnGDoJ
	 3GkIBdVNe46UyfsG8frSzOXVgsGLCy4L5gVu0coU/a5UgVA1NQrKuQ+fzNP0fynlzI
	 oHdtRAjxyPeZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/6] arm64: dts: qcom: Add device tree for Nord
 GearVM variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828034958.3165-3-shengchao.guo@oss.qualcomm.com>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
 <20260828034958.3165-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 04:00:46 +0000
Message-Id: <20260828040047.694DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] GENI QUP Serial Engine power domains are incorrectly mapped to SCM=
I channels based on their serial protocol rather than their physical QUPv3 =
macro instance.
--

commit 41071503143d39ef303989d323bfed347d9037f8
Author: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord GearVM variant

Add SoC-level device tree include for Nord GearVM variant, where a VM contr=
ols
platform resources (clocks, regulators, powerdomains, etc.) as an SCMI serv=
er.

> diff --git a/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi b/arch/arm64/boot/=
dts/qcom/nord-gearvm.dtsi
> new file mode 100644
> index 0000000000000..5514f9a6f49f5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi

[ ... ]

> +&i2c15 {
> +	compatible =3D "qcom,sa8797p-geni-i2c",
> +		     "qcom,sa8255p-geni-i2c";
> +	power-domains =3D <&scmi9_pd 15>,
> +			<&scmi9_dvfs 15>;
> +	power-domain-names =3D "power",
> +			     "perf";
> +};

[Severity: High]
Are the power domains mapped incorrectly here? SE15 is assigned to the
scmi9 domain when configured as I2C.

[ ... ]

> +&spi15 {
> +	compatible =3D "qcom,sa8797p-geni-spi",
> +		     "qcom,sa8255p-geni-spi";
> +	power-domains =3D <&scmi10_pd 15>,
> +			<&scmi10_dvfs 15>;
> +	power-domain-names =3D "power",
> +			     "perf";
> +};

[Severity: High]
However, the exact same physical SE15 hardware block is assigned to a
completely different domain (scmi10) when configured as SPI.

[ ... ]

> +&uart15 {
> +	compatible =3D "qcom,sa8797p-geni-debug-uart",
> +		     "qcom,sa8255p-geni-debug-uart";
> +	power-domains =3D <&scmi11_pd 15>,
> +			<&scmi11_dvfs 15>;
> +	power-domain-names =3D "power",
> +			     "perf";
> +};

[Severity: High]
And here, the same SE15 block is assigned to yet another domain (scmi11)
when configured as UART.

Does this incorrectly assign the power domains based on the serial protocol
rather than mapping per physical QUPv3 hardware macro instance?=20

If hardware peripherals request the wrong power and performance domains from
the firmware, could the SCMI server reject the requests or manipulate the
wrong physical domains, resulting in the peripherals failing to probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828034958.3165=
-1-shengchao.guo@oss.qualcomm.com?part=3D2
