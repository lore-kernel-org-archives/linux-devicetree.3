Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D592305676
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714407; cv=none; b=HjGXxViin+Pw/NTL2ypLPGRiRV04oMISdF89L1thTGNM9c5y02+D56gnMshDZKwiga53JArPENuMCeL8OUd/46XJo1WOgSWZUmg5Z2OSZL5HAGFOImfV8tx7c6gIPACMDTbUptBFJyJzd7F0r5GwGmu0uwgdyg009Fwx/0hufgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714407; c=relaxed/simple;
	bh=H2MbsPdJu3INCwzshjzohU01IaykhjDPO9vTUKTefd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDnSmd5MCE55l8oXi1Exwou5n1k6OPcfMdesaIUjNG8oyAYZla8+9DH8nbjCJw/7Du0TEWcPmFpLLo6TRoIM4+SuEldKUauvgY3ZmpGoDZdUA2hAHotrUKsDskBccjSAxn1w5OJxy9gffRRT6ruSEBK86FksU23uS9vgedt60pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eBJ9Aqr0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eBJ9Aqr0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so50822645e9.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779714404; x=1780319204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NsFAHbbgOzCLPcPVPAC9RtB2/tgqNqDMLkDlsW/0Z8=;
        b=eBJ9Aqr0acnuo6cSgx8KilSd5NsXpv6MGOX2lvrdXyOv0sFMZRO4t8wuv3pUqTEVTe
         +yFrdlagL7XZRTwQLxhAKhat9NsJboNW+J+wR+k56KYaPY6nTtI1T1W3ONzzhMTOmYj4
         g0umyA7oiW+pSXq3z8L6zSjJxkxJHH8Tok2CrCrlaZTNu9MuwzGEvEdi0eOf/1rI7QFG
         b/dgpxcrYc4Ok5RWCfsbBDUDuxa8S9/KPVrMzRCU8QD3s/wDt9eOWQXhlPCjOo/NgYsz
         mRG2gRgYd8hJylZ9uPfmfVbrx/rWx66huCxwUpStNh0o+r1Emb5VgsL7OQxFPzlwhUd3
         EWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714404; x=1780319204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NsFAHbbgOzCLPcPVPAC9RtB2/tgqNqDMLkDlsW/0Z8=;
        b=YzIhYYJwsIuZdTNPT5EGTWe8MYax+YAbh37RREyVF6Sp3I5w+mTfr7iLOvMJeJtktC
         GXBwR0yzGOpOLKlRpyeI2zcpP0fAAwZsx/h6lIg699aNcPDpgvM1Q1aw9sIt252ZhRZ1
         icdcALY56YEVSOaNCunCAme8qyUG566SuB/sTiHrwmYFVg5Rrb443prEUld7r7HDlQ79
         AfILCaIapD6KQZEltSU2BcaCeJ4RI1R7J7nz7dyOlDPIlFUMRvKfvzG+zqSFndowTHo/
         WI3kRYOjSTD3gLpRAoJAxNocWX97SKG9+4wyIo2LPPgXuzVRjg5uqNhy0UUpvfSYETB5
         7+zA==
X-Forwarded-Encrypted: i=1; AFNElJ9D0A9u3omQcn+2nHWiUegMXzIKEdZtJQDutcrYD8ggGe+IsJcC7NWq+xOJgUno0GRBm0hE5CnvvUDy@vger.kernel.org
X-Gm-Message-State: AOJu0YwGIdetE7gBbhla/D0hENM7ZSL+Jq2Rbb8RNAKOjuwHEP3dKU2B
	7ygdHec4GbpsibtTMaOzgpGlNY4pIv3GSV44gFTlKcGX5w9PdiNBaNxCa+ZXy4DaBnQ=
X-Gm-Gg: Acq92OFeZBTaP2viJgmMi6H2nlAJxoHAk+qd1GdY7U4Z5Egxn4y9MwRzFAQfU3pTtrk
	10HiOqLftrHXogAKOr1+2qCWPrVR+eRtWB3nFmukfc+qTWRpEUHjacdHcJQXXiYpnv/QrhO33nn
	O+e8bU1eqwVvWBe2Uea87cOM5OC+Dc2hVg2Dvjamfe2WCPsdKpiJYt8aKTpaXqgmDa9ujRzihIW
	CfNBqw+pWyxB1Q3r/ovrcz8RoV32J/JMQ9oaoAbH0curzOkos9NggPqnhjlOnyZbsdhiaUROrOS
	ZkWuJRHjr/4Yx6UrcFOMnDrYxq5CfFbgW/DCJVr58UTT/NbK+ve5pfm3Cj4IJpWDnTSQ2jsCbJN
	JRlqgySRhQ0Pgmno74pIJPLZds4xU0zB5ftOPV1OM68ZXgNrCgjcrDqDh3ugTvvYpeAfGcdpbMs
	dsmbhVUvGeF7wSn7j82IUNluRN2WNAQUsLAYzcf2a7bQ==
X-Received: by 2002:a05:600c:2a8b:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-4904226d9camr124435635e9.5.1779714404415;
        Mon, 25 May 2026 06:06:44 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428ec538sm84251795e9.23.2026.05.25.06.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:06:44 -0700 (PDT)
Message-ID: <4832a220-ace5-40ba-b85b-7c69b3aed869@linaro.org>
Date: Mon, 25 May 2026 16:06:40 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: thermal: Add Google GS101 TMU
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260525-acpm-tmu-v5-1-85fde739752e@linaro.org>
 <20260525125455.AF31A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260525125455.AF31A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Not sure if I shall reply to this, but giving it a try.

On 5/25/26 3:54 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `samsung,acpm-ipc` property is missing from the `required` list despite being functionally mandatory for device operation.
> --
> 
> commit f4129715b1366153f8c291ba713ab0836fdf5768
> Author: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> dt-bindings: thermal: Add Google GS101 TMU
> 
> Document the Thermal Management Unit found on the Google GS101 SoC.
> This hardware uses a hybrid control model where the Application Processor
> delegates high-level functional tasks to the ACPM firmware via IPC.
> 
>> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> 
> [ ... ]
> 
>> +  samsung,acpm-ipc:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Phandle to the ACPM IPC node.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - "#thermal-sensor-cells"
> 
> [Severity: Medium]
> Since the commit message and binding description indicate that the
> Application Processor relies entirely on the ACPM firmware for all
> functional TMU tasks, shouldn't samsung,acpm-ipc be included in this
> required list?
> 

I disagree. The property remains optional because the ACPM firmware
can be bypassed entirely. The TMU IP is capable of handling thermal
management directly without IPC intervention, so the phandle is not
a strict hardware requirement.

Cheers,
ta
