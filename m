Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0C38F621
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778423962; cv=none; b=VGRuwbXYXPg5TJp5Acm/yH+QzmocdakbCGR3uR1jtSW83t07VPNR/BhD8PBWo5mgvByoTuiVScRxbx1u1MnMycgt9GHGNgpGKiEVeaCETk9qYJtImOWJPMfIgUZYaVusWJoDMoLL+SG8FGuzWzmvAPpCneeIT3GfrdQEOKzdTu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778423962; c=relaxed/simple;
	bh=DPz69dG2WKf8euz1EcuYAXv3m3RGGtTv0RTVAkcRGPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7BgQUNCGxk57v/SjwF2hYM8UDpJ5gAA/Xbg20iPKpce/c1XRLQBeGJXz+XMnPq27MQP/aLPyhv3N6NbHzU4qhbrQ05rORBUlV0TablsfC4Ct431qNZ3FMjn5rJp7GeO3boBM+mxikxgrF8LNDJkOSt/GS84YNZs1Ev8zOpbu+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADYAYEW5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADYAYEW5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891b0786beso22922515e9.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778423959; x=1779028759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWmgbjG7zGF24sa5WwQmGg6RVdKBUDJnnneFdOm7tsU=;
        b=ADYAYEW5GwfC7PbW6fV7gsRUQkdF60X6CDZkXCDJtMuWb/YyRYCKRdSr4LTZFN1IXi
         VxjbUS7yL5qhxfUUbslcn6yqpvAFlwSe6tdLUISJ9ftNCXZ8vZji5aUJ/rXB2AVjC16K
         np9FjoYc1iDkcix9T7FxYgFAqJx4E09L9GGSg4/9EXObSItelH6zjNW3dJQkMQYlHFdP
         Tz//Vfn+uja0Wp5T5FjxXsLBKWjxwgjIbQHchKkzcdhmDhUoi99dEYTB+FMYNgEtwxtO
         CK0vCG6Tj6aRPb7HrhmlmTDT5o1kUIUDS+ooPRrb3UnX4GYM9ds087khi56N5Jnv4pkk
         KQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778423959; x=1779028759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SWmgbjG7zGF24sa5WwQmGg6RVdKBUDJnnneFdOm7tsU=;
        b=qT8oPulJ+qvcVK5OA3WDQmcor/q5pCAii2fAk+n2kcF5YcI+tdHagalc0EBLQRMVeV
         8veAKJKbRQlq1WDjwKWc+Mzg5fbVFsawClBK5z7Xf78be/hinN2nCKk+BR7gyq9rlN4O
         Bnxizk4AYmENq8cZlDhe8G26EXUNchi7Nybh9NQ1+2fbeNAl1qMH1W+nW1AIS8TBSZx5
         zE9KWJFhfHF2lVegvuyO9dHy5ajld1n1elHNdh7/UvL8zmAXSeYVFDXIxzelkQ5N/yqO
         g5ILB4hthpkbU+2p6iylL790FTtP08W1v4YQadN0U/7tlrKr6KoNlG4X+cCsIQmn5rqa
         GDxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0XHLMbDkNPowjGOwKUnzsl2OWWQPoKvTeP+Xb8bHocnMmp5vThAfbCdSBVYklvul+VHXoaClZFftP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6DeVAvlR3CDvKBrInJWs5P6Tix83cLo5+U6WN1Ji3NXUS/oew
	Vx6VfRXPguYo3zn99Djw27A+xklCvgQY6DXrrFvVYPEXvO74c9RmUvvk
X-Gm-Gg: Acq92OGPVBKzqqUwqMEB452z1Ufa7SZUUH5lzHQcw1DsW3lPo2Vz8zuYgpnYokT7EvX
	7q2xBnZythAlZVME1VSw0b/48rST2LIZrFO59kHP9o2TzSMlxebe94pSzWLJjMYMNgpLHupgKk7
	dpbEU2lpamWd172ysY9rbra6GbR35yO2k4s8wTNT7PrcLY4i/72y3uFEFhlqBeIo2u2flDG5T2d
	k6gp2YCuEAnYOancebF3fDn7+jLES4WAEjN9Sq3ILChDJXr11tzdtZ/Xbvur2ci+Ua8QLnzGs0a
	tdTEkYxi6sfsu6J65+FQ6mToUxH1u0aOSh0dmj3Z973wT4N/fKtIPT0OfoO/l0OmFST/sUjvFXO
	Jl76bjtZs8IYpIGkWQ4wRlt5YxkyDlXoJvLitzGs4Dm+q3iE/oRthdfbgc/GvOC2C9aIX3axDNg
	PMyqVjK2J5ovcDeZ4AhoONKoQ8JSiMQjuITX07kfdspfNJihJBiie6WYPSNcjrez1nBpjw6dTyo
	AofqRCoux5ekvO/gQ==
X-Received: by 2002:a05:600c:696:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-48e51e215a4mr187215675e9.10.1778423959237;
        Sun, 10 May 2026 07:39:19 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c79fsm20097047f8f.15.2026.05.10.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 07:39:18 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a523: add gpadc node
Date: Sun, 10 May 2026 16:39:17 +0200
Message-ID: <U0YLqOw4SGiAdV7UGlJ3wQ@gmail.com>
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
References:
 <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
 <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 10. maj 2026 ob 14:57:24 Srednjeevropski poletni =C4=8Das je M=
ichal Piekos napisal(a):
> Describe high speed timer block on Allwinner D1S-T113.

Above line doesn't make much sense.

Best regards,
Jernej

>=20
> Tested on Radxa Cubie A5E:
> - 2 connected channels are showing voltages in agreement with
>   schematics.
>         BOOT-SEL-ADC ~500mV
>         BOM-ADC ~1800mV
> - 3rd channel exposed on 40pin header is showing correct voltages when
>   connected to known voltage source.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 5afa8d92acbf..f6c5cae5b23a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -340,6 +340,18 @@ ledc: led-controller@2008000 {
>  			status =3D "disabled";
>  		};
> =20
> +		gpadc: adc@2009000 {
> +			compatible =3D "allwinner,sun55i-a523-gpadc",
> +				     "allwinner,sun20i-d1-gpadc";
> +			reg =3D <0x2009000 0x400>;
> +			clocks =3D <&ccu CLK_BUS_GPADC0>, <&ccu CLK_GPADC0>;
> +			clock-names =3D "bus", "mod";
> +			resets =3D <&ccu RST_BUS_GPADC0>;
> +			interrupts =3D <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
> +			#io-channel-cells =3D <1>;
> +		};
> +
>  		wdt: watchdog@2050000 {
>  			compatible =3D "allwinner,sun55i-a523-wdt";
>  			reg =3D <0x2050000 0x20>;
>=20
>=20




