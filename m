Received: from mail-m1973191.qiye.163.com (mail-m1973191.qiye.163.com [220.197.31.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB3A1FE44A;
	Mon, 23 Mar 2026 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259982; cv=none; b=XjCOViNRBfZjwynLpWGG672229Uj/Jp3C4sdmMHnhb1+nu6TfsnA7sFV3GoswBIrqmb+aC6z8l31TfZKCgFxixMWXErwybj3Bn6D79XSqX7yad1PDC/0M3M5oo89b2cHmUBDMYYaMJt3X0PLNJ5v5af2lOK4pxgEAf2SinxnC6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259982; c=relaxed/simple;
	bh=Ry8iFfSmPrCCYBYZESemNcNTwzBT+eLPC8d0/oGAxNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y91Hn2emBiX1MX9BvMa5Q+7xxrG5xCf+vgnutFnpN8hX/RpKml3Wjv5MyG1da6XQZOUa1KSu+tL3Ok+CCys5ueY4Akua1quL13tpOiSWcBu8SCYmYWGTqw/f1WXI8Vp0moG493urNMB8S75RndyAIGG7V0LCgWABoa+49tOMu5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=QaDPqk5+; arc=none smtp.client-ip=220.197.31.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="QaDPqk5+"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37f125092;
	Mon, 23 Mar 2026 17:59:11 +0800 (GMT+08:00)
Message-ID: <c349eaf2-5852-4bb6-9dac-f7240e1c8098@rock-chips.com>
Date: Mon, 23 Mar 2026 17:59:11 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: display: rockchip: analogix-dp:
 Expand clock-names "hclk" for the third clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 alchark@gmail.com, cristian.ciocaltea@collabora.com,
 sebastian.reichel@collabora.com, kever.yang@rock-chips.com,
 heiko.stuebner@cherry.de, tomeu@tomeuvizoso.net, amadeus@jmu.edu.cn,
 michael.riesch@collabora.com, didi.debian@cknow.org,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260319104031.1986946-1-damon.ding@rock-chips.com>
 <20260319104031.1986946-2-damon.ding@rock-chips.com>
 <20260320-amusing-magnetic-harrier-20cc40@quoll>
 <6bf2b3c9-4af0-4c3a-a34f-ebe881d4827b@rock-chips.com>
 <904ad60f-82d6-4ad9-baa1-4d5196c57c76@kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <904ad60f-82d6-4ad9-baa1-4d5196c57c76@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d1a22577503a3kunm5765aa83592746
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx9CHlZLHklLQxpDGkwYGU5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=QaDPqk5+K33rWGC+Sk5tDLChlbDsO/bfMYXaEULZkUQCERH77KlcWVFsyhSlXZR2Y46pQUsNpqfFa2U9iWQ3stkbwgtTG9J4/E012AU6aaPKYYdzVm+wR1iSAoKDsvA+OzjKs14O7GOkHTuwPdAlURjPYGWeJq297DIxSi/RtRQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Ma+sCIU/amVun6wDil2mNjR94in5yy/hwcmilDBpqY4=;
	h=date:mime-version:subject:message-id:from;

On 3/23/2026 5:24 PM, Krzysztof Kozlowski wrote:
> On 23/03/2026 09:49, Damon Ding wrote:
>>>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>>>> index d99b23b88cc5..d2bc8636b626 100644
>>>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>>>> @@ -26,7 +26,9 @@ properties:
>>>>        items:
>>>>          - const: dp
>>>>          - const: pclk
>>>> -      - const: grf
>>>> +      - enum:
>>>> +          - grf
>>>> +          - hclk
>>>
>>> You just told me it is the same clock, no? I asked that and you
>>> confirmed? Or you replied with an answer not relevant to the question?
>>>
>>
>> Aha, I may have misunderstood your earlier advice as meaning that since
>> the RK3576 and RK3588 platforms share the same design, their clock
>> dependencies should also be identical.
>>
>> The 'grf' clock and 'hclk' clock are different.
>> On RK3399, the GRF clock is for accessing VIO GRF registers.
> 
> OK
> 
>> On RK3588/RK3576, the eDP 'hclk' is required as it is the parent clock
>> of 'pclk' in the AHB bus topology.
> 
> Heh, device takes pclk, so you do not need to take its parent.

Emm, my explanation may not have been clear enough. At the clock tree 
level, the hclk and pclk are two separate clocks, while pclk's parent 
clock is hclk in the NOC design, as illustrated below:
(Take the NOC design of RK3576 as example)

PD_VOP
   hclk_vop
     ├─ PD_VO1/hclk_vo1
     │    ├─ hclk_vo1_s (VO1 AHBS)
     │    └─ pclk_vo1_s (VO1 APB)
     └─ PD_VO0/hclk_vo0
          ├─ hclk_vo0_s (VO0 AHB)
          ├─ pclk_vo0   (VO0 AHBS)
          └─ pclk_vo0_s (VO0 APBS)

Then, the clock tree design is:

hclk_vo0_root (200M)
├─ hclk_spdifrx2_en
│    └─ hclk_spdifrx2 (200M)
├─ hclk_spdif2_en
│    └─ hclk_spdif2 (200M)
├─ hclk_sai6_8ch_en
│    └─ hclk_sai6_8ch (200M)
├─ hclk_hdcp0_en
│    └─ hclk_hdcp0 (200M)
├─ hclk_vo0_biu_en
│    └─ hclk_vo0_biu (200M)
└─ hclk_sai5_8ch_en
      └─ hclk_sai5_8ch (200M)

pclk_vo0_root (150M)
├─ pclk_hdmitx0_en
│    └─ pclk_hdmitx0 (150M)
├─ pclk_vo0_grf_en
│    └─ pclk_vo0_grf (150M)
├─ pclk_edp0_en
│    └─ pclk_edp0 (150M)
├─ pclk_dsihost0_en
│    └─ pclk_dsihost0 (150M)
├─ pclk_hdcp0_en
│    └─ pclk_hdcp0 (150M)
└─ pclk_vo0_biu_en
      └─ pclk_vo0_biu (150M)

Therefore, we need take 'hclk' as reference clock.

> 
>>
>>> If this device takes reference to grf, why does it also take grf clock?
>>> Devices MUST NOT take clocks on behalf of other devices, so please
>>> answer with a list of all clock inputs according to datasheet/manual.
>>>
>>
>> On earlier platforms, the GRF was not partitioned into separate
>> functional small GRF units as on newer designs. Therefore, the 'grf'
>> clock was designed as the clock dependency for all relevant modules.
>>
>> For RK3588/RK3576 eDP module, the list of all clock inputs is:
>>
>> CLK_EDP0_24M: Reference clock.
>> PCLK_EDP0: AHB clock.
>> HCLK_VO1/HCLK_VO0_ROOT: Video datapath clock.
> 

Best regards,
Damon

