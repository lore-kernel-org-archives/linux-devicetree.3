Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FF039A067
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776680733; cv=none; b=RBOpYjfpoPK8cQlmRz078+97/aS+rqSS87nsV+mY6huSYgM1Orj0pm9jTWP0bmHirzNXY9dcnnWHH/Ziz5xy/JkSxMl8zcVoE93W588oUEvXtLikBhM3L/uOmygZUoiUl0EQLR9aqnx7sMY+8nioOOd2c+VMNT0eVFk6TZKnvAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776680733; c=relaxed/simple;
	bh=ltFkoAnr1YJzgqo6rJi7LT79ugfvdYEbKMb4BJxS2eM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbW0mens+jpLgIfxCVTrk6GjnAGEjX5yM/VWDeAWOJIx1fI9xBWS02yOtyKiGbmDwqw71dIOdhWZ2BmBc5DQnbOVDp/0fW+0/0GZ8BcfEeF21MG4pQa4gU6MBAQzxkndiM176x3YHRGSuaHvtEQ3kMLD5qAXUt/TRQ5MH/0HQak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k6qU/ZrC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k6qU/ZrC"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43fe62837baso1668049f8f.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776680731; x=1777285531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPEykyYBP8QuV/+bEqBcB7dK9AJ+54ZKlg7bIddLSxQ=;
        b=k6qU/ZrCXOWi6M4ZtoKeOcZA4rYvLE1DVT+RonJRVTqPpuOPyzCRUuJ9f61wtesQbU
         TXgUIaMlsVVqP9w9rYkv4dlWwxW/AqeqytJCzWpRtOSJv8GqPEzZ+vFWdK3ZV/rGxLjS
         SQ5XF0aBnfVbo6C7nIpvGcpGSIxyNmCJmBx4xXpjFz45/BMqoaewwOEx647sHpDHKxdz
         11w0X3+keaOE4VBNAzizxO76R5HIpoUgN1eof9x37h5UVlnl3lN6YZ4fqhKvnapuSRqZ
         us6WyPArmc9dDDnXnhfZdwiURFT+L64ynfU12z3o1vCuyqkdX56v7t7uu55MAt7Vo446
         V5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776680731; x=1777285531;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPEykyYBP8QuV/+bEqBcB7dK9AJ+54ZKlg7bIddLSxQ=;
        b=kae7p3SxOoglkkS9GO0+wuu+O4w87YBkNRap1Px1vPHfvhpSVU2RfNHlurlZbwfcnT
         wWPg31Pxw7ZVAy0JfFFPMi8P2OqyFv6f/CytREFqujRo5k5NIilq2W27M9BefOH6RB/6
         D4SVlmbIdtgo7CN3XNemx0OJhWWZBhGLuKikAFtPHsaV8w9A++amAcT65VVgFe+oFx8w
         twXj6F1Kur1xLjBy5XZ0TxJxjpxQDPzGBotFnfmXKmtZFX1wXmpbrmaXSkUZjtt4Mm+r
         opJSUAyWUH66yBXtY39fTUrZnMqHGaPTlnMaZx7xtmVxjyT/wpLtx84goheIWPvpyup6
         0uUA==
X-Forwarded-Encrypted: i=1; AFNElJ8Q6/kGbpliOM6LCPQOji6Uc1p23OsyEd1Pfu61gBQCe1XVy6lXbltwuPt2OfBkf0diLID+NF7TUrMl@vger.kernel.org
X-Gm-Message-State: AOJu0YxX4PRiHK6aT0W1GfzxUqFRsAjnqqcfXgo2aZvROLql5vrnOKEP
	7D6Qh75V2dwN+DkDf/0eDNN+W0kjNF8WeLdYD8wYPCfWeljUx8i6oOCW7cAvRsOJH+WlMICISjC
	fk9YUNGs=
X-Gm-Gg: AeBDieun//zFzhFMo5/Y5IdX9kFL9iVIOSA6VTGczqQyIXxy54DGtrvjr88ZPL2bTG4
	9PWo8t5K0kuWOGjSkyPCU/4c4Wi2EX3ik2fUvlhoXLhZco/skjDU9l6cooYSJkN6Ssf6dk8gmVj
	CdN3pGijIrnWzW9TpCKFDBNA2qjJ6mNqhJceFaABNrsyeBiAr80HzlLJSs5ibZfqVX9pQD2C2xh
	/cAA1S0HZLEgp+E+LyEO9QqLrE6B+brmo8kSENc6fO6B2O0w+ZIY5YJii4MK37/iqVHN8NiNdiC
	MRoheaOrqwTCTl/w5kLG2xhpVWKYyYLApWM3iBnZUS05pMgIwqybodSb8blIb61nHGOyD5WGT4e
	a9lffVkFx1aV2FdAGu5WhXQD+KEbykCq2n1A5Q8eMYudUAFmz07Lt3KvOYHYZP0B3gCnbFveieN
	7rJCoK38tfcfAjpuvW4UQEcjdy6ot4zBdjJDnpgJo8wFqi5nRo3B76AN5lrKbalWvYmM01Gvrdj
	mgAW17VNRlLkVAxTg==
X-Received: by 2002:a05:6000:1888:b0:43d:3088:76ab with SMTP id ffacd0b85a97d-43fe3da63famr19480259f8f.6.1776680730456;
        Mon, 20 Apr 2026 03:25:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:851d:cf13:ef26:f254? ([2a01:e0a:106d:1080:851d:cf13:ef26:f254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1682sm29683675f8f.1.2026.04.20.03.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 03:25:30 -0700 (PDT)
Message-ID: <ad02acc7-2311-4ca5-b745-265d90366e0a@linaro.org>
Date: Mon, 20 Apr 2026 12:25:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane
 DisplayPort Alt Mode
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
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
In-Reply-To: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/20/26 12:00, Mahadevan P wrote:
> Add the mode-switch property to the QMP combo PHY so that mode-switch
> events are routed to it, allowing the PHY to enter DisplayPort Alternate
> Mode. Expand the DP data-lanes assignment from two to four lanes to make
> use of the full link bandwidth available in this configuration.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index e393ccf1884a..0c180e49816f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -789,7 +789,7 @@ &mdss_dp {
>   };
>   
>   &mdss_dp_out {
> -	data-lanes = <0 1>;
> +	data-lanes = <0 1 2 3>;

This property should be moved to kodiak.dtsi

>   	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>   };
>   
> @@ -1391,6 +1391,7 @@ &usb_1_qmpphy {
>   	vdda-phy-supply = <&vreg_l6b_1p2>;
>   	vdda-pll-supply = <&vreg_l1b_0p912>;
>   
> +	mode-switch;
>   	orientation-switch;

Same for those.

Neil

>   
>   	status = "okay";
> 
> ---
> base-commit: 452c3b1ea875276105ac90ba474f72b4cd9b77a2
> change-id: 20260417-kodiak_4k-891ef2221e4b
> 
> Best regards,

