Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0694748EC88
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052911; cv=none; b=lbE0QyxgSyMqQLXJwyuWOPkxA9ZDnY9jdHdZeiKtMU/iueTUh48FfYZL8Y0NwfVwDpxw8b2SRf72qJNOaWIe2sUTYT6c8wdtbNKeLRzciP56FXe1En36d2o2m6M61NAjYmQz1h8XGgq77CLNOjk1+STHnRjaz+H8mo+SWQXvu8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052911; c=relaxed/simple;
	bh=YSYs9LbmZU0PYWfoZXs1bLGfoTvd1+eohtoxmTIiqW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZS23whwhsLMItFHDV9u35RBQHsG2ix6FmAIg52Yr3Ueb010lJyt+Ye/v5X0AbPAh9Z7SxeL5sHLHunZIdA4RlHzjfVXvEE5dC5PJqoH55wgc9PiidFB/JT0Xos0QldKncPzxbTVq6ENdLhWqd/yNFNkOEFH/ULIYoCZzFS5/lTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQuUBOek; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQuUBOek"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49954b88fffso53118385e9.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789052903; x=1789657703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/O88mD56SBzt1YvJ4sXCFFpkOs3XAqa1P/dxdZfqCQY=;
        b=aQuUBOeksgHQbypXJpEW/M+bAEGXXM99yx4WFvRTQhDu8R0N/Dr1a8yfdVL52H2WAu
         aSycI7wZ9reOyZ6xGDEsSYWShV7XzQSQ0JPQAePAlVN9xzu3udfWpaFXoNhB8kGGTOrH
         5Mtgu5iXS64sEd46lvnWttwBwk0xxO9iER8xqSGWRNiXYMOqGum5+io+uJimfnaqYO95
         WjUmjI5jFmkQYp12g2MFrCScqBYTh/QvOGfW7jasl9bFMyTc/02G8ibaNqEmvhQlBeyB
         YcHtzLaY740pupKq0+vo5zg6t4yoT/i85DzCdH1IhbcW4FMb0d44F7r8mcbJt6hQdBCf
         /JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052903; x=1789657703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/O88mD56SBzt1YvJ4sXCFFpkOs3XAqa1P/dxdZfqCQY=;
        b=c1uckckyj0nGf0qX0iaEIATb/CWE6qyQLHmAFMs9W7Cozdj33C5kIdcNpT+z8xMN87
         9fKfE4n9L2gpkY5iivxw6h6FVVav4eDEo42pJwG5vyQuurdLLLU+HDfYBogL8W8BOeSC
         RALTfPF+rq3fLFTVAmdc8iwp3oR/mNESM4Rmvp6DAAJCyW6G9JwSkDULTfuHnu08ObJN
         2aaPUzU57xO4SK8BSxeRUKv15Izq4yN60KysCDJx4rCxwHpg1qos1UhO/BNxYx2/G1US
         n216Mrhg12NjAYPL6vPzBh3XUkCxQLQ2fJfPSyISEEFfpsF+MVfgoJo+fVXD4ivO84SZ
         UTuw==
X-Forwarded-Encrypted: i=1; AKwUvBwJHGLc+CbIlMHSSo6V+kpIS+gUQnnqbvDip2AgvhBiLEN9k73Lnx+gZlrlhR+eigCmqLX1e2HXTGKr@vger.kernel.org
X-Gm-Message-State: AFuF++n5FCm8htJjSCmCWC2yvo5otkNpz4BkVQWr8t0SzLkSKSUVoPyu
	vON62u2NjewR5+ezjWM2tuHmBuJakM46ve/5jH0+ncSwiVrL6x1DBku0
