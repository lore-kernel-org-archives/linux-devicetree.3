Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612244;
	b=XRizUFvGdEd9apNjNB5nJf4csUi+UOuNlJqdtiwuXWtxbmUEJq+jZ1HhcGlbps1bo0ch
	 g8ZJG3wZG+vnkHGTfUcvcb/M//PjN5dq98HRKpg9DCAykjOcolLVwi/mGkoqgi3Npb7ob
	 mC4ozeu21538SVUYAOU5aCgLfpLo00exv9r7zwRgDki6ORJN7jxEghN7KZKSTLbtyBOUR
	 1zgeMuT2r8pYtoL/eUMIwPzCqd/m4LKmmrs7iuw69Yw3W+lqhv776QZ4Jnwo2H33DIh3p
	 +SGW9lqwMCjldfFEdcVLEIM3T3YueZ8lfT2GT0KKxlQELGj8jp+7o9ioTBsh7jVi17Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=w+vZrApTpSqLfFvqFWnvVqAg81GtZ/F6fbDeLMsuCZw=;
	b=xGZfDydZLE/01u7NU5sUIt79fPGqrKOmM0UplJzMWWF8uzTNj1haMHBpIjLIcRkkBos9
	 2G2qX0ft77bQzgCIHMcFzF4xnaAWtHpXjpCW6izRcQWVHhjWTeCXg8Ktp82m9fTI/At0S
	 G5+Q7PLLlLZn/iecLFsPQt8YVKjSdFmROHWZyfxVcxMikMU+9qXP8jInmKgKRszt4mmss
	 F4fL3gaPPsD47cVm9BDMYt8xnp4jV+mZIeLeadMvCfbm41D9VwwuPDklSO6ke55kWT8uV
	 6GTI/RaV2OtLWh6dCzG2+ta8Ipq4Pl8pZ3u7rqFDE4QWq4rRNOtwVxECHZMDt589ESw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=dmlVzsRZ;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5366606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 19:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5366606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=dmlVzsRZ
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6f5a0893610so714253eaf.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792612243; x=1793217043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+vZrApTpSqLfFvqFWnvVqAg81GtZ/F6fbDeLMsuCZw=;
        b=dmlVzsRZlVNS/SkE/eAPz6i9bTFKrX7ykmMHP7LNsjWJPSEfrIRmxlDfistH1UMaNb
         yrCIXFZWmJSuOhfBTyR2eLaIvFmFMNbJAmg+fCSvnCxm/MS+cwlXt1pAXE/Q7POCKcgR
         HC0f6BYeHQDiUfTnO6KGxLt07OirNuiyjxj4cn3cFk4HVCttkceDuiI5Ze/5Qd18JdmH
         1f/a218zCbi5hoYtetT09puQYt3vdKT+eT/pDU13EmtnQAIvnXtu3yGxMDPP4TrB7e5j
         cObk6SuMBQkv59s3TARA7WLvumk+aREJu62ZS714UVc8iQuDAFeShHNkxXvn+RMvXm1q
         Fhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792612243; x=1793217043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+vZrApTpSqLfFvqFWnvVqAg81GtZ/F6fbDeLMsuCZw=;
        b=MU4pYMvZ2NC8K+bnijdQk49MqLpFTBQTcldR2qkMK2UR4AQUDxrTI5gcnng4NokNWB
         HC4JL/cMkGiuUQMtDJZBBl1SFIsDY15ERb2vTYIil3FupnoBNvGu75fXlopF60oqqNuH
         Vl9hVu3mzQ/EjsOjSYFEtjsyNf8lQz2J0i3LaCCC5HDZxIHp3OYSce6HDpwX7Xygyos6
         wpQod/KLaG4VODntejDGAtK3DmxJNsgB3Fdy2HmViCuPxW26KGXyJY9ZDHkaprwr5jk4
         lCLkba4XA8v1hWvgdTWXVExuacyXY/1Sm8QAnl1e92og/v/6OhPhHhwiQYbwhFGzahz1
         8v0A==
