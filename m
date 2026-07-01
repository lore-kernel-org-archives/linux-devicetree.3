Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D76494A10
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921935; cv=none; b=LH9nrOObCSChtE/o6mt7+h3kfKy3PhwLPAuNu7RSnGmsDeiu70YhuZQqRJffJOjOFGEpSMBDGLQ3vTSY1UGf0VM0Hh0LMpl71feWWIy492Zy1ulGfwAK+SCezR9v2plwPXz98RYecsTQo1NcRvb95xiAJoYatd1Eynoa392mmNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921935; c=relaxed/simple;
	bh=MzLvwqONWmvEr8yqI+V8+QZHGK5zP4kz3RxrsvEDhTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MG6DdW/LnR2e2YkxzHNnQqD8eQyNX/faEm16qFKgrnYXbfxKxk33JlEeRbAgGd6yhT1XdbOqF8vIqZBYU+xuuRSkQOtoUY+fZDfyX2girIKzSWibV5m7bXz0zxQJj0A/UHKXrEBg9ib+1pVkP0oIa0HqrEmwzxvWMOdDSikVLvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rmhzcFff; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rmhzcFff"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493a7bd27c2so7537495e9.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782921932; x=1783526732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UsosZm6xpnN24XGcV9MJwzrd6T6IUqwmGit4RNYmFFo=;
        b=rmhzcFffOe84HI093MlhVjE7JWUnRboh1QGbRmvkysFGkDzdvr9JHTLJBi/jBDscqH
         ZdT3nP/Cax/jrBVA+AfmPRFQuvh0FiE8AaebmYc/bl9n8M+/hfC7c+sZzypchJkYUJCr
         uiG4l8qEyuwM4UsR78qebLjyVco42/X8GTLFNdR2dtwuez+7WUiH9wVTc7K1vNyzV67f
         ZbRmaBlV+qrnmCmbgIy2aKMUhtXJJz4qwsdVXBovLuDF+M4UpvWUBEmnk4FlK0YQg0hL
         jV1AUM6JDlAd2izIoUZ7oR7XQPTXF/WH6xmiPbt1yNDlem+zlULemaiaDJ5Ek2d07tEF
         KxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921932; x=1783526732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UsosZm6xpnN24XGcV9MJwzrd6T6IUqwmGit4RNYmFFo=;
        b=iOwZc1TUmH6wzDi/KwVEmu+SKvvGQ/ZWMMcCqsaiWYepg8yTPUtr9P5qPJJ/S7yByj
         Cs4TJgnkzhspyA5CsxgBEavyz4enu0EAPp0vs4v13daxS8ffM/g2zIVTA8379Krw5DfJ
         XoxA2ZwP9fow/EHYkaAnuEYZoXeeZwPBwVC8ZisqK/fLZ4GX0o+DD6ywVfaqnPGxN4cw
         W9Czyj4fN89LKYS7FrVfqbwG0APlVpm+5NPyajahNQkDZNQxZNBA6rVM3M/1rG8TiQEu
         zZWQ4qPZo3D1w1riLJty443xjOoRitfOXGA3OYLu89djoHmb4/kGNjU/JpMxZeJfLLAL
         3QJg==
X-Forwarded-Encrypted: i=1; AFNElJ+t1sMVIDVgxanksw2caTdXz+2096UKoR/9mQDd6wa7ljgdO6937aZ4Z94V5gc8ZCMhJyMzSEVNnk75@vger.kernel.org
X-Gm-Message-State: AOJu0YxDmuEkGuVOPuFBhULDW7WrWphwa7d81E1FTmP0ZE+eQcoSPD7t
	2SDLOGH13jj+RRNTK4rJgidXStyMDducuiNth8/kF+g8yhlihtR9atsOxVSHdkkOnA4=
X-Gm-Gg: AfdE7clVWWyt5nb9jpiLk9ewodA6xBIrqmuj4NxDr76pYzCJsJiQhSP2mt4nnB9kli8
	XVbjZTEgDus+T4MalXITiqbOLXxCs5kNtUnucjIRYlEygZbT9jbZdR6STrFpoL/m6O5AWEjszec
	3f4b+ftQ2mJQ3cG/gq/EEjqMwRJ/F48ShpcltmrQhP80CP/ogYOzS67xrnSCycatDRCUVzek+8r
	HT6LHwUWA3zmqOow8XPRuoFXo43uACgXVUxvSRJt0VCOPhA3QuiOmmi91ALfnEzplu0d2i+lUoB
	nNl3XYmcpEpHXcqIJLyyTHxDnx68UAO0vUhN5X5NSvLysSKQ/9EZFdWhXFedrluWdtH/p2M3QjY
	MqrRKpwgzq+pEiNME3PbuHfYswP+OfTXVm8WwCPstce/Za+T1mWe356g9LiH3Kh2RI2lSfXFWas
	L2o5vKrJfj
X-Received: by 2002:a05:600c:8590:b0:493:b55f:bca2 with SMTP id 5b1f17b1804b1-493c2ba4341mr28332345e9.34.1782921932035;
        Wed, 01 Jul 2026 09:05:32 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.66.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4fef11sm79771845e9.15.2026.07.01.09.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 09:05:31 -0700 (PDT)
Message-ID: <af1377c4-f4fa-4130-b51d-bf57ae3831c7@linaro.org>
Date: Wed, 1 Jul 2026 17:05:30 +0100
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
Content-Transfer-Encoding: 7bit

On 05/06/2026 10:31, Nihal Kumar Gupta wrote:
> Could you please fix the driver to map logical lane indices, consistent with the gen2 camss convention.
> 
> [1]https://lore.kernel.org/all/20260326-x1e-camss-csi2-phy-dtsi- 
> v3-5-1d5a9306116a@linaro.org

I also agree with the principle here. camss since apq8016 has used 
data-lanes = <0 1 2 3> so we should stick to this established paradigm.

---
bod
