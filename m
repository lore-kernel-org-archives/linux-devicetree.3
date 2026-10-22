Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662279;
	b=I4tBne2DwyZKaHpKfLs3GoNPBUf1LYw0hRd1wSYUGbJIBE06FxmQxs+rTACe1PvF1Djy
	 TgZDcbbIVTm2E+KJJ4V67XT9QTAjt2PF1VyrqFjt64BxP0sA6Tv2LW2DkXLTJK+Z8Grp/
	 5u/25Q/y4aEVUIBon7z0IU5F4uoGkh9uShiOzzHJ4Uz0zldvE6WdYlqFKpgghVWe28VXk
	 6Czq0SshtHiSSNLCeax48rKOY756qEGVfPOm702HsbsL6K4rRhfyovFOZ6g6u/N6/g5lZ
	 qDAWG7UURlwp+Q6AbMv82+7DXjhKcFBtfe1cCNM8NqLXhmEKuSIraCEEAsQi4kb7AjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=D2K7zZ8vA27g3Bom8qpakpX6z92oPkrZ5BShXGJhQXI=;
	b=iVyabn+OaVpoiZNMAxs8fIKenFaVH8QQ20wcUmvPbWkAtrS47SntvtGmeWaZgKf6gEWP
	 Npv8rJYG8jXF+33XhTOgjpdhAamq8Cpl8CYQzNcBohvT/5jowdVwRJXfN+f5g8BEFsYnX
	 83ZDm9E7LZugrg1vWZBMFSoVdrJKzrawKfKS3HNNS8t4Es6fwFmNzLjGqm2q+fotja7T3
	 YIH80+8kH3bnlK1s1VH15L6c/lFU7CfZdhAYjPxkr9hvTJQQfEovV0Vm/frCVjwMbHWRq
	 4X66JhVhaaFMqjQzCdFjESxPWTtsnX7m2zwx1AK2X80B0ZBhqlGykduC7ryt8iX233w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eEY3fE+e;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12C7606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D12C7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eEY3fE+e
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b001cd92bso923156f8f.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792662277; x=1793267077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D2K7zZ8vA27g3Bom8qpakpX6z92oPkrZ5BShXGJhQXI=;
        b=eEY3fE+eLFCPOIZekJJz7dwvc77KWzXT1pNqVvk1QFhvPqbNk1p/E84KK9c5pwMgua
         W3z+OurMgVEU/Lic660LLiCh5pejbI/tYNOSRTrupkcE4xrRP0RgmroK4e8PwvXrl840
         gmyNp2oaiji64HxxmfTHwvprffCpUJQNgczEK+MVxH9PpfA0fzRSCsM+v0DxPQ+X1zxT
         UBK/SbIE04/9jSss6ozwgKuXKoicX1D/DeymI7FYtXYgv2tqc9J4CJSYS1cbUNO8apHF
         UVhacJMjL8IsCmtmxxcTlZdh7qiwioFlO/j3FWi4sCrEGybK5MkgBrUZBpmcOyAm1XAF
         nxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662277; x=1793267077;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D2K7zZ8vA27g3Bom8qpakpX6z92oPkrZ5BShXGJhQXI=;
        b=adc7QRDN6XA04ptrFnRinxI2YmMqF5XmaiNOt/dcF+o5HktX35vI2efvQLH+aP3kJn
         jbFA2qvg4laBgv1N5TfJE8ta4nTpFq75lUrFD6vklVAp1evCnuWqQ5YnttQHlldyzS9Z
         XxnFqAlebTt2vSpRlQm7d8kWKg3n23Z/sAB7WeGWSA1GcklmYOK5A4q0gPZfbk+1O8AG
         N3ymwYUeZ/y7v5N5NG36lXtrY6yUQDP687jlrAAtpqrgWAiCc/Gd1X0J0/WZtSnqNiyW
         s75w6yWVEs+OoHQd+8WK0Yg2nsaN+F0oY3aIpep2AVLzhF4E+krdGqwI9CIF+Y/6tK2s
         43QA==
X-Gm-Message-State: AFq9FYLfib7n0CxU9JBwdYJp3nH1Qy3PF6vFnOgXGNwPeJ1YNhp5Fc16
	kBY6j3TxROodjbeX6/sgsEi7cfrDJIPgXg6r1lcAzDEEiOfMrLeLt7l+oYa0fzZeW16Z6mUTuj+
	ublvx
