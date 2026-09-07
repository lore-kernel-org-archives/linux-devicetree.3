Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C02439F9C
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769430; cv=none; b=qSDV4HxOP28qTS0wrUjP19vJfuLS5mIGmVJhLAHIOpUJC2mllNJFXtU7vPgL5bWwvIlFabJJ71tJg8oKtjsZxiFHSN5lIoCNsBuDylqTtW/UIrdVO0jVWGGmcbUIvHt/QC5tlr3yxxLvvoPolvzAuCg4bXfH/ClPbIPGtzd/h70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769430; c=relaxed/simple;
	bh=toPH+1ZArk/DDhOFULiU+peDd7xkrEZ/LBY2wlar/aY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0KNwmwd8u4S8Rphg1yBxdZsV4lMXzEfnxYcEAosKmEZRtw+OIxICBFlNHBaiFpJDp36maKE/bfAjaPgC9TngkFEZbNn/jna3gTafvrrveo4ZctGwzXANjoh9LtWnaEvPGwJ32+qEtnpFCEmS61lf/nq94lZ9CVGFHw5fzAf30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jSlQjCUU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jSlQjCUU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso26539145e9.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788769427; x=1789374227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=toPH+1ZArk/DDhOFULiU+peDd7xkrEZ/LBY2wlar/aY=;
        b=jSlQjCUU8NaKB9qSeaTa8q2TcqNyVNCrH5YlPuPk+DVIxHacKi5p6my2jigEtg5oIi
         9wK784TvLkbMNjSAntxrTLBgyrju0g47xM51ay4Tjpblbrt2f+ohxXEu8GyD7hvQq/Km
         moG50Y+Mq1xJXGgOdgCyzuKcsZXuBNlsxIEyziqceVo1mnSm/xHAQVshhiDHK9cDqqqF
         l7yMQz5PDsdkdt7uVESFiRElzKDLjBPSy+MvNh9MA8tIDpRSZGdIbTrRnqpzdrMG+MBy
         Au7hifIfCvAk0cz0fzCADnRQl9C+KRNwmGSJ8fum+EvTYs2R0+ZmWboDBLG+5YyqgDmk
         8nOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769427; x=1789374227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=toPH+1ZArk/DDhOFULiU+peDd7xkrEZ/LBY2wlar/aY=;
        b=RVBud/du5/4D8kXJmLwRGylGML9g1ahYC/geBr6C3+4O9m9f0El8JJ0CwbhbakLona
         ky2T8dDGnArtMjvv2OSdvEYMjtDxEXrQrrel0h/5L24t+UFDjcQDFkVqG6S7GoqZZ2e9
         jl1UOy//rGUW63q4I+Nl+gTF053eyKFwBUPUhUKDnxzhgHDhN1moBEKuBB6gSjEgpXCe
         1siajSW71H7FTjczS27gRNspXSxccBaA0cTdqzMyO8/o6zf/D2nLjz2f8QjmSaJl007N
         E35dVaeZk+VCw4tBjN0sH03dKch5v1RLXh9/ZnEL2S2WuXp+nRLn8I5oZU4ODng7VF8O
         i7KA==
X-Forwarded-Encrypted: i=1; AKwUvBxlwkN7Z2bsBXaf5WCr0B3K5hOty1tnDJJOADAAN4lyEg8+ezzGHTyNIJ+lrgssdP1SSq7pqv/Q5N+O@vger.kernel.org
X-Gm-Message-State: AFuF++n97K+d0nHSORG20MeTISgvRXiNzE4kdnE807aNrqtGK5T8zACQ
	9oN0bqufhfpOPse/2+vgFvxFMUvu1NDKFutqO+03b9hgy1kEbVRikdmi39bnN57YE1I=
