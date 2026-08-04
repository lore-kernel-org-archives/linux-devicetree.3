Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC5837E2FC
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846897; cv=none; b=Mhfviadg61tBc5cwkzmgwOuD6P7RUZDJBR11ZH/S0RwVMGehRbbSpAD4Y66o4xMr73Wm2M0R87Y//UHCTcGhH5+zqBjqNlqlEmXmMlsNZEwUxfVrNsttYzG61bn+nQ3k/GIV9CctZRI0YDOd4tYD+HDRuoqFGHUhLsiw7Eaehcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846897; c=relaxed/simple;
	bh=jBd6++Fwomlb8MoyK4Uq8Btz4TR4JNSJqgKFhjhTB/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hvYSsYHVNVbDnzbJx25xekIDvrGE59N4pKYoMK1ANwV/iZrxVzmwCpdrvHqV/6ls57oVkSXo7pk208JQWfVR3vykgWb7Xnyc1DJhOvCeKVJLtBw2zFKmdDEEjP1GJAyD2n2O1sx5scJ/r3tqyBzcF4emEpCtW7oNf194m2SSvI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxVIyEGD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxVIyEGD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6DB1F000E9;
	Tue,  4 Aug 2026 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785846896;
	bh=yMe8vjn7tqqgOWDzaF2rHEyd44KhrcPP2DUxrujiyu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XxVIyEGDA5i6tmoHDGUDeCX4FisIWzvtMdwhifdTVQ+5VorHlrTYbLpMuDVWxrM8e
	 d0YZXwUf1lNslCDAYv9zd4vmy24OV/0PYz3fSdE2EczpX6q9ZyK3zbuXqzc2ruuNfq
	 eBEMvef5mJL5nJwhEG/Tq7MB7WFbrAvceqAPlbDy7vGJVekpvCHFTNgIYmX1RqP16z
	 jMXoQpuqyEJZh4Qfhl/GkT+PCxFgCIryUIJhjus5PJpTt8mLbI7sMBGA2DU8+Oyed4
	 ed9+v5caOdbj0CDNh5gE837EP/+fC5iBoswVbWWeVFcKWOhcvO8F3fpa+HYCYe2IKz
	 f2EVICNjTcU6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/17] ARM: dts: microchip: sama7d65: Add ADC node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804113338.261782-13-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
 <20260804113338.261782-13-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:34:54 +0000
Message-Id: <20260804123455.9D6DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `vddout25` regulator node uses a deprecated node name pattern (=
`fixed-regulator-vddout25`) that violates devicetree standards.
--

--- Patch [12]: [PATCH v5 12/17] ARM: dts: microchip: sama7d65: Add ADC nod=
e ---
commit 1acc23759ae718683d0ee0863abd37a91d3f243a
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

ARM: dts: microchip: sama7d65: Add ADC node

Add node for the ADC controller in sama7d65 SoC. Add the vddout25 fixed
regulator node which provides the 2.5V reference voltage for the ADC.

> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dt=
s/microchip/sama7d65.dtsi
> index dfac17e34e651..c35f27615bc49 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi

[ ... ]

> @@ -95,6 +96,15 @@ slow_xtal: clock-slowxtal {
>  		};
>  	};
> =20
> +	vddout25: fixed-regulator-vddout25 {

[Severity: Low]
Does this node name trigger dtbs_check warnings? The naming pattern
fixed-regulator-* falls under the deprecated path in fixed-regulator.yaml,
which prefers names matching ^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$.

> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VDDOUT25";
> +		regulator-min-microvolt =3D <2500000>;
> +		regulator-max-microvolt =3D <2500000>;
> +		regulator-boot-on;
> +		status =3D "disabled";
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804113338.2617=
82-1-varshini.rajendran@microchip.com?part=3D12
