Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ABC3B895D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784925602; cv=none; b=V8RB8W8XuB97mUs26LAWJnnA2Vl9iPO8/w3bg/aLnPkz1NlN8JCOZ4t9m248B5zwaq0KArpf51QWDXqaucOy1sFr6kFob97dEk8rty8r13agT+OOjE/yZoIZFohJUHWp2O173W0S2+xeZ1on/vmhB64NPZn95ohdqjglwvITbDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784925602; c=relaxed/simple;
	bh=J25tfR2jl8BtuszLGRuRGqcF4wRxqe5QR6XjmUJDRik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VEyzrbu6qE2mmGM9ptkFteKR5V3MW3LSIflxTC6aMkfC5AfOKg0aJGmullAEmgxHTmHMM3nEAaODX/iU58W2SYmDKOaX4Y7K+Hx6QuL+t4XylAambnmbTYjhWmnFZlcdUVJHP3cMoWP5MU6/pwFwBRkjtusnyDN3eWl98yQygHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgirL/o8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgirL/o8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E310C1F000E9;
	Fri, 24 Jul 2026 20:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784925599;
	bh=KKuSR3N92iBABJI/X0mrdfnxye3FgyDAyadTA0gqTcQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cgirL/o8Zqi/dXVDX+Me77rfL+CH7snjiK0N0EDqIEzpu7B5LVsDJR2PLEBJAMGBv
	 BsJ/a2cCm7cWIK2B9jtyCVDmRvNKHfzM6oU7IOaWZaba5zQrg4AWOgxFmT9LIUCefR
	 eq4XSEoEKLQ/0WlM9X7dOI3NePHps5QokYZ8nfJplqzvu+7uPHWkDjx19OK9j7yXoS
	 veGIt6PXGjG7ivfYb7EZyHNDIyLBA80Z8nefiyi2kVeN9X1zDLC4+8E90FIPP6d/ht
	 Jed6b3b5g3rDC4KFjSkTNF64MB0MtAuyHQD9KjF+SV6vT1V4kQ9tJbYDalX2DXoVfQ
	 6XL7XFgFjlR/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-j722s-evm: Switch audio codec
 clock from audio_refclk1 to external clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jared McArthur" <j-mcarthur@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724203250.1914444-1-j-mcarthur@ti.com>
References: <20260724203250.1914444-1-j-mcarthur@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 20:39:58 +0000
Message-Id: <20260724203958.E310C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added fixed-clock node uses a deprecated node naming patt=
ern ('lmk6x-clk') that violates the DT schema and will trigger a dtbs_check=
 warning.
--

--- Patch [1]: [PATCH 1/1] arm64: dts: ti: k3-j722s-evm: Switch audio codec=
 clock from audio_refclk1 to external clock ---
commit c8ef761411b785637994e6693649d427a93a0d25
Author: Jared McArthur <j-mcarthur@ti.com>

arm64: dts: ti: k3-j722s-evm: Switch audio codec clock from audio_refclk1 t=
o external clock

This patch switches the audio codec's MCLK source on J722SXH01EVM boards fr=
om
the 96MHz AUDIO_EXT_REFCLK1 to a 12.288MHz external oscillator. It adds a n=
ew
fixed clock node for the oscillator and removes the pinmuxing and clock mux=
ing
for the old audio_refclk1.

> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dt=
s/ti/k3-j722s-evm.dts
> index e66330c71593a..e796784e5fd27 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
[ ... ]
> @@ -162,6 +162,12 @@ vsys_io_1v2: regulator-vsys-io-1v2 {
>  		regulator-boot-on;
>  	};
> =20
> +	lmk6x_clk: lmk6x-clk {

[Severity: Low]
Does this node name trigger a dtbs_check warning? It looks like lmk6x-clk
violates the preferred DT schema naming pattern for fixed clocks.
Would something like clock-12288000 or clock-lmk6x be better to avoid
validation warnings?

> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <12288000>;
> +		#clock-cells =3D <0>;
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724203250.1914=
444-1-j-mcarthur@ti.com?part=3D1
