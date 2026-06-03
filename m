Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B0E3D1CA4
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 20:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519790; cv=none; b=kG/xtQOKm0blKI8eKOvlsO6bXpXNNmhq7JhLDtw9Nr2zrQXp1v4BAWpGYpwA54LWD2ijja6voSrZNMxjsDnaAYkiNfNVexzKP/ivdudr2aJwYFc2SdrUgM2M0i7ky9e7o+zrI7b5m/SN/w8ooZHW8CrJ0tirDywiBBnFWT/bkeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519790; c=relaxed/simple;
	bh=jWkfKdewYYhpVaqdM3YRB41H8EaqffdOaBhBtnUxHB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KQV3h5NIiucH/mMFDVA6U5TuvaWhpNTjldtEdzvMuow9KpX5lFrrBnYZRG4zS8NfQkk0jQL8tp9FrSLbGzOWM415TG/78nBdmjW4aqtxB732B5GWDBnRpxZhaKaFDpzxv02C+nCQPMtvOzULTssui5TMfjAb8oPEViPF1n4PoFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPHHIkQ4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPHHIkQ4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so4063660f8f.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519788; x=1781124588; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2dGbw/HligoRwXWmwyuEZ3eA9ohzHJBiYcKD6StczHo=;
        b=EPHHIkQ4d45Jh2QfcM4y1dC0ZmyYSKqrn8zFYOxzzFLv88n5LZmv5aKCMeTfD7do02
         mtHvpzWeKUKrlwWTtAxdTGlDstYu3k6GBErc0hLrtq8KuX/sTkUq9iLRuuKWYvXeGCpm
         g4x1LIURbI0mt9/WsH6K62G3TbNBklQLKhpH7OQdm0vZx36Fp/iD5fNRkDPeIZpu0nsp
         5KJsYDiUWUcxDH03hYJcN5B2g1NHluokFtordKdf+mdLZhps11DtuIDHmOkeoSpJai7U
         Zp4VHpkQZ5nkz6nCfQySozfCuzoh92OCmgPM5TIXeL701ogfkZ4VLgMc/IOAuWYZKF+Q
         Tn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519788; x=1781124588;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dGbw/HligoRwXWmwyuEZ3eA9ohzHJBiYcKD6StczHo=;
        b=H/UNT+C9ehyzQLgu6Mc/OuN5/kYmWfJs0ZvaHL9up08alGZkJdvDJeqw1SWAPfWCd8
         DnxJ3WBUCtY7d1cD7hVJAUM9Mbp2vszIvHLDHLHdsfAZWEHxffwYi1tREwB63nhhvk4r
         AsZ2ZI2Eg9gspcQzKDZpl5kkbWOA5r/Pj+2Lx0vDExTnOBrHrVz8UZE2i0J5uctMXCoh
         mVvtp6GqoMSJv2I5FZMPhj5o4O/1z6NkbjCfLnBwykeIdYYg/91x+ywbAv+qzaRoA426
         jPYAbRov+iJhv6V35diOpuIxzNreaK9EiDzbJy8ylnTBtAsLQQGW5pNEG+zy0UZSQ+/z
         Qc/g==
X-Forwarded-Encrypted: i=1; AFNElJ+IQ6s0MN/t5iWq37Dp1q3tDIKskEPCBWB2WQ8JRpRxjoHo7ss9sJ1Sm7jOyEQXeSoUC0pQO1i2hsRW@vger.kernel.org
X-Gm-Message-State: AOJu0YzKtgpjJnMHTl9ItasBYRs9hYpJAffbaMUVjeHng62EtBp6Xz9F
	w3kc9LUbn+to4euE3yNk7nMNyW3jmyC2vCBydZIn+gpKo0IYVtqdfEoN
X-Gm-Gg: Acq92OGhEgkpPZoIbx5KF7tZM7NynFZNDw/o28XcESpJTJ1KnD9eIlM+zlCw5KjKLo+
	d247amPxQ/ecBQGBIJ1eGJ6j7Hi8mixRIb6bvEea8yB6eZySjeIXFteGfpgV8B71dBV+m/d69XW
	i29neV1Ne6ioLKRWR9S+kDLbXYaLY7whTYGrnf+U/wIltxNKTA1nXBQdUL8dYC2l+ANObq05lVD
	W6Msk1luWL4W+GR2ozp5ZCvDPU2vu0obnFzTgCTck309+6XU163CxNL5Oy5jEanqkP/t6VyIpPB
	cstBse93OyV+0hMn+gKzwE8OAhD8WlSNb3EaPrlrTg+Z3awZm44gKJYOer2EoDMp70dMf8xkfYa
	TCZa0gsty7JvlZMHAZIiLYzMwCyMXKgWITlSjmJNFfZrQvgWODIMkEmpmiSMx/vUjTqnihVYm6O
	7hU+qCHHZSs9sf84ts0ZT3p9o8IG6w/iG5G3wye6TM8l7TH+I=
