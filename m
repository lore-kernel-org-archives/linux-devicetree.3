Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421353B992F
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031270; cv=none; b=GfJMTJLEnUi0RGGeVIDawFyd87oHV4ITorR3lFmUdvzIejNyIosPSPoRF9sY4JN02FS+WXtdzdehKasDmXjojw/SqkksnMSd8HuzjZPBB2/q5Kfj4WwSeNpQv2hgCCW0h5hclWeJ+0T58hUZc2icobu6Q1wBvLx9g71HVLGm3b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031270; c=relaxed/simple;
	bh=ixnjgUdXzfzObTrr/53vwxz7xzniOOSKaY/G+RMri6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Elz62OzUATnBfL6cToVdsph16LklQ0Gcuxej4Z0sbTbAWFWSIsWbNguP4Y8uvzFuXIV0oRz4M5RzTIFuMXD/lBTNCT0tum/0cpuhljscBMevYm8CCYPh7eOdCW1t1+QcJRlH4TjyNNXbom6+wcKNJWB6YP9dzGJgjZe6JCMwrbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ljDnSwk0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ljDnSwk0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f60208a5so36466485e9.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784031262; x=1784636062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5JJ4kTtQhf+mxJB8QH4xv+X07dhaoQyWUqwyzTRdFrg=;
        b=ljDnSwk0SrTCbco8CVFVXGpBWBaP4qz/FywC05v4XWIuCoFLpQ4+RBQqkKPBGSGKsN
         qMwpAfmKsN1eieSUzr3rqQxQouHeh4wjyYkrKZUF6sdDnpa9+LjZjIZrX6aNQPshXubL
         k2lGESJpeYreK+scFRKkqXx0eo9lUwQfbYYviWFnlGsx04jQzLHSe7DgUI++TjrHxlkX
         dSmwcPWFuyxInQ4WTdbbEwpiLqvRsMdNV9YhbxqMzJpC1xdSYInmfG9JSM+3V1O9z6Zx
         RGPh6LKvmHUGm1lm5YRRWMenEDtCXfelr7VvjNAm77ClOtpGKFLmkVtJWaleKh7zONff
         aYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031262; x=1784636062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5JJ4kTtQhf+mxJB8QH4xv+X07dhaoQyWUqwyzTRdFrg=;
        b=GdYCvGiPpwu4JIClEHYieAsTpjRIyZYeZIzjf6mYqqp0frhOHl/O7q64G+RbsmIZ09
         +QBofRyOZXNql55BP6vjpCFJRHlnNQ4Q1g7PwGwh/G4BIzh6/TWqvj29Xx9IETaJM8kR
         eWIyZ7fQCeU5mgBF1R5xmVhS7n3vByC6kALmgjvI1VoELCKY/DwqLrhv2RQqcMyAlhGC
         qt0joaguAZUbfS9sNe4P3YMUf5m2UCYtBvxF7NhF4x0sTAKihLMRJ7sJtbYe0tVUm3ly
         FZnPJU9UAwiddz4RsQ86BwPWTXgkNqZmcP1iIjo4d4Ysr/0YTtddBSdBcZAsunCRMtL5
         2WSg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1ezCdF8i0pZsMIRJxtkIlYCSjBdpsLfvK3fI+S2OaJgHOXqRUxwO6m0Pwlzj+ohkWIw8RP/BFSfFy@vger.kernel.org
X-Gm-Message-State: AOJu0YzLtgRTQrpWKYiNNJXuCl7oqzMAwc2gmoyDUqeZ5QTI+w3cEhIe
	4CcteVm/V/7qlyf6eU3d3vkH54OlwYXpBzrZd/+gzaTxNmq38tNKhGPxViJxzHmCLuU=
X-Gm-Gg: AfdE7cm/KG6BhGWQD78pnXziha3DfAp+iQ1rmTYlGd0Le0dsnhVuB0q+fthua4H0q64
	owG4ccWmXNBjJbx96V+ObCM1aO/QCvvCmjiYMSd3J9VLONap9vDkyy1+1POw00/ROwfaDRNiCiF
	Whq+oHzjDwSa2ohg3UJKusc7DTwEqf913dg49wkw0ZOkIwEGFG72XjICpJ70Rdt3ZJQHOzt/VM3
	BsA6p5WMOxWtdkxo0txZ6K5FQ4B2drPoDU/b04JixNZfCx4hYtVGvIg1RzA1ROoI4fiDSGpLmzO
	UQlzuAiWJfRcmgGFgDqOKNT3XQYxrGh14mpi4Xq3dOsIsZLpXj61yFwban7cqmYud56f/MXsVDu
	h8U6r5fhfqufnnWipqowPnYll0UhBHt3dlknSQkA7SFf2jwhBzuFbXLnje4mLNjcaGo13U35pDP
	BqT3sMY5bHoCjAcHgyZNw+y9TyM6rBnqML4uFNGHwOXJuasZCtjDF0c/aXaDkZgpzjuPmQcOnPL
	XPZ
X-Received: by 2002:a05:600c:310f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-493f87d6196mr131633285e9.5.1784031261675;
        Tue, 14 Jul 2026 05:14:21 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49508727f7dsm72931045e9.4.2026.07.14.05.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:14:20 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:14:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Leander Kieweg <kieweg.leander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Subject: Re: [RFC PATCH 2/3] drm/glanda: Add initial DRM driver for GlandaGPU
Message-ID: <alYnPYdzBRUHBCIR@monoceros>
References: <20260714101146.200416-1-kieweg.leander@gmail.com>
 <20260714101146.200416-3-kieweg.leander@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vomlj32cvkk2bmdr"
Content-Disposition: inline
In-Reply-To: <20260714101146.200416-3-kieweg.leander@gmail.com>


--vomlj32cvkk2bmdr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH 2/3] drm/glanda: Add initial DRM driver for GlandaGPU
MIME-Version: 1.0

Hello,

On Tue, Jul 14, 2026 at 12:11:44PM +0200, Leander Kieweg wrote:
> +#include <linux/mod_devicetable.h>	/* Device Tree parsing */

Don't include this header, I plan to get rid of it soon. of_device_id is
provided by <linux/of.h>, so you can just drop this #include.

> +/* Device Tree match table. */
> +static const struct of_device_id glanda_of_match[] = {
> +	{.compatible = "glanda,gpu-1.0", },

Make this:

	{ .compatible = "glanda,gpu-1.0" },

please. (That is, a space after the opening { and no comma before the closing }).

Thanks
Uwe

--vomlj32cvkk2bmdr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWKBkACgkQj4D7WH0S
/k5+ZAf+PCrH1KEIEe5DEhx79yvrlJF2wcvN6MSddreJROzzmTkLNFRMKEE+/Obf
MGsYDEskqaj8nzNTf8/v31DKVdOC1nYy3wZEJjBib4TJz70Tyy16xPMaJn9Aj9dx
bthrR7oNOkQQL51gGcNVTVJblZX71D5G8w7JUvtXeD9fjP9yyiZA7W0WlXLyt4fw
A7CkhG/rtjKRA8YR5/FYE5u7U7WZ6jG9iJkk2z2TE3KD8g0Q4tCHcRYwHB+P/xuI
YlzkCQ2FuSfOqiDJgYmz6ytFZEWoVhr3OOo3SPlT6DBw2l9g8AWrTVAaDt/7rNO1
TwijzResdCME0fHMgYOLkpRabjtKHQ==
=0Gj4
-----END PGP SIGNATURE-----

--vomlj32cvkk2bmdr--
