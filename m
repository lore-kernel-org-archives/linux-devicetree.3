Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9859021CC5B
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 17:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633340; cv=none; b=g1Mq4cRN/OgRrXLAlhVQTMmHeU50+Y/U0lLVFN4QfJ8G4jBFx9Ztna6f2+mJgUSOeybHhLL9ger/wfJ1G1zCVb3lXAYL1iuAjHPk+HCBgY0F24YvptY9ul23Iy+KGQOvKSWLllQPR5tzqJv7nPl2JH3025bRcWpfPsl7T9a3PDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633340; c=relaxed/simple;
	bh=ETJq2PPi48JVsLsmWI9PZOd4lZiQNUeAf8BRU0YBYTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlnY8RmXPoA83aNVHhKrJ391HX81ZlBY+0Y8iBp5DBMXX4qhvIxNjyN7VofBuWX1msasr01P3IvoX1My0DQwvmjI8SSBu3/ZXYcLA5VVpyH7A+Dt0roXCH3NGE4+wMPQICjSGGxqtZl4YeFlhmiSXH2KLzXODVI2y4gkhs9rNv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wLELYUxH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wLELYUxH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b9b1900bso1426983f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774633337; x=1775238137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yfu/d6+o0zctQTHLu2MWPdnz/JwccY9dTbonya9Zlio=;
        b=wLELYUxHX7osQKoxO2CZUd96lWlg7qNF6VR5x0ztPGEAMyIunRJ+4MKieRHjCrx1eK
         VXW1LA8N4N2cqsh8XrwyuABjr6EmzONiim988HhXPeCemSA7W8XdZ1/iSeK4uA0I2JtE
         2XdOpOfvXTdbz8w1q/+/w1apPYzp+myboRxfbKB59z4QtwKlWJUd7LH7LGLdIzh5w6Jp
         dgutxT2S7uJNyJcuwSlt8lB224+ddNRDj81ltdWjWdFT6ueMSC1ISb6vjdAn3eiJhyy1
         3qgPJZWguLiqshgA/Aa7PFeXq4q1GbyA4raQ9cHB622HitwoW0DIhpJjrGM7/yoWlAh1
         yX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633337; x=1775238137;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yfu/d6+o0zctQTHLu2MWPdnz/JwccY9dTbonya9Zlio=;
        b=a4f3vXRMQ1JQhQx3ghNDhQQ4s0+WRYiLF/QGIzIMkuhRyYvxx1uk5AIQtsfmDgyGOa
         JD2Q7hXGgE7Vf4q1Gy1LDqfJxo5zrzHi/66ip7MzZmvZXhZ0nRVZlDMqFfIPM0NyxAm0
         7PlBASB/kpdUpZhjUuoZQkqaBE1mTl+DmSqbCKzm+eQUDXhWDYUTRTmKYiUlx377YNEX
         XnP2kPcN5DW3fAPreA7iTitrs2K5UxR+tTA+Ni+GDjvlJUsOWTOeB6NbUihyWyv9pyGV
         vntTACFK+CD9srZ09Pr1lSAPmozRnhaLHkfKrq3J1gAedAxKCV72YkoD5Czgwcjy8h3a
         sH7g==
X-Forwarded-Encrypted: i=1; AJvYcCXP0PI2a7Fw6DjU2afdxed+x/48a/mGfM6mnFcg4TqyUBNMcDBHQDu2lQNEaYX2gbAtJEGNrMZTvUJT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68Re74QJg1XZfbeKEVDtsmzwEopJWz5S+ZCdFNa0MRzHg+oMr
	x2sVJej+zWMU5jiinLM/EsDKxUfieenNkgPJ3ovTXJ2e3nWha1Pzn/SSH9jCUd1XABY=
X-Gm-Gg: ATEYQzwlnAJtdPaK3zjEJ4ugobbu9DWkVltqB1c3g8UdAY87hXh2cY5A4O9F8L3+0XS
	qvV9x2yFwKLeiQq9dZ3xjdv/kT2GtZHOoh0ZwNgfZ83JabhXdZ0xtWfqlKMGhgZ2KylLUbnCajm
	cKnbTZQjtCwtUTntmjdHGEwK63X/d6X8NP1A8t48eh9HIOZX1O/5gcML5SmLGmnrzQRVVgDJBmA
	kOLdO7slB9O1aZVF+8argz2Fl5NZ1KU4q0HOpsdiBc+SR9z8gHigcC1XeEdgFW0CKVvCEa5ir6J
	j2CdaagpvtlmT6vCl88C1cnA94PLPsjwSYUQh4Tyi7BrkFQy2bLnCFVP3bXO/SsKQECEJUcgRjG
	L4c74kx6wDpk4LSMzWAaa/r97S2qEOrU2OWtKmsDY85jMdIhUai+bRj37LbFw1RFKcEzHj0wFaj
	THmenAvotwozGDc47RfKhMTeXeTnBBJCjh/lw8
X-Received: by 2002:a05:6000:2006:b0:43b:41df:705e with SMTP id ffacd0b85a97d-43b9ea77850mr5911220f8f.49.1774633336801;
        Fri, 27 Mar 2026 10:42:16 -0700 (PDT)
Received: from [192.168.0.167] ([78.152.214.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919432f0sm17358844f8f.13.2026.03.27.10.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:42:15 -0700 (PDT)
Message-ID: <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
Date: Fri, 27 Mar 2026 17:42:14 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2026 15:28, Neil Armstrong wrote:
>> To be frankly honest you can make an argument for it either way. 
>> However my honestly held position is analysing other upstream 
>> implementations connecting to the PHY means we can't make the PHY 
>> device a drivers/phy device - it would have to be a V4L2 device and 
>> then for me the question is why is that even required ?
> 
> This is plain wrong, DT definition is different from software 
> implementation, you can do whatever you want if you describe HW accurately.

I'm not sure what point it is you are trying to make here. Are you 
trying to say drivers/phy is OK with you but you want an endpoint ? If 
so, please just say so.

I can see an argument for that hence my response to Konrad, I just don't 
see why its a Qualcomm specific argument and of course understood stuff 
bubbles up in review, we have a public debate and come to a consensus - 
that's a good thing.

However, I'd want wider buy-in and understanding that endpoints in the 
PHYs is a more accurate description of the data-flow.

We've been applying DT bindings aplenty without that so far. So we would 
establish new CSI2 PHY bindings should represent the sensor endpoints.

Is that what you want ?

> The CSIPHYs are not tied to a single "consumer" block, they can be 
> connected to different consumers at runtime, which is not something 
> classic PHY devices are designed for. So they are de facto a media 
> element in the dynamic camera pipeline.

The existing CAMSS binding and media graph are not changed by this series.

> And actually Rob Herring asked use to define the complete data flow, it 
> was a strong requirement. I don't see why we wouldn't here.

I'm implementing feedback from Rob.

https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/

To me, here is where we stand:

- Individual nodes - we all agree that
- As sub-nodes - I think the majority agrees this Krzsztof, Dmitry
   I'm fine with it too.
- drivers/phy - I think we are accepting this is also fine ?
- endpoints should flow into the PHY and then back to the controller

I get that argument. In fact I _like_ that argument at least I like my 
conception of that argument.

I'll stipulate to that argument meaning then that, new CSI2 PHYs shall 
include endpoints for this purpose globally.

As I've said before, there's nothing Qualcomm specific about this 
discussion, really.

---
bod
