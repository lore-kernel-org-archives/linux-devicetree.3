Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ECA3FC5C1
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727769; cv=none; b=BSSx8+1nmKq+bXxhT941O/YshOpIV0qGHfTUcdG9U7gBZGRQrBfwJHfmzYCuIStbDy2jmwiJjngIostrQK1w5FnRz8UZmedYQSveJiXD0SN4cqwLQ8H7DGCah0lsDyA8QFNBzEpln+J+5VISPovchJIkNV1NnZxky0rT8eD3JrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727769; c=relaxed/simple;
	bh=BpftG47GSJlTBcPaa5FgiPfJt3EnSg5w2B8NanQnBRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELOCN5Z0o2tdEu/rqWS7PS0AirgAWnqNFYoEciB7vE7VjCgtOUEBjha3ZQeJW1pS6fDBmQcSGzP8mS2rak60KwlfFTrFxxZvmbOCUnkvWRsLNkFZO7lT0k6anMw2kp5SEFQq6i2xBdS1Sa8muUAqQOXXwt+UhGB5Fb0eiMPHhLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpLmwOtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2fRX//1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hpLmwOtb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2fRX//1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6qvJV2076267
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfgHJcmfjiF24CciQQgoWa9Sss9/fYHUQe8KWaMsEq0=; b=hpLmwOtb1BtB4e6i
	hT2DuPKyFu/UFeiczG5ALH+BsMB3E0jJYPRHFE/+piAxyu9RXr6HZMsWdlnNQKPF
	5g3lmx9L2UA332Fjr33PPPlNT0U3TjPY1DrLdigcA/NYr5xTc1iUqNpyyFu5CVvb
	aaiXpTaCN8zWh3CbrqHfLb4+gNVHqDNQrWE56rwNMHLONhuTmBW+5pwy3pyNnJYU
	ZrlueZGqTy0hg7/HCQ2sV269R9pYPS+KNXwoksD7EuUxioGJ9TzdxbqgNl61wO3i
	tcMmaMU+PXk3rSyFJAbJAMKsgsmb5wOW5bk10YDP3hccwvYQuEiiopv7FGCMlQBe
	+gvYOA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gu2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:09:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fec599568so1446865a91.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727763; x=1783332563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfgHJcmfjiF24CciQQgoWa9Sss9/fYHUQe8KWaMsEq0=;
        b=C2fRX//1DEVNCwoWqxig1J6CigkpeCKYjs58Nfs9PebL+roSdsAlda7Iu35H+8dFPm
         Y09WF61DSMRs72UCWF+O2erRyR6Mwhb/Bxq/jLDmaAgWRorZMVkLfMUoG6+w4zL3tP5t
         2cOE9t2Zu8RGpiNUzU4+57qLvcuTKEOlFiursDvRLkgTSYcGvm1DtLeOGTLO7rGgRfXJ
         hJ6X20wd9ahh9cZy852P5f7NbIK0qeecGq0y3piFNErqEUogSLT8Wolaxwk7FMEUuMZV
         9ukytLo+Vb4zjzv86qAZYBKPjPTre70RkpvDeiEPJU+cw9PmuRnwzApcrjiweQX/SWnX
         R39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727763; x=1783332563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfgHJcmfjiF24CciQQgoWa9Sss9/fYHUQe8KWaMsEq0=;
        b=IuJl7pii2fFyhQ/80mz8jKjxHIfZMz3Pd5J1ryhBEUlTL4wei5law6b5RMPwHLPCei
         5daeQEsLGIbzq1HVK2Ewovbh9dT73bfXtzT/8lpDXclTxajTSoAbBAh2/MchppmAn6Ab
         6zx6QsM6NfC7ErjiK98OPr4Muv7Pw2pDzArdkGPC/91J0k176/kYuzDh7vbRXHYW0Wrg
         4AV8X1dpjBxzo4K5Oh8UGoTH+UbxXC79El7R2XwxPBJ1VVTVW58wCq/xXvYWBLcsbGhg
         or+cvjqccqt/dS1vxVx6VWafBaT7AlqDwtSGJSO2q7eFjF4GSWgrLArxl74jF0cx4b+E
         QPyw==
X-Forwarded-Encrypted: i=1; AHgh+Row+UuBbYQz193cVR5QhFfDNvOllp2oWrVX7g7PkxycHpCeQVzZ3ctwe0O+PTTIK5Mze0XVCQjroCQp@vger.kernel.org
X-Gm-Message-State: AOJu0YzOB//iJYCfAUnLAIkGghzxJHBUGYd1Cx7u4PEHxuFozNTMWyTy
	CqQYMZtA5vDcTXEinGAcNhepDeCuUULTMLYwsoqOHdrVIFM/tQBOLtEYA9Y9/8a+Co36d7KoN43
	s9uDvlH62x30DKPDb4niyxorSLHrpv5LvaZXSJYUda8VK1YM0rzynVr5v/2AEWFYOlj/Cc25k
X-Gm-Gg: AfdE7cmlrEiqVY94WivV144LZoLKI2YzkqiDdsU2Wn/Tyu66F5i5dOHXlFOWUa87tmn
	8MuRRIAtG7a7rkgukDl3HMy2S2cK3/Zp+9ghX1mdI6O/41a0DYSFDao5ScnnFouXieiimKMHS8H
	QjpE5JBkNTbA0FCIrAd9tSPa+E11sjFYN0mJfWT61E/i1pBssCAmEpCAw3ZolO0VPCsixFE9vy1
	+i4oPm1QNaJCtyXb1WJAELSxy7vIswiuc4mk/TPcWAbvlhyrDSjTtvYVouFNZAxGSL5PuGskeAf
	Ue06Qjph5M6K0MWmTu6HDNllwltVQkkV6wQJT98udWDT9p0kowFSlbstCcX7gLRENqCSyZozSE1
	juJjlaWX5vzqKWRqlVzQgVHVqdMkGIDvY5R2QlSY=
