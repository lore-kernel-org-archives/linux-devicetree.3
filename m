Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17860376BEA
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812630; cv=none; b=StwVGGaBp5bflwOJHCHlF6xOPsjWLk4bYiOjJVFkeGbPJVP4xNpBxX0CYtJpJmLtc96MYNyRCYFfHf+cW+Z5HpUZaMo6e0pRIV75GD3IILy1OBTcw/LfZHk6Ps5klOmIfT6u66rwDNWih80Bci/A5jsKf9f1maPd/5BOWFGeRFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812630; c=relaxed/simple;
	bh=klYpvtSOAIez44kpWs1v0eOeO3eNpRfwfPOMbeNagbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rPO/cyu7IcHWZ+eGjxM5y6YYQjJsRWmEYGWX5WjoByNt9Kgv+GgN85PVtcL7tvWJjZJLzMJ7aKHthEuOcA0Ypo3by4ugMna72gPq+HNQPdTLu+pc/41Uq5GvK2yuvoSOQrDZ1k4QDoDGOE0hSqHXgA9nbHWz0CkinIXzB7inpMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=svmyrrrU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="svmyrrrU"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e36c3478aso244262866b.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812627; x=1792417427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oGwPh++pWh8JXmtP/Z4yTF2OlJIVwWazwmaj6HsGs3U=;
        b=svmyrrrUo3IBwVUrHUz5XOIRL6IR4SKFPpuJiXCQocCfRp2ykDDOQxpdLn/6csAZs8
         3snMICySepg7Usag21gkcq/lEWG8CPCQlQKbk5r/PrfRCCsMSTSsiSGolqAVdL5fw94b
         eG3p8KkwqSZ8eEVJ6epsxq/tKief/HN6hotKiG7uZxZTnNtzDC6VVK3NCl0VOe5CqwnC
         ZdQlUDrkS4T2A9sCLQzuQ4qWKGEBMUER16VTe5AzukvKY1579jmyIzZCzbHKWCof+6gF
         xodnr6RguTZtOfamTlgIjp/Aiy641NmtRcW5rm+TKnXFYGQ74sVJBVFPXfSrCwz3zjIq
         T6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812627; x=1792417427;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGwPh++pWh8JXmtP/Z4yTF2OlJIVwWazwmaj6HsGs3U=;
        b=nZ2qlX51kLNQUus7pVKMOtSdWksUUjg8vUppiXXR+OJaoNJeZt+fSCtmwU1GHePPgS
         c7tfC4pvk4KKKv3xvuhXwcpzyjZtyeH8CdEIsfxlUi+BqSIbKiCfqNL1PIF33Nzpz358
         bOw1jrNW26DJvk53gzpacDJRGsQ7ZJXjRyGdvJvkQ2PGEbvs8cOBZDpoFGTDhGRYmedf
         J9FmwcrubJ7gCEvtHoTjQnaTbF204liukt08hFV81KLe/xwBgK/3Le8gymtXmhzOV9vO
         y3AXGl7s69yar7LaNi8g/IkJvW5i1KwiZJvcFwpnxEaaXtF+EypGkQ77y60Oe9lV3PHk
         jEWg==
X-Forwarded-Encrypted: i=1; AKwUvBwObUiMb/K0QzjIrb/mnLGrbMnfKOe6oX5B+P7PnpMfk6M5wv1I5R4+kwfa8OidgElF5CKS3GCDQVp6@vger.kernel.org
X-Gm-Message-State: AFq9FYLhA1+65iwbTI8drG7YC9yxbD/XSBJRI+2jerbKb3GkY/m75JfD
	yfvJ5Ezc72IKxL7GJCGZyEoCpMlXz+VIE+oaXlecG0sZRDw1GaT5hpLiYy3qmfoprNI=
X-Gm-Gg: AYBFou1xGzBP+rOuzK99i+aGdmRzuCB8FrAUS9OHs3S92HKV3dO1dda4tfzjJOP3Fl/
	lgyqr64nFUhs82lgym5RAjzsFdeXZLtxImuMT80u3znH7MCM+a+peJQJ1B4CeXvySlBhhPRXlYB
	HoqGNDRk6dxI13w1qA13zXIkaHmTADAfLV1Xzn5pyUS5I7qQx2OJEXc1Xqh5LlxJ1rkvppYjWqq
	nS/HnStmYrPvVOh55CSEVzgxazyYSML+8hNzP5AsffFVeDRP3FSm9NAk2wIbT+XPmMTxPFrvZqv
	Oa0asizQE/y+7Kv7KW5gzInBHLMDRExoQYataRV1JeKflv2c7yxXn0zVA3Vsev5/JTwglDVNi4D
	QgMJEb9U+Q7Ut8enAdNU1ZnQFsprvT26t6ePJy4HA1CfT6+ldr+7cQLOG5kl2ZLDqnmzDLi7bXS
	Rf4yWbRu8YVY24e/LpVdnhtUJK6ITysSlYLL2u677oD3+rJC6QVPVdVQZF/0p0YTpabdT4Mz5x4
	dOnVH+lsCZK0f6PjrDMLdk=
X-Received: by 2002:a17:907:8687:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c31aa02a1ebmr897992966b.21.1791812627292;
        Mon, 12 Oct 2026 06:43:47 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3456933dd1sm168189366b.50.2026.10.12.06.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:43:45 -0700 (PDT)
Message-ID: <4ba1f9b2-c300-4942-b686-4bd690c57418@linaro.org>
Date: Mon, 12 Oct 2026 14:43:44 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,sm8550-camss: Add the CSI
 TPG regions
To: William Bright <william.bright@imd-tec.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
 <20261012-sm8550-camss-tpg-v1-1-620ab6f151dd@imd-tec.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261012-sm8550-camss-tpg-v1-1-620ab6f151dd@imd-tec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 14:03, William Bright wrote:
> SM8550 has three CSI test pattern generators next to the CSIPHYs.
> Allow their register regions as optional trailing entries.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> index 4b9ab1352e91..05101dc97711 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> @@ -17,7 +17,8 @@ properties:
>       const: qcom,sm8550-camss
>   
>     reg:
> -    maxItems: 19
> +    minItems: 19
> +    maxItems: 22
>   
>     reg-names:
>       items:
> @@ -40,6 +41,10 @@ properties:
>         - const: vfe2
>         - const: vfe_lite0
>         - const: vfe_lite1
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +    minItems: 19
>   
>     clocks:
>       maxItems: 36
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
