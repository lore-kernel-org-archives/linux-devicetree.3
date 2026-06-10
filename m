Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B89265620
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781111602; cv=none; b=kOp5sE9qMvi0IuKpnkbTP2U5zxGvpw6ZdKOdBTI3MjLt5E6xW8h54Ya9uq3jFwLXBKtzyEe9XVkSCWMXWFw5eP9bG4AUizEJJnfAiIuWmU51EegyXd5icGRScmUyIR+WXFFt8yKm4/yeuzUx0xCD6vsrYFsTwEvmlopTkaHdSnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781111602; c=relaxed/simple;
	bh=ouVsz+gFgeFDCZi4BmF8DuQczY/q65vCgfhjidAPCtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMmZfDs/shIXQif29vocEnucnOmS8htKVWC1Rf4eN6E+g5JD40hUzHcD8nppI1wavEpRVv6fBTJYTGOhHVSLyZKY1dzD2x6BmHOAzuPUJrIRCtYiDSMjmSp1LKCsMMsdYEnDeUGsdf81AoeaxDOn1FrWUF/y7Rsk/hPU8XtlvSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmuOQpDZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZMpVnb9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmuOQpDZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZMpVnb9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwnJM104519
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 17:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4svXiNEWhAy5uzQSI4EKwpGO3qAjjZkRf9QfAl/hLJ8=; b=QmuOQpDZyR8bRzGM
	ly0MH2zuD80wFMi2Gp7y4JSaoRThlYrbhr+W/pipWCSpGxw7yvABqFohzSqR12/Z
	+OBrzTlaljKB4hlJuhGC3DgrwVBk9EfIT81DYyBSPr89hJDEaSIQyvl8CQYhXlOq
	rxgpwE6fuguNIQOpx5nkynSWIL0uZ+D9GeM+8vdtRQDOWE6fMX1bJoaw/QCWS6n+
	X3vZzXKrzZjvRFCmRuIuV23uhPJmrSzonBAu4BkTBnOCQBOlyETD/ytgrp1GR3qy
	BYLRlQLAZ4+6C+Ob4aVw9bSqB6AKVno9i9kRZF0E2K9WWDmzLfVbn3sq46TfzjiK
	9fa8Xw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwneurcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 17:13:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2da7fa311so364265ad.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781111600; x=1781716400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4svXiNEWhAy5uzQSI4EKwpGO3qAjjZkRf9QfAl/hLJ8=;
        b=MZMpVnb9P9DrGWmDB1W1cVG1KxnHet7ldux4FCdckGD7IKbaHt86iQ6UHFHlusSp/B
         SH/bbHw8rubpHHYrc6Iu0KsVoIql2WCnA+iDm7l5TMbd7ZkoXSrdejWPJGoB7NzcvKaA
         GGDFfCkysb/H716kybA0PvQOLWwI/cZedcRhcCwS1lrPNhz4/rR/RObGUk5BatgWUcd5
         PMO4DIPSZ0vKZA8AcGJUGZRkmIIcHsDe1Y/S2wQMFrhbFInKn+It3b3411oXM+Run7Wl
         xA24IAXdX5ljd6yIdyzK1iiIOL3F3cjaZsKZJiUNT+QFe76qzLyDTdsfMBArXW7etslm
         9qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111600; x=1781716400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4svXiNEWhAy5uzQSI4EKwpGO3qAjjZkRf9QfAl/hLJ8=;
        b=JVa9ovtDsgtXaMsmF//CEjU1JjoD5D1m1qXE5p+iW6+wVtVmTLDMwK9cnK01URxcwE
         6Lxrj8BmcP9hOZmr8XK2VF/rEVMUSnZRMyNt2Dkfs1bZs23YWYOEkNsR9DJmhwxDSR6C
         gSP1tXedN3xcRoC9N0PyR+t8ZhBeY4A9PNqL9X4ZiLNfal5vkHXPEZhOYyQjiUi635Vi
         CLkoS+gq8rZihLo85jVF5dnYR7uIxNtYr9ovPugWhul03fKO2+673bNF+3txQxGQvaoB
         IfHA4yEhckU1m/8OS9VJ6n2RzOS4xMl0AebBL+n++qHRASdfXx7dJgn9ruLwIylU6s7+
         h6vQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Jzbk1p8HHlJUq9ijFWEXbGH/n9d9YhqPr9vo8TBFoW1U0VylfPGT/X6f/nlJsHr1AXRKzqc41E/rS@vger.kernel.org
