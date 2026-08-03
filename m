Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BE32FE0F;
	Mon,  3 Aug 2026 06:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738979; cv=none; b=K+X9bM3S37TYDaUy3nzwK9WS5EBbhGgcGCK5nb02ec2QeTf7WiXlrMe1MS5wDqB4LuuYuL39hVsi7JPfmWcTz/YjyCPG3DiQy/i3nnyoYRNI+oorCVV2Xmab5kVRtPNEiLdtL19d2dJAFU1mf+CaCajrOk7fJtsHHy1XjnhoJJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738979; c=relaxed/simple;
	bh=eD4uD0au7R3m8tNZFg54B8N5oNYcysyiSpyWrYx7aMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULXbKQdvR/rlaIpj6l/BluR7h7UZQkubmASeRCwu2WmunnbPoqrqVG6Pn6XUBKgNeGoK25F2+BewezFJGswXjxlKOfFmwWxZpjBGzg7aa9k/U5B85W/VVQg44WX+2LZGjmE3j8qxj9b8MByaSjwL4vxbNWX9J1GVUBLlPuv8MW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOsJs4GW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOsJs4GW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8F11F000E9;
	Mon,  3 Aug 2026 06:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785738977;
	bh=uOhBlcEkFiWLiMksD8mUd9wdhHemOdxaPeOW95S52Gs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KOsJs4GWXAaV/mP/AgYKvVffJ8LXBi2WHNnoxx4xJ1DRQ2jdeUAclENhEloznswI4
	 0LmRsQK40p/nYaplUIphaYyi4cthsvGRNLtsPlm9AJpOi5RXuiGUVwyHcG4EZtNjZr
	 tKu1igSKSvUFssAsBTxfIIFKQD3RWyEaWs+xLvF07NbOas9aNVGNVDFkFiIHSh9PNz
	 8aTntbEHVnaXSlAuBOc/IAu41YAsBKJhvPaJB6FWP+gFNRvdPMjIcUNHPLbM01n3hL
	 ZIal6zFogrf2/QeGyud7gkQtmpFrY/4pzSVo4CAbodx6OBKwmHKkOaYTvEGaylFMiy
	 Weiehi3PhG6PA==
Message-ID: <fe9d0f2b-3a86-4950-ae4e-fa5182706a38@kernel.org>
Date: Mon, 3 Aug 2026 08:36:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HAMOA-IOT-COME board
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
 <20260727070758.528-2-yuanjie.yang@oss.qualcomm.com>
 <20260730-alchemical-phoenix-of-excitement-fff9bc@quoll>
 <amsfSzgMArno9zRH@YUANJIEY2.ap.qualcomm.com>
 <2eb33f53-2320-40dc-8098-79fc4f48af8e@kernel.org>
 <28fb7750-bd46-4f3f-a3ba-7cc1fb88b235@kernel.org>
 <anAx4kqb4PwEImeE@YUANJIEY2.ap.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <anAx4kqb4PwEImeE@YUANJIEY2.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/08/2026 08:14, yuanjiey wrote:
> On Thu, Jul 30, 2026 at 12:23:56PM +0200, Krzysztof Kozlowski wrote:
>> On 30/07/2026 12:08, Krzysztof Kozlowski wrote:
>>> On 30/07/2026 11:54, yuanjiey wrote:
>>>> On Thu, Jul 30, 2026 at 08:51:40AM +0200, Krzysztof Kozlowski wrote:
>>>>> On Mon, Jul 27, 2026 at 03:07:16PM +0800, Yuanjie Yang wrote:
>>>>>> Document the device tree binding for the HAMOA-IOT-COME board based on
>>>>>> the Qualcomm X1E80100 SoC.
>>>>>>
>>>>>> The platform consists of a system-on-module (SoM) mounted on a carrier
>>>>>> board. The SoM integrates the core system functionality, including a
>>>>>> SiP containing the X1E80100 SoC and its supporting components.
>>>>>>
>>>>>> The COME SiP hardware is effectively the same as the SoM used on the
>>>>>
>>>>> Effectively the same or the same? I googled for "hamoa iot come" and it
>>>>> gives me zero results. Provide some URLs describing both.
>>>> The same.
>>>>
>>>>
>>>> Here is pdf about the "hamoa iot come" SiP and SoM
>>>> link: https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
>>>>
>>>> The preliminary figure provides a complete overview of architecture, including the SiP, SoM.
>>>>
>>>> In Block Diagram
>>>> hamoa come Qualcomm X-Elite SiP Module is the SoM on haoma evk.
>>>
>>> I see on that PDF "SOM-6820", not "Hamoa IoT Come".
>>>
>>> I have an impression that all this and previous bindings and DTs did not
>>> match reality at all. Or did not match how upstream works with such
>>> hardware.
>>>
>>
>> Adding more: I did ask in the past to properly represent SoM and
>> carriers. I pointed to other examples how this is done correctly. I did
>> look now inside and found absolutely no reference of actual product
>> called "Hamoa IoT" or "Purwa IoT". For sure there is no "Hamoa IoT Come"
>> SoM (sometimes COMe appears).
> 
> I check the hamoa iot evk board page:
> https://docs.qualcomm.com/doc/80-77183-262/topic/Getting-started.html#get-familiar
> and 

It says it has "IQ-X7xxx module".

> purwa iot evk board page:
> https://docs.qualcomm.com/doc/80-80022-297/80-80022-297_REV_AC_Qualcomm_IQ-X_Series_Evaluation_Kit_-_Linux_Bringup_guide.pdf

And this is "IQ-X5xxx"

So how is this anyhow related to Hamoa IoT or Hamoa Iot Come?


> 
> And I see below info:
> 
> Dragonwing IQ-X7xxx EVK components:
> The kit includes the following components:
> Dragonwing IQ-X7xxx EVK mainboard
> "System in package (SiP) "
> 
> I think the current naming of hamoa-iot-som.dtsi and purwa-iot-som.dtsi in the
> Linux device tree is incorrect. They should be renamed to hamoa-iot-sip.dtsi
> and purwa-iot-sip.dtsi.

som/sip does not matter here. That's not what we discuss.


> 
> hamoa-iot-som.dtsi --> hamoa-iot-sip.dtsi
> purwa-iot-som.dtsi --> purwa-iot-sip.dtsi
> 
>> Look, this is a SoM:
>> https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
>>
>> And you can find corresponding bindings and DTS in tree.
>>
>> I refuse to accept more of this fake products trying to imitate well
>> known industry standards in their own way and effectively pushing some
>> downstream crap, just because that's how we do it in downstream.
>>
>> Unless you can present us with such product details matching what you
>> send, I will be NAK-ing these and future patches like that.
> 
> Thanks for your tips:
> 
> I check hamoa come som page:
> https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
> and come board page:
> https://www.advantech.com.cn/zh-cn/products/1-fc23ff/som-db5830/mod_16b1a718-27d6-4a4c-8684-e8f2a8e9c57b
> 
> So I should rename come binding with real devices name:
> binding should be:
> 
>       - items:
>           - enum:
>               - hamoa-som6820-db5830.dts
>           - const: hamoa-som6820.dtsi

No clue what is this. But the links above are Advantech.



Best regards,
Krzysztof
