Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984325;
	b=eoFdvdIyXKhcqVxUsZXfZ25trZTVnrOIWYhiRGai9UNBQZ8tNObppl2OhTIlxD4Nk4Ii
	 m4fRue35CULyZsBCzvFyZck8ryEe/LT0FUpzYwdvrmMU6tSEQmsulnn44n55QT2AYXTfZ
	 FlpBUHPlqV3q8pFq7kziVkAtf87iZNtqs0Vb+SZe53ZsSZQfgNzA8e/l+SOTa2i4luM6L
	 ulgaCYaciVkTkCDdvgUEir4/dzEeFFlMMTw39itYyQRW2XZFL1wnuEpKqPfcDsrKmArt8
	 hbk8ihK4jkTvliri6hqb24T25SxzcCUkKudVrtHJA2XAPXbLUX48y4fIFyS/lNcWeHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/btzFdrmY5XJBoGvPfLZSd2G3pBXBTIwDkFPrz2VqSI=;
	b=Y68F3T2vWrqRfX3MXYhb4hVnfe7wIRuh80FcGL//zy+zOxahTgpPXQsB/p5FdObXGafE
	 i33YVyepo4F2pV6UfJqZpf0jX+KFnCObnVgv5WAO+4s7gDqUqEeftmEEsgEg94fdKok82
	 wnqNWnkTQlsXBl9x5KZwWKM8DvVNozlNSjYVh6bOFMSg/nDEOlBxV9EfPF21nGpXpHt0m
	 ioODhQ6xYtQDmKxgYjEYv6rZ7kwHJXI17kuFCitEaJzLTVEEVgnKtfppRpDxmjVd8Tu4K
	 JUTUPpWDcCW20oCPb4NZQEeKqTKpb2oi4esB7rQuGnG9NYaWJOXgqJ0EojfQjUy1V6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I4GON4lT;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397AA606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 16:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397AA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I4GON4lT
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8369305e9.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984322; x=1794589122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/btzFdrmY5XJBoGvPfLZSd2G3pBXBTIwDkFPrz2VqSI=;
        b=I4GON4lTJ4LMnJjronDDWCb3xmSNc2TSvi9r3y4hTMN3ziVDOkQRi3jtKIjBi9IdyS
         /S4O6HMRh2/TzGZ3cyUmOsvkNiCqb7dcOYfxaszHVxFP5+VbKk2z+5vGvrYPawRUul+d
         iqEgqlqI//buO0lrJnqGyAwHi+A6X7H1Mrz6rIUHlbi0do6o6DClyVKtt4DRqZndmcNU
         0m/vSyIV/UrhLeXtj5w9+7/lzdpWJo3KqNqeZGBrRW1NkYGQE7UkWH42vTHFqHYFkstV
         /qgWOwMLYL1djbmuh0gJgf2vhj1WFCIkB9j7pZiXoeJHYb3Vw5MM4Im09HWA4Co1ajKZ
         KESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984322; x=1794589122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/btzFdrmY5XJBoGvPfLZSd2G3pBXBTIwDkFPrz2VqSI=;
        b=wIIn4a5oBM1dASxDJPHp0EoA0aIh9V+jRQzAZZbFf9iq3PKOavQu+tcXH+0wD0mrQO
         sCYcQxlJSpHg5yxdwouSHTSLTDiXTaZdyEvuZURqka1PzM2iqdSkitgyCuxCMyOZF+rN
         LkPO9g+QE1fXm+j3b3fxUyV9zTgfZDyv0Zc4t1dqb+catWtzgoDw8oO1eWyH9kDG4gT2
         2goQsrkVAXAEIITTgX5P+iMeOpBa+hWzL9fRjhgcKA8NErE7KPDos49W2d99pazKTvxp
         VB9Ukvw3jaxFNw4JkheLNYdDWrytWePh30Jjts7ZdFklv9KHFzZ6gRnxvrByAg3AvA2M
         6oXA==
