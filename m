Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BD648383C
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255753; cv=none; b=NFju1hXCPo/etyHAKH8Y4jteKL19oAb3RVhzwkLbTgjYO0U1o3ANsZn9fisYSZbXpz520Tyw3RT6mj4OkwBVVwsyl65v2RyFq9ZUw72YYLbb0SAWlAYmt6z+jpvtET4VGiBIlK8QGfLUvXSJNditTol4V2pqipKDz8UBu3hO8XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255753; c=relaxed/simple;
	bh=EIWW0uIRj5E/AVBdjvDh6E1nEQM9QogOHLuBjVHOsyA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=S3x4axtHuGHUI4NRhXcgRFkCt3/jaSv22TXHareGBcZVNd8js+7rSyLsbRNWWw93UUsypkkesgXLqZvSl8o5ha2YZQSDvExcdO7BLdnzzsw7uOuk2SakpSLxeDAAXig14ZVF+6Z7dWeK8ob588I2GhSBwOhDz+Devs9sn1QZJjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KW4PAIo6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KW4PAIo6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-488615e6cfcso382219f8f.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790255750; x=1790860550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtFgILpoGN9oew1GWkpWJvU0DfUxofN2O/h63lGOutA=;
        b=KW4PAIo6fRAAS3wpIwLK3qHzl8h3UBem8aRicS7t5q0zIJFqoNBVaZ8o7PHtG3SGMb
         gVUMOC5vtQCNKr6uG6b2M6fmf7RrimRph+Ry5FnlDbeBCVyGk7oqFaxdr4FkFpmpoKaG
         cfnkHWQtYxS84AHk31Hd9ntxEHtOTYtTSFRLPd0M48D8TnWM+clEuKauLK6/h+HyppEN
         67KsPJOQL6a32uaWo3FneE8ga3N3zDy6Zn9B2WhimrcgpKCY/zGJxQVJmPDoNPiZy9EH
         wPj6EQAZD9lBSusaCUXjL6K6BQso7lL22guc2dF5ZOpZKgNPnFxAlSqobrNe62xXQoRG
         6pSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255750; x=1790860550;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtFgILpoGN9oew1GWkpWJvU0DfUxofN2O/h63lGOutA=;
        b=TftV0nVbMtM0qXQSHLJMi4Df+99Bz366o1AL0LOTwoPxUfi4CWLXg6aCKInP3zr3nd
         ca0HqT8Q9tdNKEOGcdNdWWgSPS5eBSujIwR3YFoj0pRFZ6WlUnEcdjNc+4pJc8n7W4c1
         8+KoYnLXErbiljiuMNS6nNAhZVeJ3k3gURx6bnJLbX+//OKVn9+GdmM7XnmcmAU8fJGy
         n9ubJUP8gQYNGu1c4rRax91pq9D1vfwxhLut32j5RCvq5f7bucTqWhFzypD43NdbhlC+
         9NmcZ0NSavb7TGeL7WjHt4nAB5SLjR9k71+sFaUbjQ3p+Q6QnZdE8irpkl6u5tcU3i14
         FO2w==
X-Forwarded-Encrypted: i=1; AKwUvBxh6aJVhQ0s3+R8DdkuXbFbBlWynh3c1FSx8vm2cxgkZDKsj91EbGLgqCjymSDpqrObHXTUqUugTDrJ@vger.kernel.org
X-Gm-Message-State: AFuF++kpdi5EFIXHL1pCz5ThChHau7kG65Yls7G69/VQUZuO8yJD80B5
	ZA1d68pj+rSsG6gc9yC2/YWMeFutTqVJjnXJ7L7nbK6v7hq8zHrT+4GZsoMI49+0sR8=
X-Gm-Gg: AYBFou2Xzk25irIgB922mCkPXhNGA4GWauafQqxPXLDPiYet5O3YeFTXxTfmSHH7voo
	etn1nfhCMThXRz1sjZN8XMlVci+A6lggBKSateekcKOv2gTJH7/2uGs/NcqBXDtxQ/qkRRJLtZQ
	A/eQ9IrYJHER4IT38Yncm/GxUDdRWrG3yu3oowDOs32DTqTlx6P2Xs6okTTJo4a4nk/JVDcgZQw
	4rhzXdp1H8CBPqC8A0tiYvcFLbgtIPQ2yJjOaKdt0VwrVWhrZf6VWrRD/+3NlcrXvXOMNXd5xzS
	fx09ZQgv45aecdG98rfWxEd9Ow5o5B30OHXqmLXuhsnppOfw1hseGpWdCSSbIBg7N5XR0tQ6CMU
	DhkpBIB8UBlsr9X+ceIxN2H9/hJ5QmerjqhxH2JSpao0oELCkeywlTANLhN+JfeFqKJWMMfZ9yx
	eTLl1o/IUCSEgOXoIIO7i422QUVWOHYAy6sNB8bUtyBPvRPtqDdz/QAuPq3vjx5NjVzKK14QRMs
	ptZFdPzAbbbASe5cpcBtYjFydr5qbI6EobsqqNFEvK8EZkbBACSFg==
X-Received: by 2002:a05:6000:25fb:b0:487:25:71c7 with SMTP id ffacd0b85a97d-488716b96cemr4930011f8f.12.1790255749477;
        Thu, 24 Sep 2026 06:15:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868886e45sm14944343f8f.31.2026.09.24.06.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:15:47 -0700 (PDT)
Message-ID: <bb71b2d6-2462-4351-b6e8-ae8785a24c11@linaro.org>
Date: Thu, 24 Sep 2026 15:15:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/4] drm/panel: ilitek-ili9882t: Make enable GPIO
 optional
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
 <20260910181918.31551-2-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20260910181918.31551-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 20:18, Marek Vasut wrote:
> The enable GPIO may not be accessible on the panel, make it optional.
> This is the case on 10" Raspberry Pi Touch Display 2.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: No change
> V3: No change
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> index d4b383138488a..69f6427bb4ffb 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -787,7 +787,7 @@ static int ili9882t_add(struct ili9882t *ili)
>   	if (IS_ERR(ili->pp1800))
>   		return PTR_ERR(ili->pp1800);
>   
> -	ili->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	ili->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
>   	if (IS_ERR(ili->enable_gpio)) {
>   		dev_err(dev, "cannot get enable-gpios %ld\n",
>   			PTR_ERR(ili->enable_gpio));

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
