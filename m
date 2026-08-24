Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185F83E6DE8;
	Mon, 24 Aug 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562970; cv=none; b=pvsAMdrbm/eUSyMId6ZQkbI4vqePtyVMBiQdfSj8Rs6A8Ix2tKSHiQqKW279hkRpIQvJXPHvCAc5K8QmZLyxjdqCLO2DHyCPaAS+XmUp9mkDTslI2+mmysmrK3pf4nZMRFglgOPlyY9vQLbyKy32zflN3tgfxXDpxwkzj4m/1e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562970; c=relaxed/simple;
	bh=foOoXCqR/5BXqtyvFhHjleR3bZ+mj5eo+d1InjU/3Ro=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aGZ94uSTM6rUtWq2IScD8BpSkvcACltChlSeFYs27JyOQgoWV8MsNSwkvoc71+F+vS0oMnuPIr75oyKf9HmTkMPTgmiMYYlYdY99/FO8p8nAmdp+GBLGfrZvKVj9fIdXyTqR1rvSP/ypEZNrK7ebJtHzU//DHg3PGZXjiLD8Ykk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=enpFvvbI; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="enpFvvbI"
Message-ID: <78721fe3-d9d0-4f85-a1ec-a01ebbf4f9a3@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1787562959;
	bh=foOoXCqR/5BXqtyvFhHjleR3bZ+mj5eo+d1InjU/3Ro=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=enpFvvbI08UZGAHC08RrXefbOM4ISQ7ktbTjM4ine951/kCE37ESx5pa7cesPe2X9
	 kzN3odNAWYlufHgL8Fzf6BCgr5n3du428xv1xh3KZgcR+cdzKUIiGW4haBoC45Z51z
	 101mjQF5KkbUyDHNGrUzQEJpOKl2SVX5qEbzY9sc=
Date: Mon, 24 Aug 2026 11:15:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Lucas Tanure <tanure@linux.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
 <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
 <0969d872-faff-4b0f-81ad-972b7aa9bb7f@linux.com>
Content-Language: en-US
In-Reply-To: <0969d872-faff-4b0f-81ad-972b7aa9bb7f@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/23/26 1:39 PM, Lucas Tanure wrote:
> On 19/08/2026 08:25, Ronald Claveau wrote:
>> On 8/19/26 4:39 AM, Xianwei Zhao wrote:
>>> Hi Lucas,
>>>
>>> On 2026/8/19 03:11, Lucas Tanure wrote:
>>>> uart_a lists the 24MHz crystal for all three of its clocks, because
>>>> the T7 clock controller driver did not exist when these boards were
>>>> added.
>>>>
>>>> That leaves the real UART bus clock without a user, so the kernel
>>>> turns it off when it disables unused clocks at the end of boot, and
>>>> the board hangs.
>>>>
>>>> Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
>>>> the placeholders from the two board files.
>>>>
>>>> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add
>>>> initial device-tree")
>>>> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
>>>> Signed-off-by: Lucas Tanure<tanure@linux.com>
>>>> Assisted-by: Claude:claude-fable-5
>>>> ---
>>>>    arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
>>>>    arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>>>>    arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4
>>>> ++++
>>>>    3 files changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>> index cab2ee9ea0d3..dcbcd08a78b9 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>> @@ -33,7 +33,5 @@ xtal: xtal-clk {
>>>>    };
>>>>
>>>>    &uart_a {
>>>> -       clocks = <&xtal>, <&xtal>,
>>>> <&xtal>;
>>>> -       clock-names = "xtal", "pclk", "baud";
>>>>           status = "okay";
>>>>    };
>>>> diff --git
>>>> a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>> index c41525a34b72..677069e58f30 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>> @@ -266,6 +266,4 @@ &sd_emmc_c {
>>>>
>>>>    &uart_a {
>>>>           status = "okay";
>>>> -       clocks = <&xtal>, <&xtal>,
>>>> <&xtal>;
>>>> -       clock-names = "xtal", "pclk", "baud";
>>>>    };
>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>> index cc371fcd1896..7847582e77ed 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>> @@ -587,6 +587,10 @@ uart_a: serial@78000 {
>>>>                                   compatible = "amlogic,t7-uart",
>>>> "amlogic,meson-s4-uart";
>>>>                                   reg = <0x0 0x78000 0x0 0x18>;
>>>>                                   interrupts = <GIC_SPI 168
>>>> IRQ_TYPE_EDGE_RISING>;
>>>> +                               clocks = <&xtal>,
>>>> +                                        <&clkc_periphs
>>>> CLKID_SYS_UART_A>,
>>>> +                                        <&xtal>;
>>>> +                               clock-names = "xtal", "pclk", "baud";
>>>>                                   status = "disabled";
>>>>                           };
>>>
>>> I agree with moving the UART clock configuration to the DTSI file.
>>> However, it seems a little odd to keep the XTAL clock definition in the
>>> DTS, as the alias may not be consistent across different boards, which
>>> could result in compilation errors. Could we move the XTAL clock
>>> definition to the DTSI as well, similar to other Amlogic SoCs?
>>
>> It seems similar to changes in this series :
>>
>> https://lore.kernel.org/all/20260420-add-bluetooth-t7-vim4-
>> v4-0-9505df0e7016@aliel.fr/
>>
>> What do you think ?
>>
> Thanks for pointing out that series, though I wasn't aware of it.
> And after reading I don't agree with it. The clocks are not redundant,
> they are there because we agreed sometime ago that xtal belongs to the
> board files.
> So I still vote for my change in v2, that I will send in a few minutes.

I don't get why it would be better to define the exact same clocks in
each DTS file.

The xtal recommended characteristics provided at the SOC level can be
defined in the DTSI and overridden, if really necessary, in the DTS.

-- 
Best regards,
Ronald
