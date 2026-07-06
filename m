Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC93305680
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344949; cv=none; b=lUI/yIBilYX05wCv91wTXKP1v2RMS3NPj4cqzQPyYEIGC206AAPuGmaZp8LiOQ1ehRPiXaRPjorOguCWbhSqYsz8/zVFCgO9UxSS098GcXZdcDuZRWk3flgEQ6T1bcpeZ6kIgPaXFi2bCalGZNmCh4Rn6DHyf93x3S8Rfbt/aT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344949; c=relaxed/simple;
	bh=eG2g92HpxADpaewQr6kuNzXlZQd2Ti0PWMpSl/JUR74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DmQKCatJyXQeEkfnsb+xTMMw66OEDIaiQiNQTS0b/FfFcSW6BYpFl3LHFm2Bn/boZ+bqEPu3uquEb2Ka56BW620I/ZUonwFDN9YgjNMkYIaEOw6pb4YV+/F0mcCnWlA7GCr7MxYsFsjfPw6Lk+BMdji3YpfKxNCC9Uo8q7gb27s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IjJ2P69/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IjG0q4CK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IjJ2P69/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IjG0q4CK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783344946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N3Anvk5g2W6Ax5Xx12MjDPwqLCiF744jyWfZgTib1bI=;
	b=IjJ2P69/FIFJydspYwVu41W+OrB/Tb4CUt1kxQrGGexoV5bZSY1VDuG/tca5aoF3/Zw4fa
	8vH1D5wCB1asnkke2wXwJ32/JfiXYdx4hdWlORovL2o9u+sd6V8U2KFz4+lGB7jZuIcZLa
	WqM2Vy3hbYtfYda+w+klw8obbMPUUsE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-iW70T4bnNqSSOOzJYtPTFA-1; Mon, 06 Jul 2026 09:35:45 -0400
X-MC-Unique: iW70T4bnNqSSOOzJYtPTFA-1
X-Mimecast-MFC-AGG-ID: iW70T4bnNqSSOOzJYtPTFA_1783344943
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso24503655e9.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783344943; x=1783949743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3Anvk5g2W6Ax5Xx12MjDPwqLCiF744jyWfZgTib1bI=;
        b=IjG0q4CKDj3qDuprZ0mYTPoN+ct+9sM3qKcK/J05gYszA82WP8wnfKchxl6dOoc6Ut
         s3enpdOI2sUi1+OwLNfipcNqrQF/RslgK5Mz7vG6WZwWGp8bRScTUm59Z7pM6t/jBuq3
         cvd4DfEcT4Tf3pXsUy8RBan81eNgH7EPiUpvP2iRlqi/zw7ZmSGTxLMFD0L/SqGMETZT
         E+ZqCpDtPqY8V04BHoa0qXDC99p+AxerMVm7vo1l94cix85shuwmEBv2DVzUrwV45XZ6
         ljIrYVYNor5Kh22JPY+NSBfp5JQ6n4e1mKndSHB/exCr6NnFJub6jU7qop9oHeW7cw+U
         BFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344943; x=1783949743;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3Anvk5g2W6Ax5Xx12MjDPwqLCiF744jyWfZgTib1bI=;
        b=mwc3QrZnWCGwl+72B3uOV7oT+ADwO8x11215D9UKXcoVfZRGQprNuqSTfRektnfAmn
         Oy6lsMgxVDgQuiHqlT5ARmGuigKDR2BUCcPT5ZAS88pECqc7TNAe7wsw1BhcVc43Ybe+
         2yvtqnqTBES2cmi2K8GNEsiSMe5h647GGHmJug4jdxAeVy5JvTwgkl79F7kpbFlOLzbS
         JDPSFAAlRg2ovdaAt3IPhRuaGNP51/HB3lIq/fcujUHg55XCILadOImN1VLmtVz0Il7i
         cXHoVBeqNb/t3NNNGX6+AVp9Kl6dki5+kbZ+2xp+HNiv0vtdj7voQ1WElk9+0x8uOgKE
         eY3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpgnLWcY0jNbEbP3YhCzTiJaXw8VfC0QmWqL/MeVsQ8lEwgSvk99URuNVvdx01bpFKPolwMa2oDBh+E@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27pG7gWMViTJSsNE92/BH7JZjYjzOpiIRABKSvKdx21RTHaWT
	cbg3J4ZO/E79p3QiOqLa6PIIvaChxtYVDbFkd4OnCai/LdARgEv6rD1ScxuqpEKpKgOBuCbl2Nl
	w/5h2suaxCSCwCeqf8uXPrN2LyHOmudI0nWR5oTEFzEqZ1Dvo8Jhkn6wB4Ww53Qw=
