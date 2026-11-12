Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510552;
	b=f3C59enx2DQTXxPZMH8aI3K2W8srNNlf9BjaQobCTYlxl/j+2kAas5OKbegRBa/JdPa4
	 ORZLfqTDSzfuNsqDcfy4Fc8lpUV9BQjosNWsd/zNqUL1av2eMjlqlCCq46yesEBm8g7Iv
	 ohamMFw5jytQlC5IMysQLk7eAUz0uBPg5mRKFr3kbmHrTARh+1CATNXQnB4jVpdxvBuxZ
	 LyRJFk8nm17C5a0cgmvQSYR6CjwJe8zXILjR0fXQX+RubzrR17xIqBJZW/FJ2ku1091LQ
	 22Kuasq2yjgWp+UMmmkWdVE5n5rHKU5DMZVI6KCOP3ZO6aO6O8DKVlCXXvCH3IUfuHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510552;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y2xPM2XVCT64KK0CDfSnJ9WlN5sUY0jq77ETjPOo0NU=;
	b=YwSP4cqzkMrTIaYf6QybhP61KYPHzeknWVc9eiXn7V69k09TFqJ9DJIShIXcU2Tb9E9K
	 BHErzjcLz9jvaSLjTDikJx0Zt93F3aJGOIjx2EzomcVgDG6ba3ci426wWQ2Gg77nrZ9xT
	 B1aS8PQV8DUmV4JYq1Ubu4Q+ptdjEcisyUoh6ZF92HE8W2QNbkXrBpWYZd5wTCkP2INTf
	 7CbRIluUsrCQQmNgmXeBxytxWqUG8jRBd2/MDqKaCJmAT/nCk6Y7xw5IdsZswkZ4VRFag
	 WqdtHuyeyiI1pzyJ8C8oC1Y6OJmNshOEpI8Bm7CcJaZ/XmfZqF46ywbww0Ax7yAScxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SbijF8gl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1292A606A32D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SbijF8gl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805A51F000C4;
	Thu, 12 Nov 2026 19:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794510551;
	bh=y2xPM2XVCT64KK0CDfSnJ9WlN5sUY0jq77ETjPOo0NU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SbijF8gli4P2zbxeZA22aZoV+Qg26/AZ/5r9huWwuRaKa8+tGm4LMGmC9rnFwyiEY
	 /TEihGUTabniWQMzGVoyO9QOECNq3FDSa3j/Guud7CtkCTedGxfXGFPXKSneb9M65D
	 IRr3+wXJ6dpeaKDLuMk51FDcdaD6Z0mDFD1vQq/OnBxSP5reSCSgwjP7aFyEgd4bm4
	 hycw/q6bLSU79kEdeK2U5MjYyvuj9cLwLYuWDu4GwWrwo9GN/1h6hQcp6+M1Igc2Ox
	 HuN/pEmvItFUtzB5xWGBT3cEgtGNmTgOHqWMq5272ZvLmlhrsPXsY+W035i0s8DTPR
	 Gh6GdZGKDWctQ==
Message-ID: <sashiko-outbox-211747@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.au@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com>
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:09:11 +0000
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
- [Medium] arm64: dts: renesas: rzg3l-smarc-som: no-op UHS pinctrl
  switch on sdhi2
--

commit fa36790e3b28d4844cd7f51756a420dcdb4538ff
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

This commit adds pin control and device tree nodes to enable SDHI2 on the
RZ/G3L SMARC EVK platform when the SW_SD2_EN macro is set.

> diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3l-smarc-som.dtsi
> index f6f4eed9a2ea6..e8fc9cddf288f 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

[ ... ]

> @@ -330,6 +331,74 @@ sd0-data {
>  			power-source =3D <1800>;
>  		};
>  	};
> +
> +	sdhi2_pins: sd2 {
> +		sd2-cd {
> +			pinmux =3D <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_CD */
> +		};
> +
> +		sd2-clk {
> +			pinmux =3D <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_CLK */
> +			power-source =3D <3300>;
> +		};
> +
> +		sd2-cmd {
> +			pinmux =3D <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_CMD */
> +			input-enable;
> +			power-source =3D <3300>;
> +		};
> +
> +		sd2-data {
> +			pinmux =3D <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_DAT0 */
> +				 <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT1 */
> +				 <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT2 */
> +				 <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT3 */
> +			input-enable;
> +			power-source =3D <3300>;
> +		};
> +
> +		sd2-iovs {
> +			pinmux =3D <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_IOVS */
> +		};
> +
> +		sd2-pwen {
> +			pinmux =3D <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
> +		};
> +	};
> +
> +	sdhi2_pins_uhs: sd2-uhs {
> +		sd2-cd {
> +			pinmux =3D <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_CD */
> +		};
> +
> +		sd2-clk {
> +			pinmux =3D <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_CLK */
> +			power-source =3D <1800>;
> +		};
> +
> +		sd2-cmd {
> +			pinmux =3D <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_CMD */
> +			input-enable;
> +			power-source =3D <1800>;
> +		};
> +
> +		sd2-data {
> +			pinmux =3D <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_DAT0 */
> +				 <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT1 */
> +				 <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT2 */
> +				 <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT3 */
> +			input-enable;
> +			power-source =3D <1800>;
> +		};
> +
> +		sd2-iovs {
> +			pinmux =3D <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_IOVS */
> +		};
> +
> +		sd2-pwen {
> +			pinmux =3D <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
> +		};
> +	};
>  };

[Severity: Medium]
Does switching sdhi2 between sdhi2_pins and sdhi2_pins_uhs write any hardwa=
re
pinctrl registers for the sd2 pins?

sdhi2_pins and sdhi2_pins_uhs differ only by power-source (<3300> vs <1800>=
),
and neither specifies drive-strength-microamp. In r9a08g046_variable_pin_cf=
g,
those pins use software power-source tracking instead of a hardware
power-output-control register:

drivers/pinctrl/renesas/pinctrl-rzg2l.c:r9a08g046_variable_pin_cfg[] =3D {
    ...
	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG3L_MPXED_PIN_FUNCS(B)),
	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CF=
G_IEN),
    ...
};

drivers/pinctrl/renesas/pinctrl-rzg2l.c:rzg2l_set_power_source() {
    ...
	if (caps & PIN_CFG_SOFT_PS) {
		pctrl->settings[pin].power_source =3D ps;
		return 0;
	}
    ...
}

When renesas_sdhi_start_signal_voltage_switch() selects state_uhs,
rzg2l_set_power_source() only updates pctrl->settings[pin].power_source in
memory and returns 0 without writing any pinctrl register while the internal
regulator switches the external signal voltage.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-sdhi_rzg3l=
-v1-0-ca30b209615d@bp.renesas.com?part=3D3
