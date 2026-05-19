Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFC833688B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191504; cv=none; b=s/ImgTn+qG5KtVj0OZpuxCgUdMHniRYuHbr4+RBfhohxUr9406xtoQRuD68j+x53HJta2JFcztzv6AKAyXPSGJ1fp2ShrM3d/RgcztDMDcGLx2dSGp7W9JMAKZmemiFm0wsXs0osR+ESr6bMD2vzM1p/XcvoFf42apA4mbR+EmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191504; c=relaxed/simple;
	bh=8886y9OK7rLNEr2zlaE8SlacINuysTCFqKQRD3SXm8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFnQOS9WPqHXpJbxZxCFJzybgnGzAqT0wFxWi/v7/xyyWK1QKEIqxscs31PlrA4hdJ08UjrivU3KaHKA2Ksa66hzWkOf47zzrjQzBIgbuZYEnM8JsVzHUQBHynVMiyhP+ydJadzcGMi5q07fPOTCF9J0Gthoy1IL0rEDGVnmXM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQ6smCqC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0yHjBsA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQ6smCqC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0yHjBsA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9vF501055038
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8886y9OK7rLNEr2zlaE8SlacINuysTCFqKQRD3SXm8g=; b=KQ6smCqCRl3S4GLo
	oL+Guj+g0A7gNDWly4GVS3iiDLztIRrXwGpR+txIWbKYvVgXy3j5MJU36QgqkYdG
	Dvtge95w5RUfAKhT/t/mkGJf5f4X/We4YVBhPZUtl4xT3Gs+r3RcmX8gKrZN+DZz
	3lnZK1ytX4FYhoK3dvJUHiwr1MQsMhVDDEovCmzohqmca1Hz7xkAd4yMLyYUoIUD
	0m71A7WMIpAvYeYHarzElfnmr34YXwePzqEtAoC4ySz5O/nP5hpFT4GjnwaNMHJ4
	7AmMa9mqBJ/ciqFpEWwfWKnuLfX1nK27d1UQCmN9a1/WFIM1ecmadUDv0YSOmcx+
	5e7AHg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8npare2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:51:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-910552aaff2so46890485a.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779191501; x=1779796301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8886y9OK7rLNEr2zlaE8SlacINuysTCFqKQRD3SXm8g=;
        b=T0yHjBsAOyXp07WDqjSiZAQ2bwmIsHsaY/rAdVpJKYKD/hSmFnbiQJtUy6owDTyoLj
         kOFgKUqsOfz6Zng04jzj8NBaaDqeulfuUlsh7z7pwIMejJ8UKPJlA0iEy6ornogBGHwZ
         yS2qcQaK3hPpmjiqd8yP5chSV9uokM9XM50GRJAUHBM9XEBUjwjVEF5LrjXSObqgGfvz
         t9UbcKV7QDgI8vIkC2Ju0XqNLJe/nTpOh87YIj0MeoK0dMzsKL/TfMnvy/9j84+8X4F8
         8Tg70izsg1WqpooPGuHiVcrxA/L/67m+Ce5hVSPmXE+DbziMeIXeLJhG3PmpsMmze8Fx
         Xklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191501; x=1779796301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8886y9OK7rLNEr2zlaE8SlacINuysTCFqKQRD3SXm8g=;
        b=jwczNGaWg+6QfrygEGUz6cDUualgRw0jwCIidG1SaHPi9er/LCspFLN6LMju7OUHWR
         KAcdc9iF6w0AzM2nfGmL/qEOGOTX7qC64+Mj1zAwEh81zvkt7Pl7CpniYw2ZkakzA8lO
         oUX26W5UJV9T4wBWMUAhYM72vTKWvkmc3msc4vCV3+tpTkQNke19l2TIN5EwzfdigEfC
         xNT3p1KkBeEe6pEDLhztTFU6M5LaPJgH0IFw75DzeD+NcKnFdjk6YMULfdUUe39hRpch
         neHvDmLLDC9D7QPAGpGkbOu39XtSRmtKmKKhCXb3/0YIY+XJozSgi3IMsE9pJbAwUEq7
         63/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ytmPFkHFyTXwwpWVoxXSnIY+yZnw8vpDbf3vT7edMC+q+U1tauuY07495mJls8s0mMHFxZCmPJ1DU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx5+ib7iL0k40l2ttHhUBV4go2crxQyBggMmVz8zmc9WqWjCJ4
	hypU6+oE70QowiFpDXld1VjSzfyLkN9tVKfpOsLNNCglNIOYhfSCo/u0lR6gc7br+LWLg/qJQTf
	KUKr06eDGBwvRLkGojtV0VkyLeJNyiQP8MHnrnOL+G+nc7+jjyMagZxOOvQugQGW5
