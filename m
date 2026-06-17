Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807C83C062F
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681670; cv=none; b=qRxHLQSzH3NaFWoSmDXgBg+FiVmtYEOdMmQ7O2DmRu1yg/vEumad5aO4JKlRqV6VhzycpL5/Bh5dvlxFcBJvPMc85cFX+6qVq0mqhAGZTtiLuyhJblARKvEBf1GJixMyluwtFi/XGof8Fn5N2R6OrTXxavlRbmRuACK+K5fwRMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681670; c=relaxed/simple;
	bh=Gi0XiZ8YuxbcG9V+HtV+HlNj+B5fo8qkkv3muwP4M/o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PTsRHfroFLjEkJMGRdJ0rsIz/fWhh7X4uHs5Ss40wAa8yVGIAJhu6nkZqIZLgFRzQSzF4Q1lO8NuT5hbuRKHagCPGNplunWzLc+UbePkkmnQZodaKBhX4F3G1FoLyd/YPF3smLg9zlFn/ymg8tCUQ92GdTfkbFHyKJ2v9OBFhRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOLu0r4G; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOLu0r4G"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490afc47455so24482225e9.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781681666; x=1782286466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Uim5pbWVyeQp4JbMjOlnv43bbNh3AaD6WsvZpd9kZ8=;
        b=bOLu0r4GEoeAXK4H7yFPPwWYXKnFSuDrMZpJyvhuROKf3+tHxmGzoeTAfydAQMLyU5
         n/ocCTwlaN/mArhdtYrCmacYMKJKK3JKTgblhdi6pBBNTAbEFz3cD+CqEjCGcuonHhBK
         KuIhU+GGh5Hp2av8v+zzq8a2zhBKUjBFrCywj6dcNY/OaGzKxRF38RE8+TTUJDHoEOfS
         XqCGI3vGzasP/9SzQkPYrLumktt7OLbP/LHzHN0nFBmYdQGrLD82M1FiYGtc1hCHaCRl
         5Bnu38MOqZaGZfqpkSkMQarI4iMgqlSVEDY7lfuvv/W/PhGp5lBBZy0GspPNBQnvggX7
         kzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681666; x=1782286466;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Uim5pbWVyeQp4JbMjOlnv43bbNh3AaD6WsvZpd9kZ8=;
        b=HFBTiak6f+5MeuBnKmR4nCNYnN/uldl8TK8UNpWLwlhhYWKXCgwLB86mGeiX/FjJX7
         a8m/WLk59Zb0aw4jfAY0b3liuWYX99f8TF/kFfHmyLWqJrvx1V1+062+22D+eva5SZvc
         g0EYzy17hTHEM8j6cMHtaCYA7uY9dhkGrDs9na0nW8AQWfLPH79IKMYwiMvsfweCruIU
         FWazBuD29fEZ4O+LcVSQ4Nk5o1UbX8au7CHqmTRsbZMh2gph9c6wqBMh1XITDi3PuxN8
         6QIrYQk864ghdBNWZmt75TvOnYFLl4i00Rqk83pEkReFi1JSFnx4I5hUpLMpooXFBtyd
         NYHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bbZsOFmxXrjJxNO3hPCw2D5HUrCLYa7ibPVYUhirKS1AUonMKfNJdKT8bfroY0AkQohSmH1TnPho4@vger.kernel.org
X-Gm-Message-State: AOJu0YwNWBLmkwvQWKmZkhikt3uoY7Tbwb74eXGaJUvmipstjcGqo5ot
	wFc9yf3I8zD3BeuMEcuLDb4yutn8izG1IosNjPDZS4nEO6RB8vLWbph6BJ6Ht39t2+3cToHTLFC
	73d6V
X-Gm-Gg: Acq92OHSf2q4lQij+YkS1um1LjsyNzstxvdWwShEHgj46MxiYzpM9swyDhfNgJ9WfYa
	2pV2OtEjefR5YFgodIHVTcTT8OjmhJTBysWkLNpVG2alFX0DxDdAYOMsEPmH8WvSThbF2Y3N/DD
	ny/WMmQzKgyLzh9aiNxAoauncYgGewzSphdAMxPDTfACFSma5GMu78agKnmZq1LK9yalTzcFITJ
	5IOPIM8GdcQy2FsiFrJuzNgzPGJXOxl+D0S6a98G6SQe0uLt6uDgf2yBvs42V619mvy4X+QliJE
	jgVitSY2anQbq8j+plxX9UVFbdZQjXAv9SZfF1OEjTH1ZCjE88I80RyrNfK9jUEzlMuLlJd9saa
	tfNWlzlVayt6megi0d0bPTmfy/VTmIt8+qXxJCPoPoxxkCsFcxgWwBxqmz2b+6kcGY5KInuPk0c
	4yMnAF0ZXBW3RRIQWqa1nXLQ==
X-Received: by 2002:a05:600c:a305:b0:492:2c87:3d4b with SMTP id 5b1f17b1804b1-492333af19dmr33307215e9.12.1781681665133;
        Wed, 17 Jun 2026 00:34:25 -0700 (PDT)
Received: from [10.12.4.106] ([212.133.41.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa97a07sm242913335e9.14.2026.06.17.00.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:34:24 -0700 (PDT)
Message-ID: <6726e289-02c8-4267-b8cb-3b4ba2ebae1a@linaro.org>
Date: Wed, 17 Jun 2026 09:34:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/4] Revert "dt-bindings: display: panel: panel-simple:
 Add lg,sw49410 compatible"
To: Maxime Ripard <mripard@kernel.org>,
 Paul Sajna <sajattack@postmarketos.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 phone-devel@vger.kernel.org, Amir Dahan <system64fumo@tuta.io>
References: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
 <20260614-judyln-panel-v3-4-07f4134441bd@postmarketos.org>
 <20260615-amigurumi-kagu-of-prestige-ecae6c@houat>
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
In-Reply-To: <20260615-amigurumi-kagu-of-prestige-ecae6c@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 11:17, Maxime Ripard wrote:
> On Sun, Jun 14, 2026 at 05:08:01PM -0700, Paul Sajna wrote:
>> This reverts commit a74c2e55ab66519ffa2069ac9ae83cd937bff4c4.
>>
>> It isn't actually panel-simple-compatible, and we knew as much by the
>> time this merged, but I guess maintainers needed something to prevent
>> the dt-bindings error going off while I was working on these patches.
> 
> I had a look at the patch and discussion that commit was from, and I
> didn't see anyone bringing up that it wasn't actually panel-simple
> compatible.

I wonder why rob applied this one, I clearly requested a v3...

Neil

> 
> If you knew as much back then, why wasn't this brought up?
> 
> Maxime