X-Forwarded-Encrypted: i=1; AKwUvBz7lWkHjMmNkRjqlZQ9H2eomCW3obdTp+20ORd31kobsK/GJxM8peZ0iSR/5tPkxgW1smY1Sd1vWRZn@vger.kernel.org
X-Gm-Message-State: AFq9FYIH3vWlYS2jOY7n84QbSQdTepUZ8wVjYEUcNMum1URdSLW/Fteo
	6Fj+dtJ9cw0ecUYB1Mf1XbxDo2uKW3ESCm0ClLIg3iaZu3tWDQyT1V+1EzuRggqTc6k=
X-Gm-Gg: AYBFou3CTJo5RlmkfTu025ly/Le0uYmqd+m6hPhxWlArDJok2afbP9yZ04SXk48ntGL
	66H8+/4AXiw6KWQhMfnYSiZOKT2cP3nSqb6T8IPFppVjU/AfV2ibregJrcVplwRTW1zlk+xzGkI
	a7iCNCVO3lFMZjSSnW+nJobtS6KB871XEMX5ZkGiKWjW8zmbeldGkPQZZg11R07AZJmew79QRXh
	IBfozEwy5vtEqP1ZpBWQ6tS/aFiCrL7gZIFt/KzGRzSw0gi/XKrGLW2ot91U7b1IgjGs2xRC9cY
	dGHc2M8yAXGiT96LX5xBWMaAf+b/KpF9jc20ah1fJc9RxF2P08Kf/AarH3ZIyrrqnp6vpIy1D+I
	oOiRz7PYtRtKBiiZWM0TIMGTpJ2i4pPSPO/L+sDPwm53gmRBve6vYJHYMjL5WXYssprzi/LV1p5
	uBQ9lu5gMGKZa3kjYhdA7lDIMhPxE4WGl5CpIwLo8ZiZSJ3fvjIgbZVv+J3AVvMMINHIRKSB1Tt
	kDtfF88O/wEIsGNd31Ruuerj072pfiH3CTevJXADTrWfENQ5zcx0bcK
X-Received: by 2002:a4a:ee06:0:b0:6f8:e2ac:ecd2 with SMTP id 006d021491bc7-709412a352amr2106980eaf.33.1792612242676;
        Wed, 21 Oct 2026 12:50:42 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d61dc6ddsm2762053fac.13.2026.10.21.12.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 12:50:42 -0700 (PDT)
Message-ID: <b904f4ea-e198-488e-a6dd-476d744593da@riscstar.com>
Date: Wed, 21 Oct 2026 14:50:41 -0500
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
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
To: Conor Dooley <conor@kernel.org>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
 <20261012-shale-rosy-805c49f6c404@spud>
 <492396bc-a0f4-4274-9a7c-21fd5fd886b5@riscstar.com>
 <20261012-numerous-flatworm-9e4cfa659541@spud>
 <325b8836-61a2-4e1c-98e3-92f0a5177f9d@riscstar.com>
 <20261013-stump-reactor-055d05dc5b3a@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261013-stump-reactor-055d05dc5b3a@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 12:51 PM, Conor Dooley wrote:
> On Tue, Oct 13, 2026 at 08:22:50AM -0500, Alex Elder wrote:
>> On 10/12/26 4:22 PM, Conor Dooley wrote:
>>> On Mon, Oct 12, 2026 at 02:10:01PM -0500, Alex Elder wrote:
>>>> On 10/12/26 1:51 PM, Conor Dooley wrote:
>>>>> On Mon, Oct 12, 2026 at 11:43:52AM -0500, Alex Elder wrote:
>>>>>> Define the binding for the reset controller functionality present in
>>>>>> the Toshiba TC9564 SoC.
>>>>>>
>>>>>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>>>>>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>>>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>>>> ---

Finally back to looking at this again.  Sorry for the delay.

