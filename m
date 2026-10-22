Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662291;
	b=jldCDzo6/U753FCIcZAfmPtQMtIz6FCec54evZy+8ZZqwY3njFURKgZj7pMoRZ9XFdst
	 TfvsG1JXvnH99gff4hvTfdzIsWIO1j4gBiCKCH3/nr1qg7RxSrkFeOYXtN/Wzl2ivAKT/
	 VNwzoCUw1a+RBFgDY+xPdhrdRNAJcZbwexfOfTV9kV1xmHhDYdx9vKl9n6W5jGf4vyHO8
	 4zR1C7ISZDu7bIgPkef+nIlpX+UYyCp74J3bGXhl/TTQe8HvvzY6WAIHzWqo4yMmDG1CP
	 yGMCEQAw0DFdZlbCdff5QP9dBlhezvBfvG9/ma/uMGRAYeRZ+q/l4NQq/7Fs2c8tl6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=f6CiKd9vploQ3thnAtvKilPGMztbzzs5Gxheqi3WCGQ=;
	b=Q6rgzaNF/zuySMFybJ97mMNzm3+g6vFcSTeIUnd8XX76+0o0by0kbmGq7xRbizyISQ/g
	 Ds2HEF17n4P8bXr8AjZZulKVRgvQAURUVJUqBPOV+5elDIDLsipa6Zo48dOpSPtJFxVJA
	 atlTTY8bGI5bSjWwDPJuGL0E9iCtQvEGfmQojremN1js4vMUGgOwlhOwbhoJ0rR6m58Mg
	 k4ZkYffdpgOCyVZ2QpvGi2yhuhrvnPOZ7cBATVeokh0/tKv6INwKDtTWQFjon6IfQHyU1
	 koH754hMseFNG9Fm8L/X1tSk+u8Cs1NpzpC4zf0YvdH7XFlJz8yMxICh4tLI+LQZvYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ruWoS7Ab;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24152606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24152606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ruWoS7Ab
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so11361255e9.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792662289; x=1793267089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6CiKd9vploQ3thnAtvKilPGMztbzzs5Gxheqi3WCGQ=;
        b=ruWoS7AbU6QENTSohz+TOYxmlTBOvqWXVNlawgpE7a9AOvNvrFztnlrisL1dmF3OZN
         RP1Tpz66teOrvCGzJz0Z/hL1wPr7KsBCuh/xzlgpwQWUhq0ZFmxuF8r+ESnL1e3Um8Q9
         hzsmBVuND2/B36IX3odfJVMOcQmvsfFV0QJFYHkfyA/tHcE5Y+nCZBsUXZaDYFnNi5WM
         kP6dOnngNQ5CknleDJ65c3qFV2Q1VCZ7GNHcBUDjFY08JQj0UwouQXJzMl0vLPJYbjRT
         gOPjBsI/gdO+2gXh3AnUGI3cTseIHxUHSl8TOEuq6ph+e2ZGyHcCvFkt5wmzrWV8UYlv
         Cm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662289; x=1793267089;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f6CiKd9vploQ3thnAtvKilPGMztbzzs5Gxheqi3WCGQ=;
        b=lf4R1AEFA7vB2FKpMc+GpDdoDQsJ8RqvXJkIQtsAZpW5a/1RmZsn1PlYDsxLOKXAT4
         hOnOMgxy6JuliOT41e6HamKrRWKNnPQ0/Lji0xUAFwZANjVnEq3VomrUUjMIlLnEYKYS
         PlJyq54/dZ7AgsG88zI4n1EYyNTIdZ/rjFd7TSSS0t2ekjqlSnOkiNbhhzNVxISCWzVn
         Yt83W5ROd+MS3V3Ab8kHMYQzWVkLs9z2oq4kytbo2684Uq0BtVsFFNCv5PCet+QTSCzK
         wtwxUf4y37Fd1u02+K9gOVwkX/ZP7oSglnJcPTeHky4EXfRnuNGkRW36as17jVyHsfHa
         o/ng==
X-Gm-Message-State: AFq9FYLQGTLwJ49h4de9JuJebm0iMwrEEEdTgKb7FVJWOlORs685qeOr
	3mL+EE3tsApTozwGyulCsavN/rojHLXSX2zvTX/j7QT02XInOcXvM9iZ/Ta+zgMtqKL6hvoKx0o
	UkAlO
