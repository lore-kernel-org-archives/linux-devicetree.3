Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217945;
	b=vAcdTee+BAylhD6SO+Y/6JHIV88xQvpHlngWYbDQl4UxZzfEPNZFvpo1k2gQSB9fSNc2
	 YtjMuc181G75YJ4X80RujCObb+lQIucNN6dNflzc+IVSXh72uyLw6+RPgYH1v9jdWYDcg
	 4Cgpms/HtOiGU/61iP8+LagtAommFCgoGcBGjoWOMJCe2yZW70indW04mLsC/R6GUnaa2
	 HBTdQCVAYJRen0ohXRhupjNbp3yZnlVral9YlTmziC3YnGNqGQtsWOtBSNQAQWA0QWOti
	 3nc4RL+wmNtImkvOpPt8xwpvDuJeHbqKxSBuB6zomyvTD1y+r0zCF2GAtZbkTfm9O7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wtoCZMcVn2T9YB+j55mhrbVUyFtxMXctjTorVf5q3Y4=;
	b=NYEm8uHwzP5W2RwlrxywbaLKhaP6oVbv/Xx5SppJ+li6rnG/8RNzzcWYHlcZr8apdxY/
	 9puuk1vrvfy/3McSd4pw293ge4ykXxHy906iz5AvrmpLFi3nHdsRantbyQCuSm9ogj2X4
	 kRzqNfiYFr/wUijvYioyj0yY218ve8L2+my9qX7xIncpQ0Jiet7pk4X7EDlJk6qQ1a/KW
	 VaebOMCThm1jWj0pbBWvWOakxOz/xGuSnZ9xVRTaAfzgNl4mfMKsgVU8+znSR/hLvxzBT
	 9BATw3KqBowcY7zVBV+q3mn7eJESvXuX8fG6Zc3oYUOsOt56V+cV6A9gdycAvr8+hcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nJ5FeZwy;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B015606D801
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 09:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B015606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nJ5FeZwy
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so397746f8f.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 01:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794217944; x=1794822744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtoCZMcVn2T9YB+j55mhrbVUyFtxMXctjTorVf5q3Y4=;
        b=nJ5FeZwyu5udRK6QHO1ZH8265aQKl07zwAD0rqFlT+v7K7Xz6RSKCyxKTd0SmMc5kw
         /2IToIaHSYBJJnrp2VaI3L+0SYoF3eNrwzm7exCOhiKOUXgyze/S23B6DFBi3LN/HhW/
         UoT8P3gl3iGOSTD83jFBhzMufriexVwUB22DlabS/L4RaKSE5EdF6KEthjE9MSw5x8NV
         12PbHjIRCpMFgRayD3nApzQCtil1dHlSyqpnmQcidgsjC5CAGUsDKwMBFz8lYCwiFLvj
         4tHoneMTDio9tdnLDTexY+E0QlUAsgWNIqNADu6s9SfzH3fUh/K/Hghgqntn0rqX+bMP
         QjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217944; x=1794822744;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtoCZMcVn2T9YB+j55mhrbVUyFtxMXctjTorVf5q3Y4=;
        b=Gun81pJVJOXSP+VcCEBOUZSIJwfymIRMS/77UQqUWeDtqOEVxlZQuE+OFVeXDSVHF/
         +Frbbx1XEa2F7hnFQaCTf5T+J0AkQNp8hgPKzUAvb67LFfrUWdjI6pov/yvqU+YQ3boG
         1Yy5whIl3h3D9qx+agxdwhhuiJa8YNJtj8t75fvFPxZMVMZg66uT3OBYQOh//01zTCXA
         ZFtVNzHP/WomuvXf6OFGH4+UFJ26WRxLVD1yidNhQucGT2jG43KxTS72XFsap8HuTiVn
         rfA4ps9sm1GNC3fqVW3+0ggnd7hJF3Ofpak0C8O2rUf+dNXZMxNZwaU2KmgsF5vFSElx
         uPBg==
X-Forwarded-Encrypted: i=1; AL+hErEHTp2GTznBAObUckbWz+GLPxjwNx7ogtVNODVnR3TBFuVmlpY/HpFC5C/DDLP/By0M4UVrh/SB9Wjp@vger.kernel.org
X-Gm-Message-State: APuU4Z/1hHfGXZ8tw0CLYGbOG+ewvUXVNxtpVoAdo5w7PedQioHIy79Z
	GC2oNUl2XTULWfktWEq28868z2MXUcEkdChtlWkLJt6Yx4W1Sobo7h6qrqTad+4e3qEm8ycBRDX
	B5sBl
