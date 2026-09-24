Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75748489878
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263544; cv=none; b=ig8VDqh8Ks5oc/JSX/0fjuwKd1zlBBd6X0DmYQ2dS9paEQ90MYeTxDRW3zrTuebvS/wOKrwGxDqRVEf+Dr9ud5tTirRn71o3bZSNA6vuEIZYT4/INzHxeXNQcfNe3eIppmeR1PzpJpUj9aD129eA848ixe0L2zJVNJseOQ90I9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263544; c=relaxed/simple;
	bh=QUgI+N6cvHFqcWPrsjrCdXgxKDSlGHUCiUa89pcPZnY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ac0iMmIen0LoKQ3+PbOz4sN3l4N9N2lI6P7KrPuIV2mM1GCo1gsDo0A4A1eX2Z07ympU/hu1oMWtItsoQLrTlJbg7inc/tvbOquAV75ZuCdqFrcQrWzz3ZCZJPd7ufhffyCfKnLiVAB5lXn2KjckHc9gd6t1pTBOa9zmqa/Zevw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QTlAPPVK; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QTlAPPVK"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so1587208f8f.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790263541; x=1790868341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8cnDBSikRAsgHAsxFd+ggbMusWUaRFenMiRKU617Ngc=;
        b=QTlAPPVKuamrJFAqYuF7s0QtyFm+6Gx1zL0rghV/Zv2CDE8DqfGgGKYlkOkD/6Npvz
         0hAa+Sx1QwC+pePgYLJziW6svRnkPDT5XTrdpxJRbV1K+VEuxuQiQopEEKZmqX2nNa4J
         LJ3gOsp2YECmgFZkhBQ2dhJBNYqJf8C1RRMe4+oqEm82A1Loc460sHwHtUtB24arwAJP
         G1heeM/wbqHpULR0pFmfZ7szD8Y1eGr0JJCaZgTp8TDb3vUBPMJ1FJlSnlSVitIheREo
         GLLsqpovtSBVmofqRpWLocc3DFCFEVxZo3mQSbMIWBJm6qUEahkfE6bQ15gnP+5PCnev
         8Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263541; x=1790868341;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8cnDBSikRAsgHAsxFd+ggbMusWUaRFenMiRKU617Ngc=;
        b=z3UI+xzQV450YHYt3ki/XneHmdnD7co3lnQNeavVFsFYdXyg++YDAXSBYW4f7Y6XcP
         AJBvQTaxI++lJRaRUUcqxOGzbY7TRqoPfuLlk14NhhlmMX8HOfKF4Xmdm/5Quv+yg8ph
         cOwpZj41QZOxXl/I4mXIQLnAfQBngISB0ShGKzlllI+WYhnmSSG11g3xI8Wo/Sy8xFTZ
         uwWeVy8aEFejrods/NuaSGeHcmys7IC5R7PyVMuoWQMCPrRbCQYBDed7AIqnxUmHOyK7
         BgtkgjJceBo9q5Ygp9G9ZhtiJyddAFVAeiHSzvsc78UjBpCzPDJw8GU+j/jM2rB66pLo
         peWw==
X-Forwarded-Encrypted: i=1; AKwUvBwxyhYyJFaNsSj+bQcEaLQ+CA+fl9WsRggmMny4Rjmvtm3dsLqL2uP2RLM7O8Mgjz3Z6F/j/H3HT/6k@vger.kernel.org
X-Gm-Message-State: AFuF++kIEhpuE/6G6SLGMT0JNESyem4/cfOFi7QvHZU61PPi23jzOaCl
	qL97O8VF6JHf8s/IpHO8TLMbUDLASJ16HJamGSIoI0kB0SY9JoBSi8HjUFixNJgUmBQ=
X-Gm-Gg: AYBFou1C4IAiK+iL5PNuqBjjKQai4hoD/HZW7hRGgPGq2VoA0J+XMXvPTTP3JICfwrr
	Qfw0/+W4QYMKTDnIc8l0cFQog6yTQafYrwSeKK5XIUUioPfS95T1xd78p9Y68fSiVEBPdAHRzYd
	TDuQhAkGkFWNd8IlE4iAihDZ5Es+hONmaH1N7BD3cgNEz62F54WQi8oVQgRNBTWwnN8TX1b0Hl7
	nID9KyVzv21s9we+i2tZ0DnHUrfu0znvcXOJeRiXBnqayZ/zU5hBBUxYnf8mGuyCL9gf4YG1ru6
	Do1x6QaffD9z8ovS96uxeb1kwUH2SvG+6qbTDHrY5e96Ld8QqBrNVgkho4XRVMK9WtJdGSgeXt/
	BWMxAGYZHl0eBT6spIMmt6gZuogzgBdjegHGVApymK311myw5eLc/kMbAfQZvMYy+sYtTh8gAzw
	GwEDRsR2KKfXZXayb72UXYeBfNj6d2CsjvrLzmV0mk4FZpnRiVAlydglEQ/rIsm8++RLmoReUKP
	ajdKqJBOIPqRJ6lJKzugw4qCGTyd5kxlKGeTuHq6gON70IGPruoogw=