X-Received: by 2002:a05:6000:2990:20b0:460:e2e:6e25 with SMTP id ffacd0b85a97d-460219363dbmr5503550f8f.21.1780519788018;
        Wed, 03 Jun 2026 13:49:48 -0700 (PDT)
Received: from strix.localnet ([197.250.226.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fd33sm11286220f8f.35.2026.06.03.13.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:49:47 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH RFC v3 3/5] clk: zte: Introduce a driver for zx297520v3 top clocks
 and resets.
Date: Wed, 03 Jun 2026 23:49:41 +0300
Message-ID: <7973709.EvYhyI6sBW@strix>
In-Reply-To: <99743c29fe81a90d3c1f51889d42ef9d4766de3c.camel@pengutronix.de>
References:
 <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <20260529-zx29clk-v3-3-c7fe54ea388f@gmail.com>
 <99743c29fe81a90d3c1f51889d42ef9d4766de3c.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3972897.kQq0lBPeGt";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3972897.kQq0lBPeGt
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 03 Jun 2026 23:49:41 +0300
Message-ID: <7973709.EvYhyI6sBW@strix>
MIME-Version: 1.0

Hi,

Thanks for the comments!

Am Mittwoch, 3. Juni 2026, 12:14:21 Ostafrikanische Zeit schrieb Philipp 
Zabel:

> Is this delay long enough for all potential users of reset_control_reset()?
> Are there actually any at all?

You mean drivers that are in use on this SoC that call reset_control_reset? 
Afaics not, they all call reset_assert/reset_deassert, or only ever deassert a 
reset that is set on boot. It isn't called at runtime and the only driver 
calling it that is in use on zx297520v3 is stmmac, which only calls it if 
assert/deassert aren't available.

I implemented the reset() callback because other drivers had it and grabbed 
the magic usleep(100) from ZTE's USB code. It looks like I should just /dev/
null it.

> I'd move the spinlock in here ...
> 
> > ```
> 
> +	/* This is a special case used only by USB reset */
> +	if (data->resets[id].wait_mask) {
> +		return readl_poll_timeout(data->resets[id].reg + 4, val,
> +					  val & data-
>resets[id].wait_mask, 1, 100);
> ```
> 
> 
> ... because this might sleep.

Ack

> +	return val & data->resets[id].mask;
> ```
> 
> 
> This will return a negative value for bit BIT(31), I'd wrap this with a
> double negation.

Sounds good

--nextPart3972897.kQq0lBPeGt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmogk2UbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoig7IP/0VOIVlPzWqCbTORa8Ag
o4V6xlbD01NZlIPog4nma5eaAeHlu186bslT26PX+RvCITgO9h6jVYMMw/x0ENgL
zx08FDGRm/yjN3a8OStSgVEIZszr+wJcVdT8m2ODHG+yxLRwAJOBMEpL8oHJ8K3V
FcbhrWzibd5kcCqcE3iODoIzs0yE1seUWsNOPRT9cgrzDekdYufZd7Ytj5doT2Vw
FJwnjvxCpoULJP2OqbZaKu2eAuyBnhd/o96l2SMkz8l/d6AIgnv2cw1RdqmxiUsj
4KDDmNcutHqS5HSg4SowO4pLX/b6vlMzNGjZrjpKgnPLOCqLgCSNLkBWRSA/xRwB
VVthQxmH+JmO6s0h7MxiPEdYD9DCQznvxKW5GNpHFi8KotZtFUOaG6ACCK7o/zwA
VXAr8LA1EMZY7M2ar+Z/Lu0YC73I8OACijBtuDP4/O9olftuXDamnZcumL+j2wZv
L6Q6/RiJBPG588d+5PY+FsSfX9COQbOpL4IzvT6g8LvjF4wkR2m+2zwzLZlSkj/v
p86aL5HDAlRInf/kTP3tt6hz6ksWJN0PdozFM8hLVGBRDG5lFZ/gF6O7Fdxg+0Bv
hyceItcgi/00qhno/ZOXr0I3pqHCfMjVBO5lzeY+X16VfUVCiY8bIcAbVu0SllEg
CtjIia7y5d3THiUTfJ7sfbEs
=x7MD
-----END PGP SIGNATURE-----

--nextPart3972897.kQq0lBPeGt--



