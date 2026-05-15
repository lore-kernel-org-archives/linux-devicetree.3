Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C93B3E3C7F
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835438; cv=none; b=dFvbpnmrEWe5Mlb+rXDOhbzcdAMX3+hemv1E7o+Nd8nmOCMIGFSX9M0/Ay1Qozo5hr8z+poAgfg5YKAIy9hsaOX7TZyCqHGiwWKJipPBq8DYrbEeTMzkCWd3xiND74KiLtGg0/3nfS6T5QI7ze8mAf6buqtaQG+f70Uq7Ip3Irw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835438; c=relaxed/simple;
	bh=ZutffpRLB5SDhN+mUU26V25VuwfZSRqg5Iua8cnMPPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEEw0IikTclhdV5Pc7WAugHFapM+8GdYQUz1G4kBywypL5KfU0kVKKVUCSGFcl/zgDkdItwbd/A4DBroUutrBQwoOH3dgqK4Gcu53y6+pMPHiXsoYPdYQ1xxA2ecaCxSf+SYdiAN7K47R8RcBdB/3+FFk8BFS5qEZxdG36sbuIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOUHPxAo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQb2gON6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOUHPxAo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQb2gON6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Pt6p2676152
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCfMxiflEQa0XgpzXYV1FIJskJxw98fMvTJvf9TrZpk=; b=YOUHPxAot4ra3Ic4
	ElkGH9IGrmYL+dIha8lshBlE14rluGH6f/tYNEwHq/nVVOX2eJ3QouFQHOKTeI9/
	qIwDg5EgRnBmft66xrCAwGjLeXifEUpmq0IWkKw55v9JfZpu4mwDSqXvPKn5ljeo
	Cl7MjuP5uyTNTC/46ooYGn410KKzWc6RG4x+8f9DhZIYQ/fnEbt3PMKSurWoDaDD
	jlZnEC46NpCUrsUh/EJunQ84ZfOYOXGconAu5Ku2fprUJ0YMI2LeX4nDjFCVK9B8
	ZVg8lx8Aa3dx8Gi9AK07RDkDap016dMxCXSVFWErTtAAdz4ztrxvFMXLtTuLPXfC
	N1Y2xA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vtgfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:57:13 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cd22ec862so499090241.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778835432; x=1779440232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MCfMxiflEQa0XgpzXYV1FIJskJxw98fMvTJvf9TrZpk=;
        b=dQb2gON6FdrGSBp5wXrYgo+etvDAkL69W0o7GhwtqPg52C2SUdyzkT5FvZCT65OasN
         u2HrHQYevhZzq27saq+F+kgKxL6dmqKghJq3uR2ew0IW+xZS8/vjOsdL/n8HuiDc0zl+
         gafovvjIywDbopD4NXUWWAWBl/O1D1nRocq4fp6reao80EF0jBOHIfuRmaPIZjR11IJU
         vUBmx9D8LIDIKxbW33o5BeRANBuil8huZINpfHAQnIle7JiWJxWsTK8MW4/vavtGZ8Ii
         IctA2gtYXX2wdzmtQjIT6HLlwFC0PwZuzqFfYtV3gLkvwhSB/XcmCgcxntzt8vB8Aqbg
         mBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835432; x=1779440232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCfMxiflEQa0XgpzXYV1FIJskJxw98fMvTJvf9TrZpk=;
        b=GDa5uhyhbdO/hO7FcdHO0lYMaQDLANI6rpFExvRAS1jRITWnwZmK9DAy8HH5AROzEC
         ACoTa74sZslfkCly1JleCMBPd9ByXLJMuA03Sd38BUheNc1XyrZ1E3FHDiUIOGB09jRf
         L2quk1LkgdpnOtQqKT5vHxC9rvasH/5Yf3KHerBwOT7YKe8UAq5pdWiOIYXZmsWxcigq
         BlFHB6bExy/isVgtODSLwdHiBAXN5eYZawaKwvzds96oEtrJRubUbRtBhgAa+hqs3qRH
         1jI2DSTWkJ889NdfO8pcOfr7xpXw/4koIV+oluYe2y8/XifFBccGalJtyyy1J9gbXsxa
         8QEg==
