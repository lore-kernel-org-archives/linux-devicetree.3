Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EF13CD8AC
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844909; cv=none; b=HADIymZ5yfjkqdD0ocCV6dj2PI0DqDUHVtmM3z1xz1GGRlShvuaU4shVkqehRLgbpTb7QHApgQC5gHw+sVaTgTIkNd/CKVym2ofOYk/qHJgDAZm0njmHjn4zmK+21JCDUDV8MvpjCiqYaPCuoEapXglSwl1pkxeZUaS+nm0bWhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844909; c=relaxed/simple;
	bh=T4RPsJkMOjmqToX2fSIVToaY5p+Zr9IfoSeYrjrwy0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rl3Kv/60k2X/mxyAqzjqufBTUj3Vp5hq/d2YVhllMtbNCgqCmXnBTwlWda+1DVsZ4Hv80lCGrYEVFBTtIHOy8cKxXu/x1JZd/TavBNHL1ZqGBrB4x3wAROxQyDE7hHIdGBExIEzeosOUDnRm2xUQK1fhG2Fy3TA64zGefw1+/jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoOKpKHy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnVxm2zp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoOKpKHy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnVxm2zp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBJPs03200281
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yf/PRgtxZLbnp0+s5IzrvGK7cZi2mh15dVgMB+bKXAw=; b=EoOKpKHyinnHxXmI
	GDj0IAmi4UNwW0CoUT0zzHchW4Ldux2rw0gSKs/4m6FM7DwvCGdNrlb7eaaITMv9
	EsrQHyJCxoc9omWKdNAgxgYAq2iIc1OKFRvlOfSUn+iXcyulmagfMkz4WdzFvceS
	xrpsvTOl+c8kpe4WyTquBCPVRL4txhMCVsujkSKrN5G5rkL4MJoZOHvOkrz+rxhD
	mco19r8IDVuKCsk7tA8iIH9VIXfHXZvNiI71UduHxMhH/TQYwUNX1KrITaennsUF
	lPnmO/BTc8ckeBxnpK292D/xSqZpz5Up7KJiXguc9M7IGKO0OZLWiE8jgSfugB0H
	n++pdg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qu0s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:35:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bda35eab74so661724eec.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844907; x=1779449707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yf/PRgtxZLbnp0+s5IzrvGK7cZi2mh15dVgMB+bKXAw=;
        b=MnVxm2zpkttGF9UH72jpb5auhyKdgNCZIJ+z6TuvcQbmUG/3wuUUGHXx9T18cYg02o
         UGN+TpJFr0M7pS8DabqCYs+gzdOO9nCNTx+ryJCvSOpIKinzo3yGU5s3b9AEoJnFaNcM
         bYikYF8xFsvjMcEvQz/RekS0qx5xODFMtCvTD+aZJ/ny0sGRKD8RC6Yx7dkG3Kb5HLzV
         dhdOOLhXCcCdtPLtoATiFEtgZ6unZXztneFgzrvXmf963D70I1Bss2n8zJfk0K/pLE8f
         uUKOR6ezCGg9rsQtxsYAahqAp+mWstPawFiR59rVBgvKYwWtPy/3TEdCVqawZ04tPLEw
         R8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844907; x=1779449707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yf/PRgtxZLbnp0+s5IzrvGK7cZi2mh15dVgMB+bKXAw=;
        b=I44b+suXkXCmQPqt9ae1WzqlTDG+9pT9JJ3t1TEpemsxt0LyHZnKAWLzY0AxAEeTcU
         BT19RpSJhZosT/ZCS85qrOtoh8hxko/YSDrcAP1xgCmb+rUUe6S3sdmZG+6Aa5MahCPP
         iaA7Lrnd1GlqP65bNNEJ3o5QtViFAlJqiqiX56sxUXWQaKKPaGsXAGCt371GiPa5/cTn
         N1u+hX/OYLVPNH41ST82T9SbVgTzwURRbOdEneDYsN9QIIXRzy6ecegEOZqIblUHf4Gb
         ZTxL3qMqmICF3f8TAHFfBEdNeYy5XEwotf7veK1OH+mwlWwgdUdzfqviCBG/fosPahRc
         enMA==
X-Forwarded-Encrypted: i=1; AFNElJ/yIhjUNiRBFzVrr97k3OnC4l+WCDYVgo/8bZ2VabPX1VErEG5Fr3A4MUnFoRhvhxvEitXROQhQMbfF@vger.kernel.org
X-Gm-Message-State: AOJu0YyShIPjggrTR+u0l8iaz4Zh26LNHgxef76FcKZce+1QwU0aPCon
	/NghqmZuCekbYkgFvkT9xqgUHgj5S2HP174euAbKSaKve2780f68wH6YWQt+JyJwtsAg/jrf37w
	qJUXy3MwF1+YvaqoEGkqjgCYcn7ehd07T9Kkju/znQ0rbwY0fQetpVTjDkAYXxurz
