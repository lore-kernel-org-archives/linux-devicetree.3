Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84C853D0C4
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077706; cv=none; b=qyaT83BAXvL35iz2terWwijLVAuSOqVEZdCaeD2suuUoF9EBXFHEqAFGemugOybPLOwQE+my0LjTlu9hyRV+qV4Zoirkt7b2kroUraxW1JDQyIFXCbBdcwEQ+Y0qW/AsgfVv3I0Va+vQfI4nWTwWlvQt0aUKY0gRAr/CjKxUUnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077706; c=relaxed/simple;
	bh=0fEuwFB4EDBgZytQZVYr5GO0ZMk7QxnRdFL3zHe9mKg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=njCYPQYPw72A5Itjj0mWzbyaLcC27owZfnqbCfytijaA1aHeM74Jk3/FHGZLBaO3GSejSfkWeJpyPZmFj7Tp0V1gmhJcaTXXTpxHN+9BfEZCsSJJZuqzphGhXJzNoAcCNzS1W26ad7DY6NZdBfOtID8s0oXcDayfYf/qSMbhEKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzBKs0V7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzBKs0V7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so20976355e9.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790077702; x=1790682502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqEOVW0oYV76bRl1m3qya1gRiu6Xn1Kr6F2EDDby+mc=;
        b=nzBKs0V7hi8cv7CHKEmom9Ignw3lrZ+3RtMPoc0lXjm0GmySN1ivjdqKSe8qFpWS3J
         xer+O6Ijz4dNChydVggfb2rjk6ZjhZTqEwbbms1tdNfUG/qw8XwtuMc7INi+8+g5Mrp4
         v7ebZ0hRloYgEtSboq7dWchiudyphkt6w3H3dT28L010EmobOkDoZO+6IgBYMeWUfK80
         cosCLxcMYjjDFmdVFPWrCA3WO+aWy2iaTJIfLtY3M/L3dU/mvFgIlWd6o+/Lve3xri3E
         z3aaI6hvQD0S/Hq+EYeRdKX/DBuIFXiFcxsOOYSZSxDDcq1zc86Pw2DHky81Rif9bCPL
         kwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790077702; x=1790682502;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqEOVW0oYV76bRl1m3qya1gRiu6Xn1Kr6F2EDDby+mc=;
        b=kGlRilo2i5hxj6qj65ORWc7YSlCdhCH4OhJnXNM5Lbzm2/cw12PDmupZGsbzOhQdJz
         LAJQIg4XqTFJ+WHtct3058COItulD/vBJDz+o9A2h3DPVC92PtJF5bo/irDR8Ya4KYtU
         2yo0YUnMCTM0tXbSFbIVjyFzvx5+OD2lu508C4y+zJGAp5vXEG/JsCXAbopVUbZn3sMz
         OaM1FA/dl2UVDrvfH3h5trQhx8NJvcsHynh158uZ/E0OGFCe2ep60IT2Gl1a3Xl1Ed+1
         z20dYEUuk6g78e0gwxRKccXhq0P8uaYmvDKg3JI63XJh0f0eEKoIhJEAAAw9DsOHc0cD
         4YAQ==
X-Gm-Message-State: AFuF++niS5iFF9KyvA9RMRK/KQsNff4rYad7fslxWqjpcjltK0nEOyXK
	sfpfj+YOF3C9fu7JfNgADvi1QMbvmN9oaZ91nPKyUqC2y7GOBlm4FFPyi/66iq6yJiQ=
X-Gm-Gg: AYBFou3+vjC4i3tBzAZvnu7lFRz0leXCHIaB1homfAU1TeD067HjSDecTjsI3B/jZ8b
	b/AI8m7wv6P/x91KRY2AFzn1n2b2ZuzlvZ6pGVvjGLfQE/4n/xpDxbMx1mu9zTEHPh339zsE6l3
	7nlbTaymZ2F2GQDGOokyjsC8TUds4j13yIklmBsW1YapuALo55adg6gKmWqR9MyEM98Hfk+zXtZ
	axvyffWMUzq0jmLI3dhqP4VhDvBGbOHioLyeh6138xwIp43KktL2Kxdw20lybptumwImTHVx72Q
	NtREb+qls7oasIEWXH5f2hbD3p4ZtU5mpYMFNmDBt3ye3hUmChF1nnsjn7f+7vEBHP0VvC4pJEO
	5zl8pxw3l5eeGzzgCzCqmL+Ze9Sbf4iyysLtDu1fGk0o7Zh1JubEn7zqrpFmCnbKOZNZqpN3T3F
	0hig0rtWs3VUMxxPc65bmhcbhD9ziNPWnjEPjeq33kHemllsSBPK6lvdd220RUtKV+89RKkIh5L
	dMUnF1Q+pGkmOaKIT30dZLOarnnKv5IoQ+QcQa5daifbbVlmzdtnuAqnY4VMMbbIQ==
X-Received: by 2002:a05:600c:1f95:b0:49e:7862:c09e with SMTP id 5b1f17b1804b1-49fc57238b8mr180239605e9.14.1790077702455;
        Tue, 22 Sep 2026 04:48:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ddd0:8cc7:9887:fa82? ([2a01:e0a:106d:1080:ddd0:8cc7:9887:fa82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdace7941sm54428815e9.2.2026.09.22.04.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:48:22 -0700 (PDT)
Message-ID: <27a837f9-6e32-43e4-94db-b5180c0baad9@linaro.org>
Date: Tue, 22 Sep 2026 13:48:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add initial Valve Deckard
 devicetree
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
 <20260922-topic-sm8650-deckard-initial-dt-v1-2-c25e7759d04a@linaro.org>
 <20260922114234.92CC21F000FF@smtp.kernel.org>
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
In-Reply-To: <20260922114234.92CC21F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 13:42, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dts: incorrect regulator supply names for vishay,vcnl4040
> --
> 
> commit 04ec091c4806a5aef627fbe5d3809fe2eef39d6e
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> arm64: dts: qcom: sm8650: Add initial Valve Deckard devicetree
> 
> This commit adds the initial devicetree for the Valve "Steam Frame" (codename
> Deckard), a VR headset based on the Snapdragon 8 Gen 3 SoC. It includes
> definitions for reserved memory, regulators, GPIOs, UFS storage, USB,
> Wi-Fi/Bluetooth, and I2C peripherals.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
>> new file mode 100644
>> index 0000000000000..cd801359d2b57
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
> 
> [ ... ]
> 
>> +	light-sensor@60 {
>> +		compatible = "vishay,vcnl4040";
>> +		reg = <0x60>;
>> +
>> +		vin0-supply = <&vreg_l2b_3p0>;
>> +		vin1-supply = <&vreg_l15b_1p8>;
> 
> [Severity: Medium]
> Will the vcnl4000 driver be able to properly find and enable these regulators?
> 
> The driver expects the regulators to be named vdd, vio, and vled, but here
> they are provided as vin0-supply and vin1-supply. Because they are not bound
> to the names the driver expects, they might remain off or get disabled by a
> late initcall, potentially causing the sensor to fail probing or I2C
> communication.

Good catch, how did I miss that...

> 
>> +
>> +		proximity-near-level = <220>;
>> +	};
>> +};
> 

