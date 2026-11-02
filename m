Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627430;
	b=bV/KE1ql8fSEkR42RhpDY4zckQrIVwcQ+4OUKoai/UJqgVOwMzfBWR9BF0MyJUz5cvuL
	 yGpWR71neT0dO8HcIjJekxhwtaPlPUia+Ip+j7s5CZIUoSmkIYxV0tHQ69pQoH77sWX+u
	 YfZtasUpi5HoEP+Yd/F1uetRd1FWhC9WBA8qhJh9fp760TBQNqMfs7kRGrLvI1fDBP8AY
	 aMzFpjAfE8L58BdiDLZShKxbTVvLgjN1CEPFuyBRs1tnjuw+SJXnhcWxzyVeNurlbxCWB
	 80c5ttY5NI9dBp/IuJrQBVsPxleR25Wv6b+cV/5TD0wtQD01givk2x8kObF7VxyPRXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lYzZ8BXsqKNPCCkmaMclN1iluhESF/luBfx+Wwzl4G8=;
	b=rNFN7ZHhKF2Z/jR77gRUCkl8PxypI4dHJbd9jCtx0XgaDXyMba58iUG6BKpOPL7ae/gH
	 QJ2ooNlZiL9BhJZ2a5V12cDIMRdg25zt91yLb6j7LIgp/N+ysI0h2A8MnyYcy31vMRatW
	 Sfh6XNDJWfMG8HnfDix83J/WTLTC9gtowkVw9wPq55yVZRuaLzkKqL9piBZYVz3n3S6pE
	 XIKOLnRqQ73M8YF0UZqvhN3oomSkYjLKca+x0kuxi4Ki40se2pjhULxS17izp6opDUQsT
	 1pGnh8QH1z9i+yMgKIrYAqNTrt0JuHVE7nealg+m0SFNBgWuXAvk9B5m6Kze0rhBDmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="epvzTT/z";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EA4606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38EA4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=epvzTT/z
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so34780135e9.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627428; x=1794232228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYzZ8BXsqKNPCCkmaMclN1iluhESF/luBfx+Wwzl4G8=;
        b=epvzTT/zGbt599A8IubLmy56EzTz2iT6tzFg+9063WYfcOvCO694oDYbH36bUw5gYM
         mnR/kh3K+sYhWCzK0ZgWGnOed8ZtCsRSDuFNfH+Ng0cBj74AWB61rrA23p0VXxfp2DMt
         umDvT8K94VFrTo8NbhtMcviYyqODdtPEcC24bkcCnHlJkxFTMDL//UbTDNo1F5v5fRql
         Pz79XEiB5a6l6HPWtl1S3g40dKHsnE6i7mDGjqlpd+8ZKLl11visuu4F0UV9DVe4J2Mr
         5KtS0S2CTDpeX+9YWFt2L/bodWLOwYp6+BiSUhYaenDwEll9B6msBPIw4PvYKkLgO3yB
         KawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627428; x=1794232228;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYzZ8BXsqKNPCCkmaMclN1iluhESF/luBfx+Wwzl4G8=;
        b=uL7MUk3tAutzWpNYFSjHlXSf/i7FVVv9odo0iDmASR89v70e1cQKLhadChdApw51fz
         vwvGwNq66F1bsm1NSAR/h1gqHZJHbkt+Qbj2bomuw4m+rfD8fXDTUAIue5DeDd6Nb6sc
         g22WrsDliJ+V4glhp053Ev+wR0LotDvBu8Dff8QqOsFTCokSm36PrX0BcdODxpJLlM87
         GDb+SQZ1QJHL1t9uMpR7FGtdYJQEHV9VqntalFxDwmWCABKo3C3wGOx7d/avOYMGpli8
         qujOsLK+ufxXadTEeTkT0i9+RfdkG2Z3ipmtW3wLFlfqHzPE9CvjMWHENoeegqH20xtS
         45PA==
