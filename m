Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DC43B27E9
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644248; cv=none; b=sUFDFaPN64eucRhtN6Ya6G+U0oXJ3meeTNasDnKA+Eh8hV2ezYa+JKe9uB5gcH+qwQX4yyxrZxzQB1sbmSymcstAcD77F0CjsWMD6eSN+WM+4NdK/q4Jkb6m+wxXFnYiZU4dRcPHlsVbLc6wjOxAlOmBpMB/tHFPhqpFfm8boTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644248; c=relaxed/simple;
	bh=REMcgltEyMbcKiz6/Lve5nIYVDCo+a8ZwcCA2qtbFaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibxBLccRkZ3cuTo8BpcVDKsDrKod/P6ngrEJWdYA4L6geNHHmtcf8g0J0d5LptlIeNb8/qVt3McgASJZOnl2Z98S6c+cKmHiiXqTrIJkQUuKa4nfvBLhT6FTTQTMgt0pTYWJLcMisWpUjnB7LWnv/3eZ+RDkRvU2uEgYPXpxq8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LzKzpTOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBps4x7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzKzpTOc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBps4x7/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg1Q41912560
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NL98qTFmAvv1r1F2Eh7jOtgF1RGRUhxYo05XKeDXl4=; b=LzKzpTOcsGbZWDLJ
	P0dDZmOexr5ujbn4mZdjs3kkrkHLBge+vz4gEuXnyTjvGh3A2v/b8vxOuC+Uzgz3
	8vd2rS/y6EksZuPorDef35+DxeWuVYVFvNvKYn4Ystdhld13S8NaplcNNj2Wq3zF
	JZgTrRyzw11p9ooJuGpFmO9ivNwLEyeJAGnVsut6hQd/DjG3P5zH6n9dMwdYBmm9
	4S3VSWM8sIl1V+dHKdovLoYicgu7oLh2TzqKqzGGC2dYSTnFULc71b1a+klP53p6
	TCpgCMxxSN5c/389uX6OuH9S28/crEjqAQtw+cvWSM+RqJGG0Vs/aPldms2o/RwX
	bGrXlg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujv6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:30:45 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-43cd2d12617so14028666fac.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784644244; x=1785249044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NL98qTFmAvv1r1F2Eh7jOtgF1RGRUhxYo05XKeDXl4=;
        b=FBps4x7/o6fuKOXyIyOGtHtuOd/4z+ZHcLf8E3tsYjXELUya9pOWvYmHKcAsXaVbeM
         BCTR7FAOi4o2TetHHO2YcrZZ2kd1IIbvODArjPKyD3ft4JPUIgOCg9VxNfzZgT9ePGp7
         OuAtT3n6TQjLXzDcY5lBRK2n985ajOydrxjL74UGIvHvY+qDHiHreK84ES80X6Nw/kZ7
         A1NLD7LD2hnw3FMZqcwcjl8/QiyuBjyQQHk+oeFMCKsARtYmXXE8Y3FvOGaU8jJz4bo9
         +uz5l4IJgcBE55G+6kqiqms0Wiw559mkYCVd6B/u5sI6suCVKcc5EiU0hqHytybaFXwJ
         YKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644244; x=1785249044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NL98qTFmAvv1r1F2Eh7jOtgF1RGRUhxYo05XKeDXl4=;
        b=ADYAua1Z+CZdDSxGtAUVUhWUVwlETka1gpbJAGdYTowM/SJPO375G9bRQdQcbaRILM
         gcwp0Cww6osYcjpbKSQTdQjuZy2CDGAPPellPQVW/bLYPY5IioeMUdgdGz1CDLIKI+ZH
         7pMnB5DizZvBeGuDw4m0z5nVo8TY5Y5C87BUYNY07vEj4BYGTTdGOyXUN0WtM/KhBS5n
         DCW09+QDr/OfSdCJjxPJuTtw5zooDwvL48XYhEjyP+EYKY59ryzEtruj2npnk9eKnzdV
         V9Ksv9homumXLtxUTqFdDAHDRs1EzxrVtxXCEaSPo9sHR4MsZnVY1py0gF3fjdJBe6pj
         bfqA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/67mdgCYEjef932PFS5vsW1C3dxThzkoLqdtpFj+e01jYGcL6DKUxLOXmB8uVC3myQ5D+Itra2xcT@vger.kernel.org
X-Gm-Message-State: AOJu0YxPcm8EOWP5/Udcc2voncJRzdYdfKNrgpfIIwi5asOGAsXZk7Pt
	XFLiMp+b8nk8bjopsoYu4r+dgED2Mdnvldp8+BYlJVmYlFRL3Vqdq9+ZiEzos7YAt+S1K307/vY
	q9YdxxK74czF0Zj+kkiVuuzrEDzssdxhbGYaEm0eFl0LsvECbZwW2lkd/NmpHz0Sr
