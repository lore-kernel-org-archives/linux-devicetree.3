Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327076;
	b=Y6kEiMjivDflVn7CABNYIgYEKN5C0E44qrcYTy7L0QACHrtDQ8aZMNjp9zHu9yqKZos5
	 rowb/tPS/fy9xaMAhxsw8DSWcwfzLBhq6AMGGGJmATMVTNzM6QyW1YuH1P89RtilsMkpj
	 7C9QJ/pgZSRXDJGofHMwQVzuyobCHROnwn5AN96X86nx27hZSZy0Cc4PfCEds15Iha3t9
	 5VqkDkMRRZFXwBpnPkq56HbfbgVEqsobL17pgSKyWBspZ+5oVq89s/R2t7l54dObUOZz+
	 6gcjNthBnWLzaUVKnMss2Coy9139N57QJgxo7A5JgEiIWD+gn9KsSma34Pjs8YBYEmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=f6FXAOsuB/cuM2Q90beDrqDYRqrVlTbOMRM4fnMO4jY=;
	b=aFx84EJr3sTbmmDAA6FuObKPpCloOggp6zYuDPxw9uUS+3xhwreH/8w7tWz/U3RukvHT
	 bO2vDgi+CEFNtY0TxUhjVTESh7VYku4ww/Dholt0Kw0Ull2ufLTWpq+EE5yGNqe+hyxcY
	 YJpLE3bV/JrnWKurp1na/2ykHtw+dsYqP3IcSuXBQRpIWr8oBs8g77p6MfyEZc+xQBmGN
	 U+X2FqGaZ58R4tep9FdiYY3aDuXZuhZWV1h+Ubw0FMbQlTHACxFt8UvPLbPQwZe2EmnSI
	 1Te5jDP2ocBeFdVC3g4nawTpLgucIEChkzkSflQ+44aY4WloE97AxDBy/sLRySg+j5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J4SrHFcv;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78109606D7AB
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78109606D7AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J4SrHFcv
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4395d31228so298141966b.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327075; x=1794931875; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f6FXAOsuB/cuM2Q90beDrqDYRqrVlTbOMRM4fnMO4jY=;
        b=J4SrHFcvYJY0x+2aU3MDU0d6pzy/8p9BDg0oQhVlmvOZPdw2nqZpZJTnT8h1mslc38
         yAKt/YNbPeoeHCWvXu6tO+1eCwOEJF0TOGWDff4cz1LdNAn7Vrxg3Jh78MKy+IedJg9b
         oRb+Bo59J/WjA5QVCwyVvZ4q8bdCYW2A2MsvA2GCXucCM+0p7WEE+8sWVn5MtsNqANJ6
         qAGikGd8WhGUal8D2NNHSLgocbJv53jUdXtNYspydGIp28CNXGBgZPB4B1xVeu6NK0ww
         R+bClDI1VyrF46DZo7ZM5YHeMvI15A5Xc6ImgaVv5MpX6+O4f+kSfe6mxAzAJ41kPXi2
         pHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327075; x=1794931875;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6FXAOsuB/cuM2Q90beDrqDYRqrVlTbOMRM4fnMO4jY=;
        b=LYTScXoUU617f96CYw7uejNPtdEcLvYlNxXDwqDN4Y/U+4JV3FoORkcwonZsbUVZd7
         hxhbk6d2+ZF1oegrld0H/pWyninaLJrjB5xBNgNSqxABnVJKl1CYHPTRnvpVoxuRb5r+
         H5hfQa9tztoBsAKypUKw11OlFeOJPcS2e4JeacPvWXtwkU5uxfhKf6L9+nlz6daEP8It
         v6Xf9lFbGouZdLgUA0UmoDo+J7FZi2caj6OzdvRBdPIgde2dKtWP/D922rryumt7JuTX
         cs9cqwSp/SfLjjyG1kJNs4q6ybYW/3GflfU1AWnLPAo9kptoyInS7lqBIWCIMy9duPgX
         Ic9g==
X-Gm-Message-State: APuU4Z8qigz+kdFOfFX4n7ywpwOtjPrmh6PsOPL2heiFud/KZE4Bo5bF
	YRtTqUUjeMI8ug3RdJ1AbEqnG7WAuaWSP9fb024AakFOr1OteZ83nk6f
