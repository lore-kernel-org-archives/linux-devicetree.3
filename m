Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDFE3E63B9
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095060; cv=none; b=oKsvcJO31d/XCsH/6rWsDEok1eXnWZzW+69vXLInFCiP/TjAapeo/u1tWr4P3majs02xJjDgNm7/S0t5BHv+eY46zI9HeH9grNlEi3SAeWAPH72z4kwO4EvKgkhePQu3aP/TUDuZ+Udk/n3Rwjj4KpF6Fthy27V7Skg5trDvdPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095060; c=relaxed/simple;
	bh=0rroTxSIhJRlFSMdde+csAe/MAZIchnUoyYhy0oc//0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swMro/je/UmOGVL7YT0ONHsmoPGXh6ZBWuEnAmWQT9rT/s5TDK27HaIBAhdZ88s34uh2xas23ku6FRPFMPVsztf4mayGGZna4HIrqyefHL6CxRb1ksXjInepOucdIbn1mK3n9kInPyfLY9x5H0R9w97FScA/lgrdMwqV5HL2e5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nU6CK/r3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijCd6pEe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nU6CK/r3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijCd6pEe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I73b0R3838482
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uW6M08hd/qMGhs97ve0wfXDkuHjsj5GTkJq0CacMeNI=; b=nU6CK/r39qv+phuV
	EdrsrZcaia/ygVUH5j8RYZ/8V/W9wP9JlTpa7qCmGjCJNo6HliGo3LO0lvzlpc29
	BRo9imEE3ZdMgrIcc1oxg6FjREmCrc7E6FtArDNn9Pu11PxZjnPF7vyg0hljrqFb
	VgvMDz3TQt+xImTX/HgJ/m/ybWMHb3ExTjde6yfsV6bv29qa16LkJsrXDwGm3AhG
	GudBDnjV3xO1e6BkH1tRXL5zehxs+s50eCtD6086epLO2whg5pvxh8w8vBZgerGk
	XAdWvxtKRruJYjvcT19n0N3osz70gb85LBR0AKISq2ScJ3mMCPjbU2U9nQu+xkax
	AM4jMw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7whbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:04:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e429ba4dfso6607401cf.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779095056; x=1779699856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uW6M08hd/qMGhs97ve0wfXDkuHjsj5GTkJq0CacMeNI=;
        b=ijCd6pEelNK6zAo7GeAfpoFNgx+DMd6JhmUsBv1fUecR4E298KwFEcRnxCRm8DJvkf
         xMrFb6M75gtKwzYfNGTI68GGOaYpR+BG103w4uG2DjLN3ArGHOiMeknKEPV2YPDVFU3A
         FziWYsWHWldoMiw3Fpmu3P1QNlZgnjw4a65byocQxUYOdRsG/Gz0SmUTKdKmkF4CO9Ib
         uEJm3FBjta+lxHYihrWdDtwhQT9j0xBEF2xRjRH0WwfRkHoDrGg6tsO9tMQ1d99bDq++
         +R7X2Js3lrp3TcUnBjKFM8Fc6vT/6mmKT8dMBZiGwv4jgfsm0CMzW0E8YjvLrXKWJJ8a
         z95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095056; x=1779699856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uW6M08hd/qMGhs97ve0wfXDkuHjsj5GTkJq0CacMeNI=;
        b=Q4KxJnhAU9HOYiAR3jshoTc+xgsYhfBslY+4CoCabABAlBw2hswSRjIpAS17/oK9a5
         f5TIEdQFV3t/3cWdKkKDLq9AOkBcVbYqj3Uz6bR0c0xK4EWa8cHi7bfmxWCRJdgigTat
         LPuJFeaSQ2+nNTtCje4mq5c2tzZk203TQu6cfvwLtZ1RbkoeVfPmez3MpDNpbdkK8jBi
         4OQubbwrf9p0A/8YvmqSCGmRXcIDRAHElYSMsKqONjKB9C+qy0lFQiPAGYrLpkhZYgxQ
         l/xD2mbyRPetU6KqRKkEW1L9Pp9UXpU4fGoyxshtAj64Hq3DSIuSvVr3xSCs7LaVE85h
         6sgA==
