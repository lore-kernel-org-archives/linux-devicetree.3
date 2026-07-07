Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B97423A9B
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433845; cv=none; b=JdiaeL05B6J69OEAui5gkKE1u76k9GqJLtOmhLhT7CH3fFiWKZjyyBTvrDwtV4aQapA+3YH8vU+6zvkBg40NLA7LotLSsB2TU1Px3CH5XTvu9rQc5wLzzCkjktZy7VBEbAm/8B+OZr/UQk91V48WDasa6ilIvvxoV+Y0ZPVv8DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433845; c=relaxed/simple;
	bh=jm3Q89ETvzF3BJNtBW1Xhay9s9laR0o6hISDLguLBB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrfwM2yzjoXOCYpV7+G0LzOWzDiX/MqyuujPEyCyym6Df00meYfM5zF7ieu0XR9jxMLg7o7Tti1LpbenQtWVNWS1zOl4Ag3MDkIpvQvnplFPZ3aKVslRkWrDkk6hkabXDfSqtBzv6QfPsIXkbKKJY/ocvqYe8/w/bro0FKPWWfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z1UxS7Pa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Z1UxS7Pa"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so29671635e9.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783433838; x=1784038638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jm3Q89ETvzF3BJNtBW1Xhay9s9laR0o6hISDLguLBB8=;
        b=Z1UxS7Pa82INkm3qovtHzJB9fTkcMedyqBiPw71I0vVNMIVmnLgzA99veEk/h84Bke
         /gSKzc6jUFSOq4qDjVnUfxThgNg7soiFq/n5/dULIqZVCuvoumoJwM2HdG9f0IvQQ18F
         yP3yGHT9c/oGIfkPc6iP25xiCqPTReSXj22wRluOXt3mxZy+UmAzcsmMYAO98KgFM7lB
         kikoC3++2mcTmx9MBdYKXQ9FvX4s9B4vrq4x7s1W4igqZ4UJkzG2B8I0pmH/d2JWnYyY
         WIMUGyFlm1e7IqoCDdExexSxOsA7/08NtjQz3qpYAUYS9bh+d4ehfnBjSvr3xP+sb8XV
         MIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783433838; x=1784038638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jm3Q89ETvzF3BJNtBW1Xhay9s9laR0o6hISDLguLBB8=;
        b=XvZnb1RbbujlQ8M/gJv9vRMXwfR9r6Ay4BKe6HyI05LzTJyK8nyCIGiMn1mVM7gNJP
         j/XAjz4UoJo+4snHP4K77+3DCae7rfSVt6vH6laojxTthZEkFyeeOHucSv6lNkszAiOO
         riM5zg/WOYzu2TXVBV+uPF/62YZxwrrmFdydciwEfdmIVHcSzsn/BkUN1JbZxRCTeuWx
         pKJTVLo1srWjLkCnqvaTvg7ssuCOaMdNvyelYk/jTl6C/bYwDpPvood+BrQANFXGU6TO
         5Ih1xvhuljeCHD0CC+Cdr6pH50sGhZdEVkJvYvVvX1uUGQHNI1VrVLmN1PrXbTMFTCek
         pHzw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1hWIIvF4uCEEOjBExmz2VHdVttg6g8ncYOk3yumapbUt9KtR9rq04I1qGQABGSCq+JaTTh7W9W6Co@vger.kernel.org
X-Gm-Message-State: AOJu0YxUGYHDWt03MQalA4/+OLMZ0QPGpzKrV5fUXMaUhFkcwcdyM04y
	c1am6AJwYHYqBlh+EPFrCOaCgcyNIKsaAtOe1ACU/QaNm4A3NptoojzXdpl2ISJeIow=
X-Gm-Gg: AfdE7cm7O4Vrh3BINDcbH+8mUSZp06iuFly24UL28n1CkyJqaAOBXMmnElGnhgAnp9P
	enXfv7taCWFqY8KsrF2fbsR99cJUU7jcTZAqvYFyCrexcPaFPMVBWOACJuXnG5IhNn7fMvRIgYJ
	CqNBO7346qcoy9vXHeH4Jp1hyprhSt052WcENwbHhQLpnGMH8zmn/sS01LFqESTcJ2ftUJPnJiW
	gR5kGB/vKWoCNr3uP0cyvqPGkkknyGIWEWkW7SvyPtIdZhilw/xTYPubgw/bUPFEPP8EeciR5d7
	vfbBAr2wu7RBM8fzlf9Sub9IwXjy9KOHFvTvfb3QH7bXMXKov05YQFUMMiDOKCo7dhsQ801YZP5
	owYHNSb2R9STBk8WFiQI0SUhcKGxH1DsvD/eM/4yzWFufDOEMy4WgZUSlKHttn/fYuGQQyHZOkg
	wEBwLA3H84wLEtKcByJ38AX+IpHgc9CqHF1ep9+3oowNxKOtc71rJ+Y4Kwhvt57zRiFTCZCK37J
	gO3hVB3TcXoG/U=
X-Received: by 2002:a05:600c:5297:b0:493:d1e0:a4f1 with SMTP id 5b1f17b1804b1-493deffbf21mr62810545e9.0.1783433837670;
        Tue, 07 Jul 2026 07:17:17 -0700 (PDT)
Received: from localhost (p200300f65f47db045364d369605955d5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:5364:d369:6059:55d5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e4ece328sm1454885e9.1.2026.07.07.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:17:16 -0700 (PDT)
Date: Tue, 7 Jul 2026 16:17:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 3/4] powercap: qcom: Add SPEL powercap driver
Message-ID: <ak0J9enIwkxSCZqy@monoceros>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
 <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="it4ah3j67tlrz7ah"
Content-Disposition: inline
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>


--it4ah3j67tlrz7ah
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 3/4] powercap: qcom: Add SPEL powercap driver
MIME-Version: 1.0

Hello,

On Thu, Jul 02, 2026 at 10:52:56PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--it4ah3j67tlrz7ah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpNCmgACgkQj4D7WH0S
/k6ebQgAqj6vA+XM2rEqVOYDBn8xem4ZERrerDT/s1o5DbAjXKSiNq8TSWSupaVR
kxH+C+z+g6ad529Q++GsHBZBrFDd7TtUVOk55PS+MSgL8dabDHpX1D/tB3J0IAKM
766n6r1Xl4f5A2Ub1TdAcNQeoTKslYlIIMSYbdFly2vFzSHUBjlKaAC++9V7qGOx
OW05sKc7v7ugnUblleS3RsYh6Q5ntCZ7eEmFcZbv9q7eSLRhLlbDW92gRCvircyl
d7JCaiQNKPiz3ByWdDwnRh52UZfhlShQLnd6aXlA7Tdida2LACin1+x7ADM5oKfC
YBiHpN8wPiN/xC08/qm1aFg30+/G6A==
=MTaX
-----END PGP SIGNATURE-----

--it4ah3j67tlrz7ah--