X-Gm-Gg: AfdE7cnfHtBkcw39f/5uqblWkkGKP/LgFmXT1di3QKgoU8k235sljJp9FLwWQ/1JMMb
	yGAu8LLZonQLDuA81/ODyZDmFDZsXRXpImSPbNhf8kursptVpKnTrjD8PuPiBobVN+Cmy/mNM19
	+pi/ZEw9mqeFPLOtrL1wS1dH0lQrpsZ96ssJLyFTWSbWU13CYbDksg1ifCxKWUhhkw+SPGNT/ux
	OuDlpElGKmtC6Inl+03hp+xxhJ5m1bSZT0obEmr4NaFPTsuekXKZu6Iz7J5ksaJT+ge2guBKEzW
	zsi3tuymRM5IjFoYICq9oU/PmxaFn0B1lkC+w/+7YykT6aXzcm410zxwqGqnpawtp8bCKuj/TJJ
	KKTE78DJSA9zYhmsxuB/YfiCk+86F869e/w==
X-Received: by 2002:a05:6820:f028:b0:6a3:e297:2f14 with SMTP id 006d021491bc7-6a5367e184emr9521070eaf.8.1784644244589;
        Tue, 21 Jul 2026 07:30:44 -0700 (PDT)
X-Received: by 2002:a05:6820:f028:b0:6a3:e297:2f14 with SMTP id 006d021491bc7-6a5367e184emr9521053eaf.8.1784644244182;
        Tue, 21 Jul 2026 07:30:44 -0700 (PDT)
Received: from [10.217.217.176] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a51a25c857sm10599003eaf.14.2026.07.21.07.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:30:43 -0700 (PDT)
Message-ID: <afb0862a-04d0-4171-887b-7f32ee64163f@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 20:00:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sachin <ssachin@qti.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-3-mchunara@oss.qualcomm.com>
 <20260708-purring-infallible-bullmastiff-8f6dea@quoll>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260708-purring-infallible-bullmastiff-8f6dea@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _iOVGhbnNZBmTjbCpl1SHecN7Ywok1wv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX6hVsouLX8+k/
 uWWGmgwzUoEGG6tSLw5fLUBVZDDe9SaK+H5jz/8hCA4N5EZCgQQTncrxu4Spq0U13Xve0mM7Ze9
 xTJzs8bAG3VtH+5q5ybQSXR8DZKopWCsv7P9lW9ryAi52tJaKxE5Qp4j3ivzK8l5NwVTmSkzhXr
 pq80WLJa9yiEI/OFv1xQKFJ+nB110S/0nuUN/wwyiXi1+RQ9LQ6JlmipV+0zOBL2kwR0S5wzn+z
 E8B9Yi6G4lIrr7KfUyYhFzwu0C3bOz2bAqt8E1GLqd021rGN6ZVR9pUq0bLVrhA11mkLbNoOhHU
 UqGmKGNaQSwv7iHB9eSm+FQBy4UKIy/RQNUCqP6zKvC8qnxp26kFvxpHClBvevp4ODtB6wDVQQQ
 IpQwSSIYlsPrSCMXmf1HkQF9GXjJDvFG6DzJitmt0xi6BfqTMZzU5tXzHim8/razIHR0RFUHuLm
 92xuvXl/52RmizaF/Gw==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f8295 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=h9CbuXhIcreXGJZWFMcA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: _iOVGhbnNZBmTjbCpl1SHecN7Ywok1wv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX2CY0qB6EqaPS
 75wDunily3EOIUnoicCP59gr0Q8nx/j3b8DH3O1v0iX43t3aKiw/RJVKnqVViS5ZdxXZyAtwS0z
 QxtawbY4z1kU2SzbqACTrNGC4nhhty0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210153



On 7/8/2026 12:18 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 06, 2026 at 07:43:44PM +0530, Monish Chunara wrote:
>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>
>> Glymur integrates the MSM SDHCI v5 controller. Document the SoC-specific
>> 'qcom,glymur-sdhci' compatible as required by binding convention to
>> identify the hardware and reserve the namespace for future SoC-specific
>> quirks, with 'qcom,sdhci-msm-v5' as the fallback.
> 
> Drop half of above sentence.
> 
> "Document the SDHCI controller on Qualcomm Glymur soC, fully compatible
> with existing MSM SDHCI v5."
> 
> You do not need to say anything about some conventions or reserving
> namespaces. We do not reserve namespaces...
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

Sure, thanks. will update in v4. 

Just for my understanding, though: how does the suggested wording capture the 
why behind the change? Per previous comments and understanding, the rationale 
for introducing the SoC-specific compatible is the reason we are making this 
change. For future submissions, this would help to avoid similar back-and-forth.

Thanks and Regards,
Monish