X-Forwarded-Encrypted: i=1; AFNElJ9iQO+o6LkAOSlqQGBK+EJEWPYUHFn8Dyp86VG+Qe3JWw7nbUaFWQ6hZSb0IEddTiMhMQOVQ2EnQwDK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsi9Z7k/0FFFHIzJcLn91NWjl4qNE2Z+RKpR37Wfd5aG1k+GYj
	83ob26TAeDiOtQE1GIt1tFDkisxBhSL6XAeZ+mN7KdKXXfaLVWOYH4ilnuRoB+8wBFZ+SsWOqnl
	Y3ATdsMwapY95RJ+PvHLQQ95lOb//EjRqZ+J1Of4eT6B2FBmEqbdAL24meM6+tVE+
X-Gm-Gg: Acq92OFUXCKxLk2e78x/Xh4NsLQddN+XdE98t1tIhyxFAohYYmVqkcawzjz+u9C86o9
	gOBJsoMNynL8wza3C3NrikpleU0qVxwV2Wong6QoEwCvHAT1DZmXAi+891cVc4Q4Y8o928UdvKb
	i8tUPfhyAeBZDwYScVZA5nDe/bu4oCK2d2DqlfDKzcfGGZSTkpZlZr5WjN0+62Layno39ZxKLtm
	ELWBvVhzKfPUeWTepor7gHwOm93EZC8i+iM5JSK2bWVxtcIuHK5E2F4+X3YsD0SOj9FK49vVEae
	tKfa4D5MLI5YjVL7ZZZ/JfJEvbvgXOoqGhnK4vthHRXdzHrGfnfhVMX2xwM1ic50LXyQD44nZ3i
	j1hA/HOVnkFGnQNLyg9Haz8giypTtyyVs69RgIYymPTOjozUqPH4uXWqPIuQfbHZ5PLICME1uOX
	Qy03w=
X-Received: by 2002:a05:622a:1313:b0:501:4767:a6f with SMTP id d75a77b69052e-5165a1ddf59mr137537331cf.3.1779095055998;
        Mon, 18 May 2026 02:04:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1313:b0:501:4767:a6f with SMTP id d75a77b69052e-5165a1ddf59mr137536931cf.3.1779095055395;
        Mon, 18 May 2026 02:04:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm542723666b.24.2026.05.18.02.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 02:04:14 -0700 (PDT)
Message-ID: <0b81b4e5-37f8-4552-8474-8aa184887d50@oss.qualcomm.com>
Date: Mon, 18 May 2026 11:04:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI
 and LLCC nodes
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
References: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
 <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-2-5ad3da81b9d3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-2-5ad3da81b9d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4NiBTYWx0ZWRfX8iOBCnRcRwZe
 lmg6pukiwKCAJOSYa6Myq0pCYxYOmGdhvLNQpjPZnoADRar9Eqkx9KI4C9zhKvOlrtykALMZLS0
 gI/N6DOdA17W1UF0F4JDCKSPcGvBBNXypaJpKmyCKzV/iN0n3YSqy4Oz7mlceIvz2Xb7Op3t9GN
 3z+sGPeXR1pgWZ8T3TFvROTPYgFHsryy5NRDmbUgRVSN34U3tmLcxTnY/uXClnLzCu3CNH7uRYK
 1/2w6Q+WrCyREPN1HUan+g1lXhedmDcNMNACHatb5vHr3KY7dioGKZ2TUhNfsL58zUwBVa6g5Xw
 3TUWBwyo0QIBgOI7hxyss2PkJqM8YHi8lj8xZK2UHSF091cmkdgoCx/Wkh9wzJkM5LDLKQlI5+g
 opMci9jHqrM6YN0w7G044GoD9MiBQ0xmZLCRnulHhCGqAfgWFWr56hc8+0yG162i9ovVRF6sGIk
 HBF19D0mcIwH33ZbvHQ==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0ad611 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3AismlQB8zWP_hVqSwIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: GUXtG5NjxceEcUfNry9MgiB5uPfX3L_h
X-Proofpoint-GUID: GUXtG5NjxceEcUfNry9MgiB5uPfX3L_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180086

On 5/15/26 3:22 PM, Abel Vesa wrote:
> Describe the missing Eliza SoC nodes for the QUPv3 WRAP1 and WRAP2 serial
> engines, add the matching GPI DMA controllers, the SDHCI controllers and
> the LLCC system cache controller.
> 
> Also add the TLMM pinctrl states for the QUPv3 serial engines and the
> SD card/eMMC interfaces, plus OPP tables for the SDHCI controllers.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
