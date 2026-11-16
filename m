Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823217;
	b=aeG3RcxDsjR0nmrG7aPcB3Y8eytz1MQpe6OT92P595PjpXkQ1/Y/fwpSwVdEgIrscn89
	 1iE5u8VtrlI2vgnkezDU0PLbUi4Fqo0Yqpeg9TY8yIoI3phEEmDFhPgiKdeKf1XwFHYhz
	 8PhNZtldVLMFxMTBWnXkblvZw5IYMdg2AOnRfoN2C/QZdbhUb7nDV1kYm3cS/TNJtojK4
	 mpUxyL2y9Q5nqm4ZNWWW9n07Ki/zG0r/CfbGCuTAfxJ9IbEnVNcgwS2pgPl+ojsm4t3Ku
	 2Mv+t74IZD8t3FG2lXdwYodyHFkDpxnvN5mVuMeOpFgZvz915tOgRlWdwJETRCeUnpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mS0n0VCms4eHAxEd2Xq6Bm0DUZuN+p1NF5Q118cCuJU=;
	b=fyqrHZRAu0mJHLajpQNkap08qatYr+/hkf+buqxEtV4zIgOrmq22FSOOOPwPJyHRPJZz
	 kxe0XXF/fp0mAa6rqbCu8ov3SC+XUAvNOph5d/LBuSkEsvlpF76nbSlw7tYT4rn1jrndw
	 N8XsUQ77UjMbImmPSRaaM6RgF6txeEIn5JY0sV+bFuF5OVqn7p8EeVENnhdDT6EbgO+D6
	 HJiati6ryTtcfcDBqGnpbkdBJoOAZHmh5yppl6NYu0oG55m7Ny2Up9Maal1ZPKCbHaphz
	 HR8K3gTYqPKCgSMtC9Ln0+uvN8DCNI3OTf4IgwDs9CKZ3F7jYfq4FciMJ+OQP5kXscQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vEimE56H;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3D2606A332
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D3D2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vEimE56H
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso10186125e9.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794823214; x=1795428014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mS0n0VCms4eHAxEd2Xq6Bm0DUZuN+p1NF5Q118cCuJU=;
        b=vEimE56H43Jg55t7HgEB/LzIS/rLakfMKe/pp0cuoCTuDwuPtYYUg4Mtvvh6nja5Fy
         TkNa3lt5+UyT643R4VzR2wBPKBUelTxRkfcWMtdAl8SGUujuqWVA6tHq0H39p98mM51x
         FEOtn3lBVqR+0qtSKDsSc8OGeXZE00fbpoGSJ9KD/Dxw7kCipkV3xlPSUNMOWPqEHJId
         ugUxulcTrtVMfugXrNv3CTh8rSqPfOpaCezGWvAur02ITF6g6iNaNPvDfx1y7ca4sTtW
         KgM8D4NdMsSdEhb95kYQ1VJX8VqLDJupoCQxikYEENQNeQ6qyeLb38svOTc9IwAV6IdP
         Rzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823214; x=1795428014;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mS0n0VCms4eHAxEd2Xq6Bm0DUZuN+p1NF5Q118cCuJU=;
        b=sphur5ASo94zwD/Xr60YKjEYc/0JSqD5Cov49jtF55F9IhYv8+kY/Z5mqVpPi+YJKC
         8S2F8uzFv9skg/8V2sPaRjN5nJcnWRBb1aEea62qFoarEi2TMkhm3u48taZqAHxOnmNV
         h9W5ffyzzObh2wqMyf9Ny8eChYSlDvVJN+3Yks+wA1jM256yLu0G3ENMEPiSlgvX/zMq
         97sIjRjr1xcOwmPYJhrWhVM9a02c1l47vQPIXMkUmhcqOuKxUSBBOEwTG4t/tPowManp
         kwGBebHDDkgPR9AdiQaW7QIvpWm4Latv7LI+nfHVSsKvK0UrZYr0yP2CHE/JK3ERyWli
         OuqQ==
X-Forwarded-Encrypted: i=1; AL+hErFoOtIygQ2NPYxtgA+TkG+yij3qxkDELOkyGtz05C6Mqvuhn4XUclAfnlbIIoc30s3kPohl4+dxERW4@vger.kernel.org
X-Gm-Message-State: APuU4Z8cCaeTUxGCyY7YDOELYaFwI96SXR3LOjsJpOEBBTw8+WqFQjzy
	9+4ZZqBPKMim8bpR89icfqIw1AwlohsJuh3s2W2e+fExUBa1qfIdlsOldPvaVYS8rpM=
X-Gm-Gg: AYBFou0acidVioS6A3MKJxzndKlrA8kYF1pqyceiImxLdtd/Zag/nhWXegXXIk0MLmv
	mttoop6MWnHNJn1WAePsKo4PUL09Mbok2jgkXF6BueOilCxgkGFNHCc0lBaHHQn5d2ky2Gce5o8
	f5T8Sz/dMYxhC9Cu4lcuG5SGGbKkcCdbq14KBARwtxaRKTc6aN0x3TXHg+BKMBOSH/IMay3asD/
	731w597nh8Hvlm3SkLp9NwaWUkTNvxnTH6cmJzsOaZKRyj7ezxuOqWlaljvJ1AG1sTfGdsVsujm
	KtFgd2zsyDrJJjy8xpTa5ZZSEBccU/BezXbiDgAZbnviEplSJvTdiyye/mOK2bIHMHwWlA0nnr0
	SJunfyp6IS5YB48crYnhJ0B8S8zivUV9BHqp1uj3320tryqVSZ+6riCYuK+DBRq2Nq2bkmdJ35L
	MT9wYc06Oa4PDr1ANCOJ1XPbDYFmnfNNgV12uETw/gUFS7Ca0avE8ZgIC/mm8DEX8xH9g4M+K3e
	8ZmQedwiPY5S4Nu6als5uKZy6L1aAotV+K/qCL2PV61R6+Uua/AgJ3PjSpNBsvDRlgftv7ugpVz
	iebax1y/NVz3KmM94pJ7e9botaDzAmcDDH1WZkDgFpKXsWHIevsMqY+3LIQ4ZyGqh/7MA6SUlUv
	s0iLFlqoQ
X-Received: by 2002:a05:600c:3b16:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb55a6116bmr218070545e9.4.1794823213643;
        Mon, 16 Nov 2026 02:00:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28c882sm375110715e9.6.2026.11.16.02.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:13 -0800 (PST)
Message-ID: <c458eba8-553e-4c5d-a280-918bec25b041@linaro.org>
Date: Mon, 16 Nov 2026 11:00:12 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v12 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
To: zhentao.guo@amlogic.com, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
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
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 07:26, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
> 
> Add SM_LOAD_VIDEO_FW to the secure monitor command enum
> to allow decoder drivers to load firmware through the meson_sm
> interface.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>   include/linux/firmware/meson/meson_sm.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 3ebc2bd9a976..3b90b49d0552 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -15,6 +15,7 @@ enum {
>   	SM_THERMAL_CALIB_READ,
>   	SM_A1_PWRC_SET,
>   	SM_A1_PWRC_GET,
> +	SM_LOAD_VIDEO_FW,
>   };
>   
>   struct meson_sm_firmware;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
