Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08ED3E44E8
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349363; cv=none; b=pWcKfEpjxRHaqGnXwsAnLBolzQOH53jBx+9SOofKdCp0vkzxLn2PFZlPatWgnfzt60DicD8zWsQ63FwJzhJAVXARGUv6GYJLYqBtMS730Z1hmZRTPMc1k/kMQcMoZFDXXlZRvk1mTHik6lg3PEPc6bVVkGcYJDdcra66CazvPuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349363; c=relaxed/simple;
	bh=Y/EJaKXUiPjtu9QsTiWTSVoWswUxIqzGEcw/GlNHd2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bD2oIvri9TdLWOf24WKnnSRYUSqdVnZo5z1ILpVg75o/e7mx1M4eWmLpu/YcYG6WPX1stTF0oBfCJ2Xym23Ldi/cJF9Tz9Vh+O+z+4bfdRovCg47mBs52KAcURQ1rDfMH7RMrMAv8Kio0yLTbgg8lO5dUiBYpZ14xMeO8OWsEn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BQqkMLNq; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BQqkMLNq"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c125bcfd9a1so440861866b.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783349360; x=1783954160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aktuCm4dzDRogmLQjOyUeMLfDpXuAbLPNIV0dLlhxik=;
        b=BQqkMLNqTgpHJc4zSxFVhNzaVp6NFTut5WaQU5Ry9ge+m2itHkI73gWK/Du2Sx32H6
         gZvNCxKqMf9gjhFhIUtGK/+YGP5D11WLV0YOlFxoIwkVEAKo7Je7TLNmVRvT+HeL3JmU
         AAU6YnTQPc3KUoQwBC2l4HEZdp8n0qmpazgaXgxM4+XqFfLMcDQieovdkEqdOA1rjlYj
         gC2xXSW213QbxueaKXgkOutQhCvCJ0Guq+Jle0ZbNAGyHJvIhan2fASc15VN6CTipmsR
         MCYgHnJHDYJkEJID/SBiRNKF+yQWoqYl5czG6zLCD6LH43KwPpqSIedAB7BMG7q7viw7
         aXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349360; x=1783954160;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aktuCm4dzDRogmLQjOyUeMLfDpXuAbLPNIV0dLlhxik=;
        b=AiY20hQ++1I8wXKoa20oMX8q6dV6SCbNmq8TIHH+q3gIoTvPz3Z7v/kp8uEDGEgYxJ
         uxI8Vk94MgFFIIkBS/Md0iCz63+SQu8MqlcXmkMYuLbIUwmGB41h92lggjkmAHQcuEob
         saMJjbZkqNcDh1pMDu07oMN+8mvN1DZYCPbakb1B/VRkXlFoUeUwcGSjC7CWP5QAdg8g
         OCTcoqR8YQlLjloTkVFx6u9D4mkKYYTBKOKWC6CMjxlTNI26uj8KIC/1cphqJ9PFSiRf
         b5mu3PQH37DM8fHOLV9P4ES0mQ1Tf01EYvChOklPQC8mPtFjZoh9gpkhWhbvMGNsaVvU
         FSog==
X-Forwarded-Encrypted: i=1; AHgh+Rri+5rgvFS1SSGZyK3dKHOq7UbJZr31r3GyLox3dOqI6nMVKS74zM7oXCKbCqDhEmIMXzvd/Cy4gsk/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3vOIOaUeHPnK3oeHI5ZweBp+KftZm39tgTqvY6bLpXfodx7Rh
	Q7VBBx8Bqc3K1uEExq59LlL4HL91U29CHCeno8v5dgQpxbnTGKO0VRfBRquncwX8q94=
X-Gm-Gg: AfdE7cmN/lYNG/ngq4Pno9eUbxD+CDk6DLsGzSgF8K/bUUKWo6L4bHgoa231Gg29Up7
	cZW45Eza8KfWHb6VdWotWoH+2re9n4zUp6sh8wUa+JE6nmFEXHYSdDm4SDvzC8c5FKzOfDyEvqv
	AjBtqGnNp1sU4W4w/8FpWbo9rS0mabAYhMqqmVkS9vAqZOjIDpmFIJFxTdmGehe1vMKzr125n8r
	tTseP/BlFaa/DkGFrctXycN0VlM8gTT/bMUyJCqkNiZyRyQFhQ/aSgcdLdhpTxWz+TssFT6/leq
	phM9VY0UMj5VBGFS7gOCYGC/ZS9I+KHzoAjhmeOO9XmuembFJHhM+xJGDmrrYzPeCW8j6W/2rlF
	EF1+iHyixcyW44H2eN0twF4d1w3wdOF97gBWZtmCPDsqrFbJ7JJSOP6bHjAjTr2OMRTVP1AH7+5
	y/uXLLpw49GtPOR8/dYx0uSBkL4J9whHf6PIm3
X-Received: by 2002:a17:907:742:b0:c12:8331:bd6d with SMTP id a640c23a62f3a-c15a6907332mr59088666b.44.1783349360298;
        Mon, 06 Jul 2026 07:49:20 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c41sm768765266b.59.2026.07.06.07.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:49:19 -0700 (PDT)
Message-ID: <6e8ccebb-4eb8-479f-a589-6981b543fc2b@linaro.org>
Date: Mon, 6 Jul 2026 15:49:18 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <48c3ce6b-1e2a-457c-93b2-8fbc0912dc20@linaro.org>
 <f3d148cc-496d-4301-af45-51d8921d7798@linaro.org>
 <3b0f7a36-05d7-417f-8efe-d6ba06488406@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <3b0f7a36-05d7-417f-8efe-d6ba06488406@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 15:35, Vladimir Zapolskiy wrote:
>> omitting power-domains for individual nodes is incorrect. Best practice
>> and in fact the _only_ practice that can work is to list power-domains,
> 
> Let's step back and discuss hardware description of CAMSS IPs, so far
> there is no point to jump to the practice.
> 
>> interconnects in the individual nodes themselves as - I've pointed out
>> multiple times now - those blocks have to ramp clocks and scale voltages
>> dependent on their particular use cases.
>>
> 
> Right, you've pointed it a few times, no surprise a straw man fallacy
> argument resembles as is, because it does not address or debate the
> initial point of concern [1], when the absolutely excessive complexity
> is proposed to be implemented for "CAMSS power island" and its IPs.
> 
> [1] https://lore.kernel.org/linux-media/e04cb9dc-76dd-4fa8-92f4- 
> be002bf7ee8b@linaro.org

You seem a little stuck on the term "CAMSS power island" the individual 
blocks within the CAMSS "island" are individually collapsible.

That is why they _must_ have their own power-domains.

The CamNoc is shared between these components but not outside. Hence it 
is more like a bus than a parent/child relationship.

As to your argument about complexity. I think that's subjective.

---
bod
