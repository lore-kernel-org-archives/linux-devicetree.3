Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0998137F72D
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 22:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781735988; cv=none; b=BG5793ajLRGXCoGABR1VbpaxEcW8gg+pd1FDofoXU0A+oWbcLQBHxVSDg6DjvGr1W2TpHNpTEJTLDjrYmspOyjqVJskD2ItCqa4qf2hyx6h5n2rz8tz+FfsQH+dB7urjBOG1h5fsUBBy1pytqzUIsAJOxgjDcgATKTo3/YXCoBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781735988; c=relaxed/simple;
	bh=dK3ZVHC2+yjIeAkZAQyp5QYaZMYe9UWFF9c+QJVlVB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HeGuvrRS+T6dVdYw3prwZ8ICk/0py5KK0WrpPuOdKSeE/Lh8m1RPjSJIq1QdDPPaKHu6khsgEk/PwiSz9PB2Zblw4yR+p0D7TbiP7Rguymvtuiu1xzWP/2M2xz9PbqrV3A8LhOHrKUpyDkpnmmd0bLnFk7NPdK5HnOLSz966ils=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YZggMySd; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YZggMySd"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-440d9bfa309so184878fac.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781735986; x=1782340786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nF/Q+/JmKyCTSBbxyYiT7cadNyPaZLke2/CQXqkm8VQ=;
        b=YZggMySdA9ULGF4Hcl2egzvgkrzF2hR9WcVO7txWuohatKtEMau8a2fS+HJFIc9c55
         CdFx8Iqe9sn0rQF8+ktEtpmad/Od2afqCzyoX5xhdaZ1OwBv/yD/ZimZjgVfYLw1iS6G
         heMV6ERXTu5SjmeoEv/xdkrrfy7glBaY95iPYyG8yKVm8I7QM3k/N6ACpPZn56Unyj06
         yDHX8T/5LWygNh9YKjAMeoASeOBVtOty+9Cp6WRgMP+hcQ0BOY+FY1yfP+yqjjqdYlIo
         ni2p5C8uRGGg1YCnjjs79kwx/BC51ezyhmXT0/efkDQWoOXqNJuuUtpmL0PqMO/kfDRu
         Ey9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781735986; x=1782340786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nF/Q+/JmKyCTSBbxyYiT7cadNyPaZLke2/CQXqkm8VQ=;
        b=gaz9mgKVdRtShEKMdI3wKOERh1VNdbxtahOCqT1vvAkeGvKwWny9MtrLjMJAHqIqnY
         N80DqOrxUuoPSUX4j2qxWvLlovbQFV3/gcbvUbheqK/OCSafsrp3vvIGAw9xfcNhMa5U
         IvZp6lLDFN+nNhaLinxqNRwMsx66S8E1yJ2+6SlGzPpSZLcQIGpIDgZL+Nh8M55qZDQZ
         TrvNd45j4tdWngjZLuuP8daYhqAhDDG8T9AKRoCtsZgWUjxXGp3Zb0xKJynMHg/ACkML
         DHM4jTmnOJPzXS5AW18ANVKyxCCIsgJKn9nnWu6QfGtyn98ZQ5IA0lgcJH80lbsFXCYa
         Pdag==
X-Forwarded-Encrypted: i=1; AFNElJ9GKpUtOZWo6b4m0ab3NrrPwl7TjKd0rseCXsd0f2tMbHH6MUy5QcoNfgZ19fKb8sRDOv9LESuNxTVs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/pVhm9R5O+FM57Xnnaihey9vbJFxSdh+hoB4kgJwyY5D9FH6y
	7fSFo8HVrBN2GiD6fa6IlGOb7MuWizpPtbNXd6sRIztuV4qEm4kROdKs7YQxZlW657c=
X-Gm-Gg: AfdE7ckzvZ7JKEmDrY1zP9LwbxIo/0g3TG2leOgGiZYOIPrHW+bXHD0Sjsa77Aj6p4i
	YZkZGY4CZH7zRTbyjFznsC627vApogbMxkZoqcHkSs6yb18AyHcOp5EycT0E8qGkOE0FuJIl0KD
	Rp+lmXtNiBYpkfsZDny8eqxpPE3U5bfSx+X7MhCTtWMIhRWApqKphNZItNWSMRxJ9Jm62yP6a9y
	6sN6HShens7Z+ugnl9To4XUcYSrFltocPogCYFDTI0fvyiQt/f1hD2t59nG2LHCeisgzOXsR0TT
	MuuRH5mB03bWf6CCUbtoLyDZiXmIQNsA5iNYpv6yu8dAG4KVUfMSccx+nwr/OI3qYlYjSuIsqtK
	t3qbMI5XsG+ODWhorqrFCEgr7q83DpBd22HTWV+myXuU4hTSctbjETULhr8yOBOnxUhC0+KeFqW
	Xs1V9FdDCN7qfM+35lffp8+/Ssov+Iff4tRuE/5oVQOn7/iR+APFEziEEIRBXvess=
