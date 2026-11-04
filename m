Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781914;
	b=3SD7QmtZZcUc9noSupEsHqK7tAiNKVEImJcp/eRoWoig4kFMUgt9key2JlA6TxVMG/Xv
	 BChOwooatBj1vEybUFzf5L78vNlIIzlsbSchH2r/twDSugoUmjVckrSqFAywxYkOmiTCr
	 R9XlSE+/XAhkRUNMP3SK+mMtSamZMlolyRDdM4j7dQ9oIEFZZqc2/aBUx/4qJh4ausjaY
	 UWTdrHE5RSZGECJ9bjY9yeFXfI6QbiZs3/0JlJ0cYy6gfeqIMV5+A3KDyIrw9VZaEGWXh
	 PI/fX8XJSsyfH7HAPW1Ul5JxUrMtKEqwcJwCLWbpk/vuvdE3qPVdqY29YM6ME8+ER8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sewKb4uzrc83cn/bmcIRxi4zBM4CwiMJbeIGg3rMpL8=;
	b=dv2P0LFwhO/KCMWlhmRygm+oX4Y+lipA/7Nr3V8wTV+whhbzZanDKrO+mi0DH60HXkvm
	 haexJ2kVuJLcin7+Yu7R6FXRwgO8NPe51yUosoUvs1vPtQpv9pQLcVonkynVXr7ZARCEN
	 h0hGqQaRsQljjk7QG1khNgj0t395Mhij1cTGm1BbVdMoxIZqZUid4yBH73qWiKWKsvc8m
	 7y1pQEEPXi8xtG5Ta7TF80Oft8Nm6tMHhZfjV+/OKpqllrMDAH3akM4aBvD6krTJ7N0Gu
	 /m8QBYKSlA3n9Gbw1X+lGL/Qn32gBOr+c1bEQeyGb06Y8tukyoeXeeYaTkqGlwFxWNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDFF606A339
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCDFF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so2911065e9.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793781904; x=1794386704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sewKb4uzrc83cn/bmcIRxi4zBM4CwiMJbeIGg3rMpL8=;
        b=lhZds9+ZHwK2V+PeQ/IRFU1kXExrO5GO1gRGTuSzj1vnh9JwwsDjztEp3smuuajVSn
         Fs1EAO3XXiTA3NnJdHzOcJpycWTRy9kG00n2sBOg9Vmn7PXRdVkSqB9p4F3nKQiblY0z
         SwGrz04AwE+znAnaNeEkdNCD0uuaTp7rtglwRGTB3nBw6av+wwZXBfLu+h56HppsF5j+
         DDH7Bz+GAwRRVxTxz/G87v/PNGXk39mQ/jF+Dok4V2r4siGCRqybjBbt6LeMhNkVgH7L
         LdZ0ZmwdcQxFo3TqDzzIv644MdqZE5R1gBUYriTgi9BoLhRoq3cFdqD4ddF8EbmhqnXh
         2m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781904; x=1794386704;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sewKb4uzrc83cn/bmcIRxi4zBM4CwiMJbeIGg3rMpL8=;
        b=L/sHFqJJQndfqxKjiezUIkpxLUMEahhVDV3AfLuNLy2Y0aHSPZQMBsssIaEy+7MS/k
         vd6zeaieLYHj31oB9TDgH5g9DXx1tCSpMLCQUzoiOtXzxST3udorqUaEGZnJk7w74QrX
         MSsRmGmDYMgj6rTlnLtRumdBjnyZ+oQ6VFD29FxurvMAzDgMeWFCaC0pm4TCS7QN4SDb
         h8mDJcXZwLyZoQvoik0JM/Xy5eJgI+l2izD2+UWgQYMepZ0ZludrjyBt/HOW8BGTDjcS
         dDVwJysJ0Df87MDkvS6GFl9h7Em6H/bZPx0gQ02RB+DRPVBOJyByzVaPWTgIIZqSB4q3
         QJ8A==
