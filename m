Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B627E369D63
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 16:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380141; cv=none; b=HVjiX63zvX3FPTAgu/nZhIFGU4hUvxFi4S2p7gHwzqQfSy1HSN8lrXJQpUFv+ib93c6HEXjiX016CJkDZWYpg9ucuBeqVt/eoWTpUnmDyKl/h4vrQp/REYob0XRNYVoaYp/YLgaO2cizS8iupnfgzmmyGsuSsDsogc0Jpkw3F/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380141; c=relaxed/simple;
	bh=UraNGmZFA5REm5mXU8cijvRUoAo6cvI2W9iHwqUD45g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqhpvxRpTRoFLjo4BxKbJALeOjdeSYdSn0Q6GrklSopcL0e2dckerbdDksCfLHMpvmruZyXHJSDHd5Ih6sHY2tm8tSQBCVtbXr2MvjYvwpczgV8Iflbq+GF2HxZp+vMPWT7Ro3BnI0C1TOtI6L/tSUPUe7hzyBpgjyRxNKm30RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QVL7N2Lf; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QVL7N2Lf"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4a483a552efso527350b6e.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786380138; x=1786984938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CrwjdneBCLq2MjyKhUL/tcV1sygNbjbpu5GnTQQd44=;
        b=QVL7N2Lfjlmjxiv1+cn9tFernccaVe8QfmO14LEc7AmROiH+NYCEh6jeiR1MoPpx5K
         4x9iToehymnSIgSfIOaQPvsrVZvz6458O+0ndqjnnPl+wzQi2pgg5UalsmxKnli8vd59
         qL8bLs0Hktu6xc2Ge8a+CZp6rWMKjXd15t1oKdmGxlZTCG1Kd+vDRpucDRwXmGvAB2Q3
         I4l1tLKh3WO7mnh7GLpOEIFnfFq2Vsx03JLEA7Lk3R89Ygcli+QlT2/n40A7UNJJR80v
         AJ3sVHvEUC/q0+nOCjK2MMzSiWtMQH8MjvUhAO7BmgVMZ6MnVT2tLB4WFkMkruT3pYv5
         IwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380138; x=1786984938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4CrwjdneBCLq2MjyKhUL/tcV1sygNbjbpu5GnTQQd44=;
        b=P/t7nvHjJ45puRjGwyeHpSawWeipxoSflXiTi4CW4c/g2PllZgXApSruN9OnLQVqaX
         mA9pNgg3zQ2BY6jEo8EQAcZKfa6OjhlciH+p1trHqmHFBqZc7DalT+KUgNwevtBX9pq8
         OQhC+vkDm8SheJd/Nn/+EBjQdN3mTaTrKWnths54W51nRbvEODE0e8FlWAHko/jUd+UN
         kf2qsLXdBe8gDijxcB9uRiw7nZjciJ7MjMLosT8ZFj4RSNsoYfzbRsMfhlF4L0LAJZI9
         92Lv8FAMOCGShJdHBabxaYpk4+vi/jwtzda/QJztLHMIyA0x5dFTvoXfZ8C8RA4cg7xG
         bZYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCPa3lOr3jXU1FqzWIxIPAg5CqW8/bpM+cLDo/5ktbhAoK1s21ngTUhtPLUJnyHpjMQh0YLjfwgZJA@vger.kernel.org
X-Gm-Message-State: AOJu0YxSLf3VnW6wmbeF1VSlmUvDr2++3LdflcGZjTH7Dl6eB0AbOOcn
	6A6TLd4x+Pf7HT82MTevj97IhzJoNZhF5b9vhnBV4w7VxambQ9t03gV9RxGb5ZWgVuU=
X-Gm-Gg: AR+sD12WWZ8XpsNrStb/nVCJSU/zLyKRFbeAknbg3OlwQI7NC8XtYeSOHE+lgGCwG0B
	i03AkvajpuZhLUBEkA6fbpZthNwDTki3PXCGpky+x9D8Rv94f8t4bmtoXuNMWmSzuUa855KYlmV
	expLSk1Cjh6VhOrfzDrVDQOFzGF7c6oerJXtWQfeCGcMrfSeIGnEEKSVC++aFYG1HK54dUTxxQL
	yJUooctkU+POO50Xxya+1kmaraRcHTij+Gglq+5TTaCQrhrIyXfn81RrB4SFGsPdgyeP0Yqdin2
	wbumdLg9UfwVjCz4e4a1z9m3nhIb7wo4esXENuz7tttwIhvVExmfmAfqZffAyaWRkqlLN0Yj21W
	kxTOQjAT0pd0RmIrRanAHy0nhEFqc2189iu06KUMw62Q4gn6+3vbCKn4BP3kiJR8SnDLhyQDiJM
	MeWZ9lR+DktdlvADhdPwgNThdFcivq2H8ZSgQABbFUIy2vNPdJ5ziOHPnUkopKMwz9c9nKhh0HW
	3KL1BEfOLXu+DDupJ5phdAJzLPbfk7PTLl89rc=
X-Received: by 2002:a05:6808:bc8:b0:4a4:c12:49d9 with SMTP id 5614622812f47-4b1e770811cmr1551304b6e.3.1786380138504;
        Mon, 10 Aug 2026 09:42:18 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e05b:7923:cf50:e4cf? ([2600:8803:e7e4:500:e05b:7923:cf50:e4cf])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b1af06d90dsm7404797b6e.3.2026.08.10.09.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 09:42:18 -0700 (PDT)
Message-ID: <4de0742d-c17f-4d0a-aab1-35870eee053a@baylibre.com>
Date: Mon, 10 Aug 2026 11:42:17 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] iio: adc: Add TI ADS126X ADC family support
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <9c2e2c46-32de-4e8a-88c3-bfc2cfe8157c@baylibre.com>
 <DKK9T3XRZJEV.R83PII0D35H@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DKK9T3XRZJEV.R83PII0D35H@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/9/26 3:29 AM, Kurt Borja wrote:
> On Sat Aug 8, 2026 at 1:37 PM -05, David Lechner wrote:
>> On 8/7/26 10:58 PM, Kurt Borja wrote:
>>

...

>>
>> And the driver also allows using an hrtimer trigger to do single-shot
>> samples for cases where one doesn't want to sample as fast as possible
>> in continuous mode. This would be more useful to someone who just cares
>> about sample rate and not about filtering.
> 
> Why did you go for this instead of just leaving the continuous mode
> running and reading on each trigger?

The hrtimer trigger allows more than one channel to be enabled, so we
have to do all of the channel setup for the next channel before we
can send the start command to trigger the next conversion. Doing it
this way eliminates the possibility of not being able to update all
of the settings in between the DRDY interrupts.

For cases where we only want to read one channel, then we can use
the DRDY trigger instead of an hrtimer trigger. Since we don't have
to change channel config in that case, if we miss a DRDY interrupt
because we took to long to start the I2C transfer, it isn't a big
deal, we just drop a sample.

> 
>>
>> Just posted the series yesterday:
>> https://lore.kernel.org/linux-iio/20260807-iio-adc-ti-ads112c14-filter-support-v1-0-4d3ba00caf18@baylibre.com/T/#t
> 
> Can you Cc me this series too? The settlingtime stuff is something I'll
> implement too.

Yes, I meant to. It was late on a Friday when I sent it and I didn't
the best job checking all of the details like that.

