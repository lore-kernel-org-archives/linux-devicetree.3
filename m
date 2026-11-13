Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551339;
	b=o0dgbzxQRSZkSuAg76/LPjlGpsXTqXzIJGx3ECavNCW0y77+86XNndmU0mn0pK65S7+/
	 J0NXx8R4TuK/nB8bbMXI4F519Z+2SAO8u15/BdZd0/xUi2vFbrqwSO+AKfB5R7FeA8cKM
	 6r/s309TN5M0xFj2m7d+6iOB1+jaqEAr45BWAT0Yl3mI+00xdEMf/0MZjte+Tbs08OYdf
	 h0aJFbAifSFDCOvTNngkQ58AcLvMQFQtk+WFRlFcbP4ao25Cdz0jf5CX/gijHYPnMSx7n
	 kFu7N/6b9F2RiRbjRnv6Y/ki8aJZrUcyF8BaO/415QTOaMxxv/ZRlrP2s5fNGdExq6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eMtI/QvyBu7WYuIQjEeNFc1ytajl1TcdksT1CryvP7Q=;
	b=FFg9gmBvfGn0J2baqo53fNT1I32F9i9vClf2GLWmw2GZo+Nv/PBTDipMSpD2TPHV0IRV
	 Q9wzps40LOCz/klf6LtqM+ZYXS5JTyzQhG3s4c6FI97Jsfd/XL+6cgZ82c0bJPcOaP1Cc
	 n6J/O1eMUpSAL1KJJ/f+lCnn4/vm95e9eK94Grdgk1d1d8aBk6xAhygqv3q2bw+cbchWQ
	 m9+4+xWJuEHr0147I3eBJWGFouSM2PpLx24GzdQHJv5YzXzq9bje+3ViKwl7yVA1UcoJw
	 J8PU/5k6s7nOQUCRNTcdeBn/6PV3ujHgHSP5+k1tCc2YD7gbFsPsZDQBQoF9m6ZbFvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cz+kn4Du;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D0B606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D0B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cz+kn4Du
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48fd2e38825so349670f8f.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551337; x=1795156137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMtI/QvyBu7WYuIQjEeNFc1ytajl1TcdksT1CryvP7Q=;
        b=cz+kn4DuwLvFxEnT1RdO8AR1F0oXhLYwqMLGi15pJafOa2ZLuQePGzmS7ybyfi+k4R
         WYiiGoHG3sb31cMtl1+ZxQbkXtMAi4UZF4EvnXICafNJ5fWBMHe5WQVzeeJICIx8nvsH
         LiOi25YLkt3ocFE/UzCKppsR+wA1Ug5dI7ymde9WPwJ/rIZEJ2Alei2RTLNgGDOgUOOA
         /k9+0wb46DDy97V5Idh86mkwudDy+7/Mqg42ecANFcVbDlMlQ3gtFoeW9H2Dr8MOqVv8
         XMiA3LXF49UOzeEfJnuFw3IdEUPHKbg0Jps4yu6DcRThZHDg5FpWnNmI7Efa2m/LQQuN
         h+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551337; x=1795156137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMtI/QvyBu7WYuIQjEeNFc1ytajl1TcdksT1CryvP7Q=;
        b=ouya5GJru+Z8xS79erJ2FeEUL7n40i3pMlwyxYlBuhdeyXLvk4a7bbOb7U1Wz9Rz1y
         l62jLSyucU6S/O+uRAZrwfTTSh32/gR5qDSZLYoIc3vVwk2RAtRT1AjJ9LNe2q2Dxb3Y
         N3ya4LoxZysvg3TcnbNxnHJWkKz8FueGVh2Ts4oBkraKkHRdvnDUGN0hYERzA0CfQV19
         0S+tGly97X9RJy0zzpkEHs2mG1B0qtUe60ivPptfVZaJWqG/94K2g6gIi/2gJJde0GMT
         DZugPHbZ8FDtNsxi6qDkbrNpBZnHUl5VkJYK7mAH9yzyHb90Wvp2GYz/LtMCuEzJVI8n
         QCgQ==
