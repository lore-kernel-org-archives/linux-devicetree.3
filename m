Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551230;
	b=PNVMzPpA5ZVCiSqR+nQXtOpDWgYUpZJ7fPWBHxFIkAy4p2LsaUOUXu5v2t0KUr0zHncI
	 pvEGdQ2c8siEUp9SMOf7pJvxz24da72a0bjMh5zjrOmQKXYqoog89Uq0GM3PUNrQp67o4
	 7yokhLTjChMAMoxELHXsm2vMF8cuyMpm+LzA4b6+7WQs5Hyn5TU1ehLlJZ9m+CCNb1Nir
	 eNscYMpSlB3K+WMaSa+7v/aJYsWLQk7yr0cWkPkhrGPnBIrGKasHJOe5GPT8fWyr2xcil
	 TxFt1qCxSG+bp80Xem7vRvIfaQEwLp7HDDKDIJXF+iptO1mI/GmRl/8jqSyF/QVSa+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XltNWiKtwG9iBw8+GH1SYk3VMgJFEJVDDOL9ejVnQFk=;
	b=xctQL6gneqzv2RdCLvfqBfdYEb5q0iv7U0z9bt+94GmJqYMdVvNH/lSkWlnzsmaY7Ks8
	 0jYnH9J1pCbmOabwzNv+g/ngEumAgjtCmOAhZAQIbm0l6Gjbqj8fBP7+BAwU/qw7wk/xr
	 mPiwdI+lKpjUhsJ+BcaeGNPnxQEccUl1Eo8KDLejOwz0i8z5Cuxq/kTJ5qsfz+0EjEsDW
	 4eSKYzZV+aVmFo+VGzXZMx6us9IQ1Hm6b2ok/MvX2XMNNEg+tBF9PIgy1f2xXyNz157YN
	 4jY/nIERFqEK2v34oeXU2bnIzATxMRHE0Q8AvunhckMVhdg4FPq5avlXji6cv71lrMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MUvxZhYm;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C180606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C180606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MUvxZhYm
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so2975395e9.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551229; x=1795156029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XltNWiKtwG9iBw8+GH1SYk3VMgJFEJVDDOL9ejVnQFk=;
        b=MUvxZhYm5+xi+SJfP8nHhsZ1GXHZRgKcmtYpFlDoXTjjRpAAhHrxK/sL0p5zR3UDxZ
         zoFe6J+qpK86Rz4t3v2DUKvCLnSK0WziR5goLmM6ybJ96s52a7n4l6ssjhqsUYaR+Jm/
         Xs9hOLXj9PE+uwryRlkvLuERCrqJTf3zLvvS2FCslyTZTd9wswIAMULtnwF8vJn7f2H0
         3wTzjD8Hp6/wsmtQJ0eNgdgUe4JwuhUhUM8UnvqdKeyZwp2YYRSg+jZBqsj6tEhsE3zD
         Pz/u5C9YRb5rfcke4Gy7OJXnRI/iCfjiVWknhEe2HE/M51peV4kwHUDOt1TkMoov2shs
         xFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551229; x=1795156029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XltNWiKtwG9iBw8+GH1SYk3VMgJFEJVDDOL9ejVnQFk=;
        b=HX4O6yeNyepUyHtNqY2K/0uCqNpWgAgiqp//Lcq68As4yIOVIxdpDrfLHupj2vWYsn
         xD8nWYiCGCzINHBHtBRTUmq39neZz+Vth0M+L8AfvVs3MxqYla+rZoYqr3SLvuNcAi15
         jRRHJmcOClYjXNBkjAQ8PBQetq7BhwMt5awwAk0Hh5CAGqusW/GmNi+009ffztvbvcwV
         WDxghHUe4wBf0vOYZYYFnMObc1VAqLbalm8HdscPQ5Vg+A2IMbs2S/od4mHk4MNjyQPG
         w3a94N1YLsa8bNx5j3leIOw+0gMlIhyCSCSc3T/IifNxDnRrsV9IKNLwMK5osqC0mGeV
         Rzqw==
X-Forwarded-Encrypted: i=1; AL+hErGnVHutLUAh2cm7QBOkRj2FydSI1nxYnCsnTb/lUqYmWBCh9lxh4Zby877HZLnGJuMY27ZwchYaBW0j@vger.kernel.org
X-Gm-Message-State: APuU4Z/PMZVZ/P69hrPh8+cux4ksUGkGenOhhE//6Scrj1Lg3KwYslcT
	fwfrRYNzCU1jSLR7W+9w0g1OtTBiLFcWJ9atctwBO1Rl+4EDNjcI87HiIlab9rrhm8Q=
