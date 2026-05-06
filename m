Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361B8322B72
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059975; cv=none; b=k+8Elgb/8TOzY2ZbfdRJAHPOsisP3C2xSY1kukC0IcVrwJad+y8DnYx4AjWyVX/wF4pmL7oFcsBtnKg5X5+w5DBxNe4JJqg5aBuNh//LItS+xs56Edl39j13h0ajdY6ObqtJQ7XZ9tBTlN4xz6zdOthYDRhRj+t+Zs/aqavgp+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059975; c=relaxed/simple;
	bh=aCWCeJiNrXPS1VKbBYDxcuGhg0ZqyJcxbC3dVJWs0q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uz6qXBcAd6bcO0Fz1g2yNCEp/d282AHIqLMJPHc3F7RrjWEfU14GAAB2Bcj3fNS/Zwv983w8GoQWwgH1Y794F8ABR9ag/VTZIgXac6j3VA+9zy8xhb/dDKC3TqE/NCxICRAeJWYDxDeWPMRyzZkO3IHW3/HO6O8TUPHX+QlLR4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDDXqJCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxqLbY54; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDDXqJCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxqLbY54"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467tr062427900
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 09:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1mTTk1pROV6By6vVpOchigpFI99l60HptIVVRd/8BWY=; b=NDDXqJCW4GmJC+xV
	ytI7UWkWgs+GHi0XRxzdQcbF6ooKOvhv6eJReSP4MVvKNX1pIEF8PnLHT4en6Gd3
	mZNN34yMncrH74RNnndTZPzVpoNnOjbS/YER28gswTS/mFrXNOjuhEVWdP0SNh0X
	Iv6wLXSIT0jSkUd6t7HTlxbTsJxV5SfiN1B5ueKTLQq+kpyy9Xq8uI1bgAy6DB9X
	BJpP42pxYA/uy2Ebv56VI3lN4TsOAKlSgc5hP50QAoSxjAoHJ197yY3uBAXxNaVs
	0OaT7u3sYoL3dT0hHI+gpGEe7PcyRe9arHTiL+4KgnU6565rz26K11yCevuc83y8
	ihcpHg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01ph0f1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:32:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa366fb79so6284844b3a.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 02:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778059972; x=1778664772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mTTk1pROV6By6vVpOchigpFI99l60HptIVVRd/8BWY=;
        b=IxqLbY54l6IydfoaVJUwJxzYF29yHUEi0SlRGbne3ldV/TnTYGdC62yCs4MjfWkevS
         QqHl4k01SbwY56m4LQi1HMe+eU7EzRfKgQaerjtrEq2H6WsWw1NLMCgRdoVmVuRAL0Py
         Ytas9m9dCzwAKtUlcdT3EzaeBsIVvXoDVuZ3C9L4VIwgHKkqOu5/YJVnoRx7N4oFcEDw
         mradrUcLoT6DTzwbYfSK0wbisXaj1b4XNMnR3efKZtsyWDCSqy2dffR8QA3GZb8hTPNL
         pjlj7/uNZnDolvRlxyJ08X8IaupbqhGjfs/oPjujQoi2fcfEfRf30ycy6VSvQoOX53UC
         R9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059972; x=1778664772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mTTk1pROV6By6vVpOchigpFI99l60HptIVVRd/8BWY=;
        b=gh9tTBv1S5fry6A3bckk50vPOcPzNp+dmpsca883Oyvt2fwMx0U0X3UbZ6pchZHwbQ
         jpvj3KAcCoxY+0ZrsTY6892A3tuO0BdpBqeHQlfth5jxMGNa/1g0yRSBjqtRy0rf31sv
         1c2e70OIJMz9whxs33Hj7QvqRFuK//5p3f2K/Nk5+p4bOyi6Zruu/S8ID9lQSqYBcAgU
         TC9zPEp1eao/srPKDLtg5a0RdSFgrf4GtqGR8pF6Zg7gwx+J8OemRXhpCh2qCFX26Qkz
         PX7JxtL2rv7Tjg0Tx8HkTpKVnfYpOZ4whVadYqW0HpewCPshGR5Zaqe0DyPLbSzR4AvY
         2rLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/rejyyKjU4PCbbGDkndSJDKG3SHccs++gxrQjXbi6sVNyCxf0yqvtchNXsDahUYIyn3ByjYHpropP@vger.kernel.org
X-Gm-Message-State: AOJu0YxC3AcycFqh01qAr/MRJiJIge60Crk0/5VOfX5ie+NpURIaO9p4
	BTK01cBCLcue5X2Ou+v2bK/X/ry4xsNBDHsJ578sgr6eU2XHELbsvfE/8xEaFg6c5HJvEtsRJaU
	8DPBpcsDftc2V4+kNitTJimzAH+ezeU29VekgX08538zdlyqdJZ3NxA35ZuRE/Lyw
