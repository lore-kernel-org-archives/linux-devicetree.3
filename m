Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127059;
	b=BMDyeSrKo7BfyYx2BCAoOWhmXY6hfTlIAIEaCHTSPonXIT/PYv+SV571a+2/mNliMGGv
	 rsriBM1X39Bpa1wGKWdrsmhMUug5jsvQei0IERCdVzyWfydxQFvVKybRZVwpQyo7jKham
	 8cLPi0NTI1HFVUvUKFVW8nI+sFoIzNktlmjVReufWBFBxnDLmVoYvqknnvvaZV0qqi1gT
	 5/h/sl7KW3Y0t/CO7HIz0aoYWPwFK+Gge06wiuKC31do2i+AxdAGme2/KlCv6HwQr0+MW
	 y8SGBG1VTmBZBBd6l60alE/JZKmgA/qBt+OWX1jAB+9g7xVQKC+LCggxNp4/4D9czrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=W9Ut5Tx0R51AH+pmP3Heuh8Ql+5ThEQrrnH7J3z+HIk=;
	b=tuwnc5GOQvRUBDc4r0AiTJtlnSwK7vxo/rO3O4uXeEF2M7j3upmAH7I+1NMmFTFtqu+w
	 kBNOrUCkF6P/cm2MZKG30rCV24aOSiiJUIJSx75Y8rQu7dKQlWiBgeGLI3HaB3rFxxll/
	 J/DzWQv6VyznsDWUUC8FaLqTv58qmOdjxC9OX5RaF+JUEALqFfIq6+m28qvN2veHcaOK6
	 rfrbf5bFFRVH77xQH6n5xHBVzZSk06d2I80S6KT6xp7tvuy5UEYvIHkeDiB7pVZFI7alH
	 FSINyYdIaE3BHBn1LACNp6WrmC97+3Iwqv6YFaKxGY+T5LuHevuchfsXvVsPEyqMWcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="KRl1/c0P";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EAC606A320
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 08:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1EAC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KRl1/c0P
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so1474835e9.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 00:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794127056; x=1794731856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W9Ut5Tx0R51AH+pmP3Heuh8Ql+5ThEQrrnH7J3z+HIk=;
        b=KRl1/c0PPnSdSq1ZKNqLBa03Uz+GxGU61qJiBhlqoyYmXnNVvI8Q1SPnzFP7uLh/QL
         DktUd+TgERSpUddShdGXWLCdk1O1O/4zQ30BEZdaa5ruAIuRLY2wfhbK+Hp2OM0mvy1E
         6nPtXk75nCi6cL2NmqmzTnk+JkN7Ra2h5WHeLZ72VeEiTYKmKHaSPIKVOgtFk1Uo3oWn
         iv7eqDXDwDWRx2rJW62u58uT3IXmPKqoniLuxEHWgOXhVsZE4cOGaPXa23C5rp2RfgGz
         DNWBM/uFcC9Y3MwnKik9kqRh2KF+Dfr5/sxr7HLpkXoIwi+Ef+zt4h15kG/Og1JYVFxF
         taQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127056; x=1794731856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9Ut5Tx0R51AH+pmP3Heuh8Ql+5ThEQrrnH7J3z+HIk=;
        b=yT0AYDDSI/lz/+gF/wpwyN6jtuElFiOhqz0sd8R1cxxoMU8/g/zEmQKpJy7e0vRbVK
         xxHvNRFBGBBfJpu4DC1qfDqf2uRUUCkA++QkEX/a3A0VnemX5NmT6Wa1s/Bk4e4zQh0E
         KoiREfzA3OC5lMLU7DRMb+T6U0exqwDvla7f1LCq8uaq01LV7O9VAIKtXWXY9G+D0Sk9
         Uq1oXU252KlyB71ydx9TwnzAStynhfRm+munqf+TRmZHKLLAi8JNi8y6QRS7jIURX+Wj
         xwu7UZzyRQlHglbS7tceXQnOaIuKaeffhl5OXDyDv2xeGJkqhJ4N/LtpQDjVzvHKPqZk
         YOwg==
X-Forwarded-Encrypted: i=1; AL+hErGKlQjVgRenk00EgWJw8h3vIR8GoXNlkdhWp3vB3bN6GWVnYqegOmAoVo+YCr+6dSMY7V3Bki8thmsm@vger.kernel.org
X-Gm-Message-State: APuU4Z+GlfChIte2UzurUai4wB/6uJXz2KFEjpULLfMAmrHksWd6QPTG
	98bi9+SNCi8d6+gVK44h6AjM7+O765iJKjrW+MfapM+zeIylup2ED78wzUhBAY2tees=
