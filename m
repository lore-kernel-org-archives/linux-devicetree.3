Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF0B3A641F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358106; cv=none; b=RZGUfmZWUlMWI2lBjbkjt8GgKil3hGSkzhMkPietvcoh3nMJnTMcWkVft+7G8sWSdDRZW3nAbPyjod2dP4xNRVmp6qgf6hqTjCe9BqWY4o5emFiPlQTGrP3GkZalVXinz9JRqdV2BpnUnumyDpaaigkYokQ4mOsJZRC8m2xGJSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358106; c=relaxed/simple;
	bh=RF1RLciQtjG4YNCucdZF2HdDsXHFqgT0XBY9emkA8n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDl0r4LU62nU12VjCQu1aCMvTkrnobMIqxo6xcGhoHJYruu/POu9jtAb+cxpTBo54HiFxVtSU5qI7LmDwcI0pAtmrquJbjOsxjDqVo6kUo+3/u82HQnW2BMmO7ElTM1RPCwoTKH1rtq8YYkV8dcGoC315LVdV8ije1lAuqOJois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=L9r0VOHz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="L9r0VOHz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so21053335e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783358103; x=1783962903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RF1RLciQtjG4YNCucdZF2HdDsXHFqgT0XBY9emkA8n0=;
        b=L9r0VOHz3B3d/YS09VqBYrtZfrUzpE+kunoQgauG8LmvIu0ZfEDIsJsecOkcpOoVEQ
         ftNrafUFbw30siypAVUF4KiZ1nJaEHKhbCSlsQCatcsQzxZAQh/2WbMTgvvcWSmCEp2U
         btuwZwZtOSdyV2Ay/5U6LP2up3YNeF64jGjsSmHKlDdDYdVsqymKoP6jmIAmebVlQHVY
         KlhnOsEBHEyprB09XQsqT05yQPuqkmRGiPRBzIlJJ0F3dTHHUHpeDCDh8+zZ77e+lP+T
         wmG8zuzubDHmsBsIO7EfV6oeiFQDyEJWZmu6g5/Wnp4RBOm6rdUnlaNN8SdHNEgNyJ6f
         xXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358103; x=1783962903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RF1RLciQtjG4YNCucdZF2HdDsXHFqgT0XBY9emkA8n0=;
        b=Lrm/LpdPbd0OWDVHLyOybANtcxhrD3YtVTEDy8z376Ixm7exU8EswVYcsfKQgXlD/X
         Yqxz+EIodC46vXms3Tcwh3NMEpPhO83GA7rH14+JrbqC7teeavAWM2uEaW2b3EWhlwsZ
         NhRp0cvEzZ5fhsFXFPLB5WN6eCt/e8x7ENX5d0W7X8NihVH9P8BDoEOjtygKyRyMbyUH
         RbW+xAvdxgthkzC9iVkyB8WSc1yv4rf7pHqR6GXR/mDVgxLONU/z06AYWEBf2Up1tuoR
         6RhNa8WWH2LsOY8pN4dp6kBYb7X43uhhak68pJD83ErVCCG121PV8CZ6Br9qjCuZN0BD
         my8g==
X-Forwarded-Encrypted: i=1; AHgh+RpccNhPyEvn4Jk4obY+xxEDmUbZHPDhQDNvKBKPQpdIi0J0pIHOY+SWlQO5KgrQrs4JRLJix30WCjtJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8y8b+IGjL2elxoOoRdn63z771FOvYZBWsPZ63p+2f4EyrEHur
	fG7VYtkvrgezqmfv/zvfchLmfKQkljw8AZeon+6lmMfeX3HLjUCrBEk1vfp+QEKqSTw=
X-Gm-Gg: AfdE7clQayIatAoZw/cE+Sun1oncqQnedkfblhqtfhPSx73C5a4tVdB91DsgxuPgNOR
	3rip36Pdp1rAp2DKyeH3tdRZlpsPwrYTdSQEU8pwhaIbSiK3Sn3Y3O1fBXXEi8u/KQc6a2mQKt6
	c0Q4jbUM0hScnmwpKz+mcc0m3yVwtiltq+at5k6rAIwSutKoYYoGXtQl/qWq7fUKJXYKIkjWXIA
	UZ4iN4m+iFnIvHVF1NaKIBRNfjfPYu1yNHa7+3Ch2NHAfhWsYMEIOm4Ok5cdJO3XK5lcQdW/Sou
	NklziZ9p6SXFa6Tzc1T+C2PDXZJXwC5iQlXfR4jQvXPPhZT6vILBNlxDIW3nbBpEKdt28qgxciT
	S3wRTrf11OvjxYwOAf8REBKsPpJr74h/BxpOboJzRV2d0HuDvF22uqqXnfi4xDgaOPJY1EUnfd/
	YyQk39F/J62emI3VqRR7/yfzUhMI4HhaIvPrXMjtLfHqEDI/4cK4XhZF71uSfYVp3Ry78UEs+KL
	ZBO635ntKwYUw==
X-Received: by 2002:a05:600c:c167:b0:493:c98f:12e3 with SMTP id 5b1f17b1804b1-493df08f73cmr16568635e9.20.1783358103081;
        Mon, 06 Jul 2026 10:15:03 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039ad21sm26023396f8f.20.2026.07.06.10.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:15:02 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:15:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: Add Novatek NT36536 panel driver
Message-ID: <akviZb1CA-tKFSI9@monoceros>
References: <20260705153515.46147-1-mitltlatltl@gmail.com>
 <20260705153515.46147-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="czie455qko7w23og"
Content-Disposition: inline
In-Reply-To: <20260705153515.46147-3-mitltlatltl@gmail.com>


--czie455qko7w23og
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/2] drm/panel: Add Novatek NT36536 panel driver
MIME-Version: 1.0

Hello,

On Sun, Jul 05, 2026 at 11:35:15PM +0800, Pengyu Luo wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Just use the
<linux/device-id/*.h> headers that you actually need.

Thanks
Uwe

--czie455qko7w23og
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL4pMACgkQj4D7WH0S
/k71Dgf/fIQMTUxWesNkPMBne1wEoe4ixrA2JPnwCgHvLX8AFmOMOZdNC80u0jcU
I4Yj0CG+fu6Z5zRyYwmK5r8v+k0bIIt5nYlVkU18EUo/PtMIk6Q1kNxqlZYP0WTE
7qXx070DYHUpJGkyC7X3iiygPvwKHj1NicVCnb7wmZ/ntunppUGFncU1tGQdpZbM
NIxiiunocL5kSXIYK7dqQq2oqqOYx2fN1YQtx1b0nICN6WbnVoD4JPfwU1m3xeF0
cKCwPoWEZUSWL7DWQk+LXnfYMa2salrizZtHUnVqpj1JS/VJsshz92a8twZehx1A
TSGZLZSNWBX0OePr/wVbyNH9CPxbVw==
=NhIY
-----END PGP SIGNATURE-----

--czie455qko7w23og--
