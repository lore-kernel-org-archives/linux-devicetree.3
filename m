Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E23377566
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098861; cv=none; b=tPM7bPpevdNI//y6DdqDt6znccEh1SWPYciGhb+r1A/S0qMhA+SH1L868ZphMqIRB1bnYJxeAl0C4zx/rYkuS9xJvzZUTbR/sU5BGpm48nyIai170JH0Akxjtkxj9KSnH7Q6IRUCAF+p81tS3Cc/nDGP9oXjmKaplBE+UmEXpDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098861; c=relaxed/simple;
	bh=ejqGpVngTlW4e6yqJhPVr8yHewagRkvbmYi89dpAvRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCl5tmRVQ+jjls1ONBfYUHNChSDJXkvVz0AzDIao2G37cj6shqX0mJBTUcCnbV9xWXib5es7X2D1FVrFTW2j40tosbAQQH9/mSDxgT7k2MYVKzWCrfyCf3fQcQn7AWIxiANiLwjk/H6cZd1hdwMRLOAiDGbLVluUm1M5ixp/+EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdquW7El; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKnccbxN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdquW7El";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKnccbxN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBgH23763396
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJforEV0KzfGf4RTfX0eub6GXgnK6N/IQ+00OrEk4UY=; b=UdquW7ElaHXlp1nE
	jaJe10Viaz2Z2oOme6bu2k0S+6ouGHUfm1uK50PAFo3gtt18P1QPezgZgcWRSHiu
	Z3gLbz3L8JCVqWBD2+cxqaMUWjo3JIVa7UvzI2t8cu6OF7Ls762ooDMNcQzs7ZsV
	SdihhVsYgc74AjZsru4BhhXWwvIOyJY7BPI1jnSYJynRVa7L/xf2hczScn5Z6TzY
	0Br6e2DrOBoMzvpSz+prv3uX4w4cI3DTxnS8MMYc3G+ECLpZ7i2T2Jt4mAP0ifif
	KWRt1vnJ0LKF0vdeI2O141bP+OnWF6AxQJk3KATKOeLREXuHc626DjhDxuME0VNN
	PcKIsg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnetpjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:41:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfe512ea6bso290015137.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098859; x=1781703659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJforEV0KzfGf4RTfX0eub6GXgnK6N/IQ+00OrEk4UY=;
        b=DKnccbxNIStGN/aGFP1rhEmj98bIaaJNovkVof0S5PCipx23uimo6U4KIru4iNV/CX
         U6EIuBcgqYNwuFsgvBHrqWC7nvB0P9ENu0rKaxKkWUWQSuaeSQmT0VlkE+B4r9cYfoIm
         DtuHa/IDTDfNb9FTuajqHdpZppcG7Rin7NqIySoZJWK80jqHRfCltUKy777OAcIDZZR6
         ND/HTcXSg5PoP6nEPGOzMoTDs9FgxnJq9hMIY80FUwGrIej1sxhIP+fIBaNlAFkUVqNk
         1D5tNqJ3Ho65IGAr8m32CybXRPmSf54iO3SbLEeQQjKXWO894aOWqIH++DvVDjQLhw5Y
         XxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098859; x=1781703659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJforEV0KzfGf4RTfX0eub6GXgnK6N/IQ+00OrEk4UY=;
        b=lPHvm8QnOAt1bpKj6R6/kk6cfWRWIB2+st90VR/ZAflSFaJzDx/inyvYlYVqGQhxRs
         h5RILGVOGsXY2AjF88Z1p1aKB/VsWiL5vBjadElRJ49abZAB1UI88gtQoxC8qJNTL1U0
         C0RwN0Of48YXx20xucpW0BLNgS4fGifigrMLG+CCcax7eWmQzqRWF1xu9ls1y9xrv2uJ
         ZFJXzahnfJTynXzDNUEKMIB7s8eGv5Im6SCH108xEEAC8MAV8Ozt/h8BfjCq6KT7sVp6
         F7opPSQmQeBeHWwOf+LXkK4ywNsW3w1PUtw0F44kOdIggXxZPbC2HFhRdLyAfvcktNYu
         s8AQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Hrc3J4RsLF1on9833zOAnxBZgnlZq4Sxhp9C1TspNeYZ1lv+86ANK0SdEZ4nRPwk2QHaYjd1o3e9x@vger.kernel.org
