Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87F2303CAE
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779117404; cv=none; b=jRCxB3lIPSHvwRyKalSRyU6FFa7Jm6XlWaviBJeNoAOXy/qSl6E6jgoFwxltKIFLLsi5+or2pzAMVF5/+NxlqdfEtwZPO5XAsJ4cwQ5qV5rFac0nqKN6MAHkBeq2HkNgZ30IxuZA5+ZnfIPQTvR4dRlIVXQqUWINg4h/ytNbu7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779117404; c=relaxed/simple;
	bh=WIuBIRVBEY5UXNn0IA/SjRUP6qFVmbXEj3WzcJbGoMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vhw70SkRNuESHrAwdSl69zLPZLfnvyg0U+WX4Xx9UiluX55x1LiNqPskXdX1stsC0CvTpT7UvDmTNsQfNQXF3d7JKhalc4iCCasDfWwSaVp1OKL5RnlVl2pXGywnrgevn5lWayBVD6MbMe4n1Eoyg7ZDx4n2GgHRqwai+wGdkEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fx/mFa8o; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fx/mFa8o"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-47c35be02fdso810431b6e.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779117400; x=1779722200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HnVPqvj+TB5ocpICaZUeUZprZClJ7W/n+a216rMOu9M=;
        b=fx/mFa8oJCpZrYpv/yxn9pTqx3cTqQQ1BTSB5AfnFgQDxZGKK3TFfV5NES+7elzVUc
         9MIuAl+HxR1Az3RAdp9BI0w9s5uDlXxoQ8NfYpHfU1rMTAPfHNg7kcWqYvV4vBKAEn9I
         bsvtzjhpmaWkx48dIv62huk811hak3h4JRv49YiZNIPFS+q9nZVIY3rOVMnDPS6i5Et0
         gjbPUiKq92AakMhTyXByaKrBBMqBi0TziWoayMzXkp3dzlzQzgRVbSyv/PwMy4fFGhym
         Z3hFESLMH9B/bZcxVD9JJixqKn8OJTOMjylkysqk4hzhRuPCK4gRIFiLb2OY4LF/Kra8
         mjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779117400; x=1779722200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnVPqvj+TB5ocpICaZUeUZprZClJ7W/n+a216rMOu9M=;
        b=WRSZ38SDHnA5huzcpV9LmreVCqcWUXSHOyYha3cELL1xl+YXoiWoFrOVyxKJc/L55E
         U6ff7RGcsXYRI9ECPui0GdZADwwDBdWNByeivSj8DOo2B5MqYvRYfaZtcF8FNfbMNNNG
         1mSXsp4dMxE/Bn7ObzWAH45mnWLeEhO9FIROvjxnVllG2UdcpGgQL9MzrWIE2YE948Zz
         eSpvdaq1s1adwJJkOpHFN7SKnLSTrfvREZ7805N2/ZaoE7gUeLOOGpdrgiYWl4voilnD
         0M15UyMxQl3dywVwBKmtQG0hFEbVXr29Aak8bxp8GM+VE5kqnIzhWtjKzJyxQiiykQCt
         uieQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rkroHggvsLZwIGVXPoOvsu70du0gZ6MUBeOIl4JUb2CQOdn5J1jUHL6Wkf1fZhtePvaq67q55HsBm@vger.kernel.org
X-Gm-Message-State: AOJu0YzWs+evlUekvUjWscATTs+6SxpoKzKj7+r+GsVtPc1sQRwmtDja
	DO1bPT7xXbD7LwB01LnRDW1dQgasZZg6VzCNELZu8zYdHJRFymm3+ZKs8ZhQalGk5Cc=
X-Gm-Gg: Acq92OHAKG1PSQpoSPWU5+BkmIVLv+m0YrI/wLLS9nJzvFBxI6soDMDX6gQM5fZhVjk
	f4p3KQ2gZnEl80ufocEB47Q3rrWxnbtYleV5d5jJ6RBz7Pj3fLfxZJKWoDljVks8dR0CH8AWT8p
	T1KkSnqFXncNSY7naNTNgaEchYucEvgPcma2k8kvbOVTNrEQo7NiG+hk144/s09Wny2yGbSH0c+
	FkCDC/MAnuc6T0+9Z9vVE9FF7Xavp5meb8Bh/l/PD/t27Ji39+dVnHyRqBFGX32YEKTisrjqCDZ
	UcrZlix82/THug7prQGi3qVofvzlJ9EzztYmPLBfLD3GLJhmCh4XJYuOYncqJ9a5zqpTWzXuiH9
	nLR4X5EuhKf+l9Rt9Zze+V/rKCxBbwNKCYwAPwFFjevW1ps4THgfqijVYDBFoK3L79fCsBNHQhp
	MPiKBI/qVXa6agscRsb2aHVbmAv+3/96wId8gpo/LlzPN0mmGfbObUAP3XhLJDG+7lBpCBeN6gX
	g==
X-Received: by 2002:a05:6808:11c1:b0:467:2652:b29d with SMTP id 5614622812f47-482e55e64damr9452991b6e.8.1779117399487;
        Mon, 18 May 2026 08:16:39 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3be6:1187:fed4:378b? ([2600:8803:e7e4:500:3be6:1187:fed4:378b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482ee0999f3sm5028432b6e.0.2026.05.18.08.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 08:16:39 -0700 (PDT)
Message-ID: <60d66897-41cc-4f3f-afd2-64e49f0bb55e@baylibre.com>
Date: Mon, 18 May 2026 10:16:38 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/6] iio: adc: ad4691: add SPI offload support
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 "Hennerich, Michael" <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260515-ad4692-multichannel-sar-adc-driver-v11-0-eab27d852ac2@analog.com>
 <20260515-ad4692-multichannel-sar-adc-driver-v11-4-eab27d852ac2@analog.com>
 <80f61c0b-1f36-4fee-9f76-b93f63b87abe@baylibre.com>
 <LV9PR03MB841418AEF0059E802F7A69B2F7032@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <LV9PR03MB841418AEF0059E802F7A69B2F7032@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/18/26 10:14 AM, Sabau, Radu bogdan wrote:
>> -----Original Message-----
>> From: David Lechner <dlechner@baylibre.com>
>> Sent: Saturday, May 16, 2026 8:53 PM
> 
> ...
> 
>>>  static ssize_t sampling_frequency_show(struct device *dev,
>>>  				       struct device_attribute *attr,
>>>  				       char *buf)
>>> @@ -880,6 +1229,9 @@ static ssize_t sampling_frequency_show(struct
>> device *dev,
>>>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>>>  	struct ad4691_state *st = iio_priv(indio_dev);
>>>
>>> +	if (st->manual_mode && st->offload)
>>> +		return sysfs_emit(buf, "%llu\n", READ_ONCE(st->offload-
>>> trigger_hz));
>>
>> Why do we need READ_ONCE?
>>
> 
> trigger_hz is u64 and if the target is 32-bit, a 64-bit access compiles to two 32-bit
> instructions, so show() reading it without a lock and store() writing it concurrently
> can produce a torn value at the compiler level. READ_ONCE/WRITE_ONCE suppress
> the compiler transformations that would allow that splitting or caching. We could
> have st->lock in show() instead, but that felt heavier than necessary for a single
> scalar where a transiently stale-but-whole read is fine.
> 

I would go with the mutex. It will be easier for people to understand.
