Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4C851121E
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466228; cv=none; b=EF5wOvGfpPvCfwEMwcI7lclSFRK6GxOiJ2gRyRWey17QjVKKPXp19B4bVn59ltk0BdD6uvO9WgwbjNBYbelMDhjqIPNe/MRpLmv72cyPYTQlGF4So6GowZFfzkchGJCoV/7QGwD+NO/hUTkUdoZy/1yzMb/ZcbKS20QFYdlwQuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466228; c=relaxed/simple;
	bh=Rl1raqxGQ75u1+SZ4RF/ZLGm1dnMgsmV9A8zancVso4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjR4Bwq3cjhuHAYItSCSlbMUQJF7HuMb789VPyKPkjB2V/IHoUhEWyVXkYAFtBIbQmevn4MvRR8pFwzebAbQuleL9M/qMtpwRX2WxsUHFCXdJux1wdrcXr/T3YENs/Bg9Bm9DHX/YrDW7ffRRggtIp7I7Xr5k+U4Nd4ZFz2PRDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NHjR3ecJ; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NHjR3ecJ"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5bf9466867cso136030e0c.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466211; x=1789071011;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yM2SvBd8B0ZdcJRRaa1PvZZkDma2EirQ9rf6ZMaxoZw=;
        b=QrbQ50EDmck9z31doAWIH28I0MuEroAGLI+10S+qTpmlrdf9A96ZR246r3bZkZZAI2
         SfHHF5jauZMYHrCKBWxO0/J68if7OsCIY2rNUOCciI6yHg/gXGwbUSPQMB/2o8WQYJSP
         mVBwrUM6V8I+hjsybZwf5kcEx/bdrFBXySO2as6TsTDfduL5ail1sqh31WJgyBttkS/z
         1yV354wztXg/sRvtfj8vITTrIkmKX2/o1fnFtMviKPBTNdLGgBHqKL0dysAbZcsnI2Bg
         S7tijdAm/cX9hphCBEF2GMZzoMQQfMr/9jmrNClh3PqH34N7Hr9xc2qR9RA5kcuVEt5k
         +ryA==
X-Forwarded-Encrypted: i=1; AKwUvBwf4fGyL/cXWkTr55sokFsbQU7HOOCCnoqFhcCwjtBzASpj70J8QLWuI0K33TT6hdQiMlPM8LdPIpLo@vger.kernel.org
X-Gm-Message-State: AFuF++lkU6Ska3BfMCPCqX3a1wmfUNRY7micdtpwX3+0DnM09jEOcjVQ
	k5vXEFnbnbuCVYbZ3rCcBzGMSb5FbxZzSVT95PvPMH5mJ/odPDPzU3Qht2eqBhXTQky+Xv869b5
	VcGCWtbL+6+VZaDP0cXSeWn03jQoxM7pvLQnEJkvbaI+9LUPlFaBoPI5A0nHVVTx85N8zzza29E
	3ZqpVu/Mv0qnfTiO6O2heVd1K/J5Yy2xB7y0IJ3rqPg5SzfYLyZcPG3uGH3fa6y2ISyqQHiKzXQ
	BK7ABym+5/u7SPWhdUJ/A==
X-Gm-Gg: AYBFou3UAc6LD7IFEn4dYbBKEFokop7zOZvRkVsTw15jyseI1iHTEXnA4ImcsdZKauE
	ZglmSeiOLFaDQUzvy5AsEMGNzcVRNp9axyfBINGQQi/JbQI1ipi8cRbEfhGlvbQWHYfIHwvosEa
	JoMD9QiepwqA5O6uKPKui7KQphDJ1uKdNKnHu8I7oKaI6ppDQg4M3q79DezGj77h88QC5wGx8qb
	hKABhfFZKq9NaVyM8AhEL8ODKSPWSLFsoIOr4Q5ROG0p9a6ZAZyxLRrl+C0hrs1t9kw/ntcFdQj
	2w1+cuUbt3w12FXg5EEBJoIYCJ82hQoj3bFUM+ScgoO5smLt9FGJaj/mzs1XwGA2vW8hXnTd33U
	WtWNwTr8Vq+gffZO7N9x3vB3k/ooex2vxoT8p5NJyEIVycQoYFM12YPoLJNKWnWZ2p77/4E650e
	vAiGJAPoqbYNfkwP/61mL8sPOHzPdDq8tIqV9kn11IR88=
