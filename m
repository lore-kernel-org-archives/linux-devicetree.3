Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3CC425CF4
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604099; cv=none; b=Zo8yvA7XFQUVZ/CqDIaveoaf0bnxWt6br6VCuuDsoJNS2GVw6kP21zZMW39UuW2KUpG6dZuDsg+w5ON2v7hwccd7Xe6kB4DK4EWz9FyfzcdgswHYZBdy7zGnp1VUCm4RWpMVd6hueknnfjPKwjEcZY1BFkIZVmgC+Q1OWLvY7zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604099; c=relaxed/simple;
	bh=YN7jywOfwOI6y9/MW4+/QURs+igeKnS3wJ6xDPErbgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QG+wFBwKfh6bebVW0mmP7UUOpNEI3I1Vx+qW1wGoiFUqsSQriPaUjKFxQXYFX62VljdXs1riLFaPdxITG7TAr14NcaCXhqgcVzwdgTnS6rY+7U4xdREKIQ2ZF+KHZpAPdjsr/L0kEHsLxXZuAlRxImho2r/YPq8K9JklFRWnBm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjFUCTGN; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjFUCTGN"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so365341eec.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781604097; x=1782208897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBeImg1GeZ73aPo+Du634svjdTCaD/BADcPkIYViljc=;
        b=QjFUCTGNjEwBTOWLRYJtB0g2/BK/iXo8FBj2f8P2HuDE86Z45kBJcBAUJo/sAR7K+m
         ypvyhUfqWPGLHZDagc8eO1jge5nOPsEzJ9rVGYDpJkOJ5PX89XAp3C9u/1RMYMTp76xE
         gBZ7M86wj3xecho3euzPHw/X6voo/9B/VG4Gn+im3Koa3LOS3x+d9T5qNWNq++1hCwFu
         e6TcHcaf/9Dyjoixdb2PAZUX2yIrG7Ko7vURFalzQjQcqOqTiaikVy/l9aF+6h5YA5vU
         vX+AXKID/AYdHB28HS9TH0C9j6X00Q/MP2I36TzUYPiDATD61HO95h9kLHYqy8VJLTji
         bkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604097; x=1782208897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBeImg1GeZ73aPo+Du634svjdTCaD/BADcPkIYViljc=;
        b=i1XQcrGXSNsJkMFkCRiG/u9NyL390JoHGxWZ0zXePORDX7+qXKKplopfttgBUPvcBi
         QwJ/+r+Q0Do+ijbTh5jWnc5anOtPvwR46TynbUGjHhsjZDxkANonELRe/hfv9eUIaTmy
         qBLnHyGx+fDy9huYvLTYshxlhlkZ7LAtJHrrAUY26pJXHMY8IPglwzxdZ+5b5QawDdsh
         /2zSXGAZ9EakcSeiJlbmyusVa5Ra4rwxAeYx8ecWlHsvh36WB2pgEfRuGM2tQUuFH8Ir
         qQAEM1ItPAVAD2Z1NRf2gwnCcezjooO1bHhkpMjtyKJQTUj/5vz3e1iyR0HHdsh3y+bA
         MSjA==
X-Forwarded-Encrypted: i=1; AFNElJ+TUU4EAlyQKah86PW5n3MVmW8gHf2+bRhAOH7uX5KEQq7ApxMr/5dYAz3BPzwmpiBQCjMeqLiFCpSO@vger.kernel.org
X-Gm-Message-State: AOJu0YykEIF9Ob4jIDECLxHtSCnk1ujrUZcRFLx+sDft711WiDrIri/7
	rtD6PcpbhHUaPmhtY1anqsIDBmEO4zqcAKOYx8Q6qcPIGhrscZF5j5gs
X-Gm-Gg: Acq92OG0FF6NAAJGnkcM4iYgjHqb/smLT7AZoBscIQEtMB/UaaJqqdlhgiNajtKgGgE
	JiW30+S9XfM+Fi7jbHVbaIc8vD9eC2BYk15suTInWGSY78s32tzdpA8NkVnVhFIEiDW/m/6vK2D
	t0kJdyKye8oAO8jyQKhCaAnEk4hsT39r1FF2FrVwVQTKFkyIb/eBK0upegxAwtlZNW9hL5QGwJR
	OH6xtbCYcoB7XQen96jPYkQ37gKxBh52s0futcxi5WKfDLxtVfqtZsicBRpsxZZycWKdJbCYubI
	vBgZ6ghEEotceJEprAUhUxMrDm2TD9JAEKwY7tb8lbrHmHIi4NGMREI8hNatFbj12zQFA2JavrU
	O6Q/7Q0FVk0+ebeaIHNIu8WlXQUndNpqctOVBhiwot7bKbjw2puC89+cErZpKF1La05ZXOm38VN
	idolNOboQuvYvD4aVGo4b41KHipdUI0flx7ooNqGksXEyZpaxRGvB6BXOVgX5YGyQ0UcZZnryNe
	uce
X-Received: by 2002:a05:7300:6144:b0:307:e4fa:894b with SMTP id 5a478bee46e88-3093685d5b2mr8915809eec.8.1781604096865;
        Tue, 16 Jun 2026 03:01:36 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5fefecsm18456036eec.13.2026.06.16.03.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:01:35 -0700 (PDT)
Message-ID: <07761947-12a2-4ee0-9fc2-60511c40398e@gmail.com>
Date: Tue, 16 Jun 2026 18:01:29 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for
 dual-port OTG support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Hui-Ping Chen <hpchen0nvt@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Joey Lu <yclu4@nuvoton.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-phy@lists.infradead.org,
 Shan-Chun Hung <schung@nuvoton.com>
References: <20260615054911.48821-1-a0987203069@gmail.com>
 <20260615054911.48821-2-a0987203069@gmail.com>
 <178153082322.1456470.14205688450934768854.robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <178153082322.1456470.14205688450934768854.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/2026 9:40 PM, Rob Herring (Arm) wrote:
> On Mon, 15 Jun 2026 13:49:09 +0800, Joey Lu wrote:
>> The MA35D1 has two USB PHY ports managed by the same hardware block:
>>
>>    - PHY0 (index 0): OTG port shared between the DWC2 gadget controller
>>      and EHCI0/OHCI0 host controllers.  A hardware mux follows the USB
>>      ID pin automatically.
>>
>>    - PHY1 (index 1): dedicated host-only port for EHCI1/OHCI1.
>>
>> Extend the existing binding to cover both ports:
>>
>>    - The PHY node is now a child of the system-management syscon node
>>      with a reg property.  The nuvoton,sys phandle and clocks
>>      properties are removed; the driver derives the regmap from its
>>      parent, and clock gating is owned by each individual USB controller.
>>
>>    - #phy-cells changes from 0 to 1: the cell selects the PHY port.
>>
>>    - Two optional board-tuning properties are added: nuvoton,rcalcode
>>      for per-port resistor trim and nuvoton,oc-active-high for
>>      over-current polarity.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 62 ++++++++++++++-----
>>   1 file changed, 48 insertions(+), 14 deletions(-)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.example.dtb: system-management@40460000 (nuvoton,ma35d1-reset): '#address-cells', '#size-cells', 'usb-phy@60' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.example.dtb: system-management@40460000 (nuvoton,ma35d1-reset): compatible: ['nuvoton,ma35d1-reset', 'syscon', 'simple-mfd'] is too long
> 	from schema $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.example.dtb: system-management@40460000 (nuvoton,ma35d1-reset): reg: [[0, 1078329344], [0, 512]] is too long
> 	from schema $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260615054911.48821-2-a0987203069@gmail.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
I will fix it.