X-Gm-Gg: AYBFou1qx+7ZoB81jPnOf06EWs8bzlfh7YgFh0lyQGfenKaE/1ZrkXm8L0VM/myzyNb
	s74t2bIDF0P8id5pDPhz1hoQklWDpjLfIJ4a3xprQqwdAMtpRGnuiNy8RE71Yrc1/UU5MtH0EVh
	2a3Y1h9U/oBlei1vjZX4tu8Gn5Qmq6KhAmKphhYm+P58OWRwmyun4ACb7EPzmiHrkf4ApizPQ27
	iDgpKv2kw0JZ2Rn9YAzSArQWIo7ke5ZKZaADPmnLC0Vdb2Fdcj2p0C2CMo9sEUD2WHozgh29xl9
	p8b7sZl4ZLqmPsTQStXlECQCkwgmhKY7wiQrVReUdnsnNYJ1/Bs3xLCNfd4/GfZ54nJTnxjrIfF
	NPY1ieFVDG9vx+VOiJqHxOg6srRNEpnMXsO9rYdcg4Wg6hVdhlMnG+Ozwm80HyrbFK8/Q62lYg3
	Po92GNybuJivI0mXjNpUgHexlgstvRNjs9R+UKam1+gh1PjiI3fmL0sUvXJd1pmLuz8h2D0T+C2
	VNlwB20BUyEPz2scR8O9rCuTXBFGUgALtkpxUmQ3nXKS+hL+DEwOd4T5Nx4Sw==
X-Received: by 2002:a05:600c:348e:b0:49d:622:df25 with SMTP id 5b1f17b1804b1-49d0622dff1mr104970285e9.1.1788769427009;
        Mon, 07 Sep 2026 01:23:47 -0700 (PDT)
Received: from localhost (p200300f65f19a9047ae53bb37ada872a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7ae5:3bb3:7ada:872a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-485883953cfsm22327326f8f.13.2026.09.07.01.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:23:46 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:23:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 11/19] soc: starfive: Add jh7110-hdmi-subsystem driver
Message-ID: <ap50F4QOw7jbcvI6@monoceros>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132729eucas1p1bd78eb90feaf90b6265c13fc7bf43ada@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-11-484f9ae72715@samsung.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dohx7bkeczkqrdqr"
Content-Disposition: inline
In-Reply-To: <20260904-jh7110-clean-send-v3-11-484f9ae72715@samsung.com>


--dohx7bkeczkqrdqr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 11/19] soc: starfive: Add jh7110-hdmi-subsystem driver
MIME-Version: 1.0

Hello Michael,

On Fri, Sep 04, 2026 at 03:27:12PM +0200, Michal Wilczynski wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't add includes for <linux/mod_devicetable.h> as it introduces
many unneeded build dependencies. Either rely on
<linux/platform_device.h> providing of_device_id (IMHO preferred), or
include <linux/device-id/of.h> directly.

The same applies to two more patches in this series.

Best regards
Uwe

--dohx7bkeczkqrdqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqedI8ACgkQj4D7WH0S
/k4SQAf+JxaOkTt0KXEdMeiFgnBOg/VvLQ2tgwyYbYV25ymCW6f+E/Oz3WAI4IDD
S5sDwYSMfEN2g+u3IdIzE3kZhVEAdkv+iyA6MExPzaVz9qaS/A5RwGIGRO8EtmbY
OnW/GTowIQWQH8Fs2w7pe+ITRAhjl+9OOwdM2Y5h4x+EZD4CUz4apRozxIz62mu0
rv5S6v/JdJiz/WNpikSdNzKKIKdq56RUI2KHXKfjqnvCkAHwAVnPfgCH+HNcpJSX
wljKv3FOemKlAJV4uNgIjZs2QqmcGZbZ0acdyNWZ++YujYR8wLjOkQ0loi8lNg/x
i6GGu8ylq1Jcpp7HF98D268WTb+1Fg==
=jV7I
-----END PGP SIGNATURE-----

--dohx7bkeczkqrdqr--