X-Gm-Gg: AYBFou3PRghFUyHVCscGOjaHgxnXt7vW9w6Ba8qdFmoWo7XFg5fCfWqeLAN2h3zaSfS
	j0HNPTJYI2f9Pnc542XUR6FNerLkRjXSHg6KHJq1dIyzWCG6lbdAmnjPBdjgpyRBwSgYTQj3byH
	QrIT0yiV9lHk4qvt744kua6LnI7NlGYHZ85W2xXCSqWnd+Cl4IPASvP+CqVYRK9uCYPW8ZYh56T
	de06lQ3bPloXIOSLfJvNV6TwWclbID1IEmoBa9+51zJ8jrDbKZByBXPY3WCmkHJnew8we+uZxIW
	kYnqBuRzd1RV3V2kWA+syihDEVxXn+34A2RphcNJfVEEaywABJjoIKhC0ZFaYHnz6LHU3NZXSMW
	k/3OrsQCKYil2px/XB8MmAH8xPfjd8b5Cnjr8w/EMogcaHMuSmND9FcEVJN402SfIekP3FVAHfR
	p/6pxLO22rYu6/XRjAPMCxOSNNX9Mshg1jnG/2wDIIJpqcKH7yOCqYOUTwCO8FdLKfedXGcVdBy
	Ka11OR68lFXVx7/e29Xi+V04zaTEytCxoOtHaPOKJEafiFDPmXtLQkkioAerGeTYWxlqkzAsoMA
	stqLKB5SWpXBe+Iohleny4kVMfKKsvyCm1utRy1ycUhOCE9yLKJc5/cfouRU2CxyU3taM2G0NQ4
	6dvwFHgx/PSrQR4h5CmyVPubBYxGX+BCGB+yy+L5hJsjfo/XfOyPnC3E1JWCZmWXL4bFRGKm2G/
	DZe2wT04st5oEDEc1WhVZ209pd6KILGU06IQQfbmBkOlVbWO2mSUTztHmulM0uzyjysv9ZtQmrL
	qpBBFcJ6yKmJHLt+QgzGUmMChSnBkzH2IAL+FBRJRUhD+Fg6kJi5T8Xb0hT0cXNBz88YgjQFv6b
	0CpmDtmI
X-Received: by 2002:a17:907:3da8:b0:c2e:3ed7:7db4 with SMTP id a640c23a62f3a-c5049540483mr285400966b.23.1794327074616;
        Tue, 10 Nov 2026 08:11:14 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a591485sm127282366b.32.2026.11.10.08.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:11:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>,
 Andre Przywara <andre.przywara@arm.com>, aiyengar1990@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH 8/8] arm64: dts: allwinner: orangepi-zero2: Add i2c aliases
Date: Tue, 10 Nov 2026 17:11:12 +0100
Message-ID: <ekjxzCRpRcWPwcDw_lDV4g@gmail.com>
In-Reply-To: <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com>
References:
 <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
 <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com>
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

Dne torek, 10. november 2026 ob 06:37:02 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The I2C core numbers adapters after the "i2cN" aliases and hands out
> dynamic numbers, in probe order, to adapters without one. The Orange Pi
> Zero2 DT has no i2c aliases, so a TWI controller enabled by an overlay
> for the header pins gets whatever number is free when it probes: TWI3
> on header pins 3 and 5 does not show up as /dev/i2c-3, and the number
> changes with the set of enabled buses. The vendor manual and the
> vendor BSP name the buses after the controller.
>=20
> Pin the numbering as the vendor BSP does: i2c0 to i2c4 are TWI0 to
> TWI4, i2c5 is R_TWI. Disabled controllers get no adapter, so nothing
> changes for buses that stay off.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

NAK.=20

Extension connector is not covered by board DT. Use overlays
if you want to use them.

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 9 +++++++=
++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index d5d39bac5915..98fc83291dc8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -12,6 +12,15 @@
>  / {
>  	model =3D "OrangePi Zero2";
>  	compatible =3D "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
> +
> +	aliases {
> +		i2c0 =3D &i2c0;
> +		i2c1 =3D &i2c1;
> +		i2c2 =3D &i2c2;
> +		i2c3 =3D &i2c3;
> +		i2c4 =3D &i2c4;
> +		i2c5 =3D &r_i2c;
> +	};
>  };
> =20
>  &cpu0 {
>=20
>=20




