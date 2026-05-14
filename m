Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7CB3ACA7C
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778732192; cv=none; b=oZssGyDjcHOcbJfHmcfhBo0MTkqlqitgdlqUUKJAsCg/sT7G2AMPlASYYUKiwcvZWWEMxtvOeNbrfO9iefecL7s9TGAJWszFjOFWLmU2/VzTKg+Qcx8wM6fpW/+gK327X9JB0TQdoq3nExvJbicNuIPPDe1+50I20RDXuJ/xo+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778732192; c=relaxed/simple;
	bh=dEfafon3zqQ7+WNcIH62G8ogU315+gRbIBGrGthXwJU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=scPlyF4s2b1joUGTOMboXAhTtu2jlFqbxwpruGUX1IkMkTKckSlpiV7OG1hzowgdJRpbnMFDHatVl2IERHXn4PW6KwxOHGsvCKVvD7tOJH/gyGp2p/irdf1yesOIO3YZL+SuixO+h00qm3XGw2GodJzje6vyOcH+pdZCERUTKgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfJ66Lln; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfJ66Lln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F81C2BCB7;
	Thu, 14 May 2026 04:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778732192;
	bh=dEfafon3zqQ7+WNcIH62G8ogU315+gRbIBGrGthXwJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JfJ66LlnY2xjM8mL0JqANYRm6vMEjsY751Ssvr/rEeQQqDkZcFy44ZvkVRzq8u411
	 XKki51IGEBTdDkHjIn1BoQtVHsEOLmJpN8PogW/jP8C5ohj5uCYwzeKy4aFyrmu0W1
	 p2H+lVTnMRjscr+i+qgvSPZxYcuKvxfJwgB4mmbb9lClMzQqNdL9jykLhPS1cS/GV0
	 XMX5Z3KywbX+SUvDPZplXn1qIkJcLx0OKjS56j+dvNAtnzdkCuXZnK+JSZ7YKozAk4
	 Gp+bqoIuffQtwzEOkXCnVDR1t9ftrjkvN00O5XdcutcWURHNyVNLuxvSuv8DaoI/t+
	 0wAzASFppsLZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN
 on spi18
Reply-To: sashiko-reviews@lists.linux.dev
To: "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com>
References: <20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 04:16:31 +0000
Message-Id: <20260514041631.B8F81C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The fixed-clock node name 'can-clk' violates the devicetree schema =
and will cause a `dtbs_check` warning.
--

commit a4e072ba93299bc9cde800bbed0ba51dffbdac3a
Author: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on spi18

This commit enables the Microchip MCP2518FD CAN-FD controller on hamoa.
The controller is connected via SPI18 and uses a 40 MHz oscillator.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot=
/dts/qcom/hamoa-iot-evk.dts
> index 460f27dcd6f69..f260f23d2597a 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
[ ... ]
> @@ -29,6 +29,14 @@ backlight: backlight {
>  		pinctrl-names =3D "default";
>  	};
> =20
> +	clocks {
> +		mcp2518fd_osc: can-clk {

This isn't a bug, but will the node name can-clk violate the devicetree
schema for fixed clocks?

According to the fixed-clock devicetree binding schema, the preferred node
name format is clock-<freq>. Any node name that does not match this pattern
generates a validation warning during make dtbs_check.

Could this be named clock-40000000 instead to prevent validation warnings?

> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <40000000>;
> +			#clock-cells =3D <0>;
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-hamoa-spi-=
can-devicetree-v1-1-554a671a3789@oss.qualcomm.com?part=3D1
