Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421201;
	b=iBZyKQBbqP04eJWnPQvoEFJ7r3PAJV9pxgZKO1oGcYqGXRzlsi6c10OmKcfpv7uDair5
	 abGzA1XoBMr3ExwWPWLN0HxkSArD4qZ+pyAjhPV0QHpKng7J5zSgHGqjfqj35keIxfXoh
	 uBaqjvtMGkuwHaSuYVDiqq0h1+giTPbHqjAZ7PpR6Ol/pA4yx6pgRG82Rb91k6Jy2A9/i
	 VSoyq1JWVW3YtPsiVCjbKIpiKOzTdFJTOorFwrVtyZRbRq/+LDW6wW8Zd9BqOPePYSIlg
	 HX3efeKl8WnWZI9gZCgh/XqMfiiLLo+TYzYnOkHO25dM5xzEy42etTEJUW2aAWpc7HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0/cAHzp2byEXTdt5JI13O+MKxbnMcLe/w5DVxG6Ogbo=;
	b=QJMRT+4C1KOV5UlHWCknBljutkICDNSpum1CMlZH8XpI2svxvMW30g4ESVoFeWzu/ZZw
	 RrDrSxPGSWJLTcxZrjlwNrDI5G9R36gg+AfJcxhst4AlDnft0nQgKmAtXMi8j7M7mtOwb
	 vL+h2VcmF4s9w56ztMMK8ptVNOpCTBHRc9o4VeL+CLMiw51xXjTCm3Lzp27TldG8MrLhY
	 rl3IeUy1Ds78RQ7HCl8cJ8gu+QVvJ22x3cwlu0zDuz7N5ll3Lzo2sZwKfR461LJ62ruPE
	 NHDb+8D+kX2x/gOwChf0suaowJ2Ljq4qxMXcBQVpE+q4K/dy14a+o6kvZhFzouW5wlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZNoCKPBK;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF90C607150C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF90C607150C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZNoCKPBK
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so28213365e9.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 00:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795421199; x=1796025999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/cAHzp2byEXTdt5JI13O+MKxbnMcLe/w5DVxG6Ogbo=;
        b=ZNoCKPBKLNYVEwK4PLcLyTem/bym0LqTMMFC2lWOCPl/g1UXmVYO2kxGbP+IxcgsmR
         FbVKDq6zlgwIZpuTQBbm9enVQIGZ5zBvGbwQgUnm0rBjOUyFuJMeNuL443IydwzIljp8
         M39vILJjR2Paab+zccc9QR8P6BcfSwHxAiOdtuvXH68A/q1H0OoLmxsurh8XbmOZITzv
         LqvC4Hgl+OXiwkdw+fpYo3znqoZNBfwgYYQEpCKiyX0kBZ5kL8l83IgyjcksjC+0E6rX
         H3rQ7PVOZ2p0Vq3RoWz8qjWrOYbrW2cMNN8K4ugbOfHC/widx9/k4OKmg9iXgT/yUd0k
         rE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421199; x=1796025999;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/cAHzp2byEXTdt5JI13O+MKxbnMcLe/w5DVxG6Ogbo=;
        b=CQhIqT1FeYwPizfb+hKSEU1L/HQBh78vQMKQ4eiNsVL2XAIzR2DmT+s7AYTixZRjqM
         XoSbToV0vMd74zWXlSEcNvaNpWVxdlwqyU+zrnYLdc8HRU/rCzHqDprbpHGLesWgbgbX
         boF1FiykmigoVYeEpNJVw+3wj8inTvuYSQlW/SimT9HcVJpWMks+L2XQiDJOW/vmRvq4
         VNgDYjeUAEi/TXlXbp+v4jJEv3Vld3xzm8BOQE0hb2/xBTEIQh80xaTH3CWtGPtMn8Ww
         ZkZAIUFxJdC86PoL/yFZptxVFb6Zxu+SxKVwt8NQwb+iiMwqGMGGdAPCX51q5hNDMQVM
         dO1A==
X-Gm-Message-State: APuU4Z+jXghkmdeWngsNW916LSE9GNZfh1z72biwa8zKmNENQAWLrnMf
	rsMq34xLHHVUOwyuezoT3QyXs2Qo+4tN1gwlvsQSSe10qDDRy5QkUxlgKonSswiRY18=
X-Gm-Gg: AZFdTZeTPZWfH9s/M1tlm7qK8s83f3d+/jV8UoECBZsaDFyo9hW0iYRgP0XEWYzmKbE
	TE3M7ZMQZG7f3azQbIAGXjMmcu2QfxEinb7DqvKtQjW397/OFxmy9/H23/aqw4Q3L+vAF6OpB01
	n1gm+5o5M64GvzA5AYxvvF8Ro06XGvZmJIcUgm8QxnCdXm+sGDMfJTeEJA7sAX86RJniNAxqgYk
	tXCLNNNfSO9jWixA9jcwwlsaGtnoCu5byoch6yM489SK9T15vWyi4Ll3GuIBDKbKyrFRc9zg9yG
	gncvXdcM1F8kICbrNsGG2k16FVR3R83ZW9+XSew++gb0e/R1LxordLUwnUPcXbOZMxijVmRv8oT
	2Gu5hdB7/ppIHzfjAsxjuKYTnVYGYhi2pwIHpvP+sL/38B04HsFpERIoyckx0B/WxtBZXIwHncc
	+lYDa8Hnc69ODc7TanQbhKZ1iSDK+Z7be1DLnE4XrPAp32oPmg2crapuLPC5SDSZNwdziEiWBDI
	G9LfJB3vZjR+qdIFUK5igDQjCAmTy1ZQVEUm002pOZZRxP1OJg5wHRJsrJG/Ca0Xf/ANRR1XSIl
	vruGTCAOpoU6R977tVZGBfSr84uYRqZFsO3gdazLr9+jhINfgw2eyZqqpPksKApMeGyxYgyLaO8
	w9QJugxAB
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr161630505e9.10.1795421199031;
        Mon, 23 Nov 2026 00:06:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:121b:474b:8d1f:a239? ([2a01:e0a:106d:1080:121b:474b:8d1f:a239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm360424565e9.8.2026.11.23.00.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 00:06:38 -0800 (PST)
Message-ID: <2d8dd4ba-26ec-4b01-8361-09e6dfcfa5ed@linaro.org>
Date: Mon, 23 Nov 2026 09:06:38 +0100
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 02/11] dt-bindings: phy: amlogic: Add Meson HDMI TX PHY
 binding
To: sashiko-reviews@lists.linux.dev,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
 <20261121-meson-drm-create-hdmitx-phy-v3-2-f8f471788076@aliel.fr>
 <sashiko-outbox-227302@kernel.org>
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
In-Reply-To: <sashiko-outbox-227302@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 20:26, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: phy: amlogic: redundant word binding in commit
>    subject
> --
> 
> commit fbd4563b5cd10db3f75db052197f808e3b36bc55
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
> 
> This commit adds a Device Tree binding schema for the HDMI TX PHY found on
> Amlogic Meson GXBB, GXL, and G12A SoCs.
> 
>> dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
> 
> [Severity: Low]
> The dt-bindings: prefix already indicates that this patch adds a binding,
> so repeating "binding" at the end of the subject is redundant ("dt-bindings:
> phy: amlogic: Add Meson HDMI TX PHY").
> 

Use the "dt-bindings: phy: amlogic: document the Amlogic Meson HDMI TX PHY"
