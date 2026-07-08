Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7CF3FA5D4
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496956; cv=none; b=k8XSEm2JQCf9PJMPkp9I5rhIc3iGgNacKYH03aqy4N4xE0WG1FJ7zLZ/XWV6PqoQgq6oUgpCY1nfzF1N6A40822AKlhmZCrq8Ve5eSpuqCKH+dMEYKktxuAj9HXFNC6aeR1KPyJhNYmeZJAzGJ9N7fN34I1vWcRMPbABOtKexjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496956; c=relaxed/simple;
	bh=iD6EbhdjTImQiP7DV3hDp8W9DVyZurMh8iMlgLBN7b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs3sFaE9Kb8ZUIfD60On6E7tf/SCnQuQ0h3M1kBU98TLa2cWaOz8DHed9Inb/ckxwBaLj/WdDQNI8ybQ1mQIpjcxymRdcqHNjjCo2mwvmEt0sX6vA5lBQkL1NbbMJMcVxiDOvW646dVot9xtpQHeEsk0EdTOvpssYQM45bh6LjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hV7Iasce; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hV7Iasce"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aebe49b227so89574e87.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783496947; x=1784101747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MCt+qXqsFWK3xJYzpIGst74sX1gCmnXNutx6uCCcmyQ=;
        b=hV7IasceItoym4w5w+gkoaoMsDxU1xyqcknRkmSWh5KG8nxoz3qHHGl81LZmy0mI4N
         ZCE22YM9n7UX0anPoPi9dG/TrEwVL4xdtH7+0HMHjrs4ZMcitOPCam4QK+WA0pZF4Zqc
         7rKGLAkIW4O9qIl2X4hSCtsNSt/EYzy8Fk5N3wET/AG5ZS87ib/9Jgj0EPFY2J/EHjGo
         Yh1OhzDXDNuIYkQacpiYRtwbngCF/wyn7QAyUf827rtg9cbHB54Zhv6AFqrgrbIWkkCT
         5QpYlt+cZw7djIp2IguktTVLtRk7vGtNd6ieFWYlzigOJkFp/7YDFS1AiA+N7djjhGGg
         OsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496947; x=1784101747;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCt+qXqsFWK3xJYzpIGst74sX1gCmnXNutx6uCCcmyQ=;
        b=p4Nn3qp4biKgxbxIv+X7C0MHzx9AR/TXFwg4vNlpkbBdYKY1K5a5r9Dbdc2Y01qwNl
         qR3Scs0XdxNrfY4u5Rdss096F0fIA5gU4ZACOeRVfYyN5m7jZqz5mFRZEA3J6tAD7s3x
         u2HHE6OfRvQF+y1kxMhGxwXaWEPBUBaKHglQgvFkyeE5VWdcF4q5wOa5LzjQt9ejsrl7
         hQEm8zPPVAkpW09MAWaQSXwCesxsi6XosBRed2xaQYY6tmu7YlRfxG9K2o+lSduIGk6k
         ba9ELq2BhSs+Jg1tk+P5e8mCVY4bucuCLsPSn2jbSGRqTvjnCP3YL27eHA/69B8qWBJS
         zMCA==
X-Forwarded-Encrypted: i=1; AHgh+RppSaEB5md3XcWNvQeflyBz8s9SNYUK3fgdsrRcunKz1TQtydFfwGjl8DA47zww9nJ2Vu38Rs1mHguK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa5d56LF4sg5/ukr0y1baQfyHCPXTgEvmhNOHFVc4xneLBLakN
	NnWCEPLUByRBFgjiDGmq1YClel0I/2AQNNpdCfSKec4OpdpCeAQIgZZaqNYnaofPPEk=
X-Gm-Gg: AfdE7cnoQAR+99v+ryoiwCazlb/spa73IooN2pAWpZfhSlEuARK0fxEGsxaSzlzJeXB
	+pJl7C7Le47kyWUEUfX9qAHnwwpaOWCwlslQ+zLRYq6auDdjGARJB/m8/Ej8sau/A1scTDTACyB
	gTQAJamTtRcbTEw+HigpFHWBuqCMnHiNAqz7pCJXOaPmLAgGhmXSJVNXWQyLvDrsTr0cK1slNVN
	PIjvTfvYCNBY1yy7ahvl62WIX4G07pDOM5pdf1T3zO+smDFhpvP6oHJOA/RTZJbxU1iFC4RDGke
	z1aLBS1kNTpMqXsLMZd8Ib9vIyOPfF/fJP/TNp9u9fI17ZScfW/0p3VrQvofla8Z6d+Rm+9QrtT
	lOeQb9WhQLQyX099oK943/a4hGE0L34kwJH+ZIwjecqRvXqaZT3ai0XLYtt0YEkD5vr2mdfW2ez
	a/OztYTt0Nhdd872246ggrBIt4nEQeCmEe2YnnLLW118tEUI6Z0lpr8OF1FrslHP6fr8k=
X-Received: by 2002:a05:6512:3a87:b0:5ad:2e00:c596 with SMTP id 2adb3069b0e04-5b0113dae7emr226711e87.0.1783496946656;
        Wed, 08 Jul 2026 00:49:06 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b007f68765sm1417696e87.10.2026.07.08.00.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:49:06 -0700 (PDT)
Message-ID: <6520f340-c219-47a3-99e0-b48007896164@linaro.org>
Date: Wed, 8 Jul 2026 10:49:05 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/6] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-1-f8588da41f16@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-1-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 03:06, Bryan O'Donoghue wrote:
> Add optional PHY handle definitions. This will allow for supporting both
> legacy PHY definitions as well as supporting the optional new handle based
> approach.
> 
> Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
> its own individual rails. The old binding is still valid but with
> individual nodes we define the rails in the CSIPHY sub-nodes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..c17b9757b2c86 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -39,6 +39,14 @@ properties:
>         - const: vfe_lite0
>         - const: vfe_lite1
>   
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  ranges: true
> +
>     clocks:
>       maxItems: 29
>   
> @@ -126,6 +134,16 @@ properties:
>       description:
>         1.2V supply to a PHY.
>   
> +  phys:
> +    maxItems: 4
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -158,6 +176,14 @@ properties:
>               required:
>                 - data-lanes
>   
> +patternProperties:
> +  "^phy@[0-9a-f]+$":

This is too wide regexp mask for 4 children CSIPHYs.

> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
> +    unevaluatedProperties: false
> +
> +  "^opp-table(-.*)?$":
> +    type: object
> +
>   required:
>     - compatible
>     - reg
> @@ -171,8 +197,6 @@ required:
>     - iommus
>     - power-domains
>     - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply
>     - ports
>   
>   additionalProperties: false
> @@ -184,6 +208,7 @@ examples:
>       #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>       #include <dt-bindings/interconnect/qcom,icc.h>
>       #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
> +    #include <dt-bindings/phy/phy.h>

The inclusion of this header is not needed.

>       #include <dt-bindings/power/qcom-rpmpd.h>
>   
>       soc {
> @@ -229,6 +254,10 @@ examples:
>                           "vfe_lite0",
>                           "vfe_lite1";
>   
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +
>               clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
>                        <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>                        <&camcc CAM_CC_CORE_AHB_CLK>,
> 

-- 
Best wishes,
Vladimir
