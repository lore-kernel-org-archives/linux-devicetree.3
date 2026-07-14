Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5EF44D01D
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031958; cv=none; b=IooYt4YI6TMBCICloS//OMQQYBCcS1eA52J2IV/0hA1Yxo3MyBFXp7iMkzj6W7pJeOAgOvkSeH7gf5WaBcQTJ1RLwYFLqp2t/6HbyBG2l4RsLBBhYXn5c/8f1Jwt6aQmyvQIOtGnShehJxCnndJQzQ1cu/ue9twg2AWLRFAFHFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031958; c=relaxed/simple;
	bh=0+vGZfhgz1bD40ocE4HqL+yXZ99EIYUdksleBRdm8Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiwklAavDVnHgKBbtaK0o+0p0xRwrxZ8T98aZFDiChqwF46HMqWai83lyR774hRvIAXUa0gJowp+KAZDfh36xoDNVm+8OYbwkUUWorX055VD29eTDwV5fPZ3B+gLalZXXl0EH0o3DPHcJLBAd1jZYnUPBTP1GqHLvl/CI6vDU7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XbXL7dz3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XbXL7dz3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de0093c42so750470f8f.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784031945; x=1784636745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+vGZfhgz1bD40ocE4HqL+yXZ99EIYUdksleBRdm8Wg=;
        b=XbXL7dz3fsVvyc9B0lAyOQGiZ0GJFHAGz7YKnOfyFIbbT0womjk52r/GJgXawi6QPm
         8btG+ebYd1TuTnvOZRhwVc3bpXaRiT9loRvyur1bl7qO4s0fSRClcW6uamday5gxj+c3
         zve+gSDe5U2DUuFS9h+6QzOnEK4HfUd4TM1UpeRnwj4F84eCqcJV3wue37LBiQc9Yxux
         2LshZPW9jn9L0dfARhojxWuC683EosDYTMaGlXbRLriSqu2S5nPLuKbRR2Ts/mX3f+zV
         0CSkMIKE8uxhEaY1C2FWEyaecif0pMJSGuR8id/UbNiO5MX0jTp9gKpz98tY+jVGOudc
         gIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031945; x=1784636745;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+vGZfhgz1bD40ocE4HqL+yXZ99EIYUdksleBRdm8Wg=;
        b=jT92ABTRQvo5VBuuHcYAoeNWOqE4khqUgLKREZ9O0fknaFfA7xjCwni3aONGLBxvbw
         WyhGpgs4Y3ivb0q7HwwdZpvSRqmD+Zo3RySD1VcAzzXkEEgcm0ARz76UXzXbGX1f3V2/
         fd4E+uymvvdbdLN2ovwnivVlk74GrVyKmRNyiFsPStkow1gEXbz1XSoejD2UC+E2rWJq
         qrWkKcLIj3E6Nz6wTLJrthn4wJVAVT0pA3sesI3c5K5AO3+iavepySrwzBbx/SMmdVjF
         ROgmX+PdycTOxtUexlsu2Htj7RZ2lTnrAU+4jbE3r7v3fp0Jz7lizvt2Ftb/sxEfOxJ0
         kPFg==
X-Forwarded-Encrypted: i=1; AHgh+RoFOVWebz/9T2cVAbLjAedMmf9gactKQ523G1eOo23hBXbCV6kqcbyFvSXV+f43IQWTfzZ2YnFQQIdX@vger.kernel.org
X-Gm-Message-State: AOJu0YyIdOll5q4MeO6WqstdePBg3Zv+VgCwFHTrNNTbIzwBoXPWRr8m
	bpXgYdVfetMeRkvFq2e3IZmrmE5rzjh8pZfli0tODxWiytXadR82hlIFSvprELYUMRc=
X-Gm-Gg: AfdE7clYByc2JWfpLv9bkLuwglCZyuAHgOuqLTCnEgQiS7B0KFQM+VyATmYWHCpJfkB
	8/X5Wurr3U5nkZCXWE+xbHUIYRHLaF7FsdPjEf8B/V7jcmtf+WkT9O6MMzknon55gDBmVbiPMKl
	UIsXCyhlePMNRg1H16BkYg9Dmngr6tGrmw7E6iE+Px4snLDJxdn4WJPn139IvloTBuv5HaLqVef
	GPnNSuX9uYGTV+py6cKpiZqXhoSl3R6aycCACBRXxVp4QBSqtfiocVWgVomPC5dC5gvRhZ5uS3M
	mdOH4945S5BW3xSpng1Z6IPRJiTC6pD+JkZ2eRT+5p3Sw3NrOvYsWufYCWB2ncH20exo1cHctBL
	1/0kP1ajdNgvC0j+ua/CIRtv891RiNQDU0FwI1/QpUqPXuDqoJ36GMInNNQag2geDweVhjZUkLm
	BZGKIsjhcqxVNV+dVQ+zgYfm8ycijtVHWM8Y1oDvsnn1jIHpKEsqw10D3OuXdSEEp4kIDuqNLb+
	fDb
X-Received: by 2002:a05:6000:2210:b0:46d:d5da:f0a8 with SMTP id ffacd0b85a97d-47f2dd08423mr15598269f8f.47.1784031945403;
        Tue, 14 Jul 2026 05:25:45 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4635a63esm8284732f8f.9.2026.07.14.05.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:25:44 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:25:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH v2 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Message-ID: <alYqhghiVxVW2vQu@monoceros>
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
 <20260713081127.115197-3-cwweng.linux@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2h5qyp6npg6rco5"
Content-Disposition: inline
In-Reply-To: <20260713081127.115197-3-cwweng.linux@gmail.com>


--a2h5qyp6npg6rco5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
MIME-Version: 1.0

Hello,

On Mon, Jul 13, 2026 at 04:11:27PM +0800, Chi-Wen Weng wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the include for <linux/mod_devicetable.h>.

Best regards
Uwe

--a2h5qyp6npg6rco5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWKsUACgkQj4D7WH0S
/k4ixQgAlt+F41bzzFr8wApKEHEDE06Wyl2Bj9mhJ2lBUH5L4+vpMsXE0WVLJKmu
HL5Dt7P0owSyciNzhp+pTCgs7ucr0yB3ysy+rILUBGjH8sExdTwINM8+0I8q2mfq
uUinfFczaWbZRevyDkY9F5RPUt6WGRFz9uNnFrkZfNHOJL4jo69d7MftM0IW+ruv
2SQnD38ccuoMsiZYcVDkSnDVXcruoWqhk4ViKjx/a6i5d0HhZHyfA6eSAaSfR8zf
dHm5Fk26lHBT+xuv2TXw5FDGI2/h899mXnFcQGR9zsH5ImhmUvJIM+sL4FZ4fC1A
UTd+40tRC7LtdqphWXA0H4oK7F24Yg==
=GMY+
-----END PGP SIGNATURE-----

--a2h5qyp6npg6rco5--
