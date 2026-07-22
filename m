Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F1633937E
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784720765; cv=none; b=Ot8r/SBZSQwkcB6bUg/OypVVHvX21p3PI9SDwzD8/EiH3twLDl3izOe/jPWk0/Hj8XHJQ/Xm6y/v6W+QgBCAS0dlWKcY2fOkM+0Z696O9wul8kVhugI8YHHlG+1KNvjtP96BxOFPvP0JETc74e1tID36UjXfC6DTrWnWkVHwkcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784720765; c=relaxed/simple;
	bh=P7xGyHKCNbnZcFG+oZutcssEKnmMkX0s+mViILw9qpE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NSy2NX6egvdN7Mo9wLb1DS6rcYcC34R9JyK7bkE6FmiP18jSEW+GAYwcKRcRsJptXfVvWKmzNTpWLeE4JINylRti40PS3G2DeO7lRs6mYIU+eieNqmMd6xy66VXGGN+CKAQHLlvQVWFJhPcazTDjMqsODFrbcIZnuxQRFIDAHSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UcO5xOY6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UcO5xOY6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954df200ddso31725715e9.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 04:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784720762; x=1785325562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:from:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kN32egMVj+BuZnJfxjCB7GoVmbNikRELJH1GSBpm2RA=;
        b=UcO5xOY6YJxcpVgcRzYrpElhHc+4sG+CTbR/FS1Meo1RODLTTf5EF2PvE2DiVKrViY
         wrBVC9yJExAYx7gaNxQxy6YUo6kYjlz4diATiqEIpG3rDMFIW/u7JBtpg/itCP4smaZV
         VFkl7onBoodQEdlNby9IOwBzpk6mMDToZEvGKkZsmPBejdRXRm+kZGfZknRCiuGASxWy
         3brflvjRvSyTULqLntTPIBacUKKVGgthcowECWSXQ34XLt5s0VTSRbqwZs4M3g2gk7qR
         txOlbHiFZbyjF761oivlY1s+DXDgPddpIqUZ+x9Dc5boMb1t7+qwkvIN8IGmnuykDyvT
         1GUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784720762; x=1785325562;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:from:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kN32egMVj+BuZnJfxjCB7GoVmbNikRELJH1GSBpm2RA=;
        b=ppskifTQ7Fw4QplrZc+y7o0CU0Do99X7vyeXZV5+51srQU6bS062b+8Ev8wf04Qq33
         HYLUHTkcbqKwxbaySAezSJXc5DHwOTtCiQcDvVWEynlrYu+c0TRoh46NuoPNOZthiEKC
         ZKJMHTMyOocAXyd7Z23wUrHW2T28kswBEjMcJT8aww0X73v4UOcSQOl5H+weJndMsWNv
         Hv88gSEpgDj+61PAzRB+qQLqci2DkzOlEWIOHVwhWxYkEzLq4BNFt2XdDEWNmDS/d61Z
         pIbkfB42cXVN1gP/JQOy4vEXcaPmtsVXvIrsG9wzDgADdEIhrCEtgj355X6ldrlRN0EY
         FDIQ==
X-Forwarded-Encrypted: i=1; AHgh+RraPDr6zfoGM2BEkBt+2HVrLY3SCLw8LehhpZNQ62lbcc3x72qObuskUF921UmvumXGIkonG3lmn0yr@vger.kernel.org
X-Gm-Message-State: AOJu0YxhGHCfuts2kMsyqHM1rc/IO4ZQHfiwqPyeVUVXbuyAHSUEiQ9R
	BukByzEjG7rLwS4Ww161IbL82bKEymIYBdaZ+Kb+5qg91INbx12A4TZDTS5X+cjf/LY=
X-Gm-Gg: AR+sD12qoBVfsmM5PZHMjxgXk9/Qv2ereyAzbKzBd+Avs1Iv6mU44kcozddvCZb6GBJ
	5wgxHhUe9SmPbvnn+vlToPsSrSZ3yWmHioC09xqZDDHaJq7IsjBu6usdp6Y9b8dYgPBz3R0kJnX
	JQtXnov6P96iGHMjcZWKc6FM2hLdjWowZBmwAPupgz72ofdt2Wuj+TV3JxeAdRLvieoZe+kqH9m
	2C/X7IEEQagpLF23a3raJTtvcWMd8aKz5WnQGCKy5w86B0hOxEGc7k5Xgfwic90DBQgUVmk87GA
	luCabaURHyF4yAlowkeXIaQb5ASc7NJ3Ci0Nwye5s+DmbLyHEKI5zAb7ce8GzEqHluuQZwjbWj4
	eXLMEe+E3OWdv4CgLkFp7tgALuKis/FEwOEwmwU5x90RkUDiCIDHjXsB04/vUCjz5yRBVKDIsV3
	yUzamDLdvK1GV56PzKEREWPvILfn+zyPsIbZE5q/u76AVXRXdIt/Y3dexXEwUp2HR2TVKG
X-Received: by 2002:a05:600c:6289:b0:495:636b:e4e9 with SMTP id 5b1f17b1804b1-495636be6c7mr109500005e9.22.1784720761757;
        Wed, 22 Jul 2026 04:46:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3307:4f92:b0bb:e8cd? ([2a01:e0a:106d:1080:3307:4f92:b0bb:e8cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b5e04e9sm32723985e9.2.2026.07.22.04.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 04:46:01 -0700 (PDT)
Message-ID: <37613fc6-6c1a-4539-93a4-21130801d2df@linaro.org>
Date: Wed, 22 Jul 2026 13:46:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/5] drm: panel: jd9365da: Enable LPM mode
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
 Jagan Teki <jagan@edgeble.ai>, Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
 Felix Boucher <felix.boucher@savoirfairelinux.com>,
 Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
References: <20260708213500.1867092-1-marc-olivier.champagne@savoirfairelinux.com>
 <20260708213500.1867092-2-marc-olivier.champagne@savoirfairelinux.com>
 <39c805d0-0435-4c27-980b-97a7c2850b87@linaro.org>
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
In-Reply-To: <39c805d0-0435-4c27-980b-97a7c2850b87@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/20/26 14:40, Neil Armstrong wrote:
> On 7/8/26 23:34, Marc-Olivier Champagne wrote:
>> The JD9365DA-H3 uses DSI LPM for command transmissions, make sure
>> this is configured correctly in the DSI mode flags.
>>
>> Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>> Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
>> ---
>>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>> index f6b04de1182e..1ef0c937863a 100644
>> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>> @@ -2950,7 +2950,8 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>>       else
>>           dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
>>                     MIPI_DSI_MODE_VIDEO_BURST |
>> -                  MIPI_DSI_MODE_NO_EOT_PACKET;
>> +                  MIPI_DSI_MODE_NO_EOT_PACKET |
>> +                  MIPI_DSI_MODE_LPM;
>>       dsi->format = desc->format;
>>       dsi->lanes = desc->lanes;
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Thanks,
> Neil

This patch doesn't apply cleanly on drm-misc-next, could you rebase and post a v2 ?

Thanks,
Neil
