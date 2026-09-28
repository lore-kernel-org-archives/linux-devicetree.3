Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4125949552D
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589637; cv=none; b=VkK3yrEYZfEV401kPftFhoMtuKEdY4yYzEe38zDjFnAEgjLjKQlmzr8ITgp/B3Fly60bCCgSn1Y0cE/JA82bEidMecycpi/Z0gonaNUPDqORYzSbkWmGq97NoQ0n87cr1hHsEOYUkbI6mIrcdvumui/AWvLJH8nXW7Zb39AaGLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589637; c=relaxed/simple;
	bh=+kKJYvjXri7s6v6L5H5Wt8m/tVO6Oh5w8G3Nmn49fT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPbYZbzBhHYti8NRsF1XjIN71p0fKdXLeFV+tyc6L9K56oH+RrT1SAYwtLEAvkucgNeWhsbN1c4cFeru16HLdrlFQwsGJrCxBw6xvwB9lZJpnYEkj6essNEG8v2a2fcyR2Z8R+cR9op0ve2eVEsWl2/cp3nZxYPIYBIG3JllC04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CC/R4dIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHzkmOkf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CC/R4dIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHzkmOkf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M342322484
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRdl2ImDaA9RyrSIRrOpGmVshuJ8L6YSb8CpnEqxuPg=; b=CC/R4dIT36Ts/kmZ
	aFPJgXKkgMzASCZhR5udAfQQ8X4ejWDXhP2P47BCFmpHSBNkTGcXbyO6HSH0uglG
	zy4O2tee9jDsrmf+K0mW46ib21o6fMHg+h+NNwQcQyKtu5Vhv7fGymDm2Gy4tEjy
	uctOwm5uePi88dcHwRpUHMsKl7vg1n7V4fIU+kVqeYBfRGtxutV2PBjiS/YHffNF
	W9EGai6olRns8mVXACRbOKtDxHOKJYcus7w41wMLQA10xWITFgIE95+eoQdaQhRG
	TVivCNufXCOerQ+L0VkfJXswykf8UNbB3p6re2HpVLM6NXOdQP81AyyxJe4ILMOI
	7DKWdw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq1m5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:00:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91578e96164so16622566d6.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790589632; x=1791194432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRdl2ImDaA9RyrSIRrOpGmVshuJ8L6YSb8CpnEqxuPg=;
        b=QHzkmOkf9+BIqaHdgAxFEjieU8ys9AZ7FN/lzmAXJITs85VnECGCAkcD6AuPUPlOqd
         xOtSwezrum48maMJrFqQz2ALLqSVqwJxlIl73MUndxvcaINAcfu1KRR1R6VjOKxYlbhG
         17Gjea80TEmcbEMoNP0rqhDoX9qHcTjoJvOORfBtrBwr5cKi+vGAV4euamotkMCuvjD+
         2g5C0ktHhitW4wCoob93bMtsutIOgi/nO6EOQuK8dGi5EQ1n9QYG8JiMdBsqzWH4RzYl
         yOhg5WPwLmbMeoz7Qfy9DvCshzd0DSUfF6HTQn5wWfX9cR8kd2wb+S1nHiXfZdnR6iFV
         OFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589632; x=1791194432;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRdl2ImDaA9RyrSIRrOpGmVshuJ8L6YSb8CpnEqxuPg=;
        b=feZy8dVojA2dleYQxHxM0rbQKRJ3KfuWwWB+v3A9nTs2GtBfiA1PF9kzIKzTonfI7J
         Oqn9h22x2awUd+UdX6+AaXy5SyGztjx4pO3qd0gjSkQAWaFl4vJ7HjJky7ai+eTrqtXa
         zoa9n3Ozp3/Uc1u2HfQnthDJkkxjAu0SM3zBUPOIYU/sRtpFc6lAmW3d+Z99NmzsLtPC
         VmmKxmLETYyEPJUThPDv81DjeFEz/3YPTVOCs/RKb1UVp6Mf8KAVhwY8LWS/cGr6Viby
         /5oNVGiDwbXB6QcGLp3VklW8GB1Tpum6SgXSJM93biAkVgsprN31YIlTOvShH5BuQwy0
         x4Tg==
X-Forwarded-Encrypted: i=1; AKwUvByQC0dqjIT67JigLTOwOhoKvauQzXjRWYmzKx+GSwLUVzKGUXnr2IryvsgbEKEaBGAQ0KSoxri4aVB9@vger.kernel.org
X-Gm-Message-State: AFq9FYLQxyqLEfxvae/F2OD3iybzH8kZxfccwfQTnXS7a4MsDgDFTZNm
	2RkivrDWeWwvrS5cBAFfEpV2967atGwp2Zg/0+KNC2jDTQIgrnc2cF0uolkt8d4WPmCHguNBiOz
	TY6cGMqQc51mOUvOmg/ENN3fKdRpwLrunZO/GZ5qTi8k4wgO8vKizUua2vLVEAFyJ
