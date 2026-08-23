Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4EC386C36
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485146; cv=none; b=QG8Eu0h11AgfaMB6Xie0H5XdGuI0ebybNh7An6vQ5tfZOHbu0CDhEJIdiPnStsF+ryRRUGt+/JsKK3LyPXpPsS7NjfNZjBSGKzGvCaj6l/dp0NcsOXKD0+spdWeHnYjNeghiAYXqzlBq4Jgk0snU+GcozLsvpvCt8+e1neQgSRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485146; c=relaxed/simple;
	bh=ITZNQSv3mENS/rSATJqELJsp+Dm6h3RBs5Q2aE1v1pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bARfu3IS570V+Ypfok+5r1P6TSiwsPZdQRsv+FExUWlDHuhMfo7qgnxYm49K+JYTX5zegSB6uv+iYaeFwo2MQ9onb7KkBA8ZWf0FUzF1CBH/C3Gc8G9lG+pry1cYfZMY7A3igzOSHE2jpYedNEjDHrhXhIm+R+cCDFb3AKY+OgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso15451725e9.0
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 04:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485143; x=1788089943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qrz6vWIs7Ln59X+fS+7H6xGzZNfsFTViY3UVWM/k9UQ=;
        b=esk2pct0yMQbpyyK7MELCAxEF3PQTClXIgjNJe2gaBPLSzayrHqbPHMYampmq1m7lN
         dcEMuzbvwvhmyU1Ho0xvb/U8AMsAfKQxtRun0qbR6y7FrICjfRxGpQ/iSVyHtI/xRbZU
         owUyhjv3fuD+wnLs4Gvg/H+BNK9FL/RDRqCFYnXCuh15OO4DTPMQYn27VuRNjK/Nollw
         AZ0LZx1+I13Wm86vMXEPqg9Rm/aT+2BkxU12co4EiynOFDTtuCveeVUNQl3pjSvN+7Vd
         pzAXAv+P1hw9sZVFXE4W6ehmdcJYh+foetT11fOrayL6Y8IoqHYsCEcBU0Ol/VWVOk4u
         pi1g==
X-Forwarded-Encrypted: i=1; AHgh+Ro9OdVbYP8lqVKsyBAWVFMUwS0iHixO1oYiBj49fCpgwiJaHEJexlCt8NKOUhCyOjPolHqRgpOdodTf@vger.kernel.org
X-Gm-Message-State: AFuF++kvO/nIrBkiiPJLBa3lLKzg1GTLdySDDyI4d3H6NyIoggUk8cF3
	9nCfmecivi8SA2mhnepcqsgp9nUBGHlsIgnTRZ+/i3oACWi4PZuY56Zt
X-Gm-Gg: AR+sD10fnrEFxSJQe6Igp7jiLOvU94vt7PzZfLR/JVuMNNiLds+g4ZHQOvRDECiPiZv
	0N+79ohxDl8DAGbMgdVg6WBpz+reQ7n6jPVjATEDl8AVK/jxbcOY456hJ0OuNKTf/GVsxjfAzG4
	OxcyLZnrzp91lmKHaBO+MqFIBiYUWwiS7iYEw4Y/VXIc/dYxx17p0s0Gj4m6S5ujqo1BHbRsEcW
	qfFzjChSWu9xVKf29CHdLt+I4xYucYVQ/tGUYE+X/LLoRHex7jbM8KzXgWzwgnbI+rbgbQNzGSn
	9jDfD9fgsl3mat6PH2i0Otd423KwCMoX1RAHUfKc4EKUgpYFJjrpgFTlauTTW0eEyiGZcGOLFT5
	5kMrrF/yt/cbvLDX/eDT9XIOXFg8uUbrWQpmCbI0GqeA89GIwq8tMG+4QYq7hBdzuCMRpTCresZ
	k7w5dtvTnaWwA0urBPOwy8TbpqybuqkNX8zDBx+iO0FZQn6bQdItYF5Ipz5gjfv2f8Y3Wh8pzEh
	xWaksQTeYgo3flOe+fvjF2lmsZLaW0d
X-Received: by 2002:a05:600c:c48f:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-499b8325d80mr195726245e9.6.1787485142600;
        Sun, 23 Aug 2026 04:39:02 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9b57ab4sm61139535e9.2.2026.08.23.04.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 04:39:01 -0700 (PDT)
Message-ID: <0969d872-faff-4b0f-81ad-972b7aa9bb7f@linux.com>
Date: Sun, 23 Aug 2026 12:39:00 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
 <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/08/2026 08:25, Ronald Claveau wrote:
> On 8/19/26 4:39 AM, Xianwei Zhao wrote:
>> Hi Lucas,
>>
>> On 2026/8/19 03:11, Lucas Tanure wrote:
>>> uart_a lists the 24MHz crystal for all three of its clocks, because
>>> the T7 clock controller driver did not exist when these boards were
>>> added.
>>>
>>> That leaves the real UART bus clock without a user, so the kernel
>>> turns it off when it disables unused clocks at the end of boot, and
>>> the board hangs.
>>>
>>> Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
>>> the placeholders from the two board files.
>>>
>>> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add
>>> initial device-tree")
>>> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
>>> Signed-off-by: Lucas Tanure<tanure@linux.com>
>>> Assisted-by: Claude:claude-fable-5
>>> ---
>>>    arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
>>>    arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>>>    arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4 ++++
>>>    3 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>> index cab2ee9ea0d3..dcbcd08a78b9 100644
>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>> @@ -33,7 +33,5 @@ xtal: xtal-clk {
>>>    };
>>>
>>>    &uart_a {
>>> -       clocks = <&xtal>, <&xtal>,
>>> <&xtal>;
>>> -       clock-names = "xtal", "pclk", "baud";
>>>           status = "okay";
>>>    };
>>> diff --git
>>> a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>> index c41525a34b72..677069e58f30 100644
>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>> @@ -266,6 +266,4 @@ &sd_emmc_c {
>>>
>>>    &uart_a {
>>>           status = "okay";
>>> -       clocks = <&xtal>, <&xtal>,
>>> <&xtal>;
>>> -       clock-names = "xtal", "pclk", "baud";
>>>    };
>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> index cc371fcd1896..7847582e77ed 100644
>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> @@ -587,6 +587,10 @@ uart_a: serial@78000 {
>>>                                   compatible = "amlogic,t7-uart",
>>> "amlogic,meson-s4-uart";
>>>                                   reg = <0x0 0x78000 0x0 0x18>;
>>>                                   interrupts = <GIC_SPI 168
>>> IRQ_TYPE_EDGE_RISING>;
>>> +                               clocks = <&xtal>,
>>> +                                        <&clkc_periphs
>>> CLKID_SYS_UART_A>,
>>> +                                        <&xtal>;
>>> +                               clock-names = "xtal", "pclk", "baud";
>>>                                   status = "disabled";
>>>                           };
>>
>> I agree with moving the UART clock configuration to the DTSI file.
>> However, it seems a little odd to keep the XTAL clock definition in the
>> DTS, as the alias may not be consistent across different boards, which
>> could result in compilation errors. Could we move the XTAL clock
>> definition to the DTSI as well, similar to other Amlogic SoCs?
> 
> It seems similar to changes in this series :
> 
> https://lore.kernel.org/all/20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr/
> 
> What do you think ?
> 
Thanks for pointing out that series, though I wasn't aware of it.
And after reading I don't agree with it. The clocks are not redundant, 
they are there because we agreed sometime ago that xtal belongs to the 
board files.
So I still vote for my change in v2, that I will send in a few minutes.