X-Forwarded-Encrypted: i=1; AKwUvBwPIgl2vDbm4wcOemEprOjJQDY5C7jPSsbsDUeg6I7Ox0XSBg0MnxcbKKskmkkmP644JTjHVfMHmiNB@vger.kernel.org
X-Gm-Message-State: APuU4Z+iD0aqZz1pYnxzzHeqvZoAE/NCWaqjM6eGTlDzAjfB5KOVTfco
	CNrHHorWWehzaa01yKJI1khfOfg0PTNwrhZqFIWIbx8PKtuiTHPeTgpMxyiXtyJKcr8=
X-Gm-Gg: AYBFou0tbhsDVeJngaY096Xiaeyru1PYjdrwai2V91VrMtyOaQCr16GiwO/LMFsLx3Y
	BSDH7+1+wB3L2zApY7I95o757axkzsA34nZ2rEQl+1I8FcvFFhITw2yHXUGwbOfwmD+0JJckcuN
	lf5uJuStBdgOQgud0fFdzcdGCVBjGM/ZznWabR9rHeT0NH70mjoTyZiSXiukqGMJLsddaBiwwc/
	DwCX3PZUZ4rxZOZuTY7N34G6MW4JkanBop3qns+5XCmncikyVwvILiiUvF/VLO1nvqAKM0IQ5VR
	lyPu39ptsUoWKemE86A4TxK6yxmW5ykgWuEKhdbe6ap4r7WdZSEfWHEb02YRFA/9Y2ERvR1DprE
	PU/fv6Nw9UgB/NVrEW6NqiBVbItICSvd+cD31u9jK4ZcP4mpmvCECvpjx68ei5XFvDIeHXovPRU
	TOjdEFKcR1+F2jAukzCDaJYJaEp2DFDsD44VdC/UP9a/T7/dr3Hr5vo9U0pNt3aDoGM/NB842JB
	P3Y9QNuwy88pWzR7juHRMFkpYXMB43zBT0jl0uyfbhmDbxVY1QAVivrH2ZbaqTNalBur//gkHIV
	IVXhPZ18yLlTKq/TP6GmKqoXaGxF9b0nuw5RNsoTj8EBN9++eKiwgD8TMiDIvwbJEgVzFNRt/uZ
	Gl0fawPU=
X-Received: by 2002:a05:600c:628d:b0:4a2:397:73e9 with SMTP id 5b1f17b1804b1-4ac17d1995amr354869205e9.18.1793781904156;
        Wed, 04 Nov 2026 00:45:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43cff3fcdsm37072035e9.11.2026.11.04.00.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:45:03 -0800 (PST)
Message-ID: <01fe2a71-ba6f-470b-b6bf-e536a1013b09@linaro.org>
Date: Wed, 4 Nov 2026 09:45:02 +0100
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
In-Reply-To: <20261104021700.14e69abb@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/4/26 03:17, Jonathan Cameron wrote:
> On Mon, 02 Nov 2026 15:49:03 +0100
> Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> The MAX34417 is a specialized current and voltage monitor used to
>> determine power consumption of portable systems. The driver supports
>> getting the channels voltage, average power and accumulated average
>> power and energy over an I2C/SMBUS serial interface.
> https://sashiko.dev/#/patchset/20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c%40linaro.org
> 
> Sashiko had views and the dt one at least checks out.

I'll fix the bindings one.

But for the other reports:
- [Medium] iio: adc: max34417: shared accumulators clobbered on CAM power/energy read

This is a tough one, today if either we read power or energy, we erase the accumulated
power+count in the context, the context accumulator is only here to make sure we don't
loose data from other channels, like if we had a single HW channel.
This simulates this, if we had a single HW channel, at each UPDATE we would get back
to 0 in hardware anyway if we did read the power or energy.

- [Medium] iio: adc: max34417: missing 1 ms delay between UPDATE commands

It's unclear if we need to wait 1ms in CAM mode, I think we should but should we block
from the read if we are under the 1ms ?

- [Medium] iio: adc: max34417: scale truncation and mJ unit in max34417_read_raw()

Ok this one may be real, should we return Joules or milliJoules ? If so we could
fix our precision issue.

- [Medium] iio: adc: max34417: missing UPDATE before CAM in max34417_setup_cam_mode()

It's highly improbable, but I'll fix it.

- [Low] iio: adc: max34417: reuse max34417_reset_smm() in max34417_trigger_smm()

I'll check if it's worth it

Thanks,
Neil
