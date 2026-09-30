Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF3B4E325F
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775510; cv=none; b=etESvVU2A/cI9JXCg6zT+3Cam2E5upJM8Nob7nEDi23HmE+8Ou6YSZ0PTDA5eB4kvdqX/c8uJp0OBuRQ4Z6Oep2rG2VlkX9NX1gbA97OVZMr68AUaoBhUJ/nr1nzin4GFBclEilLH2RsJV1yHI85M/ljT01nICVPNS9JYhL3e7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775510; c=relaxed/simple;
	bh=X7la+HH1GjnjdSVfPyWqCoHRCQIBLR7gK6AUVRnTe4s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GIdY26HveP2Bsp7gD7d0WA73FZcpcP0upkkMGwLdKzS6Re5OVp4CsHu5vcpZF6w8Dc/8+k7mOhcV+LzKipmezMCyuNZsMOMAuxbNL9z+NEkgn51mFtHWIJ4LOFn1p3C1I/G9dxsCUoLSF5dMUNzwKNBGoPfjZYA7GKHTTGxtbMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BWFvwu+m; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BWFvwu+m"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso1845305e87.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790775488; x=1791380288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZB4UkUo4DToHt4/+zjrF9qsPrLf22VKvL6EK3fyUl0=;
        b=BWFvwu+mA48XlR4q6NoXFkwjjaRaW5oOO+p8JNB2H0TmOxdaRGb4UmeTJxJZ/XnXgs
         WywuK4ORCOEeiIxEln9i930lksOUR9FAMM4iCudCWSOia74zQHiVLyjAo04w4b8PEEc/
         BE6uHjom5gX4m7Mi6Bplb1Tu8wGmeICjUTLD4xu3RIR+FN6gc9oHy73X9E50vNyNPDf7
         smSWwZ27CsZ/uwTCMv5sRE3NpgO5X+2M/OfmZzlqmMZdXiihd/PPJE+8PKu39A670iem
         qoK+tmkDM4zAUmNrYtYwakJiMdrn7dl+WngINleWdLArvoAFUsVDCc9dHYrTtZp5wzkA
         SIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775488; x=1791380288;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZB4UkUo4DToHt4/+zjrF9qsPrLf22VKvL6EK3fyUl0=;
        b=CmzkdA60isd8kk4zzATbbuVe2Qmy2l01OG8KMLZ7w6GtQEyPIvtkB1JQJPgeegxPuk
         rf9O77yWlQi0fcWP1/ZWGeEphIVsxQpKxFgNkg3A9bTOshGnGsQBEAxGoj+ipaO1HU69
         CUpjdh2a5lR+jMfO0tBkkGRTD7FvV9zMKBnz2hSrqQyLNQGIyOhPz72GZxqCCAYX4X7A
         e2v+nr6YqQKRJvX6RLbQLUfJKoeVE+KNo+MjaCWb56Gx+r3iCuDDhBoFBX6KMhV1BKOm
         OVUrXOQLDcEmazWzMF3N9QQXPOlD4nT/pFlFeK+Bb7sjFJEirOveiDEJ04wam8idEyWI
         UoMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUWK/KrayNyJ32gEofo7f4usUfOmwjZGM2+mQMmVR47TJn6NBknZTdKGgw1SWpkJ47Py6LguI+hrUd@vger.kernel.org
X-Gm-Message-State: AFq9FYJO5ttmYOEa3vPwcNvnGS4/SvKD5aWZYIai96Wx9TRA1Oc+qq9P
	jeml/aOc9T7j+iugQFJ44u3aqsA3G4+ZqHiMDzdJcdgSXAAnx6pa4Y3Rqi/TsyIA9a0=
