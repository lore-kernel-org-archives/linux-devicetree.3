Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FADB40D598
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803295; cv=none; b=gIj6HHjEQq9yLVHN0F8N4iuLORgu6wCAcgdCQ75FSfPwJ42GzRnVJWaFVmhke4WXgEaXBYg8w4hMXPomsUWPiFQoyvV9nICQoBqw9QmjIVPQHO5l6kv2uRJ9+3TX8aDBmd7u1jk4Q5z39s5aGuTuDTerMoZzTzw9Pu0XAxUF9KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803295; c=relaxed/simple;
	bh=AdUkbtIAqxriT0988Vf6tLxtOVHSR2uhBSR1D25EYh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7c+uH1MXr2rJl0A/ayqrnBmDqheHJ+V9zedVe4I/9vH8mlYBn15XZKP9Rf2fi/uX6L9Ypt62WnR2olj6wxZARFdj2KpmpmSwr/jdCStIPZElwqslR5weoCf831BEn/58tIgDb/rQeNqWn7VAGBxhrRR2Tr6hO+Zhn21cdltUuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXE/F21R; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXE/F21R"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37de961d1bfso3233813a91.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782803293; x=1783408093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tyLQLQryK7/S92ya5PLfuOu/W+JvCTVmwNrWVc0CbCI=;
        b=UXE/F21Ri3qgrHRL/ksn7PxJhlBcK8MUk8crDfStdxe80Toc5c5+l5ONcvdHgOTyJ7
         WyvaypwJedtdFvqxxkbxs2fJFEJahUytbggBRPvWsYE95lQCLd4rZXplVOjkm7qTJBxG
         gUILXhXnBqWW59tnaYoI9b+oC1VdzRqKF2NzW/pUcPtFhLI1YK5wVhJLkvaRoq7blUsw
         xVTvb8x4lYxs4qivvo6kOjjmituCbaRvmKtTTbTL8lCjMZtBYXox4b39myz/uATEbrkD
         N4TmTW6lBWHmu/eXoqS2hI9wC/r+9ntwuqPgwaykcdIqFZxQyArur4ZOjyyk3Eqx7XQx
         DpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803293; x=1783408093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyLQLQryK7/S92ya5PLfuOu/W+JvCTVmwNrWVc0CbCI=;
        b=eHDn7dMp7/yAyfzGbTC3NwMCQoZ5rrS3zaRBkYXWzA3nJJIkR/tMcOnui2Z4vH85b8
         N3VvnHKYC+65LH7b+6DraaZvSoNAcmYkWXVim3sH9ot2r26bkpE5rqh6jdtZAgB0LViR
         /aaJxJUwqq+Fqu0+esS4jOjthtilt1WFih4Fuuq4TYOHJtlQdRLL3BkCoynxGqZAM6P5
         vJltbZR+ISWKUzqvMLlFgAyysV/iNuY0jHoDZM6uf56ShOy7kh/TsVUCq4JsC0KTNF+O
         s6qF9gi8+zDkqB6baQXWYkwaPVoMVnqk2d2COUH/5E3bViYjWiDVrgiNbUvkK5UNenzN
         7u8w==
X-Forwarded-Encrypted: i=1; AFNElJ9ndOhWgwm+N7QrRPuaEDM6yPG4Bl6ImH8P3P5jm2K+3vXc1tcFWsygpp7o6rJ8Srr2312M71YIaHPE@vger.kernel.org
X-Gm-Message-State: AOJu0YxmuAuVfMwLmraNrg/WTWkPbWiGhbCIpq1Bp/zLUxEq/slQ0qr4
	rxZMDFPzJ7IVV3Ntux7//K4nGguYVYOou/EAY+eyd2Nu05cC0Ry1fqHv
X-Gm-Gg: AfdE7ckqlBGjUUki2BYn+ln1BRCB890r4Tr114sunI9+KN6zcuO+mFWc9B6m62HEBvV
	dkLqoolZnauXRuxqoocfgLIBG6GzX1guS9nItw8L8dyVZCOfIlvT/qZHx7TvuuCO0C6b4iLVWbN
	GBHQN5ssRQC6B7etV6bIjI93vW/5beAzIfkg16+istNmjU1XSC2ILnwd3KWHGoqAaEdXmAvB+Qe
	X1f4mpIIepMqK+8Ivya/XyWY3ZlWFjHBbBrmEdFH2f/bJm3V5qen6eeZn+A/x6GWXZt4MJ/ebqh
	v0ZTvKeS8+AecwmSuq8IkHC7nsyu+bFRbaZh7QWB5epiKEYAE009yF2IDfdk9BbvB0sRRdWPnTr
	oQrcDvlkgRf74IdhFPAFsL+KHwVraJjOus1F2DLM8pbExQKj1lNxYiNd86CsI3N9kLKQV9elNfb
	1q95ALJ5kvCsimtKOGxcDrKwYkypnh6cn7YOMXZ6sOyQEvkpLRrDc2iHR3VsBfYtIXaQ==
X-Received: by 2002:a05:6a20:4393:b0:3bf:c28f:8afd with SMTP id adf61e73a8af0-3bfc5275c9cmr2386643637.31.1782803293270;
        Tue, 30 Jun 2026 00:08:13 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bb9fdbe64sm996296a12.0.2026.06.30.00.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 00:08:12 -0700 (PDT)
