Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8223876CC
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260191; cv=none; b=tZl77oI9wDZQ5hBTxwJZkR0jsXJHPnyTU+NjkrYiHyIM/wgpxjHbgOVsnspUfZR1pQaSuAUwO/LjT1umYTqQxqxLGAZGCCjKfvyHcRV/HXzWnm6sJET08rD0Hw5pMOntofWY64CcKcyq7DqRvE0e5UXkUAxkpHrDeWGMcOPXZlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260191; c=relaxed/simple;
	bh=QwzCyOX78nD7ncp0SN9zqj820SaB2ohZP28QrqdWwGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEnQMNVodVvw+OWI3c3FEtXqaRMGWWuvDyL3AIUJHGHAy41gjdTgly+vwQ11yT9MN7dYM6O7JqDKsrVsXsC6P4dtEy83KP3ZthOoAtO9ssr21ARV3CMoBz0UlRdQMorAh9t5VJCjFwEMArrMdqnqk2zQXDN2lBobsI4jf3H/c84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSPC5el0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpNnKx2z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSPC5el0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpNnKx2z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7toia3468102
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3oIoe2eVDq2jNI1U3Bss+xvTEm8vrTdWjM3zGINO/NI=; b=CSPC5el0C126Hs1i
	TRy8gWlYI5Sg4G+y0kYhGbWYt3PK7vWO+1v2XYePJuavtVJF3ASWktjoX7kOJoX6
	QBP4/vif6w7vwO5+KXrp+42Z1PgBQStgJdIIm2v7gABM+jUbnQQIG+epMcfr6eYw
	xT2D0MWmbIttpcjgfMlX/uVgUEXziv0MvpQfR9wnSu2ZnvZNuAzMsYp4eqlFhRuH
	K78aEYODmyfZSPhJjMHV0bRo9AryOg1c7/BuXBoWQC3jVbPOE87PiT/f77m75+/r
	ScNGpWTeBgOL7x1sRAZ7kRFsRPGBzJDS2KWYPhe+AElSNwijtd5dZeTnLJZE46+T
	8uGHNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jggfaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:03:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4bd8e77dso16588611cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774260188; x=1774864988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3oIoe2eVDq2jNI1U3Bss+xvTEm8vrTdWjM3zGINO/NI=;
        b=CpNnKx2zMkE2X2/KT6hqZ6ZnZPP4Z6yEmA5TaIbbBurXDes4SZ5rNXkyrTqc+4TlVb
         W+Kpkl09g9FY2X7wvOF7zadCZq1ySvjqF9qNPs3BOoAhDPAujSqaOJ7klAhpR866MEmw
         LBNjiAvZrZ3WiuEVajRq6EnPE/vwGqB1Z8U8y8Yl8yHzQxBkE17JF8dqqwIo2aRkNrkr
         /UgtNxqggumsiXaTiWl+WerGA2Fl3/Wgm8XjP9nvy/oktajWp8DYRmroXV9C1Lthj8JF
         YA+trjdENpyuieAhJZ3zL/RN2bVC97u5A3Ohlwg8STuvWITt1dOoGncQf/r3yThNuTkX
         /gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260188; x=1774864988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oIoe2eVDq2jNI1U3Bss+xvTEm8vrTdWjM3zGINO/NI=;
        b=UKVBQZoyO/jAyh+VMPlW9tNO4nCYMOVvYRb9z8UMYETFVwdwji8gSg8nehRDIbPxsn
         uSePAiSxdtho4wcyFxCFFBlvKsKR5iZnRzMyxEiBrdybaVYCiAZg3i0HaeGawWG3WnFx
         NSfoIZoWLPTqLPKYfINJ+maMXTbZbw0vUQofywbQ+BAwrrQc6Lh4g2nXXcvL2+qKHI2L
         JIcxghLWbi+BVZdTG8IQghjQATWfFgxN3q7kAmBTDFgjJ9Ao+YmZeSMzsMquqS1r0/m/
         RXLJICMe2KQsdMsBbbXi3bOx5zVtZc4RqQZlUDLps5G4XqM+9leYil9J9bYSeSfGBUPg
         Cxlw==
X-Forwarded-Encrypted: i=1; AJvYcCWAv2cpzX4H/UOSVT13UWRov99xj2ksMye8CVBe2j3/VwQJSTuyePCoGC7qT2d8kmdbNfmi6TWQ3ph9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj6kJp3emJOlNlkDCG4Qek+QapJzw+uAW+GDLOU1ilDKcO/KrU
	xTD3P5gQn0j9umMctg1+ph08bzKCo7g4n8VYPVCos9Knur5sVaZlKB+7nY/ycGkiZ4Mac7eqO9X
	zYKcEpwOx4n6GEl98HrrU5RQwA4W+9WqlJGFIwBowPUQ42YdAmMiUA0pvdg1a4Xsw
