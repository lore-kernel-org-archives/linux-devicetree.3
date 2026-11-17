Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923678;
	b=MaV4ac1A5QwuqF/xlCy6EPUDNAobMIZK34UOI9CWm5V0SpWNy9MzOrWd7ZddAublqExz
	 yQU0YEcXjY1SmUQZL13uHD4GE8yBUpdjpKZJekwEI2EnhtL09HUXkz6ZcilbbTTsPNne7
	 kmzZTS22LgHG+iMnrx7EaX2kQJaEdOaeO7dO2a/nxjefnMJjnNUtvW5gh770HH5ts+RGP
	 JeOZuyuS65zjGYyGjpqUhuOtuojLZx295xWbRzw/h4tiiOp7u3QW2hd44pDNIkURPHZz0
	 ejNn7/LFjMZMARV/b7o8TSiOHwMn832OkvCp8EmxE4p61jLciDTdP0DMLj3eYAdk6Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923678;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zlxBEyM9x2eWCk1EhUwhvikiHUuD24IlRED5BT86hDg=;
	b=3QGcjOT8wFqudGtApd9BFznAj3Htjtkg+i4EmJd6orqzsbQdjsMA//vy9TRXf7uvXsPQ
	 NXnCdekhG2e4EEP9BLFpanI5aclv6mlSbhDlXNacdbNJ3YCfgh/JqAE2ZuPa0111so01O
	 ReRB84J0+b4LY720WIfuu13qVaxCFUpDrEvVjEO0chiCJKrsYFE9w3yjcCEcbVP5eCO3i
	 oQEOcDecFrq6vifLX/POqJOTY2vhJQpjCZaOoan+YTyRpmBahIiQzMFKS0JWeMKn1JV/a
	 bm2lDVYa2+XCdL8N1S0/i5z6hcM019SfbMw8EBeQ+qE7EX2RJI/A48FZTjs6lEyAqlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gJGMT//F";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A581606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gJGMT//F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59451F000C5;
	Tue, 17 Nov 2026 13:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794923678;
	bh=zlxBEyM9x2eWCk1EhUwhvikiHUuD24IlRED5BT86hDg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gJGMT//FU+/EuO4bd6AQsSKijY9H7JzN/tDExzENQyX+43dcU1zwf229dq8Ciu4RW
	 byx6sM4oQ6NcdMCO1Pstpm79rpmBaww5aNtC0nbgkoeKdYm4xzCUbD4gi4ipOjo5lZ
	 OTX2o8PuUdxqNb3DOJ5QRIPUx7rJpRRXNSW2GLx9Bgdqfon1z7qjcg3zw74RTyeCWK
	 NMf3cUgLRgvptevBfGUfrPbYJOGvlxwwDToPvXKtU4wcPsA4T6P+qCvH46dSMyyUoW
	 Apg1aTBTgbaQlkI9ChXzolUwy3ar7BbyD5G/fKYxIu4y0FGfebyYLmtAHRgiY2Vjkp
	 fnEGi3GHvhPxg==
Message-ID: <sashiko-outbox-218907@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Remove deprecated hsuart aliases
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117133825.245191-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117133825.245191-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261117133825.245191-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:54:37 +0000
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
- [Medium] arm64: dts: qcom: missing serial1 alias for uart3 when
  removing hsuart0
--

commit 89fde105212b474add4ece5c8204ee69246c787d
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

arm64: dts: qcom: Remove deprecated hsuart aliases

This commit removes the deprecated hsuart0 aliases from four SC7180 device
tree files, replacing hsuart0 with serial0 in sc7180-ecs-liva-qc710.dts.

> diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm6=
4/boot/dts/qcom/sc7180-acer-aspire1.dts
> index d9c70897b6f1c..fccd0931a9693 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
> @@ -21,7 +21,6 @@ / {
> =20
>  	aliases {
>  		bluetooth0 =3D &bluetooth;
> -		hsuart0 =3D &uart3;
>  		serial0 =3D &uart8;
>  		wifi0 =3D &wifi;
>  	};
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts b/arch/ar=
m64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
> index 3100fab18787a..58b93c49ccf18 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
> @@ -21,7 +21,7 @@ / {
> =20
>  	aliases {
>  		bluetooth0 =3D &bluetooth;
> -		hsuart0 =3D &uart3;
> +		serial0 =3D &uart3;
>  		wifi0 =3D &wifi;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dt=
s/qcom/sc7180-idp.dts
> index acfb9937651d6..7d830b25d8c66 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -21,7 +21,6 @@ / {
> =20
>  	aliases {
>  		bluetooth0 =3D &bluetooth;
> -		hsuart0 =3D &uart3;
>  		serial0 =3D &uart8;
>  		wifi0 =3D &wifi;
>  	};
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/bo=
ot/dts/qcom/sc7180-trogdor.dtsi
> index 0e0bc8543f714..560a650b09662 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -90,7 +90,6 @@ mdata_mem: mpss-metadata {
> =20
>  	aliases {
>  		bluetooth0 =3D &bluetooth;
> -		hsuart0 =3D &uart3;
>  		serial0 =3D &uart8;
>  		wifi0 =3D &wifi;
>  	};

[Severity: Medium]
Should sc7180-acer-aspire1.dts, sc7180-idp.dts and sc7180-trogdor.dtsi
replace hsuart0 =3D &uart3 with serial1 =3D &uart3 instead of dropping the
alias for &uart3?

In all three files &uart3 is enabled for the Bluetooth serdev, while
serial0 points to &uart8.  Commit 08b0adb1ae54 ("serial: qcom_geni_serial:
use DT aliases according to DT bindings") switched to looking up "serial"
aliases, but qcom_geni_serial_probe() still required an alias and failed
with -ENXIO for unaliased non-console UARTs until commit a53be6945f51
("serial: qcom-geni: Remove alias dependency from qcom serial driver").
Leaving &uart3 without a serial1 alias breaks Bluetooth on kernels and
projects implementing the 2021 serial alias ABI, and shifts &uart3 from
ttyHS0 to ttyHS1 via dynamic IDA allocation on newer kernels.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117133825.2451=
91-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D2
