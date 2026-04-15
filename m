Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255AC33B6DB
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246216; cv=none; b=DMsYzW5v/cfxvJiolvg0ImB2/fSkarh9DAKcqTksYVER8onfpkpvW5drz7E4IhMf4MM2tR/v7Wx/omyOFhHqSVDVu2iVVkp6rRimlpZlSJGk6jb2Z8dbO2akuGs8TRkvtoPfYj+16JxmdMRMEUMWjTQmROrcM3v5rHUP8o68984=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246216; c=relaxed/simple;
	bh=BkNOkehDJkrp4NHd9wg0OovZlITEy0Z536OQnRXE/Ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJNj6a1aMABMag2rmr4jG2TKkn6DeVk4Fg3KyHwo6e/0kGweAEYDsRkj4CO6WdMMKt2vg+RAuT1HnQCCJT6NGroDLTXJ0/pC7zwwzd/rq4ojeijJ7q42Miv9isn9Xn2Vspnh3J5xmrGw3JycCn1hyeu7fEkBdL5LcmZ/Se1X8q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5tcAefE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIOzDYZr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5tcAefE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIOzDYZr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8uAXg731025
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZj/oxg3uNVxM3EIb797B5MnQJqyDgWAp1DNROgmC5g=; b=X5tcAefE8UpDqeXk
	pR0j8DA/rR/Gc4+02N1376/bOJtmWJI+diPOy5b0jXsJHwHkgQyAIAYPl/rJEeu7
	7liIOpf1t01rQTQLig5JoWS/I10vbQSWA6fiSSR28JDWL+QfhhTOWXHKrBzW2xHi
	zhzB5gUT5rNBWhvtfgRoR6+v9D1Ho7B1b/w1QBR8xpR/9uifUYDMSr8giLiw3mDD
	BO/CzJgKH4SBszttkrDvrxv74EIw0Q0o9mOS9hRP3xnRyslhQoBYPmA8bLrPEqzg
	PxsHstbxyFhkiVOBt4lIgkmBNrigTiI74vGCri8M4mF7dLHKbEVuehdmn9XVeHak
	yfFvWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruub5mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:43:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b33a19837so20217391cf.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246213; x=1776851013; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZj/oxg3uNVxM3EIb797B5MnQJqyDgWAp1DNROgmC5g=;
        b=iIOzDYZrgTc8E9Uah3Re+hQ+6uhDHDNbHt589q9Kz45fMdIrCyIJOUKeiVTfLkJdLJ
         koA1YezSXSiUFTpVJDgwnwPZ0jJcWU08yS4lwYLGM75IJ7cOIbTGB0frY8qwGLz/hvow
         EUHklef57tsneAWQFGhYbssuzRKlqCMjFSgyg0vJHoA2JlCHYu5eJX7Ip1lAYMct77bU
         BmyYXRSMxjfqq2yoadYEVbB8hS/XNCftM8nR9mo2NPid7zXp29WPEtEBPTmU0cgMM2c0
         nYv+avyZJOU2o4yqsS+lx8l9Vgx0/50JxorkdJLIQffvcZdJ2bkCMS+a1S2gfq/R0XKe
         OQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246213; x=1776851013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZj/oxg3uNVxM3EIb797B5MnQJqyDgWAp1DNROgmC5g=;
        b=lBG+hKVYaqV6KODy5tyMKYPrinBYi23g7x8Y7B3hSiXTI66lxjc+z7RPE0UysxDmYR
         m1VnQnVCffBpW9sexiIjVpuWayqmzRT2QvzEOLMNuxXKCmw9bo4IuWHp1SoyNtGknUKJ
         s8u1RJBhfJpPWuFqJS/a5vNvzz5Lb87BiVNHemXW1H7AZJLhvFhCA9LWoQj+YTMWTRIa
         lGMepFrO5eNpzCzW1VCqN9MpqDTweiQnNrNs6Q3zQdj/V0ZTTUNgjhfQnCBRGYJU/72S
         Vyzsfjf2Nxq9eRIzCbxIz5hA5Xqdh6o4zy/rwuJYUC3/lTWI1flDwwVLvB4QfYvABLMl
         UL+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+hIlT0ZKIIEX6blvXj8etHMFmSfaM0jCZUjLt7670KHoSfDWCm+8LThJe3CrjbEaYvO7phCtR37VNY@vger.kernel.org
