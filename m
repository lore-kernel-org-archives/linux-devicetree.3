Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694D331E846
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780062071; cv=none; b=UHiZEprU0Qlo1cFZuBzn0iJA2KFahtCvQEIN6xmfakIzWhi9n+0ht1teLpKtklnXTrAcbnAO81vIGML7lArLTmRY/0xumpnXlEQMt6bkwXn6yhC1xYwWZ5O3mHENup+LXN6tyVYf4iKxY6sAY8VB8BCYeFM9+BeSFk4I41i1Yxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780062071; c=relaxed/simple;
	bh=NPnIWY/YdHQeBqHFbUyuNM5MjyNFIVmxxavYUBT2Yc8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Oehgzi/YkPtqsKOiLoVIBqiTQHu3bVUbUlwQ69v158WPrAPK4JmAUgjuW8Dbr2zeKBv/9yID/Ng8AQrmws5k9aAY5GMzoZK5JxoOpDgjivet7W+4tUrHQcZhLKDY7AnvR6y3fcGy7Ur2m+UptpALUmKsxpNtv79i6LBEdkysn1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g/NIcFPK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g/NIcFPK"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso607333f8f.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780062069; x=1780666869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5IgzBtL3hdaFI1JoT3J9eqUHcohZ+48uLSQ9wTYks4=;
        b=g/NIcFPKVuosH2YJihYS7vWGSNze0YARflfiCKn6YaHMBq3yuq2Q8MoCYSer2kuwvS
         UtD0azlgJcFVb9jLdodjZuEmzb0QACwELBKUR+uXAKvMMzZgypNWBBDt30mUb5MC+P/L
         mUNfllgk9PwarBB/Ih9MNZ2MH2Xo1dnJ3iBv/fW2va58JgNiABRkNlcqTkwPz5kNkhIf
         Lv4N9yZcVRUjKqSGdvPTrF/HUetY7UvIZUydhrnMRGlMXG7uTil3k0+pUOVkKWM49Ck2
         AygeX+oZbnYguh1kq3ZAf3KiqdLk8LIrCdss6tidPirmX37TzN2GmZdjbkcmvkV6yvJO
         IDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062069; x=1780666869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5IgzBtL3hdaFI1JoT3J9eqUHcohZ+48uLSQ9wTYks4=;
        b=ewyEmjmBWFt2wLDDCtJBIPyTqLum8XcAMHxwbAmdyWuo2ZwFv4iAzc3eCRgqmpMYvx
         fnv87AzfPrqHtpcNr1QeDr9s+6JQNt7m2rYiwh7CcNiqGDU50JFGLg3KRYgWCG80mTSe
         0JgmOwuzSMdnPARKLrqgfLgmqAvgKCmNCbIU5w2fWzU8r2c5EdomGwwN47etKNJ+vz+y
         400FB1OvM44vrG/a+Mw6i06qaq6SyR7WFtm2ijbdnivLCJWbbnynVbL5Sjj4MPmbw3/H
         u887lNO0E5y1jAHF1pfS/eqJ7SsjLvqW7qfF8qAcchOai2REukNNcyuBjfIRkI0drnwk
         lnsg==
X-Forwarded-Encrypted: i=1; AFNElJ9QmZpqfTn0DkLnaZXMT3he1mNxHc6ZRK76ZwWe5SQRgiMWdDovcPboLTtJYYvNf60X8zVKwfhGYuZn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbmdqu/vLi+nGOQOneW4VXpj3NCl6LnUUdJD6PlA66+mEixGYd
	JpOCfrWVdxmtiQiwd8XuHZncoizmM5qlTwzy7t8aG+puN3qYooHfCZp845SndQJWFeI=
X-Gm-Gg: Acq92OHkWcsUJa7LFbqFd2npgYeXH+LJN/CHG67zCEGC/kb1zjv1fbooszf97SO79cZ
	1kJb4kjy+X4qO+0b5Ea8+3nHLw0XKCPeZwKO42cz4K1PTDPA7t6cQqwNJIJ82P5Yfm+NRtXcrGB
	70lkBCaUP6saGw35kmvEcsFiGQaxtSLoAyBnoKltdY0T3hZ25NDDfmBS1cFgmvr3Axjz5Vi+GVS
	LYsNbPOnBckAk8uLsoaRQppLzKg3S38+A7pF+QAfc1yUMI7bixlT0j2M/xQHSN2T6MjaOuq/zCT
	GfEzJ0roAuXQ2WLt9qkbMj5phzywez69ptKhp0IgTkDL/IGTXZdmiiR873IxK0cmcnqmrlM7G4k
	GYqGMxP5ISP26Lt/pKRq7IevNwkZ8slUr+8Vu6ashrksXq/qVxjWVkyJB9TGfHogfpqPPqc75/j
	Ct/NmCo2VPNzlCTyLKo6HQxJOHZYpFXPfAKGf5rNwtPiAJ8NI00kErU9SXEELuxxzvx67y/N6NP
	XQDJRw0QuzkSnZHyA==
X-Received: by 2002:a05:600d:848c:10b0:490:48e2:5618 with SMTP id 5b1f17b1804b1-4909c0affedmr41223155e9.22.1780062068618;
        Fri, 29 May 2026 06:41:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b6d0:a628:be51:f552? ([2a01:e0a:106d:1080:b6d0:a628:be51:f552])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm3488697f8f.18.2026.05.29.06.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 06:41:08 -0700 (PDT)
Message-ID: <a0d209bc-f37a-4962-9e38-5cf9d1e8d936@linaro.org>
Date: Fri, 29 May 2026 15:41:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH v3 00/11] arm64: dts: ti: k3-am62-verdin: Add
 display and peripheral overlays
To: Nishanth Menon <nm@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>, Vitor Soares <ivitro@gmail.com>,
 Vitor Soares <vitor.soares@toradex.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260522161105.277519-13-ivitro@gmail.com>
 <177980721984.3070642.16547338359984019493.b4-ty@b4>
 <20260528114043.n226kfd5urad22xe@sulphate>
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
In-Reply-To: <20260528114043.n226kfd5urad22xe@sulphate>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/26 13:40, Nishanth Menon wrote:
> On 16:53-20260526, Neil Armstrong wrote:
>> Hi,
>>
>> On Fri, 22 May 2026 17:11:04 +0100, Vitor Soares wrote:
>>> From: Vitor Soares <vitor.soares@toradex.com>
>>>
>>> This series adds device tree overlays, expanding the hardware support for
>>> the Toradex Verdin AM62 SoM. The overlays target displays, cameras, audio,
>>> and peripherals available through Toradex carrier boards and the accessory
>>> ecosystem.
>>>
>>> [...]
>>
>> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
>>
>> [04/11] dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and RVT101HVLNWC00
>>          https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3c3c5fb9b36836d279ebe370189d68a0a3387362
> 
> Neil,
> 
> Could https://lore.kernel.org/linux-arm-kernel/20260522161105.277519-16-ivitro@gmail.com/
> go through your tree as well?
> 

Yes sorry will push it now

Neil