X-Gm-Gg: AYBFou22Tsqmi+lypgPSHpWrzMXQXWbyMvKHWiVnyXzz+F+XBhLI/8PuK5N5Y6r/O1e
	VshGB1qRUOt9+BTNuebapFw6CMLuP0QjJROEj85RrGqoavXDgOtU9Gyt4Qg+nStRyKBElgdX3Ik
	9s88ahV+r3dLLNt78/ubzbJkjI882tSfnTEuM46KDp2v/egNz0TZ3OxsxCmXTB+xAvCq+3kEX3C
	d97nSQ8cHKlyPuy67eiGsZC7Mv955GRwOxA8o6G1YDpgSKowK8dzYzcyIFIbSFgPcJHMf0Wanpp
	PfrRU6C5DlNzi2d/zhifjPrLpqJ9vg9/SRF6ZuFi8gb37R20tkPyPBwHCRGCKXN4PPwyWMZeIYx
	yFZ9muPSms7f4V3o4TxnGwljd0qV5gmkn6ADV6k9XiXQ1QEQNqixl6aDpC2wJevAXxHX0vPoofP
	KL7PUsWYQQcGUxMdJshvHxRkj+vxp6/iSx3mKbOKq3r2dL6gZtbTBrr0yTZrMbvGEpKnZQ8hX2q
	yIbpvHbxl93Tsfj0WrqAxmLZOFL/GzTPELQUvLgt5WkZ6KbjcnzfvEmvhPNqhESMvjx/36FBuC1
	HvnbnlIa3tgLWPDiy1TzP8vBxtENpjQjUTg=
X-Received: by 2002:a05:6000:1184:b0:488:8384:c382 with SMTP id ffacd0b85a97d-48e264de064mr7320656f8f.49.1792662277127;
        Thu, 22 Oct 2026 02:44:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:211e:45da:8a88:2665? ([2a01:cb1c:fcf:4600:211e:45da:8a88:2665])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583f25asm11006187f8f.45.2026.10.22.02.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:44:36 -0700 (PDT)
Message-ID: <5bf81f06-6a19-4ce7-bda8-937d3159a2ad@linaro.org>
Date: Thu, 22 Oct 2026 11:44:36 +0200
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
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
 <20261022-topic-sm8x50-next-hdk-i2s-v5-2-aa1030a75e46@linaro.org>
 <sashiko-outbox-181264@kernel.org>
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
In-Reply-To: <sashiko-outbox-181264@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 11:32, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] arm64: dts: qcom: sm8550-hdk: active HDMI DAI link breaks display-card audio
> --
> 
> commit c6bfa3ecf122e125408eec9949d0c3f7b965b70b
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
> 
> This commit adds I2S and audio MCLK pinctrl states to sm8550.dtsi and
> configures the PRIMARY_MI2S_RX backend DAI and HDMI playback DAI link on
> sm8550-hdk.dts to output audio via the LT9611UXC DSI-to-HDMI bridge.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> index e75e3b878e89e..6c09816983a23 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> @@ -278,6 +278,22 @@ platform {
>>   				sound-dai = <&q6apm>;
>>   			};
>>   		};
>> +
>> +		prim-mi2s-dai-link {
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
> [Severity: Medium]
> Will leaving prim-mi2s-dai-link enabled when the display card overlay is
> applied prevent the sound card from probing on sm8550-hdk-display-card.dtb
> and sm8550-hdk-display-card-rear-camera-card.dtb?
> 
> In arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso, the LT9611UXC
> bridge is disabled because DSI0 is routed to the display card panel instead:
> 
>      &lt9611_codec {
>              status = "disabled";
>      };
> 
> When the sound card probes via sc8280xp_platform_probe() ->
> qcom_snd_parse_of() in sound/soc/qcom/common.c, it iterates over all
> available child nodes of /sound and resolves each codec phandle:
> 
>      qcom_snd_parse_of()
>        for_each_available_child_of_node_scoped(dev->of_node, np)
>          snd_soc_of_get_dai_link_codecs()
>            snd_soc_of_get_dlc()
>              snd_soc_get_dlc()
> 
> In sound/soc/soc-core.c:snd_soc_get_dlc(), the lookup checks registered
> components without checking whether args->np is disabled in DT:
> 
>      int snd_soc_get_dlc(const struct of_phandle_args *args,
>                          struct snd_soc_dai_link_component *dlc)
>      {
>              struct snd_soc_component *pos;
>              int ret = -EPROBE_DEFER;
>              guard(mutex)(&client_mutex);
> 
>              for_each_component(pos) {
>                      struct device_node *component_of_node =
>                              snd_soc_component_to_node(pos);
> 
>                      if (component_of_node != args->np || !pos->num_dai)
>                              continue;
> 
> Because lt9611_codec is disabled by the overlay, its component is never
> registered, causing snd_soc_get_dlc() and qcom_snd_parse_of() to return
> -EPROBE_DEFER indefinitely and breaking all board audio when the display
> card overlay is used.
> 
> Should prim-mi2s-dai-link be given a label in sm8550-hdk.dts and disabled
> in sm8550-hdk-display-card.dtso alongside lt9611_codec?
> 

Good catch, will fix

Neil
