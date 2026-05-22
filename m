Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361243438AD
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442796; cv=none; b=quMj+0JYfj6b4wx49QRv7wTtYlNxF/DtIoDTuEGnse/f7K4zme7Bi0yspocAZ3mtWhEErMbjV+XEarI4nzC63PFhhpxOjOFhzhHUU+n7jZp51+X8Kr0TyZ1UPNYFYo2AxTGgOt46E87OMBwyfeoj3q72kcykIFOZ1mC5m9bAhmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442796; c=relaxed/simple;
	bh=F9srFZLSCu9PEJgkT+xS2k/d54cF8oIvYewLub3AXaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dIViC+pHd3b8Nc4wMPXpgZqaigveAs3Ezsq3Pi55RhTHFialDuugkvA5q4zOl5LUWml0pkMZy2ssFsEO0hNFam/BLGGV5AeP9Z1ZRG4xKrSRiboiLEwLxCWMuWgX8QT3iyxg5ioFOaBnckPhf/cJplAMWhA6gZHRl+4HV2LcaZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puFzssaY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZuhZbJFj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puFzssaY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZuhZbJFj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8sCWa2765182
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZi6CGqyMwgYn7xlaB2Q8iqRILRAoRP37K/MNg/r1nQ=; b=puFzssaYuhrJx5xm
	QRJW2mO5np/Mon+Kw4DMB0vk73EnKszD2lceFKUYO10QUYo47PWn9o9iaA5a7e6d
	J4b3kTOHqaLep58dwF3o8rrLv/wycaPQMKEVOn39rVceq7L8UgeKDk1WOJcGw3cW
	PM4La5GiF0Pyx49F5rJZun+F4ll++r5FyjlCDLp6pdBqzD7ge6Ud3KFKbGR8Ncg8
	Ywh1jepAbN+/ZagiGRTmDgG4XfbIDuh59yjs107XBOzvQ4UAb3Xm4z1L52B+lQBl
	irBU5tgSNV2Tjdr/ujokIyQ6xyyV+cl4ublaLO74e2vUCDjjd+n8bT7TtXxV3WxG
	g/eDYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7vbtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:39:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516c9ec73dcso4030511cf.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442793; x=1780047593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZi6CGqyMwgYn7xlaB2Q8iqRILRAoRP37K/MNg/r1nQ=;
        b=ZuhZbJFjyzaBCS4w9RC+Y0PnjPABAXoLOHNOLQ8Mjit5f9z2/ZGiLg9GrWuAhPpq2w
         LRT8/gcCD2r+UQhUdXiD8HBjrcTYxVqzLrCNyp3lj0UBXp2fwHiFEGebCaiJVyNMKujY
         kvar6pUzZ3YzmQxN0cxKyIyP2VZp+OOud1XAFsjWiYlXmjODlNjCEJqw99u79bkEeDK0
         q8pXF8Ew6rQMsKX+nqBwj5db9NhMhFnuE6GSOCzAJZwOy9T9NruYiukERf1cO0TBPB/t
         U8aJGHdkVUv/ImxKOJJtA1wNtJIaYnPDXp1ra3tXMZkw+sVqls6Eqdv34jLRRAhpAGix
         xxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442793; x=1780047593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZi6CGqyMwgYn7xlaB2Q8iqRILRAoRP37K/MNg/r1nQ=;
        b=P/SFoVkf5RTvlkSV1/eAN0IYx8AUJtO3Tiftqx4DTcgOYKd2uQNM3W/9VzLLjMSwbx
         +8ikXLplGOr+PhoRnv1suLsty/elURu5X5NDQHaauwAEDo/CMQB8jscFGQ8s/8diPP24
         GBSxn/ULGGhuBqOPTu19WRkmWFlG1w+rnRW+6ftD2wQbdX+ySaSJL/UXafv61fEYY7N5
         fIwY4xy/vod8wejXaHzsRQB0KCe/HXFbALODzNjgwr/lVKeKQKE3Xx4CSQ5PqCi5QC71
         zbXSqTYFvYD8OmE/ERJMPREFyRUTuVHCifu+yYFyrxCR43WwrTkI2eqWapq8KkYVUqxN
         fhfA==
X-Forwarded-Encrypted: i=1; AFNElJ+rih96KR+NsLggkSJX/OhwmmNNHIsrD4wHOYa13/K7C3Fp9NGPJMyhCIOguJGi64vJja1dbkKDeAgR@vger.kernel.org
X-Gm-Message-State: AOJu0YyZh9liNV1dTpKYrAZRSFz6aTbhqvrzJ+uzi5Lq680gGOYyRIjL
	S4hC+kPV+e1cag9a2plsF1JNBGylohOvcqlpBB+45MSxMEu/QTvUmjhu+tBuwQ85ljU54UDNHb9
	0rfTs28uLouueJL9fGDDHkyEzr2l57GA2nI3ftJuYluMvdWFn9Y39bzJCc3s/d3BX
