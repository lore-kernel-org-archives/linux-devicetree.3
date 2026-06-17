Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3962EEE74
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681760; cv=none; b=OlqfMR+qZUMdQFJiDuOW6hny/7rnItdh7IJp1klTXjvkkCbmGXFbN8MCEmz7MFBE7MxMOWrjKYTPM/t5uUjF3Ff1xYKFj0jsDOKEEBoFSrW5wk//m0WF9einhUZ/mVCsZXTqeId5QNt/RdKlrhQUsAC5TtE3rY+sdY18WJhyJkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681760; c=relaxed/simple;
	bh=xfKAXK1C8BRrF4On4Jlu4EWr+ZiJPw/Uy2ZjPVwX8Vs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=N+VGP8ClTlo/VBT9jV0lyDYKLp2kNmaKINZbjnUU5ZWcElK9kkSVz9ues9PGf+Jytk3RWrOD6BDvmR88h7ReM0R0zwOysmwPQMRRE5T3h/L3U9GOLJCOdA7S+V/EXtsnt+MveGpMekh8UDal24O587Ghd/LHU2SRzuHB7KA393k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t8l5phXv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t8l5phXv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so45932325e9.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781681753; x=1782286553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiyyh81BRUnw3RVblLaAaVPI8hb9C+UfMQnBnCoh3L4=;
        b=t8l5phXv1FERCnwIRWsqvSPkFd81xHci7QRnTR1gPgnb2rDbIeRt/tI9D6uCjWXsN1
         HZGUsYvOSRtpKNbVKMFS2RifBQjFrFrrfLXR29gFpNAmfkJpBF8P2v/oYut0CJ7zDqhv
         hL3rG57n7jRU+YQpM1Lon9mvk9Z01w99Ra2WMYs2IZZzwcQM1NefYiqvChoJuWHW+ara
         DmyH3AGL5tyvmX61ILTQxqs+YsVShKShdN2E4qJS+9yynMUjHRE6djlqw4VrVlEjAJ1u
         H9QV/MNe0NPHkdAN9KHqNT3eaCeiqA6/FejYPIwitiHZfvlJDWYTQleLn64WS/HUiDwM
         Dd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681753; x=1782286553;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiyyh81BRUnw3RVblLaAaVPI8hb9C+UfMQnBnCoh3L4=;
        b=iZiD4xFovOIg43+ZBw2wmHe47IRjDQXpLnTP4zIN0gjnWwJV8gmOQzPFmLKWkP6lL3
         MWLVa26WGBhU3kACxSTEDuxq9FcKVJghHxVxZWLpssDV2OcWyT12oANewKYO/foEy3Ze
         B0iq/E/eizm8bU/s+guPf1d9wUiUwYmsZhhv/gx1x3D0P/F8bY3ttSnBH6V+WxfeOtF4
         ldBjeadBOVCi/0JQgbw0iLKzY9SIqMOJCXBTeW+lSarS/b1K5+rJrIpZ9dhYDfOzqWKj
         /umjJlEn/pYXy/IC9UWzdG/RiSoVnuS8c3ZE5a3/9KsxCqWPMmP636u3FGcWx+2Z/FYM
         V90g==
X-Forwarded-Encrypted: i=1; AFNElJ/wkewT1n2lEG3oEtyD5zVASXd+N6B5iVVmMkprzSlnzYQeqXnzsG2inD9KuOtJkemlqlQZA3ueXDPc@vger.kernel.org
X-Gm-Message-State: AOJu0YyRkLnwxJBd+SRUKzEKx02L5KpX+NG0eIdMWvoZuBO0QNYaPBv+
	n/vwyA5RqfSIUY9hQdPj558A1eh9RygNqkiPC0VvdxYHexZKNTRuQYHvOSCuQHpll6I=
X-Gm-Gg: Acq92OF8ItuL/vwmB9RCP2Q6azFeXSwyKJTxBQMenBXC37U//3YLpRHLf6c7J3GBGCQ
	Hgwj+pwoSFxD7TkAFhzyodnKJabmo25f6uzixXiX15Ceff10ZcUQnmVgbS+UKmrJWugj1m0gRFp
	v/ImDO6+rx7ZNqsuE4bs03+JQ7J76fMlhctGUZvUQi7VuCkQWkSDUfmHA87e0Hp2kfbzrgMRxWJ
	Hiaa9m4MogEKH9jkbovHexmmWVFjV/PijLgSxriKw3Lov97PXZujCYslUlnxP7zdY1Lux6u22qr
	Kx3K+U+OoztTLtqXBvSvg1rmvQektXld4zwXoNL+gmyUWxU3wtHvWdxTjUSmgAlL9glxDLP2Nsh
	X4vePB4k7V4lrOAj7CxRDDCf2tsqxZvDXgzSjOOP+HmrnCKo1+sjYJpZ+7SqZMyxyb/266fawjT
	5RFiFTWgnEL5qNhb2O75S2EA==
X-Received: by 2002:a05:600c:a104:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-492333ab197mr38532605e9.13.1781681753234;
        Wed, 17 Jun 2026 00:35:53 -0700 (PDT)
Received: from [10.12.4.106] ([212.133.41.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462a9784497sm3087858f8f.34.2026.06.17.00.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:35:52 -0700 (PDT)
Message-ID: <69550878-fd99-4da2-88ad-8d537d9e305a@linaro.org>
Date: Wed, 17 Jun 2026 09:35:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/4] Add DRM driver for LG LH609QH1 Panel with
 SiliconWorks SW49410 DDIC
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
 <20260615-celadon-pug-of-teaching-f1eb0a@houat>
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
In-Reply-To: <20260615-celadon-pug-of-teaching-f1eb0a@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 11:19, Maxime Ripard wrote:
> Hi,
> 
> On Sun, Jun 14, 2026 at 05:07:57PM -0700, Paul Sajna wrote:
>> This patch series adds a drm panel driver for the LG SW49410 panel found
>> in the LG G7 ThinQ (codename judyln).
>>
>> The basic driver skeleton was generated by
>> https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator from the vendor
>> device-tree.
>>
>> There seems to still be some power supply issues, the bottom-left
>> corner of the screen is dark, and the rest of the screen develops
>> shadow-y burn-in-like patterns when resumed after being left off for a
>> while. https://i.imgur.com/oJZSHzE.jpeg
> 
> If it's not reliable, why should we merge it, especially if it can lead
> to ABI-breaking changes like it happened already.

If the patchset is not ready to be merged but you need comments to go forward, please append RFC to your patches.

Neil

> 
> Maxime

