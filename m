Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769384;
	b=Q3Z90wIcAaG0j1rsZptNDk64mbHjK5plOOB5fBMs8Y9eGW2I6o0D2Vh3FePlf1yzsMMP
	 BBDA+Cb5fzLws0i/fzWyoQbbrVO9XzuHV113xoW5GmYhyz6umETv2yzyvQNGNL+0QgQR3
	 DUNYIK+Se0gkyuTIwLNkpU8cNjL2z6Q0XC8AwfpLJOEM7sOdJ/FkgNVb6Gx7whd6oAbap
	 hGKumMUsqngZr0FoR3hEqW6jipS37Gfffq3V1sLpMcXi7JmuMhjdyACmafl97BkS+pMnQ
	 /Ra5xQ9LKyolYRtq7QVJsZU6XbWA1bMvPReYqH2EtoHTXzRCPzsC46N1O7lzSGhEKeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=l5H/fPkMrIgjbqbAa16bsfhUN41gPrGnMmr6FVXi4LA=;
	b=YH/hQyGM9XFr2zfPprQZzMfWglIb2gaYBdpkWTLTjQiibLVHjMpdmSV+dm96VH+yYakV
	 X3pIHEGCliiaRCNnhGSuDfi6KA6IOBloefwAvTOKT/hsRDQfXrgtq4SBk5PU4UjOaVnCX
	 47YLo8ER4o0vHliy+ZaUVGyzjvw8HUR0bjCOC8dfFsGri1akPignhmcPHlZJFxcOTs8nE
	 kIxtezc7mv5NztBW7iVhravqgV2cx44dPrxTz13qTSG2NFXSrb8zOfMbUfWtOXlyvjLvD
	 Xk4umE0F6Vonyh1JfislVhvSnE5kIvaFuOUXRUUKGVx6oi+yOkbvGd1fCGGyYZEz6AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lMtduL23;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB19606A6BB
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB19606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lMtduL23
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49412eb1474so5145032f8f.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769383; x=1796374183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5H/fPkMrIgjbqbAa16bsfhUN41gPrGnMmr6FVXi4LA=;
        b=lMtduL23oty35ecI++RAvCDDqiwnc4Ak+6dpQwXYAlrNx/WsKXzEzr5BaFbdfWGv0o
         MIdxQNlD99ZB3a8pdZlPzsq/4KUpCXSeNscu1C8qklmN3X0MyZyu4smG76KD/bG+zgKN
         a5t5Os6EnPqekAKT3BU784FH51GJONaBlPWvdb5hG5vVq62a5HRLgpmnLGMi6YcnoS7y
         qvGHwnA/+1VBekixkj+vGN89hIxMcptLrPhwi9kCSzPZ5+eJkd3ljI+vBaZ2ii5tpxFc
         LEwVTIzesRkK1aagdCm3Sz9dhOlgaNyOYbdqFMjJ/Rv5/L3luL0uNMhbxT/KTNBR5HLm
         K2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769383; x=1796374183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5H/fPkMrIgjbqbAa16bsfhUN41gPrGnMmr6FVXi4LA=;
        b=sSnRulCAbfRNIOHZKbS08kNwYytCaMEiGXodHQN5Q9Nv1JKPtMGu0LYQZbjjVdt/af
         C+zEvJDJmWslS0dkNCHt0BJrzxu9xJAlzLUE9vBFSk8o4QvR9p07eZNtvkf/AxlRaK6b
         aS1aOf3WjDLzRqph9cN0E+svoQm8PTmA/X9E0ZW+i4k4t7fgc5HyHqE5Aul/cHlLPlaw
         EZ7R/5uL+JCZsml7o8au0F/x7sskzLyCZkAarB5Ad1BxqrM1j/ZdbU4Zzl67xLtkX+dC
         wNK/YJqxg7MHwViih0C09+pih0v3Gv83o/rTkh36sDA0OXpbMbmvGFlJbBc/ERshHm2g
         b6JA==
X-Forwarded-Encrypted: i=1; AL+hErEM5dLeA3foKV8WkEk5woOOvOEY9ZWiMHLRqp5siwMTkr8e7KGPkLiGH+J399x20K5Dv+m/YYcIkjyv@vger.kernel.org
X-Gm-Message-State: APuU4Z+WtDHihqEjhuvSAA13IBddooj+AYwLXnjB4zQwDho+E6qjPOJS
	1aCiGydraEIR1eOcpKM1I77cecpqrhCAftdYQpsPLK6KCfK77FGTDxHy5yU8h5molFQ=
