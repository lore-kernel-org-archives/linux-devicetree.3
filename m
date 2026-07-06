Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50050370ADB
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350048; cv=none; b=lTz/MmHVd4SPDqc3w1OLdKwFyiWk+Z/B36JZLP4E/fT47Nq1nidBZtbytAmpw7ixj7ezgJgUPexrXwUNWkDZm+CJE4W4LJquWfUDB/oLm2dfLkPQd3hqTCG71do/W3GqFyIy/g0FdO6rUxad4VO4a07Rr1alMohsNASfPpmDFlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350048; c=relaxed/simple;
	bh=XedTG2IDkwdx5NfpwzrYaYqHqJ8175odIg3hePCzwGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OYxsIlmMZ+s86y9K3vorertfObPvwAjwwTG4VxIc2dv2+g20sf5tXevv1x2uHZclUe5a0dVu0B7hz75kB3E3CCNSFHfP2d8LAA9HVsdBig/to1mIXdJZsb7JDPYEZc0BfqtRxPm3LRcOYEBz0Q5ohUlEUTwaIeIDLoyxQg/4RfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kUX4AneU; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kUX4AneU"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb40ebefbso811769e87.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350045; x=1783954845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=60w9TL2qL6gOoHgKKaAE5HXP/8r+pqMsqQsZhkVDhRk=;
        b=kUX4AneUZOS98SlKNe8Kpsu7J0P4MKP0Q0Iw769bdSgq2ngBiT7fDInHF++nMRFrCF
         xCr4VYwhNJargur315nLxfFg1HNBLXAgoUWhcoj4LixhwqtTq1k7rwiz+/7PVawWgs/Y
         /LF0CckXf+RmmybNADKgzAzNIojPPO3DzkOiu0fD/sHHAGAWCLytekIdtTg4H84Hi3uU
         ZdOOOwEn6U2inW54wJNr2pM5Yj/t2eFvnCD9ycuktvaRYf0D+sVkYpGnP4ty+YVMTslw
         Qq8LRmB9KOmUoVAY1qaXp/tb9b4U1yYJa9TRhQK4tYzRo96k4pMLnh6O9jDgUxkVPVCT
         a6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350045; x=1783954845;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60w9TL2qL6gOoHgKKaAE5HXP/8r+pqMsqQsZhkVDhRk=;
        b=bE3aEYJ/jj3RXw5G3Pz84SqlTs3GOrIWXYTcBlepkAcLfZrS1grvbCiZAVD09LoPUD
         XqszfQao/cF9EpJOZoP2g8TMBy+Yl1LV+I9lyzSDc35cu/bUGzIAGi/qwBx3ue7qEBTL
         tdxWwyXT5JBFT++2JtSpCu+kn12F+SPHG7aSRvJyC/PndyoruueM1Rodyq+QMimX/Y/y
         KpmS1w1z2IhI38xnTb2tP9dlK9gzu1sfCb6QSoqpOEQelFqyTC0wsamW+DwrQFCwXIc1
         LwZlU/imsdKxtG0/SXpA5eTHXcDExWCgjgX1dHbMm0KnZ54+uLTz3WAJljlQhyzisbCG
         SGXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYhEdc82sLrgGhXU57WbphyDmdqBrXjYiyG+Igj8SM5IiZ7n99lEGVG91wSqdHCNLs1BnbbXTpeP/g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6FuuQiFMnFj6LE1Jg5p5aOKrTVfoAfBLXauQO6N8fq3Bm8yu+
	k0K38LvbvlVj9suT0Va+49TbFRSbSnDt3BZjqZ8oy845TPzggFRK6PvvQh8aHgi6WTY=
X-Gm-Gg: AfdE7cmhfiSOzCR/Fqsba9njDodS4/EeQb8pU0ENEt7gsgpLSd97KHr1nNZM5fewKLk
	pD4LsHlP2VI7vH43C16TE8dDE6Y6RToOEPokryigbCXSDdFSQhIncq2fZWG+94q8frH4NF17vb8
	bp7axQrKlz2t2o1tdwt2tRue/zenc7fl8Xv/bm15Ep/E/2sGocC9b13tq4q6TnllWKVyIbdDglS
	n2FTmxPr+pUlVUa1SQSNqdBcosgREM14BkiPXLYo6uPowxbOSfTwZnotB97itBpcR1bnE6G3iz1
	GILCohJOK5UZ3e5GUrkg/0yxndZa3WfpKl8Zhxh2jYAn8UKozRUQGH1jq+gTeyP631R/2U7PCoS
	A/2lqUAULK/3zEehfAwQHgkprbEwn8vwIP98Qfx6POZgeXrvJwiQvd2kHC0sT2woaVr4fHaXt8p
	q5x5nYHWvQT03gQSWaVoyXVjvzd7tBLxbKUmG5mxjRPiJWPQjrVFwV80tgfEBXRUK7Ths=
X-Received: by 2002:a05:6512:3d04:b0:5ae:b2df:c11a with SMTP id 2adb3069b0e04-5aed44f625emr1264574e87.0.1783350044591;
        Mon, 06 Jul 2026 08:00:44 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfdf2sm2996177e87.58.2026.07.06.08.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:00:44 -0700 (PDT)
Message-ID: <0a1e26f6-29be-4328-9b04-48daa6a0177f@linaro.org>
Date: Mon, 6 Jul 2026 18:00:43 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <6e8ccebb-4eb8-479f-a589-6981b543fc2b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <6e8ccebb-4eb8-479f-a589-6981b543fc2b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/26 17:49, Bryan O'Donoghue wrote:
> On 06/07/2026 15:35, Vladimir Zapolskiy wrote:
>>> omitting power-domains for individual nodes is incorrect. Best practice
>>> and in fact the _only_ practice that can work is to list power-domains,
>>
>> Let's step back and discuss hardware description of CAMSS IPs, so far
>> there is no point to jump to the practice.
>>
>>> interconnects in the individual nodes themselves as - I've pointed out
>>> multiple times now - those blocks have to ramp clocks and scale voltages
>>> dependent on their particular use cases.
>>>
>>
>> Right, you've pointed it a few times, no surprise a straw man fallacy
>> argument resembles as is, because it does not address or debate the
>> initial point of concern [1], when the absolutely excessive complexity
>> is proposed to be implemented for "CAMSS power island" and its IPs.
>>
>> [1] https://lore.kernel.org/linux-media/e04cb9dc-76dd-4fa8-92f4-
>> be002bf7ee8b@linaro.org
> 
> You seem a little stuck on the term "CAMSS power island" the individual
> blocks within the CAMSS "island" are individually collapsible.

It's not me, who stuck, but dt bindings documentation describes CAMSS on
a number of Qualcomm platforms.

> That is why they _must_ have their own power-domains.
> 
> The CamNoc is shared between these components but not outside. Hence it
> is more like a bus than a parent/child relationship.
> 
> As to your argument about complexity. I think that's subjective.
> 

What is subjective between one instance and multiple identical instances
of hardware properties? The first is simple the latter is complex.

-- 
Best wishes,
Vladimir
