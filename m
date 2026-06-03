Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1417390C81
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 16:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780503924; cv=none; b=ZE8d3bHP1BHb6j7aPM3odxVzpeC0wE/XaJv0SqBwwBE9+sb81FpxOFpPGim+48OkUhGS+JOKaFX+6hWan7r6ybuPsvu0PGqs9QxNQoj0tnaSpgyzgNgt7SzgH0NgKvkXx02tN+V+U3OdyH7sq1K3dICu0Mbv80V2Ccn0x3fctms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780503924; c=relaxed/simple;
	bh=h6yulnlXD2K1xjYb7avT/n8AOeOyRs+/dV16ltpy+sw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BC8zVPHZkXIrkdxeb4/6jVIMb7XlJA8bbD6un1Umx0SE40510dkjMLu8QrkJD4hBFFOR71okshrWPfSoFvabAJDxa+NmI+05+T43oqEFl/bJeSkXvIishTYiG6yiebo0zUtbWoisPHv0g2Y5PGdimw1AB8J0ve23xNNSqJbn2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QspUSyn1; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QspUSyn1"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39677c80386so46148831fa.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 09:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780503921; x=1781108721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bFE4+s9zgaljDPO1AWoluZ0vX4iTVWOm+qf5IujDVo=;
        b=QspUSyn1y3NkUQZLFo3iXJssp37nmp0jvx1UpPrU3A1iuoz1sRHwbQuU/hOdd5li8g
         yOQs2V+ONNphXBPDgQpNeUsk86s8mygz9liNW0hzuhyk0wEyXZJqx+u5tfk+xBnDsZPd
         peGgc+qpJXcAvCp2alovJc9TeOUTDZBtYbFKU7Id0ZSR67i6JUaEzc+iupWEPbYb1yMh
         Cgj3woFsDarDq7gwLzRtc324Ys75mI6sXDR7o6IIf/ru3ldwMgzrQ6XyAsY6DSoEAfSt
         JdaHaO6231wYUmKtA/mRoz0tbG+B3/DzKxbtXALvl9JtlcdKT6TL4qAyaW93nb3vOBMd
         KgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780503921; x=1781108721;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bFE4+s9zgaljDPO1AWoluZ0vX4iTVWOm+qf5IujDVo=;
        b=eZ04z/z7d1aCvNFa3eXu41EQqSFZLtvWIQblfF9qL52FWBUC+0hz+/jOCk6O1SwN6v
         kAksT0nXim7f9/coNhGavhj9oeeeYKN4lfpbiaGMA23scaZEmd8QJsigLbN6QhvA//Yg
         xxLcUdGUGWI1cXi7PDhD00eYROM3FcadCCF3HUqg+0Bexj13uJLO+9Hixhg82l9VJFeu
         tA8v3ZVjqMhpNXlMpwRJJ6dUoxvieJGPW03DjhKohClw1gGZkFt5bQUK1cp+ASTcJPWf
         4uhxaQQlHTTZEyihBwbxSyvp6/4RaLUQe2MtS8Mu21Byapb4OEtwRyWAJa20OdZSd1l+
         AJwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/i7o/kQ1kOSMgVZ/z37UH6NrDO2PlS8Na/yekkayGrHSUfn21qxDlEC93PBwHgnwBDAqfCRFm/p0ct@vger.kernel.org
X-Gm-Message-State: AOJu0YyV2rAKEYq0oLL3/CR5uZqUWcvBtxFqaf86uiA48u9Q90MS71cc
	DaT1jfIXDf11GEp6Pj3boViLW5HIrnu5xZ2ovR6/xQFYZo6HDx5DTf/vZT+ig+o6VLU=
