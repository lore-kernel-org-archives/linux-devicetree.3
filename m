Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEF838B154
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345341; cv=none; b=ZWv2GtKb3paX8KIpOXEvI/tCwdTQLnuHBxtkosk61sGViz+DQrRgbqo8BmeMjJZiDiGd4HVLw2rGzsNQjGZVsAOUh38DWILF+C1OM8Fg+bv2x3VHZL1JGdDUJaeGFHELjaYrfZFTLCaFgQyb42AhUxeMhnxWeDXmCThRQJtCGOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345341; c=relaxed/simple;
	bh=od4x9CkAgwPG4jvGtgffyhwBA9v5TLV/vaYUX4T9nvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVyBUaR1hKVBuGfkzydOhcNWV0lt5OYOKLtrgLAV2f8HHPCCZlmRasRMWcnrhaj0YWIvDOI04nUeZiA5AbzqrVE4PlBHBY/oQ0j9+I1OlbWFBIXQEe6Rpd9nHLNe45cSf2IJMxImvHv0Bdag//rqZv+BUIhkC1wI+Xm1LwYanys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoLQpVIu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmp2Vhak; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XoLQpVIu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmp2Vhak"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9PoXB3934878
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLdO2NSW3VrSa+nqvNmV4F8s9FA7/pXmbBVNZQcuBMM=; b=XoLQpVIu2JFCkpgk
	Bv6CmHskqbaYyr6p/lVsi1q1mMc8fQQyn1t+vfskkNYxxgMIKsganbv8riY2Ga9S
	auO/Ni555lvw7C9C5TNKWvf19XMRJFsP5Aw5mzjUrC0d5zXq88ZxGwFrx0XFmx+H
	pGb+d9PZVNujRcd9nIwzNcTrbNQ4udWpjlnKuAxau8G+DK10nnfr8c0h2mCfaxX1
	ZHydj2YmqDQq7+kkpEkq6zjzp+q2KXGFERctuNYO9YwkVBRHSXkjaCr/xB7NZsVh
	+4IaJYSXEVMxjZXH4EFHbuxB1G3z79OVUfABdNP+jdR41xKBi1oNbPxTTC9xyJfD
	ijPAhA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0ksf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:42:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b33a19837so48740361cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345338; x=1774950138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLdO2NSW3VrSa+nqvNmV4F8s9FA7/pXmbBVNZQcuBMM=;
        b=hmp2VhakTusdz2/o1mT+QwqJOboFmITYFVHzUP95w+HIT33IE9nGf0oixKzkRURNYz
         +QrKFk723sAzV6MUi/9VpUYTYxZVF2nREME+qm+NWsffoapcpb93YaZh2mgAAyDYNwPb
         jj7NZOR8uhNioWi2h/OrVGA9VTWqu+LgPkuIpYcIJhodcEEjkP6oowKUr5+pv0Rc3XOc
         2hxGfxZ2zcUmqfCdkLNr9UaYICg//pvPjjnQr9L+M8dwAT2GwMV+XVzpJucSzeRkC73O
         0AmtLK2xyu+lUQYoNKgSfp5pk2v1Y8TXfV6yftj0uy5iwMv3h6iKKWbeoFJfX09hCjpC
         2Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345338; x=1774950138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLdO2NSW3VrSa+nqvNmV4F8s9FA7/pXmbBVNZQcuBMM=;
        b=TYCmGE6p9tk93JPgPUMWZluTWQK2ES1a1lkR8nfK+fhykvU3B9ZhIgoz0u2l7depn5
         mJvOarFJPJL2JBs0az9OVn97EcdLtfFcvcQ1kObLhqq/x72V7eaoItgSJ7baqzkvuCXa
         2BehsM17bv5q1JlR5YRrXG5/U9UQPEcOtXxTHs/4nYkMeeSRiLEVgQWC5aMKnsx8IquE
         X7I4q1v4NBt4InRYEfpeoK3tEORb7TFakm4vsN/44VIERVTC2Z52HBs0W/3+kBGr9unO
         vAZLD1Whr2Hy8P6VHqwdWyFGD/nmPTYxhQLNCEXCftu35a52DI4sHCfb31xLRIrh7FP2
         eLww==
X-Forwarded-Encrypted: i=1; AJvYcCXhd+/R1Y18djhIhqCXE4UicExjICqROh+V76JqCq+JEQSgtktq12wDCL40HG/g2gHpa8plx3PcPhfz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjw7+//l/X2yzXErswVGrHYq+t6feg6nJe1ALhwaACjX8BzANK
	l8ytio5a1+skOFh52IP0qki/QxGKkCx5pi7Db6HzGu9SUI9MatzcwXFqs5Ac9xAigsIj3VnQcvR
	a3abCPxkTXsV8BBpsZ9ebc2eRkw/eqX3Y6414SutQSm9SSCnFlK8Jkj++TLjL3/p2
