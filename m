Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76393386552
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760573; cv=none; b=NAWnEPoU9qD4JQLJNm2uTarzzYi48pzikXl06a/VRqv/xqvxG0XSGBW9tRRMWwjGacIR9YHiZnoYsEV9/eg2zvrI9iETCReC5nRvd5y3enpF6mkLHYOtCtDElh+FV8gfjRPw3FZO5CCCiK/xQMnt3LGA4lUUB+e5abJ6+tLx+sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760573; c=relaxed/simple;
	bh=LmVQj7uu7MJqrKqgNSP5uYYVsgcU/25VPpMhJmIGlMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfiprf/eh6bVkDIjUib2oFXnaHeoAvFooJgOdSKLJ6nR6DqjOGHs9Qz6QgZ+2J8xY9/gawXqXJD9h0F8G3KPAbMw6GoRkUVarlw0jR/JVZZ877bsNPa3izmGepykDHFPtvAD43hFi/SVw14Q6D20en6BLfjOW3HAEwOrHY/wUmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Sztr5wgH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Sztr5wgH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so13297505e9.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 16:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791760571; x=1792365371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LmVQj7uu7MJqrKqgNSP5uYYVsgcU/25VPpMhJmIGlMw=;
        b=Sztr5wgHMnUNvoPb0SWAp/YNM6eyxBGF/XwVKdTFZ6ZSDyZmpkrRZ7B3hxKuza9qwM
         sYIEBqQ9SUbmW3ycIykNwl+EuLJ7WQMJOLEn+mHlOIbZ/VU7HbysS+HT1qK03qODor0i
         xZBYGTbAjH2fp3xoZYI+DGTijLEsczwgnXVV1JwdHkfIWczY8aAdqZlc2BVFSBujAUv8
         hmWrUeqOAVTxWNNTTk7erKumnE0ip2PPsexJNPJrPkUJP2TcH8OCEtKfvqYCQP6gsFo0
         f8BpfnIIedJg5azpYToOigcDlSucdnOQSTdoQDHg8kmoufzh8v3hJXTRWW9WJrQNlbuV
         bQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760571; x=1792365371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmVQj7uu7MJqrKqgNSP5uYYVsgcU/25VPpMhJmIGlMw=;
        b=Ci9ne7+fKrPJaz4Q6P1JLH7f+UDoMI0RoppeELOjDgdG/ylPIBYDiN4tHBmln8WLMT
         8tBcaKlofQyIGV2zf6WAlKenOjquLaw91lHOW+pnRaOdXQpExwXqP5XbUUgObkMqaKfU
         F62eRbZPC11YT1xHAkxT0QPxxd6ySLgitmtInYVwrEkCCiXPKb5Wmf65pHs9SzmzYKyu
         Dln6Bsdq1NwIuknhYluX250HVYYEP4J8ZfWRj7CACJJbChLvFIodYhIQxVuJ8q47OS1F
         fCpCeN/IDnI+9zk6iTI1T5WuiLFs/BSINH5MaLQ+8rRswUer+WL5xvUh4Om24c3TB6+Y
         BKKA==
X-Forwarded-Encrypted: i=1; AKwUvBz5BX8MQQtn0iycrxWCF3FRDnL6NIV9oXQflW3Um0kjd9VN5XAMeOaZ78S4bUHH/9NlCGiPQXd4MHQn@vger.kernel.org
X-Gm-Message-State: AFq9FYK3omWkIu3HwjqjnHv10cxL0ARMqXUvxIDf3b8aiF6KalS1+kOF
	1rYBJBa40jiLt8/eQsObB9NodhAuIPJG3MW+hMSNSMCHDMUE9wCpur1DPKz/fMk3OcA=
X-Gm-Gg: AYBFou1d0RwFup6vaR1z0RsYk4eUpG7cyNsi8dddQ2gnP+WFaljv7UzwoBsVMZvyZsn
	UPaK5BP+7k28YAKT5PQF1S+nlGjxWvBpztyCSKUXdQEsKOFqsaX0LPyQjGfWh2C3iFxMQWh0Cpw
	ZUd94re/VRFCy01gvQE+b5w7XvGKzqQGFsBBzzauhQnxdlJVlJxTrF57AQzLRCevEOTdYceffjk
	BdzV5/gSuzGAXDH2gbj4Oa2keY4vjgdcGm7DBLgcRv8kAofER4qS9O9eJYlkOhBYTg75vaRfMk0
	XyoxmS+3Dpv5fEF/HdGnDMNuejfW0EuiDdo4dYIjiYnDmOMHZjmptzbOy94Xc6gEv+2lUHSxIfC
	v6x7Tu1GNgIu7w0DZxKs2b6Wk50DsAv/EzeBike4TROPM4ISkCMDYzB8nqSuiXHtrvygTMKEtJb
	Gw+c5WU3q1NGajCR9C3vknFeZXSUwPGBVxKy4qcBQuq8P3jSWrCsu8rPZeaaPEIIyaToTQsQj4l
	MM=
X-Received: by 2002:a05:600c:8105:b0:4a1:775b:5eb2 with SMTP id 5b1f17b1804b1-4a18e48362emr139928885e9.13.1791760570708;
        Sun, 11 Oct 2026 16:16:10 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18be964dfsm240506775e9.7.2026.10.11.16.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:16:08 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:16:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: armandas.kvietkus@proton.me
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: aw8697 - Add Awinic AW8697 haptics driver
Message-ID: <aswYYk71JspzTQaO@monoceros>
References: <20260930-mainlining-v1-0-c303cbdb00c8@proton.me>
 <20260930-mainlining-v1-2-c303cbdb00c8@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ridkd3llbbsodmf"
Content-Disposition: inline
In-Reply-To: <20260930-mainlining-v1-2-c303cbdb00c8@proton.me>


--5ridkd3llbbsodmf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] Input: aw8697 - Add Awinic AW8697 haptics driver
MIME-Version: 1.0

Hello,

On Wed, Sep 30, 2026 at 06:08:04PM +0200, Armandas Kvietkus via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>

Please drop this include, <linux/i2c.h> already provides of_device_id
and i2c_device_id, so you only gain unnecessary dependencies here.

Best regards
Uwe

--5ridkd3llbbsodmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMGLUACgkQj4D7WH0S
/k6kxQf+IukpznR2fVDe2FYjwtjDRNGy/yLsBjaEG3d4asAugaTEUfUdBPK0dCFW
zgab2jxZXtXpWm145NHWKc2TXTY5fdbyzDo1lLTObUvw0XqXoEWjEV2Z1uFhMx2z
b5SpQGJhkddN3tFDIayYA5uFwo9c7vYr2w2UjXnJL4YAaGR9UETvZgP3FeuBs0YI
kqqR/z0K4q9zTl8LqcRdV8bkRBzetw8xopnurhb8rkB5eNwc0kUsfHG5ogpHyXGT
CDtMfYaqC9NxfohfFB2/0T/ITMS2HmQ1koWTWmyY/iBpCfWjfbqFlBrAR18rD4V8
GpJ5ZqYJeVW8FJIpYCiOsjce2bry9w==
=8biG
-----END PGP SIGNATURE-----

--5ridkd3llbbsodmf--