X-Gm-Gg: Acq92OFASZTK0pCossaxvqiUvK82cgcV2ZTJEKeHRRmIxoS1GVDTUjOp4RAsFXF6817
	ofE650430ppgOP+J9oubxyJCQ0BO9riniyEJMRYm6Zpm1sWAvduJZp/kY84DnxZtUWA6Kb+hdzo
	DoVal2kMnOaBaqCGsAk1/X+kox8Y5UawyR/DzCWQbFvfkkqjSQMtRY3TkNtEBXlPzbAIKmYc4G8
	hRc+geoQyyN4wik04FxGovGP85n3HAe6uh58IRMRUpn5OcwVE9XXBIXOpRv2b2/5p80j4HoDhuo
	3bp9vcn/RFFG8qY+4ZNYK3WrPzYEGGDzMlq+0jq8AXv2fSMadzCFzp6tnCrxiQzFQrF5U9QmL2g
	1qsTG+SdW5A16+4YDbNsYgM7HE0rCflShuAMdni4IWcncobd3D0n+U9ZnqMM+5NPSKvLqkqUiai
	jCocmA
X-Received: by 2002:a05:7301:400a:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-303979815cbmr1450770eec.10.1778844906930;
        Fri, 15 May 2026 04:35:06 -0700 (PDT)
X-Received: by 2002:a05:7301:400a:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-303979815cbmr1450757eec.10.1778844906404;
        Fri, 15 May 2026 04:35:06 -0700 (PDT)
Received: from [10.110.108.188] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc464sm6948503eec.14.2026.05.15.04.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:35:05 -0700 (PDT)
Message-ID: <05799dd6-e2db-4756-b532-2220874c6d64@oss.qualcomm.com>
Date: Fri, 15 May 2026 19:35:01 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] soc: qcom: ice: Enable firmware managed resource
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
 <20260514-provocative-golden-woodpecker-b3e494@quoll>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20260514-provocative-golden-woodpecker-b3e494@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a0704eb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LxNlghVGCEmHBxfPrBcA:9 a=QEXdDO2ut3YA:10
 a=s5zKW874KtQA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: r914cXSXKYLvPfPeTaUp0h3SEtvylj4J
X-Proofpoint-ORIG-GUID: r914cXSXKYLvPfPeTaUp0h3SEtvylj4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNiBTYWx0ZWRfX07P0qkrO/0gk
 hGimfZ9TNvL7ivWw492EIhCyd1y6yzK/9DQVXOCRalgXUSoYL615DqcQB/2bl3QhIuVJ462Ffy8
 mUWVWSN98+BepMTEEWXgaDdD6BGuusH9GVAiMAj0JQgUj9opUINqpxZ4Ib5dmZbFBAp24hl2HpL
 AQztGz4si3PyFbPzp54nKEr1rjBzLuYtjhwEQ5emI7ZwZkjynPtqOD/z4b8NSHy41qCPamc5Wjo
 oJEAVvMkSe8AFRKnydgqAi9dFHvuPq7NNcHiZenPh8TOrwnTr+pD4JhQTPS0SH+MqLVonVpK5Ba
 JOBd2YfDPwIOZtVmRxT5op4F/zquLDR32idMFVvDHoLAFu5cnE1EFI074UGvL5l121Ohdnf3awg
 7Yop1O1pYvWiI7gIGvDi5HVx9HULPYVB/oXffa4NDiyvITzwQdasj9pTlf20182jvGVD2mbcab2
 bywhpyGyhAld+dlf/xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150116



On 5/14/2026 8:52 PM, Krzysztof Kozlowski wrote:
> On Mon, May 11, 2026 at 08:37:47PM -0700, Linlin Zhang wrote:
>> From: linlzhan <linlzhan@qti.qualcomm.com>
>>
>> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> platform resources, including clocks, interconnects and TLMM (GPIOs).
>> These resources are controlled by the driver via SCMI power and
>> performance protocols.
>>
>> The SCMI power protocol is used to enable and disable platform
>> resources, including clocks, interconnect paths, and TLMM, by mapping
>> resource state transitions to the runtime PM framework?s
>> resume/suspend callbacks.
>>
>> In this design, the ICE driver acts as an SCMI client, with clocks and
>> power domains abstracted and controlled by the SCMI server in firmware.
>> This implementation depends on pm_runtime_resume_and_get() and
>> pm_runtime_put_sync(), which are available in the OPP tree?s
>> linux-next branch.
>>
>> v2:
>> -- rebase the patchset
>> -- update to/cc lists
>> -- Link to v1: https://lore.kernel.org/all/20260430032136.3058773-1-linlin.zhang@oss.qualcomm.com/
>>
>> -- To Linux Community
>>
>> v6:
>> - Protect calling clock API with fw_managed flag in ICE runtime OPS callbacks.
>> - Link to v5: http://shc-kerarch-hyd:8080/kernel_archive/20260324095703.1306437-1-linlin.zhang@oss.qualcomm.com/T/#t
> 
> Please do not include non-working links in public postings.

Thanks for your comment!

I'll remove them in next patch

> 
> Best regards,
> Krzysztof
> 

