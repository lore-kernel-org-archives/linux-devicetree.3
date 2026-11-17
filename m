Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893298;
	b=FMbOHdipJC97de5ykDozVwp8eATQsV8jCnxsLG+QDietL6Y5snLl1bgt9og3mcHbRHFQ
	 lkpC6EpVW0/lhby4difyf1wx1llkIfqjiBEPYm+Lh+rE2rPz41Do7YHPRnJy5w9cMH6by
	 HQHyrrt6jhTYdb+vnqW9m2EuRZ+/e9kfvJ+pA3f4xiXwvSPrGdeCXH1oOXCdKZeamOMyh
	 mJZDLj5mAo+gTLFXsNUiZj+aUwC1fopittUTjaVCeYs5mKsmdnl+XoIuKghh/SDv4kPBV
	 7pkYZC4LPvCMBQsrW9N2LmKyTJYz2vsOZji3vHJpyqxV9+aeCH6nJkhAGvhrYWwyYmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NiXyMdzo/anqEnQBYGUdLPU8J41tqXReCV4OWaoYlKw=;
	b=o/lwJeViLEmBlzSXulXTKwaskNG7coUVPnD720XiqjSA3g1av5J7gq7cJSYUk9zadYzd
	 bc7PZj8voicg33X6GLCoKeOaGxa3VvHzSa7d/wvB2RYF/uhHScJV6ctej3xuG4l81j0rb
	 TEOjahcviEqGFYrm51G9lLtszlcH68RdtyYm429o/EIdY5Rl3zsuenv80dfEnhPyEGr1I
	 OfAIDiLmYylw82GhjmJT7oJ0quRoOBSCOJzS0CvjXIaci6iSqJF4Pdh/n1izJAtwQ/v0o
	 Hy94VnNSihNVJgd/FzlBpUyw/IjMUArytd0RG6PP1c/ykL3F8r+ePV7l2fSm/FHvA1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PR3NAm2V;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56EF606A333
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B56EF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PR3NAm2V
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f20c3aaa5so561419385a.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794893296; x=1795498096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NiXyMdzo/anqEnQBYGUdLPU8J41tqXReCV4OWaoYlKw=;
        b=PR3NAm2V4wXB4Qysa+oqg4t1oCj/r/eXVOKEK1C+1updoGEiQYPiZQO4ChQHSFmM/4
         ThXl+oVa20QJpc4g0IBo6gQhjOYAd/YmlOohkwKU4hWcEIgUf8a1rKjHpFygg/ZeopEb
         PYdaXPxgIoqgg9yNL7Y+X01kN8lu703G+NVPvHVeSbE+YSUgysJ+6L+kIrq5naBTXNUx
         NXBq3zKGSqxEFgdd3mAsts3PzyTJE1372onm63QRc0bamRkEqa6/ilUflNgIA8u49rH3
         OHRo1JH27BjdQ5tv/Cg0PaXrTUMG52VxRnazJso7HZ6cTXC1sbgUQZsDg4JVg8Lspi+S
         5zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893296; x=1795498096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiXyMdzo/anqEnQBYGUdLPU8J41tqXReCV4OWaoYlKw=;
        b=1vQ2MvuwhxG9JMdQ0/fX9jkye4aLVH8KEVjfkhzo01iC8MnuJXK7DXMFan7L5sKc/V
         7nQqxUJv/bFGOuyQAsqn383lguhvE8ohjpftNLZR0CP2S2dtm1ovlWXsxfIJ2/Uj3+mY
         VbgFIzyoKAzN4r3OgLPFZjX/VaSzYXk6HHfWBXWE4fxRh5EsVn9L4BqqDQN5xBg/lt+I
         xEJ/XnKibd7OmMDiLbPnCdcAo3NBPfUiYqBepUJSIM3CARaijVmpfgnxWWGS01o6hjl4
         TD5gBcnNZA1ExnrYRKNMsmDbI2ioe4UBkfyqfWAt2judRClTxSrOsoO2T0ndXhlWz0U0
         eYFw==
X-Forwarded-Encrypted: i=1; AL+hErGKS5LdrYhvydKMcZfAbo2LxWV+mg03JSwWzYJBGsTlk/u3hxAOnRnJEsUPIZ4q/NurYvBbC80x2YVt@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wx0gS8wcLAEeWTAxoJlFI9TC/B1EQ6eVk7gSwV6Num8NHIfT5
	alEK4W1zukvoW/SFxebEvui5ensdzDcWAYNdsj+mCQOU3posLTGiTUm/GNZ5nyZQFjTolXNQAvK
	bUS0L
