Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AD73D88E5
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551276; cv=none; b=SDWIVuWQpc/O4vALAkuvqEoVNWnVAijPHOZUyv43KzYD110N9FHalNp/LHlxvpH3eH8GDsj5rWNWbu8JXN9plyQHufB6XAAWJqLTD4MQCn7KGpcBkFOyI3E4NxUy0bUObzwNztA0yw95Ru6XUJWwT1QdB/doyjIIGtfSI1WcS5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551276; c=relaxed/simple;
	bh=PWsVTE4zfjuPyquwLzEQm0v8wFKexjhAFUj8M+cNOWU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DCocli+q3Md2vr8AB5edJ+N+ISOO4101ZBVbH+mgLG7yktVCTjcq8CSif9NdVQnG6+aucwjOHegGAlAbgowW3wveLmZZRLm5HlTd39gZW/NgedPHvl+9TveCUtLB/rV7bJKzAr0Rytbsyj6lbVb+HxeF5+P8cJBnLYUVrsKKOOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AWuZ5q+Q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AWuZ5q+Q"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954afac04bso25804745e9.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784551273; x=1785156073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=02PeqF3rbp1hsOzW2e5ny6E3Yj+EmyQ/4DKajWJOxPY=;
        b=AWuZ5q+Qlu/4PZdA0Uteo2ar+N9Fk+kwwJ/6qYwS7Zd3gPy8UX1z3s4JVUuFehldvj
         YizqAhXCo2/xTCZLUIX0HVfFVIylAYvLfnteQzUCpTP/n6KoKa1QyVk6ECyoWrISIZxa
         Oz4RexENrjooiDln0++FcbB1AX2PmvQf3oQcQITQicZBeYVo+sc2bFWIx1NH89U40Xkv
         Jjnx8dOt16FAP5L3CFn3X2TkNyPghwn2KgZjDV0pKntkt3sp3s06a7Fll21UucRt6215
         13NhE0KFXmFIaC9lzAv3cBvNvBchMnyFfJpkB1uV39yJeUYGRO6quCqiTekgHNgmgDHx
         jKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784551273; x=1785156073;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=02PeqF3rbp1hsOzW2e5ny6E3Yj+EmyQ/4DKajWJOxPY=;
        b=eKLM5HtNb0L+3TJrfP6wi59j0HTD0JAK1wMZ9f7Ekw4Qyz57PMNXnbdpwBw4VVLTlo
         VOMx06F/2boT5n8ZnhEDqjiCh+7wrmhinrezVFnpbuXhscXRe4sUQrZ4hi+D1cM9oVN2
         s8TFdOZSoVHnhcW3QQxGiDAuKkOggTYlCi2DKv40C3vOc8TdkLfxAs7FRNnUAZJOHwKD
         XHCj7E8XjOmWFUmg+wnqHHavOMV4bvYsjziF63LajD5qD0d+z4kvFgxY9yZ19o1Hnn5G
         +oLlwG/pUexeZPm536BB7zA6cB/nOQHt4qqhe54Qf5ViAl88U7ibmAVy5BFkmyRu+YQZ
         eF5w==
X-Forwarded-Encrypted: i=1; AHgh+RpztY8YB0nlUwsNI4smw+fb2e+EAQ23yRcR1U3HubaVWSg5FF275AA2PzmnArmIBNumFYRtLb837anK@vger.kernel.org
X-Gm-Message-State: AOJu0YxKjQbLfRWQZ4ojKtzlAuaUZ4BBskevwPuAHUdtVhqAiOxGEPjI
	W6y1wBCnXmzptoIEMcCOsr65TWqGu0CvJVN1xygEpXSuzBobmWxpBHvMfuxHn7nN1X4=
X-Gm-Gg: AfdE7ckFIg6NOBAsiHGOJ6/+6HxJqQP6s/sxDhW+mjJgEkt7veQ5Qo8YxPgXZvLnc3+
	wl4WoFJCh0Ga0ISfHP4yl2U1BUC6bv0U20mLHKPHZSSYo/o9KYZxwC+ddXy/1oULSRK8v/cbFH4
	i/IY+J2QdnmLpm3dvN3rC47dm1UEL5/Eh00/w9lLlkfdgzX/4xBSsvBufqfOOyH2EFO2xFU9254
	uHDbuJOekNN7agFCUzjUQEZrUjoGV29HzX7yoyPUf6UOdXriD8ma+dl1h3ElsnDWZ9oBBYfmpIL
	Hf2WBoa3QxZzZOdXeuwON2S+tqdsAGVXlPYmvFdvTOEYjh+H7qsAhhihceCbAm/NDnfST+ukZey
	sRxnHfPJAcggFiWwP491TfjIvJD46KkNz+HxsTmERfwKoHTEIudlI06j+lCf3A0kZf7Km9yLB7l
	fH8MOMvzPQZibdarohGYGtq6ylTD8wPHf3o2UHEhySGnSMTLDWZyGoGikkH+Me5vUNexq5
X-Received: by 2002:a05:600c:6a0b:b0:493:c453:6002 with SMTP id 5b1f17b1804b1-4954a516453mr90764735e9.35.1784551272978;
        Mon, 20 Jul 2026 05:41:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:544a:2852:f257:ebc5? ([2a01:e0a:106d:1080:544a:2852:f257:ebc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a36312sm300850935e9.2.2026.07.20.05.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 05:41:12 -0700 (PDT)
Message-ID: <7b7e6b86-e14f-4d84-89b8-73e689c00ab6@linaro.org>
Date: Mon, 20 Jul 2026 14:41:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/5] drm: panel: jd9365da: Add prepare_prev_first flag to
 drm_panel
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
 <20260708213500.1867092-3-marc-olivier.champagne@savoirfairelinux.com>
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
In-Reply-To: <20260708213500.1867092-3-marc-olivier.champagne@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 23:34, Marc-Olivier Champagne wrote:
> The DSI host must be enabled for the panel to be initialized in
> prepare(). Set the prepare_prev_first flag to guarantee this.
> This fixes the panel operation on Renesas RZ/G2LC SoC DSI host.
> 
> Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 1ef0c937863a..a79dc8f8d5af 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -2993,6 +2993,8 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vccio),
>   				"failed to get vccio regulator\n");
>   
> +	jadard->panel.prepare_prev_first = true;
> +
>   	ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
>   	if (ret < 0)
>   		return dev_err_probe(dev, ret, "failed to get orientation\n");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
