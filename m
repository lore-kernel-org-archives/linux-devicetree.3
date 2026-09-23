Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D9C53A397
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192402; cv=none; b=deC9SbiLDTeT111XKN3/gINoyT0zuquD5IOrUmS4YMzxA2NQGKVdqw1GZsAKnmD+QpGu+3D+YlCd4tf6haNvN8SduHH4n+RAP8DJjbbTQZf+Dzi6huW13UXrhiE90ueaoYcWwvlJTtdhHlsV4OnuAWvdJf0yif5uFQYK5q0KD50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192402; c=relaxed/simple;
	bh=HgLOhvdawnP4XhrridZyPRbqRyxnQGHPFHszvicM6Nw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iWvnpGNM/mXF1aAiDWs3XDHEVuhCh4dEAA0cnt7HaIEljgko9mOvFZ67bC0Zcc6O0h7Y7QNya8FxsEd/uMeisiE0Suxj5n+2bfyD4ABEnfXN5jwUwv8LT+FR8or7PCnMKf/NPQpzaMapgcjh13FONy+fkVbkrjEsbGkJowkDONk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVwfovaL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVwfovaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE94D1F000FF;
	Wed, 23 Sep 2026 19:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790192401;
	bh=TzuSvCAl0f08OJ2GOCY3/xrgxy2szK/GBR1ZffvwHzk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MVwfovaLIdsiFN7qLjC5cuAElQ5nH5VGfbLuwKNVPpdSzyG+ZAtUDJBxZr4Bih4ND
	 9HkM1tn4P07JEdxSLtyxCV5kR8CEYJTG6F+26nrc6EqHHfjxi8WOJRW1FH4f+qis7z
	 1eaHteJzKpxjtVe3O5IflarP7m6onBbyO1XoQlfhr2InBR1B/lQbW6AkIhg5n3q6x2
	 N1MVMKpSHvjTgund6YRtsvhbnJOB/8FxdmVz3AKoPYO+o8jtjp26fwX0rIiMZwr2hD
	 LOKXTByybjs/f/zsEve0PsUkoJ9SjUQg9Iqe1WJf79Tl0hEzw1FYwGATAdWk9d2jTZ
	 PCsCvndstObEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swamil Jain" <s-jain1@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923192643.1362891-3-s-jain1@ti.com>
References: <20260923192643.1362891-1-s-jain1@ti.com>
 <20260923192643.1362891-3-s-jain1@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 19:40:00 +0000
Message-Id: <20260923194000.DE94D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dts: missing reset-gpios in sii9022 HDMI bridge node
- [Medium] dts: unmanaged VOUT0_FET_SEL0 multiplexer signal
--

commit 4ee6007c0b1e46ee93bc1bd222e57649c25a3e88
Author: Devarsh Thakkar <devarsht@ti.com>

arm64: dts: ti: k3-am62l3-evm: Add HDMI support

Add the SII9022 HDMI bridge and HDMI connector nodes, along with the
DPI pinmux configuration connecting VOUT0 to the bridge. Enable the DSS
and hook up its DPI output port to the SII9022 bridge input, and the
bridge output to the HDMI connector.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/d=
ts/ti/k3-am62l3-evm.dts
> index 84a0cfaaf196a..8ff7c4baaadba 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts

[ ... ]

> @@ -192,6 +208,41 @@ exp2: gpio@23 {
>  		bootph-all;
>  	};
> =20
> +	sii9022: bridge-hdmi@3b {
> +		compatible =3D "sil,sii9022";
> +		reg =3D <0x3b>;
> +		interrupt-parent =3D <&exp1>;
> +		interrupts =3D <20 IRQ_TYPE_EDGE_FALLING>;

[Severity: Medium]
The exp2 IO expander defines GPIO_HDMI_RSTn on this board, which defaults t=
o a
high-impedance input on power-up. Should this node define the reset-gpios
property to map and drive that line?

Without explicitly mapping and driving this line via reset-gpios, the HDMI
bridge may remain in reset or an undefined state. This could prevent the dr=
iver
from satisfying the hardware's reset timing requirements, potentially causi=
ng
I2C probe failures or non-functional HDMI output.

> +		#sound-dai-cells =3D <0>;
> +		sil,i2s-data-lanes =3D < 0 >;
> +		bootph-all;

[ ... ]

> @@ -221,6 +272,41 @@ usb_con_hs: endpoint {
>  };
> =20
>  &pmx0 {
> +	dpi_pins_default: dpi-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 1) /* (L20) GPMC0_CSn0.VOUT0_VSYNC */
> +			AM62LX_IOPAD(0x00dc, PIN_OUTPUT, 1) /* (N21) GPMC0_WPn.VOUT0_HSYNC */

[ ... ]

> +			AM62LX_IOPAD(0x00ec, PIN_INPUT,  5) /* (M23) GPMC0_CSn2.VOUT0_EXTPCLK=
IN */
> +		>;
> +		bootph-all;
> +	};

[Severity: Medium]
The exp2 IO expander defines a VOUT0_FET_SEL0 signal, which controls the FET
switch for routing the DSS VOUT0/DPI signals on the board. Should this patch
configure that pin (e.g., via a gpio-hog or within a display controller nod=
e)?

Since the TCA6424 IO expander defaults to high-impedance inputs, the FET sw=
itch
is currently left unmanaged. If the default or floating hardware state does=
 not
route the signals to the HDMI bridge, the hardware path is physically
disconnected and the display will remain blank despite software succeeding.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923192643.1362=
891-1-s-jain1@ti.com?part=3D2