X-Gm-Gg: AYBFou3l/rUtMMsO/MRZHmTG/1AZ6CCSHqApG3nkx+Z3dvGBekRSuqlgwIMDI4sav7Z
	H+t6WxnR1KqTKUotCW5Dm0IvVIfe3P4ftugHM+oln1tdNKG6qFazTRTB/bUQT0j2aKQYB9u6xmA
	ZjY1k/UdL3q6pm9akO7x2zLA7y0GgAbsFx0YgOTkZisPqLBbxbquu/r2avOLpmoSvWslgwYinRe
	hcIpjL3t3rRjr7VuE3keiBFw5nZd0cfwB5gKeXkWT3pYY6M52SI8NGhNf5XM5ZZ0u0LRV7ULnnS
	5+zvP6ML9kq+iFmXC0gbFMypusMj9SnZ4Qx3erBH+vYH55aQjqCvGV9rlp+W3fl6vxFXxCtRXyK
	JUmuA8IVAPy2w/STWqjN5lnFoJnb1Ck46HwhowQlbz0pGzfLmTaiH5yDP8BebbJ8VQ42Sbk0l85
	mnScD8cQLnaBCuyOuIBOEO2XnfLAxB3JxoSTI2umjvBEQSMk24GKhOi97K0ZnB7CC3orahCbZKe
	FJIQAitnXMcQhS0yIxQ1tjoMqFCtBRev4RcR9GvRwAQ33BaM6LocpfrLC7oJEACMJA08W4+tf4c
	0SBbgbk97iSov9GzTzbiEb8P10jOXg==
X-Received: by 2002:a05:693c:88db:10b0:381:93eb:9529 with SMTP id 5a478bee46e88-38193eb98e5mr451811eec.19.1794892841137;
        Mon, 16 Nov 2026 21:20:41 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm39990857eec.14.2026.11.16.21.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:20:40 -0800 (PST)
Date: Tue, 17 Nov 2026 10:50:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-cpufreq-nvmem: Simplify
 bindings
Message-ID: <avvkJSN9zh8tnS2x@vireshk-B250M-D3H>
References: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>

On 05-11-26, 20:46, Krzysztof Kozlowski wrote:
> This binding selects a few top-level compatible machines, but since
> commit 389de9c5a677 ("dt-bindings: cpufreq: qcom-cpufreq-nvmem: make cpr
> bindings optional") only qcom,qcs404 is present in  "if:then:" clause
> which enforces specific OPP properties.
> 
> For all other machines, this is a no-op, because there is no schema here
> enforcing a specific compatible for OPP nodes or any of OPP table
> properties: one can switch to standard OPP table (operating-points-v2)
> and this binding will not complain.
> 
> OTOH, this binding has complicated "if:then:" blocks so is not easy to
> maintain and causes false positives when regular OPP table is
> encountered in matched machines.
> 
> Drop all machines except QCS404 and move the subschema to top-level.
> 
> Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/cpufreq/qcom-cpufreq-nvmem.yaml  | 78 ++++++-------------
>  1 file changed, 24 insertions(+), 54 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> index 547265b8b118..dfc7a27a7bdd 100644
> --- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> @@ -25,22 +25,30 @@ select:
>      compatible:
>        contains:
>          enum:
> -          - qcom,apq8064
> -          - qcom,apq8096
> -          - qcom,ipq5332
> -          - qcom,ipq6018
> -          - qcom,ipq8064
> -          - qcom,ipq8074
> -          - qcom,ipq9574
> -          - qcom,msm8909
> -          - qcom,msm8939
> -          - qcom,msm8960
> -          - qcom,msm8974
> -          - qcom,msm8996
>            - qcom,qcs404
>    required:
>      - compatible
>  
> +properties:
> +  cpus:
> +    type: object
> +
> +    patternProperties:
> +      '^cpu@[0-9a-f]+$':
> +        type: object
> +
> +        properties:
> +          power-domains:
> +            maxItems: 1
> +
> +          power-domain-names:
> +            items:
> +              - const: cpr
> +
> +        required:
> +          - power-domains
> +          - power-domain-names
> +
>  patternProperties:
>    '^opp-table(-[a-z0-9]+)?$':
>      allOf:
> @@ -48,10 +56,13 @@ patternProperties:
>            properties:
>              compatible:
>                enum:
> -                - operating-points-v2-krait-cpu
>                  - operating-points-v2-kryo-cpu
>          then:
>            $ref: /schemas/opp/opp-v2-kryo-cpu.yaml#
> +          patternProperties:
> +            '^opp-?[0-9]+$':
> +              required:
> +                - required-opps
>  
>        - if:
>            properties:
> @@ -62,47 +73,6 @@ patternProperties:
>  
>      unevaluatedProperties: false
>  
> -allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,qcs404
> -
> -    then:
> -      properties:
> -        cpus:
> -          type: object
> -
> -          patternProperties:
> -            '^cpu@[0-9a-f]+$':
> -              type: object
> -
> -              properties:
> -                power-domains:
> -                  maxItems: 1
> -
> -                power-domain-names:
> -                  items:
> -                    - const: cpr
> -
> -              required:
> -                - power-domains
> -                - power-domain-names
> -
> -      patternProperties:
> -        '^opp-table(-[a-z0-9]+)?$':
> -          if:
> -            properties:
> -              compatible:
> -                const: operating-points-v2-kryo-cpu
> -          then:
> -            patternProperties:
> -              '^opp-?[0-9]+$':
> -                required:
> -                  - required-opps
> -
>  additionalProperties: true
>  
>  examples:

Applied. Thanks.

-- 
viresh