X-Received: by 2002:a05:6122:8b18:b0:5c5:732c:f4f5 with SMTP id 71dfb90a1353d-5c7ed4e4296mr378231e0c.8.1788466211439;
        Thu, 03 Sep 2026 13:10:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c7ec232ce8sm259097e0c.5.2026.09.03.13.10.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:10:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9103f4ddce5so3146406d6.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788466211; x=1789071011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yM2SvBd8B0ZdcJRRaa1PvZZkDma2EirQ9rf6ZMaxoZw=;
        b=NHjR3ecJY8DEnPeKhSDJh/xU4qOjVzcX/ZLtEjHyz7OffwRSERF9eOur0G6VqjqIzv
         sfQIkvvuqislYmitdy9Nsn3gEQNnBFoRB/hjm4YerR3Vvj7z+THUtth4wzeFB2GWqAYF
         zCU5Zb+BpkcozG4j00UEeyHdHQ+aKwEOZ7WV8=
X-Forwarded-Encrypted: i=1; AKwUvByJAkEmlkdy03ZeZWchw+R0km5/ispDvCJcXIOb7VAnRbxt23/rtYXcNpyacGOegDVBa7rpW8QgrVyj@vger.kernel.org
X-Received: by 2002:a05:6214:410:b0:910:3179:7342 with SMTP id 6a1803df08f44-9103eefd244mr19674156d6.5.1788466210674;
        Thu, 03 Sep 2026 13:10:10 -0700 (PDT)
X-Received: by 2002:a05:6214:410:b0:910:3179:7342 with SMTP id 6a1803df08f44-9103eefd244mr19673486d6.5.1788466209956;
        Thu, 03 Sep 2026 13:10:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406871b6sm2886536d6.32.2026.09.03.13.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:10:09 -0700 (PDT)
Message-ID: <754d7b80-c776-4c38-bc47-301a3e69fa7d@broadcom.com>
Date: Thu, 3 Sep 2026 13:10:06 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: broadcom: bcm2712: Add USB OTG port
To: Andrea della Porta <andrea.porta@suse.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>,
 Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
 <20260802145109.728793-4-pbrobinson@gmail.com> <apl57BlWIkOWjWAu@apocalypse>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <apl57BlWIkOWjWAu@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/3/26 06:45, Andrea della Porta wrote:
> Hi Peter,
> 
> On 15:50 Sun 02 Aug     , Peter Robinson wrote:
>> The Raspberry Pi 5 has a USB2 OTG port wired up to the
>> Type-C that uses the same IP in earlier generations so
>> wire this up so it can be used.
>>
>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
>> ---
>>   .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  6 +++++
>>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 25 +++++++++++++++++++
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
>> index d998bfae91acb..e5030da60f9e7 100644
>> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
>> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
>> @@ -3,6 +3,7 @@
>>   
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/input/input.h>
>> +#include <dt-bindings/power/raspberrypi-power.h>
>>   #include "bcm2712.dtsi"
>>   
>>   / {
>> @@ -239,6 +240,11 @@ bluetooth: bluetooth {
>>   	};
>>   };
>>   
>> +&usb {
>> +	power-domains = <&power RPI_POWER_DOMAIN_USB>;
>> +	status = "okay";
>> +};
>> +
>>   &hvs {
>>   	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
>>   	clock-names = "core", "disp";
>> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>> index c73ed9e066662..f650a5cd8462d 100644
>> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>> @@ -55,6 +55,13 @@ clk_sw_baud: clk-sw-baud {
>>   			clock-frequency = <96000000>;
>>   			clock-output-names = "sw-baud";
>>   		};
>> +
>> +		clk_usb: clk-usb {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <480000000>;
>> +			clock-output-names = "otg";
>> +		};
>>   	};
>>   
>>   	cpus: cpus {
>> @@ -693,6 +700,19 @@ v3d: gpu@1002000000 {
>>   			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
>>   				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
>>   		};
>> +
>> +		usb: usb@100480000 {
> 
> Please fill in the missing 0 in the unit number. Apart from that, LGTM.

Took care of that while applying, good catch!
-- 
Florian
