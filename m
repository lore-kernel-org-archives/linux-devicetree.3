Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F9546AF11
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842320; cv=none; b=ZbOixB3IrcWyWdfO2wjh3o7s4VSbL6ZItqxsIDSQhDp72Y7GOOv+pvn/ODtQInx4Xt5OARQYZfwfGjUujqmA5X1aYzLJBdFpU9L/7qqC1QbTmKxpMuBCkQC/Y6tCfYCLKq3AR0Wv03ZBrFGlneToF3REL8KjN2v9r4TyFVkzn2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842320; c=relaxed/simple;
	bh=TC4T0C60h3JM4c9Nzi+0aJQT6edsfDbbFjJZ9ITizDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9GeLusij/OP4fkh5hRmT49aiPJEW92WDKMx1Ii9wRYOxv6PuzSt0evTgUTx4t7d9dmt48XELlMceSsIz1JZvD/M6X/tCgJbjxLXGB3sqUDI8oXof9k/bKFF7eL5nGhOu0BKheHim2JrGZuJLGUOYLPLopHP7K9srR025FGcJB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuvu5y4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKq6cuqa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nuvu5y4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKq6cuqa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9HQWZ1714964
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0SWersyXK3wYrn244oU9ZcaO3tcWFPY8lw5D9aJdtU=; b=nuvu5y4V0oqwLHwX
	l01FHDoIgt90NwG/PhfGjgzLkxAV19sp36RERDOFHr2ztisQR4d5NxGRoTVQqs70
	UzPCViUdooFHSMiGnJ30VmVqGZbbq3OLztqc+/nYkav9hK9UDA4s+qZ6wZJSGL7w
	IpkFkKTRWNi91GthAvnRAcxGREJ/GdKcMRBBBU9fZkv8Li+8ODI/LROK23pE0H+9
	vWQm0m6ZEivI9vnPBp8wGRgXo/bQPJQzuzTOaVcjAt+LOKpVPx+9ACECVg6WhhYs
	t4JvyHIXASfQ13jDENsad4apy2djWu/lcPI0I5uWjXdN0eMsd63W5PSf+1dhSwLE
	aqKwWQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxspv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:51:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-910552aaff2so45683285a.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842317; x=1779447117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0SWersyXK3wYrn244oU9ZcaO3tcWFPY8lw5D9aJdtU=;
        b=jKq6cuqa8CXYwmjHCRDfbptIbHbQHGaCjMpBVPV9iznyRf4/a67yyVlPS59CAGARFr
         W5RU0d60enyHs3WYQRlQrxkrroqbmw75xe/TZ9UAAx8DD2ejxhxWkcxQXr7IVkQc7Qc7
         NehNJUMGCnOr58+lDgcWDmN5bL4HaND1VXlDQB3+YE2euXFo6tDCV1wB4gkGt/WbyGd3
         cJcnpH214efUcZMyTi/3HqOa47/5FrCebUO64lkIV/qsfi4WacRUlqE/SbdkMwWxPbxK
         dXX+BrHt2SSYTFgow7pZutukjFjUJmW5SJiB4+S9Y/C9QlPjADDCsW/nqg0Iz7J2ag8a
         La+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842317; x=1779447117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0SWersyXK3wYrn244oU9ZcaO3tcWFPY8lw5D9aJdtU=;
        b=WAkt87FsGaIUVyfQ9SDYar/rEnQN0KeZKL9TexCqpAcIJ/cxZtnlEssSOnotM+sgYm
         8A4NKB6FFSQQ7vz+ZvzvXQwwtMck8iFV+4UhSA8nUWs/Fwf/JNct+nEd+MjYGcINLfiu
         YVEXKH44sJlsWx0Roov6n8QozGw6cb8uzxJRJXSjAUEEQ57XkxFArH2GH23hO1jCkrBv
         xERXB29hTrxwX6U5ez8sKVVmmCo4UDwJUsYBTLJYxrAIkPjbgppRqd8JgAn90Bce5Jnq
         OePFpAlh45CEd5UWVKY53wANyH8OfSgdi+2CAfYV9zs5T5rkVWtKUpdcnrI5k1hsZ954
         rnKg==
