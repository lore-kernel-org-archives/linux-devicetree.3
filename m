Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF0D449ED7
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141967; cv=none; b=pYrTfxi4wfRZyWxe7M9q8ciAvX/alzPy2s548JI91a6TXZe3a68uTDKyyz6ykTnV3JtDqxusCwHbwAkgHWBwl7SltYR2O6TIrT2X3qzUm5K1QjZw7yVxinQ5W0dT+daLuaXWH4m/in0wa+hssFr7MCye4khaZ1CkmBvfYt11o08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141967; c=relaxed/simple;
	bh=xQtH3pqs1wLQ+C9XdxZoFfK5bnVyIVslxRRCRhXb8gA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyyPQsfeKkMdvICsaofWfKk667Ub/CN7mLAXu8v+2u6jZm+qVkhFKVdkj6lqsmX281PyxBDV/stGmPY4P9jeO0PobYH1nPaTsV092GZq1ykv3hfQ3BrOnYZtZIaP/oKGlOUGOl6VkKjpqbwTbZ/MMdKr6pyjbYXv0667ihyVFNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNcAtXLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MSkwzLAb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNcAtXLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MSkwzLAb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lx862219169
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4XwIbro7DtwnORF3AQbRr4HnKuyXp8n7Awe9lOC2s1w=; b=ZNcAtXLZFNkU7DEJ
	9chMTS2OWbmRoHdYRu4PvQqK6/KAD9M/BWBIlWL3BEZB7kvDCBoN2+pJ5swix+Bn
	uCSs3OMHOd7KT/Vme+O6FpFY+dzoAq2KC8PsI2Oka656aUCssCc6NTUpDUcvvSF7
	1Hpq+u2WYSwh9mQHB8vfY5OoKANKBAiqcjiFo86cd2uRRPeHhvb8rt/hrdLYzm9H
	mTLYqXVzrr1gYf1FrgQpaqfHdIXrCfJC7BnsY5ARaz9+ZW5rgvt6nk1QubiYEbmK
	0tRaDo121baqXNBx9bC1vPWyDCy5KR12suZq2e5/JTcQ6FmV59oztMz0K81jwfmL
	is7mQg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3pvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:12:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso17035091cf.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141964; x=1792746764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4XwIbro7DtwnORF3AQbRr4HnKuyXp8n7Awe9lOC2s1w=;
        b=MSkwzLAb5P9d9LXGT2B6mgiM3ZZHsj1A38qzoPhCWPIf+sCea+wBmGFwYGM7AE06/D
         tf6eVtw39oCR9zol3XiwQZ9cv5lmOe59Id6Iw5bYLIYeW7BLEnbeYfNVnBiZyItq89Sl
         1uUd5JmBZtrUfoYP3i8T0hRXAWmtbyq3IFXReorJAABhy+Y1uuplgnc/BYTsaPCd93TD
         sGSkiHUba16xhofL/gzAcUCslJkqD9hGSmN+fniYrkdtn/TFpJ1g3W5d15itLy9RLVJj
         BdwWK3Fb9Du1HhH//4S3/f0THhiZgRfT9vahZneHpvf3xLfl2LBb8GQGF953b50nuceq
         j2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141964; x=1792746764;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XwIbro7DtwnORF3AQbRr4HnKuyXp8n7Awe9lOC2s1w=;
        b=YgvyUNBOXf31gT9AbM59+cFfXorqqwYNbfvy0JB15UAUsXkPTv4zCVMhu+xoFjJSCd
         EmDi40WLOhkfoeMbI2Gpj0+i1eyomCZtTRLohbtb8+fdZ7jC5KiGg2zgvmnM/7U/xN9y
         ftVM54yRykHtj23yEJPjMzcCBAv2ZExtZ8olnDJ1aWmp1g2trRke/AIdb5T6owrxvfDG
         oswSmENr5uajKZvRZ9mRTq9kmsDCLO35xrngOm3/b2JVjZFXw0Zqfv2pzknUjiuxJdgp
         fO3eM0CPG5XhX8U632nTvWShsJ19SYyWiJiT6WDaDXJ6pwEuQxjXfAEbKwFKVUX5Bx9+
         cTZA==
X-Forwarded-Encrypted: i=1; AKwUvBwVfXU5OfS+8IDP3m3VpUrY2p/mcSMW757KmFLzpi3ottzUR7+l4kFvnU64Goag6Wv/sIIJO6ra5ilr@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1Q5qgDnkMuZusZJkvOpJmsCfcafMdW74+yjU9ZjV4v02D7fBA
	7jhSjiEY+Ujw+bPzrcb5RGAE+6baoVJ52zCfKSSs2DQzb9E7WTB/qrfs49x6w49XCFua1mcFr7z
	JzJzZIWTI0Ifoo2780pa3rDhsXdXngahpf4OSjowP4hBuIWzcVFsrh2Bm2p+kxDZx