X-Gm-Gg: AZFdTZdShfxPyeRFMvekk1WRSSEdayqWSps3vpx6iJS2rK3XRmt1scd66valUcC213x
	jMhjyxGVRU+R+9IVAm2Qre7RhK/N3tUMTXLznjwNAPPiufgp3Da8XhrkCBMma5hV7diquQRFcF8
	sRn90W2XAj/jDJAKVgJgW28M34ptVDLixXgAjdg8P/B42XQVjU3IYMQ1os8l2KNTG7Ig8bce0FH
	NXwN1WX+t4J/xmW7Kdx8gAlE7flHbu4v5R/YXDi0YwfFxLkQS8Hm5NXVMUL6o0Z5KFiG2SnM5kv
	Tc2/US40QD59k0kgoC9N/7qSPVIaOA7as/VLaLGE/7Pb3caPgQajzE5I2waeNQ7KwJYGS1u4sAJ
	rauY8GwEMhznfywg4ClZd4hJFebgxis23MDCAVF6DJPD3/ukmB8/lyLG989Aw+0C9MzZdkWPQ/q
	hy7oPAB/ygggCi8bVJNxOTsAfPwPpMtUbzhrsG815H+nq5jUUO5lliZWeHZhL5spG9vfGVZodrs
	F8gulchNiXa7XT0ROh7vwbF1HDROig3Ia0/QyOp5w792jATa/+JWw4Nk1KjoBtPZoEKjVMOliFL
	05tcyxDst7eCork8AlsPTkF19Zt0npJ1zXR2TR6F95nV0mYBd5IU54P8kfHCqstLqVWgTJUoF0Q
	jo0legTK+II0u54lV
X-Received: by 2002:a05:600d:18:b0:4bb:abe2:bbce with SMTP id 5b1f17b1804b1-4bbabe2bcc5mr70018825e9.29.1795769382993;
        Fri, 27 Nov 2026 00:49:42 -0800 (PST)
Received: from localhost (p200300f65f19a90496f529fbcf0b312d.dip0.t-ipconnect.de. [2003:f6:5f19:a904:96f5:29fb:cf0b:312d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884b7515sm923694825e9.13.2026.11.27.00.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:42 -0800 (PST)
Date: Fri, 27 Nov 2026 09:49:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, wim@linux-watchdog.org, vikash.bansal@nxp.com, 
	priyanka.jain@nxp.com, lakshay.piplani@nxp.com
Subject: Re: [PATCH v5 2/4] rtc: pcf8525: Add NXP PCF8525 RTC driver
Message-ID: <awlDvq6KT4HxGNDA@monoceros>
References: <20261126071124.2383368-1-shivprakash.gupta@nxp.com>
 <20261126071124.2383368-3-shivprakash.gupta@nxp.com>
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
	protocol="application/pgp-signature"; boundary="gv5nh37x244s5vos"
Content-Disposition: inline
In-Reply-To: <20261126071124.2383368-3-shivprakash.gupta@nxp.com>


--gv5nh37x244s5vos
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 2/4] rtc: pcf8525: Add NXP PCF8525 RTC driver
MIME-Version: 1.0

Hello,

On Thu, Nov 26, 2026 at 12:41:22PM +0530, Shiv Prakash Gupta wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Please rely on <linux/i2c.h> to provide i2c_device_id and of_device_id
and drop the include for <linux/mod_devicetable.h>. The latter pulls in
several headers transitively that are not needed and that thus create
unneeded build dependencies for your driver.

Best regards
Uwe

--gv5nh37x244s5vos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsJRCEACgkQj4D7WH0S
/k4y8Af/YPMv6+VfabvAg6sjAP1iYCrA9X9sWU9HEzF33ikGj2zaSOQAbmelYcKU
MkYOqadm4ftAn3wh1m+RGl1mnfy1GNluJIXTI9zNZYGx1pj3U8dJqh1/XL74jj8A
xgaOrHFNOPOBUNkjSWBYaj0jo6IcppLUcPbLI6QT0lkZsww+UNLIAAdTGy3bKvJQ
zQELEUsrss+cgFYfjeZ40PKOh/wFEqPemnatDmeoUoMCItb7iPp3LZX0szasTHR0
Y0MOy7nJemFgnBUeFliuIZMWsjW0gTCXFOfwAA/AU9iZ6LoYjQ13w1baDZLxOSsA
hwUFXsoIF6f/koYvawaOx3iNSkWDag==
=uvjs
-----END PGP SIGNATURE-----

--gv5nh37x244s5vos--
