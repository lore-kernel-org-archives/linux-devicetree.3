Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FCD3A16A0
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 08:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722743; cv=none; b=tLcPeehwV49bT1X5xMvaVjkvBPLAWQF8kPYr6gTXp+PiyPOCOWYqXT76iP+iuPq/iu0D7SxNX7UVdhstvrFULEffIZDgHn9LBBF+Ze1LiA4nfeSOZuGr0WJ30o/qpcVTexYOTXG4HSRAppS0HHaB11gUL0ygRvcTXG2Idrf1q4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722743; c=relaxed/simple;
	bh=6mMHTYpg3tnj80PaMkaXbeENESN9DNQ9bb2lP3rCcpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRLwnO0+5Ck4BYAdFhVoCDysCJ0yrvCb5665VwMtneu5Zp3ml5yy8JYaiV+yNNEvPAN5EV9JIoU3G3jsFL8x+NBtpIli0vcTEa5xdibvPhOvaOPmAj4H65eGdNvoGKiWiQX5jwpmQBffoxVMaQbsMdpp8V76Xb5SYVy+83Qgwl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XS3FDH0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV0a4DQY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XS3FDH0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV0a4DQY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397UCWJ3781253
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 08:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	142GNnYSU6d3FVCHi/ShZiVXXO71kNyAO5uT6ivLtnI=; b=XS3FDH0eci9v8mGt
	KZjRkIMheID5X211cvA8p8TjqzVqq6Nvt9TN8YmqD9UZGGA0CPdpBnZUQVemCNDB
	FFZaWapSS1imgxFH0lIBZam36/HqMsBQQHtVEndWTlN253sPjTEOG0Q1G4EDs5Oc
	pfwoH5t+qB/nR/R2tFPcL1IIlIvV0HMx6ZIZ0qEgLmqFWrmkrO685PjHRcoIqfjt
	ZWruGu/MCMdMrnLamqaYYlplbZ++GmrKVnSVWAC7REWBnpC7k2gqUBJukkrl1M1/
	19uBjB1iTGqaLSFq8IhlVFw2a3aBKtTdGoE4oCRD4TEmrSO0TNliOI3z4O7h2q9q
	LkB9xw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6yb48a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 08:19:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfe29579d5so8448985a.3
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775722740; x=1776327540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=142GNnYSU6d3FVCHi/ShZiVXXO71kNyAO5uT6ivLtnI=;
        b=GV0a4DQYLXW6IiRO4FM6MlKXYZwSjCxu/TaRLInEtwdNDNZB85YOvUpLGIQLgZfE6Q
         a4vImr/Xl9lOYjTuqQ15lB3JtKKATlZ7hhycHVL2GB2snINBILpWnMuIEte/zyroqf3m
         Rr0NDYXym8+88UZ1dGAihFwZoE6BtSVNh4W4b+3n9OhNADtV6/q4++ZkbAwVBOC8hAMo
         08xU5ePE67/uNUwJf2qpquXRcUlmNL/L1qjrvxtGW1Hx/sSVZ/XKoZ79MYhpEObma0V3
         KJ9I34Q2Yxs4zWlraLnWsUr+vxkgKlmjS22Vg/6x1A/jjwWSnLdel6c31OZpyhYLptjI
         MfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722740; x=1776327540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=142GNnYSU6d3FVCHi/ShZiVXXO71kNyAO5uT6ivLtnI=;
        b=QsC4Q93jWm6xuuh7BWbim4AbFGM4KmqOIiywGhjpo//XPooebuwtP5HMEfge0jokaw
         wGtvpWeHVEGd+rawxhk6kAC3EM/u9lzU7m9TftGIlJe5gm/IYOwO+LvD3IY26Ka4jOFK
         jRNhmezqWvAPE+JvtGEadjDcrPnSray5LG5y6+QrqwpjWD6DKGkEXBqMs/sZd8tvoSyB
         2RJEWsre362NsGiHraHpaFlfVvuXZmOfp+VxyO1Gu9rhirF+TROqUXunLkx1QtZiiLQt
         /o1vUI5nu6gPtraBzzPEFDB3QUswK3OvENLA+/zTzhPwJ2F729NmE8j7gQcSPTfod1SZ
         qiPA==
