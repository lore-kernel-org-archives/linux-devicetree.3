Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0BA3DB31C
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251150; cv=none; b=Zh++Sah9/b0hFdvFz97vb/7OWwxviPTpNFBK5Ce61oRcBaCllRJKEAMhCec1ozfB5N19AiNU0dzfIt8Fak5drHpaUdUFiM73dYoDWu2yiqtYFFeERAPaUTAqcrmDbak9Ha6PQXjqW7v6D9N5NngIgwLYvC6NCm5fxADNLRBZMyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251150; c=relaxed/simple;
	bh=cdQbHbOh7G19cgLNaR2oqye9IBbCmOZ3y0zSOEd1BB4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WL0jta2rRgFQprAzxsgJrTudQWga7LE9i41lhmOsZFEoBLLeLlqCmACyp7HrIg0sOyLB2YQjVOEKipcHtikX/Mc+bE3p9fP4AfKqP9BCerGMCR8IyJQaw0tZbcduZA15U1+Kph06e1dLGsvggimHuwaOAzca//z4ARemoW/1PEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SYBodW2U; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SYBodW2U"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490be03d47bso6121315e9.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251145; x=1781855945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlA9CoTRXZR0TaMdtjA4AVATbFz6rhs9UGQiBwINUPY=;
        b=SYBodW2UaDca+a8ZO0L2hOFUGKeIqZrEQ2QSdz8Tyz7NZSDn13HIn0xZoN4no1fkCJ
         joljHgalVt3KU0+HP5CMjuW7TDDjsKMe8gSr5/mH90mmzSGVQVSXOeiOaxlkyNEXlWc0
         bh7UnHiPMcT+d7ko4rPLtQxu+9R0qJ7IKp4WrDH0TVMPv+48pEOzsZUiwecqVTOwMi3i
         jaXHyN1l3s4jhtICOQmw5elccjqL0H+5kE9hbtlUar0hTob+77JoMcQXGtEwd50dP3gD
         qjA5x+7mgkRC+QW59EmgkjKcHf9zMQHaysANo/Z5Z5GxCztusehld29a4VPNbwN+qWNR
         E+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251145; x=1781855945;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlA9CoTRXZR0TaMdtjA4AVATbFz6rhs9UGQiBwINUPY=;
        b=hrgB3jv05i2GBktcVywSmQOhA+WeVYYXyxIYJjGMFGQvS5/SHs8AbInNWtk1Sn4NFK
         vq1GmyuQ7LqMvKzHi62CsJZclBwoS/t5ItulVtg0rsXSzNvpElKn7Vb022BELhupHLZS
         +TtvVKZze3MMrbaj2Lqc/jE4OytUy0D0RNTTfTBdGNcRKaNN8E8eK3mrqHMdy2DLvrUt
         XGw/M6swBfdDwYd7S2Zh9J1nCrZAUCLDhXKic+KxY+Ip2vQbzLGH4kLrDsesQB9o0YgW
         GKB/JsoUIPV8YK9SUA8pZ0/MKKy7JLYDZBIOg1ySlN276laNnQFuI1WBSl9Db1JN1DsX
         KC1w==
X-Forwarded-Encrypted: i=1; AFNElJ9ERKdL3TzMxstOcSBbksutHVlmavQSySf1QAPocIeHodXbmu44XC32AS+qISZpiELMNNxl3pduu7OY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiq0v4yNVDT08CdXAp7XTCEkFzyhqulD8pDgS349nVt74SFZk7
	RRkZYfgkege2CQetRBOxymRJuxq2jXREC6wJ2/a5J9UFtKh9ej9es8ChP4xCz+2f/80=
X-Gm-Gg: Acq92OEbCbKG7MKjTO18gKysPwfF7tYbZ1+zFvknAfcxvmc1onSsJt0r0CHJgC2a6sy
	AOzNXRDyamiqsHwpu1e+rIGJU6uweFlyaINSc4ZHaigf4+/t0PU2OjE0RTMT49gS1fRuPuTQ2JP
	xsZmXai9d7uTwQsWL66v0AeRikqQlv/BXsgLJfIDQZ4cACARr8lLlTCLIh8Wmdm0gOoE3QNyJR9
	SkS+o+d+t3Yk8RRkOELJoJ6rn9KnS6xJ3V5KLSb04DET2UXbJeO7cDGCiVYpndy0Ou3llvYPueM
	A7H3XsGDOcp6phEn+LexDKZ+PzxELHRNtKT37zkALV6UDB4X03lc1T3GHVkD4toEzu//OMnruMz
	HhQOmUCRTU77sMJhqo08Qkpns1kJyxW3pOg6uPod7e9QNf0kt7Oo67/50ucaWk8LEaZHM6GzJNn
	WLmnkT3As8XABVnre8o51bDeKmygodwYJMVlHRHNYYWqUPfuiFnnMMvYupCdkTEPUg4Zl58URLt
	0PPMgs=
X-Received: by 2002:a05:600c:8b06:b0:491:8043:5c4a with SMTP id 5b1f17b1804b1-49180435cf1mr6096185e9.31.1781251145278;
        Fri, 12 Jun 2026 00:59:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fe5a:df12:588e:baae? ([2a01:e0a:106d:1080:fe5a:df12:588e:baae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea843d63sm45658645e9.12.2026.06.12.00.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:59:04 -0700 (PDT)
Message-ID: <e7e6d38b-6d80-4c75-bfbf-eef49589ddbe@linaro.org>
Date: Fri, 12 Jun 2026 09:59:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, kancy2333@outlook.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
 <tkgqorjdnvwcx4ddgi5m7j3g6wlawxnm5ugty6y33ftwxzbvv5@uxcai2sgglfs>
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
In-Reply-To: <tkgqorjdnvwcx4ddgi5m7j3g6wlawxnm5ugty6y33ftwxzbvv5@uxcai2sgglfs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/26 09:57, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 09:41:47AM +0200, Neil Armstrong wrote:
>> Switch to the ayaneo,pocket-s2-sndcard since the hardware layout
>> is incompatible with the default SM8650 generic sound card.
> 
> Incompatible, how?

As explained on the cover letter, the WAS speakers are not connected
on the same lines as the other devices handled by this card.

Neil

> 
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> index 0dc994f4e48d..508d1445bf21 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> @@ -221,7 +221,7 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
>>   	};
>>   
>>   	sound {
>> -		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
>> +		compatible = "ayaneo,pocket-s2-sndcard";
>>   		model = "SM8650-APS2";
>>   		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>>   				"SpkrRight IN", "WSA_SPK2 OUT",
>>
>> -- 
>> 2.34.1
>>
> 