X-Gm-Gg: AYBFou2/xopV2/ekOqqTWkJBO7JFWd4qYVr1vXULNnnQ1oFEqLYoqE09giodRN5+4AB
	zhsMDxt1d7OfpIUB69LzpjJS/CvBcGuX7AV69rSTlGL0hPQBiVUt5dvXxbTWLUDZNJoqC0r8CJU
	Mpz11LhCQRZ/D5axnZt3nStMfE3dlvX0g3Etx5zWukmRx/s0/fYF5Pi4pJJgQAgMtwM2jx991Qs
	P3czizlh4kagwpwWefRcQSUMkHB4o31UOVQX5bv+MANumIWDdm3+3g7Hu00r0Rnp8gSu4bhVZW5
	oJx2wtgHCPwWVq1uWhB0njd4EWHehw0APjfoA8WQMsHFDR6K18cp4kQBRbq741HYC33HF9TcMzV
	M0qXlM6DSYquTw+OmPpKJnA==
X-Received: by 2002:a05:620a:ac16:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f1a1a2a48mr240085185a.6.1792141964309;
        Fri, 16 Oct 2026 02:12:44 -0700 (PDT)
X-Received: by 2002:a05:620a:ac16:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f1a1a2a48mr240081285a.6.1792141963792;
        Fri, 16 Oct 2026 02:12:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32874bsm53526666b.9.2026.10.16.02.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:12:42 -0700 (PDT)
Message-ID: <8bdedc8d-4779-46e2-a56c-1139fa5f38a0@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:12:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/3] power: sequencing: qcom-wcn: support SW_CTRL
 wake IRQ
To: Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1ea8c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=uwVdFEeZ8PiR924G3bkA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 4uEdkWnnecBs2C3bmqLdnG7UfjD0ORSV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX7EMFFEmel+3T
 zCT8EdfEKUUex4Mc5b8C/SRmX0+bZGN0zgstZzuYpqQKp+2TDghbUlJmeZE/g2TpYuGu7JEhZni
 fYMGaw609+47NVXN3ft1Kkbmc0Qbr6s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX2PGUcXcKTRny
 PAdHSLEhXbcwhi36SEEJ6YnG3KDMa31XuvK0YKeG5qZ3noEyf5X96hY6x2z+AoS27lyJBuauGv0
 EycrDBwPqQOB6LSriHyWg/i149gKiBNv1U7n/qIgmn78bh8gENhumfppIil5o1Bkvqlj5ARGTvO
 iFrQgFkwnoA5TBPN6hCjDopPdsl/4NwsKNIXp+8ybHM8eVnRlAgnWs4i4w2PVx/3ZcRyOV3b7fj
 c6d0PtyoQ3IAwiEhC9WtnSfy55zcT3bW08puHDQhjEqruK6TPnU8ywApa/RPBWLC39L4XmL2eDA
 xJ2kF4zovXH1Bx5tRduceHsOIutQp1K/ROofKPenfc+eSW79yuEhNYwOxu/fAUegwA3MU2v+8D/
 ND6tD4dzikQgNtCvpO/LWkUfTye7pQQjUWovhPw3EC7SjX0X43lBOR+Mz8qjloOdv3aDr/GDQh1
 wtHqJnwIGRHb7Xit5Cg==
X-Proofpoint-GUID: 4uEdkWnnecBs2C3bmqLdnG7UfjD0ORSV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

On 10/15/26 6:12 AM, Linghui Wu wrote:
> Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
> resources must remain available while the application processor is
> suspended.
> 
> Teach the Qualcomm WCN power-sequencing driver to use the existing
> SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
> as a wakeup source. The PM core keeps the IRQ disabled during normal
> operation and arms it for system suspend.
> 
> The series documents wakeup-source for the WCN PMU binding and enables
> it for the Shikra CQM, CQS and IQS EVKs.
> 
> The series is based on next-20261014 and has only been build tested
> because a Shikra setup capable of booting linux-next is not currently
> available.

$ git log --oneline arch/arm64/boot/dts/qcom/*shikra* | wc -l
41

$ ls arch/arm64/boot/dts/qcom/*shikra*.dts* -l | wc -l
9

Why are we carrying all of this code then?

Konrad
