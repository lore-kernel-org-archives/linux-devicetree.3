Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075B93F4DE3
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190677; cv=none; b=JDAh0q/xzZUbucsUu1qzUZrVHQygr62TFZ9z06f91aFZjlsETQ3yAIwykVcFr3tE3NTsoZA1sEigh32cMvOORR887Cza4aFi9fGAePctRGUWDBhx+f93f9yOPXI7VHXUyIxpBEPW9jQs5zAjEJoCQqsiRswYoi2UeuKwwfsNEjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190677; c=relaxed/simple;
	bh=qpWIOWTlOhe/O3Zu6wqaA+1dFbPPZ6kberD6gTt2KsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g89k8h8D67LiAqEbp4VqJUUfTyYfqkd1o7Zmod/bbtCAk1Pl8Kfx/CbSVv9GiEwQaYi+S2JEiWk3oGLdUdOp9JgLtEM8SMyPj8DQ0JiKyJmAab+xkRy9MGnFuLkD7grek/MOyOf1Cx1nsVOHubTWPx3do4cnaDU7ssciTJcx9dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N6OwhVIj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N6OwhVIj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490229aa522so2303615e9.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779190674; x=1779795474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HABIrpORxD5O07tQlPwky6QpY+uvpmKET6RnXALAtVc=;
        b=N6OwhVIjk5ZrmCiwJvsVbihju88mflNTZ8bT81mGVqkgWVmOEWf0o42dRTaEOl7Cfx
         THg1+bh9PalWx4GiyjeGMSTnDoVsMf1L5Q8zlNF5cadEGEpalQp3wIW2cX22lSPTw4H5
         FSYSB9jKJg2ytNAsRPlQH+kCpARqHX6lXnBq856viZr0cK/mphUsjHVcORPgGgIjL3nq
         inwuyAr0TseG+sox70HBMRwmta5p5A4QkId6TaDI+BNNfdbc0Yo/40NTaSN+9Ry9THsN
         E19ST5+8/cxD/FffPUfRygEPaboO6+nUDmDyAXux9Tbc7FqBrfbnJhPvoj2JZjMKnFWK
         65VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190674; x=1779795474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HABIrpORxD5O07tQlPwky6QpY+uvpmKET6RnXALAtVc=;
        b=WJm6EKq5zXe8CN7I2/f30Ek4sZO4t2/GQLG0Aa/FlYhK1MbQIw29SR5mRMTUYQS2TL
         XES9y5k6mrknsEBWZhwf19XbbrP11H4Am0FivFjqPgCUrGPtPqDtpXwEWDVhH/gWAya7
         I6ni0JbMcXK/AKV9tYTmiyD9tgLTBujxxGmDgfQqXzSNz8TLot1iaxuuefZBHkUzcdIH
         wa05vFXUJ9ebh3KruPt19d1kzyL45MrhRgjRZykMp9aFteuBq5LYDabOEcnoIfCX6h55
         WFdbAPGE+36twOn9q25Jm1k475BnOsYPHYbTfnQk0LnlAq5n9mVK79QpmS3qn0GTHi6v
         0/Bg==
X-Forwarded-Encrypted: i=1; AFNElJ9NRpHz8EXRACDCDA1mpQthR3dIadVWS0n540FtHPxTJ79F7QhysvxTPconPPwGT0rDmegKwMCe+fVo@vger.kernel.org
X-Gm-Message-State: AOJu0YxPcbRtKwWlr/PHsM8D2WRA5MDSYobhddwfZEuR+LW2bg289MPW
	gaD7Ct3nnKQ0O8ptVTctvThCKN8LGPkDyhHHnZZAUbFo7S5rL4X2j7vthSnUtxCNLMs=
X-Gm-Gg: Acq92OEUyQuwvp0P8cqFUVF8CPS0T914fo8lfNC947l2MO93uLh1oxL2Y2v9Ih0HPM5
	EG3GuhFy1cV4r/Yj0c+AAassKI+aJfv/TNhDz27XtlhM4IGG+rpdDI8Fb/qXslt1IPkL8DFPTse
	5kchLBFZSuCy6tvbqA7Di4fCIx+wQUAicu3erSIY8AgN7QntpPaFmpEVFoGBHcKkN85x0UGzMAC
	u7hCvCF40XiWH8uIVmbbFxhPZUpBhFcLE4/ix9OhIAjVuXC9669PIEw2brenJaXdnjLdBvm9ene
	MFqQNtWopcHf+x4oFGUifQRMHsk+Nv79rtDHNx0E5aWnzw1MDZTypsyhf+egfg3kgD64m50P6VY
	a3Xk38YTHyjVicTwu3AlLUMzSQc5az40pD1tpG41SUkkU/ELk8J7xIdMny+hHuTuWM1SxRxRQZM
	0ZVRGemr3C5n6WKjERv0zCZBd1k08GIO46JA==
X-Received: by 2002:a05:600c:350b:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-48ff3346102mr221572545e9.19.1779190674395;
        Tue, 19 May 2026 04:37:54 -0700 (PDT)
Received: from [192.168.0.35] ([51.37.145.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe582e3sm120045195e9.15.2026.05.19.04.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:37:53 -0700 (PDT)
Message-ID: <7dca70f4-6e03-42aa-afc8-be5c2e015a74@linaro.org>
Date: Tue, 19 May 2026 12:37:46 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: usb: qcom,pmic-typec: deprecate
 device-specific VBUS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-1-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-1-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2026 11:48, Dmitry Baryshkov wrote:
> The Qualcomm PMIC Type-C devices historically provided their own way of
> specifying the VBUS regulator, via the device's vdd-vbus-supply node.
> This is not ideal as the VBUS is supplied to the connector and not to
> the Type-C block in the PMIC. Deprecate this property in favour of the
> standard way of specifying it (via the connector's vbus-supply
> property).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index 6d3fa2bc9cee..7a68423fb97c 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -79,7 +79,8 @@ properties:
>         - const: fr-swap
>   
>     vdd-vbus-supply:
> -    description: VBUS power supply.
> +    deprecated: true
> +    description: use connector/vbus-supply instead.
>   
>     vdd-pdphy-supply:
>       description: VDD regulator supply to the PDPHY.
> @@ -94,7 +95,6 @@ required:
>     - reg
>     - interrupts
>     - interrupt-names
> -  - vdd-vbus-supply
>   
>   allOf:
>     - if:
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
