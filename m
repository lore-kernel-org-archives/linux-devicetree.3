Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5DF486623
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256294; cv=none; b=ogzV4OEyWVkT7z7RoC3ot7J2dDASS4zUHNGoq39RY6aEY714nq7TXm4b+Ow2PcSSSv8xh5tE0rv4MCG7zMGT6B2dXhGOc4TjAvioPT925Da3U5VtqpoQyi2ykrf6qCzPADI1knB7fl+K/ZrNJOMO099JNLzXaD6zpFKC6cwjQRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256294; c=relaxed/simple;
	bh=muoWNoHX3fssJg0zq0lI4V174aDyR3uc8zoA3RzoEdQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cjQ69ZZCZhbmKUijkX29Cso7XPKSROwE2+hWzWMi2WK+7Eo/HmS5evMXA3tEPP20P+wHHpVDzj0Xin2/fpmWk6H+aWi70K4ItK/S6BCPcCOKZ9Uxqlyt7wnStLxvedoGF/Flwz1PcN+BN3jlW/okBYhM7o64PqwwmG0/n1l1q/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V71OM+4k; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V71OM+4k"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so14314845e9.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256287; x=1790861087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpEBMkeydz8CmhOZ6U5BSNu3mfpAMZA4ZhmbrftMEAM=;
        b=V71OM+4ktZNnwKRr9HvfJNfn2rLNnrkSpVFE39yoraTRjGgPx5R09VChLUzyFJqinW
         y4OUk2QkBpG7ViQ0O4n67kXLpdTuPRT/T73FVhvWB4/J31P8uWeGwezd6DzN651CJX+f
         /OwAv6JsUV4BLToq3QW5FUzOhMjl0AJ4BlqYZ3zNLq2acj+r3vcQKHrvTOVLFtN0DAq0
         1qs5opU3LzG8r8qeFGni26KGTCcBGOltf0Uag1Nc8whWP7HJ/9pd5pXnz2yLYOqdoCoe
         LBh+z5lcEJ1N06Wa2OlNTZIGUecR83kkSmC94eE7OaZuKGjT+vvW8NY8L9DoEcXEhfpk
         U+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256287; x=1790861087;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpEBMkeydz8CmhOZ6U5BSNu3mfpAMZA4ZhmbrftMEAM=;
        b=H3OQiFhFVwVV8NCXlBBwZfxXyTiTUVX6aL0G5UmUFYv61DZToZJDHol9/qGdOFmfFj
         T39L0FUphZrYTDellRv/A0pTmkYmd3MO+zThLQWLVT2eMSxItCGQSyBu2xJG3kzhGy1/
         2eMl/+SDTVbhIPxm4+aPdJNoehKdeeWbsRTIyvkUTC5JgWQwZNAAV0bGc9Sb/QbQEn8A
         OkNB6ufvXGMHaB+e/yF5MzHZbKqI3wBbITPUG3d4DcR685x1ixvhLoW6fe882y5rWLd8
         9xb/fClZjjXNF1Ql1AmqDC3iroNmHU4nLu50dZkoINvhZ+JM6Rl0kdIGkj+sDmJQ4QCY
         wNJQ==
X-Forwarded-Encrypted: i=1; AKwUvBziOpilHWLS/KfxkF6+4z+R82ZgtPZ2FwVJcHsr1pzOqUrmJ59lZ8HYcf3KatT5n08czGzdQ7WDIEBC@vger.kernel.org
X-Gm-Message-State: AFuF++lpvo1R/jASDc6x+lVdqclxSGs5Dgi5Fl35VP3sHTzGlsh2tdrj
	Rl3Aq/oA4yVoB95mUW84Mzbgl7hxPqKAx8I5p667kZVZRM3py/w4f1wv61mnSaIqUOE=
X-Gm-Gg: AYBFou0ilE+r3P4lzzew2W0L7UZNcc60qZARdPxbhHmYXuX59Ns2+jxLC9gcl2JMnOp
	3rFMveYLwJzEzlZ0bSeqRXuKF9rmrQsUipLwa4VUW5xTNbYbsMHuapijuxe5nW7BXKt6H8zOJvc
	kwGn/o0AlIy8/SDxiWR593JDxsXliLi/tC3ifcaD3eU7cf2YUxk0VB3qxujEp9tdpEgneZ8ZdKW
	mLp9aIvzJcDtDZ7ZpX9zqHw5gKF95vGwJ/yGICF+/60MSJ50LMn7NJvUR9a/aos25O7F941NgCr
	NszJ3iu+X9SryWxyJfkZWgwyoVyBBrSsyTQWk5WYPkzpOEI0Wgsdp9yjUu2ZcPCTsCnK1LhR28V
	TczXjJC426XH3ufymWvma6p39l8unK2LNRQFS+E/MxMmUu+/co5WG/uzT3t9ZbiRaj6hU7vrzAR
	VVC0QbqMRvCUAIN5PjJyWcrVb5JqG5md/TPVWUYUF/ooFzk89ci4J1bQLFcHkEqFYiSgkEPY6qw
	72ZhTE/mjc+u8rrHjwBWDNxLE/lnH77XdY7OeXmSvN8DVzLkb8qII2HWQLyG5i6
X-Received: by 2002:a05:600c:8b74:b0:49c:fc6e:a3d7 with SMTP id 5b1f17b1804b1-49fe66e87damr41701145e9.22.1790256287127;
        Thu, 24 Sep 2026 06:24:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b47da1sm72841405e9.0.2026.09.24.06.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:24:46 -0700 (PDT)
Message-ID: <2f3d939e-8de6-45f2-92ff-4aeae4d9af54@linaro.org>
Date: Thu, 24 Sep 2026 15:24:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 03/11] drm/panel: s6e3ha8: Really assert reset on the
 failure
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, stable@vger.kernel.org
References: <20260920-crosshatch-panel-v1-0-de6e9512da96@ixit.cz>
 <20260920-crosshatch-panel-v1-3-de6e9512da96@ixit.cz>
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
In-Reply-To: <20260920-crosshatch-panel-v1-3-de6e9512da96@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 13:05, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Due to incorrect implementation 0 == asserted, thus when driver fails it
> needs to assert reset.
> 
> Minimal fix for stable; the polarity convention is corrected properly
> later in this series.
> 
> Fixes: 779679d3c1640 ("drm/panel: Add support for S6E3HA8 panel driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> index 078523df48860..835121b322f4a 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -179,17 +179,17 @@ static int s6e3ha8_amb577px01_wqhd_prepare(struct drm_panel *panel)
>   	ret = regulator_bulk_enable(ARRAY_SIZE(s6e3ha8_supplies), priv->supplies);
>   	if (ret < 0)
>   		return ret;
>   	mipi_dsi_msleep(&ctx, 120);
>   	s6e3ha8_amb577px01_wqhd_reset(priv);
>   
>   	ret = s6e3ha8_amb577px01_wqhd_on(priv);
>   	if (ret < 0) {
> -		gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +		gpiod_set_value_cansleep(priv->reset_gpio, 0);
>   		goto err;
>   	}
>   
>   	drm_dsc_pps_payload_pack(&pps, &priv->dsc);
>   
>   	samsung_dsi_test_key_on_lvl1(&ctx);
>   	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
>   	samsung_dsi_test_key_off_lvl1(&ctx);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