X-Gm-Message-State: AOJu0YyRPlziROyKM77P3J78bknp54Rm+sGjifCEKWkmip+PTvJLiy00
	AFyE5M2nA2ar+5KnMvR5GpoM8vju/xzkKrm7m0eFG/TITu8DMR8yns/g7Mhqb7HltwTD0s9eSwa
	KdgCkz+XHp1ppg9a/SMVIM6eA6wSUuEiLAJj571V8Tphs/B3/8iJnAhDhiykANf76
X-Gm-Gg: Acq92OEwwa7iYuilMRu//DpoOLHh7OZJaF/kv8MogJWf9/FcnSNUsuBaQnnIjyA3lDU
	fUFnpon0NTtmVYF4SmmdJZ5l0Z7jjmnOwRkghjdV30RqyrnTMnMgZ/gVxsPN30aUPyiQwUxFNar
	8AP7WXduugv+hbDFRTAlUN/NLEe4YZSW6Ulovm2IFfX6UMdfxgS7Z0DaJTYia49TyCIYbcsIhj/
	DV33CU6H9/wuT50sukb5Rg3nAYCLGEVd8unXDmHxaDIDvWTxzGJG+6jXmUI1Ia7EYNAUMDRyFmD
	hcgJtyo0K7lxXDRbiFBrVIb+6Fq0ygzg9MyYpu2ugNfZD7nbHtf+MvjwACOAuidkpV0u1CKNJBk
	IVKW43+W6+MEh/yrHC2av4uC5L/DXQ400wa5brXiAnmLFf8O85Z1yEqKw
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr1528744137.5.1781098859149;
        Wed, 10 Jun 2026 06:40:59 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr1528730137.5.1781098858612;
        Wed, 10 Jun 2026 06:40:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac0958b5sm63677961fa.18.2026.06.10.06.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:40:57 -0700 (PDT)
Message-ID: <70afc705-9d95-4c44-905b-a471064bcde3@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:40:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] clk: qcom: gcc-msm8939: Fix enable_reg for
 gcc_blsp1_sleep_clk
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-2-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-2-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9xxwc6hcdYk3nH6WA5qRTIH-Ylzm3BG7
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a29696c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=94LYJJSoxN27RZodj4oA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9xxwc6hcdYk3nH6WA5qRTIH-Ylzm3BG7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfXxl5xRsFhjqdA
 64ZH03ZJYQ9fwHqZ8ql9kDi9J89oiU91ell4seq1Y/hRyZwLyiDrgeMDszM4UbtfbnSRZyiCoXy
 Cim1CBI0i6mdhAul0YzHGRarnNBv3RSVqez7c8BZyAKW52d8hdusQja/B/2oOOX5W5e3pjzLmDy
 x9v6XugCKjGqgajjsf2eyeUxcJrFfARaOIFQDvweP646kc3+6+5Wo51udJB8OlZaQiOfo3nt+RE
 qkhBzfJOTXTeYDGkrAD+37UQklFSFG4ve8xab9UoQGxADWuhpAWVT71nvZJfXqPpX0xGXE+jx93
 y7no8lhygS41AjHm7VvGzBJLKF64Wu1ay7PqlG3g8amhXFl8reORYempyIgL7+jHBAAa7pO0uwQ
 y7yyfOhfQVuTfbrsHL312+rItDEWdxiccyskrMifDRqlgeeeQ0IVo4mNrpt4C66dv+WI4IHiAhd
 uGQI7HUtdcyGk0wK4gQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> MSM8939 is similar to MSM8916, where the GCC_BLSP1_SLEEP_CBCR register is
> read-only and only has the CLK_OFF bit to check if the clock is running.
> This is a shared vote clock, the correct way to enable it is to vote for
> BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).
> 
> Cc: stable@vger.kernel.org
> Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
