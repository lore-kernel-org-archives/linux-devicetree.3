Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED44D38B12B
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781873988; cv=none; b=fJJTLNfQeOT+L5oEE068we5wL7Hr4OUlOKld3FVJXl2apDNjB6r7+5N2HaEH/8wRvwAXhwVuYp34BzQZk/KjuFqPTdmbqWMr0LF1XwXuqWUyaIt8N/fqUaFUmkyImATv3cGq1kwZulVvcowp04HrxLvgTue/AibyWCOd0UxvHZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781873988; c=relaxed/simple;
	bh=B5pCpCW3fPa2uQlAQe2jred8xTwAmDOhSnaUI3XNfYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZZTl7yy98RA4MEe6nDB1UiHATIVh4l4RtY5URzYeA9DBTFPYn7684fbdlF3M5LSiW9ITHn87bRP44qpzGEhLHRh4nm7GQSs3tvjirZxpnaJMZSgCH4pQENFVvlQs3sCLnoAUDh0y6bPJDVFxIzXvAOEMPndycmlZX4x0hD5ijw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJTOifDt; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJTOifDt"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39980866fcaso1557571fa.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781873984; x=1782478784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNXNfs7OoHqiz3UZ4G1yzyr8/Xuq38knH16nIszO0oc=;
        b=SJTOifDtEPMABEmTi/2y24pCu17o24gHAvA8A1e+kpCbDzm+0nNIRns+gxXk/W/LMI
         1qaI72vE/xCi7foFsal8R0i7AQBb4hp0xjW/q8dInmDCsn5Bgui2Q0JBftQChds8AcXK
         Os3VZrPPtHE1n9jLljiG7Gm7P9Npy0eVDNB0Kief3zKOIP/0lPy0ZX2F2HQbXH0A6LI/
         5oqzEdNsCDDgi8Xbl/a811WZDj0rUer1ilgSF2czVHMnNXC/KbeMIynQUYLRuuw7ULBR
         kboG/O+Jk4FfEDIGljQzYg3TNXDTkHN1uqo1fxq8IseOMm8h9ja7XUlnB0XGEOTMdktm
         3LNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781873984; x=1782478784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNXNfs7OoHqiz3UZ4G1yzyr8/Xuq38knH16nIszO0oc=;
        b=NlStdf7loQDmcgh3UJfUtppdEQA/WYhirq401pucN3jeldp1qjHcGxwtLUySckC1iL
         V4FVSDpOIUf/lnR7+PlrslouRS18z/6OVWOTpCSBJTGI5BVu9x8AApWoKjXfMTy6BseM
         7zl2RipqJN7rU9u/+u+zvuxAknOUUC25B9FpsdMkNfNUao3SIq64Ze4tpu34yTfro5YW
         Uj5HlF8HMEBAp2SUBrHBUbKXNbk9lDDOFwrWZHJcWY4bFnJdKYafgAPCKUiNnuKAd4UR
         9ZKpDu/QAyJpZQcgjpRUEqcx/0UN9950SSwVwiv0KFjxFEw7njmgvI5TNvME2lYae2NI
         PUcg==
X-Forwarded-Encrypted: i=1; AFNElJ/LbGBpFVLWeKuL/zMWnvH+ggxnpn03Dbr0MH8+5GVKtEADIFNZr1oPzGIWwtHbzP1vna7mCvlORulz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Tu1zXofzJil4ltvJnMn1h+AQAKaWjsQZHbTXbXAGeD0dybKV
	Rc6C8QuXEbqzxa6ajjI/xABtY9RFxTaCGyRL9uPzr9gcN4bBF57qrUEsxV886fprX+s=
X-Gm-Gg: AfdE7claorOsIhat28xXO0L4fMT/FZXq93R+jMVpzfn1FgeIdFXNNzWB3RMntKoFexv
	TMa0uxv6jNz0hZ8uIYAJF+liqdcdzBShBiM3zyQtHZchVLAiBVVmlY0C44lu2I1PgnxZ9jGDfT1
	BvkrMb4U/T9+ot4dwcKHW2QroFAmGWzxDBScGXihXWn2prUnDM1+mDe0J96xL0ixdFvZuQZOnP5
	j1jXzQv0BzNlIpRLp5KfSpHWJKQOc1oiFb6pt/P2rhcGRo41RqQv9RwDj4S+kgY9/2XppWjzfTN
	vJbkQTwIl0KO7wd/YJaeUQ/H28LVnQlnyyEMOhX8+dbINhNHDFNfmj7SUXgbxpeuz20sb/n7vif
	DvUaOcWcuSCLmGprJ0XklmtEClfrqAe9+AhdyoPVk7gTlSKFedHzEG5xC21qyTYxg3hHvwPMkVd
	5C3br5Erap8tOCFUav4HEGkFI4R9bNAdI3yE9HhY6VMUWDl5tSvDww049BOwFTqh06ydp/5L/tt
	FLmZg==
X-Received: by 2002:a05:651c:19a7:b0:393:9d8c:73d2 with SMTP id 38308e7fff4ca-39996b0af9emr606311fa.7.1781873984104;
        Fri, 19 Jun 2026 05:59:44 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3998bfeb6edsm4502291fa.19.2026.06.19.05.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:59:36 -0700 (PDT)
Message-ID: <12a89ab8-dc43-4b55-9c95-36d44c75dcab@linaro.org>
Date: Fri, 19 Jun 2026 15:59:35 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
 <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
 <CAH2e8h7aGiF1g_LgG4WxEj1eGbUp-T_U-yZVpoHgU8FsMOrWTg@mail.gmail.com>
 <423b4e86-3837-4d69-8f56-d8259be53ff5@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <423b4e86-3837-4d69-8f56-d8259be53ff5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/19/26 15:35, Konrad Dybcio wrote:
> On 6/11/26 7:29 AM, Pengyu Luo wrote:
>> On Tue, Jun 9, 2026 at 8:17 PM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 6/7/26 6:04 PM, Pengyu Luo wrote:
>>>> Define pinctrl definitions to enable camera master clocks on sc8280xp.
>>>>
>>>> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
>>>>   1 file changed, 56 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>> index a2bd6b10e475..0dbcd3069a3b 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>> @@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
>>>>                        gpio-ranges = <&tlmm 0 0 230>;
>>>>                        wakeup-parent = <&pdc>;
>>>>
>>>> +                     cam_mclk0_default: cam-mclk0-default-state {
>>>> +                             pins = "gpio119";
>>>> +                             function = "cam_mclk";
>>>> +                             drive-strength = <6>;
>>>
>>> Other platforms set this to 2 by default.
>>>
>>> What's the value set on Windows when the camera is in use?
>>>
>>
>> It is 6mA.
>>
>> Let us get ctl_reg first on Windows
>>
>> lkd> !dd f111000 L8
>> # f111000 00000284 00000002 000000e2 00000000
>> # f111010 00000001 00000801 00000000 00000000
>>
>> ctl_reg => 0x284
>>
>> in msm_gpio_dbg_show_one()
>> ...
>> drive = (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 == 2
>> ...
>> seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 == 6;
>> ...
>>
>> x13s should be the same as gaokun3 in this part.
> 
> I confirmed as much and I'm willing to believe this is a default for
> all 8280 devices
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> for the second patch, please mention in the commit message that the value
> will now match windows and please add a fixes tag
> 

I believe the second change cannot be tagged as Fixes in sense that it
strictly depends on a not going to be backported non-fix commit, and thus
backporting of just 2/2 change as is will break the matter. Reordering of
the commits placing the fix commit as the first one should be fine though.

-- 
Best wishes,
Vladimir