X-Forwarded-Encrypted: i=1; AKwUvBxblyNHH/n1yq1oHuGPWW9zUFQV4kzyLntL5vTqOtAGIdZLLMqAdasuPYgQ+jRmyEcBqhxn9G2Tyan4@vger.kernel.org
X-Gm-Message-State: APuU4Z+vRBkzU3BPJK4z6SuY3PD6TLCF/RhFZxtKs3DWfRLTLANIDaNH
	oRlsiLIfe34HAj9dy15ZXUjmLPQN7NYrIrrPqtJdcZ1G+iabKiQWiRHy+p+xh77qG+I=
X-Gm-Gg: AYBFou2RAvf6ov/sqb6VJlPoudYQfYSUvVz19ImQxOspGEp9Z3cbu/ihd+AP2c3yxyQ
	O7kiPEDZC2Qf1DbAlfaNGN4f/IYallUXIWeclZOXBJHDZDpk0cfEGu83qHl2K+pM8ce8P6gUzkS
	sAuRm7gGG/BRxfLYNQkqlNTX4rV/DWu8t3RMP46ARLf18fSXa63wwDiogqpRHgRdDAIp8aotWCU
	g9UQmFip12nh0O5TuhT3Wpoj8G7G8aNRGw9VvtluUW4jT2pc3vd20s9jjEQXChyUk86jY8lP/Ed
	QK9ixBXlpmURzFY5WDkGWmj/41GEt/u5WslowGY/qsNm94Bfbxoi3BqtITozXw5VP8Y/L0W0pY6
	3xAu949TtmMzJfasGFtYdfAyR4JfpGOR8D9e1nXh1JQrVekKPKJ8ylHPjv879dB7P7cZQTHcDBk
	U8LDTMlFH/yu/WsLpoG+w20Ml3kRKK89j7TdUJJtMOgJu0qDhPJSKnRP1Mwkj3JNCMx80vzyLuA
	TsmltmNT8kqSdEHhaBIxxNTa1zXqpQGIcwCT50gsif1YJbmJY7uOoJnziX1nCbYcuFpyDS0/skD
	gXHfKpA1iwRA4PBeCfNLUzMopoiHafrAEg==
X-Received: by 2002:a05:600c:4443:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4b6df5eacc4mr55980675e9.10.1793984322588;
        Fri, 06 Nov 2026 08:58:42 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b6e168f331sm84947775e9.3.2026.11.06.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:58:41 -0800 (PST)
Date: Fri, 6 Nov 2026 17:58:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] spmi: Add SmartDV SPMI controller driver
Message-ID: <au4HBJBd7AD6WCeY@monoceros>
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-4-vamshigajjela@google.com>
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
	protocol="application/pgp-signature"; boundary="6cl3pv5jzbmvlkly"
Content-Disposition: inline
In-Reply-To: <20261103042608.387626-4-vamshigajjela@google.com>


--6cl3pv5jzbmvlkly
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/3] spmi: Add SmartDV SPMI controller driver
MIME-Version: 1.0

Hello,

On Tue, Nov 03, 2026 at 09:56:07AM +0530, vamshi gajjela wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

> [...]
> +static const struct of_device_id smartdv_spmi_of_match[] = {
> +	{ .compatible = "smartdv,spmi" },
> +	{}

{ } please

> +};
> +MODULE_DEVICE_TABLE(of, smartdv_spmi_of_match);

Best regards
Uwe

--6cl3pv5jzbmvlkly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruBz4ACgkQj4D7WH0S
/k4fIwf/ezsGptNEg+r7UnyD+hRzsURzRkivO2yfuPqRfBVWrIwuZdenZrWx0joB
4KjrlqQByAt9j7aopLT/im6JfJWeKKeIWK6lETM+8NcOC64i8ukxqNPmF7BKnIkT
K6M7XSJpD1vQeLPOETP4L2ziJKD7haXC0+deYYXF25K+4woWQzOXriSGUNj2LYgz
7Vk86rxo2l9KMpeMTov2DHVtY7oV1ib2b5fpJQZCU0SRArZtIwyiEoj1oOK/YvFS
ZnCqYxZGpk1d4REvwo+PUGqeywtplhG+cSDaRexArjzFGa8pCFv8HkCPKSgeZLqF
k/O3LJaBjWZ39Ccmh/36kVLfX5MnOQ==
=lr5c
-----END PGP SIGNATURE-----

--6cl3pv5jzbmvlkly--
