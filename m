Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7934E3F39D0
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374729; cv=none; b=kepXHeAr2WzXe0Hl+Ce3hotXvcQDwDL+NaKo5IdAF1UaZZXPNcylA4tvGbfqsiM+3exwK2jHhfIjxu7jzEWX90aYInJjNX1r01+VC3jYbStpjZCQMrkKAAab86ZOXiHXkN9L+//eszaQHEsINST5GiZ7LMezoaeC9NzUmDQVD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374729; c=relaxed/simple;
	bh=ZjvoAZq6BqkeR00N7bUgD3L00YB0HoOliJ8WeMyqzas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4zuA2fwIMijTy9+Bx+jSXtdIBWya1alq7NNwcaIej2FROkrMtVk4lAkjWU3UhceDtP2u4Qoovk/jxWO9jObXWoqgW6EmVRh3/9WzvUsHbdm35Ic48ChKxCRLpgtT0JF6rgHPeZ45LJee91PkyzBJ079qrugX5vy/CbgWyxMKz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=A9agbOju; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="A9agbOju"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so7364265e9.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789374726; x=1789979526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZjvoAZq6BqkeR00N7bUgD3L00YB0HoOliJ8WeMyqzas=;
        b=A9agbOjulthb4cDLBia/e1cVbnvRatBiT2IdRMj1LqBmpuuLnKM4J0z0oj/TANAIVb
         25HGJFk0Xf2bEPP4o881NehgcVeuPTk1kEGwPAN+gCSvfOsQODsah+jc3g0aoCyiQKap
         2MoK7A927tkAHA33bcum8PdNAePX/YFs0wv4/SntXmkIoD9PeIo1BEgOUCI3YLryKw2C
         hgWYpMXTkqUqCmgpNfGTOkAuheSs3qd7csJ2HGTtW9OzKrQCy7PBcUZALhDZzhDKZAOE
         A7slkzmdVM40zFZ7R9n+B5oHrHCCDr4eFoscZA5yQEoJNiGVhurPLg6k4Yp0NANsd3kc
         hQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374726; x=1789979526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjvoAZq6BqkeR00N7bUgD3L00YB0HoOliJ8WeMyqzas=;
        b=k89KyxYVZgOjkggw3fzQMKkT2G1Byg+PBBjd+xS2HYeTrAQLCXx0hLxp351Ek0PemZ
         xKPmRoEa1bBZiLxRPRWJA9dwpKcRZyzDKuyA9h2m/vQtTCkW3lQOASrg8warC08r78of
         1dDIM8Go0zjItM+GSKfjFCjfPBrYEecY8gVNuOMIk3DgS2DND5hYw7NLEBUnkbw8+MBT
         eZQdw2lO2z4amX70TIGLPWwFm+idB6NnjCBpiRdSCaWWMlirc7jyVdOsOStAi/CwkIvX
         pkUmbyTRXsg2jqpja7NdDAng0Dd9uowMs/OcgnwQ8V5SIryG8nSqk+VgbXixCG3/slKq
         s83w==
X-Forwarded-Encrypted: i=1; AKwUvBypsfMQ8BDMdH/F12YcIosF+WQi+5xuByG7VOQ8ANB8CxfeL7ww1iQNgjArUWN/zt0DFiEHs8ullfwf@vger.kernel.org
X-Gm-Message-State: AFuF++n6GPh7bHJ8sBsYBpYfWjvSRNjZqNkxEQF8jmULt+hig8Ox9JXe
	0Uybajm21MMifXTbkyHIIulel47n71DaWrKzelsLjs00MnsOy+E4GHu9BISLb4ep49A=
X-Gm-Gg: AYBFou3YhpBJpWszql+W3MbrPJrUPllNXREM1OokuPtvz2dnVTHuHbrJGJ/Fi1XZNiz
	Qx+687dhsai6hBsRjf3S9TJY/P51BpxiydlGtYmAhK8pMMvFRCmU4Sd940sGFycjp/EiSwBG9ss
	jxtfy1Ku77rlf8JFngHnVm1vmPSTzItu7z3ONlb1aLc/XgATOBkJc0x3XiEkURCdoNP8mCK/1x+
	sKqCAolQfsbsF1Kp1VB4maUfASAlaQIskzzG9UFgt8QNkfovbh3dD8sHFLnPAVIyKlAAqAJoMjn
	pAFu7I7GYOub+MxvOf0gpF2H0HytWI0LfNIYjdRfpIEz7kBpx0/CvsiSnsKLIuO9i/po+9TVpa+
	qAZVeMOiXWe2lwWm4s3+o7VPy53w4xy42OWgv6iF85jhCXrhoozwUvldLZOMBJeUFb5thxqrYH5
	P6lcMxuZltFZKE1ZO3M/iPuXe/D/AuxQ2rSZhQiyEa0tnsv+FBf8lFlKwh8gQ2YZZY4HMcetDZe
	ZHKGwZImVCKVGu7vGBNdBK6IIze30Pxhyl/j7juflP1711++nUzImNo4ab8HM3xYFqHsW/aDw==
X-Received: by 2002:a05:600c:c8f:b0:49e:715e:ec1f with SMTP id 5b1f17b1804b1-49e7a692430mr15660125e9.30.1789374725646;
        Mon, 14 Sep 2026 01:32:05 -0700 (PDT)
Received: from localhost (p200300f65f19a904d5c06a7863c841d4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d5c0:6a78:63c8:41d4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-486eb357288sm25639728f8f.29.2026.09.14.01.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:32:04 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:32:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: Chi-Wen Weng <cwweng.linux@gmail.com>, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Message-ID: <aqew8W2wgNvlqrfc@monoceros>
References: <20260721062308.536947-1-cwweng.linux@gmail.com>
 <20260721062308.536947-3-cwweng.linux@gmail.com>
 <20260721063343.9C6561F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ucvzjrpo32wzefdd"
Content-Disposition: inline
In-Reply-To: <20260721063343.9C6561F00A3A@smtp.kernel.org>


--ucvzjrpo32wzefdd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
MIME-Version: 1.0

On Tue, Jul 21, 2026 at 06:33:43AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The apply callback returns early when !state->enabled, dropping updates to polarity, period, and duty_cycle.

FTR: This is fine.

Best regards
Uwe

--ucvzjrpo32wzefdd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqnsQEACgkQj4D7WH0S
/k4T+wgAsIgiczkV9Wuo63Pki2TvLHBbduzIfu9P6B0CD5KEzPO6FQXvrCrTNFbH
xicxyvVumhSSPvHN07qM7x0HQZQaPPaH4A399FJHh+o0sQM6lCHlh9GXNcRA9Uls
CLNTgeTx+9YlaafkTMQ4vSUEcYX4xTrlfggluCeHHmEW1XzhppGQpTJufmeANnnv
scuzxuzV0wAD7LV2vHivtgPaShrpR8KhUVWordnkSRmbFGHZ8KfZnT2y9ZeF+Iv8
xhoHpQm3f/zvSGkO5EQUTelHYG+eDxJV3DhdymPoo2C78MhUCCqMEehZ8K5DsI0a
NiGHzjD5LrBJzAIhx4u9CyuADB7bNA==
=RNyn
-----END PGP SIGNATURE-----

--ucvzjrpo32wzefdd--
