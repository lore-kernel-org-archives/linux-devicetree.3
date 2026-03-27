Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA48F3F20E2;
	Fri, 27 Mar 2026 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621460; cv=none; b=Qq08CJaIqfy1pLgC0jVN93HFkxFOC6mgxXxMR6M+5/oQNSgUZb4h+gk1FgTQAWukX4sEu0v9hOlvEjjGEB+qdhjAmoFM4+0+MGEeExPeMzHl+0SboIMOydjqFu5se/addKp49FwtDcTGf0aMmHKE/fuH2T0ZxDbiMum9jiCf7vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621460; c=relaxed/simple;
	bh=B4keCgz4A2l6iRmTPeNPl7YLtpj6kCreS+MjycvwNVU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=U6D3XdOWhnybvuYfmEa545m6UahE2T/5YsQAdrHDTsFhm/s0VemoS9tdpLrAOi4qthpfnG/rErOBE7x6ol665BJ/WySKQQ1Ay6nqYtbz2/xu6ihZ5A3jCrcAEf2LFwgunbjj8diYq9IayNM1UnUHecxkbLC942DgTgpSquhelcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Q6242UEd; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Q6242UEd"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E176226471;
	Fri, 27 Mar 2026 15:24:13 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RemHeoGUlZbQ; Fri, 27 Mar 2026 15:24:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1774621453; bh=B4keCgz4A2l6iRmTPeNPl7YLtpj6kCreS+MjycvwNVU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Q6242UEdYnGkMITmednJtWnN7W73/kQKymKpelhsH9b+JswZN6G8HvXM0vk13TfJ1
	 y2uPUww4e6BIIDOolFNxJh+LXQdgSg3XZ7a//HT6F44xjFtYI5uc+BLH6Gky7WwfEA
	 tZdFFCKkkC9pXc4WteNkDoD7UGEn+vt7OA0OwEvWoXdoe4+Kz4BUeMEJOzYT37LVEK
	 YYnesd5LUWNPEK8C3buOHYY0zxzGZOU7EHFOVfc6TfNbFRO0Qn5urqZUtERPLXQiyr
	 vbffMLITtH/1fbdqe/iBvuENcTCkFPyPIbnFUopTqNMtmf0GUFei2Qq+ftTkJsPP1r
	 8JoYLSEqR5Umg==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 14:24:13 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stanley
 Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: phy: realtek,usb2phy.yaml: extend for
 resets and RTL9607C support
In-Reply-To: <20260327-berserk-roaring-quetzal-24dd7e@quoll>
References: <20260326193419.48419-1-adilov@disroot.org>
 <20260326193419.48419-4-adilov@disroot.org>
 <20260327-berserk-roaring-quetzal-24dd7e@quoll>
Message-ID: <7fd85481d499b86a26410d5b90f7041b@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-03-27 08:28, Krzysztof Kozlowski wrote:
> On Fri, Mar 27, 2026 at 12:34:16AM +0500, Rustam Adilov wrote:
>>  description: |
>> -  Realtek USB 2.0 PHY support the digital home center (DHC) RTD series SoCs.
>> +  Realtek USB 2.0 PHY support the digital home center (DHC) RTD and
>> +  RTL9607C series SoCs.
>>    The USB 2.0 PHY driver is designed to support the XHCI controller. The SoCs
>>    support multiple XHCI controllers. One PHY device node maps to one XHCI
>>    controller.
>> +  This driver also supports the OCHI and EHCI controllers.
> 
> Hardware is fixed, does not change. Don't reference your driver changes
> here.

Will remove this line.
>>  
>>    RTD1295/RTD1619 SoCs USB
>>    The USB architecture includes three XHCI controllers.
>> @@ -57,6 +59,12 @@ description: |
>>    XHCI controller#1 -- usb2phy -- phy#0
>>    XHCI controller#2 -- usb2phy -- phy#0
>>  
>> +  RTL9607C SoCs USB
>> +  The USB architecture includes OHCI and EHCI controllers.
>> +  Both of them map to one USB2.0 PHY.
>> +  OHCI controller#0 -- usb2phy -- phy#0
>> +  EHCI controller#0 -- usb2phy -- phy#0
>> +
>>  properties:
>>    compatible:
>>      enum:
>> @@ -69,6 +77,7 @@ properties:
>>        - realtek,rtd1395-usb2phy-2port
>>        - realtek,rtd1619-usb2phy
>>        - realtek,rtd1619b-usb2phy
>> +      - realtek,rtl9607-usb2phy
>>  
>>    reg:
>>      items:
>> @@ -130,6 +139,9 @@ properties:
>>      minimum: -8
>>      maximum: 8
>>  
>> +  resets:
>> +    maxItems: 1
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -157,6 +169,15 @@ allOf:
>>      then:
>>        properties:
>>          realtek,driving-level-compensate: false
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - realtek,rtl9607-usb2phy
>> +    then:
>> +      required:
>> +        - resets
> 
> If it is unclear, they might not have it so,
> 
> else: ... :false

Right, i suppose if RTD SoCs had them they would have been added here already so..
will make the resets false for other devices

> see example-schema.
> 
> Best regards,
> Krzysztof

Thanks,
Rustam
