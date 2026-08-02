Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EA6489898
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 22:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785709051; cv=none; b=CdU/5Lyrj/K8RqeKDX5A2WhY58Ep56dDuwfMx4Ft+cYwO+D6eZbuvltXCd2H+L0jPSgsT4l9owDnu0RqII31fym/xplcvPutflOBWYgpnCuhz4eVpDf3HzaNW28ayndDYaYf4+MjMP2xlLBoeuOKI5+ixcDgP+tcHUdHs2MZK2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785709051; c=relaxed/simple;
	bh=T8GIVGVx3IVGy3cz7RX/iIVlyqRH0fdXuqZLWkXg95I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5qKK8cJBc9vnnvjF/w39yoqBm4VaEw9H63GCLJHn8FPALNvJ8DG0m/BrEwH2NB33IEgKpftc9SWLPXEzGJUjvASpVuooUk967n/f8t1vjBUf0yFvtWLy7LYQ/RcUbEaV32t/tdnObQVdIJZ6vJ5K9tWFIpU+OeBBA4mkJ3X91I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l30D97X0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="l30D97X0"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f6609c657so1368035f8f.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 15:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785709048; x=1786313848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6bsPGvzNC3Iop4WsfghniduLra8GHqGeExlE9Ii45fI=;
        b=l30D97X0haxplDJA1LQczHII77xXxIut2oUbt5aPYMTZ+cNYgj5AD3f6h+CjF2kS9M
         ME5VilM82USaF0Kc7kgaPRVwy+IhJgbLylvhiBu3k7s5SQss20MZqTGXwIcsKNrtfe9r
         tOfESoOpFErqibVvLhQZQi+5gWmFpA3roEh1D4kCxlk38fvV5zXevDQiPI+i4dCxTCRh
         +s97HbuKcFi3JLXCeVDWyNsYtLc8Y1kS6IBOX2ucWxzuvw0Bi5YYR+yYf2hYvOXZXjqn
         LfMe0R3KlIVeilGv2nFVxr3JF4IOapSkEL4VuIt2vAeo0WDpjEAKKQ0SAb9hqpf899bx
         uiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785709048; x=1786313848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bsPGvzNC3Iop4WsfghniduLra8GHqGeExlE9Ii45fI=;
        b=SKSMOmCuAkY/Fv7gh+PiJpSrhzoEJChE/Jen4c4riGXsiEYxA1Esq7PiyRq8OYo/nu
         ko1yg9Ot4nkRMzI81VTu/NSuoImP65l+vi54+5b8LLirTBDsziHMcKC6FGQu7YrlDhar
         H/QBjf+8ApE0F371HqFeqzZsolskzZj+bWOUuG+IblmgV9BkW4UzbZxPHSIJb4pHwIMY
         gQLCYvVT/myXswryIyRlA323DufTTsYKamWOlNcQaoe9HIYTXQvt0x7vwFEBInMhdTZR
         NtR78jQHJ9V+EBTfxGTASA27G2NTNR8dJtIpuLdMKUmgYBKV7S6tYKZhVsuL0sIwrcyl
         wADw==
X-Forwarded-Encrypted: i=1; AHgh+RqnXE0VZdblHOuxXHomm2EN/DXQGI61fE1MP6YCrW9rmLwjZhFn5Hx71PoydADJ7hAvnW9WMku2KwBs@vger.kernel.org
X-Gm-Message-State: AOJu0YxIlt/ToNsEgee1AfWcBPOA/bpIbBTz9nYHLC4M0dX2vDDIiyXX
	GzT5xSGzBE/oouyY1e6wOV/5ydgl5Ax6pja7N/MWYVKqelCBccbxVpnl54sW7l5lCHo=
