Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8208428462
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611851; cv=none; b=pwtuvwQESNQ+90bfokZWhkDANEj3NvOT/aiAYsZtuDVxi5S7xyq7j0uUSzavmNfS4MCePzCmmkdwQO0Ve5YXOyK0TFzitrAmKn3cpKA5gbRea5lMIN7xkBO2IOsN8uyNCeXLTHKo7mqj1UM5Jp+MlOujKDiGHRJ3SG7o5XC0I4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611851; c=relaxed/simple;
	bh=DHt3BcI99ZRJlsijYSVKVUjw0Sa5XjRe/lmkpsqPH8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHe7hc0RFYn2MxYudEfyp094I4+/W1+JDa90OJTa6if1Au+hGqgNuh7cYwG3cw42890k9ucMxjj09NacIE6bxJ+BYpnl9h6d9lc+M/YOwSk0xdi5xslkIbiVyJD67VTc0OVbWfhQ0/bcigN3ErNgYAvLTLGd458khNr2HglHbUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrXaf1mS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZayDDwoM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrXaf1mS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZayDDwoM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9K0s2914553
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OxWmbtNOroxnYSGzP/yu/120wi4D28MbvydbCpAWsUo=; b=OrXaf1mSlsaRbclh
	jogx3mPNnbjwr84U4rLQ7hdZ6zUbMvr+0iaB/rY9J+kvDJjD/9m51XnnCHUSjRI5
	MC3b611Uk4vq+bH7PRhxmBIec0T9zIyl5b7snzZxibfGsR2Cvw9AyRXdaiowPdtg
	8q7GpX6y28sywhN5CDW2hFZAMpVVKOPVkcfJ56Fgzs0IIOFF3KFrociHeN/mVzlN
	FpeFSv3Ep5is3F/aKsOLTojBkqUx0hX7pGJLFHOYfqMJ/PvQ3SOcTlm2XabgKiwe
	A1VMvmQyVyaFZgW3Wdi4t5yPBGtFDCoWAMK6BRJyIFcnF5a66TphHJ9XQqcRYj1P
	kJ8RpA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1761cys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:10:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915ccc2d4d2so99509285a.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781611848; x=1782216648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxWmbtNOroxnYSGzP/yu/120wi4D28MbvydbCpAWsUo=;
        b=ZayDDwoM9meH17oG0IS1YhXX/IDyvx+o0c8GNRu8CUshs3Xeta4oEqAAwUMSdLOBPT
         hLgerCXQGTY1iQbPTI7KN7OpSvaD1QoppDCyN+BebRGpXL7cEbc18xg4v4u24aFQJzP7
         M2dcTM+07+1oJbdGOti1ylEMt2YmBL+U7PB0vz8rMcIoJvOBZx0gTpM1JXIGIbIo6HLy
         9EF22nT/WMKM9sULm9YKRh1J+TTAT9Rtkpuv7Jxi5nLMgNgbj0Wf/9oiIay/BbzLC4r9
         bVl1yzEMmmsr/anFMIdicFIaKGj4on+NW0ncbSFrzuEdt47ZOQBwDm1qviVqWORmSVPa
         DGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611848; x=1782216648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxWmbtNOroxnYSGzP/yu/120wi4D28MbvydbCpAWsUo=;
        b=iuZtsA6x/sq+qfZemS+stSepaNb4PHSpJuRL2wAd+uTT/ow1+sDcc1zaPzfpuhjs5Q
         Pnlx83wvYjH4tMWcwx1a/6GZsxr8XL/6+tl40XHeVv7j3DZgOqqq3FieRs3kv3dwpk+a
         PIyWxLoGMUaNUx9Y2RumvKKqwcOMVrMI/liB1wKxEvGMLqBiCFRmUNCPG34D/GIgIe+z
         +HvJ/Dpif8tjnImsqT8+esNV9iLi1fM4vbQjmwGSlpJhp75wgQ+dDuNr6cYMXqdvYkzv
         Mrh+2A2hy6bBfnGwvkfe9iMe4HPBIy7u+mcJtlHFt869sSiUTQTFM4vg5f8NhyV1fK+p
         fJ3Q==
X-Forwarded-Encrypted: i=1; AFNElJ84xSNdUYrPQpf5uRCf+xjdBwdlYGsNZZC8MxJ1E4HS0+N0r8hZK0W0+adiY8YPBEk6TRwCbTKD/nl+@vger.kernel.org
X-Gm-Message-State: AOJu0YxhxzkvsdEeOA+Es7f3z96pQ3DviIzX1vLzLk10FD2bkbtqKyKA
	CUDiyW2xCbvzwsXjDueqfAUoqaxfvm0bcfv2c+8me5AwPfbt4jNGpC28TZU7CglNBXFV1wgG4WQ
	5pssAGEafu9s7gw3y9Z++Ixzgq7EGS9AYwpqOt8rnTm6QhiOWgI98KX1zVbrMkfpAulAMM1Md
