Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933479;
	b=LP55xqhjZljDXx1vW/OaCW62nG3jq8iVQaPlZCetehjreEaNDNrzu7UwM8hAwa/YmAZR
	 e88+C5q8Sm42sCY+uYWIsprizpoM1GF+8wPGEAbLSDewEIKJ85p8vs5LOnEhsx+p3ErIS
	 TkVA6+Nm5KHepjfEsZxJEEiK6OxUWG/gt/HNlU5W6iFmFblsTr27vdE86PytQsOUt27yM
	 mm3h2yU/f+pMjhUmptLuFMSIvGCoooq389zok10CHyL8grNPQ1yoFOTqBmDnNPkOIHBNh
	 3hmPvgKNU2lrCXu+bOATFmoiz2vaNOAdJP+zen4jVSs5M/AuMU3WywHuYQQanwWL2Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=LBXiyQLy540aAEPtNSta6m8Ru37kUuPxCoM4iwVRxzo=;
	b=Z1F5IGgYx7z0nqYZXaQ64wJmNnr0z6ZKmG+OIzospKlAJRx5p1MlS4Xa4mgHm00yGm66
	 TdeEgjZmXxcJ7Xyc/IEc5WJKmjI2tH44m6/R1NGXle1PytqEfyTdzTYyANzCiYji4TVzA
	 RGMkEioDlcJJQI4nvCtIMu4NvBohxMMSQa6F9N8fECwgzGS1S6S3rNOASH7nkDA2wUNQk
	 zxTL8XipmjmkY1JlG3W4dppGCvQC5I8MFrcx3aXqlxJwee99j+WWwzbn/oi5pjJcmgzUW
	 cPGzjr0Q8sbPkmR01L3Qi0AXenKQOSGDj9stH19MbklYd6E3agHJhyZTMNuUPT2AqRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pu3VmwTq;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15CF606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15CF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pu3VmwTq
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so441495e9.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933477; x=1795538277; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBXiyQLy540aAEPtNSta6m8Ru37kUuPxCoM4iwVRxzo=;
        b=pu3VmwTqFXhXYIDXsNaxCSy2vpYd9ciqG5Qt6dHE2Y2iR7/QaBDmkG/QTiFKGORlFx
         vqaM505zEUTVNdgUH0LU4JJws9coXoENjeKKMkD3MxzCaus/FtSRCBebHbbVFHUbQ3NY
         lTE0McxpDzkmZpIAdJsN7CLilTT6N+3D1lBEO5IgnIL/fFgVIxMBzPJI7JG+LayPWBCg
         yHBPIjvajNZflGZLp7AKQYkrz4fswYvH2Pn+VA0+HvVvks/z8zY5yLeQKJD/ntVHGb3e
         6v7zd2i/9US6SuQ4swNUiAicqOqhNHYyaa++H1uCpZXYMAE/V3RGOs5x5cKKwLbADWJK
         8gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933477; x=1795538277;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBXiyQLy540aAEPtNSta6m8Ru37kUuPxCoM4iwVRxzo=;
        b=xTIx69+/qkaf34Kx6EyHC0VUQDT42rW/jnHx+gO9aOUZ6EvoMuvVpQh2eadM/yZALK
         oUptGf8D1ETtqaIXNOnNyVZMFNdSLuXCwLO8kgnRSh0vDJqcoAtiFqS7mNwBpg0eM5JS
         gcDdIzbPM5t5Ba2IUayrYuYqKj6J81T6NjCxObWoT2r0krc4Fj/S6zeuhIbIBOIPQGhx
         WruLvQPJgRlkuMapAZ10dCah+68jZ5JpCgQ7Wzv7sP3vbG8tmtQ2b6G9TIgaAWeTKG+0
         xckb1O3kk5/x+4446DgOzEEUdWY/PbH1a4GZ507umytCPlQ+XcSxqyg1oG6go8fG6p+o
         yO/g==
X-Forwarded-Encrypted: i=1; AL+hErEmk1ZkoztUXSEw8AsxtUvniBz4u6HHlYQRhgWrJz6kLeXoQ3GSUhWP3VBS2jfgV0diJ81fU6V8HDGe@vger.kernel.org
X-Gm-Message-State: APuU4Z+SsPQzkdSuW+/6WENnrToP0Y/qvrF6mfB1EZlycqWZVXtxJkNw
	BjM1QfHGyKzi4Xu8n9jP0/j1omSJun4Iq0k5xx1xfNVKmu9ClsJODiw0
