Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7C03F4DE4
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563955; cv=none; b=rn/Z9AHIEFRjSMV08gk+yT0mA9La6I2LfoGNFn+K/zDzImY3qadvwogUHPJs7Y4GT+HC29ZUdcL+z4XOKrn4sFuXV2MAWgW08nZ9OTyMf0nNjvhNaT0QzuOLBjWaXwXt318rrbCX/PAtzzrVTQnmnH2aUZBjPM4cHMy9hcUfTDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563955; c=relaxed/simple;
	bh=hJWivipbzrq/Yp85Ioax6DLsoXVKNqX9wEPdMO5xGIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uDCXdHQOJRnr0nLG40Eoe04YpYxzBr9vCU1fR3FNq9NpENpUWpdYYDRbDnHxSalb/P8VoUM41hE89PormMfFJpI6s2coyVpKHtp7wl6qPlfyENbuzJ6yFjoZEcylJHs3xH1rUdqqoyHdIiPnopWcO0CGckRwFbxwSSTtP+hOtaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so21325805e9.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563951; x=1788168751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJloPN89elVAin5U0ydRdECi+cW4StvyY0mXdouFdaQ=;
        b=MOYupwassMouc/oEk83vSxoY4Wb6pYWQyqyQp3W8DUH25hxNsQ3M81JhhCpDAK08+Z
         K9fF3BFJgUguTX6/WwcP26Ss8qzMLMrPn8+oV0A9hy4rUGDtCi/WLBZ1yhXVYmILlxax
         hOxch9YGMM7Ongzftpl/UEZC144mUqqcvYW2c2wKpo4ybO1gP/ZWw0NrrLEXdtIFr+1E
         u7ci1phxPVirdrj0E38fYyFUe/Qzyt/3H7r7ZijuP1rhAL1oy6NU1hORIKNI+mKiqCmd
         EkmBoxx7c/WyNXIQA8ascVebsiKmrUtjyNRzr4lMJeQSzsMzcL05gfHf0xVOuiFFyJhB
         ivnw==
X-Forwarded-Encrypted: i=1; AHgh+RplZuXbzRdCPFyxsgoC9IGfbsFB++jJJJKehIio6wTMoLF6laujarppEhMnHjwV5thmFY3UM1KHHnxp@vger.kernel.org
X-Gm-Message-State: AFuF++m06JK+H14Jf68gDylWG6UWr3UfKNIhzJmoz1y3jhbMS1TzuSAq
	wwDh/kidxc8FXq4rkc/G+KG32rrdUX457PUBrFuFiY/zxvb9ljTk8X2Z
X-Gm-Gg: AR+sD11Z9DA4X/F3U1Qt7xPXBjarL3TaqvvvkJF6iT2udItbAk3clTBKbUzLYAM5xTR
	6BBg4r4ZTjaDzEl0OKlGbN/QZnX2oM3Ji4XWGiePumnvvVqeL9QquG0rhF2ttE3PqaHdIHQGO92
	u0zobPukd/97NIBoFC0OwN0QrZZD3ZysVF16ZpkyQZL785KrlgYAkYmtGdNRobEUlz+6vWiYhGJ
	OlEpoeUxlB0nT3apUL6r+oZhFkRGjZQVvIPhIC0IcrcI3ydUhSKc1NdpVuliQvk5ubud+Hjpox7
	TRwr+jh/kokPKU7JLwYhyLoC5URRe9qo+bDSTPHXSGdhrSit57+9Pa3bxXhH4MXn0t/JhWnpTcL
	d0qU814j2GdMpA6TKPT4hGi1HCgXdkGCXIk+B6LGncf5EQ5YdjgEgdHWKgR59xOFtMpcyOzg6v5
	dcaAMKF+8iF9h8NSP3cPqGUU5WdujtNsRNXirWnRf1DhuSSP5/plL4glnZuliJPOWgc/F2qgvG9
	XaVvdJdiKJhaHquT4Ekgg==
X-Received: by 2002:a05:600c:1387:b0:499:7a4f:d13d with SMTP id 5b1f17b1804b1-499b8313ad3mr240196255e9.4.1787563950900;
        Mon, 24 Aug 2026 02:32:30 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b914bfcbsm117572285e9.9.2026.08.24.02.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:32:30 -0700 (PDT)
Message-ID: <7c7f447d-8796-4f6e-b607-5251d9129665@linux.com>
Date: Mon, 24 Aug 2026 10:32:29 +0100
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
 <0969d872-faff-4b0f-81ad-972b7aa9bb7f@linux.com>
 <78721fe3-d9d0-4f85-a1ec-a01ebbf4f9a3@aliel.fr>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <78721fe3-d9d0-4f85-a1ec-a01ebbf4f9a3@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/08/2026 10:15, Ronald Claveau wrote:
