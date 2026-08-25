Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8F43CE4B6
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646633; cv=none; b=OWyn4383tmb0kTAEZ++d0PgbVEEeRV9IGBYUjttMbGuGIk04tR4JRprRPABLKj31bJ8snuBvk61gJRHlXEIgXd1V0JchaNW3X4btnip8PRK79EZj6sXUg8baHxN9CISZwTy044Tg/MFi2aoKHdNMpCc5NWTH/EPaD8BDw9qVz/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646633; c=relaxed/simple;
	bh=64/cYG9myfSJX42Xk7/0Ge7yncxwau+CA0g9LBRZtkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OW5mdfQLbCVcrn3MbquBU35eAlh8XXOfLK6uJzLTrcegHY1+8/98fmrCgxSNYRE8LTIvcDaSsGaKAvaeZBNsB4lATdFq+C+yNc0z+7CI72+/40JNkBO3ai3mD0t0FMvPA45XvZvvyrHOeTPztOm8tODldJGrJkvE5oRzoYIvm3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKvjAPf+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hc7Nwtg2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKvjAPf+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hc7Nwtg2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88IMO870408
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	snUCad4MSlI6CTjQKRUKgLOV4nb44hzzXkl5AybhC/k=; b=IKvjAPf+TMmj9Iqv
	E49fkXNvWA9Jw/RHW/U+2JBXDxyS+Tz2rqEO9v0DAc+/ga33Ka1CCWE62a9VODgA
	IUsYBhJG6oEWsw0EpjCFhF3CTgLsAfvAs0oimfwm4x62TVn4uUsifS0AiX8TYZIf
	gnZfVqV+gZC/B1LQlW3AAjD6t+ebHU/Nps20mXSeG/hAz1CGnyLqK1IxFcQ7dnPP
	RiXYJEIXDCRNMQOhGAL8DffdzSAMeFescWxBaHSdxzaAFE7cUSp9ffdiXcNGuNBS
	h8ltWQ5/aytFeoFAi4MiFK80o2HXg6wQIF7A2QLc7hkFzvPyY0zKhzaOqaYS7xtv
	vaWkvw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3dtydd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:30:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e9d892f0dso10667671cf.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 01:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787646630; x=1788251430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snUCad4MSlI6CTjQKRUKgLOV4nb44hzzXkl5AybhC/k=;
        b=Hc7Nwtg2kYNpe/e64dE/EtzmW3z1pe52++YzrFTVSvSZ2u/Qk9sMEMYzP+lbjvjMgK
         RA6h/8ZCJ+VD/b7uKOcL21CiwSYmNN80JowlFqSB3CxNVULWKDQWV8WD4WeO1AHcdAdc
         itJ47K9h1+S+aq6I9s/EbFSJx9UUu30ksIYxFcuRIp6weg87IeHadijdPW8nsC+R3qO9
         lsuqB13ws9TbXJR2rtPBSXH4Js9JYISUXXK2clgmyrCjTWv7V9kxhOioB0ECqfSd59me
         AHOvCDAfNCqUOa4rR6crYokNqM5IbVkqvjRGbfowK/2NOl4liy2ivgs5g6tvbRfgR/+T
         lACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646630; x=1788251430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snUCad4MSlI6CTjQKRUKgLOV4nb44hzzXkl5AybhC/k=;
        b=lrA4pMTn2r8E//mbUsIrcc9d/70isYznBv4TPSfFe0At43ZHAjbIPngxZy6w1MzbLM
         plnHBXYANUAkM/aOrOPjtwe3dL6aVYmrEsf0E9JNza/8U6g36abjT0N8RUHPpgjgN65J
         BG9lPtIhlW2IygBlR42pxf36WdhI+374/pobzktksYgjGpd63rvPD3p5w+d3FxISzvZk
         sLgMO9HCOGBEQ/iwNL26gw42Cq5LRFecImuOptQficMkhTRV1Fz2TDi+kilPSQjpJBiQ
         uAhv0THGOm31xAQcTMS1Cisv+93wN5ca/8J0OONB4d45DWih2H5BuCGg5t+B90C888gK
         TVNg==
X-Forwarded-Encrypted: i=1; AHgh+RpCyxVnuGN2TEG2wiZwqPVy0NGxajfrTrB6nBJDsuQOEa1/xx0RpSIToseoNkmey5CQnR+0WPd6Z5qr@vger.kernel.org
X-Gm-Message-State: AFuF++kQtVor/25hlyWXT3vm8mh/nO32YoReXF0Aiq8LrvxI7QdF6mBc
	rg7s9qujg92moPO9Qckj0Q62jaFQ6/uVcRX7IXXo1kHkRQojn7EkcsUsMO6V/YrNhObEpU13dta
	tpEK8m92Qx5f1pwcGR02h7N07CG1aFnvw+KD4DzAqrN10anBEvEUEqiJl7k78XtBn