X-Received: by 2002:a05:6870:f624:b0:434:482:ecbd with SMTP id 586e51a60fabf-4466bee8fe4mr4406884fac.6.1781735985994;
        Wed, 17 Jun 2026 15:39:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:9458:d356:778c:22ac? ([2600:8803:e7e4:500:9458:d356:778c:22ac])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44308a66401sm5452397fac.3.2026.06.17.15.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 15:39:45 -0700 (PDT)
Message-ID: <4f7f50ad-c305-4947-b4e9-3666a4f31031@baylibre.com>
Date: Wed, 17 Jun 2026 17:39:44 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] iio: adc: ltc2378: Enable triggered buffer data
 capture
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 pop.ioan-daniel@analog.com, marcelo.schmitt1@gmail.com
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <22248e8ba646fbe8edfc87e2b9be527632d5b48c.1781661028.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <22248e8ba646fbe8edfc87e2b9be527632d5b48c.1781661028.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/26 9:04 PM, Marcelo Schmitt wrote:
> Enable users to run triggered data captures with LTC2378 and similar ADCs.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
> Change log v2 -> v3:
> - Extracted from main driver file into a separate buffer-specific containment.
> 
>  drivers/iio/adc/ltc2378-lib-core.c         | 17 +++++++-
>  drivers/iio/adc/ltc2378-triggered-buffer.c | 49 ++++++++++++++++++++++
>  drivers/iio/adc/ltc2378.h                  | 15 +++++++
>  3 files changed, 80 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/iio/adc/ltc2378-triggered-buffer.c
> 
> diff --git a/drivers/iio/adc/ltc2378-lib-core.c b/drivers/iio/adc/ltc2378-lib-core.c
> index 1160f4324d01..ec83e9f2ae81 100644
> --- a/drivers/iio/adc/ltc2378-lib-core.c
> +++ b/drivers/iio/adc/ltc2378-lib-core.c
> @@ -18,7 +18,7 @@ int ltc2378_lib_buffer_setup(struct iio_dev *indio_dev, struct ltc2378_state *st
>  
>  	ret = __ltc2378_set_offload_ops(st);
>  	if (ret == -EOPNOTSUPP)
> -		return 0; /* Let device setup complete without buffer support */
> +		goto trigger_buf_setup;
>  
>  	if (!ret)
>  		ret = st->ops->buffer_setup(indio_dev, st);
> @@ -27,6 +27,21 @@ int ltc2378_lib_buffer_setup(struct iio_dev *indio_dev, struct ltc2378_state *st
>  		return dev_err_probe(dev, ret, "error on SPI offload setup\n");
>  
>  	return 0;
> +
> +trigger_buf_setup:
> +	ret = __ltc2378_set_triggered_buf_ops(st);
> +	if (ret == -EOPNOTSUPP)
> +		return 0; /* Let device setup complete without buffer support */
> +
> +	if (!ret)
> +		ret = st->ops->buffer_setup(indio_dev, st);
> +
> +	if (ret)
> +		return dev_err_probe(dev, ret, "error on buffer setup\n");

This is repeating the code above. Seems like it would be better without
the goto.

> +
> +	st->chans[st->num_iio_chans++] = IIO_CHAN_SOFT_TIMESTAMP(1);

Adding a channel here seems messy. I still think static const channel
data would be better. But at least would be better if this was moved
to the same function as the other channel setup.

> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_NS_GPL(ltc2378_lib_buffer_setup, "IIO_LTC2378");
>  
> diff --git a/drivers/iio/adc/ltc2378-triggered-buffer.c b/drivers/iio/adc/ltc2378-triggered-buffer.c
> new file mode 100644
> index 000000000000..d1d788fb5cb4
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378-triggered-buffer.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Analog Devices, Inc.
> + * Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> + */
> +
> +#include <linux/iio/buffer.h>
> +#include <linux/iio/triggered_buffer.h>
> +#include <linux/iio/trigger_consumer.h>
> +
> +#include <ltc2378.h>
> +
> +static irqreturn_t ltc2378_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf = p;
> +	struct iio_dev *indio_dev = pf->indio_dev;
> +	struct ltc2378_state *st = iio_priv(indio_dev);
> +	int ret;
> +
> +	ret = ltc2378_convert_and_acquire(st);
> +	if (ret < 0)
> +		goto err_out;

As mentioned elsewhere, SPI xfer size may be 2 or 4 bytes, but
we are always pushing 4 bytes, so this only works on little-endian
architecture.

I think best would be to have storagesize = 16 when appropriate to
avoid having to manually handle this.

> +
> +	iio_push_to_buffers_with_ts(indio_dev, &st->scan, sizeof(st->scan),
> +				    pf->timestamp);
> +
> +err_out:
> +	iio_trigger_notify_done(indio_dev->trig);
> +	return IRQ_HANDLED;
> +}
> +

