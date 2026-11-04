Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833963;
	b=VR8NvRz+gntH3hNnrhhVjt94K4HwmTSIOSfD8QG6qzbAsdd05dkOKT+cdmvxHpzSMCVx
	 b1lZzU6oCoGOn0S+uTb2HM9obzLP+oqWnrxBmqDxQLISWM+n4qexcA26wiaLFL9cfuGXa
	 OWuG4Oo7JCQy+31V/1M40FgKRlavH+NZWHCZnd9KlqrT16w2+0Swv5iCftdYw0dOO3PIO
	 rx/njXSbb31uHozFHhAI+FV6H1rrGuH7NEq5xN67hxwbYjZHLs31vayrFieYhJqOR2ZoK
	 oJUKxOoF7H01x1Uic/DypfWX5ZV4eRSYD9MnMvLqB7Ykmcod4uM2rUBwiV83aYd8Atw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4lBfIR/LafX25Og3OCJQ1wVKuVTFo8wSNFYi96ni0r8=;
	b=gMUVVFkG2ufpYYYAhgww9IXZn7bdLFNxJPlYbs1soJkEmZ4jsH39LGLrnwjXF8fQZ3yM
	 3ZhHVvqHqdQVYpUTEz04gZpYAdFBTybqu4VjXMVRQWJ0tFJMYZsLjaKnMI2+alSackFdi
	 f9M2QhvoAklJJMLrfa1VrJzAaArQEGllAnGVgM7+Yk4ZIvJHJlI2Lo2eL7wAJCZ1MpTe8
	 A5cLjOx4EGkKgSAx8F9qaRWLN25IT7gm9TiwNMQgVoF2or19CrwDYc2W4cH+DhG53NPl6
	 F6M9jZDfaiJXgtxaGmQwsYpwNF0LTh2wkljtdSLMpnRUIJgeBnZ+FaB2kPppNQKRj0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gs9pV5e5;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94031606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 23:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94031606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gs9pV5e5
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4b29df8cso86946e87.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 15:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793833961; x=1794438761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4lBfIR/LafX25Og3OCJQ1wVKuVTFo8wSNFYi96ni0r8=;
        b=gs9pV5e5Um20Qgo2XDi0crgyXVOH8hndAHDdS9S8n+43dJaechcABgzMF3gj9EfEey
         KIuAT3G2FtKH/EJj1mtS1PFBWAxdRZmTdwvvqANPzSJZLEqsmxrOY60co79CiqVHLgpx
         I5T962ziyuGsNoMsE2hTh7U2V4DLW3/oe5rwcxjoSHX2o/K8U5u3Pu1/gKksHc1W0OKf
         j0ZwfHiBu3eoKoUKeSfBMPHKlJO2yCbPHSem0oghIS/EpeGTfPWJpe7jR/8Mqq43IY7T
         sNQkzUZWyy7FKByarHD1qsabOlRFUrBvwsAgNUPm7mHBowzx/reelAmpt3hqobysshdX
         V8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833961; x=1794438761;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lBfIR/LafX25Og3OCJQ1wVKuVTFo8wSNFYi96ni0r8=;
        b=NNV3YECEeYOGJyUJ/oRdnm1BzzQSTiVxOEWE2gDXlC0s15e0VFQjnp6ipHsHFVVVVL
         c53a6wKbx8o8f8zQbXGDzXRWz5Ey0/NGsGpEp0gCCy0vk/ADJ7HpvX3dQFqKvGEPRKvl
         lz22D0/0p3rWi2KEylDsHD0hFHU4hC6xD3B7QOPIjB/WsTg+vr304j6Rdfezu9Q1ScVU
         y6PS2aVGwpxKaidSp2sIttZrjKrO4qf1/tQCIO4i+uXpB6CdIztSe/jEcOLivs089PW7
         YLJcHR7W3zCbR8PMRj3iMjK3PjOD24RCjBWdB2Ta7W+wBzl93EgE4YjQUl9NycWerJrt
         zcZA==
X-Forwarded-Encrypted: i=1; AKwUvBxXYdaKxXHSNSOslRmiNBaMHEJw61VfPzV6/uXElNq3U8OWknyKKNkJ1RBrG9Y1/ZG4di4tYEpDJmQ2@vger.kernel.org
X-Gm-Message-State: APuU4Z+KdTEldnB0oT/xC8Uhae/YvTWIUOeF+kPls9VS8A6ApL9EOIGM
	kt5AZgy0G0WTtlsrKlEpsqpQprda4Shasxf9hbBk099xB83V6p+kqrkE+kEBeKgwoeU=
X-Gm-Gg: AYBFou0AD4OTZ1ydDgsbnCcLAnXLlL629muNJc2DP2lwVfsUtDbkgxIIrnr6qw3KYVG
	uWRd5GDFb2G6DKm3mkwa30a2gHwoSAkFinh9EYNCTKVUfbSUvhhQWtNVY/fVkroktxzTiVlIczG
	NDELC31TJrav7xtYRO0en+CBU8wHJ8OEHXkXuIyXaRuHVPU6XUskrDr8qm2z10tFswhtEoMdfm5
	Zrz/IFWA1HTel3C+LEngjh62eXvyzMsi8ahJwGimP/VvZPes5L7kYNWTMuckhCKOR3xbF+LGMCJ
	GGGTTvQWeZPdDRBpjwXbCJlsSgKOEUSww9z5uneoyp2GuxhDozb0MGJiIGWIN8pU2xNM0fGLOLj
	B1TuX2UPf26QkAdhQvruC4vRrFKYa2scCSQmcg7BA+hf7nQru6yCLOTzfDeIBeUmGLk0ytYfZ8a
	F5OHO29Zbr+mh7NYbnLJmwivldJIr8GszehZms/MhucTAWijQes3MRf79aDLZbkw0uX2m3bTsHT
	HBLxQeFBpgvF4pyzcI1cQk9RXSGeT4gmN3tBLe4vHpfgDUi5fPQrR285B0eZRu3mIM56f+xO0OH
	IZEuk/FC1D5jln9XPYRoOP4VdRLrpjVsQnsBrBdix9jTzqjusqkVC4Y3fm0sEW4tf1fOwnIsGdA
	lIrzF7ew=
X-Received: by 2002:a05:6512:3a89:b0:5bf:f642:bb43 with SMTP id 2adb3069b0e04-5bff642bd0emr1119881e87.3.1793833960601;
        Wed, 04 Nov 2026 15:12:40 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38cf7bcsm540327e87.71.2026.11.04.15.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:12:40 -0800 (PST)
Message-ID: <ec559f1d-0ecd-4de8-9baa-a0a6d5aac5b8@linaro.org>
Date: Thu, 5 Nov 2026 01:12:39 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 22:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add qcom,sm8150-cci as a CCI v2 compatible, with qcom,msm8996-cci as
> the fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..b545fd2378da 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -39,6 +39,7 @@ properties:
>                 - qcom,shikra-cci
>                 - qcom,sm6150-cci
>                 - qcom,sm6350-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>                 - qcom,sm8550-cci
> 

Apart of the update to the list of compatibles it's expected to document
the clocks.

-- 
Best wishes,
Vladimir
