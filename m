Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7D043E9FE
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192477; cv=none; b=G+9+ycXEdkpdzzs6r0LCuNxE8mBVOhVULGkCTZmL17kn2aHhgPyWMK8aguhtvVgAJQfpZDz75EoiXFw2n62xPon+n1uV1hDA6kuY+sT/WdkhxfmQIsnteWT3NAIPoOp97xBWHRX8h6be7Pn1fPmnwN6NvFve3tXyrKRyeqpce1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192477; c=relaxed/simple;
	bh=n+MNQ8jx2vDcJDj5wuKH0CEB4xVHHmqfqr4RxTw0l6M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nJ/DAYtTvPtFDgPsJBWf3d6Jj5PrmSUaxPqSaeaNL5DLai569ujEKLAS7pBqzq3nYKWnH45G7+4gADRuhEKMZ2mFBg+dMTfIkCiW8ObiYxF9D0rw23y2wBSV66PlUckf9Gt7NtIdFSAsf/a4Z9YG2VSesGcVM4BoQA970mADVxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vaxFGghk; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vaxFGghk"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso12694485e9.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 02:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791192474; x=1791797274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rLD6lFejoN0T8xG1+fKNKHQcEvhqJXDjenF0dJEnUA=;
        b=vaxFGghkr2D8O4aboLGbC09uHkehC12Q6VAtaiOgaMgc7oExRAf4yf6RAkSKlTMQny
         +SKAbf7Eh9HyB0JiFuX+j6ku5o11RMIHbMst2Yf7kmt5mxdlT69ZPBh7gKo8uzXBnMcY
         B9nRbhimU6Xr71tuaRKl6azJI7vUKZ80rE19NWPgYT6qPxPp+hiZkJuS1ZuvIL41Cyiu
         p5LanmFpEYikRwQItscPpGb+qiI2gLCISmK7nev+D6fv8Q4AWVVy7pv44YyXFvIhe8Bq
         G1cBCv6AydOHDLaVjkySVDW8Xo+4JjHs27R68JdYV9TClzqe4xiyo9ImmgnUMwW8xe0h
         KYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192474; x=1791797274;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rLD6lFejoN0T8xG1+fKNKHQcEvhqJXDjenF0dJEnUA=;
        b=ut8GMetpQz4YZOrMUFASEJ+RSsEB7ykarZRwlK6wsKirwS/+1kPl6Jj5UcJOufaorz
         2XflKboWXi4qTI+6i4VqPWCJfILKUSe2AnY+ToEYeRHWVvDwU9XxDyML5PAQDtU4Vtk/
         006XY3ASzAt9VHv2tLynNh78Pu3LLeMBvvEm83P1LwtGGzWngg4XvgK3NlbEOS48CddA
         CTn6gb69t+sz17JFfJbPnqzBgTQdy6aauoP1V5i8Bqq7RI2vvo86ARiqcbu4thmMx++V
         ZneWW3Qn/DYxG8I/SuzEF3AfQXmsq5P+lDzsEnHBqdbmzNn6/s3Sey2F29bXg6nhsghJ
         ueoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMhKwdMIMTDl3MLALbkuj2bEjebxEzMXrAXsg7DRdHhUdjWWB+vAweE/6EEKaeBK867sQ9kZBZ8vsh@vger.kernel.org
X-Gm-Message-State: AFuF++lXSi2vLK3GcboAsZkIC476OLAZxJgZ2N+3WTqyB8dxZqgNwTzs
	qlSwBAmIsaCnPUdZ0gGfVuaeNCgvJjjoijDfI5o6tbudb17QyYYsvW7Q4nBzQtUUG4g=
X-Gm-Gg: AYBFou3Qzfa6LT7UGGOKzOnWrSnP3e4LD6Rb/vntU0AUUQsD9/MYghriAH1rQAbOeMH
	jUTQOoSaz7aKZo7mBS/yf+EQY6Cr6538vAt25+EUN+gccsALsqa2HHeJLv1PSzuY9HH2We2Q1PG
	US4AoH/EgLJUlnb2ueqV4PmzVa6BISgiBb/D902/JCmQC1ZUa9GeOGWXaV3ryjmFA6W2zKx4mCW
	oUo1rpvNgWx/53GTX59d66QRZCdXiQanWIA2SFg6jp9ge20Zus2so9bVNrGoiwHslwX1H+hhg8E
	ELmqtzRMpC2F0IPqoS+inJQNazrdPG9RSldF2gZa6/CCQf0rrZXVBIsEDOMt5QQ6WjuWgZ09DiR
	HLVfqtRghC/fuA7HgSArIdOnDV11/77Yg5+/b9VbPaAplItDz28soJS/1CGP9+4PAddS7nWSDv8
	0NWKa1qQRPeuBc2wjK5vCtujFS2xxF/5W1zbdEHn2xu+5qYfugAUDW/xuMMHFLqp0Jul84hW9r8
	bBU9dmRDGFRQyV/k4dVIZSzzkndl0g=
X-Received: by 2002:a05:600c:468d:b0:4a1:7093:409a with SMTP id 5b1f17b1804b1-4a1709341bbmr63938175e9.27.1791192474107;
        Mon, 05 Oct 2026 02:27:54 -0700 (PDT)
Received: from [192.168.151.46] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16620dbdfsm221932725e9.0.2026.10.05.02.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:27:53 -0700 (PDT)
Message-ID: <9be89803-974c-4746-8af0-a13e5a19fb33@linaro.org>
Date: Mon, 5 Oct 2026 11:27:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: himax,hx83112a: Tighten
 compatible matching
To: Luca Weiss <luca.weiss@fairphone.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
 <20261002-hx83112-compatible-contains-v1-1-d558635ab7fc@fairphone.com>
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
In-Reply-To: <20261002-hx83112-compatible-contains-v1-1-d558635ab7fc@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/2/26 16:49, Luca Weiss wrote:
> The compatible was defined too wide, we just want "djn,9a-3r063-1102b"
> and nothing else.

Can you add Fixes tags ?

Thanks,
Neil

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
> index 2c60d0cd704e..3dd9b25ff13f 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
> @@ -18,8 +18,7 @@ allOf:
>   
>   properties:
>     compatible:
> -    contains:
> -      const: djn,9a-3r063-1102b
> +    const: djn,9a-3r063-1102b
>   
>     reg:
>       maxItems: 1
> 

