Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159BB3C98B5
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478659; cv=none; b=kpbfC+hia/rDoP09KQsXEKK9sSGEAaj10Ud/nKl9j8N9Aq+VFxnfkmOiT6zSieL2TOQfaF1DectX3BwTbQP3Go6hsEutL7dm3q7bnQztpHJUJRJgZADE1bFELVPDzwOQ7sDjtRzr2tZVZU3zbzL3OkCHycbVFbQR+bDFGV/zw30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478659; c=relaxed/simple;
	bh=aA8HIE4OkVPxxf973WYk9EE9na++A+vaxUiINuobCAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=On/VICANMEq5xMiQoDxuOmGWCCU60C1OMBzEz/41HCuehEwwlYQLxC3nsndbO01N9gTb9oxpNGAuzaplVkOebOOzX86CEc8e7eEHib6d4wb8rw3cqhxbULOhgyeejEI98vj/TbzJ6GPwOC0Nrp1lmC93UGVIlNhZF2+AtVa1vd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Aslmc8Rn; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Aslmc8Rn"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so15412055e9.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789478655; x=1790083455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aA8HIE4OkVPxxf973WYk9EE9na++A+vaxUiINuobCAE=;
        b=Aslmc8Rn/i3zL4050Gs9agJD/Ihuck4VeFDlothMwDp1OL0/qYzeJSlliPShwfr+Zh
         mp1AQ+DuscMlANx4YKG3ku5o9BDtZH//dKcRscK9HLIaMxiY4Tzpw1yPaR6LfAizqM87
         oEN+/jSt1ksWlHkq56T4iRBW5Frxj0p6DEk30p0n8m1IToqj/CwMNZatKScfE9B4K5wx
         H6E9IdhZdMaTi5ZpUBhbkUPn6LAbl6ktmdIdL3qyWJatIlWw4yC7k7sAI3s/2yRvOYCM
         WBrWcHCeBkjAWc025dBrjsTF/hpIM/6DoEb4K5IohjNIYmuP6qB4VqlJi8WXdJS4O1TY
         PSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478655; x=1790083455;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aA8HIE4OkVPxxf973WYk9EE9na++A+vaxUiINuobCAE=;
        b=pKoqhGFg8NEnTMr4eZmlaA9HgidHxLSFbBQVTeSBilZFNIeEkgkj+mPFlShcrANlgg
         z/LtfCpAClEBAy4VDLngD6a9O8uzGgSev8LPO+LlVkRoo99VSEpnjtf68CrsvxzCL6Uf
         0/ZxcL5TnhuMVzeahj5BXuUO+1rl28dKf0W71tglG5mlgnp40mhq85icq9UtMoSIqawr
         g/M0KMi9GMW5JpwPHpgoXh4aOuiTyPK/yFt0YArguyHVJ8g45vPEikBsVbrfI5aLIFXV
         B/pN6kvqbgISmQxIs8AZyoMP3KHOyEsf8zZl/w1apfDVUmp2QkGgPtrffsOxgxUoTMBf
         Cwtw==
X-Forwarded-Encrypted: i=1; AKwUvBzM6aR52VJAdZC0j2XzeLulrbQZUdiunDlu6pJW8eGy7m+FuSQybN/k+Gp54mLkU1RYFVuAqmaQ6gjc@vger.kernel.org
X-Gm-Message-State: AFuF++l+nOdr1+O9AIGD6pPO7TA3yDiXBF/uIHd+vXzSnPGsvXMM0MVI
	a8FISg2KxtGd/AErCEo5RdVAJHXl/yWZsJDlQe/YOD0f7G5Hprq5ddz9O0EbLMyrt9o=
X-Gm-Gg: AYBFou1ZjY/FIfxCyDD+vmueHVqzbLMHFLI7p82egIZKhbBvUtda278goHuCH7G7h80
	d83bkuPR9FyfqGQ52cwuTJDJjzUF7Buvgxib8HoMPiLu3SyS2/idOx6i4jY2wBeKYDLfLdBwoKr
	0MxL0O8qwn+ZrtQGFip2rPITqEIZOAiJ1bBK6qnkx1jztgknyCk2viS4Iv6YDIOx/ieBtI6EO8e
	X2rU+NNFGaaAP0pbaTI+ySqdMiHHx+rvsKhj6PWwMJtMEpPzNFu6DcbqF9+In0/QGFZmEvzExE4
	Ldp+EKGxyvVKfJ+eJqv+za3i3piASfjDPHeCbgAymVJ0q+SzSk04bdM+MfjK+7jrelAWs8xdIN+
	z82nt/fIJwK9xx68sAhKNEi8wiuUiNzQeAPJXMXPhCNEjMv6u2hL/I2+z/C48O0/uQG/o1ENzte
	f+U65rx/Uny3A10lrhXSTsAUk9p+rFF1bFkVpm/LKpRYMNe91M8ANAtyw2PJbarMT9Uriz1aTab
	OzFXaZg00rT7ituxDMM3iAop6K13PE4Kjb8GPkfPI6uC85Nitpb2tmEhh+MkJFYgQ+NHPhK
X-Received: by 2002:a05:600c:c059:20b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-49e817a0dccmr16959515e9.8.1789478655048;
        Tue, 15 Sep 2026 06:24:15 -0700 (PDT)
Received: from localhost (p200300f65f19a904c2a77868dcbef2f0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c2a7:7868:dcbe:f2f0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49e7ef8b519sm59911725e9.14.2026.09.15.06.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:24:13 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:24:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 07/15] clk: ambarella: add CV75 RCT clock controller
Message-ID: <aqlGg09RrztSwoOz@monoceros>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-7-3297d3fbc9c0@ambarella.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xnlmyx6x4vbf5kjt"
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-7-3297d3fbc9c0@ambarella.com>


--xnlmyx6x4vbf5kjt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 07/15] clk: ambarella: add CV75 RCT clock controller
MIME-Version: 1.0

On Tue, Sep 15, 2026 at 07:15:37PM +0800, Long Zhao wrote:
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. That's a hog for
unneeded dependencies and I'm working on getting rid of it.

> [...]
> +#include <linux/platform_device.h>

You can rely on <linux/platform_device.h> to pull in the definition of
of_device_id. (If you want to go full iwyu, include
<linux/device-id/of.h> instead.)

Best regards
Uwe

--xnlmyx6x4vbf5kjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqpRvkACgkQj4D7WH0S
/k5CVAgAlhnKI89Q33xfBbRky4EOs4jdP9vW1frAnR1bLzOUf6Brat/wp0lHDYiH
dfHIXOR7HFn85CjFb+Nt4HZmCZvg9IWa3FZUojS/qPfNofim2sdbViVVUyrwBouC
RlC5OARb4l9uiJrgaJO2AMv7yNoI78GUthqDgXrDRgQoxTQgWISpDddD1O6XPI7J
ZTQ08V7I4M3DOPziACXuOd0xr5qUrLO/25fcNlQA8pjPzY4u2tAGBeF9yDFtfQT5
U1/YP9Y7TjOF/IfD3GOzrFJ0uAE6tHNXV7Xvi8Qz3CJXQkiW6noaXsS77gf9XaiE
ZaeuPEwNDSCEJvnkBG9Em1YObYs18w==
=V85c
-----END PGP SIGNATURE-----

--xnlmyx6x4vbf5kjt--
