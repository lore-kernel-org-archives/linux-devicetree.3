Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F0C44065B
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 22:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787264209; cv=none; b=YJsBtz8CgNiMonSJhwW3uxH00aLRF24e6zm9i3cjkOMkROF/G/vNFXfVFEQsisLoVAFy2Yl41p51uuWrWpnN3TGih/N3kxOkW3V7Fae+YdtorqHYKsql8uLB7TSurHuhhEgCDhaqhEyBCN2haJBzLcjpWuY5yI9efUwJKHD8wJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787264209; c=relaxed/simple;
	bh=rcMS70gAgjsAsbntnKBQSiwc25CURkdiMf7L4kxotSA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QEEwx3XxyL0CANlb9KgONUwtYoOb2foSa/le70ouOKkDElLzbVuoZxNO6ZrW4lRgjJLnBaKHFtZP1UHlMzIXPKnnPHE81L8AWXElpOqPbgEtQCES1ElrZKMZJW1Sa5OyGd+4112dUccButDIHfIpeiA/pVL+8prQK19uWZRATqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcrxmErb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcrxmErb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5861F000E9;
	Thu, 20 Aug 2026 22:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787264207;
	bh=iXZbbhmTMC9UD347I0IP0oWcneULIp7QhLryKFFYupo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kcrxmErbnWR6xEI2jSK6DD86ha++2Bp6xQ/P4jTUcyH2pNR1cGOdySAVOnWFfBupi
	 7gM9Ioh/qy3VkIKiQ/z2Pn02ugJOg+pjwzvsTmYsVyDhdf2SXH1fudzRjxYpPk30wF
	 DpSrX+mX6ZycI5qfyHijCBrduepKky5JjJ7ZlqSm9Gv8/UAI3S72EBFm2+TU/RP1Cq
	 qNP1RJDAKznpMt4x92NtpykN33ml4XYrFv9c1B4T/Q8rXeQdHMyLtj3yp1OnpXOGfz
	 50eCHEIGjdbWVAo5u6T6Si0nGRJlSAJTzP9nh3lDa2KWmpL4ZY4WwgPjOkiXpjkSO7
	 Qz9IHpXNMtFNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: ti: k3-am62d2-evm: add out-band-wakeup
 property to m_can devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kendall Willis" <k-willis@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260820-smth-v1-4-e1738a38d58e@ti.com>
References: <20260820-smth-v1-0-e1738a38d58e@ti.com>
 <20260820-smth-v1-4-e1738a38d58e@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 22:16:46 +0000
Message-Id: <20260820221647.2A5861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `out-band-wakeup` device tree property is added to `m_can` d=
evices, but no C code in the kernel parses this property, making it complet=
ely inert. The commit message states this property is intended to allow the=
 `out_band_wakeup` flag to be enabled during suspend. However, an exhaustiv=
e search of the kernel source confirms the string `"out-band-wakeup"` is no=
t present in any C code, nor is it documented in the DT bindings. Neither t=
he generic driver core nor the `m_can` driver reads this property or calls =
`device_set_out_band_wakeup()`. As a result, `dev->power.out_band_wakeup` w=
ill remain false, and the intended out-of-band wakeup functionality will no=
t operate.
--

--- Patch [4]: [PATCH 4/4] arm64: dts: ti: k3-am62d2-evm: add out-band-wake=
up property to m_can devices ---
commit 7f02e9c8c4b2476d4793985a8f2b56891c451cf2
Author: Kendall Willis <k-willis@ti.com>

arm64: dts: ti: k3-am62d2-evm: add out-band-wakeup property to m_can devices

This commit adds the out-band-wakeup property to the mcu_mcan0 and mcu_mcan1
nodes in the k3-am62d2-evm device tree. It intends to enable the
out_band_wakeup flag during suspend for these devices.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/d=
ts/ti/k3-am62d2-evm.dts
> index f5ceb6a1b5deb..7f3c50a56ea87 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -789,6 +789,7 @@ &c7x_0 {
>  };
> =20
>  &mcu_mcan0 {
> +	out-band-wakeup;

[Severity: Medium]
Is the "out-band-wakeup" property actually parsed by the kernel?

Looking through the kernel source, there doesn't appear to be any C code
that parses the "out-band-wakeup" string, nor does it seem to be documented
in the DT bindings.

Neither the generic driver core nor the m_can driver appears to read this
property or call device_set_out_band_wakeup(), which would leave
dev->power.out_band_wakeup as false and prevent the intended out-of-band
wakeup functionality from operating.

Does this patch rely on another driver change that hasn't been merged yet?

>  	pinctrl-names =3D "default", "wakeup";
>  	pinctrl-0 =3D <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default=
>;
>  	pinctrl-1 =3D <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;

[ ... ]

> @@ -800,6 +801,7 @@ &mcu_mcan0 {
>  };
> =20
>  &mcu_mcan1 {
> +	out-band-wakeup;

[Severity: Medium]
Will this face the same issue where the property is ignored by the kernel?

>  	pinctrl-names =3D "default", "wakeup";
>  	pinctrl-0 =3D <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default=
>;
>  	pinctrl-1 =3D <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-smth-v1-0-=
e1738a38d58e@ti.com?part=3D4