X-Gm-Gg: AR+sD11aRXwZifndaojOu8EUmasxWFPulNHt3AgdYM1Zf97+NdXgJYgcQebZOwJd2QY
	vCotkWWBMl05KDGyV4Cd0qu4PbsSaAUcWE51E+O/5BgsuydLsbTUbN+WSzWuVtsNiPKmqO/6+qx
	lISGdxRPB/b3XAryRncBDt02sDpwivAJNUjuHm5n2ND9SeIojqAGtgY4PX/DuDYoWgmp/jj/KKX
	HqT8EVylkmIRQ6f/QYNAqkUuwtYdL4/FS/DH4FHtOTl9aLLnjL3J/Mc+jGeOdpz8E9OMAZAqPSB
	TkWNTRTmamVYJ+ZmS7HRcreNGaSBlHW0xleLGISjS29azkTS6i91tLJTFoMtQZdU6GalyGTAS+P
	qFgMy8hMl3dFZbCAZptGuFOld
X-Received: by 2002:a05:622a:1102:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52df5a21154mr240432641cf.5.1787646629695;
        Tue, 25 Aug 2026 01:30:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1102:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52df5a21154mr240431961cf.5.1787646629105;
        Tue, 25 Aug 2026 01:30:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f809bsm1827029066b.41.2026.08.25.01.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:30:28 -0700 (PDT)
Message-ID: <b6d6b627-a38b-427a-9e62-ee883505b2ad@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:30:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
 <db2a18aa-f5fb-4ee8-8747-05fcf740749f@oss.qualcomm.com>
 <f344a913-cc95-4fef-880b-f1fee200c108@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f344a913-cc95-4fef-880b-f1fee200c108@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nARK2MwADpns-2OKjHH5I-jWkK0ro41b
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8d52a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=-6rRdagTYtbFvggOUc8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: nARK2MwADpns-2OKjHH5I-jWkK0ro41b
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3MSBTYWx0ZWRfX/LnnaL651e6W
 4ckaBmu4zUQlGnmjmcEdHrbh33f5j5/oRdIijLNyyOFJwL7CvjocFvK5qVY/6z/Jgc0IuFH5hGv
 U2n4pxcO8sXCDNdBIwlM6xXSjUxsx7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3MSBTYWx0ZWRfX1f0gY3XBeJqa
 fT9nCRWO8NnpsIU20FE0cqWMhlFHYUHeVH33dx2dw1gamneOfakbjYHD9ECzbcPKemnTxXO7cUA
 q94i2ha734QRnQjT7q1WNfGEmebGmGcPlZWZ5LgBlPqDJ5Xkt+Bkd6zrVMTESgVxbOFp2O5VwyI
 ZDj80oyyGWdEyZUsc0uCxd82D0X8Rt4e6cjAtWxtkFyfMZaZSOtQz5FHirx23bYSVYGRMJC37fu
 xC6bEHYhOrNVwepeQCoVbJBBWCKDEkjkJgHsWmFOe2jd6C403iMKOBLWToFLDOjyymdA4R3fZb5
 ASmQDZDC4eBn6BOwt/69ALgE04Q50QW8/YSvtKeCM/x3IlVbs9aAJXbZ120Ma6JYBKZ3JeiXnRQ
 mJ8yW0Wxewkx9TX1xB4FkJCEidpWa7iexqNUdoRETBAb1BrZZAfcvxrQcjwgwrx8TDse2xIr4mQ
 3Q07B+krG+w8Jzo7FQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250071

On 8/25/26 8:28 AM, Yongxing Mou wrote:
> 
> 
> On 8/17/2026 10:14 PM, Konrad Dybcio wrote:
>> On 8/17/26 4:13 PM, Konrad Dybcio wrote:
>>> On 8/13/26 9:44 AM, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>>>>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>>>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>>>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>>>>> powers a subset of SSPP blocks.
>>>>>
>>>>> Can they operate independently? Does INT2_GDSC need to be
>>>>> powered on after CORE_GDSC?
>>>>>
>>>> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.
>>>
>>> Is the MDSS any useful if *only* INT2_GDSC is enabled? Can the INT2_GDSC
>>> be enabled itself if CORE_GDSC is off?
>>
>> (I didn't quite know how to parse the list of states you provided in your
>> reply so I asked again)
>>
>> Konrad
> Hi, Konard. Would you recommend adding the parent clock in the clock driver, or handling 2 GDSC in the display driver? I'm preparing the next revision and would appreciate your feedback.

Does disabling INT2 provide us with any power benefits and will the
display driver do the accounting for what resources need the INT2
GDSC specifically?

Konrad