X-Gm-Gg: ATEYQzxVnAvt1ceP+g/2TzHm2V4aUrbjIYqBg9ZAV1zu/ho1p2/QlwE31ngn0rttdqj
	qacU4CR+s+UEvFfdHkvDN25Yt9IgQ5jaBMIIzjbqdsrkUqR0aeHehVFHNRkXKb1uOKatUYB4RxM
	Chu93Jb4Le8AYBnLnUQ0ZVuAqyWGpCDQFVeU9h2VdxwGb2EpCUwIqWIeaZXeJTjBpHiF4w2csKG
	5vvG2yTUg+huY+LZFgqhUJIwPayeERl87FAuuJ9Z+OoGMZUR9hiT3hKeTD9eVfjZ9euYEoZU0pS
	XZStSpY+dGzDYlClSBSaSdgNIhVMj6Pb/B/UxhsMdLZeRxsXcgLYyDVUdmQRg0TM/tAkmaNotZO
	Zqlp6WlYUWeCmOgFAEPWvTqWQIwe5qrKpX6c/X54fpVMs75Rh64O/q4kIK+bejka46YMkJ6dbFK
	CT90M=
X-Received: by 2002:a05:622a:5912:b0:509:2239:8b46 with SMTP id d75a77b69052e-50b3721a55cmr160227661cf.0.1774345338226;
        Tue, 24 Mar 2026 02:42:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5912:b0:509:2239:8b46 with SMTP id d75a77b69052e-50b3721a55cmr160227581cf.0.1774345337776;
        Tue, 24 Mar 2026 02:42:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8d3e6sm620451066b.20.2026.03.24.02.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:42:16 -0700 (PDT)
Message-ID: <195b2ec2-d51a-42b2-8221-2a60823f8ea6@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:42:13 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher
 touchscreen i2c clock
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
 <182a6226-bb23-4ad6-b454-4913ab461264@oss.qualcomm.com>
 <d51b237c-8079-4398-8b8b-ec6a6876b173@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d51b237c-8079-4398-8b8b-ec6a6876b173@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c25c7b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=dZw9lnDFAAAA:20 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oSXFT4061vmgito90VsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfX9CwTJzB+Mxjq
 +Ujd2dp9Guq2AwoKwZzfaiJ39SCnu8jEI95gR4Cs9CoKvkpdYCJvcn7ba1ufXB3arBMhqJyOpvT
 D2JE/n31HrUCbkK3Ac+l5oNX79t3IovokXNUVpUxB1iV9O50/5Lky4ujBxa2nPbq0ZGoXv52vTq
 LRa1S0ieHd5tGJVgDNMjOdsC0yrILtMP40gUjj780EozprBZiJqrUXR+se4UE+TEWSlDqSTJdFp
 XlLAWC2etG5JGpgsUGbu1nLGLi0KkRxc87iLHiyTkgUtr89yiYj8Yfaz6bXl0vHnDyL/3xKN8qU
 Zuv4IOOKSsGbp86sRkdAumxe04sre1zKbiH1p7WuZPfxZF98V6nijf2FAZyrz1gEViTZdl7DmkZ
 8q4N7942GnCECA1izbDg1nmRr7boQikesSGI2ULA8ueKTijaUrnlGJj8yWA7AP6tCd3d8OYOgTC
 MA77ofDZ4H8L9HgiH4g==
X-Proofpoint-GUID: 8lVCgJHkKcq0W4XSYsA7RIckvgL2VSpN
X-Proofpoint-ORIG-GUID: 8lVCgJHkKcq0W4XSYsA7RIckvgL2VSpN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076

On 3/24/26 12:15 AM, David Heidelberg wrote:
> 
> 
> On 23/03/2026 10:56, Konrad Dybcio wrote:
>> On 3/20/26 5:29 PM, David Heidelberg via B4 Relay wrote:
>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>
>>> Sets a higher rate than the default for good responsiveness of
>>> touchscreen.
>>>
>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> I assume this is in line with downstream (i.e. you're not trying to make
>> the panel IC work too hard?)
> 
> When bus frequency is not specified in DTS (which isn't in this case), downstream set i2c bus to 400 kHz.
> 
> See
> https://github.com/SHIFTPHONES/android_kernel_shift_sdm845/blob/lineage/lineage-20/drivers/i2c/busses/i2c-qcom-geni.c#L894

OK

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
