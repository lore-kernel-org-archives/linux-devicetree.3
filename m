Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCE1335564
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 20:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783025825; cv=none; b=KSUO5aJJgLqEFHzwbZfAepJwmQ8+vAiCqkeXm82WYRNP+YGKy43Wnnjp95PgjbedNVexF099EtjRwyMNrNCYzeyul/sd5ii9d+0f4PKuNsxNPsvYlERgTscblGATyQqVKh3JYs8XV7HLnvJ/YQ8HCawhZ7aLFRpvYL4mMEJRLt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783025825; c=relaxed/simple;
	bh=pvDoeewxvA/slTWVKggVd9Afeffpoa7t0rHZclOCvsY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SMXUpXstTDjVbC/8Ep69Zpk3/ka+GpC4BAQyqQXyzrpNEBz14fSebHTyHkD9oOoRtg2ccR4Dv41qESTuLQjT1FJtD/A4nAcg0m/J8UyMSrYp2X1oh+62oXNR+WGFlnRXSc7uMhiGOUdDAsSyr41+xN6eIXsggy+vF+O1aOIjZ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZMVr0bK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZMVr0bK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059411F000E9;
	Thu,  2 Jul 2026 20:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783025824;
	bh=a+PT4Q0+zJgDy0c6F9EzLbrlKfOcqCIqrgLjGOW2QoY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cZMVr0bKNwyZ9k2DTlrRTrvcq91+/OMZlvrOJ7oOJjZE1TaE20tocf2gK/+4Up6W8
	 slpYd+eneKNDRoS965IZ3siMHqXiU/hrnSL6f2w5RRRkp5UyFTLrJADlJ6AkHwBW6d
	 wIvcNcQa9XzNeo0i/aGsLVz+KNmGGtBqC3lbACgxV3I9ZtuR29PlLL9Tq35X9oIh8g
	 H2uyMnejE7LzRvfYjEJ4QdXQozFE1mfpLDay/POZeoIOj4O674tWUs1jYHeVX8UmxH
	 IimKkSBwXXE7q1EvaR1zs2tFTLhGk3A16/JUjGIvN06w+4iv6emROBWY7K23wE3hX4
	 /oPD5GWealXRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Add devicetree for the
 Graperain G3568 v2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702204628.2407308-5-coiaprant@gmail.com>
References: <20260702204628.2407308-2-coiaprant@gmail.com>
 <20260702204628.2407308-5-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 20:57:03 +0000
Message-Id: <20260702205704.059411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect ADC key threshold definitions lead to mapping collisio=
ns, causing the MENU button to be registered as ESC.
--

commit fe49d935384ac01dd829b914e2d8c0b5c9cffcdb
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2

This commit introduces devicetree support for the Graperain G3568 v2
development board. It defines the hardware configuration including networki=
ng,
storage, multimedia, and ADC buttons.

Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6dadd=
ec9e400458816dd4c57ba807fc3.pdf
Link: https://blog.gov.cooking/archives/research-graperain-g3568-v2-and-fla=
sh.html

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts b=
/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
> new file mode 100644
> index 0000000000000..9705e1c5a98a9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts

[ ... ]

> +	adc-keys {
> +		compatible =3D "adc-keys";
> +		io-channels =3D <&saradc 0>;
> +		io-channel-names =3D "buttons";
> +		keyup-threshold-microvolt =3D <1800000>;
> +		poll-interval =3D <100>;
> +
> +		button-esc {
> +			label =3D "esc";
> +			linux,code =3D <KEY_ESC>;
> +			press-threshold-microvolt =3D <1250000>;
> +		};
> +
> +		button-menu {
> +			label =3D "menu";
> +			linux,code =3D <KEY_MENU>;
> +			press-threshold-microvolt =3D <1600000>;
> +		};

[Severity: Medium]
Will this configuration cause the MENU button to be incorrectly registered =
as
an ESC button press?

The commit message states the MENU button generates 1400k =C2=B5V and the E=
SC
button generates 1100k =C2=B5V. Since the adc-keys driver computes the dist=
ance to
all thresholds and selects the closest one, a 1400mV physical signal is
closer to the ESC threshold (1250mV, a 150mV difference) than the MENU
threshold (1600mV, a 200mV difference).

Could these press-threshold-microvolt definitions be adjusted to ensure the
generated hardware voltage aligns accurately with its intended target?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702204628.2407=
308-2-coiaprant@gmail.com?part=3D3
