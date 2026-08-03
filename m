Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FC52BEFEF
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779484; cv=none; b=dCcyaA9cYNa9cBMBAHq2e2dzQMWeh7lrk0fCNwPikMh9pX4xRRuQfvqrj4xLEvVdF5j70D1U79ewfGdMvp7TW2azcvlJ9ekKBCTmuoo9LOnUChLcVVVl5q3qAMldZkRH1End+qETRXlbjENhSESZLcqk8yjFiZIwMtCuMtcSL90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779484; c=relaxed/simple;
	bh=Q1lrKPWgTfcx9C8v4ltXr/dj9ltdDQK09rXbfi5WRAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b6bsOPKfxAb4GlGO5hqGHf/F5hzF7LpCSGwJUBOly7WVlaL5ZDGUyN72exJxLZ0mShE+rx9EYHLnUSvQZwKhEj+3hgV3YzxPXAJwvqBy5zZkxW33DGEJ2syLbHoU6Ebbsx92yPxWvWZXlsP0LX2tr1Rsndw+hnnZlxGMKdpww/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVdF7PdN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVdF7PdN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C37F1F000E9;
	Mon,  3 Aug 2026 17:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785779482;
	bh=Q95jlY9WlwhZX/qIgLy5GhiMudi9WCE2eFiSwWepEjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gVdF7PdN14QoFYSGxO4cxnPobJY0BBwCn9BxcEv3+CNpfjXaOqZGgao1CmJvtlOko
	 ctYw7euActP1J0L2awfZNKVyntfy7msbzVdkvw2O3OUqPLuVL+U3gC/2Tjb7orcuxY
	 YKyKYZqU7dFg+Ps/Lo3z3ZEColZlhWmysHBNdnYieiZ61GVfTB+IiZduMP2UbgCvgQ
	 XhDuqLMnE0d465/oMliUSlYC+I+qySWA6cKUlc0gaBAmZ4e6rDkBKG1GZVANc2TJWA
	 NANTkdoE3dNFo+AUv2EuoGCdX/vW1lVMEfvUGkpAcGs30YfCIl3lvXtmFX1TzTc4HT
	 6AAS4CDe20MzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leonardo Costa" <leoreis.costa@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260803173705.2268792-2-leoreis.costa@gmail.com>
References: <20260803173705.2268792-1-leoreis.costa@gmail.com>
 <20260803173705.2268792-2-leoreis.costa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 17:51:21 +0000
Message-Id: <20260803175122.2C37F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string 'ilitek,ili251x' is not documented in any dev=
ice tree binding schema.
--

--- Patch [1]: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI =
to LVDS adapter with the 10.1" V2 display ---
commit 73e2dedf7bdfd04739a496a9f0ff1282f074c0ec
Author: Leonardo Costa <leonardo.costa@toradex.com>

arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with the 10=
.1" V2 display

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 panel with an
ILITEK ILI251x capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-a=
dapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-101inch-lvds

[ ... ]

> diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-c=
ap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2=
-panel-cap-touch-10inch.dtso
> new file mode 100644
> index 0000000000000..834f23e75cbc3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touc=
h-10inch.dtso

[ ... ]

> +&i2c_dsi_0 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;

[ ... ]

> +	touchscreen@41 {
> +		compatible =3D "ilitek,ili251x";

[Severity: Low]
Is this compatible string documented in a device tree binding schema?=20

It appears that "ilitek,ili251x" is missing from the binding documentation,
which causes dtbs_check warnings during the build.

> +		reg =3D <0x41>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_gpio_17_dsi_1>, <&pinctrl_gpio_18_dsi_1>;
> +		/* Aquila GPIO_17_DSI_1 (AQUILA B42) */
> +		interrupt-parent =3D <&main_gpio0>;
> +		interrupts =3D <12 IRQ_TYPE_EDGE_RISING>;
> +		/* Aquila GPIO_18_DSI_1 (AQUILA B43) */
> +		reset-gpios =3D <&main_gpio0 31 GPIO_ACTIVE_LOW>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803173705.2268=
792-2-leoreis.costa@gmail.com?part=3D1