X-Forwarded-Encrypted: i=1; AL+hErFVUUxlfqEmbOoRA0WhmkYPRpM4xmo8sgqlzzOwvoiq5ipkoofoSv0xhRkM/TK5K3DFVBKoLoeKMXaW@vger.kernel.org
X-Gm-Message-State: APuU4Z+uSlv6dZRmtevba33RcQpu067L+IQ4M63gtHCGwMXCam8qnGUz
	LsvqDjmC64NVBySkNcZQUmXocYeZ42QhOZiTfgvlnILQyyQCFiR2TO+fx2V/gKncmJQ=
X-Gm-Gg: AYBFou03EhudpGeWiC+ZZAXCYQ2QloijS3yRDGjuxusMfyDdm0j+zhv743ZXvyKNXGG
	W1V8kgvGRAmMUHW9dyphorVwGIEL/XBe1F6RT5JudyWIoUC8poS17xb3VBUlliHRaahcPus/IEQ
	d4NivVHKXkYYB0uLFZIcnovTKlTbDmjHIWa5VkEY6BFo6gOrAS+MYY0lmRI53QVCGD70rhqC2Iz
	Pl4sMy7J6xJc+jFuNbvkO1L1qlYkSmRI7RYi+VDwLdA3y/ixL8A7n6ALBNjSQltHudbnsXDAs75
	za38ZVB/2hG9Fr2H/0HYO6uN/D1W0/JnYgBDFtCyc1O65RJqxF7Vn+Txv1ozkEhp/GCY7FvyOa2
	5kJ+3QntSkz79fCjokVnOKsOrzfeZnPhK+SaHjU7R2RHfouT5faH8xuDtKcL09jAkHFV8vlU+lc
	rVFYFJldFPHg9wphnYiMuarERh7QFDvVM3voMuI//upwoqAMqTm6o0WrwL1ZU0+ngHPIOiGlAGK
	gCQ4/T4BoH1yJDoDBCkZEzp7B2undEQP9k2wY+RXPXcJ9hr8rr9HBdt/odMv0a9LZqOQQ6sBiqa
	RPPNJaM+icCcRR5wNZvjQKJWAYmU+P7VynU54XrLKHYoj4V1skzVidPUjzpa3LS0OJVRvqJ8kg=
	=
X-Received: by 2002:a05:6000:2586:b0:48e:2f7e:bdbb with SMTP id ffacd0b85a97d-49c72c9c8b4mr3464138f8f.50.1794551337038;
        Thu, 12 Nov 2026 22:28:57 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c5fe373casm3174771f8f.30.2026.11.12.22.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:28:56 -0800 (PST)
Date: Fri, 13 Nov 2026 07:28:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] Input: keyboard: Add Nuvoton MA35D1 keypad driver
Message-ID: <avatz4Q8JbrAJNn_@monoceros>
References: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
 <20261110111419.89535-3-fyhsueh4linux@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2ifqpif6owwxnga"
Content-Disposition: inline
In-Reply-To: <20261110111419.89535-3-fyhsueh4linux@gmail.com>


--a2ifqpif6owwxnga
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 2/2] Input: keyboard: Add Nuvoton MA35D1 keypad driver
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 07:14:19PM +0800, Feng-Yi Hsueh wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as it introduces a bunch
of unneeded build dependencies. <linux/platform_device.h> is sufficient
to get of_device_id.

Best regards
Uwe

--a2ifqpif6owwxnga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2riMACgkQj4D7WH0S
/k6KPAf9EQ0HGivhdceUuk66CUKDwtvjh/7/jjrthGgkb+pdJryDbkedlXcCKjK9
b+TSwyp0Ij45TIIFMN/ZFfLea+1FM3nTPndVlZsIIDgJctKr0b9642hqhFrvkbPy
57e6YCZlJnH+P0baX7Z7JCgbPo34/RX6nn3dmY96cVDPx9nlO82bZlUKT0+O81nc
6nAdhy73QjVG7hEQYipP7SJUFRNOCOBxqjT4iIelWp8tvmFrMUdux3Yi2kmSL405
R0HXdDse9VWP/awUS/rl6ACGhds1ZJbh03SA5seeuZxX/6xVqbyap9pvvDIndv21
UM+9r6MVkXax2D6HXkYWSiATc2X9cQ==
=FoqO
-----END PGP SIGNATURE-----

--a2ifqpif6owwxnga--