X-Gm-Gg: ATEYQzy8+7g1UlxPPwPiy7GI5IVO8lr8mwynFzZzaH76+CHs7Mm4oDxT6PgLQsEx24s
	meABHyuItB99vIWvDABO2YQCWJQoNX2/g/ytF1CWlftTGFEY6gAaatmx5oLcnS3cugf/nkrZe6o
	rdNi0Vra6cDNhFXqXaifNrcsj1UqH0/y1NyPZOyhjP+Ko7OwVhNzFPnHKAFn9/2Osyr2xO0z+YI
	vQegUf4rHTZqSVkIDD4AqWDEWWGPQLqcN55UWSR9LkfBZCcNSHtIz1TNquDSLK6kz+QmUja/1Y0
	u6SShtfdS9A2dLOpNGbmwnoHyGAYpnH3yvkztIV+O/Jvsa6BzGi7abvRuZsHihSkatd3ECPlDHQ
	6zOxoDki3KqVLHJemrzDC3sIu2mMTRLLomEeaanIhKMyDxoLzZnzPol5hTKsSPqE6mEWE9bI4me
	+OWmo=
X-Received: by 2002:a05:622a:5c8d:b0:509:e68:22cb with SMTP id d75a77b69052e-50b374b1751mr136051621cf.5.1774260188595;
        Mon, 23 Mar 2026 03:03:08 -0700 (PDT)
X-Received: by 2002:a05:622a:5c8d:b0:509:e68:22cb with SMTP id d75a77b69052e-50b374b1751mr136051391cf.5.1774260188185;
        Mon, 23 Mar 2026 03:03:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f42c8fsm467071766b.9.2026.03.23.03.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:03:07 -0700 (PDT)
Message-ID: <37580c69-6175-4f0e-9601-5e69bc07bbc9@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:03:05 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com>
 <c464d106-8e7b-41a5-b76c-ed5e7a82fb37@oss.qualcomm.com>
 <CALHNRZ-AC+0+JdjvvQLREE-nXAzV+kJc_9GMNjVs=tT8GxKBzQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ-AC+0+JdjvvQLREE-nXAzV+kJc_9GMNjVs=tT8GxKBzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: m49DDHoZFEAj2r9pGUeoZNzUr0P_bPAy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX6KT57ka4qbgV
 j13UPg2M0U3hqqYj6I8YiDSgDtr/1TMaDSleyn30d98EVMc+1Juef6UhM796JlrGrQJvPTsP6wn
 eaC30n8/m2Vp2XBUuoS6eO9RWYwG6ZkvKgaSyqK7YOIt4yjVFpQX7SI99JXwCvuadgsVtpxOoTj
 W9lFJ8zwtOhS2lmVWVq6MPWCKKMp+cZB4in8Id0VTw3CFPfJ6VZ9B3scKS1DF/qqvDobxkhdNf5
 Uf1Bv/q99tS5IFARfCZggXzvGaJTYobIWeNmWZeOpJBrvN9/KG8xYnWrGigCoNYK9B0bKLMRO7Y
 m5MwPpsG+vHY4geB79dbLx2RFg9YLlqA3EQ4XMvCX8aMwRi6PPzV6VHsPbqq7v3LdGmkmEs10yJ
 M18vn2UZ9Os0kMp6Oja59WQHVLtdfFQrRtB0LqbGOKYqbHwQZjAqe2msUndXpaK+kpzhl0c9zg5
 Lgqdt/6QnNXrp0fKWtw==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c10fdd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=OkuuJbLxH5YwaLbutXsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: m49DDHoZFEAj2r9pGUeoZNzUr0P_bPAy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076

On 3/19/26 7:39 PM, Aaron Kling wrote:
> On Thu, Mar 19, 2026 at 6:40 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/11/26 6:44 PM, Aaron Kling via B4 Relay wrote:
>>> From: Teguh Sobirin <teguh@sobir.in>
>>>
>>> This adds a base dtb of everything common between the AYN QCS8550
>>> devices. It is intended to be extended by device specific overlays.
>>>
>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---

[...]

>>> +     qcom,dll-config = <0x0007442c>;
>>
>> Is that changed in your downstream tree?
> 
> I honestly don't know. This existed in the mainline port dtsi mirrored
> by the vendor and I picked it up as-is. I grepped the downstream
> source release and I don't see anything named 'dll-config' in the
> sm8550 dt at all, only in older soc's brought in by the kernel fork. I
> know the fork I based on was chasing the issues with high speed sd
> cards that seem to have been recently fixed upstream. Maybe this was
> part of that. I can drop it given no one knows why it's here.

FWIW downstream has this data under the qcom,dll-hsr-list property

Konrad