X-Gm-Gg: AfdE7cn7GuBTt4DLlyjxEKo2CYaP5cXF2pSzaQAh97zvlEF0JTkWiDhdtqY/Fxn5Tpv
	WS66Qsst69u1ETWcjdB6Ao82u4N4wcndFDiItd0UzYDEZeYTiYFChuyGWySKLd45nkPryDG2vHw
	8ZBgrivC1rD6JogligoQFhsfIvYTxPtcRny6SRlqPlVT1SjashYmxc1zSupja53CM3SKwJ/T66k
	b5dQyS+uJyS0q5jUJkGpO9touAT8xc/KWSMJl9nQhhI4TK4t+DlSeNEFOlvGMJvY/fa5ZEDVgSY
	EYRyMVibpoO4QxM1q9sC4+OBNBnxtXAM57m7/iZEGl5GUHCnqXSrOoMbe5aG4nrw4Y1swo1Y0TK
	ZOWAfiDdm1jSteaEuwW6olxYJcDLwdKMsyyps0RTzeQLTADdLJWkXcxWafmfTvzxxk3IoV3hleE
	MyF3OczX2532nQ
X-Received: by 2002:a05:600c:4f87:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-493df17fcb9mr3435205e9.6.1783344943154;
        Mon, 06 Jul 2026 06:35:43 -0700 (PDT)
X-Received: by 2002:a05:600c:4f87:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-493df17fcb9mr3434775e9.6.1783344942712;
        Mon, 06 Jul 2026 06:35:42 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce11497sm308056635e9.12.2026.07.06.06.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:35:42 -0700 (PDT)
Message-ID: <41d0e6d6-f1fc-425e-a122-b0433a925a3d@redhat.com>
Date: Mon, 6 Jul 2026 15:35:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
To: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org, Min Lin <linmin@eswincomputing.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
 <20260701063512.9ED051F000E9@smtp.kernel.org>
 <5de09a24.a11e.19f2207d7d2.Coremail.lizhi2@eswincomputing.com>
 <58532b95-bb74-4d87-acae-e67b41dd7d57@lunn.ch>
 <f21ffca.a15e.19f25abaea6.Coremail.lizhi2@eswincomputing.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <f21ffca.a15e.19f25abaea6.Coremail.lizhi2@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/3/26 3:50 AM, 李志 wrote:
>> -----Original Messages-----
>> From: "Andrew Lunn" <andrew@lunn.ch>
>> Send time:Thursday, 02/07/2026 21:22:34
>> To: 李志 <lizhi2@eswincomputing.com>
>> Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, "Min Lin" <linmin@eswincomputing.com>
>> Subject: Re: Re: [PATCH net-next v9 6/6] riscv: dts: eswin: eic7700-hifive-premier-p550: enable Ethernet controller
>>
>>> Hi Andrew,
>>>
>>> One question before I prepare the next revision.
>>>
>>> As discussed previously, the DTS patch was included only to provide the overall
>>> Ethernet design context during the review of the binding and driver patches:
>>>
>>> https://lore.kernel.org/lkml/64bf6b40-b947-4ffa-8d48-4d6341931327@lunn.ch/
>>>
>>> For the next revision, would it be acceptable to drop the DTS patch from this
>>> series and post only the binding and driver patches? The complete DTS
>>> enablement is planned to be submitted later as a separate series after the
>>> binding and driver have been merged.
>>
>> What normally happens is that I give an Acked-by: or a Reviewed-by:
>> for the DT patch, and you submit it for merging via the DT Maintainer.
>> Everything then meets up in linux-next.
>>
>> Why do you need to do this later? Why not now?
>>
> 
> There is an another seperate DT patch series
> [https://lore.kernel.org/all/20260615122016.1110206-1-pinkesh.vaghela@einfochips.com/]
> which is under review.
> It also introduces DT nodes for reset, clock, pinctrl, HSP power domain.
> 
> Therefore, our planned steps are as follows:
> 1. In the next net-next v10​ patch series, drop the DTS patches, and submit only
>    the bindings and driver.
> 2. Wait for Pinkesh’s DT patch series​ to be merged.
> 3. Once the HSPCRG patch series​
>    [https://lore.kernel.org/all/20260605060730.1605-1-dongxuyang@eswincomputing.com/]
>    is merged, submit a new DT patch series​ to extend ESWIN EIC7700 SoC support​
>    for all HSP modules—including USB, eMMC, SD, and Ethernet, since they are all
>    under the HSP bus node eventhough ethernet doese not depend on HSPCRG patch.

In v10 please include some actual description of the series, beyond the
changelog.

Thanks,

Paolo

