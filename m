Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F1495AE2
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733525; cv=none; b=T2QpGCHBgbNK7aKvhGnpEJ95dsHHfdak9eq1rCCilPHGoKbi+fSiK3Bhqq7Si8wQgAwyM91UXWffwkh3A5GuB/U0ut0U8nUz4mwAYb3FyiqdE8ydKuKBwRxzn/Ls/csOGbCb5I8rmxpwji+mF2pl7UpMxIZwDs2rg/bjdpfMW2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733525; c=relaxed/simple;
	bh=mAvuQoR2beZSVJa/s8v3xFsx9u6xc7n3wi2c5JSHdto=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kiqjOzBqOQk0pGn2AHFk3JDK9573MROhfNF4R/UWTNX3r8AKA85k5JlLtbe846UEMXZycUSjJtamA8Xlc44FLH7XkNr7XoskGG6zJDzoirnx2+bA9qj7xfWo+XSPOQ9t4JUWxDfnduCxHMrcaoMDb6Qq4+LBExtLb3exsY/AxyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g5up6taS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g5up6taS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso8811385e9.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 05:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789733521; x=1790338321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORqkD8N1WSCgJ6FcZd1LHwMkHXALqMzVIogbGqJecbM=;
        b=g5up6taSuU09HkH+NLMQmqgmJk0hnlmvKuKrXNn5GZAZiRH/VClmFRrXo14QWvgErD
         7jRHW25EssgWMysgB7hFFz7JACckcKOD+qMwX94TOUSQVHFlik6D3jUe/164ROP5uJKI
         EdZk0EcrlPrrxXpVLiGc12gDnYys9Jf9+eerEHE1wlThIJaZOhdNkv2UzQs6g1tDSH6K
         UUdFuzv9taWAuDi8fP58oQjO6TgTDeMQoBgeXU4cKWdmON3b6jbj0vqQHAAwHI15kX3h
         u2lQ3k8DFoFPTv+ClriU6IzHvBZBwwW8OlMSrTLzdk5aRn5Q/RHOmGx4MhpByduRCQWo
         K5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733521; x=1790338321;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ORqkD8N1WSCgJ6FcZd1LHwMkHXALqMzVIogbGqJecbM=;
        b=NqAa0MgCrfN2/T2e0Seyo0InzLqV01Y65+X2QQcKACBtvrvHjV/yYVWEXnGoYIb+YK
         gkad/njY9uqiXxVV/c9/zO+W6y/aNQkTNmRJvfABTA/aYciX4Stw34l/o4AdJJxyo2Ui
         Aim/Q1bl//4MxZ0NZUQ7wkNzTQyoX7hhiiOnp1wxiSnEwjQNBs3ctgpDMFtLsZ6KYACF
         w4BjgP3bC5FNEWTIl2zxxJ0dcP0Qg0qZlIEHXeOh5qKBp+OmYSh99wY3/5NW4abm4bXu
         iOdvb0xEDkV5q5E3l2TQ+8UwOMjPbLOafL3IGaKz57orLSV1F2FyoUBgPlsEiVk+TUeB
         tAdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOIdlO9MzLBEGi9HBECc5WSpj1QViYDfyrLmhtr4SkhHOrnAmObY0s4g1tj0ut8JfAUP/Otx+bW4Q/@vger.kernel.org
X-Gm-Message-State: AFuF++mAKpiESnj9XR9Qf/EqVq9BMFl4CPKaYVtGBt6venCs1igYAg70
	E5ePV3vGoiMmx9yQDvCOnhiCQAF9o681ocppe1KGyEXDeEkS+WbvX55e3y69Ul0kClA=
X-Gm-Gg: AYBFou1bZKD62UQDjpMLkkWwoRjIOb62OcYrFoUOs/Ix8vMuWBg0+NAEpX1dURd8ZD+
	XuVk4PI6pq9E/JeLlzwxBUFUR1yrn3f/sY9D9pAhyNA6Vb33XYWoOJf9+SBQNdLKD5p1Lm4DNIf
	iuM9egyqYkUMe3um/2QU8FvgLUgKaxU1kfYNfXDbAx5fv5kmHg9l9+JLdMx+7Y3RH2H0p3LADj9
	ds0LlWpDuLHiKxx5WYL/YPUr7w4M/y7bBfMezvdHANkHY5FYsvtL1pba+2l31+3dOrbhjyluG/q
	DRCkqvAIfjdqYxUoyAso+dPKCeEw4E2LPs+iEUM6gyihy3n4ndlX+MnfHLdQZeZsKI3mCMYkDDp
	2GZwjFJbdCNJ+bmbYPR76WdpgNvKUe0OIlSgSqmt6rDwYsMiW3FhHOB54kSWpiL+17GSXlSxW6E
	9fzfLTitFsbArchJL/jGH2iyCVhgtkeyBE3OMW7ih4GsxjceUVCxx+P08BeD2MN3u0pzBfmYAyd
	wP140h92MCPx+ZMw0a1qa50+c52iFdf7NJQKlXbKnTlk4F4FWfYaKfC56aVUXB/
X-Received: by 2002:a05:600c:1c09:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-49fc57479c9mr38337555e9.31.1789733521251;
        Fri, 18 Sep 2026 05:12:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:c55f:cb91:1ca5:54dc? ([2a01:e0a:106d:1080:c55f:cb91:1ca5:54dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7ce0050sm59868415e9.4.2026.09.18.05.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:12:00 -0700 (PDT)
Message-ID: <91c73c90-9aed-4f27-9791-6cb091f03eb0@linaro.org>
Date: Fri, 18 Sep 2026 14:12:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] regulator: add regulator driver for the Nexperia
 NEX10000UB
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
 <20260918-topic-sm8x50-nex10000ub-v1-3-5afe06bace03@linaro.org>
 <731ebfd1-4080-4343-afc7-95af081a9990@sirena.org.uk>
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
In-Reply-To: <731ebfd1-4080-4343-afc7-95af081a9990@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:12, Mark Brown wrote:
> On Fri, Sep 18, 2026 at 09:25:39AM +0200, Neil Armstrong wrote:
>> Add regulator support for the Nexperia NEX10000UB dual output LCD
>> bias power supply which provides programmable positive and negative
>> output voltages mainly for display panels applications.
> 
>> +static int nex10000ub_of_parse_cb(struct device_node *np,
>> +				  const struct regulator_desc *desc,
>> +				  struct regulator_config *config)
>> +{
>> +	struct gpio_desc *ena_gpiod;
>> +
>> +	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), "enable", 0,
>> +					   GPIOD_ASIS, desc->name);
> 
> This is GPIOD_ASIS so the direction might not have been configured.

Will fix

> 
>> +	if (IS_ERR(ena_gpiod))
>> +		return PTR_ERR(ena_gpiod);
> 
> The binding says the property is optional.

Good catch, forgot to make it mandatory.

Thanks,
Neil