X-Forwarded-Encrypted: i=1; AFNElJ+0sP9lw0dzrAamL3oKCOlUla9wyujqZWOrX7A23CcHKxwECsqzK89bn62ImpTiKVzoTNKf9Cw9T9EO@vger.kernel.org
X-Gm-Message-State: AOJu0YwWcWdp/Rto+BdO2QXye2/Q6Kb0sD06Oz+nh/ecldOqD8mJgeQe
	ojth7RsvKNNbw0zSEp2ImMJHetmweTNkQ2ByUsnV8I3Y8u8IBSZOpz6JXiDy1leHTuhJBg8ihi6
	SNEMYM1394pr0JfVV0Sw8CF3x+9n8ZgTk8364/hrhGGOnPq8iHglnZdG7Jt25zu68
X-Gm-Gg: Acq92OGkab+3WaK/MVqsVYutM+r5VlE7lw9HTxHYMaaKnCBwX/MKTwjbEEFdTLZe+Z8
	huzpzB7v8UiOz8ckuCxpRobv/7XHDpSDusU32tsV/QfpEa1QkwgOHwv2WgCB2s2q59ia7yBzJbB
	URgUCLDiCL4aVX+DRUyFNs17aBjpSHjbvMNgGvODWD51UM6yrqNqRe2NmpZtk5NAApfcgonqfkK
	NJdSNO1yj4t/6ekGLL8BB8ah3WXs1X8kpc1tglexI84wbTEiKmR4E9dxAZeuzd2Q7KE2IBwBR7X
	iuG8/8QKbPA3AhQxiANjV8id0Nf4qKwqecV37gZdjXWUG+eFnhubu/lldl7FHT/T25bmiBcirKN
	j6ZszIxwpgaTUfJpszi0jkTP2fRwgfR9gA8zhLFbnInryZV1V9vtTKaNvhYnJG6KUh9mMzR/o10
	8Phj0/wdVql0Cu0Q==
X-Received: by 2002:a05:6102:312a:b0:631:bcfa:39d2 with SMTP id ada2fe7eead31-63a3f898767mr353620137.6.1778835432446;
        Fri, 15 May 2026 01:57:12 -0700 (PDT)
X-Received: by 2002:a05:6102:312a:b0:631:bcfa:39d2 with SMTP id ada2fe7eead31-63a3f898767mr353615137.6.1778835431947;
        Fri, 15 May 2026 01:57:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c28c0asm199971666b.17.2026.05.15.01.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:57:11 -0700 (PDT)
Message-ID: <e0180bcb-e8d3-436f-95e4-2dad13ba18a6@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:57:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: eliza-mtp: Fix the debug UART index
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-0-05814d24f4cf@oss.qualcomm.com>
 <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-1-05814d24f4cf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-1-05814d24f4cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a06dfe9 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=29xFfix4AnVnQwLTjrEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MCBTYWx0ZWRfX7pw92yCl1GZ1
 7em4WJY2Ws/bYm9LTu3zadkSDQ4yRx3kylGKZ70tzlsLT1ThDl+nHRLxxVp26Dp0StdpGkcBmGR
 3qCp3hpnoY8oqm5T3Mo2UbmaCRrsEq7gDwFn4WDPO5ygp3c5PjeTa5q5KyHuHTU6FhJ9jPoW6Qa
 3199AlDgynsY4GrAJ87P3n2C0ArkehA7/Hvb0iG9OMfK/nY5UcrGqOqnmPwlo2aUAKhNwEm1FqG
 JRBvkPm0dUl2c6w2uXZMrsYibIgjMskyNt72hqKlCcd9zVzMTUuajt3NlBnD3gJoVDSM5Q/D1ey
 znutJYmmirgDFfW7RE2b51T5/7sHJhNiBRFKWwfn22EsE+BIKbHs/wC/F5PCueElyxBC/bUojiM
 ZwHMcOk7bj1o6VCjD+VPJZzqtbXNa9Ob5IYuDNJcYOH96MLIJgqvh+2Zsf/wuj/Wu52t9x2n8Vp
 cAxJDCegh1a45H1zVZA==
X-Proofpoint-ORIG-GUID: HASRdXrZDFOHWJrbhEbcI8vJIYPQ-VVb
X-Proofpoint-GUID: HASRdXrZDFOHWJrbhEbcI8vJIYPQ-VVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150090

On 5/13/26 2:33 PM, Abel Vesa wrote:
> The Eliza MTP debug UART is QUPv3 WRAP2 SE5. The existing DTS labels it
> as uart14, but the serial-engine index for this block is actually 13.
> 
> Rename the SoC UART label and pinctrl state to uart13 and update the MTP
> alias and node reference accordingly.
> 
> Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Fixes: 2a5d4fc6f3f7 ("arm64: dts: qcom: eliza: Enable Eliza MTP board support")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