X-Received: by 2002:a05:6000:230b:b0:487:2566:4b06 with SMTP id ffacd0b85a97d-48871682d15mr5167489f8f.21.1790263540499;
        Thu, 24 Sep 2026 08:25:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b956:9fee:508c:ebd8? ([2a01:e0a:106d:1080:b956:9fee:508c:ebd8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889409sm12781439f8f.35.2026.09.24.08.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 08:25:40 -0700 (PDT)
Message-ID: <488640b6-9535-4209-a569-327683c0d9a3@linaro.org>
Date: Thu, 24 Sep 2026 17:25:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923-topic-sm8x50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org>
 <20260923-topic-sm8x50-iio-max34417-adc-v1-2-41d4ba1bfc41@linaro.org>
 <20260924095457.00006ed6@gmail.com> <arUxl7QeiEzFlI7O@ashevche-desk.local>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <arUxl7QeiEzFlI7O@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 16:20, Andy Shevchenko wrote:
> On Thu, Sep 24, 2026 at 09:54:57AM +0200, Joshua Crofts wrote:
>> On Wed, 23 Sep 2026 21:10:23 +0200
>> Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
> Joshua, below also something to you to pay attention to on top of the good
> parts you covered already.
> 
> ...
> 
>>> +/**
>>> + * struct max34417_data - max34417 specific data.
>>> + * @regmap:	device register map.
>>> + * @dev:	max34417 device.
>>> + * @lock:	lock for protecting access to device hardware registers, mostly
>>
>> Nit-picking, but... Device, MAX34417, Lock.
> 
> Generally speaking it should be consistent with whatever style is being chosen.
> If we go with the first capitalized letter, then yes, otherwise below should go
> to small first letter. In any case MAX part number should be capitalized (or
> someone might think of it as struct max34417).
> 
>>> + *		for reading common accumulator count and control register.
>>> + * @input_correction:	Correction based on the Rsense value from channel nodes.
>>> + * @input_label:	Channel label from channel nodes.
>>> + */
> 
> ...
> 
>>> +static int max34417_read_voltage(struct max34417_data *max34417,
>>> +				 const struct iio_chan_spec *chan, int *val)
>>> +{
>>> +	uint16_t voltage;
>>> +	uint8_t buf[3];
> 
> uXX types, please. Everywhere.
> 
>>> +	int rc;
>>> +
>>> +	guard(mutex)(&max34417->lock);
>>> +
>>> +	rc = max34417_accumulator_update(max34417);
>>> +	if (rc)
>>> +		return rc;
>>> +
>>> +	rc = regmap_noinc_read(max34417->regmap, chan->address, &buf, 3);
> 
> sizeof()
> 
>>> +	if (rc)
>>> +		return rc;
>>> +
>>> +	voltage = buf[2] | ((uint64_t)buf[1] << 8);
>>> +	voltage >>= 2;
> 
> Not sure what is in the buf[0], but verbatim the above is get_unaligned_le16().
> 
>>> +	*val = voltage;
>>> +
>>> +	return IIO_VAL_INT;
>>> +}
> 
> ...
> 
>>> +	power = buf[7];
>>> +	power |= ((uint64_t)buf[6] << 8UL);
>>> +	power |= ((uint64_t)buf[5] << 16UL);
>>> +	power |= ((uint64_t)buf[4] << 24UL);
>>> +	power |= ((uint64_t)buf[3] << 32UL);
>>> +	power |= ((uint64_t)buf[2] << 40UL);
>>> +	power |= ((uint64_t)buf[1] << 48UL);
> 
> get_unaligned_be64() / be64_to_cpu().

Will switch to get_unaligned_xx()

> 
> ...
> 
>>> +		fwnode_property_read_string(node, "label", &max34417->input_label[index]);
>>> +		if (fwnode_property_read_u32(node, "maxim,rsense-val-micro-ohms", &rsense))
>>> +			rsense = MAX34417_DEFAULT_RSENSE;
> 
> What if the property is there, but some issue has happened?
> We have an idiomatic
> 
> 	if (_property_present()) {
> 		rc = _property_read();
> 		if (rc)
> 			return ...rc...;
> 		...
> 	} else {
> 		...apply default...
> 	}
> 

Will switch to that

Thanks,
Neil
