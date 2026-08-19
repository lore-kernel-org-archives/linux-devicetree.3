Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4E23BE644;
	Wed, 19 Aug 2026 07:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787124738; cv=none; b=fgODxS3kV5ViqR+OCGCFOngNOxN/0ofhsFH2X4Z1+QOaZ7tlgzTflef2mpNQbjk7vrW219I2J34qG3zfXEDpnb0OUDavTcita2ENwep1pgZ6ilUMkE8E7D/B53bU2K/uvPglk2tIkoOh6X/p8Q/ii9JVNmomRPyNnmIWKEdJLqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787124738; c=relaxed/simple;
	bh=zfApjPryrOyf0fxxl1ecWqnrsetooI24vtnZRIvXq7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOM7FmGsulXb5LRFmEW0jGXgOWJv3eGwccRa9vJguUobM9YsOATdrIayoYNXYbPjW+a6ILiDtqX/JTrN+bYppu45NF2WGrX1x6uoSxjYyux9drY5R5K8br3rkr4pVKesTlZIXXeaO49mxt1pD948RHFXVgrmPrEK2uydjc4yyWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=seQBr+cK; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="seQBr+cK"
Message-ID: <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1787124356;
	bh=zfApjPryrOyf0fxxl1ecWqnrsetooI24vtnZRIvXq7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=seQBr+cK9g2XeyPGBo5qh2mBtmRJs+lE8qfi/e2B/RSSo+/WTX9KteAhoKY9Epncg
	 shEH21hDzyL8WVCIwtD7VsyjdtBxXjfWF6a/0GMnl9q9QDZWnl6PCt9Ei3epb1PzS7
	 U964U4PvEjM32a0oj8liqP3kZ83nT7b1KnTXSYTo=
Date: Wed, 19 Aug 2026 09:25:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Lucas Tanure <tanure@linux.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
Content-Language: en-US
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
In-Reply-To: <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/19/26 4:39 AM, Xianwei Zhao wrote:
> Hi Lucas,
> 
> On 2026/8/19 03:11, Lucas Tanure wrote:
>> uart_a lists the 24MHz crystal for all three of its clocks, because
>> the T7 clock controller driver did not exist when these boards were
>> added.
>>
>> That leaves the real UART bus clock without a user, so the kernel
>> turns it off when it disables unused clocks at the end of boot, and
>> the board hangs.
>>
>> Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
>> the placeholders from the two board files.
>>
>> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add
>> initial device-tree")
>> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
>> Signed-off-by: Lucas Tanure<tanure@linux.com>
>> Assisted-by: Claude:claude-fable-5
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
>>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4 ++++
>>   3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>> index cab2ee9ea0d3..dcbcd08a78b9 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>> @@ -33,7 +33,5 @@ xtal: xtal-clk {
>>   };
>>
>>   &uart_a {
>> -       clocks = <&xtal>, <&xtal>,
>> <&xtal>;
>> -       clock-names = "xtal", "pclk", "baud";
>>          status = "okay";
>>   };
>> diff --git
>> a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> index c41525a34b72..677069e58f30 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> @@ -266,6 +266,4 @@ &sd_emmc_c {
>>
>>   &uart_a {
>>          status = "okay";
>> -       clocks = <&xtal>, <&xtal>,
>> <&xtal>;
>> -       clock-names = "xtal", "pclk", "baud";
>>   };
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> index cc371fcd1896..7847582e77ed 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -587,6 +587,10 @@ uart_a: serial@78000 {
>>                                  compatible = "amlogic,t7-uart",
>> "amlogic,meson-s4-uart";
>>                                  reg = <0x0 0x78000 0x0 0x18>;
>>                                  interrupts = <GIC_SPI 168
>> IRQ_TYPE_EDGE_RISING>;
>> +                               clocks = <&xtal>,
>> +                                        <&clkc_periphs
>> CLKID_SYS_UART_A>,
>> +                                        <&xtal>;
>> +                               clock-names = "xtal", "pclk", "baud";
>>                                  status = "disabled";
>>                          };
> 
> I agree with moving the UART clock configuration to the DTSI file.
> However, it seems a little odd to keep the XTAL clock definition in the
> DTS, as the alias may not be consistent across different boards, which
> could result in compilation errors. Could we move the XTAL clock
> definition to the DTSI as well, similar to other Amlogic SoCs?

It seems similar to changes in this series :

https://lore.kernel.org/all/20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr/

What do you think ?

-- 
Best regards,
Ronald