Message-ID: <54fd4b86-d978-4f21-8634-292ecbe484ed@gmail.com>
Date: Tue, 30 Jun 2026 15:08:06 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
To: Conor Dooley <conor@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 yclu4@nuvoton.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-2-a0987203069@gmail.com>
 <20260625-bobbing-annotate-d1c4d6874ee2@spud>
 <e3fe23ddbc504879bd797bbaa595d3653fa139ff.camel@iscas.ac.cn>
 <20260626-astrology-mural-853d3860e048@wendy>
 <c0731801729713d35f97bec40ebc21cef31b72b5.camel@iscas.ac.cn>
 <20260626-everybody-epilogue-8fb298a54981@wendy>
 <9456bde5059bea3aac1ed64355e3f017dd9bd3e5.camel@iscas.ac.cn>
 <b3b7a0f8-93a8-4965-a2f3-3ca1552a25d6@gmail.com>
 <80ae28925a67b7bee3b8873db3c113111437e717.camel@iscas.ac.cn>
 <20260629-chevron-awhile-7cf456a768a0@spud>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260629-chevron-awhile-7cf456a768a0@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/29/2026 11:02 PM, Conor Dooley wrote:
> On Mon, Jun 29, 2026 at 01:31:46PM +0800, Icenowy Zheng wrote:
>>>>>>>>>> +
>>>>>>>>>> +        resets:
>>>>>>>>>> +          minItems: 1
>>>>>>>>>> +          maxItems: 1
>>>>>>>>>> +
>>>>>>>>>> +        reset-names:
>>>>>>>>>> +          items:
>>>>>>>>>> +            - const: core
>>>>>>>>> This is just maxItems: 1.
>>>>>>>> Well the implicit rules of DT binding schemas are quite
>>>>>>>> weird...
>>>>>>> I don't think it is that strange, as the binding has
>>>>>>>     reset-names:
>>>>>>>       items:
>>>>>>>         - const: core
>>>>>>>         - const: axi
>>>>>>>         - const: ahb
>>>>>> Ah does the list constraint the order of items? If it
>>>>>> constrains
>>>>>> the
>>>>> It does, yes.
>>>>> Alternatively, using an enum permits free ordering.
>>>> Ah in this case this should be converted to an enum, I think.
>>>>
>>>> Should I send a patch for converting it?
>>>>
>>>> Thanks,
>>>> Icenowy
>>> Thank you all for the detailed review and discussion, it really
>>> helped
>>> clarify the right approach.
>>>
>>> Since I will supply all four clocks with the same phandle for
>>> core/axi/ahb,
>>> and only one reset "core" for MA35D1, the ordering constraint in the
>>> `items` list is not a problem, "core" is already the first entry.
>>> There
>>> is no need to convert to an enum.
>>>
>>> Regarding the clock situation for the MA35D1: I agree with supplying
>>> all
>>> four clocks (core, axi, ahb, pix0) in the devicetree, even though the
>>> MA35D1 clock controller gates core/axi/ahb with a single bit. The DT
>>> will
>>> use the same clock phandle for core, axi, and ahb:
>>>
>>>     clocks = <&clk X>, <&clk X>, <&clk X>, <&pix_clk Y>;
>>>     clock-names = "core", "axi", "ahb", "pix0";
>>>
>>> This correctly models the hardware topology. Since all three names
>> No, this doesn't correctly model the hardware topology -- this will
>> lead to clk_get_rate() return the rate of DC core clock when checking
>> the AXI clock rate, which is problematic because both clocks are
>> limiting the performance of the DC.
You are right. The current MA35D1 clock driver does not correctly reflect
the real AXI/AHB clock rates, and I think it needs a more comprehensive
review and rework. I will address this in a separate clock driver patch
series in the future.

For this DRM patch series, the AXI and AHB clocks are shared system bus
clocks fixed by the SoC clock tree and are not managed by the display
driver. The driver does not query their frequencies for mode validation
or bandwidth decisions. Therefore, driver correctness is independent of
the reported AXI/AHB clock rates, meaning it will remain unaffected when
the clock driver is later reworked.
>>> resolve
>>> to the same underlying clock node, the CCF's standard enable
>>> refcounting
>>> handles the shared gate correctly without any custom implementation
>>> needed.
>>> I will also revert the change in patch 4/7 that made axi and ahb
>>> clocks
>>> optional, since they will now always be provided in the devicetree.
>>>
>>> Regarding moving `resets` and `reset-names` to the top-level
>>> `required:`,
>>> I will wait for Icenowy's patch to land before sending v6 to avoid
>>> duplicating the work.
>> The patch is sent.
Got it.
>>> In v6 I will update patch 1/7 with:
>>> - Update the subject to "dt-bindings: display: verisilicon,dc: add
>>>     support for nuvoton,ma35d1-dcu"
>>> - Lower `clocks`/`clock-names` `minItems` to 4 at the top level
>>> - Remove the `thead,th1520-dc8200` conditional block entirely
>> I think this conditional block will still be needed, because it will
>> need to constrain the minItems to ensure all clocks / resets are
>> populated.
> Correct. When the outer constraints are relaxed to deal with the new
> device the conditional block for the th1520 becomes required. Or having
> an else, but if all devices are likely to be different in terms of
> configuration specific conditional blocks is better.
Understood. I will keep the `thead,th1520-dc8200` conditional block.
