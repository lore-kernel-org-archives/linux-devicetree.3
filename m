Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C534CC28E
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789019; cv=none; b=prdY33YzidtWOGrmUTBZtpKRr8ZKCAWmwuGESiMsnHamhYEtM83nd9cGCErrtdM+LL3VgUa1XWm9cKPm6EHcM1tZimPmI6LdrYOje31SrD3Rp2Fermg9fsyj0jMEUlig5ecKtTq/qKTSrY5ZdvunrF1MJGJA7LnYoNfGSojdLPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789019; c=relaxed/simple;
	bh=o9S1JfDAchq51Lt+nfMscQYFQmX7g9WFFdmCc4nhmQU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GOmQFrx/HpRM7kA7j1t4m+/rRhUP5VwlIV5kOJnJxL17RDcQBskO2G6azAGAXt4H35f/9I/yAU4ADQrs/OYZrffcAC3tu7I38MAKZc9ZqYc4QJY7JrlcslvGZNAl1WJAYnslEoCvOgKnr0h1ygbExqgfAYq19Ff/Np38utXm7vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pki9vY6B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rvd/eKD5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pki9vY6B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rvd/eKD5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Ddpf1590484
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+wM+eOxTc6jOlnbk+CByrbAH9tqADAGsO4vwBIVFrBM=; b=pki9vY6Bi/x7W2WN
	Mo32dCJkzGI7KUIqSgjzTQfqJCzdyeJkG1tzTk+YBpmTGPevcgf0IXUQsCVc1TTc
	//qcQCdXOQ6lonMtpsJ0vbMyN0/aNFyyZXTXMGPcJmOgDVcgGe2x69WnIAdV/fD9
	3YWAtsTDQqCH5iqpTOprK9df/1IWo2QHHk7THWe6a8PgBCrlKwaa4/kZZ9wqaaBH
	VBivDts2C457t1qNKtCVqn8ZYD7SGLJ/E7U355kS1SKJbg0hw0zPqgSAC99PfEgB
	DphXOyCOvLdQbLM+hrH6zwRZ6egd6KoT8o5JjQtVtMLS0cmBrNXxLb2e1DeYdQ6g
	5yr7Vg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqh25y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:50:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so4663924a91.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788789015; x=1789393815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wM+eOxTc6jOlnbk+CByrbAH9tqADAGsO4vwBIVFrBM=;
        b=Rvd/eKD5jeJC1ciKkoaNPG/T3W5nW+L+NU7U0u11sc9ungL06JQm7iER8fFo2Kaiev
         yL7a4m7McyXHWuBiyaotuiQGYWnXj0R3mZPhu7VCvMq4EfkGUVBBUjSQoAsYNlri0Fx/
         uudPHWVXjiOXVAkx5mlLI7qryf6wKbCOtN4JhwtJtPRTk16225qYLxgUoIIDpp0Br2t1
         mMsioagrziCmAoFHREr1ejQnP5Yg3KF22y7r8RAWUd+q8enwz5IX2IQQTul8Gc/R0zrr
         G0oeJWy2jHW8pBYokzIfCsBmksG9NRnrAx3HlQEibuDWnd9VK6W0ssNVd0WQGBd92o+5
         U5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789015; x=1789393815;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wM+eOxTc6jOlnbk+CByrbAH9tqADAGsO4vwBIVFrBM=;
        b=EJ8Y7s7QND3Zoq5Z7x8QplOAJPt+cocEzP/aG9I+jjVXxQ3MnEgPx9FfFpUFSFBDbN
         gY16mRDRu3yCG6Z2gKn0/D5tDNas8PAOZSyb+9V/eZfZM/7xS1hNaNNJSiG15mEBTcPg
         pS22ilqXguPlTQtZ3d/okvOqbeE81IdpRFgOb6FXpJgG88QLNfXR4PRc5C85kLKBTFxv
         IjUv/0Ceew4v7ssGFTlCbZigRILywXv1se6ku9lD2ZBhErWTdZoCBJnTuvF8yVulTa2Z
         o6Wh56p3P0sGhFUp0d9VpQAsx2KvcuCaTvVYTA3KeDmpPrwmRxvYkuwjKqnd/4Rdn03s
         oNnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYzOikbFB89Ts8K+O3yUvkW0dby90s3+GvwxYMIi374pi0rkTKJXRegVeAVtl1WKa3tlXT06e92jqe@vger.kernel.org
X-Gm-Message-State: AFuF++mAhjp1KN0H741VWrMmmy6SeM+cPCV9gAfJ65R7iypRZ9SFBaZn
	yKqrWkgnj/RxiFQO1au1YIeIAvXW/4TBvUGz5EDnURGWVn7E3nf1e1hR/D6cFZUWLa95S/ywEAP
	gAMGYNn0GkFF8WWVfEER2oHXG/LFOw/Ua7MuOB1TwPYeWpLWpA0pXQB23h7zyL/vk
