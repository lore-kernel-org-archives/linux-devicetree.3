Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7524F3E1D1D
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942479; cv=none; b=W6wi632lKcceyC1kZ0IwDdkxw1tduo3LjgQtfB3BOpfYtaO+acnXjp33AGhZ9o/ceAYdabvxDF5UgzdtxGrjeJgN2Ecnxuar1zMNKMLXkRL1j88wFKf7vYzznv+Cxx88CO20qdhwhnXubQu+X80AlmXmBgYixrJ5B5V5ZCeOi6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942479; c=relaxed/simple;
	bh=tNbhABNqfXMqrmy58rocC9BJlx470ELdyH7C1EREDFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CszVcfbzfQTGltyvksEtFUs//+Fx/UUS/tcdSStJbMvjNfKWSZs1PGAMjlytfcPCiAXqv10cOtCiYIAi3JLQyIe7ylEt4Ro60s81nvUiTJX6PxHQeX6LTYMBVj8LW6WptM+cJG/HHHwRj018t/1qaKb9QbVp5uJLbk69ESGTU7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfCt+GvV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNBynSpE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfCt+GvV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNBynSpE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uN9B1565817
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYBndjbSBxlH5m0LQ4aEBV3PunPAUSt0O1wjwpo6cDY=; b=HfCt+GvVAce9r35o
	va5MMuOgxZwCEEcDjNAyE5Mc0eRe1j8xegIxLKTokE7kFYV+NipZnb+5SO+ZE9hF
	8jt9rUqdkHqa0Vhp2uvGlIB+/QOzkVIHwKt5uMEUO5yKiuc2mFm7kU2UiOV8+6/Y
	xltCFFSBU4DmXI1+5XvkGvaGEYXf89uYueDSGqoNU8gfaOhYtg88Oic1HLX2rHIt
	LDaDe6H0xlU7OPn8jplhHfihWsESMq61Z8CwRatlsK/5N21LbyYno83N1f0dIWUX
	fyUD5XyimPxqJT7tA90n3GakvgYc2Mecc+A++mXehWzH/9eFpV1uv3A/vd3zCs0Y
	HJ40Jw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wunq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:07:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso59222531cf.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776942477; x=1777547277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYBndjbSBxlH5m0LQ4aEBV3PunPAUSt0O1wjwpo6cDY=;
        b=fNBynSpE64c8PdEhGXVWJqnd8ujyQp7DscYSkabNxOHsMHCIzMcV6EO+5swY+eAMv9
         0oRVxurXrjfOsnzocQZ3ivyJ4WR/beb1uKoRxxBohzI4+TAh4LBmDMFvhDW+MyHFS7oj
         Kxp3NsIpVuM1bEXsQGYFlPBbbjLN3kMQO+j2Z9gueMddT0KhcTo/LFhRiT6UKAaAw104
         RSsbrjUKHIZMd+wtN7cxbwcn2IyHNY3WxeDC5lbCte8yB/8NeaUJRHi0GWeyGCs2DW8Z
         TozzULiqq+XlofbCIr5XL9x/iF9/Sx0CCpGmXdtJSoo9CrAtyPf5HuDeEaZMx3VnNcnI
         QTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776942477; x=1777547277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYBndjbSBxlH5m0LQ4aEBV3PunPAUSt0O1wjwpo6cDY=;
        b=eSjeT6uxyGRKFaVOqi8McuHBeK+HpHKuElKCxOIKxwf3aUzNjWiuJoPuAklwptuL0j
         oyu0FU4nxc77z08lcSDP/SvSW2tT/ph2CEdhAdvXIMFRhgCDcRWpPd5lhzbiq+Et5zsr
         YXYhPvYU+if/dC3WUn2uqGJhdmnwycj/5TRmXntgB3uI6gesBG+dINQ1lPUFC4bGHczD
         7f2sRiNpWP183A8QSAqK7P9yjWOIX+2uX8Vph9LvUM/wT7rVouBdkm4biQ0xxqE3cnOc
         wLq8TJMQBlDL+dRU2/kVnjHYa5EYnRTTjyOkTdTD3q+pm7JG/7o4JZVWSJvlQlETvJuL
         M4zQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qnuOYi3nNNdygFZ52L7uC4pplLYHl3BSPlm0o596UZU5xQ3xsMfeDgOnAo1gTJdaIaEQdeNkhKQDD@vger.kernel.org
