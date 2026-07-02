Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE63171BB
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 00:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950932; cv=none; b=bLCl4erMfsI15F7u78cy/uIM6+AwfMuqju7fbbumNzAr0DJCmhu19d0U/S3rqxoky8LXx+Igt7qRL5PBoXMMIahgd5B5CGj9aUj3s5pK7q6TpdmwMMxwDHwGyT0ZoH62nnu1hF4ldip6/OrAGT4ISDQRDf/GLr3P4fU3UL5yRaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950932; c=relaxed/simple;
	bh=vpK3lrRvtjtz1zpn4+fNk4iRculZWTOVXgTV2Q/9+EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IM+BBL7z5fldx9HYQ5AolAf1m13nuYBcBgo03y+0A7cO/bcDbKYasOFJwRLYzlEY+5KoW9/VXjEsa6paHCkcPsXq51XyBht6nQ3VxxQ6s+Xd+vIRt1CmsE7cvtlhVzt5vNobEtV2Hm/O6b9EL2XswS4wdb3sA9oFePCqjebiDhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o9LbZoJ/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o9LbZoJ/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so6521815e9.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 17:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782950929; x=1783555729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNsykQwqe+udfzbubaksG4wXVqyFa0ncqpop64TNBKw=;
        b=o9LbZoJ/XoY1XaRCsmwpSAqHflUxEAKDEvwGyoW+kZHPC3JePkWyK/BhveS5Pk0Agv
         g3ZuwZRg8wRMVb1T3M00kos7E3f80aUTcnY5BqIEOJqJUSf22edqeBISnaMTegz4QS78
         seDRc/oOJZx+ymVyd4zmXN3r1AFA3s6YDHqq0GCrab393aBuZeMdfWCt0BtnwzDJZAY4
         iUctKhYprEzq8xj/PEzPOdEXZM5yvdO4D5yxRPDF7LgSWgfzP6He+7y218ont+yosGD7
         TD34jI0xYmqR8kxnQmMVQv989xoF9xO3ADj2DgGepsE1SlK6R5QXuL4TQxLdzZ46SGGP
         sztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782950929; x=1783555729;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNsykQwqe+udfzbubaksG4wXVqyFa0ncqpop64TNBKw=;
        b=T2HOXF3FhDY3E+9CyP+DFXd/1K5tnxu4/h4TRUP9FK5reAWUZDB2Nr2e1yimhZeWnO
         QIyCbGGdBd45D95I3bMdmpXY3V2BCOZAWzqCGGlvJm8m8MAKPnWO4UwJl1tI+SI5Q9ol
         Wp6xST9WKnZPtBd055NEhz57jdBUMS+o1Zvf3BKTsWVYorer+pSCk4kV3+VvjSoXh2n7
         U3OJB24mT4UhzWhEeVPczxXXbIc71k3leYge8X6P8dT9tYNd+jIXMwnkSf4EloucOOat
         2nLgFamKAsKTPdC7xID6gA3pZW9dAa8MKGwSlgfYm4OrDZ5SbTMJRBogrnGM1Q8IWGX6
         cYxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oBy3zP1tL4mrtwWxgtYv5vJmCsfXruBnJjMmTEIUKRPlcxWfcw57S0nuADNX/R4dsIKkbw1OcJ6YK@vger.kernel.org
X-Gm-Message-State: AOJu0YwCn1Pqn9wU1WjH9vz/LW3CIUeXDThGweh+kTrBDdbSbvmVW498
	Al9W7fBGjCcTBVB65/iHRVLBW+DHRTnDRHMgpBuG3RdeB2lvAajXAWYsLzPJ9FykEZQ=
X-Gm-Gg: AfdE7clV4fcNizc9f3Brvd2hT+JATz2VhAcNxYtS3QnTmR1jb14VRfgKr+vQnP6/Acf
	a5wBoRgWxbqLJcaqK3Y9IEfGw8/D3stcLkntCTivreOQ623d8aPKDbn8fEse8CRo6iaW3DTr/kO
	olg+RVlvLD9hUyhdvvJtDMbOyCI7nEa2IS1/97BCAn450z9TxPPzfUbaoZiAoEsYIfKze1CYi+v
	96+avbNMvlhT8oRi0OGY93V5euJejnnwsfCkO5adyVY8CCDalndp+CywQSHCx17xVZ8IIbDHNkf
	hFuNg5cCGq7V98uLOYpE08K5AWyYDmy7O6fSJ2UAmkjBhMtYshbj/1wXPpETiefD9pho11YZtyi
	cIHO32TpVdc8zjVHw6j6TA66rddvy8r2BqKAVGQd0kn/X6Pip/z0HGCL4czWJIfO8upWTU81yGh
	fZxO7ZZgtRym/ouxM76oqTr+qf
X-Received: by 2002:a05:600c:8b75:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-493c2b3ce9fmr53986115e9.2.1782950929104;
        Wed, 01 Jul 2026 17:08:49 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.66.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bbcfsm1790375e9.6.2026.07.01.17.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 17:08:48 -0700 (PDT)
Message-ID: <6b6492a4-7610-4dce-a81c-8dc0387a4061@linaro.org>
Date: Thu, 2 Jul 2026 01:08:47 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
 <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2026 00:37, Vladimir Zapolskiy wrote:
>>
>> Inserting bus-type into the PHY layer is borrowing from one domain
>> linux-media and pushing the concept into PHYs.
> 
> It's the other way around, "bus-type" is an endpoint property of media
> devices, reference to video-interfaces.yaml to get more details about it.
> 
>> phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's
>> suggestion will specify the mode.
> 
> This cell is just not needed, and unneeded complexity should not be added.

I'm going to stick to Rob's initial guidance on this.

https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/

Happy to revisit if the DT the Gods so command.

---
bod
