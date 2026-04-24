Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6656D298CAF
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024052; cv=none; b=RWsQucyo1PoR15yfcHLlVjBDEhY70gcB0DWIGPn8THokEn6/WqGwJrO+xHf9tKdjxV837iv2OsTFrkfPdWhjYXIDAl6v4AbfY9mg9MlDL/qEoigyy2u8e97ZVGpeIqYBUpJGE1/3ejW2oDsDZeyorVXSHRib08v8NdLyWaIyl4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024052; c=relaxed/simple;
	bh=9r7mDfMvhAeVGI9/OtMtccMrtDzPQz+MyGD9CQhVa/8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Vx2Bnd329NP+1EeM+ViLSpqIl9hekNLLxZXsiQ8UWgpLnyAOshwtaPN7eWMymfoShqy/BOyTTeodw1AwcXNqXzovJ/jAe+TZNS7PQqPUS7kue40dkbrJkvwXS2aeCCl2OZ7cIDonzx/h0swDoYhBAGvCQ7ZtlIjlBC4V91oEH1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k8JggPqM; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8JggPqM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfce3a195so4425382f8f.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024049; x=1777628849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cXOyeqVZTuYmkbP/VNEswETXiZyV/j1DeIymNd6Gck=;
        b=k8JggPqM+k09/Fhg7CNSfXmlfn4DYS+GY4eGn+u9BizDCgAiZRdRGpFBgjkKg0ngLS
         dpmEr8wDPCDCS+9O2I6z10Or68sAY0dJJKyt7CAJPPNR5ULB4rDQyxvNDz3gMESg6E70
         X9FQZ/n4tl26SdeGlFZZM/P0W/L1/HzAZzFAKDUN3TiU/aTTWPYY8PUyWuXMDCi2BKqO
         GQO9VoyoNSqNgilS3/MEn6oGe00qWmuNbT4gL3/13NZcUcbYU18Wb1IqzyhtU0bMhxLR
         kRL9aF73qeh6fOMQc7+DVTQBpW5WydbfwhR1atZ3Mdsufjlze+tNsaOuw0eN4l+lFIja
         uoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024049; x=1777628849;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cXOyeqVZTuYmkbP/VNEswETXiZyV/j1DeIymNd6Gck=;
        b=dnwrw2w9ePyNUvMU5A5ubKrwLIKtLNqmupnb6mABbHauk2m+iB8imJ+80+SV2V8X45
         RfBK8naU6/ddCD0s1wUUelcWaoTzq0qNGK52QtJXUbfhApDBSbW3P9Gij3BfGLjZYFNc
         vjj+yuU8G5S2mVMEBXAb8/wW+y90aHxn6234J6grnucLtlefUVZHxUWELPS+MDxubxh7
         JDD9egnq6YznLBM9UNDfEqHUIUDTqUsWx+Pk8Fv0G9fbnZ93MqLCaugNejxuuulRpKnz
         G0J5QWHqsTkohEK4e362wX6T9qBDCvtfhO5i0hOcDXXtxK6D9Ma1EPYcrZDfOWrfybjD
         mVxA==
X-Forwarded-Encrypted: i=1; AFNElJ/Sdji4Y+kqhEk7Oncs5GgE/OhhVbqic/U674K5MN8FiC5C03eZVCE3k0u1zXqllAw5kV588C8oow4o@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw4oKEpnCRKmwqPvd0VtaaXoshU8FQcRmEe1k3YlRx7AcRiOfj
	qK9u8VyJv5JdOMrF99Pa+Es4Co48Koy/XrUqIslaLYER1nL5zh1F5uho+08iatfV5I0=
X-Gm-Gg: AeBDiesX5tlXISabiVjJQ+CwzMbwsv1BwiA3/9XywJa11SPQPEE/f5x3iW+dg0WZa6Z
	n09FA+puK67bOVnUJV3MtkcZRe0K6ViPLhu2SuFxmuSM3NRivcxPoaOKPX7wqH2+k0LmsHRcomP
	Lhi5ob97WsUBByOuwFjTiY9LMpWPLONKXQi4lx1R3m6+NtOaWHfS+tVQwdwoR082UYID4cRJYFe
	E6QJs5ufVFy+fwxUdIEVHC/sAp0n2Q/S+aw2HesS9wt76CzmZwDV75nWbAfRzhgRSQGXmTEskXP
	9dU1HD2nuFtZBagakGHJmgBrUBS21vd51NDdaex67DLI3eE/rWMJN958LM2/2NEGuLuvebm6MkC
	/DLZ71YLvrd6GL3IQNA6DNhoIg9qKKzqncfwEgIkj4qpOLaOU2QOibGxBpQEmXs9gs3StqwPMMI
	O94yjcyLdpuJLLaDDyAaFPIQJ9SDoUt6XgeZu+NYFgNl93AYCcDth5TkIC14JLAMNAJrytbor72
	WhZxbX3qdVzVQrCNkYR/At7mS4/
X-Received: by 2002:a05:6000:288c:b0:43e:a69b:d804 with SMTP id ffacd0b85a97d-43fe3df26b1mr48732901f8f.29.1777024048585;
        Fri, 24 Apr 2026 02:47:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1176sm60412901f8f.3.2026.04.24.02.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:47:28 -0700 (PDT)
Message-ID: <86adec56-2234-44c0-b165-71fa91b17e96@linaro.org>
Date: Fri, 24 Apr 2026 11:47:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/8] firmware: meson: sm: Thermal calibration read via
 secure monitor
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
 <20260423-add-thermal-t7-vim4-v4-2-d4c1528d5044@aliel.fr>
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
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-2-d4c1528d5044@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/26 18:07, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add SM_THERMAL_CALIB_READ to the secure monitor command enum and
> introduce meson_sm_get_thermal_calib() to allow drivers to retrieve
> thermal sensor calibration data through the firmware interface.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   include/linux/firmware/meson/meson_sm.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 8eaf8922ab020..3ebc2bd9a9760 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -12,6 +12,7 @@ enum {
>   	SM_EFUSE_WRITE,
>   	SM_EFUSE_USER_MAX,
>   	SM_GET_CHIP_ID,
> +	SM_THERMAL_CALIB_READ,
>   	SM_A1_PWRC_SET,
>   	SM_A1_PWRC_GET,
>   };
> @@ -27,5 +28,7 @@ int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
>   		       unsigned int bsize, unsigned int cmd_index, u32 arg0,
>   		       u32 arg1, u32 arg2, u32 arg3, u32 arg4);
>   struct meson_sm_firmware *meson_sm_get(struct device_node *firmware_node);
> +int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32 *trim_info,
> +			       u32 tsensor_id);
>   
>   #endif /* _MESON_SM_FW_H_ */
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
