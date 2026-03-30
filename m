Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F0F382362
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864723; cv=none; b=f0TMSwS+5clzuvJbBDqNQ73bZ1JYkV1RcJEwq/IaAa/EH+eYB+P5eKFEk9NVB1tya8K9Of8CmuL6GuJtQH3XvrCgLn8eLXD5H8wj2qn/5trNjAIctMcsiWXrumRqoS+HDb+I5lriYct4RSzbcdbNS1aIi+8xD38YnjX/8vOfFxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864723; c=relaxed/simple;
	bh=AQ5zZCBFctMuFdmo63TC1vo1jqmtIWJOidKPPNByFIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVOV1rPycnl6pNVhRu7P+Jm79REtg6ahg0BB1ekYkNMTs1sm+CDRwn9+vvqTQF4nEsE6ntc3LQ3KT/YvBlisPazLiudcNtPHwBZdroWJNhaT4b6VsNULh6VSay6dG9oon7Kmt8h9+wF62i1XVcjNGe/Z+vB9Use46gokz+BL7VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9I+oJKs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fj1kw1BY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9I+oJKs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fj1kw1BY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6sYE31955475
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7B1HmnBgha59iV1OqCrllK9SWDLV5c1QoI/0DwOFlg=; b=K9I+oJKsxOTFHoQ1
	DhbZZSH7hIajFbxM+6Sd6f09FnSGL0wdXzdpwobzR2/EP9oH5l50lgYOw1WSHLSA
	7g6ar3dm+8gOWtLZS+nOoW0187vUtqXT83Dk9Er0VLkbVCrUQVLKjFzEkg3GpzOU
	ZK869L9/IEbjMWnV+umsf7TKOSbh1YeFyLM6oV+e+sb+iI+vFKlhRChkVJrg1S28
	dqpBFJXe/BUJ/WGCZ1me+zuJJUA/sWgkN7KmUPFT+FKPKfoZr4lKkTBkuZSTDMPl
	Le6See10BXzBPJMLmrzR5ZtmXu6FF5jT0oo81EGycTtk/nvssGt/3Q0/zpU9GIK5
	oDrykg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hdh04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:58:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50943e69b08so15579031cf.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864721; x=1775469521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c7B1HmnBgha59iV1OqCrllK9SWDLV5c1QoI/0DwOFlg=;
        b=fj1kw1BYssjl476amgXqz7K0A2CzVubibjk+BTTgYaEpj98E6ZBi/Gigqkf9xAR5az
         VSlEZviQjgJ1IC0OFTS5u5fkGNSJ16oLdprDp3XXYjG4lsSCl1DEbXSs0vbF5SJY79L4
         ninpCMopf0qTq/QZEg+fWpviDX2PMNZ03sOA/5ILioFp0dfUlwTsa74CMOcM1EurLYOt
         pZmhsi5W7jsvn76VO86wDwVmr7ZgoHk8HauorVey1io/wCnkzaHZ0VymMQXDIurHNsrD
         PQD/+eaSfCCXMJ6ov7nMyII5ZG3JXqygOcrHfl0wlm4ciUcyCfxU2UZeGZv30AIgHXDi
         WKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864721; x=1775469521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7B1HmnBgha59iV1OqCrllK9SWDLV5c1QoI/0DwOFlg=;
        b=V2yem9IXqVtxyuNrUT0Ipo9DPN2GBs8U41xgutdMJtwP7la23IQZ3kCPS4aV3h05br
         cpFKVIOVeSvCZEDfXb55Dr8DanwAygVQzQ1tdtuOOSELN2FRURBxeHXm5Aavfbpee5ZY
         cEexLJVDiUPONOq6r8M+lIXylnMU4hwBGfP3Shix77xKjeLhuhMZR8kVHCsAYcTnvRQn
         vVWPyb3Hj6cBa39CvLOG/qVuWwd2NeFK64EevWqECtZjPg8Wrl6imw5xRsc3Q1NIX42T
         LwY5AWQ4p16T0ypw/nIDbPCPAkY8sktZ2/KxSbRMG7r66j/r3+YLcRRWEVVESx2hHIHn
         xEAg==
