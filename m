Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05473101C2
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 15:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921213; cv=none; b=oYSZ5L7m5KvPYqFY2D2oUSp85+FUx4444LhvLdenywMYjpQJs3pA9NY3SfXLgCAAAcduRnH2MdnoM0N+A8g4hTkkxvvBk8Q/vLkYc2TqSxI3ixqUFoHP01Ib6feLKE0Y73iMJX1Ua3SenLhpQfdXVfvSlRC8LQLXYKb6WIDDnkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921213; c=relaxed/simple;
	bh=W5gcoFcrKtfbOQRmfiTSBojpOsV5BPmx6vA/jpWZ35Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a50Msfcjv8P/ZcrgJ+pJRItZFTT8hyPX+fbye+CIxfnpkluNLWWnCyuGInJH6yOLlIysyLT8k8+Ww280nOsN9+gurXTmq3s4Gsa+HS7ol16Btixxh15R+3eu0NxjiHa14lF9OPm7wYBEf+OxvKFwtu4je5eiogn21+t4pwpuM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sRXLRewA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sRXLRewA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4926bd21aa1so5261985e9.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782921210; x=1783526010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=upLoHwuqws7rrBOx3O6MmxFWpeRxrfgF8hyyVKwGdoE=;
        b=sRXLRewAcpxywLpg1fpYvOCs8BbfGI8w7bxzyV1vma0L0NnTzAbZlGY+nFzUpmz5nq
         bTGf02X0WsqjcjPU/Loxj7Ckz+6X/eS/ki+FlIvwX2EnMxfKJlktdHHvQ6t8iYJrGbyF
         2juAxahR6Xhc/2cHdL3LacMcYI3jt55uX1K6tHT+A3iySWMdlB5QmLqlQj/gsYnR4XWw
         miycVchiLl24iOMcAR6IVW4b7CoHtw722ASrYs2qE6gp+6+/Ux1YAx8AU2oqx64OSsug
         dsnrjjV7OqhfrGkejEANc6Cnk5PpGZ/r1AE2An4aIPQUfx8i0vesJcCv/u05F0dHV1wf
         X47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921210; x=1783526010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upLoHwuqws7rrBOx3O6MmxFWpeRxrfgF8hyyVKwGdoE=;
        b=q/HbfnOV6Kv8wlybW1+1rIdmqmSodfOXtNR9749ogZOTlKLbv8zAjBR5fudSw7o0uu
         51pUUbFiCVcbn+X8iXlD83aJBn3sI47rvxS7WSDl3g74ZWPfbepLGGGFECAVbBL0cNCE
         Nqp2fOMB9paDX2GJJgkd7HU8fdCWVw89+KAhdb34VnIfo8biZ990B34kyG0VJdalVMCf
         aNRDWkaiw7hIxbEP4JriiVdx2fdmaOBr4nL+WkTMqa7h0wF61Uce7Ji1ofxc3PiLIIC7
         1+6yx4m43OhNvcxk7qizQJEC4ajvFBGMyJeSFbYjfzdBgZq259zciaBY3lXYcUUkWrIb
         fclA==
X-Forwarded-Encrypted: i=1; AFNElJ/FmoN0ZrvzHfNtR0Dyt6AfQldkAmtCO9XJOctw0Uma+D25Iiwj4JQ6dSg00CY3SCMxTRL1rgA4wGgI@vger.kernel.org
X-Gm-Message-State: AOJu0YybRlKu5aOlaHZSSNMg1MCMvpNCkO6telUOKOhAm5zSgTtxp+1S
	QGb2YJ9DLu7SFfGx7N+OQHkF7AGQFIRL1Xfb0lClWZqXvQn21ihWJLA+g1E+V29Ln9A=
X-Gm-Gg: AfdE7ckGWPtLaliq2iBL30AkM2F7GW3Qilsg+BQxdJn3HmX2ag5QqNN/hptchS/t7qv
	ADoFHzaDuWa+P57ciB92g6rdAzKTW3Ku/Pf2TAsWdriIu+GklvYQiUs5ZgNdhVCdKmRsStKEjNX
	DPNFTIM1/i7QxT7SC3ywvoi040NPIR39VTkgjfaSVcQWaDc583zZ5yoXA/+5fQ6qlxNHHzWjH/r
	spJYCiLB1G9yTTwJuQhl85in2TiiFf6MXw1UD4qtj2vLqe8ELhR7qzYo1CZLo/iZRE9OuicqHi6
	a5sNbYQ/Govi2TKBVGY8Fmw2IXlXO9/2hPOMNxfFAuj4gJioEDzZqNihjwEoFBnJtCNFCPYdOHS
	mtWZ2Rrn7V5/lRJEy6UMapt/jtIVFCXIWhyRMfVm6myYns0BviQbrClxP92EIypdPguPgF86ueF
	sdNi3H3zheknohmCuHATxO6w8=
X-Received: by 2002:a05:600c:c171:b0:493:b6e2:1b0f with SMTP id 5b1f17b1804b1-493c2b99a63mr35052815e9.33.1782921210480;
        Wed, 01 Jul 2026 08:53:30 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.66.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d8f5asm127457835e9.8.2026.07.01.08.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 08:53:29 -0700 (PDT)
Message-ID: <cdcea32f-0160-4501-9dfd-9103807c4d93@linaro.org>
Date: Wed, 1 Jul 2026 16:53:28 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
 <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
 <b6a8c860-8b47-4250-a428-5225d0e64a1c@oss.qualcomm.com>
 <htxqjgwjczsghunsbvo44lwkadzeg2kp6wfcksf3hkmcubvs2d@cw5r67uxskvu>
 <59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/06/2026 10:31, Nihal Kumar Gupta wrote:
>> Having clock-names property doesn't mean that all values are valid.
>>
> CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
> - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
> - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
> - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
> 
> In combo mode, only LN6 can be configurable as a clock lane.

This is a really excellent comment and I'm going to copy/paste the text 
entirely into the driver as a comment.

ty

---
bod
