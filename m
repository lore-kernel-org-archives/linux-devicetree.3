Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984369;
	b=yIDYrShx0wrci2RV4SaHp39vnrJiIrPoVM14U26cnYDwDIfg9eDwcVyTQVdH9wk03Lcs
	 g2uPtHpovOWd2kav3s0Kpi978sHM94QRRRLUXvqIIBRgm7G++rVBB6u5/ltCAQYoEpUze
	 BkimrAVWn7s8Hk4CVWQU5BWJFjrsc7w5A1rA2BIwtshMQ+BJ2JdD516/fJkZA9hkDTPiR
	 4ySDAYL2G+5rs36z/u53kmGVyQ5+QGXyvhvT0DWj+2eWGbeeXCR/h8Itg/9JpLuwp4nsW
	 6A+MZiVeEO9cxVpCfhycGOoENTkR6Mgc1lc66fmvljYA/RLxD4VxKGqg1zTjX+zjgQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=He80xqzSECUlwJoMnQoGCscLltd1EBIEH84Xtz6o9n8=;
	b=okGWR+aHia7GjqutaJkfHQTYTtu/XDADTs4Vs4IWHIz2kFhT1tLlBJ8U+gb8EYUXoXGQ
	 Wkacg2yw62oh42LZxtt+Q7GZXeupcdFLPSrPBZsBRtAAIGcgZgtOg9xQq76DvOg9FHJmd
	 LJdWWVmssq0hUsed/5AA9qRK2HNP1MjeeSQrqcF6ZdihwDGutbQy/EH+4THS9t08vr7QH
	 miy0jG029TMDwSX+KHahPcxmFPTe3hP5sXv/Rk5n9k53v+6jsfg38POtWC0Q+TXH32b6B
	 GGG8Ww9oyvjGOmUAinOXQH1LtXO4aiCb0DPV9qAktje2tJwo+2AbpWOR6Y3Mh3fG6XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IW9u+YJi;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC5A606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 16:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC5A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IW9u+YJi
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so10810205e9.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984367; x=1794589167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=He80xqzSECUlwJoMnQoGCscLltd1EBIEH84Xtz6o9n8=;
        b=IW9u+YJiOW2+z21M7QUKqWODPqGNgcxkSgBdL8rFtFAPP6DJB/T8SLXqx5woyJxqjd
         s1wm5P9v3mo47s/qZXzrOTtfkr3my54cWP/ahfFfsZIKCcKROCdfguM1qaBrLGg42JU9
         HHz9M9Xv2Ktd88qEPa91zAD8IWrUDGwhbvmRuwYCvGQdZbFV/3cXx319XmqXSe0u1kG2
         GsLzjXBEgl/yClnIBL6ny3sur36m1oj7AsY/Lp/C5u5QuDwdi9ONIoWJ/3fFJRqPV99n
         uHD8ZtgAeLJkRqHM/XBaYT4FuU/LamzAaY32EwIJLgmdCHCVEbezOGXcbqZXqt+4LPA/
         vqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984367; x=1794589167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=He80xqzSECUlwJoMnQoGCscLltd1EBIEH84Xtz6o9n8=;
        b=s3Ix9hn6cs+SHIzVAFfZDpxCgBS1InSmqZP6V/Rqjskx+b8EwbhEj3b/BGd2ueHjCZ
         0bjZ0ikiwh+ohmjJJnyKOPFhAqHHMXMgBB2OcWYRWMd0sIxBN5IycUbvl5ANTCD9BGRO
         pMDwgrMU2m7Qkt+WPSuqfFE9EroAjJn/vRbWB9G5BeYa5L3PlqlVUKu8XKst0h8vrZ1X
         fDEVPz92qM0HaKx7nMlIU+x9Gcb/WhACJJeTMYVh5X6cxrM2vWhHtS5X2mSA8Q44dIGY
         erZ4httxM8q5i9JQrGKQKZA4QsBMk/g61boVuHUzS4GNj7cs4X+DSBPsqRU8hF9Lm2b+
         Vlfg==
