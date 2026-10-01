Received: from mail-ed2-f16.google.com (mail-ed2-f16.google.com [74.125.228.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF6B4E5323
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849500; cv=none; b=YVuFRZvcB6FoHrgQfbm5UU4wWula5l9t5iMBzqWkO9ri4nNotzSrRj41Lm7g27EgtGMbW2i6fkWso0g0cxSMb1T60S6qGmD5mMt1JBrvrtvjwysk3dGQQ8n+mFMXW6jtZyWifNjp14ewCy4u4bVIh2pTgYfOJqyhPQGttitaF/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849500; c=relaxed/simple;
	bh=6C565t/VlyoDv3UV6Pv/GK2eTKoZ4N03hIDuBo2UJDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMJc8jNf5f5LeTuWerUWjw8NnhZc0LbQwAwZqAtBYx8vml97s5Ylyz/NvdmKP3wsq+v+/ogyfieny4jIY7dZV3dAFNK7CfuuutIUjssV/nuoMSQTECk4kcH1Sge9vJgrph9DKxjFJfuVF38Fi4Ps9srSGSvD9tcl5FFSezOXjK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOMFfnn/; arc=none smtp.client-ip=74.125.228.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOMFfnn/"
Received: by mail-ed2-f16.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso10785505a12.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 03:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790849485; x=1791454285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3XG5cy5KBLHekXoy0zdt8qQzO6LEdX5LiupQKnkZIo=;
        b=bOMFfnn/jgcz1WJBEzhyFKMrlGUEYbsuCSbA6r3wTylJd66TyCu5SR5fCkUgQwBOZW
         KCIcufLthnXh9KQfCHlLl6IF1XEBvloeFkmBFXF0LJHMarEOn6JQ6byyvAzMyOShQzQ6
         ZeXpvpF+kCn/QX5M7cdXO+ltiSp50HpNN66qTWqfVzrO1GWLSk6rHIO3ctSgJGFXilPx
         cWJ2a1WagwmIT/r5gmeYZv75Sgf/gADZh2ePg7Gip4Gs5qS3RkeVui5mj57bHcWc1hYD
         tT8Pn0TUhjCu8dEhc4DwmL1JtVVcp4D+xWFtpf2R8SZMySyhumIc59LClekjWdnvLITG
         CLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849485; x=1791454285;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3XG5cy5KBLHekXoy0zdt8qQzO6LEdX5LiupQKnkZIo=;
        b=o85bIU2IEFusverLsJg8VoSt11jN2jhpQxUK22Rqcjn6RlaEZsCcBmXsdONpOdCGCi
         jU5osEBgT2NShjdxDJMa19jDqJDkMCk/Dj2FSrkX+4g8bZ9l+y8Pi33CGq9cS9au809E
         jOiikw5HYfKZa3gfRYPyR4Q+Q8HU1qmN2Auhixu5POioTTdoA3xZgj2seJpp6cnuIHDo
         /A5tHA2RHF7ItNOT6+yqDTCOiZqHQLCbBsTM5yb+8gJcFJB0mThUy+S0cRHzk6JxqorY
         nbrhmfPMSLPT4yMAHwt/z3xiCGCLVr4yNJ4pefdJN1IMJm0wrzdhmHiem2sgZtikSGlf
         g00Q==
X-Forwarded-Encrypted: i=1; AKwUvBxeNi2S85Dyae6NtaDF3kxBbrWjCQcPk6Q5thTGOysEHNwFCiPfmTOqn5UKgDaXLcr5B+RWdSg5mB5F@vger.kernel.org
X-Gm-Message-State: AFuF++nfhHhk/u6mGzccSKzv3cRh+821LYpgicYyeeOg4puzQ/e+ATLU
	UI9BvwnXooWw4kHkWZr7D0Ju4t2AwAaHG12l1ERFopQsCBmndS1f4e6rSDhhuvQWkaw=
X-Gm-Gg: AYBFou13HEMSba+PNncnQLD0XdunccrmaZmafHoQ4YF7DMb/wK51ce7e1A7wZUSMNRo
	hcuT4Y17/xsniTk+0lpBjPdOotcefRMyCndABoMu7JXgpvcCsB5Z90mU6m1qRtOg6KbDvulKeIC
	kpWY03PX51/SY/Hx/sFJMi6ZssiqFUlLhqCilWmxXb//nDAB8v4rYAhUVam0MIGNoe9A5bINjG9
	WjszO52N1OoVpRtwolRnLdn9j/Ns5yOBbCyPR0oEfolhUFaMFADSkUAT7ff9bjY9HFqbYNokfSP
	QEiLp/YIkZ//KDVe8e5DobDx1R4u1gD/Nv50xA1x8bcYnuIUiWLeZGmXJ1gAv69p82d21b4nBvw
	pAbdtQCweGZNW6es7ik/5Wf20vFtUOX4p2dSOhhiA2ZOE2lZxQXFLKXD6zUil23bwlBOWtVOnv0
	cpf/tMx+oFCjo3Uf4UMZNqf7DEyxy9uQQt0CAnC+ytJ8kkDt2BY7+0l7Lwbg2Lh/oiCBSW5kOXK
	8PGIhb1V48=
X-Received: by 2002:a17:906:f587:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c2e23d7e12fmr327647166b.30.1790849484765;
        Thu, 01 Oct 2026 03:11:24 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.14.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e342a24c5sm95689566b.4.2026.10.01.03.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:11:24 -0700 (PDT)
Message-ID: <f61f1882-d6a5-46ce-81e3-b84648ecc6d6@linaro.org>
Date: Thu, 1 Oct 2026 11:11:23 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add qcom,x1p42100-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
 <20260930-purwa_camss-v3-1-0fe2a5b11208@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260930-purwa_camss-v3-1-0fe2a5b11208@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/09/2026 07:57, Wenmeng Liu wrote:
> Add bindings for the Camera Subsystem for X1P42100.
> 
> The X1P42100 platform provides:
> - 2 x CSIPHY
> - 3 x TPG
> - 3 x CSID
> - 2 x CSID Lite
> - 1 x IFE
> - 2 x IFE Lite
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