> On 8/23/26 1:39 PM, Lucas Tanure wrote:
>> On 19/08/2026 08:25, Ronald Claveau wrote:
>>> On 8/19/26 4:39 AM, Xianwei Zhao wrote:
>>>> Hi Lucas,
>>>>
>>>> On 2026/8/19 03:11, Lucas Tanure wrote:
>>>>> uart_a lists the 24MHz crystal for all three of its clocks, because
>>>>> the T7 clock controller driver did not exist when these boards were
>>>>> added.
>>>>>
>>>>> That leaves the real UART bus clock without a user, so the kernel
>>>>> turns it off when it disables unused clocks at the end of boot, and
>>>>> the board hangs.
>>>>>
>>>>> Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
>>>>> the placeholders from the two board files.
>>>>>
>>>>> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add
>>>>> initial device-tree")
>>>>> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
>>>>> Signed-off-by: Lucas Tanure<tanure@linux.com>
>>>>> Assisted-by: Claude:claude-fable-5
>>>>> ---
>>>>>     arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
>>>>>     arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>>>>>     arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4
>>>>> ++++
>>>>>     3 files changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>> index cab2ee9ea0d3..dcbcd08a78b9 100644
>>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>> @@ -33,7 +33,5 @@ xtal: xtal-clk {
>>>>>     };
>>>>>
>>>>>     &uart_a {
>>>>> -       clocks = <&xtal>, <&xtal>,
>>>>> <&xtal>;
>>>>> -       clock-names = "xtal", "pclk", "baud";
>>>>>            status = "okay";
>>>>>     };
>>>>> diff --git
>>>>> a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>> index c41525a34b72..677069e58f30 100644
>>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>> @@ -266,6 +266,4 @@ &sd_emmc_c {
>>>>>
>>>>>     &uart_a {
>>>>>            status = "okay";
>>>>> -       clocks = <&xtal>, <&xtal>,
>>>>> <&xtal>;
>>>>> -       clock-names = "xtal", "pclk", "baud";
>>>>>     };
>>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>> index cc371fcd1896..7847582e77ed 100644
>>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>> @@ -587,6 +587,10 @@ uart_a: serial@78000 {
>>>>>                                    compatible = "amlogic,t7-uart",
>>>>> "amlogic,meson-s4-uart";
>>>>>                                    reg = <0x0 0x78000 0x0 0x18>;
>>>>>                                    interrupts = <GIC_SPI 168
>>>>> IRQ_TYPE_EDGE_RISING>;
>>>>> +                               clocks = <&xtal>,
>>>>> +                                        <&clkc_periphs
>>>>> CLKID_SYS_UART_A>,
>>>>> +                                        <&xtal>;
>>>>> +                               clock-names = "xtal", "pclk", "baud";
>>>>>                                    status = "disabled";
>>>>>                            };
>>>>
>>>> I agree with moving the UART clock configuration to the DTSI file.
>>>> However, it seems a little odd to keep the XTAL clock definition in the
>>>> DTS, as the alias may not be consistent across different boards, which
>>>> could result in compilation errors. Could we move the XTAL clock
>>>> definition to the DTSI as well, similar to other Amlogic SoCs?
>>>
>>> It seems similar to changes in this series :
>>>
>>> https://lore.kernel.org/all/20260420-add-bluetooth-t7-vim4-
>>> v4-0-9505df0e7016@aliel.fr/
>>>
>>> What do you think ?
>>>
>> Thanks for pointing out that series, though I wasn't aware of it.
>> And after reading I don't agree with it. The clocks are not redundant,
>> they are there because we agreed sometime ago that xtal belongs to the
>> board files.
>> So I still vote for my change in v2, that I will send in a few minutes.
> 
> I don't get why it would be better to define the exact same clocks in
> each DTS file.
> 
> The xtal recommended characteristics provided at the SOC level can be
> defined in the DTSI and overridden, if really necessary, in the DTS.
> 
Hi Ronald,

The preference for keeping xtal in board-specific .dts files rather than 
the SoC .dtsi comes down to DT hardware modeling principles and upstream 
maintainer guidelines:

Hardware Topology: The xtal is physically located on the board PCB, not 
inside the SoC silicon. The .dtsi file models the SoC silicon internal 
architecture (clock controllers, IPs, registers), whereas .dts files 
describe the physical board layout surrounding it.

Avoiding Implicit Assumptions: Defining a default 24MHz xtal in .dtsi 
assumes every T7 board will use the same oscillator configuration. If a 
custom board design uses a different crystal frequency or an external 
clock generator/TCXO, overriding a .dtsi-level node can lead to messy DT 
overrides or silent clock rate mismatches if forgotten.

Upstream DT Maintainer Policy: Kernel DT maintainers consistently push 
to keep board-level hardware explicitly declared in the board .dts files 
to reflect actual physical board components.

That said, I acknowledge the trade-off is minor boilerplate duplication 
across board DTS files. If the Amlogic SoC maintainers prefer setting a 
default 24MHz xtal in amlogic-t7.dtsi to match older SoC generations, I 
am open to updating it—provided the maintainers explicitly prefer that 
tradeoff over strict DT topology modeling.

Best regards,

Lucas