X-Gm-Gg: Acq92OEQI0viJPsi7a3MulxKvWdTmAgGJoXEWW0mQaNLUSAuI2k8Ds45dihLcu9z1mT
	qPdr7g6HGp4Fj54bRk6tVqMU4cLyaPD8jBFRuyanTQnWHBskvgNbcApgAiOXydZqBABN9VLQGzo
	g35cFkfXsXiH7qA+WkHpEMYJu9jEuAbr/llGbqGMeLX4O//LwNFo2gYhmebaeQODhGwJGOKcTRi
	OinvZNHu57c7JhA+biEuvOZE6/spmDn0I74qyyXmFQ6pP4TsrgXgM8XUwOFJ6XXHxukqiWqNXEg
	Dr/EqLfyKa3d9clYHYipOWCcPx2A0YaMpreWlqAMy677MadQjzmar1+MxXlzB+0xBs5OWuAZL4g
	53vcHM+fE1ftH9UrD5HWwz8nx5iiZPV0gzgab7QvWlQYhGiL0G/8tfEgX2nYWsvyGrwK7iqslfL
	0LKjx0+KhbimFDqTLXA0003phOJwRBHjrms/FP0yPVi4KEjqKYitHr6NfeRq0IsZlJZOnOQwVeP
	nfIFMb19RDIKtcnQkLcwZ21kf/j
X-Received: by 2002:a05:651c:244:b0:38d:e220:8dc2 with SMTP id 38308e7fff4ca-396af476a70mr12594011fa.20.1780503920820;
        Wed, 03 Jun 2026 09:25:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:a2a0:317e:910e:9ac9? ([2a01:e0a:106d:1080:a2a0:317e:910e:9ac9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be1a3sm10048021fa.20.2026.06.03.09.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 09:25:20 -0700 (PDT)
Message-ID: <bf6155fa-1bf6-45d6-affe-1c8baa3561ba@linaro.org>
Date: Wed, 3 Jun 2026 18:25:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Document BOE
 BF068MWM-TD0
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260603-asteroids-panel-support-v1-0-109c6ac81c8f@pm.me>
 <20260603-asteroids-panel-support-v1-1-109c6ac81c8f@pm.me>
 <4a7c19a3-bb00-4a68-beea-146ef65f9e5c@linaro.org>
 <ALMSs_2ssEuRgFGXhTUpuP022Q2bMpEn0F-QqFgw4PYn8RkcSWGh0e7_lL3XZy1MQpViwpnMj_98Mi8lTP6A3UsRAYi8XuZWdqIAFVT2dq4=@pm.me>
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
In-Reply-To: <ALMSs_2ssEuRgFGXhTUpuP022Q2bMpEn0F-QqFgw4PYn8RkcSWGh0e7_lL3XZy1MQpViwpnMj_98Mi8lTP6A3UsRAYi8XuZWdqIAFVT2dq4=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/26 16:01, Alexander Koskovich wrote:
> On Wednesday, June 3rd, 2026 at 9:58 AM, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> On 6/3/26 15:03, Alexander Koskovich wrote:
>>> +description:
>>> +  This is a 6.77" AMOLED video mode display panel on a MIPI-DSI 4-lane
>>> +  interface.
>>> +
>>> +  The panel also requires ELVDD/ELVSS/ELAVDD rails but these are
>>> +  internally managed by the panel via EL_ON1 (ELAVDD) and EL_ON2
>>> +  (ELVDD/ELVSS) control signals, they are not managed by the platform.
>>> +
>>> +  The driver IC for this panel assembly is an RM69220.
>>
>> If you know the DDIC, please switch to bindings & driver around the RM69220 DDIC
>> instead.
> 
> Question about this, isn't the DDIC kind of generic? E.g. another panel
> assembly with RM69220 cannot use this driver if the actual panel assembly
> is different.

The goal is to be able to support DDICs directly in order to support panels on top,
so just rename it to the DDIC name and add the DDIC as fallback in the compatibles.

We usually don't know the DDIC, but when it's known let's use the info.

No need to add panel selection logic now.

Neil

> 
> Thanks,
> Alex