X-Gm-Gg: AYBFou3eHPxPcqyCypSfZL9NXBH+AXxDVvQGKdZY8Bg7+dkOwHOhz9LTPtkxeoUtaT6
	hYlaI9c7ZK33qzxfdvId4Eh/Q0pXJth3ZcCboOpuoOTOJXe6qgsh8F1GWqUTNAKW544pqX2auWF
	gn5TZvxTNc4RTJ/gxH3TpjevicoiIQICsDmVKXwFnQ2b7/bEe0Un21ZaeJfGedpIfE9p4FUyZ7f
	6S4bEs1yX8wPGgwZQg8bNl55uBid8uojnToPqPl/1iJzvJaTL8Ts6gEKeZNsO0cArkEk23Dz6sL
	FtwRKzpn5vynC0HR30B+O8O6pp6TK6k9CSNNFbMr5Gka730oDv5uvQ569NYbITPV/zfTf0/gKrG
	y374NiYVZW9ym30xkwm8goaLzRcV1nHD/nFw+WgvK0ndwOiq6DxuXnyKXJeQqRPYWQaZbwsIO4G
	+rHl3ojiyZXtPhauj1FI8H9wwut5TepLT7TAzxT5ahswU5WS6wU+D8yJ9zEKy+/q4Yg3Mrrh4n4
	aqk5bP6JHnBOV84Z5fZ5qoH95bMUvwvpdsNLVuiSpr9l4/ZsdPAOYofU6zVUtBacNdefunrVMYa
	q6/wiJM7ESDNd46SBWRo9ebLPUFi3QOLyEZEA2ENr5vw5jzl8E2tZru3cY1TzbNbSGmW2c8xMpH
	2NsMxZavS
X-Received: by 2002:a05:6000:26c6:b0:48e:66d0:664c with SMTP id ffacd0b85a97d-49582e8e524mr7178441f8f.15.1794217943707;
        Mon, 09 Nov 2026 01:52:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959011c995sm8903729f8f.0.2026.11.09.01.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:52:23 -0800 (PST)
Message-ID: <51eaa37a-9634-42cb-9aac-4c842ab2af07@linaro.org>
Date: Mon, 9 Nov 2026 10:52:22 +0100
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
Subject: Re: [PATCH v5 0/3] iio: adc: add support for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux@analog.com,
 Conor Dooley <conor.dooley@microchip.com>,
 Marius Cristea <marius.cristea@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
 <20261104021700.14e69abb@jic23-hlaptop>
 <01fe2a71-ba6f-470b-b6bf-e536a1013b09@linaro.org>
 <20261107230925.5e66b234@jic23-hlaptop>
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
In-Reply-To: <20261107230925.5e66b234@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/26 00:09, Jonathan Cameron wrote:
> On Wed, 4 Nov 2026 09:45:02 +0100
> Neil Armstrong <neil.armstrong@linaro.org> wrote:

<snip>

>> But for the other reports:
>> - [Medium] iio: adc: max34417: shared accumulators clobbered on CAM power/energy read
>>
>> This is a tough one, today if either we read power or energy, we erase the accumulated
>> power+count in the context, the context accumulator is only here to make sure we don't
>> loose data from other channels, like if we had a single HW channel.
>> This simulates this, if we had a single HW channel, at each UPDATE we would get back
>> to 0 in hardware anyway if we did read the power or energy.
> 
> 
> I'm only half understanding this.  Let me see...
> 
> I'd expect userspace to see accumulated values since we enabled the channel
> rather than since last read.  I think that's the final suggestion from
> sashiko.

Oh this changes quite a lot of things.
How do we handle overflow in this case ? we disable the channel and enable again to reset the state ?

> 
>>
>> - [Medium] iio: adc: max34417: missing 1 ms delay between UPDATE commands
>>
>> It's unclear if we need to wait 1ms in CAM mode, I think we should but should we block
>> from the read if we are under the 1ms ?
> 
> I'll go with probably?

Ack

> 
>>
>> - [Medium] iio: adc: max34417: scale truncation and mJ unit in max34417_read_raw()
>>
>> Ok this one may be real, should we return Joules or milliJoules ? If so we could
>> fix our precision issue.
> 
> Units in the ABI are joules, so if you want to return in millijoules you will need
> scale to incorporate the extra factor of 1000.  Hmm. The comments suggest
> that today it is using milijoules?  If so that needs fixing.
> 
> Our units are a bit messy as many years ago I started with what hwmon had before
> concluding they were tricky to keep insistent. So what the base units are tends
> to be dependent on when the channel type was added.  More recent ones are the SI
> unit in most cases.

Ack

> 
> 
>>
>> - [Medium] iio: adc: max34417: missing UPDATE before CAM in max34417_setup_cam_mode()
>>
>> It's highly improbable, but I'll fix it.
>>
>> - [Low] iio: adc: max34417: reuse max34417_reset_smm() in max34417_trigger_smm()
>>
>> I'll check if it's worth it
>>
>> Thanks,
>> Neil
> 

Thanks,
Neil
