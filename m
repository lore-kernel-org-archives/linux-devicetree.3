Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BC33BC68E
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775037828; cv=none; b=mbzx9b0NKwwvembSDS9eLgogj5f895wsgbIdsp45iFUnhQEnCJ4ICkr+fUA3wksX+capab70laQHnQUZ9W8h1Z1o37+KxpC6URx1l1wLjA76VWOI/D26ChprqjUls/wXjdPqke1y5N7FNHkl8U+JEAxIrJJh6Seirt/3Ofyu+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775037828; c=relaxed/simple;
	bh=lsS53ynYkH/13C4ief3gB05YFg3r10XwFTsw+k9pbck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2T+sxwDXtHPTToB9+zKBmoSixa+jLdDdRs+PoHqUbY1uA6C7ffXwGBCQq6BLuE0aNhSgPC/Jzayed22kTBeFkbfvWSRshsEr580Em0Clerb1SP4HSSI6IWAOoPKC+BFiqH6mMehSBDNTC5lNUBo//ZNYeuko9EXgS2NuPi2uUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fX/uAAWk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gG0pjbms; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fX/uAAWk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gG0pjbms"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319A82g3174206
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwjUJrGpN78FgjyI6AFw/4aUjqt9OxZcg+7oepy+CYc=; b=fX/uAAWkm+TeWmCg
	MROw7RHiEeHcIvgWMV0MmtTMmYR+W7LQEE2x5fTXPVikqGMrsR/u8eknq+3NVV5W
	Eg1fPnV2LFaIWqGBjYiTVrJCXFDDFAiH/ezL50I641L6KEMCYWM13b/uUwtetOEM
	DQ5HE9rDr5VlwBHr58q66BU65wWnIZ+VbW/iC6qsW+JwkGNvcdwzEdxmWqhE9VIq
	K6ua1iJXpS8HPoPnXHCYSjdTqSbBG5wIPlmutQ1VPgTvnf3BDZRvvx72PPjW6P57
	kJTYjmuaAAtjqZg11vaLeq4S1obJTSjprdD0lfEdGvRMKkpFTFzcdj+VqcaZAG5j
	y3iKRQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d90gbg8gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:03:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb39de5c54so249316585a.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775037825; x=1775642625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwjUJrGpN78FgjyI6AFw/4aUjqt9OxZcg+7oepy+CYc=;
        b=gG0pjbmsVoPHKWg2cS4iNWkYmtHO4QSAsnS8nWZAD0u1EjcIQzZyBaFVo1IWX8uEiG
         dNTsOB0/gYJGZBVti54WoSWNDhSRiYKK6J3wkgRiSWy/PPo5W3wyvyWptFBxRH6wddWA
         2FZr72wReLSH7M27mn6VzrwGCbuEP9roLtq03JVlKqQj0z3UICc/pSwLvk+ffdeDkbCt
         9xqwEO9PxADvSxSWBflCEynYr+62BwOauMdNUN9+60dSHLBV5FgbKzPXzkRjyC/NFyUF
         Zkq7kmw2JgRd8GYypJMbKhpNZaR4AP9M88Z1WMMeJTE89W8F67HiRkvoKSU5+Db2VYwO
         e99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037825; x=1775642625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwjUJrGpN78FgjyI6AFw/4aUjqt9OxZcg+7oepy+CYc=;
        b=OOuRQ4LMVkMpzLiimLRKaa8BEUUDXssCtbl9s/CgwaPj/QQNCATZiq0pzf30CztacI
         KVBJHucoYF0DP/V58lbL5jVPRDgUUQN11dTVqanZow2Olr3gcnr+7k9HAMY89AyZn0Zn
         p5tKG6E/2GEA3rDJ/zXR6JtaCN1QQ8Xqk67UIJJE7UciszM1UCeOAncVgzZEMFi/GYZ6
         IJ6IrjvOsJDk49pYCNdt+cSt3e1oRkt4dqQSdNk4L9jCtSrBV1GbVfzYei/vIxQcU3qT
         P0G1TsxYCEsa0JuQaDQfO+6vLT+IDDwgkPmYDjdHIw2Q9ZtOJ+5h0yyYZ5icOrGgsstm
         +kyA==
