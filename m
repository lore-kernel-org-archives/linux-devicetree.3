Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607024;
	b=wiPS2F3t5xIgvq0NqXNJ71hD/Rdzk1eZsgWNQul8e11KaXwMWQ1F0teb6vm1zDGQ9dFe
	 v7e4eSmsF5ihnpPVhgxQthZgF8bTzynaglAo/K9ucunvqHSrHCRtRXWm9RO7tKw4OLT5o
	 E76rvlAq8xhItgHWhdYIOyCsIIIUb6SQTA4j6WqMzoYs/sUxwGYU6LDxhtSszaZjVPcvM
	 fwJg1ZEJOQruUPvAZjE80cuq3XzgekgT7zEhZ3WMuQYCM962QIe4bt3RfolfSXMSqk/4B
	 zvecUSSssXNB0IQKgV/7MwTp2q/0jUH7Um2c4uNTAUyaYLKtiRWa3C8/mhWfoYieK2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
	b=mplorT4wx03APr5/epFsnHS6nJXXy9qA9E2WKlISBP8bxOcost82yS+WfFCjFC/j1m20
	 tIc3w/x4MmARJd4VkjmCFUTlyP54Oc5xRCJp8oyO7Q3KvgDocm84AOw7eccNpFtsMkQ1y
	 dRNk/+NqhX3b1xR3523odxs4q1ITjsDXaX9CBMdge60otTPKYoBJenb2yn17wJVggUOnf
	 QnMFa2V1f05k0ykMjBxkfgllH/pFnCUd7t5+tl+P5rnROvoL8aLHgYLWHpCl8CjCA30mK
	 ZZ02GeJcBSZlrNtUWZIpXcYofsfZgBMgQ6Xncey9FPAyGOSiy1KIPkpuJLCWjd9WBWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CMRkec4k;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684BE606A680
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684BE606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CMRkec4k
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so40593935e9.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795607023; x=1796211823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
        b=CMRkec4k5ljHKroiikKHK4JTT+TkveMrUsH8OoShvX5KDi5dPTXWqpP2Mbk0Pfj+6J
         Er7ZpXo+2y75226hO+joL+YszbhdM1NRWuxPLKAyEB8pQpjz1DidQalEl4a1lQ4YS7ED
         PL4+0pNUumQ8wO10YMUGsK6lehpVDiG+BMkjoy4YS4BfEUqBSeD2540gXMl05mjpyHvn
         Z6XMOy1+V20r7LVyADNHTgzJf7i9eoIe0AWaBGIGdOli5cuI7uHYFKWZYtWm8k16wUcQ
         m7ZJwnhUp3g4R6xsVYm7WvLZ4+yPkzw5DHQ8jmCE/dx+daeVXeaBXSP0HABTudNC9Z+O
         S0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607023; x=1796211823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
        b=iE+/XgVUTDcSos70y0C0cUeLEfIJLGuqsAEYapilJmY+p6+F0DIgb+eQGm4J/o5MsJ
         KX6qGSBFTeF+0i6jn3DfGxam3SsRt/J8Bhz8k+l6EtVp4Xck69beNClj/OIVdBngo7nu
         uraT+rTIloMSXAykE5//OINSg/7AtrKxc4JB7lWBZloC8xR1MycB1hScRW/yY6xcQ1NY
         L8/baTs++dVAY8zluyIo4ez29FBtDUSPTzEMjw1mfMpRcqTOoIdu+BXSEqNTHqCXLMB5
         y7SgDJGl4cgQDp5iYQ/Z41THWVPbveDtnMZ1trJnJSW02sGUQ+Uy8zXUXcFSWUc4SB7k
         77ZA==
X-Forwarded-Encrypted: i=1; AL+hErEMuiFrsw6Ur1cGmC2+iyeVhGXd3VIc+10lg5AmMcxfdmOxe4tTv43HeLkEDbaAfYiA8tFy7/wK/tlg@vger.kernel.org
X-Gm-Message-State: APuU4Z9+yRAybk23s3U4PZdlJk9qVji99LCBUFykFMRqD5y1ppNSGfAx
	SBxetCwgZIZOZQ3t53/F1vTbGxQy6VoVz0OnxIithpsnLN57aRJ+0WTd/7u1S96lln8=
