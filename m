Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9014499BC
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678808; cv=none; b=THw5guUi1fRa6WOP5ByBNaKkaU1GqS4kd+jJJ634kieRCVnbJmYCKtLTsU92vW0U4vApbt6IGLH8x7pb7A/fc593vBlv8sRiHENmcgONJoWLIs5mVp7nOXqCFeoJRopRls8WyZSxo6VVscu9CltmnsMgpji1RAZRb6L1mDvIr0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678808; c=relaxed/simple;
	bh=1dzTBexqxGti69sqvBwGnRyvqeh7Lyvxce7lH4TfQ/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwzVtKxYhrEeYiNhWwyCgdOLY3DrGb1BgLRGC10CLEvCLgvpsJlLG5vQhAgAhDx9skmqCbmclycPW/1hq5UBaBnd8c398zGTEVlRyz4LqyJd+wEQUcji2HAyzyt3t6G5dGodaPd4l6IUl+FSqAp5OOUloHZxyPCJvAm8sand0PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4z+NOca; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4z+NOca"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso2340145e9.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783678806; x=1784283606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1wsFkUbAtuG6pFWmJltsHSUWbIpvemvXO5QB3k7ZUl4=;
        b=o4z+NOcavdngiaT3I5g2DPgoylzGVWdYWbIpFvl+jFrcGALtsOZQKb76hNqCU27/sg
         pjjnOJfKDhVYV+la3wWRpOjw2n1oYShSG8b+r48hr51Dh/OxsoOJst7Uemoap3AYuxSD
         43tQ1SjlCPIOHxwUAGMWYV+0dPxPfC6IEWAcw99UxmHfYfqD+ReIHZqCVCv+x3VCrSo9
         wUBt13JM9nmdqbajQ8k5WbUQEodAgq7GT/44OVulbY5T+vZQozETkqq5foVwR+Be8QWR
         ThWSCMTiuiJRC7b7ViU+gzktI5Et0T3RxNAeGnQDdZJx4SiD9x2PzS/D6kT5riaf6NwU
         WNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678806; x=1784283606;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wsFkUbAtuG6pFWmJltsHSUWbIpvemvXO5QB3k7ZUl4=;
        b=XPQ+n5NelrnLljSDAOHEip72US8pnRHWOWOiKNvEYRExa4dk1PP+cBk97s4hahIc5w
         5ePxF7Ocv+b09GCYEDIlz5tz5v940O/9PhlyqF7kcuxHQTWkvtXZ+rOgDMhdP5mx5seE
         lfJ6OZqOt9eNFeOyl2+tfglndo2p5PxHmPr3/uHHVUZEbQwKEiravcfVRbyFO+QgkPQC
         K8Gf8+RgKMnuSPjmGLhQzyjskXNyZIIUdPN1Ml90alst/WlMwLB8kyY3SpnUQOFe8GbA
         oUlxbWWYVUefzBgrIDNowHaenm3hm5x0gksyqpMGR5AJxN7trwmxswzpWF6L6q8iPp9i
         YwWg==
X-Forwarded-Encrypted: i=1; AHgh+RokZLLtoiqXcWzYiGW5KfVTnQkDmvQbFpJEsq8ZBXDE62zW8CyHlHJMFi6Vju+Vy0T5iULDumv7qe7/@vger.kernel.org
X-Gm-Message-State: AOJu0YzyFAkfW4+dM/L+GxzjoqQsuW1N+tI1qwocSNTIVvT2nhFz+0LN
	8BCvZQbxtdfe9DoTnNIGSdafk/UTiGXMRgsVDjentzCTJjXorMK34WN1CFtt437ojbw=
X-Gm-Gg: AfdE7clgcJpTOTBREvA+BO5FJUZbgwI4YT2vVp+j+NUsYulRLMb0IbUGrl5ldp3wq0R
	qMVAofa/QN6P7nqq0kvFoMrbrjFyFg8RBwxCfo8uY+2nAzTL4jNlDBD/Af9Zi/qragzf0cruRBe
	S0yWd/jemEUb/cFWQchhomr51Az2S+1viyBxufxHqvUtfh5qaeabMsBe9BbOOMkNqwDm2mFy4+T
	AsL11f2S/nUEIuPjicSBmEyfSR/uMH+3s1wPBf3eaocZ0eDbU+D+ABu8i9PClEXRPCrc6cCpSwe
	ojkguK0JfC4CKBUQO9sz+C+0IZSYyKxYA1k2XEwQ9p64otKub7M0wOF8Vj2AyyUcFtssiFAEIvL
	CfEG8KZK5iaTWdXMQ0UI0TA4MNifQrK5pDqFKZzip4zs5hiXM/SHddgQmZ+XwyOAIeuKiICDSVR
	KWJgYtf5QARLqy2u/5vNFSbzjl
X-Received: by 2002:a05:600c:a0d:b0:493:c389:d434 with SMTP id 5b1f17b1804b1-493e684a968mr116415905e9.15.1783678805526;
        Fri, 10 Jul 2026 03:20:05 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.243.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d53absm125534085e9.6.2026.07.10.03.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:20:05 -0700 (PDT)
Message-ID: <d5475ff0-1296-437a-89f4-1d3d6e9ac637@linaro.org>
Date: Fri, 10 Jul 2026 11:20:03 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-4-51207a0319d8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260710-camss-isp-ope-v4-4-51207a0319d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2026 10:04, Loic Poulain wrote:
> +        reg = <0x5c42400 0x200>,
> +              <0x5c42600 0x200>,
> +              <0x5c42800 0x4400>,
> +              <0x5c46c00 0x190>,
> +              <0x5c46d90 0xa00>;
> +        reg-names = "top", "qos", "pipeline",
> +                    "bus_read", "bus_write";
> +

Does this register space cover the entire OPE i.e. where are the CDM 
registers ?

We should map those upfront even if they are not included in your first 
drop, we map CDM regs in the IFE even when not used.

Also, I looks as though you're missing CDM S1 SID entries in your iommu 
definition.

---
bod
