Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F21641D63F
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 07:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926216; cv=none; b=A0kUukegNjHqszTj0X3iw27PdjQnA+aifnO9TbkbIhg7R+h9cwn4f3vjYkM+i7tWUCt+19osrBgsidp6HSIXI0aESXU29wjcQAG+5pP74Ix2zS+bUNEhvmkAnfUbPZjgyEzvq9n2Je6o2v/9U0jSbpzwp/Z+SL/ApLMOM7ANNzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926216; c=relaxed/simple;
	bh=wMMtCDXpiqei1jhiGiPdThCggE5+d/NY6xuXJoVy9Pk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hCbldK8TZh0nIHMPbj6vLYuoc3Wdj4yYFEL+1GR3B2uYzO3fVepT07ryMdHDoLwjqghAWKx4wor0sUbxZo0bcvxznYspJV+ELVW6hsI1MM6ZKwLy5GKkiyQkZ58tX7w8jQJpP43V2LBKYwsgT2X0bruM2Dx9D84oXFk0qIjr2tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=umkZaMEJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="umkZaMEJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso40860545e9.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 00:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790926212; x=1791531012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pk49vmsIM+yCxOu67mrioHkagQNao6fvAH0GFEMFZCU=;
        b=umkZaMEJ5Al0f7F3ZLgxMWyb9FTZjKUdETJBLDl0Knr//7kXuesSl4h5D9wrMKZP9j
         FxpAprgOZeTFZ8/93fobUUOTYxey+otES5tpEAC8ARnNQbUpE7casSGWdo8lwi7UdLuf
         SnF5MC/Nn+4oNHbLEc5UuA6F3zZKp+Yaf3PTjicKoAs+0zMhZOxSPGusDXBI77lAUsRL
         16pKqCabdpttYX+RuXAJOnRmVXuPfRFezuEJ0TYVRyeZuIZoqT718XMcYk2iB/+d8WuO
         YPYgvXo0uEn0kLUZhHNZOVWEffON6lIN1hFoJJxmK24LD244vVE1OZKd+vZqBrFXlrpn
         buPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926212; x=1791531012;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pk49vmsIM+yCxOu67mrioHkagQNao6fvAH0GFEMFZCU=;
        b=uf0zkCuFTjWlFWKpyI7NKgQrMF32vK4+SU12gXN+RWTpwqE1is+lr80XUTwdtHqB+L
         d+7p8QjYCTd1I3/AfEPUVJmK5D3rHuIn4xXhqkNTAvv2XYomC36kLmEXr5QyOi1OAm+V
         +Qa9D/FTUCtBNNqceXButUvdSh938LuX2mGccgg2mz7zW6C45c+BVaq32T6L9O3FG9gn
         FBEf0VH6gAgrMzEOetEbuebQxF4o1Vx32hKHR6+uI5Tje50vUrkEsaqzNqXBSalgZz5T
         b1jcirvShwUhdI7WX9kQFUo9ybdDMMt6qQERTzzRH23CslK5VhkuCXmwnTVFyc1qOXNv
         5TPg==
X-Forwarded-Encrypted: i=1; AKwUvBx2YX/yuN7VtQ7N5mVJLlNF3fBkY30SaeWwJIJc0wql3XUBdmMUOkmAMCVi6uO7SQDNsvLYzixv0V4T@vger.kernel.org
X-Gm-Message-State: AFuF++m4woFlIktUvd7U/Fa1V9KwydtMretDubc/mpZAqn9emQX4xcDu
	K2b1F2yNDgBdP/fmSLZW5DUx5nmm7E9xCO+3OwxIIPCBFDp3o36ehBR1WTR3zq5TLPE=
X-Gm-Gg: AYBFou1cmY96kmBXaqjdXNovrAbKC/6cqjyA6ydaVoUaDTSxWK5Y0+rJbh3s82kOo1f
	V6efqTWozIHqYdfzCa3dnQcLuX6pRFamoofcKoPoPSE7Wl0/4QhsQH1sMvwaGHzITYmK9p8OGOk
	jI3EXw8aQarbFTyAAYZ+nP6A7nzqreCi4FAW48ES4PQHbgHZL0YATLDrCTZueGReP7dlJ2exCV8
	YUh91gJRlLtTTrRsxeYr1Ub8SLkCuL1ba2rJJhcKLYBxXd+T2LL/iKDsBK2Nh56QScaGFmDwdrK
	e/a+1Gi6BXYEddb+rSkHUfleROeNNMfXLzdJ/GTUSvbhbU+v5GU0IaaAZKFoZI/n+IM8FBEiZBl
	my3Q0nYxqMz3GEHmaZkovxqD4SP43M2MJU2bfzmeLboBTu40+HExSPFIrqBiq7G+uvvyOYw4GgU
	qUe3ZWMqgqan9p3kdNxG7kfc4uXHDBFptGlP0gIWNwsbe5xtkD6w8b1jnWo5WqrW650Yin4yX4j
	OwZsp9XPDXzIyDDb28/x+y8SlIFQSJQGsfAdaZIXy4dFu4OS7bS
