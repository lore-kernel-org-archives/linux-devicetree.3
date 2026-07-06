Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CEA3F54B1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336188; cv=none; b=pQnuYWvfIuRi1cM96HoJlZFVq2OApRTDM1WeFH1ukLeSHptrrknZSjijOF+m81hAW1llAvFkUdS/uWimarw5YPaIjM1sMXW0rMouCEqXgQrC77zN6TRZ+uPmreQqDlFoqAxxeq1t1V3zgje3txKaQnIAOpRkOjEOocZjw1jC4Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336188; c=relaxed/simple;
	bh=hUL4WYPSAJ761APDkAIw4UQvLSCj4JJeRyBGiBBra/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5nH7L3dYYMmZ1uYu9Ar8CrYaubB0tm2cjQcuu+V26HfJgHP5CRmo/SU0EaCVThu/2wnlXy5R7zIiS8SqCkQh8Gonzo76rV9d9nMT8eytN6Zt8uwVlwR4aB9m8moVobSO5lP/FeHOBAaeDkm1CH+CM3azWC+XCLRN78d1tPY8Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pX48h7Ta; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fl7VacTT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pX48h7Ta";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fl7VacTT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOhe218524
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 11:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OfCbzrTcTzIGJaYxsh7AivF35GEsErrQAAwwonLRtdM=; b=pX48h7Tawms+LHRc
	QZc63peXyBM/dHemiteAjFnn/Dm2atMcCHHtHjAIGSpEwCzEX76VoWqNvieJ7rMj
	jhuLKOBhmpaOeHAlo947z/JyekqWGxbqJGELhYB7aQA33Ur3W4V81uTtJuQt6aUe
	/MxPQB6y04jxto9wPJ01Rgrks3cr9GydohIvzflZsmnyRbMnQw7jtzRkiFDuO2i0
	o4XEylXqicGHOBXUX7bspiKuK0uPsI9/0CDU3rDpVvoFSZJx8iBq2eX0+T5ex/dL
	cDQSYLJvAwrDYvPQOzv+bINABbftfw0HftfrJn7TStgNXU9IsFNkO1wHHqQxsbyO
	gqyJ+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs8rf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:09:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so21574531cf.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336185; x=1783940985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OfCbzrTcTzIGJaYxsh7AivF35GEsErrQAAwwonLRtdM=;
        b=fl7VacTTgegxSKGd+ey3esFCoakpCsR9HylmaGOJN1TTiLePhS+iATU8lL8osA2N9u
         7/NfWVW812flgUn8dL0qnEksm+S92DDVkdr3KvE4A6xcEg8RPEhIJRB5Bpi3LYy9EeQ1
         uQP9zuB/JK3AW4/t1ig0xgDUtC9SxgDJMpmr79sJ7zBA3vI9YtRu9tuHw4ncbK7dmOYw
         iZBpYWZnU7/HCenG/HMXZaVKlW+H3ObXr65PDtqKxtD3IeeVSEgSxPvrfM09AeHZEDSE
         1G0DsuA+Mg/Ox/OG9Irv53kYL2Ff+M3OFjFKC+7aYUOD7G26Xi8DmdelpzpdlGK0fZ3g
         vNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336185; x=1783940985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfCbzrTcTzIGJaYxsh7AivF35GEsErrQAAwwonLRtdM=;
        b=MtyWkRLuLaY97AbafEwmzxMS3wkiAzeAEmxdQnvFuHeqemqQ5Tu5D0YnqnwbtRgJ6j
         vmyV/mvVXT8b0+nFmgiBTreJ3wpB6ywIXZsZVSryz6ANWJYa/NzHzdnPzEI8SLK0jzs6
         Vzk3MgdQfIviUFc08E0Wio25a3z2CTRgwyEfYT6ngmwpAadC3lgUVgREnBCmqG2+d06U
         usCmLpzCytLa7/KQBYo2CqNC+on50A7MRgqh604w04cvRl0dtL6ngrBX8qf8K9thmSLR
         7MDOnM/SrUPstpczhOv13KFpj+mLcbQ/9pjdYms1GbRds83SnKlOiAcbXe+O277cfMiu
         Hm4g==
X-Forwarded-Encrypted: i=1; AHgh+RoNkECi9oVkWaCt+rcQg3afaRczsoJcrrHVyJZk653HKG8pWe2bRkE3c+DXbGhONXFxsqlUx59vXr6U@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/xRUCx4QImE6XM7XDAx8Nmof9ofic59v89IxForCFML/Cjf2Z
	W0/G66FIOwtWFk+cU3SkncHmBORloAP7qMNzVgmIJFNtGtuUbWKH11pEpHjn8AFLob4LNbJNdxb
	OCxfsByBVr5aiA9xBeNlSD3zJVLjZKb5aplmEz7apNfufFuukCmFKTMLOHFe1pFmv
