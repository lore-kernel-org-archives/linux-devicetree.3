Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E0C3DB643
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 21:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775857133; cv=none; b=XV4qy6BtKCNVo8pwdHZ8X4N1/ygVBKwXW7vN/afvm8QIa3/7acuNgScJqDr4po86mGhouhs/KQ3ITCOCfYEBf/BEOJf+7+B05nRXGGFLReAvX707G4X7H+9Q8XCEWMhWE5lvOodBmOFOTXAGDbX45QDRLYMy6BYcsp75+zohKWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775857133; c=relaxed/simple;
	bh=AfxJCGuDwawedT7P4I/1sW7q39LqQw75gWL8s0+dAh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ed9AIadkgdiV3YHKVhFiKIiGxZ+QL+/zqmRytN2dlo9g6HJLIb5rzPb39uAQ4MsJvBXkO1rrZ6NPWN5p+Xm6jrlYwaLuONXRE+ieDgyyMzQePODapzgSVJNS6xVx/6kYT/NdQxBSwQy3/JNcaKc2ntFDzs+HsNDRUeBgW/h7qdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=rowVptpZ; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="rowVptpZ"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dbd08144deso2156941a34.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 14:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775857130; x=1776461930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eaFyqgC3R1GXm84D3GWzj8iqNT7a1oUcf/2QMWQlMeg=;
        b=rowVptpZ9UsLOgQik7lVyrdF6+0eY2gPqRnhkmcgu/6QsD99GYfkanNJsi2AKSIXD7
         88VqicmttTOrzlAWUidS213yc6pY8yVX8IksXXJQ3MYkEiGEiZxWpWQQecHNXXjq9/8C
         XZBGam90Cs62hlon1Ih5+sHpbdvigOtZMFLQXkSKX5xAlW7TuzoCZrozGYqMXrQCviuS
         79MPxY9ZkNpiu+PCEM6l4cEMO7buD0M6ZhQAqacUbbm57Nm5P50QuZBouVuGBMjAthKW
         eXNJ8GQEDbGefxYshH/1nBwLSFEoxuM+api7VjUBUmFZOgZdYjmBL9UPCFLvTpfkGy6T
         ctRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775857130; x=1776461930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaFyqgC3R1GXm84D3GWzj8iqNT7a1oUcf/2QMWQlMeg=;
        b=MQS7Wu1xmrSOApvpR6F33mfkHNLAsr1lMcbqlqE+R6egOPx6dL0tt68Pk4Szh5Cher
         xNxnD8k92iGVO8Aye2pxjreTTfkEh5k3WwVuYAY+i1tkkFwW47P9OL6I8azoEWXDsVtR
         WGuHteZQvzy8JU89O9mJ3wpDHctQznjR8IRr9oOrcs0dDzJ1MyRFrXjKR1VK86P7yDpW
         ZjFrHd+WeH8y5Cwn+tu+oLl1lSWOUjzplAK6qpoLSX4G0UwsOTrcKCzLelzvlQzRhy8w
         J7d/RiMQXd7I9E6+jb3Fm3Bm/yCOrUSLCYsSa5/RqpHb8aGCgD4A0PFEj0lcndSk+K+h
         gtJw==
X-Forwarded-Encrypted: i=1; AJvYcCWX8ysLFF4Lm8Xfjso9qW1Qd7jRJNWtwjo3QJKJO7Y+INorz4bE2GId8DqWkTDeCefOpBarWgotDASJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxoMRhNeY6MY+YgZdsT3Nku+3GWGlygAC1v7FUGK78KfMPHgWqa
	kBCDnGJIObbF1CQw88KwzPDLvBUmNoALV1c74KkjUHkglIVaLVIGygVeB7n3rzyJzWI=