X-Received: by 2002:a05:600c:1911:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-4a0275657a1mr32220045e9.22.1790926211263;
        Fri, 02 Oct 2026 00:30:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3611058f8f.31.2026.10.02.00.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 00:30:10 -0700 (PDT)
Message-ID: <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
Date: Fri, 2 Oct 2026 09:30:09 +0200
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
To: Maxime Ripard <mripard@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
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
 <828c9108-2db1-45a6-9301-19159a094301@linaro.org> <ar4CRTMQGs5_nGKY@houat>
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
In-Reply-To: <ar4CRTMQGs5_nGKY@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 08:50, Maxime Ripard wrote:
> On Wed, Sep 30, 2026 at 03:37:58PM +0200, Neil Armstrong wrote:
>> On 9/29/26 09:55, Javier Martinez Canillas wrote:
>>> Maxime Ripard <mripard@kernel.org> writes:
>>>
>>>> On Mon, Sep 28, 2026 at 10:36:18PM +0200, Neil Armstrong wrote:
>>>>> On 9/28/26 21:48, Benjamin Tissoires wrote:
>>>>>> On Sep 28 2026, Neil Armstrong wrote:
>>>>>>> On 9/28/26 19:24, Benjamin Tissoires wrote:
>>>>>>>> On Sep 28 2026, Neil Armstrong wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 9/28/26 18:22, Maxime Ripard wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> Panels in general, and MIPI-DSI panels in particular, are pretty
>>>>>>>>>> difficult to support and require pretty much a panel driver for each
>>>>>>>>>> panel produced. Most of them are pretty simple, and require an opaque
>>>>>>>>>> initialization sequence that is usually poorly documented.
>>>>>>>>>>
>>>>>>>>>> This creates a tension between OEMs and distros because OEMs will
>>>>>>>>>> typically get a new panel to react to a sourcing issue during
>>>>>>>>>> production, and thus need some swift turnaround between getting their
>>>>>>>>>> new panel and it being operational in the OS. Distributions on the other
>>>>>>>>>> hand can take years to ship a kernel with that new panel driver.
>>>>>>>>>>
>>>>>>>>>> To solve this, I followed the example of HID-BPF and wrote a panel
>>>>>>>>>> driver that will rely on BPF programs to perform the panel
>>>>>>>>>> initialization. That way, we can ship the programs separately from the
>>>>>>>>>> kernel, and with a different lifecycle. If this driver is accepted, the
>>>>>>>>>> plan is to have a userspace component started by udev to identify and
>>>>>>>>>> load the right BPF program for the panels found on the device.
>>>>>>>>>
>>>>>>>>> This is kind of late for serious applications except if we manage to
>>>>>>>>> solve the bootloader to Linux display engine transition.
>>>>>>>>>
>>>
>>> Besides what Maxime already mentioned (that most general purpose Linux distributions
>>> built the drivers as modules anyways), it doesn't have to be mutually exclusive.
>>>
>>> A simple panel could be supported using this BPF-based driver and then a panel driver
>>> added to the kernel, if is found that some applications need to have it built-in and
>>> earlier in the boot path.
>>>
>>> I don't see why this would be any different than HDI-BPF or other BPF-based infra,
>>> such as sched_ext.
>>
>> I don't want to add a supplementary maintenance burden for the sake of using a cool
>> technology which has serious drawbacks and dependencies on user-space even if looks
>> really cool.
> 
> Spoiler alert: v2 won't. I've got the in-kernel loader to work and thus
> you can have a built-in panel driver that works without user-space
> intervention. So this is not a topic of discussion anymore.

It will still have users-space dependency, meaning the BPF files will need to
exist in the fs when drivers probes.

Neil

> 
> Maxime
> 
> 
> will work

