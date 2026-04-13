Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9D93B19C1
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776072289; cv=none; b=Oq/yfTODtI1TvFi3VEJUTKctS29JQ7TudiLatvUOlR6+13Vzhp7Iiz2Tu4hi42L3aqSZf+YE0HEnQ6JC9ptBDmTxC75D09+M/QlClczE4xlRgSSEkHl9GbODdenqseYyZ7JtWH2uatEh7/e5PAhe9PppF9DsFIlyIZOM3hg2Edk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776072289; c=relaxed/simple;
	bh=a20GCVEICRer0YqKfRCtAzVvD7mYgtgR92L5iy72zJs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K+nMJQchcDygHSEpNpOho1a9df5FBncAZ3bJBi3DAq/GgNjh6Grl09AAHX2K0BI5AQgXIp56akH9gclYfsCB4hf1Q5mM89oqqeipI3raKl0cpkCGT6PbFEodKz+uq/Nm8lV7T0Ncip6LNgtZSn93+Y8LmuvcLocj9DJa4J1REw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hxQLChOB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hxQLChOB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a29e6110so45624355e9.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 02:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776072287; x=1776677087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++gWQ1SwhCFjmBGRgz/y7dJIShpHiYWMcQltdeeVLx4=;
        b=hxQLChOBDEEYekNgdOsJ172JV72/EtbbB/Em8JcqP/uDA3pYXRjCNadTSClNjoaAsE
         ayHbLYdY50E0XHT0RtjEnGJCf5D93++VffvI4k9PHb7EEPhRsXjScTGzf/CRFWGKDDUe
         hbH/uFIhoVJnLI101xhn5tl1tTOHXFt2NZhu+7hNTbbd11vCcKkPPEsxRNZtZZtrWWsT
         cuDOOii6Sl14dykefljLkDtDoacsW9eHbn/kxs+Juve5KxaJL9u/b39TrK0UKm77fPUQ
         inG5gJPT+DNr1lyc7MF3Iv8LdLfY81Ui+CO3Em/osz6dFjPNzwLyyBZwom3zfE1tjuhL
         qgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776072287; x=1776677087;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++gWQ1SwhCFjmBGRgz/y7dJIShpHiYWMcQltdeeVLx4=;
        b=g23jqCxeiyWUMe2xbtO/LMwxP6yUoxbZ6oBRurqScO9MvvTk0wyuwWpbKr2LSSV0xW
         NE1nn68n6thvuOI49rOHl1ggkfz0OkhwMjtUzsbKWLGn4eBCSrtpLoJ2hSPvAc+lye+M
         uOCKvRAopdnV2+ki34f61NEH1Ts6uvABc15BySinvpVYelsIanKLCs4X/57BDA/I0ebB
         wPJctufA25MEG6xqhOJsynhTCDwZndJkB5Mjarp5ORJfV+56UDuQzssy1iMXmt39HJLo
         GThbxf1u0Dn5i2/Dq4iGEolGOuiNpOgnEhFVpJ+nDkV7fqMbvANjJtlUIZ6jojUJymo3
         IoDw==
X-Gm-Message-State: AOJu0YyRtKAarLoefu5mZb87GrJHmHV0rrGcNVbHKUk67FCfdnEZjK5B
	9ph4xyF+t4YksSikvq4KDC+G6gbNb5YjmAfT8fc9pbyHFP8dKaO5iAtxC5/6xdfUYeg=