X-Gm-Gg: AYBFou1/g4uHVmOXxiFqTSSuVfbtZ+rIg9SFDXJACC6HOMVSX31FX7J+gQkg69ghOYv
	nGkHx0SlZVzfTiYJ+EZqiOJ4YoUIOKFUKJdmRL+gFLPT3GJIjYbH+Fp501a16NsHYe5ai7L2rve
	NFSFjtrvfGdlR3CFwz6PRbbm7BBbK88DAWD5oTfcjGX0HxiM6Lhl32eORkL64Up+WPloLoTnaMx
	R5eZM/ZRV8/kVKru8ROiELDhVutIw1xtcgul26MVOwacbpcglkvJaCUURIVohHAi4rtqCrtFdzL
	k3hwZJAyCKMR0LjF5t+8P3lyH+7ZmZUjx2mEao4zPjHFE5kQTOzyyvrfWtijYGa9iTVxrFyCTkW
	3hnLsRtW9rvDHhYAvQ11j3+w+LwH8GlzipVyFYUt3aClEsyJS1JXcNd8AumvcvRccxAW7ZbCXfG
	4eCvwR9ctyOU78hAEpc/cDDEcWxe7SSemP0PX8rDlwrQ4UEcxnjgxAhUkZWDbLuaQpYK5QXX/lz
	1LZ3aMCAQW0pMJDe5Ucoza+DCFrEj0A
X-Received: by 2002:a05:600c:4f12:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49cfc6cbfcamr388041945e9.23.1789052902962;
        Thu, 10 Sep 2026 08:08:22 -0700 (PDT)
Received: from [10.25.218.197] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d24e01c66sm48739535e9.1.2026.09.10.08.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:08:21 -0700 (PDT)
Message-ID: <a41510f0-8906-4698-9919-b65b40cc9b89@gmail.com>
Date: Thu, 10 Sep 2026 08:08:18 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 elena.popa@nxp.com, consmin.stoica@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
 <20260909153943.1048-3-laurentiumihalcea111@gmail.com>
 <f0136c29-e372-4ae9-972a-23d7a60d75e4@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <f0136c29-e372-4ae9-972a-23d7a60d75e4@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi Ahmad,

On 9/9/2026 9:20 AM, Ahmad Fatoum wrote:
> Hi,
> 
> On 9/9/26 5:39 PM, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
>> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
>> following hardware feats (list is not exhaustive):
>>
>> * based on i.MX95 19x19 SoC
>> * 64GB eMMC
>> * up to 16GB of LPDDR5 memory
>> * 1 x USB 2.0 TypeC
>> * 1 x USB 3.0 TypeC
>> * 1 x RJ45 port with RTL8211 PHY
>>
>> The support targets revision B of the board.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
> 
>> +	chosen {
>> +		stdout-path = &lpuart1;
> 
> I would recommend instead "serial0:115200n8" here. This introduces no
> change for Linux, but for other consumers of the device tree, they will
> be able to agree on a common baudrate.

ACK, seems fine. If there's no other objections to this I'll make the switch
in V5.

> 
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		/* actual size filled in by the bootloader */
>> +		reg = <0x0 0x80000000 0 0x80000000>;
> 
> If the board has at least 2G always, this is fine.

the board only ships with 16GB LPDDR5 so yes, it'll always have at least 2GB.
While the current size is fine, maybe it would be better to change it to 16GB?
Will have to update the commit message as well since "up to 16GB of LPDDR5 memory"
might be a bit misleading.

my other option was to leave the size set to 0x0 like some QCOM DTSIs seem to do.
Not sure what the preferred way of handling this is?

> 
>> +&usdhc2 {
>> +	bootph-pre-ram;
>> +	bus-width = <4>;
>> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
>> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> 
> Looks unexpected to have same pinctrl groups for the higher speeds.
> Are higher speed modes even possible on this board?
> 
> If not, I would suggest dropping the extra states.

The pin configuration is chosen to meet the timing requirements of the 200MHz
state. Because of this, I would expect the configuration to be appropriate for
lower frequencies as well.

The intention is to use the same configuration as MX95-19x19-EVK since, from what
I've been told, the trace lengths are similar to those of the EVK.

Thanks for taking the time to review this! :)

