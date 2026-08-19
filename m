Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC15336654C
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148222; cv=none; b=RHNcOEret4ZUApaQk6wXu/hNFEo4ayKeTSbNbXANSjSSkKILT12OuzmTwQFPlAZgwWhsxMJxZWuSaE7jc1WXsmwc+kN4X8Y0vTIE4j4teneiBpaXbvHG91K8Qcl0SfT2fjpWDpkwZc0pTMbGeeyatajooRSU96VHYHYAdQhX+hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148222; c=relaxed/simple;
	bh=D3asTxEtMBFQyhJI2W3rfwp/lIw7OjZuoC4o/AqXs80=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cxMAa0+6RDd0bYnaYWYHqeMDPCqcLPqzzGWxNFJxlnaJ1JEBJnQDDWynmCm+m2RXijN8QDUUMalT4O/fiKuL8gqdbfkq+Vuo5AWyH6lbRWEy+RYeI5ub8KcA+8wiOXSGWjnApuM86Iq9Ddubmb11ftm7d8sVhI6n/tC89F9SCIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nxbd/Ixt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nxbd/Ixt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400F71F000E9;
	Wed, 19 Aug 2026 14:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787148221;
	bh=Ev6HPOkHJXs6htNehars696eH1TMKtM73CSIOZw230Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nxbd/IxttHaOl2B4vTPNcwIx6wYDcy050oXLTAi5N2mCugUZwnEmIyzNV2w/fIzVA
	 +NDD1AuzCdcVqnI9D6RTJBAQevG1bAlT8xWp04llnXHYxiu3iytUbXYEOLS8nAd0Np
	 8JLjWXFnM+g+AwXq7/7SnHZIAQMp0Xf0uYQR0gHWpeLtKAdL8qmfcvmlllT4ANUGBs
	 ThdnUocmoU+YkacsmUNoi53s8J74gA1qgw9qvrljU0e5euD4tJK3J0HdtlNDdtfvNL
	 zPiIIPXKxW4jvEyRos67sPWUUel7e1ARgMz+ltSwv5aRfEhXSk27E6X4HhhqNnrv6W
	 ZLrFCG9BxPkxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: monaco-evk: Describe the PCIe
 M.2 Key E connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Deng" <wei.deng@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819-b4-monaco-evk-m2-v1-v3-3-988145ef65cd@oss.qualcomm.com>
References: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
 <20260819-b4-monaco-evk-m2-v1-v3-3-988145ef65cd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 14:03:40 +0000
Message-Id: <20260819140341.400F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Node overrides are not sorted alphabetically.
--

--- Patch [3]: [PATCH v3 3/4] arm64: dts: qcom: monaco-evk: Describe the PC=
Ie M.2 Key E connector ---
commit 208b6f2eef3b23e678fa76e3866767bc52da9a8e
Author: Wei Deng <wei.deng@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector

The monaco EVK has a PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART2 nodes through graph port/endpoint.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dt=
s/qcom/monaco-evk.dts
> index 9d17ef7d2caf1..5930ddb3b4b18 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts

[ ... ]

> @@ -923,3 +971,11 @@ &usb_2_hsphy {
> =20
>  	status =3D "okay";
>  };
> +
> +&uart2 {
> +	status =3D "okay";
> +};
> +
> +&uart2_ep {
> +	remote-endpoint =3D <&m2_e_uart_ep>;
> +};

[Severity: Low]
Are these node overrides out of alphabetical order?

They appear to be appended to the end of the file after &usb_2_hsphy, rather
than sorted alphabetically alongside the other node overrides.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-b4-monaco-=
evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com?part=3D3