X-Gm-Gg: AYBFou2ZaT8wiYZ8meXI2E+6ae+fxypbtypCpnplsBt88vZ9QYJMx0K4NkZd4Iyq3Bn
	n111i4S8FiuCXoAGFYQFtcxHPH1T3nTgz5fVbJlXSouooeTloz5fbLA9FxTgZQAFgKebHD1H3yU
	m61oeXGGhSTu+ZrmdbrVCCnyofY70siWd4TC/LE9Oia4XeqeTaOKOhReldVdNQJOJ57Eu1G/jaq
	ur78tp/5/NGNN9lyz6ndMAO05ONNhd/PMKwrGn+hFBT8BqMcQwh2zSHtqW7tJs9YoFTmsUg1RtL
	HkczwxBCxr5Nedb8cRnLQrHt3c16h/n3nmEOmSY7IAz9fT3GxcD63V9bQb8EYrz4uRZUwD+KVRg
	L7MipBF0NAYpoXJzK/S9U0lmivg+sf7q26w==
X-Received: by 2002:a17:90b:1d44:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-39b0803b0efmr28973627a91.13.1788789014944;
        Mon, 07 Sep 2026 06:50:14 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-39b0803b0efmr28973597a91.13.1788789014477;
        Mon, 07 Sep 2026 06:50:14 -0700 (PDT)
Received: from [192.168.31.154] ([49.43.222.50])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm37879546c88.2.2026.09.07.06.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:50:13 -0700 (PDT)
Message-ID: <ed8157d9-d8c7-4bce-a7b7-4e14015b6019@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 19:20:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
 <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
 <apl-vKnwHWFJ8Kru@baldur>
 <73411be1-7b7c-4b06-ad1c-f98af338c5ae@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <73411be1-7b7c-4b06-ad1c-f98af338c5ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX4p5JQ4pNkMIN
 ZAix6YMQn4sQPms5QUVX5GHuRvWi7kCEpZeZQkhihD61B2dKKcR3Zrmq/1Oxw0ehUy6D5qloBmU
 /gNNV8FL8yF/6mBQPoWU1G6pKTxKw//omSQYylJCmvV4q8bPaRhuYjyZgP7vtPXtsmPfBEwpSUY
 rw2RvrtP8ZalvkF43rRIcPerMltRfNyeJolewBXp9T/xdj3Wynq3ua4WF+4hIPaX4+QBdgesSrF
 QoGbsDDXw9R8xncMfYaYLRYEGgPkjdcO+JcE1wGOkokhqweOCiLh6PXdEYTA0yQHL3yN5FwiW3X
 eK5uFOkhJlObJPIrhIVjhJiy5x12BcaBfxe77HqiBCYO+2qYeJlhvgGf2I1CRpqQXUzipLj/Akz
 1naFHhRZxmV8VgzoCMvb80NcaBtuErdVmKhQg4ScEmihigb/1FVTvoMwRk+YHhJlCRVEer/i+g3
 EAqLFiwcHfV+Jopc+Mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX7C4MYrL8V3/c
 bgwB7Cdgr51J3K0WhiQ3SAw9WVh8CRC6hQU53Bpu3ebh96VeltCXq1i+mNIn501TfqvOGLj6ID0
 DZypEVKsAd4wUowFEdQeAi4ApAM2PCE=
X-Proofpoint-ORIG-GUID: 83yeWpx0PSUvqISTNfVZ7d7hLU-xijWh
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9ec117 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=zqSeLMjUMbmoh9kLUE0R/A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=TbQuDKBBEd7-K4y6meAA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 83yeWpx0PSUvqISTNfVZ7d7hLU-xijWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070153



On 07-09-2026 17:28, Sneh Mankad wrote:
> 
> 
> On 03-09-2026 19:36, Bjorn Andersson wrote:
>> On Mon, Jul 13, 2026 at 01:46:56PM +0530, Sneh Mankad wrote:
>>> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
>>> stats like vmin and vlow.
>>>
>>> Shikra SoC specific compatible allows reading individual subsystem level
>>> LPM stats along with SoC level LPM stats. Change it.
>>>
>>> Keep "qcom,rpm-stats" as fallback compatible.
>>
>> So the fallback compatible works, but the more specific compatible gives
>> you additional stats?
>>
>> If that interpretation is correct then this patch is correct.
>>
>> But then you need to fix the binding.
> 
> I have already raised v4 with the option to keep fallback compatible
> in stats bindings.

Apologies, due to some other issue the send wasn't successful earlier. Have
raised v4 for this series now with the binding update.

Thanks,
Sneh

