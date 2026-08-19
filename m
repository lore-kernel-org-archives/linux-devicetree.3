Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F81C3A759D
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149382; cv=none; b=QJAAERI/wMoe0/qU7MCyyXh1fXSC+te+K9ZHIak3P7gsTTqNP6WKmsMX3Vdmwco88ZQeI5pCAE5Ki1okAx956kaKqRyLcHg24MSq6YovYWWz85uTH6JCs8nyU7ewAsw4FrvMbkvEJW9Y1muBdXjAMbOXjCjepTA1a+hQuyB3/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149382; c=relaxed/simple;
	bh=zSJ3qe6MfqwTDB5Ny+9r3dtGb/8CyXgUlrO6FMHp+Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QC76CsUB5mxxQN1ZFQHEjNWE26Wfxxm6aV29Qk4WKdc7HQuov/upBwZdZHEvPJYWYvItLjytD5xhQDGYLD+Ivgtk1hJyLjmBIwM7BPXlqL6s7u93mU5p7HKBKji91OFHw+LQlTRGTIWtLeahqEG4rx1Nko2+DRq+mpSFMzKU+gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=disA0tUR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="disA0tUR"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso139628466b.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1787149378; x=1787754178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hHVz4sDUf9h8i4EPmkVnkkj+IR1W+HagsJirTGs4yA=;
        b=disA0tUR6gBPLa0NpvCieCmQCHjXFZpXCO9ufInlfNDRj83hwX6VfQRBndG/NAP/pe
         kxy9RcFlnpJq0zMCZpssQQrYQ2WzmtMgn5Y3SNy1TfvmPSwF96E8G6VumakplAmLi+12
         5OwTw39nCMG7u4o6OQONSSy3gWF2lGBVqDr2o5YcgFmnqgK8QLSnYORMSS6pRwD2qFW5
         crD9oBb3Kt024QlREZclezucdx34G4nrCHQ4VABZfP3Fgh4EdJocWwHlS0pbR82wpsQX
         nlOWulteLRzRjvYtDZotWc6PpOHuzzk91eDXZn9t4LclQCEtTsKGZMir8Q8steWbt85R
         s5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787149378; x=1787754178;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hHVz4sDUf9h8i4EPmkVnkkj+IR1W+HagsJirTGs4yA=;
        b=jbo2CqhwFLfqERf7uaijyiurBsH64wXGCB8bYv54WPvs7pJEe4NgJzL4h2VrTSH15T
         v5r73cEvCOJv2gJ3VZfGXQTI47PUsznqt7UpEwmu4lAi4yYth1Ig3p/IOiFkEqAbjIEh
         baMBJ+vsm1Au9nZzEFYtvaolmfMXSHHt49AaOdT1fg2IFU433jvxN1kEm8f67r0Yq9RE
         UyCzVYf7dKIQEiunH8klU3tc4juF6xa3SwKs42TaHprnEP1ZebGqPChmplsWMm2p0ml8
         JS0kYK4OLnsOzPVHs7y1GkGxNIkgXZqrCNnIynIZlFR1nub9PqgGKI6nuiR0qlS53kCG
         l3tQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdyF+3tgbilZ885Pl/IYYbWw3om1QJd/2YL9ZQcrK1KTf3GMR+1SYHvCJH73vN1JRuGGAaTctvtejy@vger.kernel.org
X-Gm-Message-State: AOJu0Yza2Qipte2QQdeMHtOOkZra7A2mDg+GIZLL3xcUWQDz46zKKj1q
	e6ry5Lz9bRuF6hJYaEnjY08kDvn1uzVh95W0DK3x0LqAlBqDSbwUz1tReQQn+SteaW0=
X-Gm-Gg: AR+sD10zuh8QZFbPoWJWvoYRJmt9TAT2IRs+PQXdq5UTQ0y6F4/Zx6bqqMcqskBaCU4
	jqWpTDf//Dfa7f20NxTq2+Fqs7VniPOm07NPA3+58/FEtkd0LQX17O7VVCv43q8WQdvJMtEkjCj
	iFb7yYRtFQ9QZo6W2gClZIVU3oKGzNDv3s9GKEhqfAP8rE7lQyMEDTzqnJdgFkp8oFc9BdEcs5L
	t7zjaHApIhlWT2dtbG2s6RLb5B0KSBRq1qo5O/TVfjhhsZ1vfjeyZMHYO2oS/VH+H9VEXx98fxo
	D4cpJbBFWASuNqAZAZ1urKcLevW7TDDiP2PJZkfeJwceTAanb+j6AgvUsE9ucBbShcRo7yytACB
	MQLQ+AD8jqTGXl0ff0LIF8u2BcYc0JdgkrckJizCo4W07qE3anY1b6XpJWoEc1o/jOJ77E8xjdj
	cQPMqmzqrreTRsT98LiHNw3MEosoL/cgfizCuTLXCnCGdSO6NMTodLfRfSyCuK
X-Received: by 2002:a17:907:c709:b0:c20:2165:d74f with SMTP id a640c23a62f3a-c242e3b5bb0mr335229966b.22.1787149378491;
        Wed, 19 Aug 2026 07:22:58 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7d7c42sm87398266b.6.2026.08.19.07.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:22:57 -0700 (PDT)
Message-ID: <abeaacbc-95eb-4465-85ef-4d88095138b4@riscstar.com>
Date: Wed, 19 Aug 2026 09:22:54 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] PCI: of: make a flags argument optional
To: Herve Codina <herve.codina@bootlin.com>
Cc: bhelgaas@google.com, robh@kernel.org, daniel@riscstar.com,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812172247.276554-1-elder@riscstar.com>
 <20260812172247.276554-4-elder@riscstar.com>
 <20260819122247.6ccfc7ff@bootlin.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260819122247.6ccfc7ff@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/19/26 5:22 AM, Herve Codina wrote:
> Hi Alex,
> 
> On Wed, 12 Aug 2026 12:22:46 -0500
> Alex Elder <elder@riscstar.com> wrote:
> 
>> The address of a u32 object is passed to of_pci_get_addr_flags() so
>> it can be filled with the computed flags value.
>>
>> Allow a null pointer to be passed, so that the validity of the
>> resource's flags can be checked without filling in the flags value.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/pci/of_property.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
> 
> Ok but nothing in the series call of_pci_get_addr_flags() with a NULL flags
> argument.

You're right.  This is needed for the dynamic range update series.
   https://lore.kernel.org/lkml/20260813220717.1394644-1-elder@riscstar.com/

I'll move it out of this series and into that one.

					-Alex

> 
> Is this modification really needed in this series?
> 
> Best regards
> Hervé
> 

