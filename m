Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87403E2759
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 22:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376026; cv=none; b=sWlhtIKHV9LG8h04ICWEpu8MSSoCa+ar4bohnBB2eBERP4slNSGpWLkAo0a7z5L8rsD4k5GkbL5nIP7x0JbCP6DI/bqVZi+0StNxidAineHSt1UvZPTTblvP/FbcpldvxlpMv3UciHu1+T2yBYjYTcUA4XttpcTCqKh2G3IhMFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376026; c=relaxed/simple;
	bh=m3kaKDuOinnzWNHwerx5pFFY+Eflp1o8yKhTqlHb8xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBQyeaVNBEWfFAxJxHmt/il0dFqEvQZ2U19Ad2foV22uWUo2q+s8Ukx0KPb1I3hmxMoaaFOlYmCMmUbZU3Cy+Z2vF5AphcdaSbg2sYeNCxWUWXF6Z0J+J3caAJnCJ6zDi53Y2dl5s4LWw51QCeLC9LkEwwNB4ozB1tOENRZzCnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leLpuzmy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leLpuzmy"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-475881b9a4bso3045634f8f.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783376023; x=1783980823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VUxjcvyG7o7DixEmYl5pZcfD8TvxQHqFhtXA36U/44=;
        b=leLpuzmy1MCQFfJQdZjSGo15S981y1FEu5PVYg8YXgkUIoQ/7LepkVujXJJoQEDxQ3
         kU/hB7Jt8HtgcK2tnysM6bJnBKPyeJGjGTLqtl+PTliQ9XruvHi/h45L58ISLcY2zwR5
         fOQ/DsVFFiuyTcVqC2zTT3kBu6GdXFayg0Em4vaPCUhgxUmg2FdjCwPR5WLbb+GU9MAe
         QPBzP8wNGQLhrCbkN40ju3KgLgD1Sh7uCkzYo7wF+59QVm7EbIqFA8MGJ89j3mrvx30W
         fUyjMyPhJ59Lov7ghR0dwlP+DfwtwKanbQDUdyY0DurTEa1dgHaxmRcnQEY3V4NHDZIY
         xCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783376023; x=1783980823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VUxjcvyG7o7DixEmYl5pZcfD8TvxQHqFhtXA36U/44=;
        b=H1Q5CBmrtZ/bSHypDZmfDYwBgnTsDR2A2NF5jdjlDraMmHE0se636dEay1MmTQgWm4
         5d4VX7We65xXA3f7hljJOIwpOHrKsBY795lV/UUu5pOkF95+l3usUYW85Q2vURYda4DA
         RW4VfMvPtrdaz5d+1r+Jt77SxqaUIJ2eQcujS2/vM/FSxyRP7lz1sSeyCCdZQ5pCPjJv
         ZTvi0pZQRS3pJLQorYMDlmbNG3Uz5zHQHy7j/VERTmdOl3u0ky4P62/AWwstGza0ajoa
         REev4/+Z6HEzuLUP9xNL3e5nA89k+eqhXF1hfgx4SJo+dJ85L4sZ01G6nBnV7Oe4cZ4Q
         QBcA==
X-Forwarded-Encrypted: i=1; AHgh+Rpu9/krPTtfNN9qVdiOgNZhpnlVDhA/c/Y+5PK2fCFnBgcluRQL6oFnRMPhatuORk6dtgDFfTUQI2TF@vger.kernel.org
X-Gm-Message-State: AOJu0YwfYodV/zKA2GjxSpnL5JGDcialozp0W689aBZYx4MkCZQunBDc
	T5LqY5PFeQgjF0jEul1ifxkEKm15+18PYB/PFPSo5eLUXyFghvx5oYE=
X-Gm-Gg: AfdE7cl6rej/5UMstqOUX5KSvkZCA+A51cKbZ8OYHUj+/dEFZ4H5VW5zC+Tvg8DNAms
	Ad+vacZA/SyhTTbZSORRwAMZER6xw5S5sZlw9SYoY5L9CN3/iaEGtKCWg1PyII4UdCqHYjOL+Px
	hZHYB7vFkujuwuLPUw86Y4aDz0UbTr7cHCj4qQNfuXb5PJLURGbF2G8ppqaWyInyXxKZ4sBFl0m
	c6If4EJkZxxhVwW9NdB1Jd1nRPayH1nEnfSNIQDdvWemEirPXU7fXxq/0+rzdg6lTgh3uc3C6KV
	CGrKBSnuxYxhACQHaBygoiEhwoOjjqLsEefuat0UZUYcCuUtSir1WdKf5v8s2Yyzqra2ZCe4pVJ
	oXNpAJePjn3NfM8g/a7pXyvo9A57MAIP/wQlfIn+30FZ05U4ycNpXZwKYy/7rEtFAMQCFYgJcWk
	fJSX1Twge+iuikxhbZaNFnP7toLCjwJpY3qa7g/niC3e1fok2k2CrhzfG/ewE6HhIKTgE0PQ==
X-Received: by 2002:a5d:45ce:0:b0:476:c622:d41f with SMTP id ffacd0b85a97d-47de66dd5e9mr1597139f8f.47.1783376022918;
        Mon, 06 Jul 2026 15:13:42 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039afacsm26722332f8f.19.2026.07.06.15.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 15:13:42 -0700 (PDT)
Message-ID: <ad91c7ec-83db-402b-bec3-3821dbc607f8@gmail.com>
Date: Tue, 7 Jul 2026 00:13:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
 <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
 <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
 <2a556ca0-d276-4c56-a44e-9d8b92a3af6b@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <2a556ca0-d276-4c56-a44e-9d8b92a3af6b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/6/26 11:56 PM, Akhil P Oommen wrote:
> On 7/6/2026 4:37 PM, Anna Maniscalco wrote:
>> On 7/6/26 10:44 AM, Konrad Dybcio wrote:
>>> On 7/5/26 9:13 PM, Anna Maniscalco wrote:
>>>> Program all the register needed to start up LPAC and send initialization
>>>> sequence.
>>>>
>>>> Additionally, now that the LPAC ring is live, make the code aware of it.
>>>>
>>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>>> ---
>>> I believe some/all of these writes need to be guarded by if (has_lpac),
>>> as many GPUs lack these registers and there may be side effects on
>>> others
>> That's correct yeah. I'm not sure what has_lpac should be though.
>>
>> Something we add to catalog? Or checking if it is a gen that has LPAC?
> We can introduce a new QUIRK (ADRENO_QUIRK_LPAC?).
>
>>>
>>> [...]
>>>
>>>>            a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>>>> -                              sizeof(u32) * gpu->nr_rings,
>>>> +                              sizeof(u32) * (gpu->nr_rings + !!gpu-
>>>>> lpac_rb),
>>> Should we rename nr_rings to something like nr_XXX_rings
>>> where XXX is some uarch-generic (i.e. not SQE because we also
>>> support pre-a6xx) name for the main number cruncher?
>> Qualcom calls it GC so nr_gc_rings perhaps?
> How about nr_gfx_rings as those rings can handle graphics workload?
That could be more intuitive yeah
>
> -Akhil.
>
>>> Konrad
>>
>> Best regards,


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