X-Gm-Gg: AYBFou3ODLKwEs0XkFwPPA+kBCST6mp9aMxvNWEn4ybE4i0wQok8LYSC17cIRrDgxp6
	jwJ6TkXgvUEDrTrmhki5p8hthPHU3I2Qbpl3GcZpU/5klvsQv5d3F7OXh36ObrNmeCoeifj+d/1
	9bGCErTxDfHLaAMLzJXa8fhJE1Of4qspKd9bx1TUKTvgitsukd/TnGw100oRqcwYSecD31Ysc9O
	U9Kn7jhzygIvP61UiTFydLx75HFGTx0h5GpRKLXNQMSH/bwEv8HOmPjPbD/A67ReeBB33/RbgFo
	gvhK0wuW+d0fxzat3F1Qt28+ouS1TrR8DUxUrXXJwJDyOvyadaYBH9jitkTbKI7xVunQgmYOfmP
	GhumNcYO1CYAqlhL7RvGLoNR/uZb7I4HvJfRQ6ZNRSMbEUJtqxuP+Bj4z/1Tyr6QVdEhU5jfFnp
	JoFJOR3fAqu8PxJQKpJ3b5Z+uAz/fvCcb9620jnQw7sesaLrYqntWsAKH8+vUYyVdHv8c/fgOZd
	QxpPMUNZuzvRZC5BTgQaVVOBTuOwsIcXZlC3MxQdlwA4q7jWo3y+9FUc00Fd9nHdbk36cxYdXDC
	g4vnrv6SNiiSOrxEQ/i5BesD3k69Lqfyc7k=
X-Received: by 2002:a05:600d:b:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a1fdd1f18dmr78709625e9.32.1792662289474;
        Thu, 22 Oct 2026 02:44:49 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:211e:45da:8a88:2665? ([2a01:cb1c:fcf:4600:211e:45da:8a88:2665])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b29907sm54557935e9.3.2026.10.22.02.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:44:49 -0700 (PDT)
Message-ID: <a07fddc5-20a8-4171-bfd6-f74e472fff47@linaro.org>
Date: Thu, 22 Oct 2026 11:44:47 +0200
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
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
 <20261022-topic-sm8x50-next-hdk-i2s-v5-3-aa1030a75e46@linaro.org>
 <sashiko-outbox-181265@kernel.org>
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
In-Reply-To: <sashiko-outbox-181265@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 11:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] arm64: dts: qcom: HDMI DAI link breaks sound probe with display-card overlay
> --
> 
> commit 1d7b2eb9f1841da26b5c6030ed7671341483661b
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
> 
> This commit adds the primary MI2S DAI link, Q6APM backend DAI clocks, and
> TLMM pin configuration needed to route HDMI audio through the LT9611UXC DSI
> bridge on the SM8650 HDK.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> index 6cb0dc089b17a..eba989e6766bf 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> @@ -218,6 +218,22 @@ platform {
>>   				sound-dai = <&q6apm>;
>>   			};
>>   		};
>> +
>> +		pri-mi2s-dai-link {
>> +			link-name = "HDMI Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&lt9611_codec 0>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
>>   	};
> 
> [Severity: High]
> Does adding pri-mi2s-dai-link unconditionally here cause a sound card probe
> regression when booting with the display-card overlay
> (sm8650-hdk-display-card.dtb or
> sm8650-hdk-display-card-rear-camera-card.dtb)?
> 
> In arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso, both &i2c6 and
> &lt9611_codec are disabled because the DSI lanes are routed to the display
> daughterboard instead of the HDMI bridge:
> 
>      &lt9611_codec {
>              status = "disabled";
>      };
> 
> When that overlay is applied, lt9611_codec never probes or registers its ASoC
> component, but pri-mi2s-dai-link remains enabled under /sound.
> 
> During sound card probe in sc8280xp_platform_probe() -> qcom_snd_parse_of()
> (sound/soc/qcom/common.c), for_each_available_child_of_node_scoped() iterates
> over every available child node of /sound and resolves the codec DAI via
> snd_soc_of_get_dai_link_codecs() -> snd_soc_of_get_dlc() ->
> snd_soc_get_dlc() (sound/soc/soc-core.c):
> 
>      if (codec) {
>              ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
>              if (ret < 0) {
>                      dev_err_probe(dev, ret,
>                                    "%s: codec dai not found\n", link->name);
>                      return ret;
>              }
> 
> Because neither of_parse_phandle_with_args() nor snd_soc_get_dlc() checks
> of_device_is_available() on the target codec node, snd_soc_get_dlc() returns
> -EPROBE_DEFER indefinitely when looking up &lt9611_codec, causing the entire
> sound card probe to defer forever and breaking all audio on the board. (The
> same issue also appears to affect prim-mi2s-dai-link in
> arch/arm64/boot/dts/qcom/sm8550-hdk.dts with
> arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso.)
> 
> Should pri-mi2s-dai-link be given a label so that
> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso can set its status to
> "disabled" alongside &lt9611_codec?
> 
> [ ... ]
> 

Good catch, will fix

Neil