X-Gm-Gg: AfdE7clsdto3HlR6i+45o7ynxR2zj9Bbr+JqwSeLvfwAX8TqHfZ0GlWD5HerrqeWBy6
	vbh0ohc5i6ht0JI88xPnq8ulsRLtng9bGHFzC41gDxpX7kSrzBILCzbmwzV6q2Q2byNABTcA2zl
	cKEpVGE92hsU+7XcJIwXZy9iUvZXIc6zabyvylynpvO0hDzj40fGmMYIiwszNaz5/azKeVAz05S
	P3VVQZl/ro1vZ9TkcDvKzsUQzan87rcF3XNvD3WcqZhqNScaEQw8LlLQ+SVfT+e2sId4ly0ifXp
	o3nXnhCCjROZY1g3rzIx7ZUnFHtQxKgxCrfpPFvAws1Ui5iHCFdPa3hhIn5i5ryWZV51yy4tQfZ
	BTKvA2d4OIhTq73g8nRigBpxLri5JkgF07hM=
X-Received: by 2002:ac8:5d0a:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-51c4bdf1baamr92272891cf.5.1783336184806;
        Mon, 06 Jul 2026 04:09:44 -0700 (PDT)
X-Received: by 2002:ac8:5d0a:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-51c4bdf1baamr92272611cf.5.1783336184315;
        Mon, 06 Jul 2026 04:09:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4b52sm721233166b.47.2026.07.06.04.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:09:43 -0700 (PDT)
Message-ID: <13522517-8e40-436a-b6bd-5ed5f68f1da6@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:09:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
 <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
 <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GZ_-MoOA4pYTkCS1cls-ewJTvvdT230w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfXzH/UDxW+YYtF
 UVicSO3UJj75BXliTLtQKEOUVqcyyLp8EiXebhUis34gdUMCgi9F/FFgw8HRXgtODUo2U8mYHAI
 UGhnW3lVAFZwtnwaBbVBI/OE5wEG7W/pdMrrJkC38lg8fEubr+J+GPLxaW3313A9/0pXVze+9o3
 p49vYWN0zP0paT2raCVn17cuC3nyAwQUczzqHLwcjij4EZWAUbdI7F26Nygndb9Wj+Lq3wW5Fy1
 Qtwus8sV2pWi9eNJFmqmhZBrvfMiT9QDUnKP/WeuIpu7UcODz8L6hBzHz4ks1aj3DcLpNyXi/v9
 tj9g8/CscUsbCrhYx2dyPoQT2SgHyEkJ8dip84TmWecKgg34oLxCyYWOFG+YIbyl+KXtMEWEmEV
 NbrJgMRI3OLsR+Vak4Sqn+/EkmZOfMkf2Y9+q/yodHj1g2wIpizr4bfS1ZWRihzD2lyaz3SSry5
 plv3fezIGMxRsM2TlQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX9Az4W3dq9scv
 6hTR4+2E2yPtkdWtyCQcoOZNHhKwToveFzEQhsctpsoFUQtad2OPWNC/69MoSdbHbz+Fhmf9tYu
 PIDcVL8BtmuN1VSnkBnsW48+EkxDKA0=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b8cf9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=mx_oZ8J27MAni7-wUjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: GZ_-MoOA4pYTkCS1cls-ewJTvvdT230w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060113

On 7/6/26 1:07 PM, Anna Maniscalco wrote:
> On 7/6/26 10:44 AM, Konrad Dybcio wrote:
>> On 7/5/26 9:13 PM, Anna Maniscalco wrote:
>>> Program all the register needed to start up LPAC and send initialization
>>> sequence.
>>>
>>> Additionally, now that the LPAC ring is live, make the code aware of it.
>>>
>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>> ---
>> I believe some/all of these writes need to be guarded by if (has_lpac),
>> as many GPUs lack these registers and there may be side effects on
>> others
> 
> That's correct yeah. I'm not sure what has_lpac should be though.
> 
> Something we add to catalog? Or checking if it is a gen that has LPAC?

'Generation' is very much an umbrella term that we can't put too
much trust in in the feature department, kgsl defines it in the
catalog, per-GPU. I think that's the right thing to do.

> 
>>
>>
>> [...]
>>
>>>           a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>>> -                              sizeof(u32) * gpu->nr_rings,
>>> +                              sizeof(u32) * (gpu->nr_rings + !!gpu->lpac_rb),
>> Should we rename nr_rings to something like nr_XXX_rings
>> where XXX is some uarch-generic (i.e. not SQE because we also
>> support pre-a6xx) name for the main number cruncher?
> Qualcom calls it GC so nr_gc_rings perhaps?

I'm not in the right part of Qualcomm to know, I'll let others comment

Konrad