X-Gm-Message-State: AOJu0YylH7AVi2lutadRI4vSoKLSHkFd8i51iurjUQxp3rmczexbRnQO
	rWggkP8jgM+/PwBSp1yoJw1OxdVqhArqdA/SRDlTrtZ/ytcHmn+hWOLSAVAcG49qyZNWsBPJ9qn
	SDBWJxhrDW5/3atnACvwovs7ii/0G9ZZel0po+PJNV3T3hL+F40ua2t+L515dD8zX
X-Gm-Gg: AeBDievnEUB/8pbEEvZOuOz0m/2mdEzoeIW4mMsJ2NcrlaBsZNuXPyM3EBymls50iqA
	ghUcMzcfAFZ6DDgnKDHlNDvhKbXWGcq7lxRSv4o/UJ5Q48q1101Acz2HkFttEh8o+QOp+WUcjBc
	ZV+Z+SC8Wwt9+j7HtlN3moD+okXS1EzZ0e7TLt2NRvXO7/9vSprNoVhEglZfRtOob4LbhMeXavX
	3vqoBOzxT1TvIgFRLQMuQ9gX6FFX499vQpywUACxJTCdghrkhguNgALgCHJwQy8Cfbd8rD5XbmK
	+XyZXJNhT/bG64SgapLq1K2c3K8T0oRpFvpaMg3Kj3+80KPuYBezbuT3P3SGcmG+cvjMF7pRglR
	kMaUkBPi+qntCgOtdcZs3TpBlFeTrDeUolPWO0w5qDU/n3unm3gg9dau17QPcuxTGhRLduhTWxs
	s1oa3rxJttlFR2Gg==
X-Received: by 2002:a05:622a:1148:b0:509:2a92:8088 with SMTP id d75a77b69052e-50e36839737mr257839581cf.1.1776942476832;
        Thu, 23 Apr 2026 04:07:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1148:b0:509:2a92:8088 with SMTP id d75a77b69052e-50e36839737mr257839341cf.1.1776942476309;
        Thu, 23 Apr 2026 04:07:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d69708sm4032514a12.28.2026.04.23.04.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:07:55 -0700 (PDT)
Message-ID: <d5839700-d3ea-42d7-86f4-c09c5696b193@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:07:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] pinctrl: qcom: eliza: Split QUP1_SE4 lanes
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
 <20260423-fix-eliza-pinctrl-v3-4-68b24893ae63@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-4-68b24893ae63@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMCBTYWx0ZWRfX73IkKyW5endH
 zzYt9qEf5McvTPrETf8CqgAbApgUouj/Q5UjV/pK3Lm69nt7jd7lMFmKEu49Tafg1MRHST/9SCi
 Sv8WKzT6nkYAKprVtmlhcLfnOE2qht/LrEFJKlhETrDqMvdiDbGoI8i0o8AAXQzKSHA1/4BHdcy
 c2uQFYxOUJw7SIPyU3ulAdb7jWiLdxvHisc6Kw0/ts/gD8t+dFK/NVYKHG66okXDIBB/fPMX5j8
 S2PUp/NY3y5F2gG0FTbnSvSmU5V8XHufGi++pRQuP90R835P3+LCcl6ISERSDy4xo5NJtdxe13c
 O5Udik8ObBxWIDu4JRCiTzie8A216siKuYmd+mMdNB2vT7/p1d30gK1NQz7GtlPgK/ePori56KN
 eS1Wz2uW5IVEr/+3jEvO+OLAV+7OdfodgwBaxJ126z/9Uf51TafzXKYoE18Qio6m1xNB5mkntfP
 X79Gf5xgiln2zHoyvWg==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69e9fd8d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=27t9AhEcw4iSZbU8vf0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: UIgw4YybU_FkpN_lIMM3tKv9V_ZnGEUk
X-Proofpoint-ORIG-GUID: UIgw4YybU_FkpN_lIMM3tKv9V_ZnGEUk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230110

On 4/23/26 6:43 AM, Alexander Koskovich wrote:
> QUP1_SE4 shares GPIO_36 & GPIO_37 for both L0/L1 and L3/L2 so the
> function name cannot be the same or the alternate function cannot
> be selected.
> 
> Split them up into individual lane functions so boards can specify.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
