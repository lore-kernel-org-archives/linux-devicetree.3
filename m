Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5A8438461
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246066; cv=none; b=OVgYaOdJYNUe/pVxcdZG6DsbKgu52R3wYxYlAvGMkHNJvMFKLTCC7ztNsn3y7l94HlXAhc+fgm93tD8DWPydSNhdGFU1Daf/s5lyRoesBQxERY5wB8ncoLMa/RSkaVEe34zCBCsNYHguLVSfGx00L1+8Qq1xgww62oJuaRwRNKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246066; c=relaxed/simple;
	bh=vNK3/KJC+Nv3ESREzp7sq+ER0NB9BzHnErO5/s+ZOc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MSU+3PkPV4yD69yH0xPTy5jdK45cqYMPM8FpnE6v3eoi57Es/75hfEZlSHJahuPcYvduE1bVcE9tpA5D+IqYGxC7BMf/eBB0XY1KGkBtBl0qO2BbAcr8ygYXqWK4tUD05ntVUTNCvD+2u5999wAx73aKndLhybazR3kcNkVotS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ydCRvsmE; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ydCRvsmE"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e533aacf2so206021685a.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1785246064; x=1785850864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKjmhvUTztvaS0W0C4c688T5vwX1u05PK4NnDkhRFV4=;
        b=ydCRvsmEMDWq6tEnGxpJyH2IvUFh0GUzbjzVnfH+/boOFTKToyCTmR4jeAwblQuSBE
         rHL1hCBUtdjqJKkqNGJf/3/x+QMPezS2132GXC+WmhUdu4Dv1FDjxFKk2j/1qXJlFpwF
         6sssSmJPr0an3L74Syiu1sSzXGXl1S+XS9csvTSNow32qmIc0HkR/w1UO0Btxi3W9E33
         Ucuu8OtITuNi4Rp+tjZDWYWcC70j5eGPw6NA//fK/hKQwHICEu8GzkjQ0u86zukYS+AB
         +bwZzGeOB+GeGs6YQPEXrGH5eK1q8fcWPLixRDApep7UNm2UC4a0eaNAwWF193mNlUZP
         a+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246064; x=1785850864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKjmhvUTztvaS0W0C4c688T5vwX1u05PK4NnDkhRFV4=;
        b=NOju5zxGd3xeI5syHxHEAnK3L4S7fZY3W/ycHXzQy6PKHn6bgXEHqNxAZzE6fAxayd
         FdlksnGbatb16eMqHDIJQPRn+9JOG1BGt9X7zLv+HSoXHrC4KTVruJ5AQ9tGak3g/Egx
         xlsT1O/o3ZQteoBcKsFilayE8JmvYnd0n3Q4+KeO8yOCFX+37X/FGr/WFH/YaANPqyd3
         3N1JeRHQvzLkWp6yqmBDLtOkrsiKKqFEt++oA1k2pWhnPBBDamj4G6vNaxVjMYRZvu/G
         76mgb1furVm+pun/a5IQ0MwTBpBtxdwykKQXJOsJCq+4KApX1sCPlrlYqrBWX9Jzzh2W
         L8uw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4S92XsjIzOpi5z4gi31lpvywRpcsnhqP3UVdiX5+8vO/KGTq37RcnT4Pk5BJEJatzAwDuWmHPAbCC@vger.kernel.org
X-Gm-Message-State: AOJu0YzFAcvpxurdFutuUZXJto1CgpJ/V844jy6FqzS4kmOczFK7xHNI
	S3NJ6aUVNeLyNJ8yApBcw3G/AnB5gQEjMQ/R/3g337DVRg2mdgIUJcv2qEV6nYgU7fI=
X-Gm-Gg: AR+sD11lt1hTF6j8TwkPJHGNHrTnbf2f6bmHx74A5GiAAyQ0oeoK8wKsdDfgWGsCD6I
	d+a8dAkeRcwL/XmQMHIgPe/kNejsEjEbOMYfn5UCd/DIFZPjZAxXggeqY1t8K04S87fQSQJstl0
	4ZFU0cYo+r10RamQLV40FMBr30cuJHPG8C9YzGQ19q3RsYo92ECpicXioOjpqNukSgkIUq/sZEi
	rX/ZL/KyE6A//pCQWylXGrJWevE7w05h5EFor2w4Hz65XOBsCyjPQ1rXdCsngOHbZJ9GdobjAoL
	eQwO2vnKTHw+AGeWOvR3WKUMRVrg99XbEW+f2DZzvuFvMG1plDzhhyrY/nyXCwbexvOuNQ13vR2
	8QJOYMEOyNToA99aP64AusC7Ldjo/lRYsYhIafX0unXiJGGvt/uaVymcHi0m8jMcqFoMTFAg1w+
	Lp7g==
X-Received: by 2002:a05:620a:17a4:b0:930:f67a:a9ab with SMTP id af79cd13be357-93302741ccamr246375585a.77.1785246063856;
        Tue, 28 Jul 2026 06:41:03 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de5154edsm846774485a.6.2026.07.28.06.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 06:41:03 -0700 (PDT)
Message-ID: <24fe82ef-ff0e-48ec-a6b6-c04d687e7359@riscstar.com>
Date: Tue, 28 Jul 2026 08:41:02 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] PCI/pwrctrl: tc9563: Fix parsing the integrated
 Ethernet MAC Endpoint node
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260725-tc9563-fix-v1-0-ec4286e31331@oss.qualcomm.com>
 <20260725-tc9563-fix-v1-2-ec4286e31331@oss.qualcomm.com>
 <5348ff47-910b-4614-a935-6e99ad3b066d@riscstar.com>
 <uavzur74w3w6d4acq4keoi42pcob4p3jez7e5p2aubw27k5geo@ccaewywqbz3b>
 <elrj4hfxzrtn2hfldhvk4ychlbmxcrksmttg45a6nw2h3gulso@4nk3lrgo5rvu>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <elrj4hfxzrtn2hfldhvk4ychlbmxcrksmttg45a6nw2h3gulso@4nk3lrgo5rvu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/26 8:38 AM, Manivannan Sadhasivam wrote:
>>> If so I think the DT binding could explain and possibly enforce
>>> that, but I won't insist on that...
>>>
>> It is being enforced in Patch 1.
>>
> Sorry, the current enforcement is only for PHY related properties like Tx
> Amplitude, DFE and N_FTS. I didn't limit ASPM properties in function 1 though.
> Doesn't seem to be strictly needed as no one would configure per-function ASPM
> settings in DT (mostly unlikely).

I think it's fine.  You enforce what's needed at run time
regardless, right?

					-Alex
