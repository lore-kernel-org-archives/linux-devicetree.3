Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C238552ED5D
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179872; cv=none; b=szCBOpITznn5zlrwx278gEvQ4ANyyDqMc90IQ44m4I3H/fJTmLFkK947z4alYSZP01ymYf7M3BLndYQkgAe33jpgBN1+LseKtRrGWit8NaSz+UzM94T+ROAZ4fvbK8vyyWXJfFafhyCpWumjmzG4Krj5ZMEakJRdU6j8frtl2o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179872; c=relaxed/simple;
	bh=vWbCGLr/MuZUgAz43yt6B+BPwVgJjzTOzpP4Pf+XJtM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WK3VHp52JEg34ZINgrlkWKByzv5SDk9D6gcKSdQWAsmMT6RkdJdhjcahXDhe8OTROMlgSgCuhyAhHVeOIGYSAzqPGexnAZr89Kyl6bt44JHEOLlx1dQPocrukLwrFPBLSgyryq4Alm52V7OsHGSqqZcySUMWm5UbEKxvk5XTFOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uj4TjzI2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uj4TjzI2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso8154115e9.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790179864; x=1790784664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=552bajCWQo8xxuyfsx4OELhJAt3U/l/MccDr1/FM3uw=;
        b=Uj4TjzI2pN3PZbjdxS917lIjvHnEvYnzjV5I5wVCrmiN2taI4lBwR/A892LWX9UNQU
         ixmWi9sJPfbOopoi41jtrB9eOcu3LoTk9vLWpbLyVtP1fjSZIwcsmCeBioqs6NFXuMlG
         HxhDkHL1vgLeJfdANVl3BGdEnXLwHSIXOwe1UXNlgWDZV1aqtNS0FbYYOkzdfLHdf6G3
         j+uKoqVG2pnFPQNcHrJ97kslvXLl80P7wzdWIt4uRaPOyFoDWjFsiJ0b9COMLkZJuPlM
         vsukRKxLddHkaMW0iPSyem6t1bJzub42bp8UympPzHfsuUrydIs9QqfZXdS8tNTRhhKd
         nx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179864; x=1790784664;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=552bajCWQo8xxuyfsx4OELhJAt3U/l/MccDr1/FM3uw=;
        b=cjEzjvjU3njvQ3cWmZ6rm5B6jU1XlXeAHMiGsqPPcZdFeZTLI4uwf3osGyDkUEEDfR
         oQpyf8x4TS8xpNJj1ECRDvUOypfVGIEPiFNUwH0Y6RFdwXuZsrt6/Exff/iZd5s2r293
         nwfCXoH4JRnp3KcYBoghOsjP4vkpVRSDbnUOenkxawezW9ceYQTw/gIGYUKylmtL0tm4
         5TbaZp/XmcIiniC0nvF2c3A2AdeZsfb2HHn96YNszPqQuq8weAm3hdkg9WsFkKPvNNdf
         TJiiU/LAANehaJALl1mKI2BlJjOZESjDCayfGDGM3NsdrDKd+RgsSfT3VyTbFtvODPE5
         SSdw==
X-Forwarded-Encrypted: i=1; AKwUvBwQo4zXqYo7z3NmZks3yxL3aQ3z5+kv+dJ+9Vfh9+yTb4FKunZ5BWPY6wrfaqFepAjxJRmxWTtpZ/ui@vger.kernel.org
X-Gm-Message-State: AFuF++kZYaEJFVVRp8541LIRlskx490dp3TrbsnZCVsrOASS3BZf51gm
	7wm2Q+uWJYNeeV/xQpT/8kPVOPZM4iEXEcEqUoeu5iqlNIHXRmBXaoyGfTT7oKOIN9s=
X-Gm-Gg: AYBFou2fjHCF4jxpbzsD70n1rSngYUnOHah49trjU4cgP3bUp3v4Eq23zI8cqqZ2/YO
	/k45ck1nHQG/gYC4R8t+BkiRtFNR/gyjxhQ4/FCMhp0k73flwogEhyDd5/iWUCnnh5qqVL7wkBX
	IsDlhiWGvPO32ygJeUjlKdS7+b6CIXftm5y5X8GjGF7W1E8SkNd1YwTPlb0qh1Rpw5ki3CPF3lR
	Pa8UlnIzJU4xG4xlhjCM8vnpwHF7heIRrho2yBtdMFW2r0KmGKWX2ngH8CCbMHGTt6iwinPahs1
	iZzEqKchLetlWdyU2J98oO6agivK+Jz9o5+HnlRYIUvowVyZA3WCt5pEcbgDimChtB3gOUyeTDI
	1ukit30McH2yQu+M2caLqpS/NPTuuc5+KtyAcSMLcYopJgKU0m64ZRLAj950ILYy7qEXAv1TDJA
	gvtok8SqINWEl5a5k0moF0GIIf2thK1++G1lpW1eNkhk7zDryXw7Y4i6BustUOqj6UFCEMlaB61
	RkINavpZ+ny4625/m7Wn8rpWVLhPhuQENCoCyQo8zkrMkuSJphi9zxCVxURttwgOQ==
X-Received: by 2002:a05:600c:3b11:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49fdeffcf0amr46321975e9.6.1790179863623;
        Wed, 23 Sep 2026 09:11:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4140:d290:ef49:44ba? ([2a01:e0a:106d:1080:4140:d290:ef49:44ba])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde17dab9sm102650735e9.2.2026.09.23.09.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:11:03 -0700 (PDT)
Message-ID: <dad6af73-d58d-4eaa-9c1e-39c7b8423e91@linaro.org>
Date: Wed, 23 Sep 2026 18:11:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: Add initial Valve
 Deckard devicetree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
 <20260923-topic-sm8650-deckard-initial-dt-v2-2-8361c4548efa@linaro.org>
 <4f7bea21-1fb2-4c10-9ec3-33f920cbe180@oss.qualcomm.com>
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
In-Reply-To: <4f7bea21-1fb2-4c10-9ec3-33f920cbe180@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 18:06, Konrad Dybcio wrote:
> On 9/23/26 2:16 PM, Neil Armstrong wrote:
>> Add an initial DeviceTree for the Valve "Steam Frame"
>> codename Deckard. The Steam Frame is a virtual reality headset
>> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).
> 
> [...]
> 
>> +/ {
>> +	model = "Valve Deckard";
>> +	compatible = "valve,deckard", "qcom,sm8650";
> 
> Sorry I missed this before, but you likely want
> 
> chassis-type = "spectacles";

I wondered what to set, but I don't think "spectacles" is correct.

I was thinking proposing a new "headset" entry.

Neil

> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

