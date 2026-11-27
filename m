Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792875;
	b=zmhtjW86FXzId50Xk2e8DBTx+wrJRbx0/3dvqHr6M2JWKNnObtcGD0L3RAYe3Lto53xx
	 9Oek53zXQjBwIHpEDmiQ0d1HP4ealIlcfbm3d4xqnLoNenzJUAAraBUycUAbzssF+LeGb
	 x4M5RXaYov67xrDf4IvcHGdBdGXFk9MwLvU4sLpRz3rYYQiqHDdU116RF5uktMSPDeuGe
	 jvPxHtdUKQSA10lKw+OoKrd2kRdqt3wCaPEEjvQC4ZS96x0WvOJDjXwFYoaIYjwF+u7Hb
	 B5xhz0khGbnlhbIS64Ych1HD4PXDdsL+94CtggIoeuM9qsT55w62nZCBi+nhswpdXvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792875;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=i6mw9sdJNKc0bR6xeYzFhrtrP5H5/PZvSYQnf6nHX60=;
	b=KPadZei+FDvlfx/FjAF6YQ4rtZ2BhzSy3/w6bE9nPMMzNL3MCF2cXsed19UK5UDJVnTG
	 QxxnwjUSHZEO1luY0WZJ8p5zfP9IjB+n8WI8VfTgLDuTC4PGbrSVWq9A9C1tDo7U6jLg+
	 iZqmV3gpkxdxAe21HuxDe0CdKoKmvSjdiCLU5X6ccDssQsJch5L4TxA6npfPOboTYJUuS
	 kOtPvDGSLrh8SsF8oy8jhJkcwE4msVRevKWz3Xr+0b6gkzNQobsb2iayM6wY+wUq5GlVP
	 c0DohsyiWAgP5OiYvtDK7YW8jZp9WhK1xL/TSW0Z6T31sHHo1MBDdHzHB0EjhXAKLbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WgOMW7z6;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF0A606A31C;
	Fri, 27 Nov 2026 15:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF0A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WgOMW7z6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2F3D4C6223E;
	Fri, 27 Nov 2026 15:21:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59A9B6049C;
	Fri, 27 Nov 2026 15:21:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A220111E90BF7;
	Fri, 27 Nov 2026 16:21:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795792870; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i6mw9sdJNKc0bR6xeYzFhrtrP5H5/PZvSYQnf6nHX60=;
	b=WgOMW7z6/do/Zi5EXR/oDhIOSSEO+5LCxTfRQ3lwDO1YJaqa4aaS9ylzJVF42pURA4lJcC
	WOKBUGefVLV/Dhnsaa6YT6koMcqYMlHLaJ/xNsO4SlDYbg8o15tfrnTa65pIn+dvmDpDy4
	7wiM27MFSCZr3hrMTxGuaLZ7q0gOxCTt1Jb9TRHUnfIMjo5UobX6bm8uecdWps0W56Sv7Y
	eeSxm6sFkOo1CmFfsiSvB0FDeoRa3Wf+L1fOcXEYu40SOgwhCclI98Usaz8djWUiz/Epj0
	efiusozeU2fAGmI1E3F/9uShQJlVH9WlqnNwgMQbFd36HHOA6e6gPWtlpOgf2w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Georgi Valkov <gvalkov@gmail.com>, briannorris@chromium.org,
 johannes@sipsolutions.net, andrew@lunn.ch, krzk+dt@kernel.org
Cc: francesco@dolcini.it, johannes.berg@intel.com, kees@kernel.org,
 miriam.rachel.korenblit@intel.com, rongqianfeng@vivo.com,
 wenst@chromium.org, rafael.beims@toradex.com, avraham.stern@intel.com,
 error27@gmail.com, s.kerkmann@pengutronix.de,
 sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org,
 Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com,
 peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, gvalkov@gmail.com
Subject: Re: [PATCH v9 3/3] ARM: dts: armada: WRT3200ACM: add
 marvell,invalid-reg-hint-in-rom
In-Reply-To: <20260827175850.89395-3-gvalkov@gmail.com>
References: <20260827175850.89395-1-gvalkov@gmail.com>
 <20260827175850.89395-3-gvalkov@gmail.com>
Date: Fri, 27 Nov 2026 16:21:01 +0100
Message-ID: <87jyly1esi.fsf@BLaptop.bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Georgi,

> WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> from the mwifiex ROM, which conflicts with the platform regulatory
> configuration on units sold outside the US market. For example:
> - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
>
> When the system boots, it detects a conflict between the user selected
> region and the radios, e.g. BG FR US, and applies extreme restrictions,
> preventing phy0 from starting on any DFS channel. phy2 works.
>
> Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
> WRT3200ACM device-tree, which signals mwifiex that its regulatory
> hint from ROM conflicts with the platform and should be ignored, so the
> platform regulatory domain can be used. This does not allow the user to
> change the regulatory config of any radio. It only allows phy0 to start
> and operate according to its certified configuration. All radios in
> WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
> they are certified.
>
> On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
> partition, which is read-only: cert_region=3DEU modelNumber=3DWRT3200ACM-=
EU
>
> The Linux kernel sources do not have support for WRT32x. An equivalent
> patch for these routers has to be sent to OpenWrt.
>
> [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> [2] https://github.com/openwrt/openwrt/issues/9956

the binding and the driver was merged, let's apply the dt now

Applied on mvebu/dt

Thanks,

Gregory

>
> Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
> ---
>  arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arc=
h/arm/boot/dts/marvell/armada-385-linksys-rango.dts
> index 4ab45f294de2..2bf29981a031 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
> +++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
> @@ -165,6 +165,15 @@ &sdhci {
>  	wp-inverted;
>  	bus-width =3D <8>;
>  	status =3D "okay";
> +
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	wifi@1 {
> +		compatible =3D "marvell,sd8897";
> +		reg =3D <1>;
> +		marvell,invalid-reg-hint-in-rom;
> +	};
>  };
>=20=20
>  &usb3_1_vbus {
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
