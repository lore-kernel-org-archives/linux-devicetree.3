Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAD73BE175
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075532; cv=none; b=CmVWfmNo4MsTUiWuV2zZObatX74hNV1+vKHPg6vzmyFauKTJt6L3uznbsnmTmVUU/V4rDHlGWnC9pTSdwi82bk2UyEWkdSlRwQCVGA1F8ZDKz4z4sy1ZY8nrGAN5fgIwrSS1FWvuo56S71Bf1g4jz7CCW+6XxtURLqni7KmrJlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075532; c=relaxed/simple;
	bh=FnaKJmImowmGqbSAgvOkv9nmEuKFz9Ys7xzTu8ifggg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SvzazN/mWlchWUobPP/8/lIWaUlVO4grlUc5Et6HLISzKU6+JbipU8Nf0uuG/sJMB4IxMPePmxW2Ln4YXUozcosPJfODsaINXCLKFeGM+Rv2vV/XQnEas1hVbUBDoTtenlXb0Rs2wMGOtMWi8lbDwYzOmCEqSgwkxE9stLvIkBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nn9OUf+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cfhk7bqk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nn9OUf+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cfhk7bqk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637Zgra3410056
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 10:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozB8G6UISpV5QQZObgxogT5e+/UOQlTdfSBPoDkLSD4=; b=nn9OUf+HiR6+dHKh
	LyZQgc8jaGGi89RzxRILnPKja5p/O4Sf1a4/mOlmO1nXPH1OBIeHt76ngA3lqTfl
	1fpAUIN79XdkQqeuYrbFUm8z/mIdkE8x699GnmqaWRMFalR0wv9RyxR9kqPlMFQW
	wvLo3TVvQqLTc+UNT/Q6T3t/bYla3idO5VL4bdwp78hwv5vu5B0cOgbVgW1hUoy2
	KzEQFdh+JAO+y7lAcFAXx+JMRRoBY5vkyNER3mDgDzbZO8SW+hUUUh3XnIL60b60
	gtiGoWrxmvIBeYNmdKTpOzzC/U61f6ioFZSa9VCCxqFgjijzb8wCsJNCXsmnDiJc
	BOOjGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u30phc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:45:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6415f279so7654585a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 03:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783075529; x=1783680329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozB8G6UISpV5QQZObgxogT5e+/UOQlTdfSBPoDkLSD4=;
        b=Cfhk7bqkPhP6GgLP9jRc0wHpsFE8X/hj8Iq0IZahNRjTqN84Syp+4c37D8j+2o9RVg
         bMQUuCWN9jwG4XjIOf85BO9HCmS5WuBAxUib6RAyPNxqhRCdvFFI9dydibU01B/lWpee
         4rvGCZq5SXI4NSmQGpf50l/7C8UNInMjwQkYG7R7x6E4xlnQf7IfHJj6i8KUfdwXbK6Q
         7cuVP8K/mdG5lyA9dgDGYtumOeUfSIvz88Uyfe9o7pL1iDc88pSHmBPFmPKJ5voWOkzC
         Ki5n7H7hisviTMLdxfeLZaw6mLj0sOFD9rf2YGqf5CNJYTLcMCkK0PSLkqcqEyhLCkyj
         gCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783075529; x=1783680329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozB8G6UISpV5QQZObgxogT5e+/UOQlTdfSBPoDkLSD4=;
        b=GPNWNXgWKqGPEE9n/ABSl4pPfBOZf85PVh8YecoldTIFx3TFkPOC9etdJYMqF2shD4
         3O+1uXZrGWXmy3dDS+mqVJJTtLIGMCHr4wFtnrAJmStc2tSK/Z4fUbu69uhKi8X1i/2H
         5EJgoRynhQ4cWTHm5dhMzwz/OXQJ44BwQ9KUopMroTggVvpq6zh8yjuk7FllDcYEAgfg
         LdtFub/tXjpAGb+tn1NiF/lU+Nt1TGUq1/4GJgvN+WUG8cs7iJKFH2a8Azgyh0qanqgA
         NqQT0PvfafT4kC9JDvqAlfoozLIjWfnE9yaqCOVTqVzswr5/fDjbsu06E3VZVkMlZT+B
         RdwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9T2JQup5zngthe+YG+nPFIjBUkUHQfjdGkRbQS+KfmAkBLF0T19VHGinVk9w7do6XKvQHSz6yqbAnF@vger.kernel.org