X-Gm-Gg: AYBFou04/TMl5Pk4Smmxk/9YqloNgzZcCSQO6RqsUNnUuzPm2qKLRgPQr3nd9aHLxZy
	4YY2J6ymvQUkyTYqeoXVHIytovOFpNO8zpaKxUHiNhl6Cqx34bA1DZXIkJqyvEqBfZRMEUp2bMT
	Ul7cQJOmpaEqd9rLCTz/diIZ//d9tZSDrSzMZSxCGzfk57IgqiWmiBffUjNpkCADYXuKr274SnL
	tkOMLdXFxrTjhBRXne4mT4wLnNilMCHFZ+R6mi8vUAXt/1BvATSh2Dn7jiAFihtL0LzgcsRBB9l
	wmWaLd406IFnIcEd/b0I1Dl2Pn6MvsLT/dAVUkljA+5jl0EP5Tr1hLlROVgfTp/fRggKh+IoYgX
	K+WJZAFYL7+wNvQ15uuK1DfWcKeVyPCIMcX49by31G8JLCviipOtVp9hcB8eRqKNqIXofr/emTZ
	m1PrP6jFIzCKj3Eemn2+hcbKCN8lYwhn4hKMyAAzb4WICTnmR++g0f1LECzDrzhVA01he8shNvF
	uiJVwr4mZYcne037O+shJT1AgdKMpGtUnqMTgcMKmEcN3kVOYJ8rdGGyrgeuSF1sSoOe89Mtg31
	fLR0oW46
X-Received: by 2002:a05:6512:39ce:b0:5b8:f9ae:1816 with SMTP id 2adb3069b0e04-5ba405f319dmr575166e87.17.1790775487315;
        Wed, 30 Sep 2026 06:38:07 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fc02f2esm360270e87.77.2026.09.30.06.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:38:06 -0700 (PDT)
Message-ID: <828c9108-2db1-45a6-9301-19159a094301@linaro.org>
Date: Wed, 30 Sep 2026 15:37:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve
 <aesteve@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org> <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org> <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat>
 <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
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
In-Reply-To: <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/26 09:55, Javier Martinez Canillas wrote:
> Maxime Ripard <mripard@kernel.org> writes:
> 
>> On Mon, Sep 28, 2026 at 10:36:18PM +0200, Neil Armstrong wrote:
>>> On 9/28/26 21:48, Benjamin Tissoires wrote:
>>>> On Sep 28 2026, Neil Armstrong wrote:
>>>>> On 9/28/26 19:24, Benjamin Tissoires wrote:
>>>>>> On Sep 28 2026, Neil Armstrong wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 9/28/26 18:22, Maxime Ripard wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Panels in general, and MIPI-DSI panels in particular, are pretty
>>>>>>>> difficult to support and require pretty much a panel driver for each
>>>>>>>> panel produced. Most of them are pretty simple, and require an opaque
>>>>>>>> initialization sequence that is usually poorly documented.
>>>>>>>>
>>>>>>>> This creates a tension between OEMs and distros because OEMs will
>>>>>>>> typically get a new panel to react to a sourcing issue during
>>>>>>>> production, and thus need some swift turnaround between getting their
>>>>>>>> new panel and it being operational in the OS. Distributions on the other
>>>>>>>> hand can take years to ship a kernel with that new panel driver.
>>>>>>>>
>>>>>>>> To solve this, I followed the example of HID-BPF and wrote a panel
>>>>>>>> driver that will rely on BPF programs to perform the panel
>>>>>>>> initialization. That way, we can ship the programs separately from the
>>>>>>>> kernel, and with a different lifecycle. If this driver is accepted, the
>>>>>>>> plan is to have a userspace component started by udev to identify and
>>>>>>>> load the right BPF program for the panels found on the device.
>>>>>>>
>>>>>>> This is kind of late for serious applications except if we manage to
>>>>>>> solve the bootloader to Linux display engine transition.
>>>>>>>
> 
> Besides what Maxime already mentioned (that most general purpose Linux distributions
> built the drivers as modules anyways), it doesn't have to be mutually exclusive.
> 
> A simple panel could be supported using this BPF-based driver and then a panel driver
> added to the kernel, if is found that some applications need to have it built-in and
> earlier in the boot path.
> 
> I don't see why this would be any different than HDI-BPF or other BPF-based infra,
> such as sched_ext.
> 

I don't want to add a supplementary maintenance burden for the sake of using a cool
technology which has serious drawbacks and dependencies on user-space even if looks
really cool.

Neil
