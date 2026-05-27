Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B132A385506
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779865950; cv=none; b=Q0IMyxQIrtLdcxF5b3Zm8c3UKVNvlJw5yVHzO5CniG11nOOyR4fsZxp9nKvVfbL0BKzj2AD//UQCMIfGKwF+TdV/RoNoM2xM+6oiKq4weoXc/SnYx9Jia5II9WDBepmaBjBR5ay/tbqkX3HHHvZCc2gNeyvmFne1an5012wyRcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779865950; c=relaxed/simple;
	bh=9UBpA1DlKaw0Ic22nYrKTCD1TparHCSI0WO2XRA1lYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROSy3PW5J3Dh0wjBoeNwWf7mpzAzhUeaG075izpUvf0FaaPM0ZAhdMm7YCKZ666yfu4ZKsDo5NMMINYY5Cf4dteO8g1iXgNi1Qm8uhVUdoVe0WzjDq8FLB/9qZqDDjIKg0dw9uTYYCNmjXpnxHjfQEdB1aP1x1lQcGAlG3jZAmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdjzTCAj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZxkWs1D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdjzTCAj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZxkWs1D"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2WuVh3258523
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFqDIrJjKC2IJFbPzvKdfW/q7cLOEJE24hhamOrvPj0=; b=kdjzTCAj4p7g6NBv
	6dhNZ8mo6TNx4IxOtjBmPyr6UHpoXl3t9pwDzBtzVU8abDJDEQZvPQlNRaixvcqW
	NNMW9hZDVWlIpipChxJkLQyakIJbm4BJsEJK4cZoQpCsFHHqhO8BHiHGBP+bkUgo
	jsFF39Q9Rg8msD3ACKNWkeNfEFwgqgBiA7Oq6TD9MQ59pl1cR3K1trjNTaoKbRvY
	tw4y5S+R7pdibCy+25RinBAJcR+/BLgmsAQN7ywDPFS9Bkq5MpJ87qxc57KCJ1uI
	GJWeRs3jl4aLOL23fJwvgoqqLnYS+jsIoI8h/N6dPZx6kH+/2YDekOKh8NR3tvYN
	XMK7CQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefujycr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:12:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baf7748d0aso116724665ad.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 00:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779865947; x=1780470747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sFqDIrJjKC2IJFbPzvKdfW/q7cLOEJE24hhamOrvPj0=;
        b=BZxkWs1DM64B0VnenPPV7IOQxIdnjTl6wlWMtKmDvug09FW/8mSxkJZJpCblOc5/ij
         EF0ygFhhK/hUzkEpFRgl0QusPvgwGU0lF0MKD+jeuTodJyeP+JrMdrP6m9G1ggzZjwm5
         PQw/OUXejOXkk7XNiKDsrN6UH0HnSf7FEXFUjybfj/Ds8j5GfOBBRqlnDos9Pg8KbipR
         f0VeF5xuv8ovU2pjPRvRJKUYmx7g/wX4UdtrnhEWKgpEOS7hgzBUDntsVbqefALYfajK
         boxKsgAJadtxEk2vAye7XGvb4OdlPT8+B4iXVKXK3zgtiSDi274IlnPO3mJQEZmm2Dxc
         nG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779865947; x=1780470747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFqDIrJjKC2IJFbPzvKdfW/q7cLOEJE24hhamOrvPj0=;
        b=Rt3axBZPa5GvJX+RV/ziJtyc2y8PzR8Bjy+a8sRykmu4HW9IrIVMTDOXIJ8vDT/Phm
         nwfmmF1BYDbf200s0m3LPsjBFlQBo60Q5L8kr56KCm9Zqj94mIaBzeOBMaUIvVMCGxLz
         uTCNytIaBXsbBy8q6j+1B8sBDKG4icxIugAeGKJBUx7SszODx8NN9cZRvMQzYGqGEpp5
         hkZxvd6aGmvGOsItNfDspSYFuxOTnHbfX5kkMFOgkcyXks7jcDjP1qZkURd+rgioDGuv
         ozYydV3IKJJUYwO9YRIkOK4dTS4UDhpPILRXUs3qVrLbDIR2EgHV5b/3X8hc1/iU9qjf
         8Peg==
X-Forwarded-Encrypted: i=1; AFNElJ9A2Spoph6JirF7qZnm3AXKKD+b7SN78rlDDipP0oZBBoYPWo7o3Edja46RSZ+IDhj6wdWihGLUBXyM@vger.kernel.org
X-Gm-Message-State: AOJu0YyIo2t/rXNRnDTxlGCgDxc1JDKE+FSAyZFh3dljcxHtOxrHIXuk
	gO+y9ey7eEOlMu5fe5NPd8OVHK/k9Kz3afxD+q5wfz/nFDcSASGnWImsY7M521qOU4cboxgJn/i
	LqzlnRsoFoC/2UJPSH8+XR1XqiRjicoo5B3tkP86RylvU+DFrILJRmf9n+qiw3/nt