X-Forwarded-Encrypted: i=1; AJvYcCXesz4CnqJP2Ei5xY49IMXLp8cNnBgU7bcrImeRawpN0nxFWDsGMmr1KIqqE+YZEuwrCBihkHA2L3jd@vger.kernel.org
X-Gm-Message-State: AOJu0YxyyuyGaASEgfHlXovxigZPkKm5TUAONXsXSyk5LelisvauxmSd
	EgzrPHXRYlSPySgx78QbtYOZwmOhhRSCsMFJyA53b3DwKiNvPZNFf0R7+aUgZfnaBuHqQuB4ZQQ
	o51j/XjtD+7qNKL5q7orwpanWSsJHMnM+5LyhlJuiDouDtX0KzZXi+AzWXInm/O3A
X-Gm-Gg: ATEYQzw/Kwfgd/bzSKzbqpwV8GBkDtiECB07ITEj+euCV8EdISb5SRpOKR2ch6wo6Rn
	mpq3zMlnEDZXLbK/pbgby70od1XXea9e3xqKz+883+gB8EaoV4f+pQTNuMbs/L76MuPjQC/D21O
	pFj22ENqsge/BnPX5lufUNC7HuDVIHFIfh+/ZhxOl6OzJ4lq91anpsvdGX1e0L/TQpcIPjxQ2iy
	wDqqgaZEuzYZw3dutZWexuHyeylej4N44R7ixOXsSZTP4tWiw2JsRAKp3w4uRZYI8XVYG/E5/dX
	Mrq0oZQ4vDXQ+CmCYjPLcSJJzJ2wya3K5auIc22vSm+avSa7/1aYb6/XGblVHlsT2TPPWuh49vC
	ngOoD+Eyg+YJJBRSwhGS6rsxlqTqNwPdN5os5mLMYiN/aejVRLVIacqLzYxdTh5qICLojpS0951
	sNyis=
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr124545251cf.1.1774864720965;
        Mon, 30 Mar 2026 02:58:40 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr124545041cf.1.1774864720545;
        Mon, 30 Mar 2026 02:58:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5fa8sm270436666b.33.2026.03.30.02.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:58:39 -0700 (PDT)
Message-ID: <652b6ab5-42b7-4a3e-bf42-1e3e4f79fbaf@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:58:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Duplicate whitespace cleanup
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260330-knp-space-cleanup-v1-1-0995302f7557@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-knp-space-cleanup-v1-1-0995302f7557@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69ca4951 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KTGCzzMXVDWUBno74jkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NyBTYWx0ZWRfX9XZdBca1KnZ8
 ua4Jp5MZLoinsIGh424sL7feDZh9Oa6EfDX9XYZYf64Nq5ixFChGbnXWH4wcaiAe0Hmhddo+BxO
 S8s2e0Dc4wFTdkcp3ysBDDHQ++nr3D4KS8vOqrnK1/9HVOsv5Iwb+8VvVZJItuHy5z5MjGPeiVa
 2o0ftM+hf+LDMGVIS29yP6gMRCjrfnfS+y5BtRfAnjccsVwbBCC95KYza7PspwO70wJw7/JHQf+
 Ot/I3zWOC8jMP7ix19uV6li5mucQ7gwoWdhQqdINNjHFya6NIWkpyD12VVm6MciHJPEC39sFqQ9
 ww+R03DpWhaPauYIv0wqzbDjSFgd3D9invcMb5vHMqNjuH6E/xEf5nnOSRhb5TmuUta7cmuvJHF
 YKXTTsT86SpUr0g4E0xJrbWvwcmMHZCS9mqkY/QpOLKJfX0WQwFJDBCc/8rQ69XcBVv6N9C0n1I
 1gH5BqATrGVSRC0YQJA==
X-Proofpoint-ORIG-GUID: AfeUC06bQs29c0iSk4PlvZAUDojE93_2
X-Proofpoint-GUID: AfeUC06bQs29c0iSk4PlvZAUDojE93_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300077

On 3/30/26 11:39 AM, Jingyi Wang wrote:
> Exactly one space is expected before '{' characters, clean
> up duplicate whitespaces.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
