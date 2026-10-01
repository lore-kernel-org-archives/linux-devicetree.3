Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C0B39FCDC
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871092; cv=none; b=lqLNj98nt6om8661UY2hQ8G+tc//qgNbpyAtAZH4yQrZ4ZenxTyihfpnzkAxAuHDW7ISBh4qJRmX9BtzK4m7TPHaOQotsZ5wblMmLXQxS5a7Un2s87f4LXT6nRH1q95EOVpBc0pRTlMkztWTCjb4W7c/vyr3DtQXSftQD0TFbEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871092; c=relaxed/simple;
	bh=XStV42dN90oncuZkgZa2fQZPOmDsXrGunS+USmh79ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J/tvZquS2y1d5MQRRAwi1xf/Zwe4MiDJVbtNk347M0/VMYtmYWQKPnvC0xzWEOxmA92b/TYYAmN2y5KasmF5K5VZp29x++01nEG2rAyOZKiIm1MYUfgYQWZhfOrsxuJPPche2wnEQhaEb+oHbbzCKLSJXDmtFkyCky6xiKnvA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjTMtZyP; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjTMtZyP"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so14782225e9.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790871089; x=1791475889; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIZGQQshvUma/6DcqkuS/JxSHm+uvQgTCEKSqUG/nes=;
        b=hjTMtZyPNrC9AiOfpgjwX5Hlf01tXJjC5l7KEa7AxrapcBvRkT26upJdJyj8Zwo6bo
         qw5t13nWSeWwqy6ew4W+HH9GbrhHBiczBml81YpgMTCS9pfBo5IIcV/NKO/EL+4EAHDf
         OU/OVxj+eguKad1Qoto7RrIMH5YKv/e5+gWOiwh9a/zr6eBv7780jJQ7BECEHLa0HkgO
         MaMOWc6kE7UqWE4+y4xnVdA3KAvZTbW33WjJ8TMNzZ9lvPCcGVDzP2BZlKqFN9NcOWUm
         RH5Ba9+YE0OlYYY0m1V0QQRJiTnRYVa2Z/eGtUQ5W7fVY3bHTeTTxjLvW/sfrK9Ukg98
         5n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871089; x=1791475889;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIZGQQshvUma/6DcqkuS/JxSHm+uvQgTCEKSqUG/nes=;
        b=A21/LgJt0EyQOM4+60iS7QIL/XXUPOK4YEoLQ6hNpKaL1IQQrawJm5BrEZI41RdHs9
         Yv1rpxFxYO9WT1s57VebEI7BP4szM3QzztzuOHGUCoEbO5fYvMHTJ8rs16R1ECPcuJgY
         LqDt8IXiP0AokKj/hvSZF8Xl9eyHexrFwu7oKGIxtr/GKawqFcsNBKETrgp5/euV7ygj
         bWAMrGe5AWs+6EdQob0g6n6qvaQSxmQmWoZcpqDzbSrRmiL1we2oDN0+SAwfyDcSRO33
         BfMg7o/Y1XqpwGD8mun4KTL5b4AhbHZsRMxuFCstrOHjKlYSJ0VnN44Q1yE5aXz/rd2A
         HI4w==
X-Forwarded-Encrypted: i=1; AKwUvBz7GoD3V64AtbFavTnQ+PnEzGZorSOjNkU4UcEwLoTKddAwIGD3FFqkAzvu9Mzr0U2xCfDW3RcwtMGh@vger.kernel.org
X-Gm-Message-State: AFuF++lvacgQ9H/88kZgbJ2mGAPw4HFIL94fGuWt0tOF7M6GEgx0hQBL
	3ItiYEApChL2JDHkWx6LxLpZNo25sa350bn49/KG9Z/itN6X2w/pGxUj
X-Gm-Gg: AYBFou2vEXPQu0SLASN99cZ+scsZGbFP5wNoN3r331JuhvRPZcW1nu/znUi83DNAJOw
	fbKkUUvttwo7B7yAu7SG+PQHcqdHY6f7CBMsRH7EzZ7bzu1waGMsHN6nTVNRQUZU1ZTYLlhfiqr
	ma5ftv1Ra3xvb0gvRMTX9gSZCcoLPkVhlaYZRU5UunvBFf06nziGFb6LezwkGDxcydrN8xwT4Fl
	iIlTE6enaoUZEA4WacEpVORgclt2o54W2rT/0DpuqhMR5wThtl4/0ilkESBcJ8KwxYpZuGFjg58
	KaFkTDhzm6bUuPb4RwG9Kil3vwX+rGgfdQfdxIuYguHqhkEe33cXJOD1VDzqdYQOX0aRoCbRq5b
	pzQ/ReFko4o/9x2oqSTQuYmzGjS40nuYRKmoxthgCvmbAZKt5jqjb4Je1ZaDO6RCm7abZpUFMiJ
	h5S+gvH8wCLGQ+p50gAlFIWg+Xq3D49vts52jbKiS/KJoiGI6iKefsezv1SodrVQH118e9+Yf5h
	auFPq1q2S8Hl9lHAiWgpE6YA2YSmg+ZZoFyu6DZsenZdcDWLmzLIAvRaR2yZMhksd2OaashTFA0
	dyV7UgNLId+mOSdIhKCTSX1KkI141hB2qWdEKsaa6RnhtozKDGz3it3We6cmFR9R57hIDygEDDa
	H8ATI91oTL6pDJoXJQfc9z5Q+1IJSjUz28qp2cSFgBm4kRSCRjv+ReDFYqjsjxzKvTgjI+zCnX5
	7HOa0EXNAhgwYr2dSQBF1KAYsm
X-Received: by 2002:a05:600c:354a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a027447475mr3271805e9.0.1790871087229;
        Thu, 01 Oct 2026 09:11:27 -0700 (PDT)
Received: from jernej-laptop.localnet (95-143-149-57.dynamic.telemach.net. [95.143.149.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6de18sm3629464f8f.44.2026.10.01.09.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:11:26 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject:
 Re: [PATCH v2] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
Date: Thu, 01 Oct 2026 18:11:25 +0200
Message-ID: <mSzGX1AcQ6yrkdDVueDg2Q@gmail.com>
In-Reply-To: <20260927200820.795348-1-olek2@wp.pl>
References: <20260927200820.795348-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

you mispelled "allwinner:" in subject.

Dne nedelja, 27. september 2026 ob 21:38:18 Srednjeevropski poletni =C4=8Da=
s je Aleksander Jan Bajkowski napisal(a):
> This patch adds support for Ethernet LEDs. Keep the default LED settings.

Reword message. "This patch" should be removed. Check other commits for exa=
mples.

Other than that, it looks ok.

Best regards,
Jernej

>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> Changes iv v2:
> - add defaullt-state property. Previously, the LEDs were dark by default.
> ---
>  .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> index 6e57ee19e799..c23315994799 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> @@ -7,6 +7,7 @@
> =20
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
> =20
>  / {
> @@ -132,6 +133,27 @@ &external_mdio {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
>  		reg =3D <1>;
> +
> +		leds {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			led@0 {
> +				reg =3D <0>;
> +				color =3D <LED_COLOR_ID_GREEN>;
> +				function =3D LED_FUNCTION_LAN;
> +				linux,default-trigger =3D "netdev";
> +				default-state =3D "keep";
> +			};
> +
> +			led@1 {
> +				reg =3D <1>;
> +				color =3D <LED_COLOR_ID_AMBER>;
> +				function =3D LED_FUNCTION_LAN;
> +				linux,default-trigger =3D "netdev";
> +				default-state =3D "keep";
> +			};
> +		};
>  	};
>  };
> =20
>=20




