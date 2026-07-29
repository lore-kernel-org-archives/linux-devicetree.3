Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF6647CC7A
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327680; cv=none; b=ZUBm0o833unfypdJMy0bvJOB5XcH1Hwn8MjU9XZ4VTx84TEdv2T0oavKDAKe/1apuEiu17jREdX4/Ekx/VvdnFH/W7Yyzd/zD0WW4dLFOB7Z1G9Y8JtwOWTPW9bAk/nwLWcI91PpSQtD58Qa0GtaFXYPB++VSNeZg0tRTVwuM2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327680; c=relaxed/simple;
	bh=L1jAIAcC9fN0StOdLITAj1z+mZWOsBgXDmgFTSgW5fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6pFrX3GJ0Dg4BmYq5/zlI40y7ec521wlgSjEeSCDwp8OceVQj2E+qZZQAgCknVzQ1CURfbC7kGcTsS3OES5sjf2FA9fW47c5oCtqRw5akyhbXgoXvTUl3Fc8vcjPq0cBY46JiIOrsaN6Wa/1DunwyMkLvaJ1oE42nMdfMETQhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=a38Q0/tf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="a38Q0/tf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso6383495e9.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785327678; x=1785932478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L1jAIAcC9fN0StOdLITAj1z+mZWOsBgXDmgFTSgW5fg=;
        b=a38Q0/tfGhG7gYERQDI91E/E41qMUhnDaX8/Hcq2qNk8mUEUfg6obMP0WoJ7/xe/i2
         AlsWbkVIt6xiyK32GFH2BNiISjhYiGkGXxxT9jZdR0rHHpxFj0w+vSzCYRM03BAiPECI
         /wJA2e40BoRB6XO2y1wrPnl8zQHMXulJB/CGcAY7Gnw4bGK7c2M9YiBvTqxQqCbrGQRB
         pzq9fXrIb4YUI3DsAgmtJ0B82XG7sjKIN3kozaI135iOTf1zYOcwDGTqbxA86LL8lzX0
         pt2DWQhSccrm7dSiXSPoe6xcZsoDoNqcJPALei3Ptxhy2uFQBMkgUxnzhbQbb/olunvx
         3a6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327678; x=1785932478;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1jAIAcC9fN0StOdLITAj1z+mZWOsBgXDmgFTSgW5fg=;
        b=sCTbnX0vYVG3u1VJZlormtryF+/Ybdyq9dLPBHTdGYmyp4ShD7vMTdk6/wzw1vumnq
         hr9MKDDknW6H/rP5d0ViecfWRFYNUaV5QFCSKsupgHyCZw1EflgZhhYyaYK3eKb5OiMn
         GzbeF3klZY75pvirc3GeDlBjHCxYFN5Ig/VLznMHHa06thAwHHhsDyMbwFKngvwo6jOJ
         6AlEb9kRRKtce94tioykwT4uxiPh3c0K/TjOtQ8fQeBmiWpncSDtVWfixTbnli21KGN8
         v0fEl13rP52DZpuLwpqn1U9yix55T+F1CCmsbzDZ5r3JwluLH6lLaRRXGZbQ6n7AqWMn
         tMXw==
X-Forwarded-Encrypted: i=1; AHgh+RrH5nMxLAyZLlZRIVcT35xXdLiWBMU4Y4OR2ljYzK3q2RK2NTynR9F4+k79aOnhYMWhZYfMYAwO6R5i@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Ox/r+gnnKvtfqowBV7Mtiq2CKuIalaazOPol5VM12U2gBM1c
	irBewpaKVemyZNXc7R5Y0UgptBSROvNro6r9VqK4DUis2G2pdtaJKevGANCN+a8X6Ok=
X-Gm-Gg: AR+sD13PbL5xElhfq9v45eS/L+UZFJVs+YilTGZ/3R2VCVfCgoT3sel0MhO4SY1NyNw
	edjLOp/Sv1NtFUW2b58BpVuSamR3eavKZknVX2QtkWH1blNwaH8dEYZb3gz+z9+OwPDnjQB+HNL
	brCpWe4QN8tiR8JZvQMWXUO8m+gkhvqH9tskSqIss6CAYhKL3tp341wZhn/S/bJSNrjLUh4Jr3r
	+jcS8iRtlaiaeN/9064A16pQvOfHgqk/hfYNkbCgYPPCWuCknc0eQBbk8vC8FgFCQTLx6IZMWg9
	NvYfRJWr1Hp2V17yT0LfIhYNR2BZP8h9PFGhF1G/Je/ycVhMMVpPLwMitwY0MofEFZy2VD8REYi
	+jBrEA24ul5uxuiqeJhXooXcEvY0yJcfVhNivGudpEXxWENI3rfyV1h5GYauL7ds77hQNiixSdK
	RtK6M3hG4PxUwXoIO90gzW290NeARR3YCDeKJtqzflPrzV91k1Nle1mhNlXKVv7X6XFp2LqWf0o
	iH53bsdC+nfL4cBvE9PjYrohLIEc86thqBUxxOLoysP3vBboQI=
X-Received: by 2002:a05:600c:3f0b:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-496c654c9a9mr69940735e9.10.1785327677575;
        Wed, 29 Jul 2026 05:21:17 -0700 (PDT)
Received: from localhost (p200300f65f47db0401da7fd03a16a046.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1da:7fd0:3a16:a046])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49764d6d0f8sm49668705e9.2.2026.07.29.05.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:21:16 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:21:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Wadim Mueller <wafgo01@gmail.com>
Cc: jonathan.cameron@oss.qualcomm.com, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	maxwell@maxwelld.cc, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, marcelo.schmitt1@gmail.com, 455.rodrigo.alencar@gmail.com
Subject: Re: [PATCH v6 4/4] iio: flow: add Sensirion SLF3S liquid flow sensor
 driver
Message-ID: <amnvxnjaDZRrLEte@monoceros>
References: <20260728214943.29820-1-wafgo01@gmail.com>
 <20260728214943.29820-5-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="npu7jwznn6fbd4s4"
Content-Disposition: inline
In-Reply-To: <20260728214943.29820-5-wafgo01@gmail.com>


--npu7jwznn6fbd4s4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 4/4] iio: flow: add Sensirion SLF3S liquid flow sensor
 driver
MIME-Version: 1.0

Hello,

On Tue, Jul 28, 2026 at 11:49:43PM +0200, Wadim Mueller wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

<linux/i2c.h> already makes sure that of_device_id and i2c_device_id
are available and <linux/mod_devicetable.h> will go away soon.

So please drop the latter #include.

Best regards
Uwe

--npu7jwznn6fbd4s4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpp8DgACgkQj4D7WH0S
/k7vPwf8CZ5HT3Hoc5TbA8Mdmti0FZeaIu/dm6mbU/RU+RejclwSiIoTFPcIqxwl
pRJxIZRPXjP8rMePZl4jzWoBj8e8ngRj8kC6QGaaPTJTVvdMxIwYhTaZqrLYLrMx
xN5e8Yr/AuXIi2Uv/EcynAiUBCr9I7+yFzyXfPghon5QWd2QwqPdjTtJDOOtBg2s
XSO7c5AuzMWUIKG0YCX89H6gEqTogbPb5db62Uu0IsG4odN8cb/muMK1EXIlzh1Q
B7VLNZvLrNT+cAm5lEg96cBKDzJWVCiHgz46Dgm02QVzZIqLu5niWJhL4NncRU6Z
rMAM/O/UGmIfAed7zexAU3h0yCHUJA==
=44Nn
-----END PGP SIGNATURE-----

--npu7jwznn6fbd4s4--