X-Gm-Gg: Acq92OGe6M5WSQ/Q2PLzMo0Koj4xKGigj3CGqfqaAsxMPcLWU3FFxFj3CdHxi0qEf8q
	xcHXZBR6RDmh9YIV+5+U0864nF08NK6uctoSyVhdfQFyzRYWZuFIw2r0cRgS5iTXu93/5ok7yWx
	k8ZAGaXVxMVSF8lU/sOx7tc/d+Fey42y/Bg1ldHDBZ7mVV2x/349VtQVpXpU6xu93Q0+q90chjL
	7u7OYzcNXJXrPRnaw/eQuCVNSTBz7WlMcdNEC9QZnCqo39l1cbANSP+/zadQjTVn14l0UYrZhmu
	USmmVw0YMAFHu2FBCS974D3rU4VDMH+SjVpBS3+VjXbS+MFltaf9Hp0nllOlTD6ywPmB+PEdYpl
	C8CylFLkyD6OCi0Qpm2wNXNzLVPRFGZlk0OCxOPLI6ihiPLe6
X-Received: by 2002:a17:902:ceca:b0:2b4:604c:ec6f with SMTP id d9443c01a7336-2beb069853bmr239368655ad.32.1779865947225;
        Wed, 27 May 2026 00:12:27 -0700 (PDT)
X-Received: by 2002:a17:902:ceca:b0:2b4:604c:ec6f with SMTP id d9443c01a7336-2beb069853bmr239368465ad.32.1779865946736;
        Wed, 27 May 2026 00:12:26 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce4easm134672025ad.30.2026.05.27.00.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:12:26 -0700 (PDT)
Message-ID: <951c9b8f-4513-47ca-afb6-481dedd3eff9@oss.qualcomm.com>
Date: Wed, 27 May 2026 12:42:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Shikra and its
 EVK boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <20260522-shikra-dt-v3-1-80ffde8a3dc4@oss.qualcomm.com>
 <20260526-quantum-funny-gorilla-cfc983@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260526-quantum-funny-gorilla-cfc983@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA2OCBTYWx0ZWRfX0eKViDKYjCNT
 KbAySXL8Qs+hMClvrGioCweMdvCudunQMnY6p/JgvayUroORfxXXzczowVYZmQvh5qaAlov02aH
 LFs/PlrE3idVR6+9GsQbi9lRuf+gBYSCL5oAdcp82v0X9i/fmOSkjd8JP5+tLiMpdX6nHfJAdbc
 JmMAv1/7tQ8UWUkGnp9MdbyMk8kQyC5CG7mKFCSw3uyFzWj31pvQ85qs0VtJmgcaGK79ofKkzrw
 VStxj6bzhTIt1w6fLDYV35XteZoYOvywrou3QkG822Joej9rp0DUn2Zmk6LlMd4t6rLxScmwrBz
 37dzkrmAKx6N3FmQi11gGWJnHHRCYBxgJ7cmf48yAP4S/4uQbuGWluXzVenZrp8ZsWqM8kf5TKX
 U3EIxthVKQMfZEPNVB6vzDE0hdyx8kLuWKEPxaYMUkpKCrP3RjcwPIBRCYhyzKBV+6bE9ZbNG4S
 VF0+20FHL8M+n1HeC8Q==
X-Proofpoint-GUID: 6EFBj3j3Dtt3_XH3wZYvln_kCXxleEkT
X-Proofpoint-ORIG-GUID: 6EFBj3j3Dtt3_XH3wZYvln_kCXxleEkT
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a16995b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=kjqM9UcslzgJvOEO4JEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270068

On 5/26/2026 9:15 PM, Krzysztof Kozlowski wrote:
> On Fri, May 22, 2026 at 11:32:24PM +0530, Komal Bajaj wrote:
>> Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
>> form factor. The SoM integrates the Shikra SoC, PMICs, and essential
>> passives, and is designed to be mounted on carrier boards.
>>
>> Three eSoM variant are introduced:
>>    - CQM: retail variant with integrated modem
>>    - CQS: retail variant without modem
>>    - IQS: industrial-grade variant without modem
> Industrial/consumer variants differ often only with thermal, so how is
> it here? Thermal difference does not make them incompatible. Honestly,
> usually industrial one does not even receive dedicated compatibles.

The IQS variant uses a PM8150 PMIC, while CQS/CQM use PM4125 + PM8005. 
These have different regulator topologies and RPM regulator bindings, 
making the DTBs genuinely incompatible, IQS SoM cannot boot with CQS 
DTB. Thus, a separate compatible is required and not merely a thermal 
distinction.

Thanks
Komal

> Best regards,
> Krzysztof
>