X-Gm-Gg: AZFdTZd/8oskIRk8omKifRP1QVfKS889VpODseg5QFXeC8PNfxu5LA9YLv+M/Vma+X+
	Tlht881azg1GnLWw+6giM26eUsZxKN3ji4O6XSDOKuSu3nd3tUCeAXrkurpk4jCZwMgUVPhm28j
	i1ean6u5UVA7DmcczqhtbKFqQcAl13nH9Gtw4z/HMDYOPbu55KakCVFn8LgFELA/THesLm/myof
	iUsJg77WDrs/9MqlRymi2JlYiT2fzO+GZPHz2u08EWM4gIq1ky0IEhM9hTI3jOET1FgU7hSuOJA
	o5TirvRvphM8WeRj6WMUFk0Soaoft6+CUJRW81f4SIQa6ldsq3ake8e3IRJ/lJqbTXs1sEtpxP4
	LsQG79t3bmh5M/n/N2ZU4V+JD02a4kRwDc+WPzsu6FiwrAjWFrVqM7yBwvscx51Vlr/NEmu2COs
	1uyllrzikDaqjSc5yCnrnFu8qj8+Pf6OFLHjOVYuTXMe4F70N7wfe7UtuIbfMWDsBseyNAjMdp/
	aI2K6QndVis60uxxJh5kifvNd2W8uGyqP81EIsqBDIE3pQgF8p4B1Ao/Mi2TZVM5E5qCtWqYeFe
	YDNj5AupZiu9J6A3GzQwWVAbHisN13wa/RLQDGNzsDOlqnqsqNiZTgEjTTphkzzZEUMSjLE7O3A
	HNx2tybyjvOJpAhpS
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3b3 with SMTP id 5b1f17b1804b1-4bb8881eea5mr364570665e9.27.1795607022789;
        Wed, 25 Nov 2026 03:43:42 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884865a2sm527753115e9.3.2026.11.25.03.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:43:41 -0800 (PST)
Date: Wed, 25 Nov 2026 12:43:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Brian Norris <briannorris@chromium.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>, linux-clk@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Mariano Marciello <mmarciello@google.com>, google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awbJUwrBQw5TnowW@monoceros>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="huwbq4lvetfh3uwf"
Content-Disposition: inline
In-Reply-To: <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>


--huwbq4lvetfh3uwf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > +#include <linux/mod_devicetable.h>
>=20
> Please include the specific <linux/device-id/*.h> that is needed
> instead of all of <linux/mod_devicetable.h>.

Or better still, rely on the bus headers to provide the needed
*_device_id structures. (That is <linux/platform_device.h> provides
of_device_id (for patch #2) and <linux/auxiliary_bus.h> provides
auxiliary_device_id and of_device_id (for patches #3 - #6)).

Best regards
Uwe

--huwbq4lvetfh3uwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsGyeoACgkQj4D7WH0S
/k7XEggAlcj2TrM3p6EXOwI/xsUxWXF252CxwyEWI8ZmPEpI6bAu6Q2vo1jWzU80
RgNMuXczOoZoJ6+hJdkMeoqHuhp2FPvl718ZM9+ZXmIzmzCoBNWIn7I/StnNApVp
CRTaJoMc3RQ58/iAEYs4Bd6kNCpJoojOnWxMnprqZsXFWDmYDOaKauDIqnRyeGSd
Y/roBTL3HpvnWDZxm7b51fG8984ltXAM06Db+ZRdnLxyged3B5xdXwcFGLlqeoKG
ti6pQXYhQnxuxJFTg8v+DdOAKp8wPe6CkjTN92KfVvWDgxJYHe7zwZ1V0TrgDqMQ
p3mJ8Bmk3uxwBcQfM5lzAgDW6N8h4Q==
=fqd8
-----END PGP SIGNATURE-----

--huwbq4lvetfh3uwf--