X-Gm-Gg: AYBFou28Nvn3ob5XAXtUVWYU1mxBr0cRuXof2X9N/OrEZnqAtXzP8KVBTORGjEclNU8
	vqPY+PaF+aY7t/j6lok82pWMkp/ywUxOx76VEjpKS/8LdmUVo9tWZCeLzvTr7riFphv90DbcpBG
	6euuClWbEPg/aobgIKu9x0MVLJk1AU7lKk3xBeUCoNlZJKDcwQ9U3cYhS3cUtdAcFnleLG+9y0b
	OjagDfXkXOzYIb9auQw77p/kygkiX77yQKk2Y0h7MMHbOWIOuaPejz2Ieb0Ll4OqladShVxrh/x
	eIQClljMcPockDUP0PgTnbnDkmTX3hOKZ4l+dHKIBTqrr40D42Aso8QCUxlaFR5pBmduAVHyLiv
	YlOvFL1tQva79AA7OUhNYp+hTxFnNoAisn4ncn6uJrHDANSPBXpDpjWHXCXfc5Tay/IPw6pLX5R
	6X3cVikUcQplWbu2d+z3UM1U4Hzk67k66G7QPls4n97+DwcPx4wZ93/strGmb7DZND0gIq6mTht
	HRv+AB9RzE8xB4bCaR8bg4C+FunfbChsAuxsiGIx0KohppfBJMh628ZTppCCVAkuPNoDR/ZvacP
	wMkdY4zaIPYLAo5Bgm0T4h/p7Gz5pFOlHMfOtK+cZCW6uhd7nPSDsQEPWT/3TxllkcYU/PNyLw=
	=
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr36037725e9.0.1794551228841;
        Thu, 12 Nov 2026 22:27:08 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb4e29daa5sm133039875e9.12.2026.11.12.22.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:27:07 -0800 (PST)
Date: Fri, 13 Nov 2026 07:27:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Val Packett <val@packett.cool>
Cc: Sebastian Reichel <sre@kernel.org>, 
	Marc Lainez <marc.lainez@gmail.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	=?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Danila Tikhonov <danila@jiaxyga.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] power: supply: add Qualcomm QGauge (qcom_qg) fuel
 gauge driver
Message-ID: <avatRCrAgoPjV7rP@monoceros>
References: <20261112170841.2189322-1-val@packett.cool>
 <20261112170841.2189322-3-val@packett.cool>
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
	protocol="application/pgp-signature"; boundary="mwyna4jkd5v6s5iv"
Content-Disposition: inline
In-Reply-To: <20261112170841.2189322-3-val@packett.cool>


--mwyna4jkd5v6s5iv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/5] power: supply: add Qualcomm QGauge (qcom_qg) fuel
 gauge driver
MIME-Version: 1.0

On Thu, Nov 12, 2026 at 02:07:28PM -0300, Val Packett wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>. That introduces a bunch
of unneeded build dependencies and of_device_id is already provided
(without these dependencies) by <linux/platform_device.h>.

> [...]
> +static const struct of_device_id qcom_qg_of_match[] = {
> +	{ .compatible = "qcom,pm6150-qg" },
> +	{ .compatible = "qcom,pmi632-qg" },
> +	{}

Please make this { } (i.e add a space) to match the most common style.

> +};
> +MODULE_DEVICE_TABLE(of, qcom_qg_of_match);

Best regards
Uwe

--mwyna4jkd5v6s5iv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2rbYACgkQj4D7WH0S
/k7nbgf/b6/rA4kIW1NyMoOtnNVBeGIHHHNfMkct33HHb1h0CiT6Hd1RLEJ6HH+F
sW4pjg7G0QStID55MbOeFsfsHKUaOEsaLwutZ3fATturnz7k7RZRvLfAjNtR3k18
hiWFbFdsTjH6SuQ/g7OijXpDO+E2v/5FHg8g/V0U5xwL0w4sWAME2Gxrc9Aed+1Z
yb1H38UcmdaYkNs0WgAyYt2rGVtGDyt5nQqLm9gBfrCvoxDzCIxgiXJ61C9JMF0t
UIk/sLbujBcPF2qrtmodX0CUE07kBKD7PV1TOWjB7Gcz+f3E/X3eQGPNNOk8mEQn
pqgA7hr5DNGO6zRenFbDHgtssAhenA==
=HgBt
-----END PGP SIGNATURE-----

--mwyna4jkd5v6s5iv--
