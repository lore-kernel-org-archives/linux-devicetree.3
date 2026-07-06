Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695243AF640
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358432; cv=none; b=S8OyD6W3rT/C40H2x+SZzK4d7u3IADQtsut3kiD/Ds0/w74+SgGC/c2ct6iUChOovLuSnU2MF1RQjZre7C6kc4UfW61A4LeHJdxWtVNeIJ0bGFc0gVZA3S7UBQc4wcqT2/UtOuOYnsje+RxpnY0uxT1W+DDIonLGbqcli3trpyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358432; c=relaxed/simple;
	bh=Mp7TsHkn9xJ+pikfESNSe9yySUGwCG5Wam3E8OaHVWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aK066TiGequ/XgTT16++H0ebsN8zkFM182S5lX98GJxksZ71njizeFdzMwI7Xq3UeO9K45TA30GFRoU3viFORxWNKIeybXD5kBvb5yllZTz6c9A5IYYcvQsNFBPjQTUWOHm4IhLbA6XwRbTOyyD3lVB605UsZ8Tm359WCRR2py4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pmvXlDOK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pmvXlDOK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so29613655e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783358430; x=1783963230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mp7TsHkn9xJ+pikfESNSe9yySUGwCG5Wam3E8OaHVWI=;
        b=pmvXlDOKJonxKisOAl56v5lOfSYyCl/S7TiGYlTCd2YkH8f7TED+cJ8unobw7A5phC
         sLQlPU+cxcvU3Q+ss8r81nl+N5lNV4eyKhMOvWPmSk1B2ubt6FEACkKcYug458UFxtjI
         2W9TlFHLPh7AuYFNlOjCiB7MDWda1n8nv5Ng04IbRJjsl3qzOh4Vlsye9oPWjEUwEZqR
         RkK13+YhhbXMuFbJK+GmxSQt5bvQm/Y2bGeLI1TI/YhwaGM9Bdh3tom5MAY+HTrmACMN
         XyoUUV7HKxmVyBnIu6ZqcrFmxZImngYgeHciREc+qXf276dsMI+dGk3YOCg7T03vpf8X
         DEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358430; x=1783963230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mp7TsHkn9xJ+pikfESNSe9yySUGwCG5Wam3E8OaHVWI=;
        b=cX5CAsVsz5MH12XJgwUhbBove7deNVr2oz9OQOdEAp5V35iDXh9u16h36nGe7bWu8Y
         xWhbB2nrPCNos+3clcdBhhG/bMhGvop2qYGpnaVuQLRwIqFBclhTiBP/Gt8LzMgRr41J
         2xZlUsW2F2nVBM3YS+UHH8PHOf8u0o3Y3XNRUg/YFnq8awz1NAA8rsTFWga+VqClwyJ6
         5CgNrn3HcPsfyejvslHWumQiZkXBnY0TUEBZHMX2v56PPOOjq2tqHl8HfxMwm2e+kJp8
         PcCHHAmHn9oeSJbJNcBBHI0ABd4KOjtkaNiIlp4gPIXbtokt7A2Owb3dOjNKjuuVe84U
         +XLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAgp1tW7HXw96iZRiMMotjLry5DMsceVC6LTF/L8LJJx1NS+vNHcnQmXtTk2ZfeDxPIO5SR7kNSjZv@vger.kernel.org
X-Gm-Message-State: AOJu0YyfZZwLBcElhScuyv2dZ3ttfgbm0zwfbM1mMyOuh9CJKfHSTPdG
	WFV40zB6US4xBG1HJVb/4vjQ4RcIGEycDrc0eDhXQ0DabTm9mSFdJ8ajx3q0Mz+xI5s=
X-Gm-Gg: AfdE7clE1cMw0d8Q856p1zmnBc5vlt3fpGdwdoZsSpyvCAL/E3Bw5P/cogImJTiaRc1
	PyfWjF6Oo1GiueYvfhc2rHpyPITj8kIECUROxY8dzy1D7qYwW125zvTio/Xs7snQSpgkIFIwcKA
	NyuccO8LVUO24AuzcdZ86xIm39lyYzmhlMG9udYhaQIrHEKbJJEEZCQwQRfBbG502/RMJDv4yW8
	uBbEwJBx65Sa7tswVJUjzArYsbkZ27pDPCJUZwqMzllsd3F30SXckp8iHKNxENm9Ui9sQlTBV7W
	RflEP4xnUVUe55RfG1hpnJAX77IRnQMEgZGmz8fXR3bIxOzb6Of8OIDbsOghTY/0sngGGskPurX
	SEYErJzJsh0yg1EzHcCxbD8lpU06LFm7hPuM9A9fAt1t2pDvHD3AVdj0/ipwtdbtT/w17+aB9aC
	sWEiE/UaR5agsdGerLapFm4oEmxe0mwxRw7A46Ilogr2UGJtx8DobmjgJLpY4puK7/y2zltvAWr
	V0=
X-Received: by 2002:a05:600c:8b6f:b0:493:a7bc:5bcf with SMTP id 5b1f17b1804b1-493df08cf98mr16574335e9.24.1783358429855;
        Mon, 06 Jul 2026 10:20:29 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493cce0a7cfsm296307765e9.9.2026.07.06.10.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:20:29 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:20:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jic23@kernel.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, julianbraha@gmail.com, 
	marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v5 2/4] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
Message-ID: <akvjxny6GB895VlY@monoceros>
References: <cover.1783028033.git.marcelo.schmitt@analog.com>
 <724f2408cb84bf4546115408fc9857777e6f2fd7.1783028033.git.marcelo.schmitt@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7rbryfu5lygbuf4u"
Content-Disposition: inline
In-Reply-To: <724f2408cb84bf4546115408fc9857777e6f2fd7.1783028033.git.marcelo.schmitt@analog.com>


--7rbryfu5lygbuf4u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 2/4] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
MIME-Version: 1.0

On Thu, Jul 02, 2026 at 06:45:27PM -0300, Marcelo Schmitt wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--7rbryfu5lygbuf4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL49kACgkQj4D7WH0S
/k5d3gf9EExRfxR1MBmVjLh8REAJSVQz7XS3XMZBEqlbu8QR5O8YQhhoBzlVm0Je
f3iy4GaZf037urIoq5TesdS4lLX4eHjePeIEEHmim3MDSOkDNydCgMtiM0hGJFx0
yoHiKRtHXKqCN7RqLxh7Vf5CWtHZzA2rOZMZD94lkQ33BA086F7diD94vIyhk4BH
+wSX7SZQnAqlnSQMwBQnHvQvrFLdKOMTpChGFbeGfY4db1cW6Vsn3CMWJWu1s898
d7jrNkPWQsbkliZ/l6rHolZjfHnU1UfhxynLLvXbvisl6FpmEAn4/g3aFsoQawTx
2VEbUEa0SvzsotKPEP3Bv9siVeTe3Q==
=ZC/I
-----END PGP SIGNATURE-----

--7rbryfu5lygbuf4u--
