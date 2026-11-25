Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643510;
	b=etJSKx7Dv4NLl3ujyKlRA6UQzq//m5AC9rachXVU/MIBn1BsAq5i7VYFzqC3Hw6lY20q
	 I7okas/R3gP3+4e8UtHvVscaCYWEwVHucG7OswgHAutyMHO+/pwQnfB8FJKClEoHHMg/u
	 2lOqSOxgZPB6suYEqomviclhAdaRTrU+MuJgHMKCEtsI6XTvSC/Nkv5cqSEcrnBY5RJmL
	 hazrZkNvxSMM5rYeEbbWCg0iRJyHJBOiCcPt65Cn1b6xCBelFnsCKWqpGRHFCrzw5mb5F
	 vtqTNDnbbVdApWxIvzf8Iq2E+ZMA3MT/VtIMDGkn16ikIkSKPmfKqXa75nD98ZaDngQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=rbSy8/naK9NpKBKilS5D0FxnjU7qPGsjWJMaC5SsXmI=;
	b=NaxczYnEMCaNInotBQXFK9AGXOsY/2mJSFx0TLQBBdJXin3wwRBKY6ljhiyP+/RjGOWN
	 +KuP6fTzwkbCd1E9lhnsASP4gHrkVIg4gorzGhEBCLXHxYmF7rjf58pH7IIR05O5b7VuK
	 AiCZzzLue60hwb+y1vSCgwCqQtAO8B24NSh1kUz+IFpPrN0v5qf5d7drAbwp2ANF5CdOw
	 zYOw2gZyD3bYOC22jQtXhjCt1eWuYjxdXzMeavy+/hkM8OEeTjhp7OMlray0PoY2cGLdO
	 1SgqGfyTX5KJ0UX/5cS5smwVGknF0XzWGQER2O+yD2ea5Cv/4j97dF3BFAuoYkrBpNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=RvkMU6aH;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A06A606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A06A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=RvkMU6aH
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6df7f544919so3802314eaf.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795643508; x=1796248308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbSy8/naK9NpKBKilS5D0FxnjU7qPGsjWJMaC5SsXmI=;
        b=RvkMU6aHw3UFU7F0s3LawFuMMWucgrJOewAmTNt/s9mU1jocAFjNJMZKtPkXuvf+r6
         3Y1gMKTzSvrCakTTvX1dK5xqZ8bWJeGZJ2cAKfIvX0GRIA6CK00CzxZpH2mgs+RjwMlp
         /J928Qpmpf9szu6sskdshfNebwQGfXIM0ijz7JGjMOYZ90oMGk6HmqfozgFQYYsjC7+Z
         Pi1R4SLtvkJ49mAZH827Axk/UVcNrNf/Qm4qAYl0gpum9z2+bGTOAaekxeFK56P3SYJS
         EC2MUyaS7hqQErt+f03GVz84MxOh0BOA7wKgIXz5xT9Fw7bT22bUKp+Qu+sJrZdcsFau
         Dobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643508; x=1796248308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbSy8/naK9NpKBKilS5D0FxnjU7qPGsjWJMaC5SsXmI=;
        b=urnoeDULdOY/Iz6W0b/1n0pTn1fQaYYPuCMHAjo1bqt3pGcki0ax2imkSHlXDr898Q
         +IbQAp0i3FQ9Ey7UQYiPnmYoNqKPEEc2fXalgEHJ45iN19X/voIE9YffSDXZepO6uq/4
         sz3oWOU9VnMgkYqjofhv2g6LT0VahOfVEcoXDdDqGjQAlhAtIRkmKospBMSLvZej3hZE
         mXhc0icDukwSUajS8EGfluoNpw23xBDcKkdVpd0mrJ7yQVpAFZ1uRXOIrsZpIm1Nhplm
         tQv9hmhB7Y/bQ+9znn2/MzBhdIqhDnYD23xB429rEhymTZHrXy1tlxiTRWnpL21JSjUx
         2Srw==
X-Gm-Message-State: APuU4Z+vwbRPQOzMnO+q9RbXyIqXrx/9RPOqcZciLuredAUDVpcp4KwZ
	nm6BLbDxLDeYTOWZ83KPVqG78hMxSlXibWOXHqxofPwRv88XxigVLa7sIxDVZnu0foo=
