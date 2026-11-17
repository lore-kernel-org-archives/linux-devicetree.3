Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893596;
	b=ZBELdPvAYHpO/vCLnBtkem6iwsF0RiyIxJATfRv4a6EyS7NdYA72Elva+QqhG6wtW9Ot
	 Era06kdRzosSvlR1f+Zp9W+n4S2M12nDq6uQ2zsqTQ02PWVRYZurvDmatA4Ydewgy/Qoq
	 2TBDjYA8x5ieokNRG5ilt0OYNff0EfGJ7UmK939jRT1K+xvnLrXwf8q6BkUqnmm49CWRZ
	 KwtGWqOfPNZk5fcfBSfEx3Ir+G2BBelGRcuMQFvTOLVJuflXzgqgY0PsxXNv6+KPtIQL0
	 64Das+/E73zUTvKkOBzlfRNb1eZxHlTdTQGHEgxqStM6DLVgUwTDJ2FVehyeoJvjuIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Cz1YEfgAYIVyaKhtnxIgh6hL4aaxiRbKUnEOpQeT7xk=;
	b=z9hNPh/ehA5J/Q1pUcsfITcRu68XbW2jc3+wa6cncha3GNMced2GmWQd2YPuzeZL10Eo
	 p9mx1qmuFVgA8GCKcg5tW9BcNoVhjuUFINVWYjRXXmUQxq0QRNI3e88IOzZ7SoPw8EsJC
	 qxqUuWS7H0j970IsAxsrGlk5Kgfaxgrleo2FbMhLaHRD4+nm4ZLJvX3pkphMY1Fbt+kLt
	 vluOr8Vxe2ndqNk+2iTBaheWJCBvf7YbNRYmQYJIHdraTrVOx2ltKn8gGvjWCfVOKT/WL
	 AW6Rzi75/uaWoBbp5efZ+yhJ6HVaiQSHAPrqJfa7GmEcEldv87Qb95VEL8Q4HeK8ULQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AGL+KI8L;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D33606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D33606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AGL+KI8L
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5528078eec.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794893595; x=1795498395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cz1YEfgAYIVyaKhtnxIgh6hL4aaxiRbKUnEOpQeT7xk=;
        b=AGL+KI8LRIwJ8cdflaNKNFX41d2JvLSAp7FK7DVGhFMM95xQ2g6hkZnMXfgy9Dk+tz
         jF/FOlGQCot53XTV7jjbVzexEd1ibyLLbiTnWYmzyGIob6wfhXry4Yrmn9Xjpx4n0mmx
         64xX9MjzM7kY4bo5/t/gzirbKWGfsp9tEyCAHOimcl08rU5Jl4uBa0Wx9mSgCrQuQqsP
         BuKV0XZjl8k+qcTtAmGxUGGvp7T/UmVu1wwVOJRLskCsA7D8hi57ogVTzIBQqTPazWwz
         2lnQjRhPrDRp+kLd+NWigdsX7LEWGmKltMB5scA64g+l8CZQH+UdN3I43rrZuJuzgNuT
         z4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893595; x=1795498395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz1YEfgAYIVyaKhtnxIgh6hL4aaxiRbKUnEOpQeT7xk=;
        b=dLhU0TBgoFu0r6sM3lT2AkmQDAOUqvmLzUNiUcYTWPEZFpzBuUHwA82GOvzxP2LSPl
         z2WUUL2efqSdEvXnBmMgq+QTrY4SzdADq+jyrd/RhnQJt/Aq2PlCRdRah6AA97BG8z+8
         ZqH9hqG1eZdtJhGKmpc84g8d2OGFguChdFRPS2Ms3T/9+Nlhtbkc9PfwLOkp1E7QJN2T
         6yNMivKizS0XFsMXPID0b2T+J4uVVINGrZ9u+BUFxlav04EOJlYoAWSjpeFgikYYmdkU
         7TZ8CjXkSrUQ8H7qR8id45FgAoZff6y7KrG70I9lCGqCxp6WNLebtHwIKwEdi0KjqGEj
         iYjA==