X-Gm-Message-State: AOJu0YxgVwSB5m5iJMLQc0DGXmq2mtQ6vDLxPL58SNrz4e/PsRvDvlLq
	rCQBVcudOO0DarQloHPoJhEG/HgkinwjyyDaWSB4cLqaCvDlPJ5qT4LRZpK0yn+p2U7hfw9U0Fk
	GWf8iHM08KFXL28FeVRXWwNTz9HHS1Sdyz1e3VFV3w3Y5UAxaHIsbAYtqz1Ll+p4C
X-Gm-Gg: Acq92OH7SdBNXvgtoAWsWNsef/ocrqSHFJOWAtvmFFP07LgPmxbuWULN0tYt2HCeDnU
	azzGYD8cNuwMAYxBcsFBRBJJEGn5TY9AFt4mxQpvXwMYf9Iq7FLlmY9msLNeuKpzhcprUPO3rtI
	aGlAzo2jnqquGkCItU6MYqGcskhrKiRWjUe0IAMG2OMb2H6plldZ0rfM7OblE0cfYWu11ZGbdeR
	W1V7xZ2aXa3H0FUjWkKvfH9imRkOe8UKJ6PGvzJoEea3WAWrk0IAfywYdZdOwfrozZ9uV/phEuh
	IxYCu7wrGDPZcp1f24dFwUjwSdun+Nz/Aa6KMVzshkfmgLzO6xvqGWWLY27LesMn8+PWmf2lnn8
	Znr27Vbd64wWEktXl/8vGKNUTuO7Old1fIMBfzfGIJDWBfjJ00h+qcPZ+nfSq
X-Received: by 2002:a17:902:c40e:b0:2c2:5446:30dd with SMTP id d9443c01a7336-2c2da73c13dmr2053455ad.7.1781111600458;
        Wed, 10 Jun 2026 10:13:20 -0700 (PDT)
X-Received: by 2002:a17:902:c40e:b0:2c2:5446:30dd with SMTP id d9443c01a7336-2c2da73c13dmr2053055ad.7.1781111600028;
        Wed, 10 Jun 2026 10:13:20 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e096sm256509955ad.44.2026.06.10.10.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 10:13:19 -0700 (PDT)
Message-ID: <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 22:43:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: u_J_jniKs_VudW6xQ-NLxjKJxFy9um-a
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a299b31 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=wot0Jldcyx0dIQi3j0aq2Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=WmjVd0U74ipakLrIZZEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: u_J_jniKs_VudW6xQ-NLxjKJxFy9um-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE2MyBTYWx0ZWRfX+LdsFPZNusSN
 Z5Dje5jIffDM3oC/aHMzL55VprUL8CQB86ZApxlZGKSSP9Lg9dcqh0NPw8pZsNTK+eVAoblSbz5
 KLKs0YBL3oMzUyaBxw5ECfwUKm9xC7Vpp1FpSCoOpJux6uRW4adc8abCvr/ca27i6CbORrRna1R
 A+7uHUE52dGFe9O22rKSXsGWFjAsF8e2fA64n7ZngrS5A2okxDgRPhEpm+WTk7cQqyY16LyEIlH
 8I60tJ3PH00+VhxHAHH/WBtpKht/YVtvW03zsyLFQ0U+8/Ch1OkCIwe9l5lpIMPfvVsOH/njys/
 ALf4JVR2Ph82xDQLE6hQ4mgIvG90Ph4nsk/BKVGPh1Qnw9ktMDPNq/GZK0uMlfngLTDBxRJzWOd
 Afw9DA/hzKLwxgceo5PKn2Ps/j8sWmewzAfJhFFXe62/bAmJprlCih0hY3kkwGZenjwrkW3lDVO
 4Uh4SrTcwnunrf32zpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100163



On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> match nowadays is gcc-msm8909. Looking at the differences between
> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> definitions for the BIMC PLL.
> 
> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> used for GPLL2.

BIMC PLL is never controlled from High Level OS (APSS). These are
controlled by other subsystems and voting should be via the ICC for BW
requirements.

-- 
Thanks,
Taniya Das

