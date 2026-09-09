Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E468D57D208
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963767; cv=none; b=YXDYWgn7ZTkN5XdWtmVSYal4k5Z5o/BHSaP/XDQLAoPMhFtJ7DsjIeqyZrCt7KZa9pzoK58gWqJiBUf0I6V62iuLIb+O7WwAlsPan+x7sXL34xTKp1vpGxc2O2SuU3CM9F+5SpddlpPsaKaTZtV4dSyD8NmtA12eIW5x5KNAs9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963767; c=relaxed/simple;
	bh=K/agZdMyKcKM4PBRai2GAcUit0gR2B7Tc9oCBirO3wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp5Kg2RHY48D86TF/Naq6sJBUhZCfqVRF/G54nP/dI/Gu8mgMzMoVhtzl4/57uE2L7u3gFKAxLG2Wbfi3V1LyT3sGhN845EBF6Ocm8gImVnWLGLLzQfHNeZrI7fUdeoGHju2psHeH8sjYqmclG1a7n24enaV0S0ElRp0EulSit8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WU7D9nDr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WU7D9nDr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso57837375e9.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788963764; x=1789568564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K/agZdMyKcKM4PBRai2GAcUit0gR2B7Tc9oCBirO3wU=;
        b=WU7D9nDrxKuTsbXYAUUknV73kY+b1IhFbveawnYzuEKD0ST+sLNDpnewOqXUOwIVov
         Snr+09H9KC7RqGtTKdThdyerzg4bnmSazazChVt38HmVNxUwV1iV4PQ0kMRCGwdNIYVW
         cCsGucOHD9CQ1zRyyTefkiCbbO25/3Av16aQr/MLO7qXgN/FydjHcxr/nVTiWjnl8I78
         UvbyfFtskq6s/aUCeoDPVDPq1reCi6EpVkvR0cCNjXn9tLSv+ZTixM8440lSw9OTd+JA
         MY5OK5YnaHrr4IaMFaiZWtgPGLJ70EvbHvGTXKmVtASt4YKElLejvAUJrXZGGjClYPU0
         Xk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963764; x=1789568564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/agZdMyKcKM4PBRai2GAcUit0gR2B7Tc9oCBirO3wU=;
        b=DsNz645kRDgFXmxM8DdM0qk154RCI3m12jTs11eyNOzOxVNU7gCm2ffxGLmqeA98Ks
         YFPM+QoTCPgekIAWaQaziBkXsQe59zoSPleKrkPXLAdyJQe7r2zdoPjBn5R1Ef8tGg6u
         Xz4En4AxZSDfGVLbWlmVKcl5sn0oMDS9w0L2I1YigNSqB5dqpnn/7DZ12IjPuHKtaok4
         6qcseGsrQiXX9KVYxD2znhAXJQQLLU4pU0/SHZmS6hNhEkVYbujOhxxP/aEmnH9jsFVl
         7B/3zNif4yQ1Gjc3zB2omBWvJz35xSjTVTmb+QvfTTM0TwO7dTBlxASySXwQcc2lfgdl
         KR4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYdGaJIzDPcgzG6fPT/kCUruf/Xupc2E4I9O5YbCvGEMSzzhNkxV8bWSltd6CZ9Z0kRxLGZZHQvOtL@vger.kernel.org
X-Gm-Message-State: AFuF++kX5NoDgTrToxNSXN0eVqcIrYmGkSC+qEdCb2W+r4zYsNpTmTS5
	wvLHNlmWAokjjpmOOcpfxIwvPD4LNuSRxXvv3LfvY89nP0i5cdidZBoxKF9Mey++r3pm5vIfosh
	rCr/f
X-Gm-Gg: AYBFou0iOlgREuwVo/Fb1PwiU6Nt2r5NKYkjTYvPcZUjrbbvAe2GjfslIJWU1QLQwMP
	jF11bthTcUJHMw3X6iruf2qgeMRZPeCUGPjeiawyzKYScDuCjCp3OTvHnql02wpBCi47Npco68P
	H8v6XYwLPsrcRePM7+td9kUQ0F+fW/HcSlCrByCaI3f+TW+ya2ZDH0Gh11HO9dO3Fm1oG9v827y
	A+RwQ9+fkK8c3XOf7E6v8DJZr4ca7W79Js+sO7lP3Y44Ve+nVz1DYllzSjZvFn8/sh4FL3/len+
	3oAx/R1SbwxbieIQS1kJbTOEUtMSu6aI1r8GlPX2pUZO9xURyc1ncDXOkc8qCjpuPK6AAlc33ch
	Uh2egK/DTi8OzoKYmLuRwhESXPyL6x+DQPyisnDiJfR0cE8aAzwU2Gr90uukYAgKgbJKufu9ula
	KljjFYH3umF/+hcMYUBS+glETUzOKz+GEXIiwSXYvhUJbRGypYdDfJ5xHJC+5xpIkTIZ4e0MfcC
	zaw5T14UmSNF72MGW8FEjgOnpQ9nPM9g7hiSvzF2DE0cd36eyMS9jXuYmIlgw==
X-Received: by 2002:a05:600c:3115:b0:49c:e1b5:b2bf with SMTP id 5b1f17b1804b1-49cf7f48645mr357100075e9.0.1788963764200;
        Wed, 09 Sep 2026 07:22:44 -0700 (PDT)
Received: from localhost (p200300f65f19a9042846e5e8b4b91e99.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2846:e5e8:b4b9:1e99])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49cfd3f8192sm433887725e9.3.2026.09.09.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:22:41 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:22:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ariana Lazar <ariana.lazar@microchip.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add support for PAC1711
Message-ID: <aqFrNywuzlbCPXAv@monoceros>
References: <20260909-pac1711-v3-0-dff81003b82f@microchip.com>
 <20260909-pac1711-v3-2-dff81003b82f@microchip.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nda6bilsfrnoksc7"
Content-Disposition: inline
In-Reply-To: <20260909-pac1711-v3-2-dff81003b82f@microchip.com>


--nda6bilsfrnoksc7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/2] iio: adc: add support for PAC1711
MIME-Version: 1.0

Hello,

On Wed, Sep 09, 2026 at 03:23:35PM +0300, Ariana Lazar wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Please don't add new usages of <linux/mod_devicetable.h> as I'm working
on getting rid of that header. Either rely on <linux/i2c.h> to provide
i2c_device_id and of_device_id, or use the headers
<linux/device-id/of.h> and <linux/device-id/i2c.h> explicitly if you
want full iwyu.

Best regards
Uwe

--nda6bilsfrnoksc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqha6wACgkQj4D7WH0S
/k4pBwf9HMHE6+LiElw59mvh7B50esffyJs+75+O47two8cqCFL5pIZ75C1Bhf2L
5Avi0u8+4M9eEOSxBdZhYORLo1a0yP9gfK2nRcrcj47KYngZg7Ss7jGKIn1MNt82
s6UFapgx5vTvRirJ1S2bFYFvIVrXlXnl1Zz8xMSrOeYTy6XwB2re8g9L02PWILWV
67hTqAqiN8951ovK1Do14dG3FzisY5x4qVyJyo+HdI1UiVaBs3eLAlcHILGS71tE
OrXNyW1CLi2aNUC7ozo83ZvMY29ifc1WKfiUA4rl+/HgmHV34/xw6jORCsP+17f2
1lKL9L9TnI3HGjMzkyRepYIWqMlV1g==
=K5yF
-----END PGP SIGNATURE-----

--nda6bilsfrnoksc7--
