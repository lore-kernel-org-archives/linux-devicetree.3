Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CED336DA1B
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164118; cv=none; b=cODRLAZsf4R8n2FV3C4MA1nLsCBkrGtS6s18J7wcZbrjzcKRQkLnVtIjXNf0HrUSIngH31VOADTDKvwnh4SJhnOzO3gkzZkNe+6ZL9LMoqRnDUglY0GIV2fJ+CctEJeBLEim6ZNhL3aiHpn5PqCke0jPf/kvvs6CLbDjJup98eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164118; c=relaxed/simple;
	bh=8yu20Ma9s1WIvlVrAU4fqX0rWRixAxYe7co/fckb0bA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7RUI6jqoNvth/E8nwUyl7mqkqTOmGSVeZcmnwQ85LbqmXYYpwho5MYZJYvmC3MLW/vR7TrZn0HG3mPjV5J6GvWN6vKCKEDg/fO8j3RyyvIxsNm93i9I3VEl8zTC8R9MUEoOHwUT5dCVzlXgx3TFa5dX1axdTSq/SKwPBZThuJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LnPQ61Rx; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LnPQ61Rx"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-396718028bfso7309791fa.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 00:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781164115; x=1781768915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZcNR5v4/Eh8a44MseTXa3O5j0AC/9aZ3E3LNfBSyTU=;
        b=LnPQ61RxXY+eEap7RCIvLhicDV/eAj/JCLhXYP0od4adCDalutdVBeXdtsYc9KW0eh
         3U2Xi6v5WNJ0HWhStZRq9sZD09fl3xGH3L5L0U3fsa8IjpVsf2Xjv0Ty4wt/1ZQQ+ENG
         JsA8qTa0H6+18nv8pL+HFVEPUR7r2Ywty9S44V1JYf8Ijm//PRXhht/XLAs9PWdb4ZRC
         ds4vj+wYUKFanPr4KEahAvdsMjLyEeB5ZJQbLx2ODm/lYySPaiHJMbbUZbnmMlQxga2q
         Su2dYXCC/+Z0ztFYZqA77+OIQ2XoESu6bqsJTz5bwQDLjks+m7OCXhTz3Cmcdvcyk2Jy
         TgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164115; x=1781768915;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZcNR5v4/Eh8a44MseTXa3O5j0AC/9aZ3E3LNfBSyTU=;
        b=HGXZEfanA5oq7vtdcGMdWnz7rQ7Yz9s/z0XVG1x4Z5lzktV1nbaFHA8/97R3PJbdUd
         qtrQMc+rCRCJZQhW0L08k8Ct0/dHORMHZql4zc86YT4Kicd6eLo/jGAb3IYQIX8LKI1O
         d7GH5Bbq9+e72V/TKzcRP2mcoF3PP2NXZOIasMs7gjiKGQ25nMIw4Q7Qxp5wbxfxS818
         1gw2/xnG2SfNukAVvHXi0W8Bf9ltEIszBrxE+7IPpIllYnEQmk7WP1SWujTiYl4Cfun7
         TffVAR/AwUomDMuHVZjx5ICYykmUIpoeN92axZlx+7A7G7mehIuQCcL07uCehqG8Xhnu
         uLmw==
X-Forwarded-Encrypted: i=1; AFNElJ+LoI9thHLY9RAC4peCWT9BuxEjEtOSsVm/8O20YQ/jU8XcalYwoCDvJC/qI8FvqstKwOTPDpkm5FyN@vger.kernel.org
X-Gm-Message-State: AOJu0Yylz4sYytMt+JS1t3SG8QKDnl+3QbpNj1C9JDKwEjXf+9PfHP0+
	AqcR2uUtU7pjOjt05BjZq17fYIhHTwwhYmoAscZfa5gYEx106hIKpHuHRrlhyKLVfKQ=