X-Gm-Message-State: AOJu0YygzEcmGTuRd3foYABjy7NyGoqdWBESlqQ3wKFdRwFhSwdWP6+u
	M/AKYAeLLTHvKhws/hWklMFyMRvY9uIrXcIfZZrx3Pjn/pN8m2W9OzWIYMXh2qFTjUmz3FqqHIV
	H/Kpdj11pjjlbNh+n3O7FiSaMOjZ8G3VqN6aSazs9ZT7vqs0rLgqAhibOK0Tfukzy
X-Gm-Gg: AeBDieu+zWSYw0oRQqzGZ5QAjdDe3ZcKJVom7WObdPM2Yk4yBXtlXxkaRFNUcS9cdXB
	CKgQnsxPQj7WisXw4HJLA2zHtgscPI0YdMOfWhGzebnG9DMegpl9fYh8ROHSCUYp0PiZwy3Ov97
	O0i+FkI1tQJZYIzjBYS2Dt0+fwtWZ6c2Sv4IbJ20gX/S+anApbX965G7W3xS9kBW3hLqfRKsZQV
	+TWmh7P/IuXZpYac7SPdylmq4qHANmFClAPVpKsrHzvc1UdHOOArR+xLlpBGrfh5XVdWjycV8uR
	7JNgvLdLV6/mJnK/TzJ8Un3dSJ4iAPtGQ6oU/NO5gWkixHO2ZzfsVIYvVRfhzrcS/9TpvmaD9S7
	LtqEZBNjsgkB7i9NoRUl1wqKTEums1BGg1crC0KQFbH4vSJu3EOEb5aIYz6OdRWIpCVoUMHduEn
	rce7Xbm+wbuo85bQ==
X-Received: by 2002:a05:622a:4887:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50e1a7c066bmr15166031cf.6.1776246213358;
        Wed, 15 Apr 2026 02:43:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4887:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50e1a7c066bmr15165881cf.6.1776246212913;
        Wed, 15 Apr 2026 02:43:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba177dd36a5sm38267266b.54.2026.04.15.02.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:43:32 -0700 (PDT)
Message-ID: <42649c1c-3868-44ea-8186-49e34abf10b9@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:43:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-1-03b475b29554@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-1-03b475b29554@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j2A9fI6zJHZdNX3LCH8x-KvlRG_trIez
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69df5dc6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=G6eyCl79rmFccwun_h4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4OCBTYWx0ZWRfX/ivjt+UBIEAU
 2Tm4PmS+BhCI7nbW6bhEb1L43wBmv7Spph+MVurD30lVGp/9bvfp+TZvOpAMX1UeKUx+RJeBQWx
 osYNnyq2JwBm3CXmweu+Pft/HYSGYXZXDMPAo9VEBg62ljarA1IYTZc0YH086g9Tg/5+kbRxwLv
 +hWSOG1+qnQyzH+4nxAE/c21kDYLlf9ZC3Y2zVtCGTp6w45bqhjKm24k1RmsT4m5mQFW1qPwHSn
 bzuufZaYRpUpY39/0kCMYrzvQEe5wqGu8Tkdd2OODVU6jZGofaPYa8MvkRGGzRCAQuCELyyrMRj
 mpJv3AFJD9doF2xsIndtPzhrXSigcyfP2/uBUzeGM/7J4FUciiOc8Ji8wHjl/sq8bnHAGeo4oIA
 sYSqyp8i83a/QBvFJLHOAOFfBK3LiMpa3TMAetUVJXF0A93ud15zhVKm6ABHl2kQN1Jj5mvghdk
 7w4SqyTXjXnykUMhy8A==
X-Proofpoint-GUID: j2A9fI6zJHZdNX3LCH8x-KvlRG_trIez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150088

On 4/15/26 11:40 AM, Nickolay Goppen wrote:
> Changing FastRPC compute-cbs' reg values to matching iommu streams
> solves SMMU translation errors when trying to use FastRPC on CDSP
> so change FastRPC compute-cbs' reg values that way
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

Fixes: c0c32a9e3493 ("arm64: dts: qcom: sdm630/660: Add CDSP-related nodes")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
