Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D6B438022
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328607; cv=none; b=A9GV9dLeU/kuCe5yGB+RMaVQG6VxsiSLme3B3A6GmSk//Y4XJJEgifQdoE2XPdNjLNYWVcmHzEgSpVrQAuPfhU5O8ngU+KA4+/MS3dWEG2sfjWfw+AbAGuBf56fjK7+DCejDZt/Fc+x5elhUMQ6tvgsk8jCtTkT/bLJJ1vhm5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328607; c=relaxed/simple;
	bh=xGyW1zCh+rLKiJ62hDLL4FkHUX+Lqecc47aUXSHCSkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEkqdYulusnZbpxlbseI/pdlQ1RUY4mmekztnMZYY/pUkkK2JR4Uuedn5dioXF91LBGmnYr0H3jZIgdDfUWfrEZ1IPdr+hAKuI5lAnbdDU+MaX3rXSml7onkNiFIX7dEIanlTnwxqh2QRUDWtgEXKVbMhm/6Jch0zm/OB+HJtSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=A4n5zuzF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="A4n5zuzF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so5711295e9.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785328593; x=1785933393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xGyW1zCh+rLKiJ62hDLL4FkHUX+Lqecc47aUXSHCSkw=;
        b=A4n5zuzFbg8PFoMKqr5PFshAMUCFo2Uhn7yQwZ8DAvIL1WoRTB/Zv3fBc9Ej4oE2vK
         dWLFer2OI3KU9FcIIo9OkX9aXO40PslAht3sbV+JbU+qzDJYvvcvlGwzVzR0iRAB6y6K
         U7+r1xU+/Z3NlJQ18RXh8oXuQl9qUp90ySjtEJYxEDC1gQYWFWVUPO7fuAKf+JZIw7kt
         gKZiATxufOSREOfVkW0q7qb69yayXl9tmEqEx1pLwKXug/OS9hladd2/i8cdNlH6L1S3
         aLueubsCNaUFHJ3W9gkrlEaRNaN1sE9XwnjENsL7d2lZme3usBWwYzdtMOn2ayYcv9G/
         sFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328593; x=1785933393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGyW1zCh+rLKiJ62hDLL4FkHUX+Lqecc47aUXSHCSkw=;
        b=bgjWti3w5x8lBkf5pJ2AvMvbhZsumlwPq0GBb2Vn0/lUrazUVXw3+KQxPL7ixCtqGH
         E1gliOsrklFfau8fcz6Ku9xpypOgaqGjb8ROANBlhKdAX3jHH13I2C7j4UG5w42eYKAd
         kkcr5Ku/1Tdh6qGyOJDy9ng3cExkKjPrAO9RjSUY80LzyZyZ/9iKsVIdIT38YJo2Bzu9
         pBjFw6alPbT7bNQQsOXjoct3DxNx4PXM+GFjiJiHVOLFmIlJgddK/adeMctjTAUSzqKZ
         a84dmhilJzgigG4sBDrndEQ3Ck48s/wdiIMf2dOs+oTW2G3wPfvobI7V23AMaqsqqApg
         zkcg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1PNmTYErTcD70Zh5ZOKnAuw60b1pBRIz9Ilw3r9gHtoWXfZMjiti2N0ykBavX5SM+rZ1CE60w8l22@vger.kernel.org
X-Gm-Message-State: AOJu0YykQFuyGE8bzlRXUo8dA7nGsmTwW7hy/w/P8/AExAJ3DAeWzPlU
	NwyTpDEpoKmICKSqGK/VTFiY8OoNO/gH/imdJKF+QpM0LSpj6opg3AyH1h8I2zh90dA=
X-Gm-Gg: AR+sD13hsuJybEUBZwuLqbnhjnPQxwMzWqi6ng93Dtt23UHwd+HAFS7z2pCibvbRh4l
	MYsZeuEMkdmiZgTs7LrZ7qF3v1g3wHYk+XaosSrpY/04tsXwqqNtZZ3Gq/n8iPG7cul1sYmQAA8
	KWQzoBrMHYdU4x/o9hMo0mBapq73WTWu3XA3Bo2MVNvhLmLCBBlKa4cSn/KQZjhLavDOwraXWjD
	2yUOVv9Ys1Hx3dy66rbEF9ROD4nmmOHcJnv0CbEvAhdwM/8Ep76M1y0z8/yqWLUDWWx33EVRjvV
	in2wUDi/gFv/CheN1wfDkUY+GZWISIG6dXHBPNHC2iSlQCWOuRjQWVKkTdbCLiaPDVqXScr/Vws
	QLGUM868mVkzOrBuGWNLiaM9zAWDK1hAGwaJiLj4ZIeR1MkCzOpjtKdtUXhV1JE1Y3/wdTJ+4FB
	XprF+/Y67U2IQfiCgVwAfF18NXNEs8J/Nlu7mZAH2NhnPLvQh4TfXi3gJG5OGp1rKosRHsqgEfa
	E20pLRaFS1bjyBMZR79ANfvmB4gTryUsMsTj3MsY7uKt6rPetE=
X-Received: by 2002:a05:600c:3153:b0:495:573e:1c54 with SMTP id 5b1f17b1804b1-496c6428a29mr80996735e9.9.1785328593413;
        Wed, 29 Jul 2026 05:36:33 -0700 (PDT)
Received: from localhost (p200300f65f47db0401da7fd03a16a046.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1da:7fd0:3a16:a046])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-496c45b1c76sm146982725e9.6.2026.07.29.05.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:36:32 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:36:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: codykang.hk@gmail.com
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 05/17] phy: spacemit: add Innosilicon DP TX PHY
 driver
Message-ID: <amnzTxDYtSBojHdY@monoceros>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-5-6de34d80e86c@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="db2zigiccrbrx7pn"
Content-Disposition: inline
In-Reply-To: <20260725-k3-display-v1-5-6de34d80e86c@gmail.com>


--db2zigiccrbrx7pn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RESEND 05/17] phy: spacemit: add Innosilicon DP TX PHY
 driver
MIME-Version: 1.0

Hello,

On Sat, Jul 25, 2026 at 12:51:14AM -0400, Cody Kang via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already makes sure that of_device_id
is available and <linux/mod_devicetable.h> will go away soon.

So please drop the latter #include.

Best regards
Uwe


--db2zigiccrbrx7pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpp88sACgkQj4D7WH0S
/k6T8gf8DMOwEtZaYC8vvvJqKWATzitxIn2z2YqgDVlNFzaZEYTG61pFLh/KTds+
sl2cVZmTi8idTg/Of+KXRfO2hxAkSW3C5UbNd60pd0VY+mQSfW0RGGroYO+tusRx
A6NwUHW15ZrpIuAsbkKepIhd0YmoiVA9SimCLHX85RxW8RuuPoKWsaur8Jv/j+Pz
dp+m3Lfaj8gG8J21Rdy8YTgKJ8GMpjOVpViSpsqQIROd5gqkOUepPpTGc8Cc+Pr9
haGqNLM86F9sZOA5aL8HEpYGHDo3Q6hGRmDiUm3CBaNwalgdp6qGUEKWGBjRoi/4
tgGD4NlIoAze3OTkKRb3ysqj3/8Xng==
=c0aq
-----END PGP SIGNATURE-----

--db2zigiccrbrx7pn--