X-Forwarded-Encrypted: i=1; AKwUvBwzc3W3Xt2Kp38IYek2kz5zpO8yYxf7hIrvtTtzEFKPmp0FICrBYP9SLHQmRK6i1VBGNTq2oifuAtvd@vger.kernel.org
X-Gm-Message-State: APuU4Z/SIGzAi/8wFNPMKLJVqLbA8QYwRbEF2dfGVcPqNz7LBADp3rvs
	dnh0CXLjwDYeQV2pR4YA+JjBVvMLbyLugv7e8YTWTtuPJW2lNI58vcNjuURIj/rgCQo=
X-Gm-Gg: AYBFou2mNtjI65ITFdwS4iY7OjMO7it00HrP+zwG+g+qTOghtJxrzTQ6HejMVZub6qb
	MiCUphd4OcPqidFkNd3Ap4OuOUai2K/5OwOeZXWj/ISyZyAFGA2aljCc0Ehu1Mi844grOWjykn4
	yH0A9+hhYqVpX4+XUi8Ea6nf4HLqNe82AierUotYgAh5NBk+XXELDrNJXjhFp3f9o4KYIZpD2gY
	OW+Udpc7R3a2BkgUSsLUCBvlzJHncTLaUPza2gBvLIQV5pGeZM+ki63jHs1DR1py30TDwMmFfBI
	78Ri3/EZdC3shvQgSC61lALADUSIRd4OQ17mXwNGZAQ+NWY8pbn5Z71qrIzQTttgcyGzEVPI+NT
	3m1efmuH+N2c+lkgNgvKqpvytx7OIBIcGXsOReXoZxJf3If2nieYJ/cWWvbgXp8hY09RM9vegxf
	kLG9zqtLB/kfTNIkJBBnB0q3WgIrwDGOId/8UxI15v6C91PQwynLnUPp4OgWC/Ew+EAwnoOIJmV
	eRjSEHYTyOnrDb6ew3ALj7eWNoGtqnTCKJSnOF08qU0CvCKsRPBdkiweejjrrkjGlpn4whhyvMI
	C1rv3HN0GZqXWUED2ZRKe5oV9okU44ZkmRbr7QmFd8lndjUoDYPyP5Fr
X-Received: by 2002:a05:600c:3e85:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4b6e035ef86mr50697355e9.32.1793984366792;
        Fri, 06 Nov 2026 08:59:26 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56e58fcc6sm271729585e9.2.2026.11.06.08.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:59:26 -0800 (PST)
Date: Fri, 6 Nov 2026 17:59:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: Add SM8350 camera clock controller driver
Message-ID: <au4HToRcyRPtlOrG@monoceros>
References: <20261104001704.2744766-1-vz@kernel.org>
 <20261104001704.2744766-3-vz@kernel.org>
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
	protocol="application/pgp-signature"; boundary="27unomee4c2a2acv"
Content-Disposition: inline
In-Reply-To: <20261104001704.2744766-3-vz@kernel.org>


--27unomee4c2a2acv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] clk: qcom: Add SM8350 camera clock controller driver
MIME-Version: 1.0

On Wed, Nov 04, 2026 at 02:17:03AM +0200, Vladimir Zapolskiy wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

Best regards
Uwe

--27unomee4c2a2acv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruB2sACgkQj4D7WH0S
/k75Lgf/X/gQ12cXgo6nsk4EXDZYkr8FQDSpC0uKXhfmB/r7EILSd8SjAvIot57F
qB8dFy7S88DSeDaL3vu7EPr1aRkjaxgBQPzybHb9sFTkAYBW++6++VMnsvekOXI6
SqwxrQYgyRF1tIjO2wudqpq34uraG8yQk7HrhxudUJRZRIMfucrirHshkIWQRyB4
hQzb/5ApOHw5zK53j/kvXWMKmlxziXsl1V/6no+W71bgnWHkmuZY+a032blW6xfH
Jyy4w+WBdsmYezTvMt38tUiMQ0qE6O5oT7OLyxgeaSSKUT6QZ9cvi/sxDsngQaNp
qFxPxTJv+s+t8FhM84ScwzCh5Urq3g==
=r1vx
-----END PGP SIGNATURE-----

--27unomee4c2a2acv--