>>>>>>     .../bindings/reset/toshiba,tc9564-reset.yaml  | 56 +++++++++++++++++++
>>>>>>     MAINTAINERS                                   |  7 +++
>>>>>>     include/dt-bindings/reset/toshiba,tc9564.h    | 26 +++++++++
>>>>>>     3 files changed, 89 insertions(+)
>>>>>>     create mode 100644 Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>>>>>>     create mode 100644 include/dt-bindings/reset/toshiba,tc9564.h
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>>>>>> new file mode 100644
>>>>>> index 0000000000000..1908e9539abac
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>>>>>> @@ -0,0 +1,56 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/reset/toshiba,tc9564-reset.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Toshiba TC9564 Reset Controller
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Alex Elder <elder@riscstar.com>
>>>>>> +  - Daniel Thompson <daniel@riscstar.com>
>>>>>> +
>>>>>> +description:
>>>>>> +  The Toshiba TC9564 is an SoC accessed by a host system through the
>>>>>> +  upstream PCIe port on the PCIe switch it implements.  The switch
>>>>>> +  includes an embedded PCIe endpoint that provides access to various
>>>>>> +  SoC peripherals (including a reset controller) via its BARs.
>>>>>> +
>>>>>> +  A total of 13 resets are implemented, though two of these are not
>>>>>> +  controllable.  Access to the reset controller relies on PCIe being
>>>>>> +  functional, so the PCIe reset is assumed to be deasserted.  Similarly,
>>>>>> +  the PCIe controller relies on I2C, so the I2C reset is also assumed
>>>>>> +  to be deasserted.
>>>>>> +
>>>>>> +  Reset ids are defined in <dt-bindings/reset/toshiba,tc9564.h>.
>>>>>> +
>>>>>> +  The reset controller uses registers within the same page as a
>>>>>> +  clock controller, so both devices are defined as children of a
>>>>>> +  "config" syscon.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: toshiba,tc9564-reset
>>>>>
>>>>> Why does this need to exist as a standalone device, rather than be
>>>>> rolled up into the parent syscon node? It doesn't have any resources, so
>>>>> it should be doable.
>>>>
>>>> This is along the lines of what Krzysztof has mentioned, and it
>>>> seems clear I must be missing something.
>>>>
>>>>> This kind of thing for a syscon is always difficult to review when only
>>>>> one element is present - where is the rest of the syscon's
>>>>> functionality?
>>>>
>>>> The reason a syscon was used was simply for the benefit of
>>>> having a shared regmap that the reset, clock, and DWMAC drivers
>>>> can use.  All three of those drivers use registers that reside
>>>> within a single page of addressible MMIO space.
>>>
>>> What does the dwmac use the region for? I assume it's for some misc
>>> register and you don't mean that the dwmac lies within the region?
>>
>> That's right.  There is one register (per DWMAC--there are two)
>> that contains one bit (bit 21) that is used to signal that initialization of
>> the PMA is done.  We assert reset, set up
>> clocks, then deassert, and finally wait for this bit to be set.
>> The DWMAC code uses a phandle property to refer to the syscon,
>> like:
>>      toshiba,config-syscon = <&tc9564_config_syscon0 0x1070>
>>
>> So again, the purpose of the syscon was to get the automatic
>> regmap for managing the region, which contains registers used
>> for distinct purposes.
>>
>> After making the syscon be the parent of both the reset and
>> clock nodes, I *removed* the "reg" properties and just defined
>> those offsets in the driver.  Maybe that was a mistake.
> 
> No, that's typically what happens in the setup I describe below, so
> that's not abnormal.

Thank you for confirming this.

>>> There's nothing inherently wrong with the act of using of a syscon here,
>>> what I am actually complaining about is how you are using it.
>>> In cases where a syscon region contains clock and reset, the typical way
>>> we want people to do this is via something like
>>>
>>> syscon@f00 {
>>> 	compatible = "toshiba,tc9564-bla-syscon", "syscon", "simple-mfd";
>>> 	reg = <0x0 0x2000>;
>>> 	#reset-cells = <1>;
>>> 	#clock-cells = <1>;
>>> };
>>
>> In this case it seems I must create a syscon driver that provides
>> combined reset and clock functionality.  Is that right?  (This
>> series is the result of separating the reset code from the clock
>> code in a combined driver.)
> 
> There's two ways to do it, depending on what sort of device you have.
> If you have a clock controller that also does reset, the preferred thing
> to do is something like
> 
> clock-controller@f00 {
> 	compatible = "toshiba,tc9564-clk";
> 	reg = <0x0 0x2000>;
> 	#reset-cells = <1>;
> 	#clock-cells = <1>;
> };
> 
> and in the clock controller driver probe the reset controller driver as
> a auxiliary bus device.

