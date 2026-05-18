Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057D3277007
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116240; cv=none; b=Z9TNp222q3KB5Az6HqNDa+9kqk48c7q/hGU+Yr7MIGNZS4T0ZvsKUBqbuJXvo2PQw6HEkWVQSaE2gGrSvxlGONik5GEuUOEd302cXN7dqZrftRjGib0roxZ6D6/TO0ExhiwAMv0IX+3qEMA4+zgBVzF5ppFpWGCnr6q73K9VgAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116240; c=relaxed/simple;
	bh=cm1DehLuu5EcbT8j5KOdVZAvP7cgGRccZ1kzoENS7M0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZuRU5wM3LSAzW1KMlUdeiQluu4wn+FxmZ5mY4/WsBoXh/zGOIJM98W20aDmpL/PSjI47DGVyCiyNimgePWj+sVUrsbx7STn2A1wU/Egt/dF/P49KUtU6gQB2axQ7sQGSglRTT4f8KP+CEzPA+AyPCbXHC3kLgGMIurpWSoCfSE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U71l7eC8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U71l7eC8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B48C2BCB7;
	Mon, 18 May 2026 14:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116239;
	bh=cm1DehLuu5EcbT8j5KOdVZAvP7cgGRccZ1kzoENS7M0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=U71l7eC863Ps1/WYaRbmeqjDgOSdDGfTeK9d0Q84T78xt8gNcGBQLwnOZwKYLTuj4
	 pkOYSXkylr2M6SeASZF+ZDHDlBK9vsTvE3ALuhpEWCwxhQRDbLrJVctvgVJnl2rVMB
	 zgE7l8MIi3Xx6Zj6Vf/zu0066NyaPqNurezNIir/XP7R7moTHMqhFc2RVRqLcnZMnk
	 zOu0zQKUlqUV1ZMxyy/GnrLOxrBbrmzjJapGJN94PqGp1AZt4J/LVW52U4o4pZ0ZQw
	 SPvPANNnlsjMWJBw6wCaJg+ocMioZm9E4Il8IStChUPn2Iw7Wzvara/sLg/7kriQNv
	 XjjL2iGjC0xRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/15] arm64: dts: st: add CAN1 support on stm32mp25
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518143150.3138712-4-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-4-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 14:57:19 +0000
Message-Id: <20260518145719.84B48C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `m_can1` device tree node is missing the `resets` property.
--

commit 9a45deb755da217a14f0986f9795adff2ebdf1f4
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

arm64: dts: st: add CAN1 support on stm32mp25

This commit adds device tree support for the CAN1 controller on the stm32mp=
25
platform. It configures the necessary memory regions, interrupts, clocks,
access controllers, and power domains for the bosch,m_can compatible node.

> diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts=
/st/stm32mp253.dtsi
> index eeceb086252bf..d5871203ccb01 100644
> --- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
> @@ -43,6 +43,21 @@ &optee {
>  };
> =20
>  &rifsc {
> +	m_can1: can@402d0000 {
> +		compatible =3D "bosch,m_can";
> +		reg =3D <0x402d0000 0x400>, <0x40310000 0xd50>;
> +		reg-names =3D "m_can", "message_ram";
> +		interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names =3D "int0", "int1";
> +		clocks =3D <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
> +		clock-names =3D "hclk", "cclk";
> +		bosch,mram-cfg =3D <0x0 0 0 32 0 0 2 2>;
> +		access-controllers =3D <&rifsc 56>;
> +		power-domains =3D <&CLUSTER_PD>;

Should this node include the resets property?

The STM32MP25 RCC bindings define a dedicated hardware reset line for the
FDCAN block. While the generic bosch,m_can driver can fall back to a
software reset when the resets property is omitted, the STM32MP architecture
relies on the hardware reset to guarantee a pristine state.

Could omitting the resets property prevent the driver from acquiring the
hardware reset line and lead to unpredictable initialization failures if
the hardware is left in a fault state after bootloader execution, kexec,
or a warm reboot?

> +		status =3D "disabled";
> +	};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518143150.3138=
712-1-dario.binacchi@amarulasolutions.com?part=3D3