X-Forwarded-Encrypted: i=1; AL+hErH4z178irMkFJqLIdsSLQE5f1XUsVMFU4Qh29fferQ9k9lTe879Sfquh+vGjIYEc1UQqyFa71VrbGfP@vger.kernel.org
X-Gm-Message-State: APuU4Z8xJLm+GtpqBfpoX5uclZqmFf7bOTKTolEDFNQf/T6Pk9ob6n05
	flxeKPzL4veLMqbHCebQSQI8tx6gNI19NtRlYG4TeQUDnZX7XcmB3gtNVTmPG5pUmko=
X-Gm-Gg: AZFdTZd0O7mz+N3/8A3xMxtltaWEKVx8GGPdp8MMEHuKnm7ci3X/dd5YP2G4oV+8l9T
	41ex84f/g1sTJQHC7DSs+Hi2hHx+LFF7jozs7UvnnNZhVHQZ49xiRa5R3fNGqFgAB/jAl0iy3Bk
	STg9AbD3ep5HeXhBYZ5qC666iLhgQdDY/8ZZsA/saMq4dUGxQYaDiqAPzzXK1ar5K/0+hLMR2Gd
	fNur810qdjcCKNpWnO5vXqtXn5IAFvDqRni6Wj4aydAcd08ikNolZ/zAu67c5Fgw3vaIUJ4FVbe
	ihQH2SnAwQ0CEnQ3ZdJZDNq8Jo+/dxc1O7/qmEqKjEpyxWdRBRT3tv9+2trO+1q4LIfoS0Yiyhn
	WDYGRijUv8QmaW3sR3dsHzsk76F0GN3DkOwFE8bzNlHprGwf4Dcy6RxsWd9BmR4Lg8rgoKrSZ+o
	r8q2LSaSSoQ7jOUnl6AMbW2FEnlFYOiLdRFq/W1eYzi29hNDxI4aAI5/4akz1WfI6EvMA2uUshA
	C9kjfKV27NqT9OkZdOPVBQH3SEGomY6yQtp/Nc367DBLIqsrldrY2MFekEQxG5ZnwPjzYCdahmC
	uzk5RT6EHZOgbyPmKRAf3q/mhC/bmA==
X-Received: by 2002:a05:7301:b06:b0:376:13e5:e8fe with SMTP id 5a478bee46e88-37964b08f4cmr11532201eec.3.1794893595271;
        Mon, 16 Nov 2026 21:33:15 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm40174212eec.7.2026.11.16.21.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:33:14 -0800 (PST)
Date: Tue, 17 Nov 2026 11:03:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Majid Hajiheidari <majidhhdri@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, rafael@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	abelvesa@kernel.org, mani@kernel.org, admin@mswin.me,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: cpufreq: cpufreq-qcom-hw: Add SM6125
 compatible
Message-ID: <avvnF7zQfYhF11so@vireshk-B250M-D3H>
References: <20261115003158.391171-1-majidhhdri@gmail.com>
 <20261115003158.391171-2-majidhhdri@gmail.com>
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
In-Reply-To: <20261115003158.391171-2-majidhhdri@gmail.com>

On 15-11-26, 01:31, Majid Hajiheidari wrote:
> Document the cpufreq-hw (OSM) block on SM6125. Like SM6115 it has two
> frequency domains with one register region each, so add it to both the
> compatible list and the two-region constraint.
> 
> Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> index 98eb36bff..8dfe77d08 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> @@ -28,6 +28,7 @@ properties:
>                - qcom,sdm670-cpufreq-hw
>                - qcom,sdm845-cpufreq-hw
>                - qcom,sm6115-cpufreq-hw
> +              - qcom,sm6125-cpufreq-hw
>                - qcom,sm6350-cpufreq-hw
>                - qcom,sm8150-cpufreq-hw
>            - const: qcom,cpufreq-hw
> @@ -146,6 +147,7 @@ allOf:
>                - qcom,sdm845-cpufreq-hw
>                - qcom,sm4450-cpufreq-epss
>                - qcom,sm6115-cpufreq-hw
> +              - qcom,sm6125-cpufreq-hw
>                - qcom,sm6350-cpufreq-hw
>                - qcom,sm6375-cpufreq-epss
>      then:

I hope this can be applied independently.

Applied. Thanks.

-- 
viresh
