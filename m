Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6897332EAC
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808405; cv=none; b=AZqN+GgNNR55rd8L5pHxpdFGHdAWjxrmOns4WLEvwPcvSzhrhT7bVal/XBNrCWrCGZPL0Xi0wp82uscv3wFR298aSuDRFhLLoC1LAWBwdpdS/F7Wga0oLaa4/4wSFP3iGM6/nxfFs/ofCFLlVF7O+kP5KyCoTlcmgCtYm9f8zkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808405; c=relaxed/simple;
	bh=GBGCIVS5N+RaJ7icTp4wgwTB79qWgs2D2v5gmbrA8bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=or/sXXHX351YzjbF5B1kWyykH7tLM/xAjfVs2hXLCJ7si6aFqqYBjOzexDxDVXZHM48UQL9a2UChDBzEmI0nhWKQeH8zGbkgakyBixliAa+XV8Pp9igJrJ5V899fQ6B18+hnDQwbVQOg5wyc1kaR/5lL2fQNE5QrQ0T2zSA5dew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xWtgbwQm; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xWtgbwQm"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9b1ffbb9f5so252622566b.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 01:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775808402; x=1776413202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxA5detxxijNUecQFSx43HHyt88jXCieq2fj6pzLvOQ=;
        b=xWtgbwQmactRlBEr6xGCmlUiSfkEDvUfPzy/cocsyfyeIEmDiUBpY8vOM1Mgo4zilo
         +mCirrmxzV3z3pZk7KGk14DKlFocDelc2pHCi55IqKDn8WzJsw+6x56qahHzCRaZFqm2
         ozJqLXHlux19IAInOjaJS4zBFuzI7Mmo0559StKCNcpY5DZd+fODsMnB3UOity6qxeT2
         HWwOWevjmRhBFyI+xHfvLJqZcuCHpW7J6SBbCu9tbazdaQfdLeEgGyIXsPfiuFOWVYys
         6Edn3ZHfTy56DP1NOk9NMFyqupCT0iKEfBwypz4nO/Y8n5KmtUeZa/dckDvTNbFnEtmo
         x23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775808402; x=1776413202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxA5detxxijNUecQFSx43HHyt88jXCieq2fj6pzLvOQ=;
        b=DTVJtn1NNCxMFgiehBcEiPcyOkAeERtYNBVgjkiLdytvTtOXdwA6RX5me2DhpWVAJ4
         kW1/bscj9axnkME6bW7uBOJw/LzH/KHMvv4OfA9aIOEnCjj0p7/gxUSPRFtf+7LwL/Ye
         s/g3QjjMEYQzJ7iUs24jEgdZtV6GQ1U5Ggfzs9AWyQJEhdtmSYcc1z+nvJ0lDn3HPYgV
         JB4tTCi3tvagm/qGZWwabWQ9QyqXA0hA0Q9eR0slxJmF/LmFPEZltfywfP+V3Xm3vFpb
         dLA35v7CkhcAxkmogdGgVUjqTaX7OnNh8wcY3lMcxu25LTwsocbbPNRd/X/Z/tjui2C8
         RRsA==
X-Forwarded-Encrypted: i=1; AJvYcCWWi3EUe0KiSNq2a7Qu5OFJqpn+UFWUfa3uOAN2+kYdIp2l1aZLoTdKmh8lYLp702Wi8PK+CUPLgFBF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv+DON/s2SsS+PVOgqayLBFXX6xXRvreur1EX8U4zrRKJPnHpx
	mh+WcaTBXCvfqSNmEB5WIOdHGXE82leXmcynB+dMtoHSmr576Xt/PR+tMd+NLi1o0lQ=
X-Gm-Gg: AeBDietBsOSKP7EigCSZXzv7G0s1YFVlq704hQPtdcaTnNRh8fTqpW84Z48oqPiXs/G
	jmRCMfQm9O0YccHfXopIiRmnKdQhlmuKyIfJygrpiRSFwdkgSexJ+Ix6Yr1MbOQfZjXmLA6d7wH
	DG/zWPtVyNlznpNGlUADK3IC3/as7wTbMtnpYRH39BTMzelAtt6u6wyz0K/k9hkiKuo/PBu9nwb
	7YSZg5iCFX24vVbPUocL+DwU8JbU0Eil0gYdjupNZafAcO0AfgDXO8xA9Efb+QwIlDmgvuweqmV
	eBp+LZGcXjUE56XX1yvX/Ydba8yT969pAJRmwLTElFSPgDAVC2qOZHvaNR7qoiXzsRCGaNyOWrw
	G0SZ2ikWJI8AvixH9hqmFgEhRL8sdswp7OBYDTn2HW+7UZhKArJCK80lnZPPohaAIoqYFZjpCKT
	lBh+1scpStJgWZFWOkhrVN3xUHaG9GZAowpMffOquUa+RWCJYQAtvQHUzHXjGHUlwcc5PVx3sj2
	/M+cMIAg6wZZtmeMd3E5d6cCExc2wi34Ao3Gx7zu/B7ZV4r5tflEnP7vN0FdRenADOoU7NHOQk8
	JtFzpHq759vU1w==
X-Received: by 2002:a17:907:a0d3:b0:b98:132e:ca97 with SMTP id a640c23a62f3a-b9d72815099mr138971466b.47.1775808402011;
        Fri, 10 Apr 2026 01:06:42 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815d27sm357147a12.24.2026.04.10.01.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:06:40 -0700 (PDT)
Message-ID: <2959855a-3448-4d98-99ab-eb0e36bbecbd@linaro.org>
Date: Fri, 10 Apr 2026 09:06:37 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
 <20260410-purwa_camss-v1-1-eedcf6d9d8ee@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260410-purwa_camss-v1-1-eedcf6d9d8ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2026 05:25, Wenmeng Liu wrote:
> +  vdd-csiphy-0p8-supply:
> +    description:
> +      0.8V supply to a PHY.
> +
> +  vdd-csiphy-1p2-supply:
> +    description:
> +      1.2V supply to a PHY.
> +
> +  phys:
> +    maxItems: 2
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy4
> +

So if we still can't agree to get phys = in in the next kernel cycle, 
then this scheme is acceptable but with the huge caveat that one 
power-rail for each PHY is known to be wrong.

And I absolutely hate to continue to knowingly do the wrong thing...

---
bod
