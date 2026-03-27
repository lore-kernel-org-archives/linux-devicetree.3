Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B683332610
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625334; cv=none; b=JQvwOPrvkH17z21fMJvKkXvu3XdALvGYxy+yrZQV4Sx9D56oQR79OQtzpoFy9I6W8WwDPob4NSin/AnXB5V6FnadgD7C5Vd90ZMMdbEueHygDub4A+TEfeyqIOvIy7PQKN3MjawzCyYfYDQeBtiH2ivBn/3+boJ8aMiR64MNrro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625334; c=relaxed/simple;
	bh=BzjorC/KMjxhyLd6FvLMV90Jk6WKFkKPHN77D+v5d54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DCoenLAwcB3mMMepEoBBCagN/ybh87GnZ1CNsBAd0D2Syrek74vk7kb+G0dezXe8JEs3q2STS1I3teny/XIoGt1vUG7KioERv+q1G3ByQFBgt/xDdSef8SAVCO3fokg0TnJ6WaIX0zpTdQYogHBqz2pWTSx3LO9bN353HJT6/bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWCjWMOi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWCjWMOi"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so25923675e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774625331; x=1775230131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KPfKYIz0itJnZ243zFJfg1PZYfMp2nj029kDZFys+04=;
        b=DWCjWMOigoTHqan2NlPLA6T8fMT0fewrAxZMX5EKVhTwh4wj3esJRC9UlSoU7pnKAs
         IrgglkUaPoma0iwipw0nZqQKXmilBNhud7+xbXRd/9J/N+9AKsW9uQO9AiMQ7YXoRpoz
         UM1xFuvvQtRkus5X23hNxOxlXSHXGXYt6O6vfHu6P6mhXa6Wg/vNb/Qqg78ErXMhuZal
         4ZCPN3AOCaOkPMI1hKl4BgPUyXaf0bWmrXL96CAZ2S4IwjTdqGMxg69AfVwOdCfSCrll
         C3lhjfprVBkqaFKtzgQOl3YpoW7RD90Rcuni3uzbhddQ2xlRPhG+gg/uJ6EZHnEdv3yI
         qn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625331; x=1775230131;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPfKYIz0itJnZ243zFJfg1PZYfMp2nj029kDZFys+04=;
        b=m3ojyFrGHc2pL5JvXrh0HQTxvnhesyunoQ9/8nfk6j/0Pwpx/oZnIwD6S4EIRFVtg5
         F9k+IsSqieOFSDZtF/G/GzyNovwONd3jqX0X154mbjxJXc8KNYP363eq1j7rjyUplCQT
         rb0LIarZE4ZydsnC2niyNmOAGO98p9yIBd+ZcqHXAmJs0AYIcooYOAEeyHc1oTQ7oWhk
         eocciI8+8UiZE7cszsumAaDtkwMwQC3dCYD4J2XIL+F34aRKi4WfeorDh6oazCjtqSXS
         0cFdAD0MB/OfSUw0gDmOEkTcZGZGy6o7wRRiLPRssZcVpo0upnHnHqnO5cunEc6yxkSg
         /pUg==
X-Forwarded-Encrypted: i=1; AJvYcCX4dRXTzPMtMgy9FrndZ0GDa4uRXzyh04TwdJGVFmedMdCy7AY8QH1e0s8YBGJnsZ7Lcq44SV0lieqJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1YTZrmXeM7+eh4WPr4hm9v2FTD6TtmV4R/7ga+Y1MUtfj36h
	NnhHuq8E5ZZkY4yN4En7xA6l2VOjbD6/yGJi+wrNfux1638VxjivJmk75zt30krexKk=
X-Gm-Gg: ATEYQzzE6fAgJyt7mItRIJQdiBcFfy3X7rQaqfmP1K53RKbPDPoRLgEk6EhNNd36BVU
	YeazPnwnqxMuy7pqc+5T6ceM1nxm0qF5j08xeSlnq791c0UA0RV3RF33fb38Vyg17nbi65D2orM
	QjitTZAxdmi85UUfPs9JgfIGiekto7epmQMgWmGmZQ2giHNt8jY1bprQxHFRNWFRIvrQUMM6S/u
	Xzo1pssmA5hqm32I36y+PW8dpp233bTGa/QiXn4eQO9hEJ4yfQoZXxJqbN5gvRNpGE8cpxp0MHa
	OYsLFIInYM33Z4Ep4wjtKqcdPLXkelTNxFiUXfvrEgald05ktdA9SPQH/zqJg8svgh6WclRPe/A
	xYtzyWbuo0P59UCnFajHN0EPqF3juOzk0x+09cennqpVgbCUd4uf7cqf0GDvMIXWlrdRrP7wiRc
	ZrR4nFjL1HZmLE6P85MNpW3tKwx86T9Lw8/llfvMIkb13uKAiOJY4kbLQ9JichU3sfpSdaSbJf5
	oqv5giZbGYmz5CyVa+3W0s=