X-Forwarded-Encrypted: i=1; AJvYcCV9E0JCpyrlMDSkSeORUqctuomUsncgbdZ/HxR8p5CaQhOr7PbjhNa3Ij8Jj5owHbld0dpSl2EfK6eh@vger.kernel.org
X-Gm-Message-State: AOJu0YyjkAQmdv7GzAk4le656Gl0LTrgt26kTUHwJYVyYQzc+R4xhXOc
	c10wC52HLDasFT6IKvTgEZDVGmrwFK/INAphh1VtQtg2nGKGU+RMAYp7RR3TorO2R0XLDJaTwdo
	anNwiswgOi70lTDtPyHQrp7T0FYS8mAdk0fowxyMdLJW/WKO9r0Mp8RWUBUHeELWP
X-Gm-Gg: AeBDieuS8uXz4KHA7TXDyu+m632mh8Z2u4tbOrMP2AkJigEQZB0+r6VWj6Cove/f0Ov
	2kwE3xQzV9FgKyGXoDFIj9e+/YrEtjOCjxxwvDI6mEjYmxVzoB7qt+TN64bPChsZu9Wfd4NboYg
	F49VCSDjVTwSk4LSgLY4UFHR3yxM669+oitmCht6HZW7Y1kfD9oELvOyrXmHPA0E44VIWKtg77b
	pn2+4ctfnUrWqmtKmnB9aIx9mfD0nUuz6HZFJEmQ8eWcumYXeybAJpZaUas0gxzxGwla3jIEaMb
	I5brc4kUudhSy5O3LDAKzK5+OP2ROAbbN6W8nK+cmGqow0hb2fKEUwn9W6qaDrhGEDoxOeeOGs/
	qNgQseYqzwSJYdmaaOWsgGQdcv35ZvTus5FPer4sgEPaywKiu+Afpi0B8JP9UscQCfEzgdCMO+n
	pAT0g=
X-Received: by 2002:a05:620a:460e:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8dadc4dede9mr743429985a.0.1775722739936;
        Thu, 09 Apr 2026 01:18:59 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8dadc4dede9mr743427985a.0.1775722739511;
        Thu, 09 Apr 2026 01:18:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d37620sm5500422a12.2.2026.04.09.01.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:18:57 -0700 (PDT)
Message-ID: <0bcb76af-35d9-49e7-b3e5-32e62e897211@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 10:18:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm845-lg: Enable
 qcom,snoc-host-cap-skip-quirk
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
 <20260408-judyln-followup-v1-4-823467519b59@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260408-judyln-followup-v1-4-823467519b59@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1sEpIlCioDtSyEg5XQRjzD6tbTF7uQsE
X-Proofpoint-GUID: 1sEpIlCioDtSyEg5XQRjzD6tbTF7uQsE
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d760f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=yndPCfnnJPvdZL5cpNsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3MiBTYWx0ZWRfXykzPrWNr8nzE
 NeQfz31TSxN8rEp5kdGiSeE+Zblqs9CODj/wk9ozgvBY0jEcX1dJkJfd7DK6GtMAe8cMF0qYxH8
 w0Akofs91YYtye8+uXHsJKTobCzRQdM9wdfLQUzH9/QAVM0OHzam3CzS3itmQW7pSLyc/2LF+AQ
 vC5cnY5fKUrkoiVINWfe0x3h4NnunZCJe+G7WMufR19ubItO0x+YyQLuwjeFCM0U6eeQhNLUOs2
 T4JH+LDITOQbgkxypbqFQHykLjdQBlvC8zwhG4m/fwsS2PU9a4qmMWgK3X11Y3LP674hiA44nRi
 M4UO7eL3W0rbjtbstj4Ca3XoCdPuxbJP1PX//TrDsPGIl46F6BAkClA0+drC4z5GTg7nJepWocF
 SpEElPu3KOmmnHJNVB5XjjGLMCK3YYTkHjDC3KvAk4TibNlkqkwVtPVtf1m6hVw9waBUTQ7BBNp
 MrWTgp+T1NWINEgA2KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090072

On 4/9/26 4:41 AM, Paul Sajna wrote:
> The WCN3990 firmware for judyln does not respond to the request for
> host capabilities. Add the devicetree quirk to skip this request.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