X-Gm-Gg: Acq92OFPcgLIA9PfZIiSGyhkoJ3u1BZM2WqNhgpjWdqGfrAWVue36UTaAKSwkAu+6x2
	16+G8b2g5qGd6hgQqQMvcmQpZIPTRM6AnkgXty5b68GQP15YGvkLc70CVVoIRXFHNQfsmndacVS
	iNUT+BgCLHYZrRqca7jKXIEs9HAC3W6a+VhbrvfObhT6GREBPruzKPeDv+eZL/728bUo6N6GzP4
	nAwF8MlCxbE87qGWMcMWmxgKISEgNGUxM3dY8weaZ8VIkuVZpE4q2kajyDRPZgrbo7kJCzovgu+
	FrG5wZaAr8SDGYMZpzhP2EO518VFcZCS2CY2LZiVp8rhG2Ap/SuumhqfsEJMpm5r5DDHFLm6VwY
	LK7lrXjB7y2qfI5DwIHVev05auErev+lw7gakqvYXsgWcy8Jq4oUrdpDXU+FAkXoBFxU73YFLbJ
	SVFrEV2cM9FbkpnNWRCWrRwn2D31K8eOOizdFmsskmG8wIwdyKX4dwb5/Q0diIDn3XfQOcmjUfr
	bWqDzXNKfQkZYa4
X-Received: by 2002:a2e:a911:0:b0:396:8491:3135 with SMTP id 38308e7fff4ca-39919fb762emr1851881fa.1.1781164115468;
        Thu, 11 Jun 2026 00:48:35 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3991ad7af8csm2429681fa.21.2026.06.11.00.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:48:34 -0700 (PDT)
Message-ID: <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org>
Date: Thu, 11 Jun 2026 10:48:34 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: William Bright <william.bright@imd-tec.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ram Boukobza <ram@imd-tec.com>, Tendai Makumire <tendai.makumire@imd-tec.com>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
 <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
 <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/26 12:59, William Bright wrote:
> On Wed, Jun 10, 2026 at 11:21:53AM +0300, Vladimir Zapolskiy wrote:
>> FWIW due to https://www.nxp.com/docs/en/data-sheet/IW416.pdf "10.7.1 VIO_SD
>> DC characteristics" SDR104 speed mode is not supported by the module, thus
>> the selection of the SDR50 speed mode on the host side sounds to be correct
>> in your case.
>>
>> In SDR50 speed mode gcc_sdcc4_apps_clk clock frequency should be exactly
>> 100MHz, and since it differs, it has an impact during the tuning phase.
>>
>> Definitely clk/qcom/gcc-sm8550.c says that the maximum supported frequency
>> is 75MHz, the same is found in the downstream v5.15 kernel:
>>
>> static const struct freq_tbl ftbl_gcc_sdcc4_apps_clk_src[] = {
>>          F(400000, P_BI_TCXO, 12, 1, 4),
>>          F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
>>          F(37500000, P_GCC_GPLL0_OUT_EVEN, 8, 0, 0),
>>          F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
>>          { }
>> };
>>
>> Can you dump CAPS1 register value of SM8550 SDHC4? What does it say about
>> SDR50 mode support and need for SDR50 mode tuning?
>>
>> -- 
>> Best wishes,
>> Vladimir
> CAPS0 and CAPS1 are below:
>    sdhci_msm 8844000.mmc: CAPS0: 0x3029c8b2 CAPS1: 0x0000a08b
> For CAPS1:
>    Bit 0 (SDR50 support) = 1
>    Bit 13 (Use Tuning for SDR50) = 1
> It looks to report that SDR50 is supported with tuning required.
> 

Looks like the SDHC driver behaves expectedly then. For me it's hard to say
what may be the rootcause, I believe the lower bus frequency should be fine,
so it sounds like a hardware issue, but could it be PCB/board specific one?

If you find a chance to copy the SDHC driver (and its small dependencies)
from Android and test it on your board, and if it also fails, then it might
be well concluded that something is wrong with hardware, still it won't be
quite convincing that the SoC SDHC is to blame here.

Hope it helps.

-- 
Best wishes,
Vladimir