X-Forwarded-Encrypted: i=1; AJvYcCXDF8bKPSDYZNFcscQQNZDsxA0djPShQ53KCZvx98XJPv6VwlpXHfZT2ZDD83mqnA4IobD6+7PJDtqn@vger.kernel.org
X-Gm-Message-State: AOJu0YwVriktaRv9O5umzVVDbFYf1Bma0MQ1I4qb461H1//wMx1RTht3
	zf5pN5B+JUv94oRYTYhp9rYjcX2m0sppToyIC+qfsA7UahCyAhmPTAdJ3fhNMABMjfQ84BadqCm
	n1hhQ+PSMI71COoqLdwUYmH1WFDuNrK1MDKvym8wY3Eqr9XaznBbDLSO7DuJnHffu
X-Gm-Gg: ATEYQzx/zUR+8MH7+7e5esBqIeSLMKOX7vmo9ogDFEECFWde2YRxhjEoNW5YiZ6f+f2
	65vVRof9Yu2drXPhGteEtpd0HjEfB+uCslc5wR1HFNplkRZ57ZssfJuJhgXzBQ6HPwXmOjaJqsZ
	/LU3zslHGrwMuACEhNvJ2fDOsOpCCLxc2gUyM6mOynS2YgjSOrQ13k9xZzN1/+19kYu2IB2LTEe
	9OnEbyaRDbsYcwIDB/Gw9cvpQaRKFIFWKIXlzg2MAlqWCqDacFPj/arR8lBuah/Wl7yP7xXtLDE
	oiXQQP5okMtswq6770UEHsw9UGaVrx94aiPXRgtplJtk8bZ9Xik4Oemsq4vPiwITcUCENylsemZ
	MngIU5sW6sMRzRSbL5CIwVUay+/QVF/Vwa23MlWEAjaubAyKhaU8o/hrNzcWAocb137MEs3he87
	VF6iM=
X-Received: by 2002:a05:620a:31a5:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d1b59568c7mr370317685a.0.1775037825250;
        Wed, 01 Apr 2026 03:03:45 -0700 (PDT)
X-Received: by 2002:a05:620a:31a5:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d1b59568c7mr370314385a.0.1775037824844;
        Wed, 01 Apr 2026 03:03:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72a6ec5csm4272185a12.9.2026.04.01.03.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:03:44 -0700 (PDT)
Message-ID: <bcb49e49-9f9a-4587-b025-94979abca25c@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:03:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Stephen Boyd
 <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MSBTYWx0ZWRfX63K9pRgOuF5/
 bLoy8jUMlFEo4dlrVy6eP7YrddWpkkUQuHPbuxQNSlYh/tDuj0hXo5zqlGMAcnddx+4kmA8WSJz
 Cx0ipDON6cw4z+DZmRTHp/c94Sey8tX+TC8T8xZW1lqLLxzOd5xhMmrnePNdQcvpmzLUV5k01ji
 6L5NOcx1m88WGPkXGbgvQ3Bz9nEF5oDlKIpL/Pi2IbBsAz8nPaQJqi1DPXVcm98DD5rhnkjcfjX
 wBtVMn0klkueiwn9JsC1vrhoSrrvqyvrGkVz2zbbT/I3Jfjw19IRxhKyVLKVdVk+IJrd1H4b0XP
 vKAb0sbFf4Vi3+IIrj9tVDk8Lk62MQCNiOjIElmcyQvE/FJ45IpjRBI4PEogHOv/E5Ignda3Q5w
 EIR1408xhyj2mpT8NGIPBdtzm/M02wQlkXCvJn4e5osbafw+218k6EWDOqe/bL7UJ14fJaXYHcJ
 QRH4Z16TTPIkikixk4w==
X-Authority-Analysis: v=2.4 cv=QJJlhwLL c=1 sm=1 tr=0 ts=69cced82 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4h3_F-PqDEY_y8xvUNAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: bwGspQe_O3QSU-6X9W5tQsu7iQIVO2Qn
X-Proofpoint-ORIG-GUID: bwGspQe_O3QSU-6X9W5tQsu7iQIVO2Qn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010091

On 4/1/26 11:41 AM, Fenglin Wu wrote:
> PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
> the definition of the channel status register bit fields. Add support
> to handle this difference.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Please carry the internal review tags..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
