Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106701;
	b=5TNpRwKEfIN3StSyuXG64QsZM407NYxoqwp0zbGEc8ItuURgfCVnt81nvUgjIU6n0RI9
	 +jM84ID8Wr8NW5bdavW1hRGIjUnxWH6qCMGSaUAnEM8JbdidLJcw806joD1bm4iPIepjn
	 otBDVjQ8D1TbiclR/utzfe/cxiMJWKTVWXi5IcZQ6mt+JYSuvtXkiOU6bYVwFNTaiOiFW
	 EVj3AGwRZ3ApAZskQlO9hSTcql0j+ASCKSwtqejcALlSbATO4zwWvOVe+58FR5G6SsVaw
	 3W9NwRjMpK5FE76VRVbQ08DezkUgSFL7nnxztDUtmAiua4DZhClttVxeYcJwiUm13Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J2K05ih4wGBAK3pt5nK5wgIDHef2c+4NlLu8emj0KCg=;
	b=uI7yS3XiKaa2LzMgtgIbItpqDbNQRFOCo9XqBJAwH9WYeAPnJKP5kLnfHu8m76mBYnlS
	 yfmwC0JeWvVpDtufk1EZ0Y4MV5WbkRiUGQDZ4JbpfraWptNmOQOlccO63psthAReNjNGP
	 sZjnC77Zo6cgSkoiT6DO7DpJXwqMpGrhNlKpf/Dh8O+igG7RMw5C9d0sGD1cfAyDg4r1C
	 m4qVgRuCCxqynEpIjp6pOVtqv/OCA+82DQ+SMK96WQ9uQ5rQLpf7Flkyrk2fkmFNjRD8C
	 7/A1yhJgO3t5EEFhMZXIL8eW8A7VU96aYur0y12l3M995s0doEf28SZuKCAlx7UHBRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZEzG5oHZ;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C437F606A334
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C437F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZEzG5oHZ
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1525996a12.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795106700; x=1795711500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2K05ih4wGBAK3pt5nK5wgIDHef2c+4NlLu8emj0KCg=;
        b=ZEzG5oHZXxpB8oa9rwNRv50HM5CC3bkeHTb4Mqa8N0kfcPCFI7ndYnYkPsZQTx2UkU
         8AYW1pftII73bkzkj8Mljub2ZKGXw7Dd5s5mOI+xuV7wKkJeqGvuGDOSlEU4FqAJy3KQ
         ss3b9CZopEfOuKeZKkILe32GZeHxS96Put/wKCT9M8mjyHUJ1Ym+PFHC3tPv9J9ruNuo
         TPJZdt9dZW3R+K8v70phsHoTTO9pY+zpKE3NZsByk1wF0/LQEtil7BJjoWObI7wIPpDV
         UjaAPnUR81MQnLYqklptBdBDRsuBmhzmSvrfeKAqr4JYEYzjVQiLrk/7O8+6/U4qYFeT
         5iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106700; x=1795711500;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2K05ih4wGBAK3pt5nK5wgIDHef2c+4NlLu8emj0KCg=;
        b=WYc4p5VPki8jgou7Vggpwqyr8VPmE+MJC3zLx57OYx+BdDWEQ3rG4fmPBfMyvUsVvd
         CQ6aC1SmIdYQoukJGezUYiT14XrS6gqwezHHEHjfE2nVt+ZhL1qwd6RnT/yS7z9hcVAC
         CNjXLkGYBVIGFAu2aOLjG0pMSLAUpkEMru01SGSuZ5FvZ2a57TsDS/bH4mqAaaaj0Ste
         cy2Ea8BdhbFWYZDMhDknwBR0abUG1ulHq1lzab4gLrgvo4xSIXjTJAxHT7oEub8n5/sG
         2umIaQsz7nNCrspoEcLeEUfIKzputsIoraU2xSj8gPOtTud7of3YnrgBX7TpU3YFNe62
         7dUA==
X-Forwarded-Encrypted: i=1; AL+hErFfvIRyzjqebsa9tm+C5NBzex/rDPjxKNNhyn10RwLDKMpaRV836WYI76QhvRp32iFlLt2AzYNND5pE@vger.kernel.org
X-Gm-Message-State: APuU4Z/+tw3w961wRJGupZYB9mPbKVwX39GHrUX/+5gz2UG0osi8jnZE
	ezyMGY7o+iAjtAhd9s1Skg3ZI8eQiiUU0BYM/UFmwZIYV5LuDf2i8WpSCqPkwlshQ+4=