X-Gm-Gg: AeBDieuub3Dlxad1/DHZWlB3dIoO252/b2wAMYbh5xvv+lbqY3PtpJEa79r8rPTK1XG
	mfIFIVZImZL6Hm8E4e5rKHcLRoaG7o/PQ6nOqSU+IjHY60u3fDXcB5WLxPZ03NztH7WluUEM8bv
	qyCkiofhftY6YspuWuQ5AnLUYJdDwFLYt2ry9NKZZ7aPT798yWbsK36+mozR30Iuc4PvDZSQfPj
	+j5M4yHnKHKg829+Vtx5+f2PJbUys1y3Y720R/tvPf0t6JbcIL0BlKfUZ7d66oSl8ZoofAWwJ47
	RJEJa/5ZPOQuPbyRFBwkHLByoV1zMsl9im1QgnBYHNfa/qkJqY/tbSsRPEkr20ZJYCepzZwGxY7
	BayO6tQeGsSkJelGQmeJhzOqs9Vg7yEHGtOJMMnpA2gYdRO+ByYf/D3bv/SgZyRDBhtvvMWMyKs
	3e8jwjFp34pJfNOewFRZvauhMs3b/sDFwOXl3ff4RAj/l5PUdmTK6XF4LRoMjs6i0DoLsM6C5pn
	Q==
X-Received: by 2002:a05:6830:498b:b0:7d7:f617:3573 with SMTP id 46e09a7af769-7dc27cbf49bmr3103286a34.10.1775857130046;
        Fri, 10 Apr 2026 14:38:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b75d:2440:dc10:808b? ([2600:8803:e7e4:500:b75d:2440:dc10:808b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc26941b7esm2736484a34.19.2026.04.10.14.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 14:38:49 -0700 (PDT)
Message-ID: <9c36ee85-12da-41e8-b9ab-e32b7ec29e75@baylibre.com>
Date: Fri, 10 Apr 2026 16:38:48 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] docs: iio: adc: ad4691: add driver documentation
To: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260409-ad4692-multichannel-sar-adc-driver-v7-0-be375d4df2c5@analog.com>
 <20260409-ad4692-multichannel-sar-adc-driver-v7-6-be375d4df2c5@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260409-ad4692-multichannel-sar-adc-driver-v7-6-be375d4df2c5@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/9/26 10:28 AM, Radu Sabau via B4 Relay wrote:
> From: Radu Sabau <radu.sabau@analog.com>
> 
> Add RST documentation for the AD4691 family ADC driver covering
> supported devices, IIO channels, operating modes, oversampling,
> reference voltage, LDO supply, reset, GP pins, SPI offload support,
> and buffer data format.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
>  Documentation/iio/ad4691.rst | 283 +++++++++++++++++++++++++++++++++++++++++++
>  Documentation/iio/index.rst  |   1 +
>  MAINTAINERS                  |   1 +
>  3 files changed, 285 insertions(+)
> 
> diff --git a/Documentation/iio/ad4691.rst b/Documentation/iio/ad4691.rst
> new file mode 100644
> index 000000000000..a1012c8b78a3
> --- /dev/null
> +++ b/Documentation/iio/ad4691.rst
> @@ -0,0 +1,283 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=============
> +AD4691 driver
> +=============


One overall comment. This goes into driver implementation details quite a bit.
I think that is really better done as comments in the driver itself. And this
document should just focus on how to use the driver from the userspace point
of view.


> +Buffer data format
> +==================
> +
> +The IIO buffer data format (``in_voltageN_type``) is the same across all
> +paths: 16-bit unsigned big-endian samples with no shift.
> +
> ++-------------------------+-------------+----------+-------+
> +| Path                    | storagebits | realbits | shift |
> ++=========================+=============+==========+=======+
> +| Triggered buffer        | 16          | 16       | 0     |
> ++-------------------------+-------------+----------+-------+
> +| CNV Burst offload (DMA) | 16          | 16       | 0     |
> ++-------------------------+-------------+----------+-------+
> +| Manual offload (DMA)    | 16          | 16       | 0     |
> ++-------------------------+-------------+----------+-------+

Not sure this table is helpful since all values are the same everywhere.

Also, doesn't SPI offload have storagebits == 32?

> +
> +In the triggered-buffer path the SPI rx_buf for each transfer points directly
> +into the scan buffer, so the 16-bit big-endian result is written in place with
> +no additional copying.
> +

