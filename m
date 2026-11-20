Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175213;
	b=vQ/QKDpUnl5n1DhREPwlZeTBL6ebMx2/0d2scLkwwW3HMU7ItZXOrKGp56TQrhPMGfnA
	 tNAYg7vLbgMXEjmdqfwzZL5lc7eeZH9UEp9n11KLoC7hdQ/qBnZh07l3TvARkeg565LpO
	 Jel4/yqyL/MTNkIvNTPi4R56ZOJpSiGmQtkHJk1LJ+GXG/1GM0uFw/Fxa/1W+UdwqKlJJ
	 lRIdphpMEnNTucpyg8u+BH51Xrqqaf1d8EnfZSKcLh91U8dUzQODE4Z4z0N1OSubdV6UZ
	 AeArjughKCyUvjgf4NZeqIS/RlEFDQijf/azMTljIox7GHBsreRuZObLkBVEI9+Yc/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175213;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=w5sZtHrnionc1ubz+wnLrxSH4AVC+4Px/QXb4L1EsWU=;
	b=2hlwxXGxsllMf5Kppsl0dg2cmhMGldin+qffRDwWVyvnCfDRZgGwTwlu2DYaRF/HS1ZG
	 kGBCSd0nquaM8jEzEkgyU8dGz/URYxXDfHWsn6dkcQ/NTKFW6eAUuR35HzBjFaXi6GA18
	 dHYHccmT8UlSJMJFEkju/AfKqkAMV5EDNh3Po+x64+EySt5mJM9nCa+sjSIqdZIfUojUH
	 GWAWoiYP+odFHdx/WE7BPUZP1rFDUGO/NBDg6hJrV8l6XHvtIyrjKhyCAaeAMWEBVGNe3
	 5VSNVaHEmpKidD1+hBCzQpuWREnoj48lAaX7Zwwo8EKQc3IGRpNwir4wy5RyliVBCGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbbIA7Nm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B2E606AA48
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbbIA7Nm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB8B1F000C0;
	Fri, 20 Nov 2026 11:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175212;
	bh=w5sZtHrnionc1ubz+wnLrxSH4AVC+4Px/QXb4L1EsWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VbbIA7Nmj2xSqDtVWoBwrMaGUHSIMhlV4LNb4/qxdWPdCqMmCl2XDn899+4zLzisH
	 GZlBfitSuTMBxBaxuUR2mSEAmjxb73SICuHO3+1BGd1Ws0rNMScn7CU/1vMicMJlVv
	 tgM0Xwx8fCRplBSPSceoXWrtsVrEe0JnZ9LXK/qR4x4jXYpDWE68vtwz+3RwJHY9G5
	 x7maag1OZYGLvBfbsTLyCow6div9aU71SaKwkVosLu8l2/kq60nTfKbHPkCWoeqXKF
	 L/Jmjiywavoz3CCqPrkWGFM+A2w4bkrUillDujsnUe9wGqLcw6OgEvBpvGRaa9bxFq
	 9E6sbgU5g2t7A==
Message-ID: <sashiko-outbox-225096@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3568-rock-3b: describe the
 Ethernet PHY LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: MidG971 <midgy971@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120113555.1402132-1-midgy971@gmail.com>
References: <20261120113555.1402132-1-midgy971@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:46:52 +0000
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
- [Low] arm64: dts: rockchip: under-indented leds nodes in
  rk3568-rock-3b.dts
--

commit 0800df3a997571bcce7adee9bf91cb1d76d2c711
Author: Midgy BALON <midgy971@gmail.com>

arm64: dts: rockchip: rk3568-rock-3b: describe the Ethernet PHY LEDs

This commit adds leds child subnodes to the rgmii_phy0 and rgmii_phy1
Ethernet PHY nodes on the Radxa ROCK 3B to describe the amber and green
RJ45 jack LEDs.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64=
/boot/dts/rockchip/rk3568-rock-3b.dts
> index b9f09087b1766..5fb8b9e9b104b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> @@ -580,6 +580,22 @@ rgmii_phy0: ethernet-phy@1 {
>  		reset-assert-us =3D <20000>;
>  		reset-deassert-us =3D <50000>;
>  		reset-gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
> +	leds {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		led@0 {
> +			reg =3D <0>;
> +			color =3D <LED_COLOR_ID_AMBER>;
> +			function =3D LED_FUNCTION_LAN;
> +		};
> +
> +		led@1 {
> +			reg =3D <1>;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			function =3D LED_FUNCTION_LAN;
> +		};
> +	};
>  	};
>  };
> =20
> @@ -590,6 +606,22 @@ rgmii_phy1: ethernet-phy@1 {
>  		reset-assert-us =3D <20000>;
>  		reset-deassert-us =3D <50000>;
>  		reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> +	leds {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		led@0 {
> +			reg =3D <0>;
> +			color =3D <LED_COLOR_ID_AMBER>;
> +			function =3D LED_FUNCTION_LAN;
> +		};
> +
> +		led@1 {
> +			reg =3D <1>;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			function =3D LED_FUNCTION_LAN;
> +		};
> +	};
>  	};
>  };

[Severity: Low]
This isn't a bug, but both leds child subnodes in rgmii_phy0 and
rgmii_phy1 are indented by one tab instead of two (aligning with the
enclosing ethernet-phy@1 nodes) and lack a blank line after reset-gpios,
contrary to Documentation/devicetree/bindings/dts-coding-style.rst.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120113555.1402=
132-1-midgy971@gmail.com?part=3D1