X-Gm-Gg: AeBDieuMb/TlGgj02t5/7lNsoamtM7rdkGjc53njWdcDxtpYeUkc5GybKbkqZAx3Urv
	Nw3GAB76PHA+Eg9PXCTfiA7LG7sA2LHGezqCDSOM9vwXzVvRA/l8eLWAUZd7SBE4U66jcFC9Bpg
	HfpY1BNQpewCXlQ76QqqU+AEjAzm76TX9qPH+RdHXZ6rnWgSdmq6xuffRgWLOTpDiRKf3bUwyZg
	PVg3dzFy0ZmhZz3K+oEmAA8JTiU4uHooOA7eMDXSb/XCcWWwB1j+M1EiUOFxlVrdjNSOWELAgHe
	nczeVH0wmtwXvUmfVobJAfCXpp8Buvff9pleyY2NXy1P+M+eJSdlcDQ6UNmP7r0n/8cBkbBuOgo
	4rcUM+l37gwNH2ruQOooMbSGk6hboy0/oR05pd5/TI4MnXm1zVRezJfEUpZDWUC3x/+xbdX5pD/
	r/jZiTP7CWqO8z6nC9ydAHjCstzSyzFWFJ+mVmmN1pG7YaO8MiEBN/I5cMnCvZcojS7YqjvlQqp
	MsoRZKv
X-Received: by 2002:a05:600c:5292:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-488d67fa48emr177471465e9.9.1776072286480;
        Mon, 13 Apr 2026 02:24:46 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm373689155e9.3.2026.04.13.02.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:24:46 -0700 (PDT)
Message-ID: <3a08bb84-b313-4b3b-bb61-1b686226e902@linaro.org>
Date: Mon, 13 Apr 2026 11:24:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] soc: amlogic: clk-measure: Add A1 and T7 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20260410100329.3167482-1-jian.hu@amlogic.com>
 <20260410100329.3167482-3-jian.hu@amlogic.com>
 <9a4f69e7-838a-4992-af1d-46324e14eb48@kernel.org>
 <274d2abd-05b9-4dbd-b962-ff70044b8d07@amlogic.com>
 <b0d81181-d4a4-4c03-8c26-c7f6e8cde70f@kernel.org>
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
In-Reply-To: <b0d81181-d4a4-4c03-8c26-c7f6e8cde70f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/13/26 11:10, Krzysztof Kozlowski wrote:
> On 13/04/2026 10:21, Jian Hu wrote:
>>
>> On 4/12/2026 5:55 PM, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On 10/04/2026 12:03, Jian Hu wrote:
>>>> Add support for the A1 and T7 SoC family in amlogic clk measure.
>>>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> ---
>>>>    drivers/soc/amlogic/meson-clk-measure.c | 272 ++++++++++++++++++++++++
>>>>    1 file changed, 272 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
>>>> index d862e30a244e..083524671b76 100644
>>>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>>>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
>>>> @@ -787,6 +787,258 @@ static const struct meson_msr_id clk_msr_s4[] = {
>>>>
>>>>    };
>>>>
>>>> +static struct meson_msr_id clk_msr_a1[] = {
>>> And existing code uses what sort of array? Seems you send us obsolete or
>>> downstream code.
>>
>>
>> Thanks for your review.
>>
>>
>> I have checked the previous Amlogic SoC's commits. Such as Amlogic AXG,
>> G12A, C3, S4.
>>
>> The clk_msr_xx entry is added after last SoC's array, sorted by
>> submissin date rather than alphabetical order.
>>
>> So I place A1 and T7 after S4 accordingly.
>>
>>
>> The A1 clock controller driver was already supported in
>> https://lore.kernel.org/all/20230523135351.19133-7-ddrokosov@sberdevices.ru/
>>
>> It is also present in the mainline kernel:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/Kconfig#n113
>>
>>
>> This clock measure IP is used to measure the internal clock paths
>> frequencies,  and A1 clock controller driver was supported.
>>
>> Since the corresponding clock measure driver does not support A1 yet, So
>> add A1 clk msr here.
> 
> No, what qualifiers or keywords are used for existing arrays? IOW,
> please investigate and understand why you are doing this very different
> than existing code. Maybe because you sent us downstream, so you
> replicated all other downstream issues.

I see, the existing uses "static const struct".

Jian, could to switch to that please ?

Neil

> 
> Best regards,
> Krzysztof

