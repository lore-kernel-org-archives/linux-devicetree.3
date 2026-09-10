Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B774908A6
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047481; cv=none; b=NtZNLgQDGeUDCXkviFzdo0DhJf+HKoHLMwZdMzh9P8VV7wFqbjf3VOiSZ3FhA7WLS7ptwokd8MPAO0w+fQcEiCuftZR3r6zNl7zUJ1wwFcAr3ZqUG4aYKlbY6zk+Tg/L3/yUBm6oH0rxVaUqVr8nFmVXG9OYZ5rwGF2RMH+9LXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047481; c=relaxed/simple;
	bh=qWV4F0jtQUrwquRceETKua0ug4DKPai48uK/+HVxo48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgWYxnqJEQXqDY/f10iXH5/Mr/ATVGcLyj27tQtjSgVGb0enf/cJP9NYykMxspvKQxy5GBrQdXVyxcHnGt6AnSnkdf/lit2wIByP0dLD2ynUMhabyilldv6uuMyQZqL/cSQ37u72UJWm+x5VyCS59vVYxacWHnOsk29jMKaDTE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TnSC+Eb8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TnSC+Eb8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so96375875e9.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789047478; x=1789652278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSgviDKN/LY9jON+NF27RedkCnDOlNiU6ENgKgmxVRE=;
        b=TnSC+Eb80YTNyqJ4MDKOSuzSrfgd5stzkgvIci2WXgN+vcfP12rTWBfo9QYZ8nJdwn
         M4YP3hYlBw1dzjEB8piDPn+pZVM7negTrh5guVT0i6lwUCM+Ay/0B/E6SwNp1YuwHbm6
         Jpm/djTZyJwCnmAlbvBOXIbvoLfClpYIWJJQZpdY05LOiJ0/0Hue4pgc160YpR78s65G
         5AMr1BFNUAbecgSzR5dnwvIrRo1EZXZuBUE41xM8q3gCqsy3jUlcuL8OaogY8hCYSy8F
         xIhzJKiUiFjYcwQKCIFl6AxA5K8fnoWHxY2h4+zhfUbeS/G4o8YJ0JBA0gP1sKW66suM
         owoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047478; x=1789652278;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSgviDKN/LY9jON+NF27RedkCnDOlNiU6ENgKgmxVRE=;
        b=FbqNrRWGDi3+oqdvvzeqAJYX6D5Jora2ox5ZtEkNSrvFurV7qLMlqsgJ8dNqEZxU/o
         xbvN0J9OCBVMIUdmk7XQKLBGoWXKMmtn5ydF3P3nbcvEdXRo4kYaysX2oQ0D7afukW4n
         VyLa61e0RQNsGT5xEEwXJ0zRGVryxse0bPq8p2JRZ7X7eT/nM5NJF3owEInE9uRqV0e+
         +IvOY0kKnHQ7tyHWGXdtX4g4iuMurrc+s0f7/FMtjvuXlbINGPvBYM1LBm6BWjyO1oAi
         wWuljUjHyIUWd8WKpVmQqICNf2jOu5nhRZAxD9i/dys0axSH3JaGaorJ90IZ07fYZJAV
         pmdg==
X-Forwarded-Encrypted: i=1; AKwUvBznkWJRJt+Z/xo8K8aamkHxwB89gMAPCJhWvgMKxWQHqX11Oe85LLp0lfB57eor2ymg/mfS/uo6D5LH@vger.kernel.org
X-Gm-Message-State: AFuF++kBqPGZPJCBTPo/yfjgY8/Gobr106MlQRcZB55xSBnoqC2FKsS5
	tU2FqDAwJJ5WPKbiSCVHmBpeSrtvCxk1zePKeyllubrEI1Fx69mtKHCynb8nOjLkvKY=
X-Gm-Gg: AYBFou1g2Hxqmnojz2Np0QAavgORk61XHNN7ud6RCm7B4AaVDxtJ6QQMUbzOKPZaELY
	AJKMvcsB/e+5uRh3/bI2OIThhy537z8rbs7G6hh5XPThL5Bg8JyjVZ84v4UBJl9MWXOlki43xA9
	Xl0ySV7HXCnRpyba74n1Jc1F5wo4BcAbfkNX7SAMWIOZ82yYBTUgxBxRwLJ2ch81jgxT4PzPk91
	a79OCh66wWuZfQZEDV04iPg+eMwpbPhjbP2P9/use4DIjcZYKfTc0LxwmIdF+vPW28QigRfixbW
	odpWizf6HeHUCiW+SgQAo2K+Ns7yFQYQO1b7wlO+QOp+7ZJwiHcHXzX5WdAlurGB2Ql3Dj3PmZa
	KlndhZGTDnRFliHGNAxEgYnRKzgv/VO0d6W3accg92c0aGcfvYKgdXfYcCq587/S6tydyo7Ik7t
	64F2RlMfHJJpahk+EltY/NvIiik1GJfquVQ+0bVHD8/OX28kKu1oUWtBk7FgjfqQhlgjUobbdty
	fstUM3x1KIsv5e9zrTxvMTQAZFP2cB7HRNuOlAYjwKNQqmz+rtocA==
X-Received: by 2002:a05:600c:5303:b0:49c:fa21:1c87 with SMTP id 5b1f17b1804b1-49cfa211dadmr367002175e9.28.1789047477714;
        Thu, 10 Sep 2026 06:37:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:edd1:1b07:ea07:35f2? ([2a01:e0a:106d:1080:edd1:1b07:ea07:35f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm289732465e9.4.2026.09.10.06.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:37:57 -0700 (PDT)
Message-ID: <6fd633ab-eceb-44b0-b481-ba28951fdd0c@linaro.org>
Date: Thu, 10 Sep 2026 15:37:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 34/34] arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-34-90a252ddbbfa@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260910-root_port-v1-34-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 15:29, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi             | 16 ++++++++++------
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts                  | 14 ++++++++------
>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts                  | 16 ++++++++++------
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts                  |  6 +++---
>   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts          |  7 +++++--
>   .../boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts     |  8 +++++---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi                     | 10 ++++------
>   7 files changed, 45 insertions(+), 32 deletions(-)
> 
<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