X-Gm-Gg: AZFdTZdg20wboJ8mhQmxdXut2UW5AuppbH3e5cY+tdZQu2CDyhUXcTf9Wedq7j8Xgft
	31cHdYY4VVBbUR9+pAecz3VQBMZTRNS3ItAlZCbZLr4E4lCz9g99KIXybGIQVqsJ3ZuZj2ArT8b
	7/9CxQWsnR6iJBezexyV4LiDr2rj1CF/gyraKtIHwP5ahAj0hjrrctVNBQL+Q+bYT8cOXJoasBX
	Av7gKN6skUZ7L6fNBD479Mc35dIKqGkTw7wBY+8Beig1qu+vaua9HUeqcIMnhcnJckEKwFrTXqN
	03e6YgQNkogRU+dR7UNaY89f5LWbfu55g8ZKGxndupzP1zUETMMKLbMnqEuvmIJ0h8ly2rdh+i0
	jkGZy8AoJCRJoGAceZxeHXAehB/Y1CrdeRyNU/5UZA6Ucq5ysGXVVXBH85K9wdrhOQFlegl3PsG
	6AicAwF1gzkVDV0Y6TFaEirJjmnHjEYUHa6I4ZZO1qjikQs7/nUiSHr1ePqC4OQwbTlj7HZyxK3
	mTPPynBokrDCzz9x9a5E/2bL4TZD76tImm5ynztvvmB5v5ee1+9hNSNwqJKDTzz0b3b194VtgOn
	l8PxgjMxym4gCg33UhIcDx9Bt8pX0wlLFrkjrp/k3T/Hm0tS0xcBKA==
X-Received: by 2002:a17:90b:3c83:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3b3d06a2564mr6512769a91.7.1795106699866;
        Thu, 19 Nov 2026 08:44:59 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9bd7:226d:1022:f6ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm3203028a91.16.2026.11.19.08.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:44:59 -0800 (PST)
Date: Thu, 19 Nov 2026 10:44:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] remoteproc: amd_mbv_bram: Restore reset GPIO
 direction after PL reconfig
Message-ID: <av8niGRg4Er7YP8K@p14s>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-3-ben.levinsky@amd.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105051902.1646651-3-ben.levinsky@amd.com>

On Wed, Nov 04, 2026 at 09:18:58PM -0800, Ben Levinsky wrote:
> Partial reconfiguration of the programmable logic restores the AXI GPIO
> that drives the soft-core reset to its hardware default direction, but
> gpiolib keeps its cached output direction. gpiod_set_value_cansleep()
> then only updates the data register, so the processor never sees a
> reset transition: remoteproc reports it as running while the newly
> loaded firmware never starts.
>

Where does the "partial reconfiguration of the programmable logic" happens?
What makes it partial?  Shouldn't that be fixed instead?
 
> Use gpiod_direction_output() for every reset transition so the output
> direction is re-established, and assert reset briefly before releasing
> it so each start produces a clean reset pulse after the firmware has
> been loaded.
> 
> Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
> Assisted-by: Claude:claude-opus-5.5
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/amd_mbv_bram_rproc.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
> index 6cf33c7b7e64..da621f62f7df 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
> @@ -16,6 +16,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> @@ -94,8 +95,24 @@ static int amd_bram_rproc_start(struct rproc *rproc)
>  		return ret;
>  	}
>  
> +	/*
> +	 * Partial reconfiguration restores the PL GPIO hardware defaults but
> +	 * leaves gpiolib's cached direction unchanged. Re-establish the output
> +	 * direction and generate a reset pulse after firmware has been loaded.
> +	 * gpiod_set_value_cansleep() is insufficient here because it changes the
> +	 * value without restoring an output direction lost during DFX.
> +	 */
> +	ret = gpiod_direction_output(priv->reset, 1);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
> +		clk_disable_unprepare(priv->clk);
> +		return ret;
> +	}

Why is this needed now rather than when this driver was introduced?

> +	/* Hold reset asserted long enough to provide a clean reset pulse. */
> +	usleep_range(10, 20);
> +

I really don't like random wait times, please find another way like polling the
GPIO line for an expected value.  I also thougth the GPIO subsystem was already
dealing with de-bouncing.  And the question from above still stands, i.e what
changed to required sleeping that wasn't there when this driver was first
submitted?

>  	/* Deassert reset and let the processor run. */
> -	ret = gpiod_set_value_cansleep(priv->reset, 0);
> +	ret = gpiod_direction_output(priv->reset, 0);
>  	if (ret) {
>  		dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
>  		clk_disable_unprepare(priv->clk);
> @@ -110,8 +127,8 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
>  	struct amd_bram_rproc *priv = rproc->priv;
>  	int ret;
>  
> -	/* Assert reset before disabling the processor clock. */
> -	ret = gpiod_set_value_cansleep(priv->reset, 1);
> +	/* Restore the output direction after DFX and assert reset. */
> +	ret = gpiod_direction_output(priv->reset, 1);
>  	if (ret) {
>  		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
>  		return ret;
> -- 
> 2.34.1
> 