My last version combined these two but did not make the
reset an auxiliary device.

> You have something else though, because there's assorted other functions
> in here, including the dwmac and things you don't use yet. In that case,
> I would make a node like
> 
> syscon@f00 {
> 	compatible = "toshiba,tc9564-bla-syscon", "syscon";
> 	reg = <0x0 0x2000>;
> 	#reset-cells = <1>;
> 	#clock-cells = <1>;
> };
> 
> and in the syscon driver use MFD_CELL_NAME() to probe both clock and
> reset drivers, and can use device_node_to_regmap(). Your dwmac stuff
> (and any other future stuff that needs a syscon reference) can use the
> automagic syscon regmap stuff that we've already talked about.

This sounds like the way to go.

> Note, there's no "simple-mfd" here, because you have no child nodes.
> The point of "simple-mfd" is to probe those kinds of devices.

OK.  Let's see if I understand what you're saying.

This approach uses:
- A single top-level syscon driver (under drivers/mfd?) which
   probes based on a devicetree node compatible string ("toshiba,...")
- That compatible string will require a (fairly simple) devicetree
   binding
- That driver initializes a regmap which will cover the space
   defined in its devicetree node (<0x0 0x2000>)
- That driver has an array that uses MFD_CELL_NAME() to define
   cells for clock and reset
- That driver will call some form of mfd_add_devices() using the
   MFD cell array
- The stmmac driver can refer to this device node with a phandle
   property to specify the syscon that provides the regmap it needs

And then, for the clock and reset devices:
- A clock platform driver (under drivers/clk) will match based
   on the driver name (matching what's supplied by MFD_CELL_NAME())
- A reset driver will be similar (under drivers/reset)
- As you mentioned, these drivers get at the regmap they need using
   device_node_to_regmap() (or dev_get_regmap() or something)
- And despite these being separate drivers (from the syscon driver)
   they don't have devicetree nodes, and the syscon node itself
   defines the clock-controller and reset-controller properties.

Does that sound right?  Am I missing anything?


>> To be honest I don't have a lot of experience with proper use of
>> syscons.  I have no problem writing or restructuring the code,
>> it just seems I need help knowing what the final structure should
>> look like.
>>
>>> because the child node exists for no other reason than to access linux
>>> driver probing in the most trivial way. If there's some features that
>>> actually need a child node, that's fine, but those will end up being
>>> things with significantly more properties or things with competing
>>> property use (e.g. if there were devices with buses that need
>>> address/size cells).
>>
>> I'm not sure I understand this statement (and that might be part
>> of the problem).
>>
>> There are other devices (currently just two DWMACs, plus an
>> interrupt controller that generates MSIs for each PCI function)
>> that use the reset and clock signals.  I haven't yet
>> posted the reworked DWMAC code but I just sent the first version
>> of the interrupt driver yesterday.
>>    https://lore.kernel.org/lkml/20261012190245.3988619-1-elder@riscstar.com/
> 
> Here I am talking about why child nodes aren't correct in your case.
> Neither clock nor reset needs anything other than the relevant #cells
> property, so the only benefit of a child node over having these in the
> syscon node itself are to use the compatible to probe the driver.

Yes I now see what you mean.  By using a MFD model the child device
is just a function provided by the top-level syscon device.  The
driver code still benefits from the device model, but the subordinate
devices match based on the device name and not a devicetree compatible
string.  And no nodes exposed in devicetree are needed for the clock
and reset.

> Child nodes should only be used when the functions provided by the
> syscon have conflicting properties or are very complicated (I would
> probably always use a child node for pinctrl for example). It'd also be
> reasonable if the functions are reused across devices, but that's
> rarely the case with clock or reset controllers (or really anything
> that appears in these kinds of "random register regions" in SoCs).
> 
> Does that make more sense?

Yes, it definitely helps a lot.  I realize I might not have every
detail right, but I feel much better about how to organize this
(and presumably this also addresses what Krzysztof was asking for).

Thank you Conor.

					-Alex