X-Gm-Message-State: AFq9FYI8lxVLI3spHgltORSVJSyz6XdfpFbsbgdOiYYgDK2LZ/5xh7GE
	HTZocHQHZFKyX/aQGxItkZGaZkDs365NiwDMpLgwwsK8Gh8Cmubl6X1dF4jXiqQucg4=
X-Gm-Gg: AYBFou0eI9wWvH2tN9cNsnwd0uQy+bynTFLHp+FZFR8gAEjmNfES6mJgyHHyzniufRl
	Cw0Ask+ws458AbbFCseHh+n3OT98kZ1yacuoES//8dd+engquOjV8C90lDgcADsi5yCQV/MmxsY
	3u/y8vdEFCMjRBvNkaimSmv5BQDXCwVEB4LlP7L4+mqb1XofgXPkbqsznCOLUbomiUp+UnbuhKc
	m9rvuVfqGb0oO/wX1vAJa4mk2bEY+3RrwWT6p19JCKC0e8swVXMDXg44u2BlYSCZhft47WoiKJu
	tG1jub7sUB5vC7JMOa2h2V3/WTuGCQj6jF3SPlvNNIE1txvDiAbsqHSZMKa1UQcrPp8i4fGOnoE
	RTfDSKqsYy2HC5pAp3wOdzJA8MoNZ2KtpCx+xNWd1KsGebe0ElHjIO+NYSxB30cqLj45P5roiK1
	LLxJXsFvtmBt3d7wV7LVYPfwy1/OJnhLeuB8bE5RqFT0qxk2YXCyNtrHoIyRQeA37isplizT57I
	Ymujig/f1ubb8FVFwvfBywt7G6OqEeD6DQy2DqtD6XuPtEXo3vixaZNbNBhZ575IW1OYVm+ya70
	mSB3NtyFjkjX+FAF4+5RqpxoPu3icYgTWkYuMd8+e6CHWO4EpZGAniOmxfUVh6Iz4runPknPZrV
	QTQU1zg==
X-Received: by 2002:a05:600c:8b0a:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4ac185bc4a1mr235570315e9.27.1793627428483;
        Mon, 02 Nov 2026 05:50:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a5a7sm21252789f8f.37.2026.11.02.05.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:50:25 -0800 (PST)
Message-ID: <7116571a-ef82-4aa3-b7fc-fd7863829c9e@linaro.org>
Date: Mon, 2 Nov 2026 14:50:24 +0100
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
Subject: Re: [PATCH 0/4] drm/panel: ili9881c: add support for Mingjun
 MJ070BI30IA2
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>,
 Han Gao <gaohan@iscas.ac.cn>
References: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
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
In-Reply-To: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/30/26 06:44, Icenowy Zheng wrote:
> Mingjun MJ070BI30IA2 is a LCD panel used by the Lichee Console 4A
> device, with a initialization sequence matching other ILI9881C
> sequences.
> 
> In addition to the normal binding + sequence panel adding part, this
> patchset contains one extra patch trying to address a hardware quirk of
> Lichee Console 4A -- the panel could never be really powered off /
> reseted in hardware (the reset pin isn't wired to the mainboard, and the
> panel is powered with a always-on regulator).
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Icenowy Zheng (4):
>        dt-bindings: vendor-prefixes: add Shenzhen Mingjun Optoelectronics
>        dt-bindings: ili9881c: add compatible string for Mingjun MJ070BI30IA2
>        drm/panel: ilitek-ili9881c: add Mingjun MJ070BI30IA2
>        drm/panel: ilitek-ili9881c: do a soft reset in unprepare callback
> 
>   .../bindings/display/panel/ilitek,ili9881c.yaml    |   1 +
>   .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 226 +++++++++++++++++++++
>   3 files changed, 229 insertions(+)
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> change-id: 20261030-mj070bi30ia2-cd8b24ab77fe
> 
> Best regards,
> --
> Icenowy Zheng <zhengxingda@iscas.ac.cn>

Could you rebase on the lastest drm-misc-next ?

Thanks,
Neil