X-Gm-Gg: AZFdTZc3Su1V8D6ro9iI+ieYjEV3yMVA3M2GacPrKUNXGAYTYr79A5CqUxKBl43cgfI
	bmf7aH98HwIUdQ+ZVsKTA/pD2jscY2y0JSqWW+5r4kKZrySNfqrtFMDDog6Z31+fEh83cZTzo74
	9vBqV095pLxzC7cfQSGdXpts9Uo0jAVcuFudl1aLcNEeRzz7V5BJm1Fchd8uK+Lu5XsBIIioCoo
	MI1YN7gDVCV4oRg9EkLB6Rlg96DiELn7E0P8mI/v3AMGCUVMOCuBe2y7fKqxGhv93hiG0tPVDe2
	9oyD40YBo/ir66gQaIJsJhLfsg39LnbUVsjSYlE2KxR+wZgKFcbFk3tk+l0zht06rWtPCAHX87M
	eFz05WmyD2DasNfwwRYKDc1GLX+I6z0y0mglrB5QH/UvQ1LwaPnO+SOfUOP6tGi+/ykICoev52r
	2gMaY5cqD8cjtohWsPwHTwE0omIOBAI7gfpT2VjT7T7U+8wFKbBX4szPEHha16caGUi0xWlp1a6
	mRkE715ahiNNr0CWOa/PB1MlcX5bOTLxZW9FIHA3GvxOAHRE3TGYR4/V6dMCvn/08AdZylDZHq5
	8dsCGB/peiIDdHE5zPCV8BpUB3HE6NJg
X-Received: by 2002:a05:6820:1391:b0:71b:8969:9d1d with SMTP id 006d021491bc7-71b8969a594mr465740eaf.31.1795643508188;
        Wed, 25 Nov 2026 13:51:48 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38015c46sm12670866eaf.4.2026.11.25.13.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 13:51:47 -0800 (PST)
Message-ID: <d5abcbbb-e533-4a44-a26a-1ca17e37d7f6@riscstar.com>
Date: Wed, 25 Nov 2026 15:51:47 -0600
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add TC9564
 clock node
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-4-elder@riscstar.com>
 <sashiko-outbox-234134@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-234134@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/26 2:28 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: qcom: clock-25000000 under pcie@0,0 shifts tc9563
>    port indexing
> --

This was a great catch on a seemingly unrelated problem.

I will consider how to address it.  Off hand I can think
of two options, but I'm sure there are others:
- Move the tc9564_xo_board *after* the downstream ports
   (after the end of the pcie@3,0 node).  In this case I
   would add a clear comment in the DTS file explaining
   why this is necessary.
- Make the logic in "pci-pwrctrl-tc9563.c" more robust,
   possibly by skipping nodes that aren't of type "pci"
   (or possibly "pciex"?).
I think the second option is better, but I'm open to
other suggestions.

However, at the very end of this message there is another
observation that might make the above moot.  I think this
clock node should probably be defined closer to the root
of the tree.  I'll verify that and will fix it.

> commit c4e2dd0c5c7aea169ea475dfdf59cb2e475d33be
> Author: Alex Elder <elder@kernel.org>
> 
> arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node
> 
> This commit adds a devicetree node for the Toshiba TC9564 clock and reset
> controller along with a 25 MHz fixed-clock node supplying it.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 682bcbc0b466b..b327f64885ef2 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -890,6 +890,13 @@ pcie@0,0 {
>>   		pinctrl-0 = <&tc9563_resx_n>;
>>   		pinctrl-names = "default";
>>   
>> +		tc9564_xo_board: clock-25000000 {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <25000000>;
>> +			clock-output-names = "tc9564_xo_board";
>> +		};
>> +
>>   		pcie1_switch0_dsp1: pcie@1,0 {
>>   			reg = <0x20800 0x0 0x0 0x0 0x0>;
>>   			#address-cells = <3>;
> 
> [Severity: High]
> Does placing clock-25000000 as the first child of pcie@0,0 shift the
> downstream port indexing in the tc9563 power control driver?

I think it currently does.

> Both tc9563_pwrctrl_probe() and tc9563_pwrctrl_parse_reset_line() map the
> direct children of the pci1179,0623 node positionally to TC9563_DSP1,
> TC9563_DSP2, and TC9563_VDSP:
> 
> drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c:tc9563_pwrctrl_probe() {
> 	...
> 	port = TC9563_USP;
> 	for_each_child_of_node_scoped(node, child) {
> 		if (++port >= TC9563_MAX)
> 			break;

If the second option above is chosen, this function
should be updated the same way.

> 		ret = tc9563_pwrctrl_parse_device_dt(child, &tc9563->cfg[port]);
> 	...
> }
> 
> With clock-25000000 ahead of pcie@1,0, pcie@2,0, and pcie@3,0, the driver
> treats clock-25000000 as TC9563_DSP1, shifts pcie@1,0 and pcie@2,0 into
> TC9563_DSP2 and TC9563_VDSP (misassociating per-port settings, reset
> GPIOs, and the integrated Ethernet endpoint), and stops before reaching
> pcie@3,0.  It also violates Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml,
> which only permits pcie@[1-2],0 and pcie@[3],0 child nodes.  Should
> tc9564_xo_board live under the root /clocks node instead?

The 25 MHz oscillator comes from *outside* the TC9564 chip,
not under the upstream PCIe switch port.

For this reason, it should be defined somewhere on the board,
not within the TC9564 chip.

I will investigate the right way to represent this and will
correct it.

					-Alex
