Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E4B40A938
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 19:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153218; cv=none; b=NLoWekVDoBhVLq2D2dyn9BmD219LbB9gcsT0FhTLGiZahmYSNDOR2nP4aA0vg7LoST9PUF8JD76acRW8kvnV26vav+/mWjMaBo8qtXPzX2KRTBFl/sFtFKcXbCWNzPYKYpKCsuvvYqt80RjBerqoQbRphU5udQFLHVPtlZaCjD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153218; c=relaxed/simple;
	bh=4ZtekrvSZt7MHjr4SZHmeMiexH0wFmTPt1K8GIiGr/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXCKxxD/FxfLPj/5EkzU9DnlwMWR6WkNYLdupgYO4K769hsFCVwDBq0+RSA9sHP84TxUQzPH6rC2J8AnGuEB23MErp6k6kG7JSFh48MVl+hBlz3zygtM58YLk8/Y68tywJ/uJXL21ero7BpDBf06+NhtBuOHvszSebXiPKSolgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LmNQGXlL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LmNQGXlL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso1793015e9.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 12:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789153215; x=1789758015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ZtekrvSZt7MHjr4SZHmeMiexH0wFmTPt1K8GIiGr/8=;
        b=LmNQGXlL5Y4S9REa2m9zYM2zbxoICOj106QyTBt2o03oEIUCXfftZJkfd3dCQHBkkm
         ft5dMwkeJLbRLdb81oCnBx5Ku8l0CcZQgFsNfYUGyPoJqq+F8erO1vHxAin0q2zDUSv+
         4QAW6TYZ+dMo7dvD4rawn0pUtBicgfFxaiuKLtlfxslhuedsk0tn396FgW2kFBr903et
         DyrTK+UIXnMSlR1TL9KCxmtHJ+c+HQl84JnARxodseJ8qjGBd3yfnBRkk9Gg5r6wKBuW
         ylSNDogQGAXJUhJkqsHlF6pnCrYLr3lCgddOd8HCJ0TpV+ol9vsqSpV1qfE7RmDlz0cM
         U0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153215; x=1789758015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZtekrvSZt7MHjr4SZHmeMiexH0wFmTPt1K8GIiGr/8=;
        b=ArnFAFk8nstnTa1ySClvQGCU3L0AgEWviuVFzVao/TyLn+fpi4lY5QkrKFA1pEEhux
         lKJyQhlcvc7/mi0DoNoCCTW4MUOfM2cSzwpyh3FIZqMOIjP0VqWZHeF1UEcLvIVa4tBM
         6RuhnjplNyWexRdpZG17PPaa3lTl1+me+YtgfsuQqbON5CxDs6sJ2r7FhbMiI1S2iLGo
         jwCtPDdha0ZborRxvFXqOud6SDpRkkjhIpinXnnuQI2v0mrWhH/xfuY1urTQLKsba/E1
         mHTpmW00FCN74N96EHfa7fxmJ4bARXHZ+CSwoeyC6ByNMpFw2g5LMtQtzucHhH6BiTxX
         dq/w==
X-Forwarded-Encrypted: i=1; AKwUvByxYLEML3HDBqeeJmK4QV/11ycugL5tcdinhdk+14RyGVhvHybGlZ59MUseffipAv8Fwor/VKlAZt23@vger.kernel.org
X-Gm-Message-State: AFuF++kh5/gbxHWVNEuf1xAYrDlTZO1llXyiPK8YpiOksrjr6WC/RjYF
	qUt2uBzb8dzZClOxn0k74N8TqqIUaXGPK92Cr2KbA1OKj4d8AZ9oRupAx8YZ5nnQ1U8=
X-Gm-Gg: AYBFou3D94bIsnwaqsyC6tSkq7cge0yzPuSGdY/zff2Ss1MaHPhEE0JZ3F7btSuqVc4
	k2QaSiRBV0XNFMEycg5FrlCe96hS44h03M/1gIhyN7wDgaSQzlXS9knzEa7Cl6p8elCqM3k4I6K
	g+Y342zWixnQRgG92hcr9Sf4T5cnlEjh1Fvf6lA7nqqwSKEu/uWY90HUr8y71MZ39/h7FYdv/Z0
	+2mwQngG72tCbsdWZj/oGw5OrKNnonJtUwm+8P0hHR7fj05jzg7xeHzRsq4ip4yxNODbPfsSOcy
	OIqCgVPheAvRrIYr6o+bzRUE5Qwu2u54SPNFux4J3WnMXKmjFaBd7fduQKocvoaOF5MLV6f1mK0
	g5XekH8tY6XPeZfMX6H2LTZTQ6IjPB23k75G/s8QhRQ0CjwMReik8wYrDMxCNSHqaWa6GAcNjat
	IC3F4B74l2YwzHH7TPD1wMgi/G26LGJ22vX4m7JPwN8ttwX8XDBO0Oh/sl2OaZ5DW4Soy5spUBQ
	2Vh
X-Received: by 2002:a05:600c:c178:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49e61a15c31mr134264775e9.14.1789153215223;
        Fri, 11 Sep 2026 12:00:15 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49d26be3e0asm191106785e9.1.2026.09.11.12.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:00:14 -0700 (PDT)
Date: Fri, 11 Sep 2026 21:00:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Input: synaptics_tcm_i2c - add Synaptics
 TouchComm I2C touchscreen driver
Message-ID: <aqRPGt4WJ6aYG3CB@monoceros>
References: <20260910091405.354058-1-sevanevorotov29@gmail.com>
 <20260910091405.354058-3-sevanevorotov29@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qn6sntu7ctfew2tm"
Content-Disposition: inline
In-Reply-To: <20260910091405.354058-3-sevanevorotov29@gmail.com>


--qn6sntu7ctfew2tm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/2] Input: synaptics_tcm_i2c - add Synaptics
 TouchComm I2C touchscreen driver
MIME-Version: 1.0

On Thu, Sep 10, 2026 at 04:14:05PM +0700, Vsevolod Nevorotov wrote:
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/interrupt.h>
> +#include <linux/mod_devicetable.h>

Please rely on <linux/i2c.h> to provide i2c_device_id and of_device_id
and drop <linux/mod_devicetable.h>. (And in case you want to do full
iwyu use <linux/device-id/i2c.h> and <linux/device-id/of.h> instead.)

Best regards
Uwe

--qn6sntu7ctfew2tm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqkT7oACgkQj4D7WH0S
/k5AlQgAoq/MkGLldNzQZHH9O2QgklRLKn3AgJJy9K4GAIyb5IILN/eM8VDBAFMF
6zykFb9BPjPjOpTxbgL8Xj/QfNTQlUfiLr6O2ftLxnXaJ4XQpGnTjwhuz1B/kL2p
lMUpxSlrXAy5itIgCk6qb7yx/JTGL0LPctqidq5/0FAfo5LDGdQ52nMDYE1u/z9B
w+P3XMncaorfSlMH2r/bN6emTJcrUuLl0ZNqwGNRYr74+EC1qM0pm6yRMb3muqEK
4XSfIOT1Vg2zeA9H80SK6di+VMgy2HpTHhqAzT4/oGgUr2zRYz9bjUgToYGPGFHC
h2X+heeQ1/nTr7EQ2BMY0Rrw6RybRA==
=OVXg
-----END PGP SIGNATURE-----

--qn6sntu7ctfew2tm--
