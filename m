Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B33E5A18
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766385; cv=none; b=T5cA12KKLp5pl2yW+ZcKMa/SDU71p3lG+M57ZMuPxBGQE6MT8Y0ibALA2WRH2uf5I5D2JJksH0CAN78lAYx/8mnkDdGKYZYr6WWkT1+Za97ZxdCWM4Ds9SWmzWS2A6Ae26ujIZFVSPVHBiYPSprCQ6wSUimx15CCuNfGfiGxb94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766385; c=relaxed/simple;
	bh=VsA9lueNMHM48F0fD3xvnEuJPObZVOCK+bsvecXebxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWMs5/U68Y1xYeBhh2uDUerMASXr8fQb/GQz6y5VJQbU4xc7wzOBOkjOLusHzXNbx83c8KOTrO5RB/EErWsypsTY1oMd9ZPbHcKQCJHaQMMXDJsWy9FUACaLft6oS2gdJXeiMvTnwk/O3RYtlkDBXE37lASFrMD/EW1euVPIHi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elNFFXFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vvamf/y2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elNFFXFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vvamf/y2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeV1n2713286
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cug8KrkR2YvO8/2ON7zyAWQ10fFSToTK7cXF0zPI/zM=; b=elNFFXFlWruyOno7
	FNmut6yTawcSU1LqOR4jkhVWuoHyVzZDOyq6qWfS04oCX9QkukdOGZa0fdqpBA0d
	Ec0aF+SVex92CZE1PbNM9WHWbUY/GR/8RhpwPVHfJmatYgtqiTYRcti+V+HbYVGl
	bFvBSnBalkxxLmg1lmIU9zPz3gVkMlSmkWJIGJ1l1F1wuU2jkfA2zVQOrsyi4RhA
	JoS/+K6VLqvl4rjB1A6jDFeTdNwz+3GD/v/aFzaz3vpZAo/DciNdnU/I3W7hR6rZ
	qyKdx2ySvRlpRPVkrxhkAE5xuVZUSKH27B5fFGqV5coSOPpH0OHtA+kISKk1XQ8K
	OAtbTw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v89gbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:46:15 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95ccc6c5b49so314815241.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766375; x=1779371175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cug8KrkR2YvO8/2ON7zyAWQ10fFSToTK7cXF0zPI/zM=;
        b=Vvamf/y2AJqwgpqD5x+hx3XQetk5CzBeuybCjx788P3EN1sgV/hE0mqyi58EFzI8jb
         a4QHwGXk7gLNlhvBEJjRp/r4mu5Q3ENwfzNASjn7xKkkAUNS8wRPBiFG4qR+LzSOH9LS
         dhphZGZLDfG+VFNMxgRb5Vo7XoknkVxm5jUG9hF8NPxvBjre/psKvNaygBZa8ZiG6zi1
         qkCfOVovAXvYvwvPiC+7GbMxMtNGQEe8PF/QjUTNG0nqUNzNenfnZR+LblDcNPRtwrWQ
         FSt//henq7suowuOww2rbez1Y1ya58pTe+sC4KEx1Kah+As9mOynqvlOl1BNai7VAN4o
         upig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766375; x=1779371175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cug8KrkR2YvO8/2ON7zyAWQ10fFSToTK7cXF0zPI/zM=;
        b=W0zcCknVTDFW8b1kggnbErB+/TvAlBOl/c8AnbDFbYVWG2iropmpn64gT1DqcsIfgF
         sJZhjrrCJA+lPhyVwLyYJEdXWyVNjfLfXNjS96QjSKbn1Mq0hIlrJt2ii8Weg6WZSUCb
         VQwE0+yVXtfhlK+mTuafZ4wBGM1FE9PZSByN6umdbCYNzX53248GudDSSQXe18CFP38v
         n7CpIlxdMm1TIRumWwmy5NQ8MPD2pN/sWGnl866/M/cH/oRPN34PP7gRAmKmoy6c6rXI
         /O5NViBSABa5VUkrRtm+CnISbY2jQm+GJhP4Uu6/dztj07FZgVSoKGXKXE5c7E6WduWa
         f8+A==