X-Gm-Gg: AYBFou1UGvl8L2GeF4cggUGcSiuUhB3LdkuFbK0eSO77eBWagtAWQUw6sIgM9wJ2Mwc
	GuP1+KV5iKahFwQjLSmgiUSes0out3FnW2Ic9Ms4iXvDdqtpbEbBCckNQi7aDF3H3Y4lYomGzUF
	iFQ6Izkc5oYWLISv6608iMfXKaOQTOFtmOtALnNshEmE23ZE6UHjuzIuso1fMr2Sbnt4i0y4eGP
	Pdrhaqg50h4oMv1Vi+eRqcTMkBp9j97GjgJJeTTXftlbaXMoevWrnnOyRfn7xv2zu5H364dAUlD
	aGo7YuXZPJI6sQ812xmcEhvDDOAMaIvZP0lXSlTO3/TWky3bgfFXclF3LYwzf6CCqZuYzjzy6oQ
	JYA6ca8BY2RUzLrsmwuCAVwU0roJItllkJXv05Jy9+OnfvFKkvflIIJ5gw8MnETI5ijHLq0Rgfd
	+bKkcgdotmWf/jspy8HwTdiwflOIqg+AMtL6HhoyT5UlVt8o1HjCUKLbeLTN6DLfw3rTVMPwsAt
	qjfDnuqnyMMD6NTFGTntm5rInxcE1NGPZsvS0wCQqNbGUhE3OPdXyjV0iK/LMaiHYJ7evQHg3Hb
	FYdgO6v45NGd4lPT/EC6ZpB+xC1fKM4f
X-Received: by 2002:a05:600c:468d:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4b94d7634demr18663215e9.1.1794127056384;
        Sun, 08 Nov 2026 00:37:36 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b7e32ad610sm320858215e9.3.2026.11.08.00.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:37:35 -0800 (PST)
Date: Sun, 8 Nov 2026 09:37:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Owen O'Hehir <oo.hehir@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hal Feng <hal.feng@starfivetech.com>, "ziv.xu" <ziv.xu@starfivetech.com>, 
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 2/3] rtc: Add StarFive JH7110 RTC driver
Message-ID: <avA0OjTMLYrQtkzt@monoceros>
References: <20261106175600.3877614-1-oo.hehir@gmail.com>
 <20261106175600.3877614-3-oo.hehir@gmail.com>
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
	protocol="application/pgp-signature"; boundary="w6dqbkxjdqv4qjrl"
Content-Disposition: inline
In-Reply-To: <20261106175600.3877614-3-oo.hehir@gmail.com>


--w6dqbkxjdqv4qjrl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] rtc: Add StarFive JH7110 RTC driver
MIME-Version: 1.0

Hello,

On Fri, Nov 06, 2026 at 05:55:59PM +0000, Owen O'Hehir wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>. You can (and IMHO
should) assume that <linux/platform_device.h> does provide struct
of_device_id and just drop <linux/mod_devicetable.h>. If you insist on
IWYU, please use <linux/device-id/of.h> instead to not get a bunch of
unneeded dependencies.

Best regards
Uwe

--w6dqbkxjdqv4qjrl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrwNMoACgkQj4D7WH0S
/k562gf+NM6dtuk+VWVwvfDXf9+p3g0jKrADlgWKDDzFhosSn+83jWZrSSeCdQHN
atEMR3M+GFDakfjamoCsKhlrIcVely5FAoEsrgBRIKs669FxDnv1DsNATMVzwwg3
Eg7y2DbMRNDqwG3W1huzFANgVlJwJnxjNyAzkIwjXJ4ysfKo82m5VmiPfRGvzsWU
UiBFjyKSYAmyZcKKgFfWPIkhzz2TybMy3giCRfuzG25nzmdfTurBybDNOR7u1SJo
P7610P2PM85V5G1mowLZWnrdVsYYv0dj/eReQgJzlnvNrPQbypbe37ci9ygplOE8
GyU8LEPvbAlhS3+i4v73X+olcVCOKA==
=o5i2
-----END PGP SIGNATURE-----

--w6dqbkxjdqv4qjrl--