X-Gm-Gg: AR+sD127GPYa0sbF2W+cAwSIrp5KmBep+q/2xtVjvboYR345XTTjILNG1qO4RxbHxjY
	sLj3dQtbsBeM6uR4TulgwIEQ+AZcvQFqLnTnVmLbPp9h5ib+XdfSthI3S4INeZEC0rdRfdmmiDD
	h6PLzqlC0r3oNAGfX2gNk7Z0PrdevHL0AIHAVuH2sODxCmVXvr5+ZxFuXkRX4FWQdQwwzb4P7Vl
	WFaU1okCgX3Xxby2746vTqRpdihPUCsLndwadCmL0jFXdiVaIvKGI3rUZrbdYDRRM4+PpsKulRr
	FQqdgoOpInRDFHGb5CWMKQUsQ5DEm10V4/36xNTkMQVxue0in7Gh7LMOuQkqCoryyDVw4lsZeCP
	nMudRvxO2+4V77MObtBanYx2ByaBHcnXBb2d8Ga5K28c2OXBDTfcYyYTyZu2wj89UGIKC+v72iI
	lbk2kdB1KEPUSoUjQRVI+Jqjh6TnynAcW3H1e5RAKUKMX0aptJbW+RL2sT7+A53q323g==
X-Received: by 2002:a7b:cd93:0:b0:495:3de8:33a6 with SMTP id 5b1f17b1804b1-4980c65ed1bmr126447945e9.16.1785709047703;
        Sun, 02 Aug 2026 15:17:27 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49807b5f0c3sm155072855e9.5.2026.08.02.15.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 15:17:26 -0700 (PDT)
Date: Mon, 3 Aug 2026 00:17:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] ASoC: codecs: tfa98xx: add driver for TFA2
 amplifiers
Message-ID: <am_BahJARF9z0P0u@monoceros>
References: <20260802-tfa98xx-upstream-v1-0-4dd55cdd658a@ixit.cz>
 <20260802-tfa98xx-upstream-v1-2-4dd55cdd658a@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eissgc2t76naakqg"
Content-Disposition: inline
In-Reply-To: <20260802-tfa98xx-upstream-v1-2-4dd55cdd658a@ixit.cz>


--eissgc2t76naakqg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC 2/3] ASoC: codecs: tfa98xx: add driver for TFA2
 amplifiers
MIME-Version: 1.0

Hello,

On Sun, Aug 02, 2026 at 02:42:41PM +0200, David Heidelberg wrote:
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>, that is going away soon.
Also <linux/i2c.h> already provides i2c_device_id and of_device_id
(ie. the two structures that used to be defined in
<linux/mod_devicetable.h> that you're using), so just drop the #include
for <mod_devicetable.h>.

> [...]
> +static const struct i2c_device_id tfa98xx_i2c_id[] = {
> +	{ "tfa9894", (kernel_ulong_t)&tfa9894_chip },

Please make this

	{ .name = "tfa9894", .driver_data = (kernel_ulong_t)&tfa9894_chip },

Best regards
Uwe

--eissgc2t76naakqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpvwfEACgkQj4D7WH0S
/k5ofAf/fcXOQAhsDuQI1vXZjfYD+Nu2PG5sMkw/QbLri499oQfMbAfRG0JWATEF
QlWrFmVUB03381JLDXyXWtkO5evnjkldLr3bqGY7QevsfpxmOHDV9zLomJjfAqyL
RmIcbr5btKIh2FZJRZslqHYoKiG7SeNZJLyxeYU4lW8vZcohMMRHlPGSCEC7RoNI
sJdx+JMXR+ZHBOuwOrObZDxREbyQwdSnxD1gEEwmXEcpb0rZUWVIEZKXNekbV2XN
izdCJ/P/vwPVNl7yrZLjlzfD6t2AFmYBYIq4kLKM1vrAd8gxMcxwTQH+XKnFNaWC
RZQ+MsjqlG8Lw4wj970ztO4ky/yXFQ==
=/KIq
-----END PGP SIGNATURE-----

--eissgc2t76naakqg--