X-Gm-Gg: AYBFou39HUZmP/KGQ9/mHw2S+qafRKP1I5e3AX3r0acxjaowTxFz1ZOQznFYew8k967
	TN3MDYDWw1sp08HS0S3ffP5zrDT3lrhtHj69/qzc1f1dbDorR6dQcZz9qwMsWJy2/4TVL3p8nLH
	QmXYWFPeZJH0efnx37OqVj1do72D4mR3czdZR5GKZfR34DGvQ4p9Bb3anxT678zJ61S9NeIKBz6
	iZ9svypwhG9zrV2pUYuJaS3TIaDztXoSHzO2uymYvyAeJ+9JzQvotpIu1QRSYdImZC8FCn00eOw
	xgZlF+bRT137PkGISQPaMU/JinlBnt8dns1UrajcPnV++Cs5bRenKAv/PIUNv2z/kH9SXvBcnd2
	uXrcX//jbbQzQvr9lhX3lB8mfgv77tpnf/bfY1hB6vV4UtVA9KrycdZVK8uzsUqKFb8n1UP4hkS
	e1IdnkUtW2pAxG7LutgP31Q/WKWFPsJMSGxM1SEWx+oLPODC0k0btNZtbA4VKibeflc0NPbeqIK
	5O5QYbPkD6QSx3A+qRgr5w3VPsbfsYG5xY2tTaYVUOhNHO94xoxnFESybucYoztHdh6HMcxM5nZ
	riWz2oOFUb7GpIYCaAkxEaAbz2i0L1294VaU9hEUf0+48qmPlqAARoy344j2Ne080uqaCiR/dLk
	7VfPjA8ULRmgwSYcKFysKxNfRVj98GtiH+JxOlifIPanst869VXfqc4vdAN/x8sqIGb819IBc/J
	ul0rhq9z0/c+ORiQt2elSbTg/nRd+0qawz3ZZEGzd6OcEAkhUlJ12+lAmMd7PTbHB/BDhVLSr9g
	0cGE0cVv5qiFd0opo4JJv/I19rLD3pFp0uqGP8hOlMp7x2d4TKIGqMfv5BygekuqGAt
X-Received: by 2002:a05:600c:a0b:b0:4bb:6847:7927 with SMTP id 5b1f17b1804b1-4bb68477b90mr206657185e9.7.1794933477039;
        Tue, 17 Nov 2026 08:37:57 -0800 (PST)
Received: from jernej-laptop.localnet (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm29882037f8f.6.2026.11.17.08.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:37:56 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Jun Yan <jerrysteve1101@gmail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: h6: taiqicat-a01: Enable Ethernet
Date: Tue, 17 Nov 2026 17:37:55 +0100
Message-ID: <n0Gb_HzYRTi_JMXR8vuZwg@gmail.com>
In-Reply-To: <20261117142122.246986-1-jerrysteve1101@gmail.com>
References: <20261117142122.246986-1-jerrysteve1101@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 17. november 2026 ob 15:21:21 Srednjeevropski standardni =C4=8Da=
s je Jun Yan napisal(a):
> The TaiqiCat A01 has a 100 Mbit/s Ethernet port, which uses the EPHY
> integrated into the co-packaged AC200 of the Allwinner H6 SoC.
>=20
> The AC200 derives its 24 MHz reference clock from PWM1, so enable the
> PWM controller and the pwm-clock node that supplies it. Also enable
> I2C3, over which the AC200 is accessed, and describe the AC200 EPHY
> package on the EMAC MDIO bus, with the EMAC operating in RMII mode.
>=20
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> ---
> The AC200 MFD and EPHY drivers/bindings and the sun50i-h6.dtsi AC200
> description this depends on are already merged in sunxi/dt-for-7.5.
> ---
>  .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> index 225f42bd3b9e..9b192caeecb2 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> @@ -14,6 +14,7 @@ / {
>  	compatible =3D "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
> =20
>  	aliases {
> +		ethernet0 =3D &emac;
>  		ethernet1 =3D &sdio_wifi;
>  		serial0 =3D &uart0;
>  	};
> @@ -87,6 +88,10 @@ wifi_pwrseq: wifi-pwrseq {
>  	};
>  };
> =20
> +&ac200_clk {
> +	status =3D "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply =3D <&reg_dcdca>;
>  };
> @@ -107,6 +112,14 @@ &ehci3 {
>  	status =3D "okay";
>  };
> =20
> +&emac {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&rmii_pins>;
> +	phy-mode =3D "rmii";
> +	phy-handle =3D <&ac200_ephy>;
> +	status =3D "okay";
> +};
> +
>  &gpu {
>  	mali-supply =3D <&reg_dcdcc>;
>  	status =3D "okay";
> @@ -123,6 +136,29 @@ hdmi_out_con: endpoint {
>  	};
>  };
> =20
> +&i2c3 {
> +	status =3D "okay";
> +};
> +
> +&mdio {
> +	ethernet-phy-package@1 {
> +		compatible =3D "x-powers,ac200-ephy-package";
> +		reg =3D <1>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		vcc-supply =3D <&reg_aldo2>;
> +		nvmem-cells =3D <&ephy_calibration>;
> +		nvmem-cell-names =3D "configuration";
> +		x-powers,ac200 =3D <&ac200>;
> +		x-powers,xmii-rx-clock-inverted;
> +
> +		ac200_ephy: ethernet-phy@1 {
> +			compatible =3D "ethernet-phy-id0044.1400";
> +			reg =3D <1>;
> +		};
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply =3D <&reg_cldo1>;
>  	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> @@ -173,6 +209,10 @@ &pio {
>  	vcc-pg-supply =3D <&reg_bldo3>;
>  };
> =20
> +&pwm {
> +	status =3D "okay";
> +};
> +
>  &r_i2c {
>  	status =3D "okay";
> =20
>=20




