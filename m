Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C923491C9
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779247380; cv=none; b=b6MddCQjk54T/rOqX5ySeSgm7iQhooYrWKdrS33LIAEWWNfRxDpT/YTavewO44j93vjhpVcWPzXbGF9VJgN01KlE1y5SZgCWBwtF1Q5Q6JKDAfwM5EgKPOJ9Z9n0M6MxNxhhpyJW/PPSLkrS2oIKo9jzVQfY0Gt6Cidv+HfiJrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779247380; c=relaxed/simple;
	bh=X/BHziO5NsoZbofxUX7RJFDD4dHeLgWXoG4PM+cupwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP8ACPjkmLi8IGlUUPLHaE3cJQeG/g+Seur9aWTaXtkYRleCDQX070ZH9vDDm+/VeJE+mN9l1GNLTpAznj9f0Rt3mpP7jMmFRJTNPF5G3BrdrjrRAhXCqfiV40E8ppH/Tehez6YXZEWd87PlwJKAvaORGDljnFaDgA4helP9Ubc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZR17ZWNu; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZR17ZWNu"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8027e876fcso1861935a12.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779247379; x=1779852179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQXnq6ff2CcEgG0fR35KaANgASFhf1ZCAbN7UJVtGlk=;
        b=ZR17ZWNuUwB5ZtOelsvRUg3nujPG/FfLMBrp+fjxZBJeh0F83mAz9v/fy61P2tqBo1
         llFHCnh8rBI6kkUDzNEh2uw0NKY3hSdQPLQ+ncbhi5ogp7OiHBQjuzHi+c6pCloQNRQa
         f/u7rfM1ewsWZu/rFm37+mmt7H+JcpbWeIaDQAigQizMUfMTvGJC01E7VBdNlTEmLgki
         pjruurEGonhCCgTOt69SP/nlHV/yrppfZ+ykglSam3PIRbihDrC0Plz8jEKegLaH5sPJ
         eiLuUiRkkAVaFqh9QI5/qE1aH1sE6Tkyijk6akXpXg0EVVf6RHi7bhJvE85ufrHe7Lo2
         rYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779247379; x=1779852179;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQXnq6ff2CcEgG0fR35KaANgASFhf1ZCAbN7UJVtGlk=;
        b=FNWwRJCyMUd4PLJ/mOeUScLhQMGwyBXvVfN3y/i3sfXqbDUK0DTzU46JYzsP1opAcB
         TSTMD/ZcpkXieDJ7tJM1CIaadMdUHUWNXuSMT0WuFP3oWc2gjmyFAci4c3338dc/K6VY
         CUxHWuWLLdv6PcKilwEYfbrBqSoKLVm/7F2RNICC72ZSvM2kYjTuNHQwBeUUGC+Qo4aJ
         bXb1ib4A28RT1mNBbqrSd53lhGpgvk7Iq71s6R//Epwq4HRUmSPWWS51XaP9VOUetEei
         9vyAvkRaQRONNDetGqCsRhkANOEsJ6ahhGRySONcg3XrxrxLJc9xyWowAJYAbp/tKGeK
         M2EQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hgCnx15HjHYOM6xm/kWZjFpis++I7m7GZCSq3mYBY3ltEkNFnK58eZLdYY28GTTvICJYVaTiwsDvr@vger.kernel.org
X-Gm-Message-State: AOJu0YygdTGo7WXleDRLUiDiSU4bs3pIz/O836tgEccXh7C8bA+2MDrG
	wiuF8gq3uUf5Y7UiVgmtzlEvcpL6i6EZYmETfuZrp2P5gkGBWbYD6+G8
X-Gm-Gg: Acq92OFFIEHraqP2ZooM1jNSWi9RoYEvttekLQWO4P7+Mr9P9dqkwV/NaXra5ePTW5s
	3ubam+jwxQo8eKZz3Du1P2BC4+hgHDuLtuyiwPj9x/Qvm9H/j1jwc7PpJvnZc5kWivzHkaQLbGR
	Z1z9nOeBrXR1UxM3++jHlQLkwg1cBNJi6YAp99RTxfpm1611xGtQlbLyfW84cyzmx9Z7MgEiJ7D
	LymHk5jbme7zKTezv5NjoJJ9EbiqbIaVlg3YTxpcbyWdCzw1ydjKvgltVZdPVmdXZLVMtMr/w15
	lbi/U/9tv5FkdS48Q08xdjStNM1DQ+vG3iqgj7XdJgbgUO5fOrVn/zUYi2lBJtHz2vZR8fiBjbl
	Ys29mvvMp7Rra4kEuTyAvdm1Q4M1h4Gc3avIgg1ojxAt751aVnFMfNejfg8PQaNpasOog4H4p3g
	7FM4SbS60sWfiMPspB2e88caXHeG9GDdj41m3YfQSKdnDktjnao+irKRH7omO2jp8=
X-Received: by 2002:a17:902:d512:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2bd7e86c6a4mr251542375ad.5.1779247378893;
        Tue, 19 May 2026 20:22:58 -0700 (PDT)
Received: from [172.20.10.2] (114-137-66-169.emome-ip.hinet.net. [114.137.66.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600b4sm203376265ad.28.2026.05.19.20.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 20:22:58 -0700 (PDT)
Message-ID: <204dd64c-414e-6f6a-e992-c1fdb1b398ce@gmail.com>
Date: Wed, 20 May 2026 11:22:52 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kchsu0@nuvoton.com,
 sjlin0@nuvoton.com
References: <20260518024704.118613-1-YLCHANG2@nuvoton.com>
 <20260518024704.118613-2-YLCHANG2@nuvoton.com>
 <20260518-heavy-bear-of-camouflage-d7c89d@quoll>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <20260518-heavy-bear-of-camouflage-d7c89d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/18/26 20:02, Krzysztof Kozlowski wrote:
> On Mon, May 18, 2026 at 10:47:03AM +0800, Neo Chang wrote:
>> Add device tree bindings documentation for the Nuvoton NAU83G60
>> audio amplifier.
>>
>> Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
>> ---
>> Changes in v2:
>> - Dropped the word "driver" from the description.
>> - Removed runtime/software configuration properties:
>>    nuvoton,low-latency, nuvoton,anc-enable, nuvoton,aec-enable,
>>    nuvoton,vbat-microvolt, and nuvoton,tdm-channel-length.
>> - Added missing "nuvoton,dac-cur-enable" property for static speaker impedance matching.
>> - Removed unnecessary '|' formatting from single-line descriptions.
>> - Fixed typo in firmware-name property.
> You didn't really...
>
> git grep firmware-name
Sorry for the oversight. I missed it in the final v2 patch. I will fix 
it in v3.
>
> Best regards,
> Krzysztof
>
