Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD2213A244
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783784730; cv=none; b=ZIF8vaWXK+xuVdWuRNtkR+o4Z1YR+vKdyZPmBg8OdAlNt7YtXmt15Fr160590PzGdjh/Sl5R4qfp2sD04rIDkvZnPHrxD9iWKPbRdaPtcluDEQQEsbMoRpLSY+uZd9a7JpUcUW03pnc09wlxf6J00V5R7wE77XYtMuD75mKOsJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783784730; c=relaxed/simple;
	bh=kV151LtJ64etiwizmlKM/pdrH80JqisF+YGDBiPuocI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2PabzjUkciB51l3xMY9Wx4YusFPlov1zO90Hgs5I980pzd5rZ9K+t1+1aW5yjI5oTmxjA2omcKNpfFjNf0m8e7exSXMZYB9yNw6UFRxaN1Ci7cWZT1Ztjbs5gajVNsKEDRkyVJz+uF7JKSdNYZHwFldrg+TouKyTZtsyeFuf/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HYtwWUwr; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HYtwWUwr"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a0e55e82d0so1161145eaf.1
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783784728; x=1784389528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4nKBMbG0MqSCNHvRv0a1DtUb3V5ZdgxWmxrj85GMv8k=;
        b=HYtwWUwrfwj5Bhj9YtZL0B6krxxydiVEA0LlzMHJnrkX/DUZg4BPE/l3iutVQzttSh
         H/eJmCKGuFJBH4xwNXdlc6JDN+wtJ3S8N1qIYITvcqn5h6oa8CVELFrLllKWenaINvxF
         gTczmZdhOibTxaBoc91fwTatFfKwDBB++HaD2KBJk+ZGm/qDymt8mQvLfYxyKdlaI1PU
         6LbyA1bLAGTveUx8+27ax8/JfQJrATqdP/eXHT5vFDY+dUpSdw5lmah1arfG5mMoE6f7
         NBMEI3ZXaRjG11HPPEFgHk+N1LHslns8hFzIzL4VXQRzFnK51KKhBcv7D19ogXU3PuCD
         +oSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783784728; x=1784389528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nKBMbG0MqSCNHvRv0a1DtUb3V5ZdgxWmxrj85GMv8k=;
        b=QkKd2p/3ujKd8rfORGeWVQzuI9ZEaw5V81fjiyx/izWqRWwzsd0JhQRIqyEzIb35AY
         tRUyXoHfKlklz9uc/PejFJWtHnpIQ6zzH1pjbWtXTM5xC6smNbbsw0REKnZLz4lkMjBc
         5BDPu33PlMsp+TFFyWOSSaHYuz535HtCrc+ZaiMRRhdfBPJVUoZj3FIsk+aZLx0P9yYX
         qB2IfLRKduTWLbDNPzwbSmIMLtpNJU3AiYXxirHLe9ZkU6/nfDvC0uzjuSLufHUuqqEo
         FoFCbVJU4forLnsSpMZSdudkcGMlcX9QZ14lReFOTYj7mKZua6LiYkd5Y8qWYRaWiaYy
         6Wlg==
X-Forwarded-Encrypted: i=1; AFNElJ9cnWmxldkT2ZVBy6NcuxojexDb9J+NZ5oc2ggUfhbAhP0ZgdnzThnhlefw3zHpefnx8BYR00sz56XI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6koTGCJuzv7UEtyw+c3Baqm/Tka8uEBIHr9LySgffqrzuCCV9
	aeAInHDkifraM1Su+x39liJeUCoHn8qvYI2R7Q/0GHt/VHmS012kjN/pfYwm/QBYyjQ=
X-Gm-Gg: AfdE7ckg0gx7xRqu0ADrNv2TN3Z1GO36dlP9Ger3cMrMY6JGebPNtZaMkirWRBRLdxD
	LpruuWThvplXTJy/g5Czp3H2NuoTtEY7s+Td8sBXQ3KbO7p1/JVanOpyfeCK28YHTPCjWLiDzRL
	Wsc4TpjI5WTR4zmYOLeTgA6ff7/2TfsEmrvhc4eJZchn9xAW2PSOEKVbPLK1a/ujyhPXSmv3xyt
	07+JB5ISPkG5JPV166KnRA3vGgm0HKAL9hbZ/BNkGitfpPfCP2ld4F2bZckJ/V0UEx1NW6Za5un
	9dB1MT9aDur/0Tg12Hb53ljmzBkV5PrF3dvtZnHzqoX9ZYjweOVUbvlgBgtFztXoBinQkv3K+H8
	vejmKM89PNy/9rbbqSAtfd3Hxvjx8zYdZ74Q6/37R8qIkvFYKu9F5bK6gx6j/hji+d3w2PjG/1F
	cmZD4F6pLR7SJg8nzZOeQVu6vvnKxg3Gzm5Hp9jU1pe/GSf2aHRwMWMZB2Yh3uG2g=
X-Received: by 2002:a05:6820:210a:b0:6a3:7ea5:a678 with SMTP id 006d021491bc7-6a39a6ab3c7mr1927906eaf.43.1783784727749;
        Sat, 11 Jul 2026 08:45:27 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:a950:74e5:81f2:8c89? ([2600:8803:e7e4:500:a950:74e5:81f2:8c89])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcafda2ffsm8855734a34.12.2026.07.11.08.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 08:45:26 -0700 (PDT)
Message-ID: <a7305b57-c39f-44e9-abdc-50a0a5f2fd16@baylibre.com>
Date: Sat, 11 Jul 2026 10:45:26 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 julianbraha@gmail.com, marcelo.schmitt1@gmail.com
References: <cover.1783629101.git.marcelo.schmitt@analog.com>
 <965e5a31bf10cb49b53f7351266eeed55e8f6bd5.1783629101.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <965e5a31bf10cb49b53f7351266eeed55e8f6bd5.1783629101.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/9/26 3:49 PM, Marcelo Schmitt wrote:
> Support for LTC2378-20 and similar analog-to-digital converters.
> 

...

> +static int ltc2378_convert_and_acquire(struct ltc2378_state *st)
> +{
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +	/* Cause a rising edge of CNV to initiate a new ADC conversion */
> +	gpiod_set_value_cansleep(st->cnv_gpio, 1);

Wouldn't mind a comment here explaining where 4 comes from.

> +	fsleep(4);
> +	ret = spi_sync_transfer(st->spi, &st->xfer, 1);
> +	gpiod_set_value_cansleep(st->cnv_gpio, 0);
> +
> +	return ret;
> +}
> +