X-Gm-Message-State: AOJu0YwyrCcvke9tCSTARwmJ7+WKgPJWJX+vYVHxX6W0sK5uT/Xh+oPy
	03SHGRVPW0xcIh14QM8wZpFmZ+1R8C4dEmfMYtz+0008SaqD7C8YmkW/D1agGksjUOBHxXZ89YA
	zhQO0ildXOtWM4FpBUafxQkAxJrE2JajnAy+9pA3fpIL/GbCwBeiVTqldIgd9oYRC
X-Gm-Gg: AfdE7ckjlQ/i/f57Tw8DkmWObYGPPTWohPePcmeCsY0aHbi2KJjlGpPfKgTPIbo4LQN
	m5YcOn4nt/6yIIKKZf6tTDvkdM3UOun16eIdX+zAXMW63yWXjLhMQPnGrYrlRkhgoK/SF68rXYG
	mhrMFhLJyGnjSfvC/DVzt/HcTg/e0FUJar1LO2ybYrSUlevVcCvcPhgP3lVjLHclBpVarI8JbDP
	8T+PQd8HzkkwiHZd+mHxgyMVEfcLfFj2Wl+dTpPJppLf5OIkm679RrGB37xTvG51Mm39sRRb9V5
	0FFK8W0/0DQxi12gOKIav51KanajnV4tFJDNRa5QNyCNgHfqOtculqzkPxjQgCdyNYTYeI7o22e
	tDko0qbaC0ev2SzL3pM6IDOY+3bjWF1jAXp0=
X-Received: by 2002:a05:620a:450b:b0:92e:46cd:7299 with SMTP id af79cd13be357-92e7852f4d0mr801162685a.8.1783075529411;
        Fri, 03 Jul 2026 03:45:29 -0700 (PDT)
X-Received: by 2002:a05:620a:450b:b0:92e:46cd:7299 with SMTP id af79cd13be357-92e7852f4d0mr801159985a.8.1783075528877;
        Fri, 03 Jul 2026 03:45:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c52sm268765566b.58.2026.07.03.03.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:45:28 -0700 (PDT)
Message-ID: <d133a22c-fd6e-4f15-9aad-9732c878184f@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:45:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] arm64: dts: qcom: Add SD Card support for Glymur
 SoC
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
 <20260702094056.3755467-4-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702094056.3755467-4-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bb0SBm9EWbszkxMbtmqCHlMAPfPmUeD9
X-Proofpoint-ORIG-GUID: bb0SBm9EWbszkxMbtmqCHlMAPfPmUeD9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNCBTYWx0ZWRfX7yRK0DFDzl4Q
 uC8hi0hcOD5VyHnN0+5axC2NcDM1xDksm0s8UPW++Nx0gDw76PIU9q7Kr2sqjqx/xaGyHdwOLZw
 WpZi9Bdr9LtC74+nDOMxqbihpB79UPU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNCBTYWx0ZWRfXyiFEOMJp/zhx
 WzndGIAF12hlv4OHU+QNniPBTxXcFizEgH3of68eXwYMMiMG0M9+kFx8mvyAzjRuGzQ7nn5TG5E
 gd4cgtMi3Ha3oTWftCHGJ7Jae8u0D7hqN6Ab5I7XH3PDM9FM8jVANbFmWGGq/ya7X6AdZKQ7FvO
 hJ5ve2LQ/dNWW72gtxeL+0Z2Kgt8uuPAwsYoG7ompUExzTBZ4BKie1DwYOP8//FzkgUzEzg+GYR
 zjL9A1nbXTg8V+Dk7edzptytsTqDIdTy1tjGdz0Y3oqT1AhbI2eZok8B/eBsRkbPcnCGTpkfKWE
 UXsqTh85z4RsB/ALG0xWlsdJykgZ2jCFAjNhzHsGJuOzRunkcKH5/Smg+lKdXUhK1hgc3pQEv+x
 8cghPekRdZbAyYySqHKxvDay72ztDbhEJKApOJGWsUTh9n12U0fpy3aDmIFncz6b2YonjpFW+W5
 Xvt4mf6AT33sNK11Rzg==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a4792ca cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FZAofsGHiTNuLk9495wA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030104

On 7/2/26 11:40 AM, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Add support for SD card on Glymur SoC and enable the required pinctrl
> configurations.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
