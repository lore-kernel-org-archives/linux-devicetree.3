Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFA438A73A
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675128; cv=none; b=IxDzclZlgzOzZNnBuogi3URkoalu6lFUk/UPtrFM+he1o2aQddheWJhX0hB217i/M/j6sszI16eQyRqdYEs1pBgd2GWUm7gBpW9iTMQ/BRzb+IUN5/PTb6qifpWYiWn623JwUqPnRJBzjcn7zwqZMSYicQluSE2SnarPs5Qai9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675128; c=relaxed/simple;
	bh=exgrHhbnqLw79dJGX+6hqUxiiPAdix2ROlnfCj+19Fg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fiWpjtH54fcg60X02YQhl8ZP0bPYFdFKBvJWNIEwDzw368L9n4OQroFag63cN3T5bfpQzSwuOV3YTH0z6K3KBzdU62CyFCyjSzYWDHzY5B7Bzi2NFb3RufZADzTAFQqB+0ZLGCqWU46ptU794FHUORTDIYeNn5sug3a/UpUvb1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R7B1bFbn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R7B1bFbn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso2970005e9.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776675125; x=1777279925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2e/JkWh5NIRiOWxLUHpiAERqrkA0EPAqAxoaneAyAOY=;
        b=R7B1bFbngHPwR5PCQT+cZo7afFHlUjTqt1x9UGA1ULE+q+YFhmjg3BinwNnLnYBSBR
         sN4waA7m0qa+tDEQxRclTXVQf3TE9OujfMw7HnLDaPdWSU5LCMuFg4JFqGqqeTo9itPq
         iq7XodlrZODOne/0R8+xPAZAfBYpC6MaUf07kTFG8LPHnFBe2AFAj5PgxNZ6KajkZGbG
         3xmR0d741kGkc9bJlrTU2kEMEi+Hlgnr63fTfpguQJlrAgduIlL4BEVk6p66fIZkpMwf
         gjIsi1ZKjDUiNbG1xFJoXPBWfpyCiDCusBoUNi3ZPCkGgWeYB9Es3U4rj4WVkgapwddo
         mW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776675125; x=1777279925;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2e/JkWh5NIRiOWxLUHpiAERqrkA0EPAqAxoaneAyAOY=;
        b=nM9J2/rJfujpaPNCqVExRliorDPxw4j0+iB56H6JO3NGMlG7l0lk9he5iAOEYNS6B9
         IuMR9iNKkwwEThUCe5/J7SSKhKQOEtwgjGWl8JLP3n9Q6ByDlK/JA2DJZr6bX4bgQtTb
         kYWR918j3HqAjlGjWJXk5VPvV0B6cB+If/yaoE0PlndQNj9aly3j1GzgYEDOGFbGNChl
         k2m7GkHjWkrrBwc5Px0a2WUyAmheHV4FSEZQjfbr5430RederWz7VmJ8KbvzIIF1OU0O
         kNAi9sQisxmgSsgv6y0+VXGQLNPi3Omq2OkEps68s6IclNYiTDHbqpjB5eNOHSShob7l
         wZhA==
X-Gm-Message-State: AOJu0YwR2Pd35oHIYunhLXyP8GnUEkMVSQ8+9JgnrtRZmuYk17Yxj62/
	E9y4xnR5AiWnFrOKjLauJ3jOQSMjyPGO5eEPgFq8gRhTy/B7ZXhq4CrZy83LiMT6IH4=
X-Gm-Gg: AeBDiesp9wm6iGABvtbUEPplITiqAYIUfNSF4itagm7XwuJQVIZbnqHzIUjxvg68pKO
	grKHrZjflyA/O8NpT/WyMkT+mN8jhlnZCOeybiEP78OiGUpOMOJxCVjcWdVtU6Ij2zj8U+6JYAE
	EjuGwWQdTZh8ygcBGp5CeNNRXL8u+9goE8XosT0UIkAbZzBULxjRDErj8+QULuQwfwIADyFdiMI
	ulJiWDbqyApK0gnE2HeHNbWlEzeAi37LPPcTL8A46HcUp6+cxYUuahkHIraoDbDwuISiKjQyiYM
	pBxoOrBHB6SADaAUOuhFp98I/GDFfoZe0TQP80+GXWjX26jbBR9LE+Qp8BrvYlNhGH4WlCySFx1
	rVep/3I5mftTxLlvLpiSZMdNedg5vEuTVhfQpCEIdhYGIojengH1+Pc0ve1iCLr1C606ab3JyhS
	VRdXY6Rx0pMoXMwGvD66kFdYmIDpxae3lsnQjVDD6un4rzY2ODC6IUaM/SUQM1jkYp/I/FN5ZNk
	MGFUJWHgk/oOubJ4g==
X-Received: by 2002:a05:600c:1f94:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-4891c2d2213mr44057085e9.5.1776675124969;
        Mon, 20 Apr 2026 01:52:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8290:9fd8:8af0:67dc? ([2a01:e0a:106d:1080:8290:9fd8:8af0:67dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm27522967f8f.13.2026.04.20.01.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:52:04 -0700 (PDT)
Message-ID: <f2074119-7b4b-4481-8e39-c822dd67000e@linaro.org>
Date: Mon, 20 Apr 2026 10:52:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
 <20260415-clkmsr_a1_t7-v2-4-02b6314427e6@amlogic.com>
 <ae61c52d-814c-40fa-b02a-833377d840a8@aliel.fr>
 <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
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
In-Reply-To: <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/20/26 05:25, Jian Hu wrote:
> Hi Ronald,
> 
> 
> Thanks for your review.
> 
> On 4/17/2026 5:48 PM, Ronald Claveau wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Hello Jian,
>>
>> On 4/15/26 10:33 AM, Jian Hu via B4 Relay wrote:
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> Add the clock measure device to the T7 SoC family.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> index 7fe72c94ed62..cec2ea74850d 100644
>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> @@ -701,6 +701,11 @@ pwm_ao_cd: pwm@60000 {
>>>                                status = "disabled";
>>>                        };
>>>
>>> +                     clock-measurer@48000 {
>>> +                             compatible = "amlogic,t7-clk-measure";
>>> +                             reg = <0x0 0x48000 0x0 0x1c>;
>>> +                     };
>>> +
>> Can you please order by reg, it should be between pwm_ao_gh and pwm_ab.
>> Thank you.
> 
> 
> According to the "Order of Nodes" chapter in Documentation/devicetree/bindings/dts-coding-style.rst,
> 
> nodes of the same type should be grouped together, and this takes higher priority.
> 
> So I have placed the clock-measure node after all PWM nodes to avoid splitting the PWM group.

This is not something we ever followed in the past, and I don't think it makes sens here.


"""
Alternatively for some subarchitectures, nodes of the same type can be
grouped together, e.g. all I2C controllers one after another even if this
breaks unit address ordering.
"""

This doesn't apply here, so order strictly by address.

Neil

> 
> 
> Best regards,
> 
> Jian
> 

