Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8AB423A83
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457457; cv=none; b=LX5tKtfxrSNFAarNr8DSlmuk4FNJeHMQogLjjD3D4hoyJoAVgtUR5Nnz1brDhfBqbH8Vo7hmhASAl8NI7lj8gtJJL27MqteLpROXpPUPObwsGTIHaf2HKBxGD/MxdLY9Lij2WlNSdVRgUBHVByBH+v6ET+pBZJMJigXLjsULfys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457457; c=relaxed/simple;
	bh=Tg/ebQThtUbEgHr7yF9oxT9oIdE7HpVt+TKVyWq9HXs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FZnGP+BZf0pW1cfiJLybKj9Pi4NWi6cpyLhwtN95SxW/kG0D4o/JEpRbR3TPPw8qmzmB9KkoOVPLei6g7fKsWu8mzqPw9EP8EPRmSx5qhdc6pb7mJIoGfu+Nvgcepr4MER2PmEAn1f4BKBNHGv7klm4GfVHGq6hMNG5JL0iiv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6Ul/IW7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6Ul/IW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00021F000E9;
	Fri, 22 May 2026 13:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779457449;
	bh=QZ383/L+ZkvQ+FEK0ezuklSx7sgD9z5JSV9k79tLkRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N6Ul/IW763OlmrJV7g/cNv6CAvCmLV+q7Aj34ZtT0laOmpUX93yt8BlCgIbo1MYVV
	 tqcYfn8OKWWAlAH5XaXM68MPTfl31GR6nV0J1h8FeRNfhJqleQAj0n85bsUd6uez5a
	 q8bwtjlwVW7eJMq4MkLQv6Fk5EvcIyBtmmIR7YGYz7DljZaAjZAbMls12D2qMxFGEy
	 Y03qBy0SwuGqVSAbz/GprBafY8uCeKUVclkOcQbsZlQsAdWcoPEvBhh2DngDXQa1dH
	 qhZWYf20rlX9pQphoF9HVj5Mcyo/dHBc+C7PFuk988c0umjG577Y/SSLaROdoHWRRO
	 gh3vM5FY7dDQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/11] arm64: dts: ti: k3-am62-verdin: Add Toradex
 Capacitive Touch Display 7" DSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522132014.226721-19-ivitro@gmail.com>
References: <20260522132014.226721-19-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 13:44:08 +0000
Message-Id: <20260522134408.E00021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The ILI2132 touchscreen interrupt `TOUCH_INT#` is configured to tr=
igger on a rising edge (`IRQ_TYPE_EDGE_RISING`), which is incorrect for an =
active-low signal.
--

commit 19d0e0e35f5e02a5ec8add36ff8be23133d5e81b
Author: Vitor Soares <vitor.soares@toradex.com>

arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 7" DSI

This commit adds a device tree overlay for the Toradex Capacitive Touch Dis=
play
7" DSI on the Verdin DSI_1 interface. The display uses a Texas Instruments
SN65DSI83 bridge and an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-displa=
y-adapter/

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch=
-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-ds=
i.dtso
> new file mode 100644
> index 0000000000000..0fa8306324b38
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dt=
so
[ ... ]
> +	touch@41 {
> +		compatible =3D "ilitek,ili2132";
> +		reg =3D <0x41>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_dsi1_int>, <&pinctrl_i2s_2_bclk_gpio>;
> +		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
> +		interrupt-parent =3D <&main_gpio1>;
> +		interrupts =3D <49 IRQ_TYPE_EDGE_RISING>;

[Severity: High]
Does this interrupt configuration match the hardware signal?

The comment identifies the signal as TOUCH_INT#, where the # suffix typical=
ly
denotes an active-low signal. However, it is configured here to trigger on
a rising edge.

For an active-low signal, a rising edge occurs when the touch controller
releases the interrupt line rather than when it asserts it. This might resu=
lt
in dropped touch events or an unresponsive touch input.

Should this be configured as IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_EDGE_FALLING
instead?

> +		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
> +		reset-gpios =3D <&main_gpio0 35 GPIO_ACTIVE_LOW>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522132014.2267=
21-13-ivitro@gmail.com?part=3D6
