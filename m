Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCB850B410
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983411; cv=none; b=QzcutfauxQwyduTU4BQuzB8sXZvRjE0elMbb6jeWoRhBYdnRTdc/6zi6N3MkYrvEHcmnakI40+s+/c0DoPniUJZhuoMTq0L0nwFCUT9D7uffWkf8euwgTOAX61l3SfI7ZsXvaPLVcqcMBCQIgdGsJDc5+tUocsrLd6OqtJd7+kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983411; c=relaxed/simple;
	bh=6OSz3KWxmArSvMQoIxNTUe7AI3RBM05RYDSdcbfMf10=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ck8S8c6CBfGgP8jyEoWEgjJ4raAbJTL/zCjCHA5UYUHBqBFxsgJgpugafs9+PNoFvE5UvRw4YE+jqUl9nXlfwoIJ+ujWzMr7GtpUSK3rr3yxCBrEw4fGllpUuIQ9zLl8v7GSAXhSQ9sI3ADeEGeKB7nDwZ9R0+CPLjENKb1kIjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aF+vsymD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aF+vsymD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so35085635e9.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791983408; x=1792588208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SOir1Jg8Hp6YB8Cf9PmJZVgPuwRcGgEcz1iexy1UgU=;
        b=aF+vsymDYNJoiipFZNi4gUM3QB+ayMmr/AVJg6znvWpfUwwHI9hSfObrT/bpoAW4aV
         iU70v1lOhyWsKsehmZcGEQ/T6jwv+5gRoLAfnNCp1ly1lPRCSWORUWRkoFfqt9Mm0O2a
         POUdBc3khQXZO5o7regv8H7eCle1WOVT2YiMnSyywg6/Di6UJYJNxIgMgu/z+YIXHWh+
         PxtBTaOpFcd//5hS3uWn6hnzJJUx1e8E9KW5ldF3DUQkzNXGEaJPeDGvLe4u5pBvIazt
         +bEkLqr7N81WNGPXPiy9x9iA4ciMIkbfgbCGKsZdgWtUfBdMQbtArILqYwbXK09qC1sm
         5+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983408; x=1792588208;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SOir1Jg8Hp6YB8Cf9PmJZVgPuwRcGgEcz1iexy1UgU=;
        b=xHsTaLClKjJ3atd8u0MiEbQ6xN+EVzwW1dYn7PLPW1ATUOlsyndGs66PjtkJtzLqBh
         UykVvJ1+808yMlQek9zjBmo1ZLoDjTZs1p+YCLczdQPHexY+dd2Dq5p2coMfTQv5J2P5
         /LJInyrQiAItdvXPfjKy9rMIYQ5amWTXZbcKtnyemENdxqef1mdPQC2+3S4uSxaWvf+8
         ESJ7+aCdd7uLOKMlEZ61/kWD5WGrS3W+TANkGih/CbFyLP5YoF0WV6UH4qLCkh+hfVIL
         TzwTbdGuZjc8A20mR3KFbdI2RzRkkotHZMH0x6PhZWequhiyo/sSPCm8677HEgQtD6Fv
         /Ong==
X-Forwarded-Encrypted: i=1; AKwUvBzq+cZ/M1G1aiH0QQ7j+0rnIqK2XPI6shbQEVflsrd0UjgnwnjWfC3/y8sBFZumOKN65vJ639SzHY9e@vger.kernel.org
X-Gm-Message-State: AFq9FYKUpAxY0p1mSYVuleGHK4dPGIcWWqSLUQwdkkyO46CjVu3OQtbR
	2V3bahakOau7utrEzYNRO4F6Idd25zETtOCzBlV1lYRWMENcE+0rNSif4jUKMfG43GM=
X-Gm-Gg: AYBFou1RanZUiiZQTM3PIDk9Pi8Q7mMGjwAnMjnmWMVLGZzjxPXC/16z7IZXiyLyEni
	umL6ElyzYBzAAT7cALtC80kCYSFyPzSUhNIyuQVn2uvZWZn++ZpZbCxW5csqKv6G5/ubtdaa+nV
	G0SS/Diqg941G5HbFl7UIwvLWn48Sj8e580xGPLcifyWtTV7dDbgvqo+khQn8zHyRnvzp4O6hLk
	hmYi/iHWLIjrmHf9Yz7FEe1QwzDtdhjP0Ee4lsYMKLJ9t7CbpTETMTHEe2r+87Yq17YMhcl1NGB
	9hMiB4/nlh95seZQcasN1V1b2lUVWZwhyWAK6au2AVJY/vpwTbCMh4iHeeHbPOCZjU6V19JLnZ4
	JTJu14czU0OPo0NkjcEHQD2oe5HZFzoPZMFDOb5M/QAn7gl5CIrIJthRnUoGNIhTLLQXCGU6i/5
	wlcEGvhfSSXEucfOeYvQniOs4U89FmRtl+QPNn4hDCc7SNmhmIQixgQFqNOgz1n6zl2SzTBYy73
	rhQPlZpvc5P34oin4oW/gWBwsbEKX/CgU0rsZHRQlwqvroFw4SsoA==
X-Received: by 2002:a05:600c:609b:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4a18e4ca1dcmr297299055e9.18.1791983408111;
        Wed, 14 Oct 2026 06:10:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fdbf:f373:6d5b:93e4? ([2a01:e0a:106d:1080:fdbf:f373:6d5b:93e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded185de7sm3478320f8f.31.2026.10.14.06.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:10:07 -0700 (PDT)
Message-ID: <8d7346c0-1eda-4e48-8df8-926d05c370d3@linaro.org>
Date: Wed, 14 Oct 2026 15:10:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-valve-deckard: Add initial
 support of camera sensors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261002101748.2454305-1-vladimir.zapolskiy@linaro.org>
 <7ff7a265-59ac-4ab3-af14-385fd02fc6ce@oss.qualcomm.com>
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
In-Reply-To: <7ff7a265-59ac-4ab3-af14-385fd02fc6ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 15:07, Konrad Dybcio wrote:
> On 10/2/26 12:17 PM, Vladimir Zapolskiy wrote:
>> Add initial support of camera sensors on Valve "Steam Frame" device.
>>
>> The change enables CAMSS and adds description of
>> - a pair of OmniVision OV6211 monochrome eyetracking camera sensors,
>> - a pair of OmniVision OG01A1B monochrome front camera sensors.
>>
>> There is another pair of OmniVision OG0VE10 camera sensors found on
>> the device, its description requires a combo mode feature support in
>> the SM8650 CAMSS CSIPHY driver.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	vreg_cam_front_left_1p2: regulator-cam-front-left-1p2 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "cam_front_left_1p2";
>> +		regulator-min-microvolt = <1200000>;
>> +		regulator-max-microvolt = <1200000>;
>> +
>> +		gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
> 
> GPT points out this and vreg_cam_front_right_1p2 poke the same
> GPIO (but have different supplies - l2n vs l2m)

This is exact, same gpio for 2 different regulators.

Neil

> 
> Konrad