X-Forwarded-Encrypted: i=1; AFNElJ9g2iCDQnzwJMTWLKJA1c92TPqgJ5+4beN5QIkvzexDDanBcBdJOKyydnNi/Fyw9912r8m/DNd284tk@vger.kernel.org
X-Gm-Message-State: AOJu0YzHkJa3o5EiIZyvOFIYPlLOM2hkTtCutRSq5sAmq1nZsW8i6kdj
	YQVnJDYUfi/wh4UYJCz5lPSAc7AZk6tmrTrFvlu4WIp6YRFh0QsKRNPhMifQH8ZZLhyW1xRrZ7d
	Hfvfm6B9p4DnkKETCi5ZZ+RZExjmKpdCBH4hqVWcdb2PqMLCJ/YtC8kdO59hjv6qn
X-Gm-Gg: Acq92OEhJXRg8++J95jB9JBEED7z4dC3XQ5i56pvL+MgBv+QkpDZ4nX+BbZhu358XXk
	nF2g/uI9wMzsCZGmUNWmQuMiDIw+zQ4IHydyhxm7F90XVKDTBi7ZRqEDfvBaU+NivmL53HtcUQE
	AOPmZiRKVGMh8n6r+EjWQLTzYM40Cmw9pFSlxwUA8rnEH8vLOKw4LR0otKi7HOAjhuAfLPS4qSb
	Fx9M3t5oPXtcvwy7io8FATw0+pgtJivmq47D2qf6E3XDjHiuPDQMdJYQKixo3Z9NVgqSq00+iRe
	VTWpP1vf4cGdWYdmUoC3DclLOKQqCOuKGZ9jBg/i2Lj1qZzL5QDYuP9cOXO7t5YMUgUXmUMl9I8
	tJIAm60sPlwb1LbmEgKnmyXWUtlWsVf8QrzJLdBA/oB28ebSWniOFRYPIs+B17ZrsdG0IELp7j9
	7tt1c=
X-Received: by 2002:a05:620a:2845:b0:911:318d:cee2 with SMTP id af79cd13be357-911cda5186dmr391523685a.2.1778842317392;
        Fri, 15 May 2026 03:51:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2845:b0:911:318d:cee2 with SMTP id af79cd13be357-911cda5186dmr391521185a.2.1778842316959;
        Fri, 15 May 2026 03:51:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e800sm1964619a12.6.2026.05.15.03.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:51:56 -0700 (PDT)
Message-ID: <920223a6-4e4a-4ebc-8a1c-c37d0923a470@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:51:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
To: qian.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a06face cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=w9MK7oTFDpT5FHjZt9AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: xiRfRaDDmjeW1jptismx9PPQCTZcjgPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX4oMEda1hOi9w
 mdXuXq7XvnDPWqj2b19WOkNauQljbW2TxZUbvJzAWhUFY/OuyoNuPgmG8FW7GGi1YpRQxrjs1tJ
 egm7ETSQGaMFyQn+ytoyKgWZCTQPhG+MUWULFVSVVBMPh0GlzA6LklhUQiLEaC3RdZrbLzcV/TN
 fgd3xQrsusaDbvSSzFj/RKjfGPrSqi5ZhydJCqI/Py4S0onuSlpP4W8L2MV23a2GqXUfEP9vxi6
 Bb7FLvSFRd0ACf1JDUlE4WXXdV9NN6kDKUPM25rdspZfVCqzPE6RKSGaS1hpPtbTMXNlq12NuXI
 0dUvESR8yWFGL7UqsMIpJcRFQuIJmGgCDTRTpqYydhiNdQSXnYJLzES/2r72mmZy0ZA1R35ZfKF
 a8e7in6jav+s3FrdrlNnuWFg8MYh4b94dBYsy3sdWMG4iDy9/3JWGRYfWzF5KHVh+IwoH0OecnY
 lchozMef9Uk1133FaaQ==
X-Proofpoint-GUID: xiRfRaDDmjeW1jptismx9PPQCTZcjgPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110

On 5/11/26 10:48 AM, Qian Zhang via B4 Relay wrote:
> From: Qian Zhang <qian.zhang@oss.qualcomm.com>
> 
> The QCNFA765 M.2 PCIe WLAN module requires GPIO56 (wlan_en) to be

But isn't that just the wlan-en pin that the power sequencing driver
takes?

ref: drivers/power/sequencing/pwrseq-qcom-wcn.c

Konrad