X-Gm-Gg: AeBDiesGwgeCBrcdrtBl+vCIcB2nXIJnZ4k4FVj84OBFDIRI5EfHntqL63MNE1oR37C
	ZtrhjSr7TzMJrGQonH5SX5+K0+lb0v8nDG+tfns7lNc9hzLu8ketk+balmpkGv//Q1uj4xNnzMZ
	Gc5UmfBDWV9BizR46XlhmV/J5xEYPQ6EVc39hXyCkskxv6H2CFb4fWFH7LU6dSqKvNyikGUE1v/
	VR5zct3K3eceHy+oSoElNQWrg19yFBmSI4uYqyIWzQbZ9B21q3mTsW69I9Y7oTPkwl/uYoaP2u6
	Gqn8mC5RGqwawEISkD8708uUnM+jVrve2AZO9VWZf7G2XbHTzv9JjS8BINYLeYlc1997XbE70Au
	D8L8ryS3pZJVudq3cPzlpfBKBH8BWXiPHCnudDX+/7hiHsf3vEHBGZoH1A7TEJw==
X-Received: by 2002:a05:6a00:428c:b0:82d:162c:581f with SMTP id d2e1a72fcca58-83a5eb3943dmr2408179b3a.48.1778059972346;
        Wed, 06 May 2026 02:32:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:428c:b0:82d:162c:581f with SMTP id d2e1a72fcca58-83a5eb3943dmr2408142b3a.48.1778059971853;
        Wed, 06 May 2026 02:32:51 -0700 (PDT)
Received: from [10.218.19.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965b333f2sm5895467b3a.20.2026.05.06.02.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:32:51 -0700 (PDT)
Message-ID: <5864c10c-5ad5-4896-a503-c184f4ee7717@oss.qualcomm.com>
Date: Wed, 6 May 2026 15:02:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
 <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MyBTYWx0ZWRfX0kwqAGFIDPO7
 6Vyj8R2Cn9OncgcaU9b0ZQDEC56q06TXrEpTKrOQcKP5S4UC55tWzB03pn5PXeAddXXC/iB8b5O
 2tbKg5JEgayWykKbyCm0JnuMtvnw/ak5Gsat3eZthy6a26vF44+8HJ8W/WGbachSx117Tgi+0lL
 yzAPjBqQx+UoNW3LVSqefY6JZ5CXzC0xF6mzndf2vve83xqMCNSQmdLPO5wXMIoGFETHCefMCS4
 ++uYGqlbxqueZoEB8spRjoBj0UU4BFycPMZfE7actFG4W5UrStW+fpwSTAI9CAMQNATzZ62zeF+
 BelCOV5dqem6/A0nFOSUBVEXPz7z8KIU481SKGIhcFFzNyAxW5j0FOrC4TR3OKWNVdDhG5ju4LW
 82UAzzRZk0OPATVUJ7h8/IElwIe06lAZtsG1xd+EuISFEjheJNVucVRRrmJR32YqB8zoFLaYJag
 8AOxh1eiMe+wtb6hn8g==
X-Proofpoint-GUID: Hy_1joq2gLSKk6TMOWfe360k3_PbteQ7
X-Proofpoint-ORIG-GUID: Hy_1joq2gLSKk6TMOWfe360k3_PbteQ7
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69fb0ac5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TjbBIv4-FJWQbs9x9KIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060093

On 24-04-2026 14:05, Harshal Dev wrote:
> Glymur has a True Random Number Generator, add the node with the correct
> compatible set.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

root@qcom-armv8a:~# cat /sys/class/misc/hw_random/rng_current
qcom_hwrng
root@qcom-armv8a:~# cat /dev/random | rngtest -c 1000
rngtest 6.16
Copyright (c) 2004 by Henrique de Moraes Holschuh
This is free software; see the source for copying conditions.  There is
NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.

rngtest: starting FIPS tests...
rngtest: bits received from input: 20000032
rngtest: FIPS 140-2 successes: 1000
rngtest: FIPS 140-2 failures: 0
rngtest: FIPS 140-2(2001-10-10) Monobit: 0
rngtest: FIPS 140-2(2001-10-10) Poker: 0
rngtest: FIPS 140-2(2001-10-10) Runs: 0
rngtest: FIPS 140-2(2001-10-10) Long run: 0
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=1666666666.667; avg=54945054945.055;
max=0.000)bits/s
rngtest: FIPS tests speed: (min=186.995; avg=280.435; max=334.623)Mibits/s
rngtest: Program run time: 68912 microseconds
root@qcom-armv8a:~#

-- 
Regards
Kuldeep
