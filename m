Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989753;
	b=AEGN40ts73gJC4CP1CCXErnJYUJven740JBEf1L+Tb4FHGtsAHE+phAKpTiho/iXjSTU
	 sFtAvzS7uB+mGXlMd6ZR8sZ1Kv4WUVYd0X1TYM46/ikmmkzC4ysMo7Qsxxey1MDvKJ+tD
	 7nbyZBE6bf00JZOTE1fJ50zmQbM8XOX94btQcDvWOh36HjJp5N/xKYpmppbpeu9yV0zVm
	 G3B2DmYHwCRAT/3DduBQMJqiRdBehNu9+B5MHjKFOaYDZc2StcTCqITk0jWgD9xz/Ii0/
	 lU/eG+zZg7SeAyBcf+52iQ9fi0zFIFmZiaO8c90lBaGl3SUA/EdnQozawfMuCud00sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989753;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tZb+VEAvE1NVWkqLTB+Pv+ujogUaQ9kf9Y1tr+sFmxE=;
	b=fTWoeWW8/brOJmWj02hAG0xxfCE81ISgCIl+6yswVS5fmCA1F9OheGoca6n+WK7wAJqU
	 N6YGlAG2F3lp3x13GM7dbdzUQ9ZrXd8oU16Dh2wB7sUd/iaPzyWg9UYAkf8RPspVhqQWy
	 4b/4QJEF3hLhTYDU25NYZIDu3zkZxEMUOXq3mnf4C0bFrcUufao9CV0zpNcaFdYidYuk3
	 d176wN1Gi9zz+m3glPhEuR1eLhYxcQ+/7nEsJx3+S/Meof6JJrpJa3CUUbOcw3Myk45oK
	 wCMKI4O1I+QO2fQ+gwV0I5q5pWEyuG9Eqv9M3xoo6fOuMVb3MNDu4quGyYyndIkioVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCni0vk2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA089606A331
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCni0vk2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8231F000C5;
	Wed, 18 Nov 2026 08:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794989753;
	bh=tZb+VEAvE1NVWkqLTB+Pv+ujogUaQ9kf9Y1tr+sFmxE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VCni0vk2/vTiMTwLDIaNppsscWHH4QbKylZhjs/EyJWixaC+5ZPsZiJZ4KkoMWSoA
	 llsfWW6ORZrQ3PN4IeWSn1BMvTYkqHCdA+XmwJfC30Yzm/98KxWaWcVZyAMvBgk5dQ
	 eZckjgi5i2SbUhbCq993DcaRUDgp5lJFIc0ep8Z3Vcn8EuhmHljgvMAFmEbdllqSOq
	 fWr+EU0mB5hkwn1efSTcIDS3jmwwAg9z0PMF0sJ9gXxG3VEcSZKBYqpBhyOpmb4qcH
	 8hbr3vh8jsDzbUsdnscQSToFpdrLsZYb3hJWL3U/nP4QjHWVqDAZzHYPasYCvXBLT0
	 /hSE0rNCBMA8g==
Message-ID: <sashiko-outbox-220421@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Huang" <jackyhuang@nvidia.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <70ecd17b83b36e0010a7eec28006abe12bf26218.1794985308.git.jackyhuang@nvidia.com>
References: <cover.1794985308.git.jackyhuang@nvidia.com>
 <70ecd17b83b36e0010a7eec28006abe12bf26218.1794985308.git.jackyhuang@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:15:52 +0000
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
- [Medium] ARM: dts: aspeed: vr-c2-bmc mac2 pinctrl conflicts with gpio0
  mux pins
--

commit 4cbfcccc5efc804fc92f381f0fb03cf463f3ecec
Author: Jacky Huang <jackyhuang@nvidia.com>

ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC

This commit adds the device tree for the ASPEED AST2600 BMC on the NVIDIA
MGX Vera C2 server reference platform.

Link: https://www.nvidia.com/en-us/data-center/products/mgx/
Link: https://www.nvidia.com/en-us/data-center/vera-cpu/

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts
> new file mode 100644
> index 0000000000000..7239ebe99e418
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts

[ ... ]

> +&gpio0 {
> +	gpio-line-names =3D
> +		/* A0-A7 */
> +		"", "", "", "", "", "", "", "",
> +
> +		/* B0-B7 */
> +		"", "", "", "", "", "", "", "",
> +
> +		/* C0-C7 */
> +		"SGPIO_I2C_MUX_SEL-O",
> +		"", "", "", "", "", "", "",
> +
> +		/* D0-D7 */
> +		"", "", "",
> +		"UART1_MUX_SEL-O",

[ ... ]

> +/* NCSI MAC */
> +&mac2 {
> +	phy-mode =3D "rmii";
> +	pinctrl-0 =3D <&pinctrl_rmii3_default>;
> +	pinctrl-names =3D "default";
> +	use-ncsi;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Does pinctrl_rmii3_default on mac2 conflict with GPIOC0
(SGPIO_I2C_MUX_SEL-O) and GPIOD3 (UART1_MUX_SEL-O) on gpio0?

In drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c, the RMII3 pin group claims
balls H24 (GPIOC0 / RMII3RCLKO) and E26 (GPIOD3 / RMII3RXER):

drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:
	GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
	GROUP_DECL(NCSI3, J22, H22, H23, G23, F23, F26, F25, E26);

When mac2 probes, pinctrl_rmii3_default muxes H24 as the 50 MHz RMII3RCLKO
clock output and E26 as RMII3RXER, and because aspeed_g6_pinmux_ops sets
.strict =3D true, any GPIO request for GPIOC0 or GPIOD3 fails with -EINVAL
in pin_request().  Using pinctrl_ncsi3_default avoids claiming H24, though
E26 remains part of the NCSI3 group unless a pin group without RXER is
used.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794985308.gi=
t.jackyhuang@nvidia.com?part=3D2