X-Received: by 2002:a17:90b:2d87:b0:37f:eeb0:693 with SMTP id 98e67ed59e1d1-37feeb00860mr2948845a91.23.1782727762576;
        Mon, 29 Jun 2026 03:09:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2d87:b0:37f:eeb0:693 with SMTP id 98e67ed59e1d1-37feeb00860mr2948829a91.23.1782727762130;
        Mon, 29 Jun 2026 03:09:22 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e20583f05sm2965180a91.0.2026.06.29.03.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:09:21 -0700 (PDT)
Message-ID: <22be7d60-309f-4a12-a11c-11ae99bcaddb@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:39:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: qcom: dts: Add display support for Shikra
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <pm44eparuibjnei5okhvfmbbeonq3rssyic4yjmhqx54ahk73w@2x7k2vgmtujo>
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <pm44eparuibjnei5okhvfmbbeonq3rssyic4yjmhqx54ahk73w@2x7k2vgmtujo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfXwa41IIjTJSmA
 +0S3DkOTaYHpwzi6T0pE1NVMzNhQSleYHcgJEjX0uajUec0kKBfPn2NwQiaUAbVt3y8F4aWyezL
 UBhDcmYSHOaxOuEY/Bnuf1LHGwAG3n8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfX73fNh/IBH4Ax
 rzBqyp1lr/QKUbHe0n+7emyljYJbS7tg0zr1NewOVQu5X9TA2qebCm6OcoASw9B4PqxrjBQ5Ez5
 3HZ0C/3ZHGLhCjEmSu45aEKcPT/zg++/7vMMrWl7rTudZKp8qJsI23yhmfBGlAYiDB3vOoH9Dzt
 sY9n+JazBKMd3mKtZCP2azDbmkQLkR2lHKSYa+mi9SFVyKtEyFetaIsGsgGrhf8C5m1xPmi48Tl
 KGIJCZQRjm3msNF0/InbvPu4ed7OM+bG+dXDQ1pf1VxC62XmpkAupU6dFbY0j1JwUw7LAiXW8yN
 2pAFWVLBEHnwHA2Vxi3Q1Yo7vnM2w2bcOZ7AraS75ps6sLk2JeVI+aLaWMtTog09jE4DZ6uaF13
 ejTrH0H6FEXoafNmuXJlSPE4JfyhV+MFxXuRy1YgPCWGWOzJ8m1KzSGeW+jidRcs9wz0wZLuYkU
 3Z1HaZ/V2kYL5K80DLg==
X-Proofpoint-ORIG-GUID: k4mGykubZkXBxPxiDpnLilV8OsvIH6nf
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a424453 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WtsUV9w0aFqfNevCzgoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: k4mGykubZkXBxPxiDpnLilV8OsvIH6nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290082


On 6/28/2026 5:54 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 27, 2026 at 03:31:34PM +0530, Nabige Aala wrote:
>> This series adds display support for the Qualcomm Shikra platform.
>>
>> It introduces the Shikra MDSS display subsystem support at the SoC
>> level, and enables display on the Shikra CQS EVK, CQM EVK and IQS
>> EVK  boards with the required DSI panel nodes. It also adds LT9611UXD
>> support for HDMI output.
>>
>> Nabige Aala (5):
>>      arm64: dts: qcom: shikra: Add MDSS display subsystem
>>      arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
>>      arm64: defconfig: Enable ILI7807S DSI panel driver
>>      arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
>>      arm64: dts: qcom: Shikra LT9611UXD support
>>
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts 		| 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts 		| 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts 		| 124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi        		| 203 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>>   arch/arm64/configs/defconfig                		| 1 +
>>   5 files changed, 534 insertions(+), 2 deletions(-)
>>
>>
>> Signed-off-by: arpit.saini@oss.qualcomm.com
>> Signed-off-by: mohit.dsor@oss.qualcomm.com
> Unnamed people? This is not a valid SoB tag, FWIW.

Right, I missed adding the name.

I will include the developers name in the next revision.

>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>> Arpit Saini (3):
>>        arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
>>        arm64: defconfig: Enable ILI7807S DSI panel driver
>>        arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
>>
>> Mohit Dsor (1):
>>        arm64: dts: qcom: Shikra LT9611UXD support
>>
>> Nabige Aala (1):
>>        arm64: dts: qcom: shikra: Add MDSS display subsystem
> Huh? Suddently a different set of authors for the patches. Please clean
> up your cover letter.

Thanks for pointing out,

I will fix the author name and clean the cover letter.

>
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 ++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 104 ++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 122 +++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 203 +++++++++++++++++++++++++++-
>>   arch/arm64/configs/defconfig                |   1 +
>>   5 files changed, 532 insertions(+), 2 deletions(-)
>> ---
>> base-commit: f28fb4ff0d25819c58341fec6e3953f1ebb1fc2e
>> change-id: 20260626-shikra-dt-changes-8d127be951d5
>>
>> Best regards,
>> --
>> Nabige Aala <nabige.aala@oss.qualcomm.com>
>>