> 
>>
>>>> And I don't know that I can guarantee their probe order.
>>>
>>> I am assuming this is moot, since I am not objecting to using a syscon?
>>>
>>>> There is otherwise no "system controller" that is treated as
>>>> a logical entity within the SoC.
>>>>
>>>> What is the proper way for me to represent this?  It's fairly
>>>> simple; and I mainly want to ensure all three of those drivers
>>>> can safely access their addresses.
>>>
>>> What else does this region actually contain?
>>
>> At this point I've described everything we now use.  Two
>> registers control a set of resets; two registers enable and
>> disable a set of clocks; and two registers each contain a
>> bit to signal readiness of a DWMAC device.
>>
>> There are other registers in this region, but at this time
>> we don't use them.
>>
>> 					-Alex
>>
>>>
>>> Cheers,
>>> Conor.
>>>
>>>>>> +
>>>>>> +  "#reset-cells":
>>>>>> +    const: 1
>>>>>> +
>>>>>> +required:
>>>>>> +  - compatible
>>>>>> +  - "#reset-cells"
>>>>>> +
>>>>>> +unevaluatedProperties: false
>>>>>> +
>>>>>> +examples:
>>>>>> +  - |
>>>>>> +    #include <dt-bindings/reset/toshiba,tc9564.h>
>>>>>> +
>>>>>> +    syscon@0 {
>>>>>> +        compatible = "syscon", "simple-mfd";
>>>>>> +        reg = <0x0 0x2000>;
>>>>>> +
>>>>>> +        reset {
>>>>>> +            compatible = "toshiba,tc9564-reset";
>>>>>> +            #reset-cells = <1>;
>>>>>> +        };
>>>>>> +    };
>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>> index 252b6d7ee1638..d0eb44079fe17 100644
>>>>>> --- a/MAINTAINERS
>>>>>> +++ b/MAINTAINERS
>>>>>> @@ -28180,6 +28180,13 @@ S:	Maintained
>>>>>>     F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>>>>>>     F:	drivers/misc/tc9564-pci.c
>>>>>> +TOSHIBA TC9564 RESET DRIVER
>>>>>> +M:	Alex Elder <elder@kernel.org>
>>>>>> +M:	Daniel Thompson <danielt@kernel.org>
>>>>>> +S:	Maintained
>>>>>> +F:	Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>>>>>> +F:	include/dt-bindings/reset/toshiba,tc9564.h
>>>>>> +
>>>>>>     TOSHIBA WMI HOTKEYS DRIVER
>>>>>>     M:	Azael Avalos <coproscefalo@gmail.com>
>>>>>>     L:	platform-driver-x86@vger.kernel.org
>>>>>> diff --git a/include/dt-bindings/reset/toshiba,tc9564.h b/include/dt-bindings/reset/toshiba,tc9564.h
>>>>>> new file mode 100644
>>>>>> index 0000000000000..5fcc9a06d4ff6
>>>>>> --- /dev/null
>>>>>> +++ b/include/dt-bindings/reset/toshiba,tc9564.h
>>>>>> @@ -0,0 +1,26 @@
>>>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>>>>> +
>>>>>> +/*
>>>>>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef __RESET_TOSHIBA_TC9564_H__
>>>>>> +#define __RESET_TOSHIBA_TC9564_H__
>>>>>> +
>>>>>> +/* Reset IDs */
>>>>>> +
>>>>>> +#define RESET_MCU		0
>>>>>> +#define RESET_MCU1		1
>>>>>> +#define RESET_MSIGEN		2
>>>>>> +#define RESET_INTC		3
>>>>>> +#define RESET_UART		4
>>>>>> +
>>>>>> +#define RESET_MAC0_MAC		5
>>>>>> +#define RESET_MAC0_PMA		6
>>>>>> +#define RESET_MAC0_XPCS		7
>>>>>> +
>>>>>> +#define RESET_MAC1_MAC		8
>>>>>> +#define RESET_MAC1_PMA		9
>>>>>> +#define RESET_MAC1_XPCS		10
>>>>>> +
>>>>>> +#endif /* __RESET_TOSHIBA_TC9564_H__*/
>>>>>> -- 
>>>>>> 2.53.0
>>>>>>
>>>>
>>

