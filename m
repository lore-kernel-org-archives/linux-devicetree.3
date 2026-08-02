Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606A0229B12
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 22:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785709430; cv=none; b=ae4WrjNRq7O3Guhmuiy9HroHWa5WK6RFBi4n7aRJ6xNoHoa2pg3kb1/f7yegacH7O9OVUf9At3fn4EEPzcAwPmlP16tXRIWy9leBllRMnZu74HIERENJUe6EcLbNLrEUH9FoN4J9M+tKpetXVKKagGeHTB/FjH5cJCfelAqAR4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785709430; c=relaxed/simple;
	bh=l1ZnHpxm2/LMNQiDhVhwSE0m9IpcWUrwKDgA+ZpNiFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdOfRGnp+NwbaZmDg6eaaU4b/Th++rY47ySsGxBd+q5m0pdtTq2O3/krLXWf/vxNvkJe5FTq5DMMI8kYjiy3kxq9c2VOJY0J9WW2MtqX1G5uiD5XaMQlAd9/b3dmY3zN785bDFgh2td3n00i7nIDbQup7SOIvX6DdtcFeFbHGxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=biKhHYEU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="biKhHYEU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954afac04bso17320135e9.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 15:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785709427; x=1786314227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1ZnHpxm2/LMNQiDhVhwSE0m9IpcWUrwKDgA+ZpNiFA=;
        b=biKhHYEUBhRisKnxkGyEKIEDf803QjLlxC1C/l654mvzhuoyV2ocylZRdV4RFT5FeC
         xTDQy+dTgsct3jYVWZ0+/lPeLbpWCF+JGffDvKRRHT7fm6gaJbgVMeVD2ygc97j4oTj2
         5DXbptSW6Hf9A/WjSur0gZVFZhBWR+k4pCkAEgUP4Ri7A/TWOf3nFAyVDqP3+1N8xB0I
         eRhZ6I8FYj8HDZZZFaj/r0UhhT6ZQY6GF7foTCWw1vP59wnZGeiCemOo6IGeq6+GUWtF
         gzwIfRJso5iWMHtBVkGGCZzwhlAjOJHcLH+PS4rXDeyCqIL7wItyShZSNSUPc24A0cLL
         zDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785709427; x=1786314227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1ZnHpxm2/LMNQiDhVhwSE0m9IpcWUrwKDgA+ZpNiFA=;
        b=kLau7QHItHecbQXcZj4FUa2SkQbJazvNildBb+Kr10zjm14vQc+NgoPB+GtjPEzZXK
         JUz1tx1vCfEJSb/j3FVZ2cutWtZdwDoaQORSWhag7gW6SA/KAhkPI+CrIVEp+X2qVPel
         Ot6i4j3dS9xElbj2UEsF6HMGthlHXEibjfA4cmP8t4FEtXFmk0dCtsMXLJwWmHvKeouv
         PNTL5eIeMMnhIjbdcPf295wBEW8a9gTl50S5boMa+KGbigWb8xTc9mBNmk7E9QdV1Gxl
         6EyFWtl81Eks3BL72Euh9hZD96WtojBQoNGIe7UiQsc0aWvH3Wg5meOxsWrr51UO7azk
         Idmw==
X-Forwarded-Encrypted: i=1; AHgh+RrXaGmyINARu7nUoW+gC28j01NSD4EBNv6l65sbJ5J/8L58STKAzavCmdpF7I93L8XfTJ21MD7wZOhR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6gCLeWGH+0cwJQxM2/psTnnz9p2I7yWYc6fD3O9Izxi7qGYk8
	ejAWfOzhoxj2XHUQgunSZ8WdlodLDCcA5kEoJKXl5C8aO1yRXGOjDeiLd3iC+CtQIsg=
X-Gm-Gg: AR+sD13sViYicLPqEMmsXET46O5eHTs+pdYMS/lRPZxSzP90xdw5XdpoNRFvr4k/u7S
	4V8LV1PskGLCYUrUN2cP59Y4mBgM1/FVBfM+afpMIGXNAtCV3SY8/pzpW+5w58zdD5UX5e3CQji
	CjeF5FlsDW1//vfAgCETUykE0xbKIxSMpcj6sVX+Ea6DQ7LqRo7yNKSLF0ltb0KrTNyWiw7UEWz
	I2H1UWQ2oLUFMzC6uZBPH/yQHpZArCEYKnpNuliahL3w/oDsd2BRqP8DVffD1IL6I4P3LGq/JF5
	BrOSB8BrGoW5VIF6BD7qsmoev2M24x9++VITcSr3w8ypgZPmQptgH6G7mtDl1K9kIvkOSp8om4Q
	PUdh6ittuj5SP9lxMzMjwBflZBxsakqoGtKQuEhSlLVDlyqEgOqOJfP7sHpsa5ifhkB3bknw7W5
	wTTltaxtvsM2HKmjeXOuwLo3arwqEdgF7R1Ny3YyUM4hIxgJ5VqiiAcWLbHHqBULq5aA==
X-Received: by 2002:a05:600c:8b08:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-4980c694e4amr194391165e9.19.1785709426561;
        Sun, 02 Aug 2026 15:23:46 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49808691014sm168712505e9.11.2026.08.02.15.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 15:23:45 -0700 (PDT)
Date: Mon, 3 Aug 2026 00:23:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Message-ID: <am_CzLdCkMKeRv_F@monoceros>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
 <20260801072711.153217-5-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gz2oumjekulxb57s"
Content-Disposition: inline
In-Reply-To: <20260801072711.153217-5-changhuang.liang@starfivetech.com>


--gz2oumjekulxb57s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
MIME-Version: 1.0

Hello,

On Sat, Aug 01, 2026 at 12:26:54AM -0700, Changhuang Liang wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>, which will go away soon.
<linux/platform_device.h> already contains the necessary bits to have
of_device_id defined, so you can just drop the #include for
<linux/mod_devicetable.h>.

This also affects several other patches in this series.

Best regards
Uwe

--gz2oumjekulxb57s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpvw24ACgkQj4D7WH0S
/k52FQgAnVpMoN8c7RMzlLeC4BZnq+Mr045A+Lyjzbeke6y6tbnrEC8YbXAvRo2N
sNZXvZHsehjbmNqj46Yh6CxejtAye4h4IKeyjmmrOGc/+Q+bJ0g85G2hmalRb7oi
CA+lzCUG1kR9AkM0WIATKYQ9xlDy/rxCqmIGxrfvfY/N/xxtC0JwBpuqmoq5BBaD
7VjgxCyAmBP3XRCgEJB6OEtCdz8Uu55RM2uFyy9Ep1/jGuW4EOAkgFzYOlv6XdDt
7/4pdjxlnZeXPQRqdYVo5atbFjSGaPkYijxj3ITmnD9eipiXu0elV7ONWEXCgejO
v/cmCw7tsyRfKKvwR5+mjGtHhsRtuA==
=Z5ww
-----END PGP SIGNATURE-----

--gz2oumjekulxb57s--