X-Gm-Gg: Acq92OEEEfvT36q56Xw7NN+tYejHvZ6aGgaXiQXiuYRtT3Occ4jBdGQMuVcvwM1a9Of
	DUT2Ev5WB7fczmykFYnm47brYomRhR/pRI++KjK2j7E6jVeO5zLbCG4zH4AmD7IYVMS1Nu1Qmp0
	Df7d072ctQJrwT+EsPs1IG32Q380W+tcHkCqHQH780y9XyBKo2XMuOwx8MSwkC75gQuLBi7Og+w
	gENd7dbXFxOpbijrjCa6rruQEGTc2408nQabo8nU9HoHCJ4jCtEYQ248IooCWkK98zWeZTpSPnd
	yTvLrUkHg1DNwt5CkdVUQC7Yjh2SLw9b9p/xalYOPtnsB+SeDMmVf5jZ+2WlEWfExwibw84Arqr
	R5Y0MOlQu2kYk9wUfG9Om3KaF77urXRoR/eCZmwqPwbmGjA==
X-Received: by 2002:a05:620a:2714:b0:911:295d:59a1 with SMTP id af79cd13be357-9161bd4df47mr1667712585a.8.1781611848116;
        Tue, 16 Jun 2026 05:10:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:911:295d:59a1 with SMTP id af79cd13be357-9161bd4df47mr1667709785a.8.1781611847540;
        Tue, 16 Jun 2026 05:10:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b1bb64sm652683866b.52.2026.06.16.05.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:10:46 -0700 (PDT)
Message-ID: <5c80c430-8bc7-4d03-be7e-c6dd518705e7@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:10:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
 <aiuGjH4qeOIXXgqq@page.local>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aiuGjH4qeOIXXgqq@page.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _sceFn3eQTUwBwcotPT5LLcIcdmj4jLq
X-Proofpoint-ORIG-GUID: _sceFn3eQTUwBwcotPT5LLcIcdmj4jLq
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a313d49 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=yPoNxxP9iKLQiR109SsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNCBTYWx0ZWRfX+F6dstx0hLw5
 RZACdiNSsRLMmjbg1P4ZmjEVFQ3nPrSAzA8pDOQ843X0WHhPl8WV+V9YJNXYhhTNCCnhqcpeIQ3
 eSON1y7GU1SqjymH+Lrvv446B8Txj6I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNCBTYWx0ZWRfX+b9kzOtkgcY8
 /4uQtIGiYKkkOr00zIIfsfiM5rK0H08QyY0ckxBm8DxDTjdCr9WI78j0yiWGPZPEGbPQycoSpx3
 adXVdSU+beVMRei7tpBZd2+bUVLIVlFNhrcMlKeMEB+ipDwATX7Pt3uAQaWFE75a1bKzT1B7bQd
 IoRH9D/icjJ8m0hKALbqqT0ytJGzU3nUfdabpJ2pG+Y5YUMUE2IaZDMU9v8zt9L+CSwSkdUnqbv
 cstIPgWP7cWu5yEgGAuaHmlIDevU6QY5ws7mPStBIdvTN29LCsWB45icotCpeBXTu+ycjCdXxaB
 M8N5W3C2yy46WT07OO087KL4yAqYJ6l0rYntzmX5I5PZw8PWAJG35inIusUUutIs0+bi0GH74sY
 FIqB/zTi9IVMOcPhBZoAFk0hAsOE4zqyjMbcve6478K5FrLjfYzjr6lBLQDd9CBtLikQkINzyqm
 cQAHeKvS0Cq3MIkbAcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160124

On 6/12/26 6:16 AM, Ajit Singh wrote:
> On Wed, Jun 10, 2026 at 02:58:19PM +0530, Konrad Dybcio wrote:
>> On 6/7/26 1:36 PM, Ajit Singh wrote:
>>> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
>>> QCS6490 SoC.
>>>
>>> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
>>> support along with regulators.
>>>
>>> The UFS ICE block is kept disabled because enabling it currently causes
>>> an SError during qcom_ice_create() on this board. UFS works without ICE.
>>>
>>> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +		vreg_l12c_1p8: ldo12 {
>>> +			regulator-name = "vreg_l12c_1p8";
>>> +			regulator-min-microvolt = <1800000>;
>>> +			regulator-max-microvolt = <2000000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +
>>> +			/*
>>> +			 * VREG_L12C_1P8 supplies the Ampak WLAN/BT module
>>> +			 * VDDIO and the external 32.768 kHz oscillator.
>>> +			 */
>>
>> Sorry for the long review timelines on the previous patch, many of us
>> were out for conferences..
>>
>> Is the oscillator used for that WLAN module? Would you ideally like to
>> be able to turn it on/off?
> 
> yes, oscillator is used for WLAN modules. Oscillator is powered from the same
> VREG_L12C rail as WLAN VDDIO, so there is no separate regulator control to put
> in pwrseq. So I think this will work fine?

Probably? My point is that you marked it as always-on, so it will *never*
turn off right now. For e.g. Qualcomm wifi, there's some timing spec that
needs to be met wrt delays between toggling various regulators and GPIOs
going to the module, hence I suggested you may need some pwrseq inbetween
to achieve reliable powering on/off

Konrad