X-Received: by 2002:a05:600c:4743:b0:487:2651:dd6b with SMTP id 5b1f17b1804b1-48727f179aemr49696065e9.29.1774625330441;
        Fri, 27 Mar 2026 08:28:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270c3393sm28489395e9.4.2026.03.27.08.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:28:49 -0700 (PDT)
Message-ID: <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
Date: Fri, 27 Mar 2026 16:28:48 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 27/03/2026 à 15:38, Bryan O'Donoghue a écrit :
> On 27/03/2026 10:07, Konrad Dybcio wrote:
>> On 3/26/26 2:04 AM, Bryan O'Donoghue wrote:
>>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>>> PHY devices.
>>>
>>> The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
>>> capture those modes as:
>>>
>>> - PHY_QCOM_CSI2_MODE_DPHY
>>> - PHY_QCOM_CSI2_MODE_CPHY
>>> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
>> Does the_PHY_ DT node need to be aware about this upfront?
> 
> Yeah that's a fair question.
> 
> The standard model is to pass the mode via binding right now. You _could_ configure it @ run time in principle.
> 
> And you could even conceive of a sensor hardware that might find value in that - but IMO it's a 100% hypothetical use-case - you'd basically need an FPGA that could output CPHY, DPHY or for some reason SPLIT_MODE DPHY.
> 
> But that's a pretty off the wall use-case to hypothesize. Split-mode OTOH is a board-level physical reality which => a DT description not a runtime choice.
> 
>> If we have some sideband signal (e.g. the sensor driver specifically
>> requesting C-PHY mode), we can simply throw all this complexity into
>> phy_mode + phy_configure_opts, all at runtime
> 
> Like I say its conceivable but IMO not a real thing and unless your sensor is an FPGA not possible to support in real hardware.
> 
>> Further, the combo/split mode may possibly be selected through
>> aggregation of requests.
>>
>> The question remains whether the sensor should have a direct connection to
>> the PHY itself (i.e. phys = <&csiphyN> or of_graph straight into the PHY)
>> or whether it's going to be translated by the camss node (which would be
>> the one holding a PHY reference) - there's probably surface for adding such
>> negotiation logic in both places
> 
> To be frankly honest you can make an argument for it either way. However my honestly held position is analysing other upstream implementations connecting to the PHY means we can't make the PHY device a drivers/phy device - it would have to be a V4L2 device and then for me the question is why is that even required ?

This is plain wrong, DT definition is different from software implementation, you can do whatever you want if you describe HW accurately.

The CSIPHYs are not tied to a single "consumer" block, they can be connected to different consumers at runtime, which is not something classic PHY devices are designed for. So they are de facto a media element in the dynamic camera pipeline.

> 
> The model we have right now, right or wrong is sensor endpoint to controller. Similarly the <&phy MODE_GOES_HERE> is a pattern Rob Herring suggested and IMO is a consistent pattern we should aim for upstream. We see it in latest Rockchip, Cadence.

This doesn’t properly describe the data path, we got out of this classic scheme when implementing the whole USB-C complex on qualcomm SoCs where we had to describe the data flow within all the USB/DSP/DP/PHYs elements, and we have a link between the DP controller and the Combo PHY acting as a DRM bridge.
And actually Rob Herring asked use to define the complete data flow, it was a strong requirement. I don't see why we wouldn't here.

Looking at other vendors and sticking to this is wrong, we need to solve how to describe the Qualcomm CAMSS complex with accurate representation of the data flow and hw components interconnections. The choice of kernel API to access an HW element is irrelevant in the discussion.

Starting refactoring the DT representation of CAMSS is good, starting with PHY is weird since I don't see what it does solve we can't solve already,
but you need to take in account how the CSIPHYs are connected to other HW blocks. Simply adding a "phys =" reference from CAMSS node doesn't reflect
at all which HW element will consume the PHY, and what are the link parameters between the consumer and the PHY and between the PHY and the Sensor.
Those are the whole meaning of the port/endpoint links, where we can define multiple endpoints for a same connection to, for example, define multiple sensors on a same PHY for the split-mode.

Neil

> 
> 
>> Note this is a question and I'm not aware of all the possible combinations
>>
>> Konrad
> 