X-Forwarded-Encrypted: i=1; AFNElJ/yrGq3xr/ChNUt7D/fRNHm6OgnHfHZFofYNVZGO5kpsknP5aQcd11piLATjttxC97+GqBY2FdNjZtZ@vger.kernel.org
X-Gm-Message-State: AOJu0YztYg3hMFlI56WHrfkGEeMCwZTIyqzwaVDkeT22h04XMYbjTMfA
	6UT4l42wrqaJmPDrTQT/WlB9wCChnf27O3SBs6qJpWaefnNlyfMHFRnhjUQfPaGgnsgfuYDdPzd
	BCfuh8LshEqqhdvumWaxZ/Z60cL4A1NizYYJwCbhoy0SpOL9hymITLadOkFoZUAX1
X-Gm-Gg: Acq92OH4TeWAVPbJxUOraZlgFKbD8lTtV7FYccM7WbFtr0TvDaIDwuFy675fjjpzS4x
	3NW1ebywwqkzOoXSWxzeMlwOSCXSl2i0vrzRoeC4a67Xo+5Lj/wWUUGU1O/MBfS5qlHpfOSiTWs
	w+pvm8SMnhTEv5mlHQbgHxChC1DYDU/J0WcvWnGhWO521QhxOJZGAD8EFfPw++DAW93ee0K+Fzj
	W9BBhM03IPwfUCU5c8JwZrrzbLLPZdk2lUSqCvZVPb9WyBb+NA8coE88KnGWbOW52MoCW6zkKiX
	8JQ6HOOCixTwL+UPpDRYI3Xov0Un8Em6o+5I6V40bP0O5NO1o6L2Y7xtt0u6EEpuFv+6hwmyC/7
	HILReGW3KveO5Kb1440Ew9zNJdXdqHVWrl9N6926VFVmhpq+28waDp/DL+rPLJ8+lIvaBvEfB0P
	XmqQs=
X-Received: by 2002:a05:6102:3111:b0:636:c122:8583 with SMTP id ada2fe7eead31-6377615bd93mr1142083137.7.1778766374921;
        Thu, 14 May 2026 06:46:14 -0700 (PDT)
X-Received: by 2002:a05:6102:3111:b0:636:c122:8583 with SMTP id ada2fe7eead31-6377615bd93mr1142065137.7.1778766374512;
        Thu, 14 May 2026 06:46:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c5497sm501819e87.57.2026.05.14.06.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 06:46:13 -0700 (PDT)
Message-ID: <4b3da6fe-a5ea-4629-8f60-a23e8cf6ab4a@oss.qualcomm.com>
Date: Thu, 14 May 2026 15:46:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Georgi Djakov
 <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-0-13c03bc890cb@oss.qualcomm.com>
 <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-2-13c03bc890cb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-2-13c03bc890cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzOSBTYWx0ZWRfX+LrSmJ68H3e+
 8qYl/a8QOTsYAFvm4t+lEHfN7GyDa3E1cI2f6dROIWHfojgLQ7LibID0mTyPNGGkAOpnpQFHRjT
 R+QX3y23CO9I1tPvLc7uvD1nAq9AQRAGcSMyHXjBPidm60um6a58Cz0hRC4Ajf8BaJOL+F101yc
 BEUi2daSwr4eYpKoNTmY9GJXUWVUvqnpeClVX4lsxg6dCZukw4scKg4yKnbTuZOtD6mqjU9PPQ0
 Q9mATeTLb69a3fSF+qm0bUHvZkVYd3/DYjISim0cZ5HU4dA9UNqXGWET4Xodjm4D5KWIJlHZ4sP
 RI/SJ6y+2SNHKLRcO4fX7QfbfnfbghzpElniuRRcp4G1OXmca7CxiKh3zHV5yJlXKt9zAbQG1Ao
 DubmvhlC7celzt+tq9mOgwYpAiemblaWNHrZpc+4R367LKg0GAG289SxAOeVkC5bYegKHqCEsKW
 WSZLwvC86n0WfjBn1kQ==
X-Proofpoint-GUID: KMGlwtK3Xtzz67DCXhrhyGA_bbasNXTw
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05d227 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zvxfrTDFQEmcjWDhNOoA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: KMGlwtK3Xtzz67DCXhrhyGA_bbasNXTw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140139

On 5/14/26 3:36 PM, Abel Vesa wrote:
> The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
> node. Add qhs_sdc1 to the provider node table so SDCC1 interconnect
> paths can resolve to a provider node.
> 
> Hook qhs_sdc1 up to qsm_cfg and CN0, and bump the corresponding
> qsm_cfg.num_links and bcm_cn0.num_nodes counts.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
