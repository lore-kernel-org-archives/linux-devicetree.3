Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29193A16AB
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489337; cv=none; b=I7NTPOmTih4cgGA4yV8oFYgEciCNxt7KDBP7/HhsEWQbqY//yikdU41ZQm9QuNDcBNJW9sID7g42pjw7vpiWoN78xZV8/cQBsN3gv4nxYfAUp7gcjQO24Tc+NIPniSgssdOjW+8jYovbRBRGFtBhl7OOguTrS5vULn1/zmcdeEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489337; c=relaxed/simple;
	bh=Oj1OP5B0k7dqDDl5yO9rCbKPUffT1+gV4fG7tK/igTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c27osvQfxOf7YGx+8jskud/zQS6V9gXe7e2AWIulzwUgD507fl0Wk2K+f2KhI2pGc54f5bTbx8+DZSSswpqabMfmp12M7iDiuoi4hm+40JQOOLf8DDnqPR/LxTDOIzHTXjw4VM/jGDvv5Joqqf5MvRNh2PIcKRFlyWN4aMnnvXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoOVKHkc; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoOVKHkc"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68ed5b52767so406580a12.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780489334; x=1781094134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LR+NPsTQNV2+0FxZsktMoZucngyJOnTRFU/6OwaVMIY=;
        b=WoOVKHkcQGpRVrTCg87fLUidTriCeQ6ESGeQoToDmsC0AwOL5K2gX6HIK2K+yzUD6u
         mhklh5fiVrTXQrv0zTOZC9KtMFc5WXnuidsNtkppqoffSXJytFsIURmPvuw+FHEn3KFP
         +yucxIjO9ZxN4sce+1G6YzEBFwbTBn0pKC+a/h3O0IwSG/TQ+5KdW8/Sni8lIxtKSes+
         gTV5Ud1znpur+lJAcUhuj55TmYcBBW1xrwPULBTOyBWKPUqJcfWxwXXOi0kTmloZ0a4B
         dftnovvabnl6GRocCFMP4dcQqdDCTnGlwUcrnnrLT2LkrI3F34a3LuI/C6xdhV4nUbXG
         S3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489334; x=1781094134;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LR+NPsTQNV2+0FxZsktMoZucngyJOnTRFU/6OwaVMIY=;
        b=J10Ym0ppukQ4VH6KFxJV4wxUSBO9KQ0772p4/mZWTabYzGdmssS1Yf3KoKTLB7eNky
         I/ZHt2DGa8MsLK9aUy2dkXA2AA3Z9t70lQiTu6TeiWgnrYo3XdEvr4ZypSS0yKOeJG6U
         emHw/rzIidawG+fIADr2Fee+T1thM5gsj9z8ODLB9hMoak/pxrHt3IBQna6iMKrzE36o
         4olnnXxPTn4G09OkIJQ6fYP+TFRzvknegStJGa43Eam6JKgCVEQc/a49QBEFIyya6RDD
         ryMQmyYbowSMDZp+oZDgvmNqZ3EDKQ2zZkc3IGHLCaXQiyhNb+tm54PoFTfSsXjFHf6H
         wcmA==
X-Forwarded-Encrypted: i=1; AFNElJ/P/YCLUS0Ijs/CXUIDrlGqQErzOdq5PMzHpNGPbPHU7SRWcGpNKhHxC6ydOrPmAkZ91UyP2tm4keBM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ZCK0P+3mDB3MZCecUtJUcEUFQsJOFxpJ+XS/vAjt9XmpXzfS
	+4PMIkWA/E94Q/5bQkuZ6AIU+G0zbEEdOso00WEiIByojYekraWobEmHJpD2Cdh8udg=
X-Gm-Gg: Acq92OG8pTh9UKd7+u+rJ39UveDZkzoABQX+eQYpGfiWJ6CQP2V6cv12XHnXZ+2w8AE
	O4f8KTi0SlgcWDXAQxQcejfj1BEf6dtI9ovnfVjzwUkNvF1OXvit8YH3kkng3/2nkbQtGyCLJp3
	QlFVjgAfPzw9O0QKVG+UAjV+0yrCi4/dWVdN9BtabNQ4Yo5ItLfp/iU/YKeJY+oIuUc1W4tiaQX
	fAE+b6m49I8cORCvd0+kZ0gsitswdq1H11b76wlLeJ44AneyOxoAwWZ4YSDk28WofrRnCGXkmrA
	cSPNpEwZ6zQaqR+Jd+1pjmdPBnVUhVDDJQtvrhc+nvgdDH4SiSHS4UwUI1xfdXc29u6uTFf20x0
	oZ8jsAMZSdVEYzDa4Queq6e1RPU5e/QjA5MjJk7SjazyJc8036FrKApWjB45p7XjZudDl+vyFwu
	93O2ho7fRkI4VRZNpj/lEYqXOQdsLj9psPA1M4NuPtmhMnsA==
X-Received: by 2002:a05:6402:348e:b0:689:816a:5367 with SMTP id 4fb4d7f45d1cf-68e6be91165mr1508878a12.0.1780489333977;
        Wed, 03 Jun 2026 05:22:13 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm1064884a12.17.2026.06.03.05.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:22:12 -0700 (PDT)
Message-ID: <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
Date: Wed, 3 Jun 2026 13:22:11 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2026 13:10, Dmitry Baryshkov wrote:
>> Documentation shows clock lane at lane 7.
>>
>> Truthfully it makes no sense that the clock lane would genuinely be locked
>> to lane 7 but the documentation does seem to suggest it.
>>
>> Yes in fact I agree. clock-lanes can be reintroduced if someone can show
>> hardware that supports/depends on it.
> Konrad and I checked, Hamoa supports using other lanes as a clock lane.

Are you sure about that ?

ipcat I thought designated lane 7 specifically as clk-lane i.e. named it 
CLK_LN of some description.

---
bod
