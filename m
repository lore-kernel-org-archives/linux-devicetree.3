Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BC92F7F0F
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787484584; cv=none; b=VfcuCjXI85yMZaCYpJVtcrhe93G6GUUbbHvx4HwoBDcrCzN336d3at5khHsYh3oIpAqnYVJ8wvlxXKNjYiDlqepiDH8UfDT1D6akhXUe+t6onS0pEyxU8KMjRlnRx9uY9e/usPhY3qBWSY3h7BZivVJgIvjukppNfShsNKN3URk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787484584; c=relaxed/simple;
	bh=hfHnkTHbv3Z3CmIesaFyD4n9krXP06WyqHie6wge7HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6Z/eoQrjSDiTcZ7wapwz7Xx7aChBUgz3m72y4mwOY/3g2uDNnh2BEujplxTnZHsWz4qDux67BO4C2/VHtG4Lc3GEaO90z1sKMfCL20abeXNXp6pzpCGMpzHFNL4LfuzxCdtEAkYg6VEDh7oIU4chnYiTqABh02dHPRj4W/cJgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b966dd74so10841225e9.3
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 04:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787484581; x=1788089381;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gic4a9l1Tysqkb/KXwcHfceHx++tdNsSZ7fJK8rIj4o=;
        b=I5J3+20dOf55kT0xwx39pMHVOpaPN4uqCoodlROFcy72hxd9oCIeiPZPlZFjZqO3Yy
         u9LYttOGHltLcYlQNJD+sX0zCQEKZyP54oY/6RBp2ZAoe4bKrN5fKo5uoTJ8irLOF9KE
         PYCklFvetZZDXncYCEZSb33RQ1YiX3VBl0ijd8HAYZainQk29pndTaPuYdSW+Q0EMLWb
         S8XEvISGXOKcz37RgsoYl39rL3wRgUwOrFrXUj343v6QOhKA69J/vjOEhdg76XlLrTcK
         1Xadd6I/LzWUABf5Bte+k88gZae8BqCM2Set58IfWx9QyrV9opF2eVu89l3JnVoMJRCi
         4lJg==
X-Forwarded-Encrypted: i=1; AHgh+RqqnCnMkAxCgca4Dv+rM/WYr2pp+amrL+FAXrKC4TMMgpjMqSBiM8cRTwGG0FJqWaJiVemkC5J6ie5D@vger.kernel.org
X-Gm-Message-State: AFuF++nH2+BWV8+nxh6D/iOZdGZ7DVANdl4debdh3VSsdZAun4ZWHrY7
	S8PlWRH1fI0xNSXbDXYfUPjpJxsVahUZL20YyxIiZ94ExuvcLIv1Kbpo
X-Gm-Gg: AR+sD130RGQosNGev2jAkVwZMSiDR/g5715Odo9MAfGLD9WBfKc5ibhjUdOEQWHHSxb
	jQAff35kp1RHvYfBUCMEbm3mxBv33dVmr6vhJyyxBt1BbpMLTi0ibC+WIMBSxNZWhVMtTGM29YB
	rf+3ho+xu5NoD76BW6UwBtXJ3HSSNQ6Aqn31Hnt/rDxdMF23OalYiM99XV65xFADb5spWaVC92C
	Hh8n5VvKOGE4dlTFJvnOq8liMqHGNjzxv68oHAdy4Ia0j+A9RmEKwQKh2pgOC4ZtbjvkQIBryHR
	wqf24OlDXexybD35jNche95jiNx6e+zNVtY8ddhVJmp/HWWe34jAJWRgagHjXiojx7f/Q0uwNOx
	2Ydhf/X+SRcNkhoWSjQbAPCxfeemPG8KKPUPk+ewK5Pd3Ka03vabm6zskKzPsT2+y++/b267MN/
	C2PereWtwGgKVkHIviYDX5ylaxzYSiaztO3aZNfkWPTcmxyYrlh5jyAwQwsilWKjYvnJjztC52Q
	eR66LdafYrHC2yBFrjsGuOMbIxtNiwr
X-Received: by 2002:a05:600c:548c:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499c19f514emr95373715e9.14.1787484581078;
        Sun, 23 Aug 2026 04:29:41 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c3553681sm46417835e9.1.2026.08.23.04.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 04:29:39 -0700 (PDT)
Message-ID: <78722571-a418-4962-b1ac-216519303aa2@linux.com>
Date: Sun, 23 Aug 2026 12:29:38 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/08/2026 03:39, Xianwei Zhao wrote:
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
I think keeping it in the board files is actually better here, as the 
crystal (xtal) physically belongs to the board rather than the SoC. To 
keep things clean without moving xtal into amlogic-t7.dtsi, I've updated 
v2 to modify only the board DTS files.