X-Gm-Gg: Acq92OF+HH7qFqRXB0fHLQJaNihC/MNNoOOetMyHapBfCQK/u6cA/4T0e04xmDPpqBY
	QjBNU6/hf5KE758+lQBOZkyT5pjehFHJOzQ+zpq7+1xjPlt4dKXhDVUSbJ2wsoFf8EnbJRTNl34
	3vagou6aXHktF4Cmh272XE3nDemzEzI6XFYvTJyp5JnJJuSmIzRYG+jC0SPENl7kj1hJyERRzbD
	G0subQuxTNOaFTB6Uc+MnaX9tgR3Tq6HnNAtV416VmsR9DYBl16VxA5LMco2h12lZknabBSudQb
	GWQN0NnrQhcUQE3UvPaTkzBm4zA/FLEy0W8gBoiApDEvoJTP4V8uF5jvd4No+wTFMEkMgbRRN3I
	5nGi+hF5BwckqsVqG/ryWdqufkuc3RNxemDpBgkQ+skc23A==
X-Received: by 2002:a05:622a:4a07:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-516d43cfdbemr29963351cf.6.1779442793302;
        Fri, 22 May 2026 02:39:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4a07:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-516d43cfdbemr29962971cf.6.1779442792837;
        Fri, 22 May 2026 02:39:52 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc66dfb2esm35573166b.59.2026.05.22.02.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:39:51 -0700 (PDT)
Message-ID: <191d66ef-7d36-41e0-b29f-1ddd47812b75@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:39:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
 <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
 <01b424f6-6617-442a-a77f-9b7a8472c447@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <01b424f6-6617-442a-a77f-9b7a8472c447@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a102469 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=ceajz_fLbYyYHEW_QOYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: UaI7sPgtqNWd9MJ5gpP9n1C5xmFpXktu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NSBTYWx0ZWRfX9Zv1pFIhAu0W
 zFxb/nYcB5fgsLlLcwd5y52UsS5NcKrkMANjzgu7lYyfw1PmNokVGjNns6aEyv5Ox/VX4jPo2kY
 AcBiWSpnNoXpMaejvgED7B32nrm7Aukp0LFUfK4Jep7m/Z/iUbCZUUbxhblxNsoLyytpyktKbpQ
 OsGI4FVLba4XQMXJV6MXkIxZu8sBUTNE+PTTKRju0U0M3keMPM/TMhBDNjNdQGjQqzmf8vBTbPd
 TeZg8DKi28X8aFcdtzkm09N99SPpFFfrTUBzwLiCmJYpGJzUUwAn+i9E30Mjl7ERWD+24B2EWJG
 UvQ1m4pLgp/AHgC0tPmThNq7NjBbb78nAwzCBRe+Rls/E6LJ2hW5YPvOx6W8yVQ1pkE4KVfPBrB
 ueZwmSnzyk3iJGGsqIg8tB8wzxFIi5at4Fo9fspGv4pUW3xAhiEgAhY8zHzc4pqJk5VV1/P3A8m
 sKEn8dYYcxGnfI2Sniw==
X-Proofpoint-ORIG-GUID: UaI7sPgtqNWd9MJ5gpP9n1C5xmFpXktu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220095

On 5/20/26 9:38 PM, Akhil P Oommen wrote:
> On 5/17/2026 11:54 PM, Dmitry Baryshkov wrote:
>> On Sat, May 16, 2026 at 03:52:08AM +0530, Akhil P Oommen wrote:
>>> On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
>>>> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
>>>> the A8x family.
>>>>
>>>> This series is marked as RFC because it depends on a few other in review
>>>> series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
>>>> support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
>>>>
>>>> Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
>>>> review and has been applied.
>>>>
>>>> [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
>>>> [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
>>>> [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
>>>> [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
>>>>
>>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>>
>>> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>
>>> For the rest of the patches that doesn't have my R-b tag in this series.
>>
>> Unfortunately patchwork doesn't capture tags from the responses to the
>> cover letter. I'd kindly ask to spam the list with individual r-b's.
>>
>>
> 
> There will be another rev to remove the RFC tag which will hopefully
> have my R-b tag. ;)

Do we have a resolution on whether the proposed fuse values
are OK for this platform?

Konrad