X-Gm-Gg: Acq92OHkLuchzCQg7IKHQcZCqU8re+x/50Khl3ufN4RnIIBf2nwj2sb5P5cfJDMHjq9
	BGedssJW+VDwTQ+gfKOgeAcX9x4HsOxNs1VqyCaVxyBKgFTJ5yp2wIVwrVjIqb3bFlauG1TjaNV
	K6oaGLwJ8X6CzoET4COuFZwhzYy/ZdUjX3j7uQ9yddwCCWx6EMgnzZdKivu6bbT5V11QlOBNnMJ
	fEpT9HOe5Nx4vDAL3PqSkxHDExkTHZAlS5Ibz2grBjSjRnRv5hso8f19p3XjBCMpCmD7m9G0Qj4
	EQv3MDoj+aWKzgefoRyfUpUWRyl4J5nswHYnFrzPdDrWMS23WebkWvwdioSqk9S5HZXc8hbAo6R
	8Auy7m2xH/DTX9IB08Zkmtgr8npONxoUDpmDHPozzUEqWIl8lQPrS6Vh6/LrP6KokDGypp/mib5
	FBjdrJpf1bROlr4A==
X-Received: by 2002:a05:620a:1996:b0:8ee:7878:af34 with SMTP id af79cd13be357-911cda511e2mr1962910585a.1.1779191501628;
        Tue, 19 May 2026 04:51:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1996:b0:8ee:7878:af34 with SMTP id af79cd13be357-911cda511e2mr1962907685a.1.1779191501253;
        Tue, 19 May 2026 04:51:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d58df1sm6536454a12.13.2026.05.19.04.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:51:39 -0700 (PDT)
Message-ID: <0b1c66ba-d841-460c-b702-8b4530d56f73@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:51:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Add Shikra CQ7790M SoM platform
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
 <20260519-shikra-dt-v2-3-c01b90fb4395@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-shikra-dt-v2-3-c01b90fb4395@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExNiBTYWx0ZWRfX/oGHqThx653v
 B2jhYiAZNuqk4lGJNhr94xJcpuRx8naTmjurUhuyWPvY7SVB5/u/XRLxz1JjQtU78MgzVd282X6
 Gp85T7J6BO8Yt9mXGrsTcm8nIPP/CRKf9WUClukde9HMcNYlxMeLhxcnCOgAiKGfKN34YBE7KCK
 y0xbbVOu1zWdDSSt252Iovd54WUgob4rfJPWhmJwmU0j+o3lxHHJlDOe+xk6TDtFiAkfKYvx91T
 2pw1ESZCZDvx1c06yp5Wl1qvap9nS18ptVRIc53nu/LLRhnzQvXlzD7JWDJjNe0LAHfo0udjlkS
 /kME5GedbChfuV5mxjPJrky6D2CbHBPpNGqc613arr2h+VCtYs4Gnt6+brA4eKpBvw1oADSLA17
 fn+8x2BO1Lf1bfaBXPHY+WB4jaDFaJJEAgC4g0gmS3Ql64BumA65ICzgqQtYCbYPSetCEA7Exho
 X96KMS4MhqD400/p5Ug==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c4ece cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=INWPgVgdgEZSfrFqjaAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7g-BwYJTspZYcRgkm1kiR0st5CN5_hQO
X-Proofpoint-ORIG-GUID: 7g-BwYJTspZYcRgkm1kiR0st5CN5_hQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190116

On 5/19/26 1:21 PM, Komal Bajaj wrote:
> Add device tree include for the CQ7790M variant of the Shikra

I don't think CQ7790M is Shikra

Konrad
