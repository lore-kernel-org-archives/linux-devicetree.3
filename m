Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D7D4119E3
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803676; cv=none; b=K2cTA9VFCwhZvLyGTBVxLD2JxiGdz7OmPBaxDPZKABmdcFuHvqkLaaXXeAt905XaszCjYsNVKXt9VfHBTVy/JmwW/E/GMfQHTjDc6o4W2GGgXtjNa/CFJVwgyAwuJrB4loovrdeRQNfgxCK1oleZoE1ByGPT3ZcMP01t/K0w0D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803676; c=relaxed/simple;
	bh=uB+EhctYOJjiUgeuo7dNIo2M8JJ9CsWEY4PYvk5q0t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVncHFJ7sk4syrQFXIgSyMHl+NwWbj6pFkUPMI0b73WDZzTAW3218omT9rrX9bIRcvTe0/kDICmHa7cyxXShsdYBFc64YlHh8goRCblSdczj/Pg8jMpx3oPyx5JxOLgIo1XU3/T1+cqYr4vIF2O2pgOHnjBBZAzj4JlBK972w5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=feP0b9Va; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="feP0b9Va"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a061a13884so15122775e9.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791803672; x=1792408472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uB+EhctYOJjiUgeuo7dNIo2M8JJ9CsWEY4PYvk5q0t8=;
        b=feP0b9VaSSkhBWGLwtaOQXTbrKE8xZuZuvRoI1665nKEJQynzcwkmYwOVM90MAkVN8
         akC1u4oIcEidSi0bu6x2t2RHCDPveclz3572lbowcrF+PjH281apE6N8kBm6J5eio44N
         O1zbmxY97PgA7qKLgxNzQBzdTjuwkzaa5MRu0Lv2DfoYSuqYcl7M6NVzxd6sAGGYxxMU
         k+lVSTtCgofV8XeA85ZDw95cLJNBiqslhrJbLzvG8gnSQ5XmtTvrWBgnbZhRvf2PyTbs
         vNj2YoNL6RCpeIFS0u0Ml10eaLsp8QuhLCaAXtet9Np6ZNUfABS66SH0zPqLgYbwZ48X
         dZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803672; x=1792408472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uB+EhctYOJjiUgeuo7dNIo2M8JJ9CsWEY4PYvk5q0t8=;
        b=hdawcHxuggCXVpfj/bJIuGHYtI/2PRYCySKVibomsb5xIMOTnKfEU+IXOiMH3OxJ4m
         ivkB03/WMiUWnAHHObvOsS1a9I9J+TsKvOMfd09FPGXA8uwC98rsCNAEwCcMii+f5q7x
         zCz/P1z5L3XzA5l/Tzu0w5uoLEaUcJGOxDtGN7lZElr88lFkbndzrA8IAM5ZqN0Gad6f
         8tUhn5rbHT8W6qtmNiK4xxaLyyoKGcQE3y5dhSCjUpE/JJGyGJyu2++pSYgbcNC6YxPZ
         E0+D/u+CSDUrXn+utilHsoz047GJAIXgQgkd3EcXEDvkb25MfFa+haueAFgKF4wsegit
         VNkA==
X-Forwarded-Encrypted: i=1; AKwUvByGQdt1ELj6KUlWFQMY3SeydTF349XlkLu79PJIVuR4gWx9Dj23HtKrSXpG8wR09ZO4zkZXsaP5t2Is@vger.kernel.org
X-Gm-Message-State: AFq9FYJNWhxGoBgq9BIuRH/IPA3g0gpo5sRcBzKEu9y0d6r9w5T64L+L
	YvggJKUfFTGkuiPg2/Ga7G4le/8E8O4m0moFf+gM35a/IHKeuvICerhZmPZZfFG+6BM=
X-Gm-Gg: AYBFou0RAeUFYCmr7D0kLlczCabgXzFDU2PV4xIIjl2Ttmv9eGTgDvsqPwuzwiOlwGr
	mYy1iOagpXFkBIYyZ8vaqz0jct0jsYz8AegmM5C3NDYOAf+GjH7A58FX/G6kx18NE8syS3lmdAa
	Q41l97NctFKrFKc7giyFO/6VvAlFszgPy0uO2oPH0OQt9PpFmTU/ceqzZwvhA5Ql4PB5PH5QOLl
	txh/C26HjcPkB9VN3FSZfeKyUtCY5gBndU+CvEb1ROSOBNlWXLSM/5eCnagdGXrFn2zGo9Qgux+
	0+bTXN4GsepizlWggFEpT3bumOSdVldoJQzpH6iYr72EFOo8mKilOfzv1qoWTDv7PL7iEb5EcUz
	57Y5LVF0WK8dUT86eaJYc4sTXFUvhgTKx7fmMBlPgn6duoxzyYFfha8F5liWIctDyFi9aAZo2FV
	z1cLE99Br41z9FqzDoDPjUZSocK7v9m60oxMokytGaIeJ5vFdMY22o7fDigk6iccux4inRdzVo+
	VJtnH3LCFhasxhFRGi0J0AYkQh+yUAyqx0OSDh0zpkQ7HenNBDVS0hBe+mWXQ==
X-Received: by 2002:a05:600c:630f:b0:4a1:9f59:ee7 with SMTP id 5b1f17b1804b1-4a19f5911f4mr44897885e9.0.1791803671322;
        Mon, 12 Oct 2026 04:14:31 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48ddaefa06esm2597263f8f.20.2026.10.12.04.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:14:29 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:14:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Serv Pol <servpol@tuta.io>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] power: supply: Add GL.iNet GL-E750 MCU battery driver
Message-ID: <aszArhrDM7DzITUp@monoceros>
References: <20261005-gl-e750-mcu-v1-0-499d2e31f786@tuta.io>
 <20261005-gl-e750-mcu-v1-2-499d2e31f786@tuta.io>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d7yjuxhsuiamtrxl"
Content-Disposition: inline
In-Reply-To: <20261005-gl-e750-mcu-v1-2-499d2e31f786@tuta.io>


--d7yjuxhsuiamtrxl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] power: supply: Add GL.iNet GL-E750 MCU battery driver
MIME-Version: 1.0

On Mon, Oct 05, 2026 at 10:25:25PM +0000, Serv Pol wrote:
> +#include <linux/mod_devicetable.h>
> [..]
> +#include <linux/serdev.h>

Please rely on <linux/serdev.h> to provide of_device_id and drop
<linux/mod_devicetable.h>.

Best regards
Uwe

--d7yjuxhsuiamtrxl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMwRIACgkQj4D7WH0S
/k7sWQgAroYgP1mHB9Yp1jn4yG6DjNDy+RIzTG6nPXmFnTPvqkw2LaXBq6h9vWY9
azRLvxYkTfN8+Rsilq6ANoSpKDiryCW4vZ0Dj7lgpZ5awdeNf+o5KoCpmn4nmznv
ibLeJtz7TDfldnA7FR1+vOiyiUqZjstujOOpbBTHLBAd6ZkpbCtgkfhm3YsOfRjR
DmGb+EBRH1xG1QAXFiL8cux9URnOsrEVw5unUq2KuwzvZbkAN8ItzO/6NQ7XhRJ+
IzqRvPvgst6TiXxowIdVkbwF9JT3+rrB9Xa9UvjTXMOQZJEt2xuNCml3dMkpHLvE
QfnxsUx3sShO2HYDb0w2Td2augUolg==
=S0V3
-----END PGP SIGNATURE-----

--d7yjuxhsuiamtrxl--