X-Gm-Gg: AYBFou0xg6LJ6qEMaL3OytE7HJNxAdQ/4FcWFoSR0d/I0NsqAZWC3ahYInLKS75NxtH
	mz3b2+tKRONVT+lLcDiT43xP7vtrVG7/cynT/g9AHV1QhySnmZLhJ2DbehtL2MyU0234mZp8mIM
	5JRnp21V3zMU9XCdl2zWHsy+Anc/WqJ2phHFefaEPKKpok5SGBNlUKDCkndTycGzzjOAHubT6Oa
	YU6TKh24T+/+PkkXBC7TIw2//r/iXE7hzBHrHfMY4SUFYf7tSttymZ0D+Odo0uR6N/Qn3YaHb6T
	9aXcnLJ4sT8fP7Go32V2/617NMom5w4JUKYgjgaZpZ9BaOiE3yEGNcr3zBmXfvkH0+et020Qpdq
	vvevWQ4lo6Ca2P9fnRwWWXfD/IQ==
X-Received: by 2002:a05:6214:1ccf:b0:917:7e2b:d732 with SMTP id 6a1803df08f44-9177e2bde26mr4360876d6.21.1790589631549;
        Mon, 28 Sep 2026 03:00:31 -0700 (PDT)
X-Received: by 2002:a05:6214:1ccf:b0:917:7e2b:d732 with SMTP id 6a1803df08f44-9177e2bde26mr4359726d6.21.1790589630615;
        Mon, 28 Sep 2026 03:00:30 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-915e7afe81asm21547916d6.6.2026.09.28.03.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 03:00:30 -0700 (PDT)
Message-ID: <b095b037-ae76-4b0e-b73e-241e6d638764@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:00:27 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset
 controller for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260928-nonchalant-mindful-goldfish-910c9e@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260928-nonchalant-mindful-goldfish-910c9e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a4FUDkBG1Eb6DKqwYef2KOrUDIVZFl1Z
X-Proofpoint-GUID: a4FUDkBG1Eb6DKqwYef2KOrUDIVZFl1Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfX+hbmxtxQODI+
 osLok7BlejMYBEvMkIejXKsfLGswuMi06YYijKrXgv6Ud3Y/FI9qYAe+flY723xAz7KQBdFln9+
 +ltuIRjX7KFZB3ZuWsHHDvCLinPSxBs=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba3ac1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ffBAxg_qJ57NiJVD2GMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfX/4jXbMNLdRis
 Bu6WM/ETF+TLEKReFcwFSb48zUKHMcf5ReLPZbht7bBQ2IL8gdFBLdbzbEUG83l2wz8Q4kUk798
 ZAQgh4R0+fwUwqW7MtXZ+2znJ2Ilm41K+9YiAysiB96ZDsF21y4/swxpJ/jenGvI433wFucTvpr
 DBlfCHs48ZZqVunCUw3kKOg2KduAbfiJv4qZlXaQIjnygY/R8ivrsHd0sV3giEetCl10BBMb6Xu
 eomGdUB0FZY4jEjJcirGjvxr/F6401BjwyMhEVUMNOUrCOlD+YhRNMh3sXijQhiEfaNygOvnpWu
 LSuVuEmGcqd2MT2Sp5QC49y/1+Ib7a6BUC83i53I93Y17B1k7dlaDF/To7xwJCQWvmH6DUciz7l
 iQ6Mqrom7YmPQuiISOAKZCrBHNgbgqYSWgIZ2ShZWkNZVXA5mSZ0W3rMGfSph2PvS0d5XJ7zMw3
 yLDIqg8ArwPo4jMhThQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280039

On 9/28/26 10:59 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 22, 2026 at 07:44:22PM +0100, Srinivas Kandagatla wrote:
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm LPASS core and audio clock control module provides the clocks,
>> +  and reset on Glymur.
>> +
>> +  See also:
>> +    include/dt-bindings/clock/qcom,glymur-lpasscc.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,glymur-lpassaudiocc
> 
> Binding looks exactly the same as qcom,sc8280xp-lpasscc.yaml. Just add
> the compatible to the enum there, no need for a new file. Less code to
> maintain, less possible mistakes.
> 
Yes, I was thinking of doing the same.
> Separate header file for clock IDs is fine, though.
> 
Ack, Will do that in v2.

--srini
> Best regards,
> Krzysztof
> 

