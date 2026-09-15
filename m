Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE153C9EDD
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476563; cv=none; b=FyAGYLlrYY2gasP+daikF5ID0MWFnVzGbmjvr3HECT3BBu/vB5UGCIbpeROAfQWgwQQ6S6PIj32SsH/TFfb2spsuaeC7EMACBgQsCqqRg0Dqc1GJAXKXOEXzoheMC36f9enKwWVWNnix4iGsWaPfcu9j+mX94eJp7B+9hSYt+Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476563; c=relaxed/simple;
	bh=1CfyMB2h1Lp5gQE5pFkDas8JqDgo931tl90o9e2+poE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYAYzncyDjevQnjBzprrt6nusRHm5XZpFjvGaeBJtUhIV3CO9xc/R85TvDY01k2scUrVExqsEtai7oxpo5YhbgpoU/B8QoCjratOqrTd/E7KxTy/Qq0HBzWHiqoOS94cuGONqj+yKOgBWi2rEgnQqzK0gn7aFZMAlkbwkLl+YbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=YPGzebp8; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="YPGzebp8"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6ebso33859366d6.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789476560; x=1790081360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLVX/S0EuVLiFJIa1AXRvkqCpIEN2ZZSYIPfhR/fxMg=;
        b=YPGzebp84QnP86R4DB/p71+CXJigWjxJLbu3ccIc8W9emX+CLx2S9odNrwMoPs3Kmy
         180iHI9rJTxuShT3mKiziQXxf36RpzwGFwYakSRTQH7eA4nNIqyFSTJ99KMHT8wGm6QV
         plasUKXQWRNhXtjC9sLPUmp6Hsr7T1h4hWQniJLKVykNUvSSSuA5BQD7ddc9CdxX6Mli
         nd7CyWokdn2FeTdMuv6D53k8XE+V0W+wGWq4xrZa4lyw/mNRm/4saYUJUXzNGgLq5j6l
         5wW58OkrMSOL3KwrPjOOJG7bwnZVh5p/NuiOOElqTNpZ/rPV4tgluGO2VvJrAZfqIOOb
         wYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476560; x=1790081360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLVX/S0EuVLiFJIa1AXRvkqCpIEN2ZZSYIPfhR/fxMg=;
        b=ZMzET3i9YNK75HmH4CRyyfbiLrbnqb2CrbBexH3G7ml8kzFd1ZjqwP8KhaEnz78dsh
         R3fLWXAazAcN2Nv6iwsyHvz5ugdtmTsWlURGy4VMYhre7dKglieJb/GM8QQehS+OEiis
         ErFy02Evtjk/2PdjOV8tTJvqyvdFs4pbN2pbefre54vh4vDErnVWH+0fHVjirEFp8f1G
         avAVh8LcGX7uSPR574ne3TsyU9OGEpBmvSsj7dsJmJDbtRnyNaIIWDtylkdQapU2yRbd
         m59YUu+bhbs4Q9PEMq/0HnMEoTcgau1/JnmeInTzJovidVaEPCqqid3tRliPleKAMvML
         3KVA==
X-Forwarded-Encrypted: i=1; AKwUvBzbXhQFxbydvfEvmo0O+7rB3GoN1EfXYZ59ADI8PuwbNRVfieh0qYCrzjGWZzhjQ9nnAAEtOCaSDqXu@vger.kernel.org
X-Gm-Message-State: AFuF++kgixD2awYirw6OWOvTfCl81m56EUK1QFtUJQ83oxyM2JSXYO1S
	E/GrMAkz5NzPF9If0/IYMZpg9emlQ/ZtO1qarCNS08jw2PZ6dQmHFuhHCKY9wNU2puA=
X-Gm-Gg: AYBFou2RyM0LavG+A8+PN4eBTUv/OjhIJ9gRW+Gjp2Qpv2v9rsIWV59aJpIy4ci8MV6
	9Y5bRVQWDCZy+xZtJGC9cYPI+Adw3+zAPHU6/GsyX8g3W/57Sod6wN1sXs/zTLDjnkOcC0pABib
	LkUvVl6hUL9jDOzRlM56OB90XLtHlgpbN6VEVr/n0rWNcL07VbjaozwPz0bUd/CclnrAZ+GH/zN
	9Sxug+S2rvrOl7yAC/56UhvpG2MgeGcodw4XsG3DNa3sthc9zGtosOinKn5dpJaDbS59tFCQC/Y
	u15TQKpDMIkxgUjeiaoEbpl6os93DO8fozB1LeS678FeCXF/73eyXn1eByNzr5P70wExO48mp9D
	TGgZ5orhouUIRNhZW0oYbkNa4akKroKcXze0Y9QcGi5Vt3m35xEsxq37wpVUtQh1/hnBiPNJFpW
	fAd0vEF5XQUi1B+dRj+4k2959MH53HFYJis5VzphhO5MZKM50g+PGNO+rFbkxgmIRL9EhsKE8=
X-Received: by 2002:a05:620a:43a2:b0:939:eb65:bd38 with SMTP id af79cd13be357-93a29a820aemr1092541685a.35.1789476560394;
        Tue, 15 Sep 2026 05:49:20 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a382ab7b3sm169560185a.19.2026.09.15.05.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:49:20 -0700 (PDT)
Message-ID: <7de28ce3-fb1c-44cc-96d4-47d21f6a05aa@riscstar.com>
Date: Tue, 15 Sep 2026 07:49:19 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: misc: introduce pci1179,0220.yaml
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-pci@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260915031038.1087264-1-elder@riscstar.com>
 <20260915031038.1087264-2-elder@riscstar.com>
 <20260915031552.179121F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260915031552.179121F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 10:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: typo in compatible comment (TC9654 vs TC9564)
> --
> 
> commit 8118db85b05b7b5ac32fd5abc0d4c0b807fa8de2
> Author: Alex Elder <elder@riscstar.com>
> 
> dt-bindings: misc: introduce pci1179,0220.yaml
> 
> This commit introduces a new devicetree binding for the Toshiba TC9564
> internal PCI endpoint function device. It uses the pci-ep-bus model to
> represent sub-devices accessed via the function's BARs.
> 
>> diff --git a/Documentation/devicetree/bindings/misc/pci1179,0220.yaml b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>> new file mode 100644
>> index 0000000000000..fca3d331097de
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
> 
> [ ... ]
> 
>> +allOf:
>> +  - $ref: /schemas/pci/pci-ep-bus.yaml
>> +
>> +properties:
>> +  compatible:
>> +    const: pci1179,0220         # Toshiba TC9654 (a.k.a. Qualcomm QPS615)
> 
> [Severity: Low]
> Is TC9654 a typo in this properties.compatible comment? The device is
> referred to as TC9564 in the commit message, the file title, and the
> MAINTAINERS file.

Again!  I fixed the previous typo with a new one.

If no one else offers any review comments this morning, I
will send out version 3 this afternoon, fixing this and a
few other things reported.

					-Alex
