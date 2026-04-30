Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BAD2C2363
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 16:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567087; cv=none; b=c1DhtMVoegP/+nbWIyY1c/eU8lt7V5bXT5dpFU4ueBx6d+p+i4AvxD8QggVgnvdo/IytkBKYnmJNctJPxdu+1zynp3TnNMlkMCGGJL1BAlGxRKIvZ6b92+hC65asLTEPz4gyGmHf9aH7c1vLG/fcJtH/1zM+jmF/jm+2Rjwe6Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567087; c=relaxed/simple;
	bh=HDacjiJRTkF/d7qAHBlPL58TcUbocY/C1IV1k0OLmhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3+GFJV9cYgiDY8Z71WLpHtvXKjoGHgW4Kndlb07iJYgMkuj3X/WnlgvnivU1M22VIDZrSeapFXD71Eo7d+wcgjbhGKJmGPfg/QuY1Dcd8bC+Hmt9IfN8l2Jm+YKEezzKxxaZs0xb9BiseGfWy7DWvo+tU0UQZ4VMODf/oxgRvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jn827o7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOPbJq1o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jn827o7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOPbJq1o"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UCMTWC088626
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 16:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqmzBDzIc4d89YtrMs1rTRkin0CywGJKMq1Ax0RRuzE=; b=Jn827o7zd/+HD/No
	EIpHo7GPny7NNfIu9lkHRPmHBoE5BzuTPcFUgawUz/0VTDm1plCKXYBLpjRARPgy
	ItensockB/qrDsHtSonCsshriKOtDaxhWPyjqTScqnhgd+qYreVvTzWyMzBlzo3p
	vOlHq3PJLU2sk/A9HhXUknrzUtiIWJViUG1f3KYj/evzzFztaAK+FDkYlcf6gmVT
	g1GafT5UL3dmQsFK3IEYnCMe2A3M/X9hQSYc8NFaVpojaXG+ljhVA46VkuyrBHUA
	N5a07z39dzzGolinhWJZG8yKK57x92YZlpKKz+DZJM2LZFpRl0rIqi+PqQbsJn0r
	scn/ew==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u42jbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 16:38:05 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f6e373ba0so98328e0c.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777567085; x=1778171885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqmzBDzIc4d89YtrMs1rTRkin0CywGJKMq1Ax0RRuzE=;
        b=TOPbJq1ogE0QfdWjmPytcYt3hmFzs380rJUpON6FQnluxRVd80jL3pGC9/ix2zwoEw
         ALdaWBxxK6yAYYnc+sYkkvKlMrh/Ci/KAIpleNFk05Y1o8x6mK5G+vhUrovG0peoxHps
         ro0QyedlQAig5CPcSvpwZG6lvyZWTLuJtxR8kdcd03zehBygnMvv71CUkDSkmyWYkPF5
         rBr/Z2qiBvQDjYzkUM2TPExwb0/56YhiRbqUpgFFfRbfBfnK/Zlwn0z74fCS6u2jpSK1
         elkexWfEzp1e0qgT0HKMvEzkcgKyN+Al4LuTYn8udjUea1S4ouLTf3JF5ewNKP7CM4u/
         928A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777567085; x=1778171885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqmzBDzIc4d89YtrMs1rTRkin0CywGJKMq1Ax0RRuzE=;
        b=cHJLHFl8jkJDGPNSJfb2HA7d4U6RlizK/M3XmzO5WF0ktEFKyfe+VKNuzyVn5kN1zV
         E9as1YQ0R0wfSxmm7vxpO8bS54apsOSO7c6VQyisnKjzJiu+Tw180Edy2EqPpASYLh2m
         Ajm3ZtEZXzGMCsafidteMGhYgGPItF5uTxe8UAEQi0je55uUTvqInzYImicmaCCpRgP7
         KBFY0DGJFE/QcWNbtyUn7w3X0eUezwdjc0F1yBDZW4qarySJ88A9DY/z/Hxvw7Y2a7R+
         S7Gt1LB3VjUwMVI7L9uGpUrnJ0g53uYPOkqljoFwIs1XvILuVIp2ycz+SS2fxhZ/nvns
         BGsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8aJEKNDq86dADbNit+F7f5o3jW7pjjJ+PPnxP2Wq+g1VMcKueZVRpsCNs/UvOT08xvmwq/wSXjyWvl@vger.kernel.org
X-Gm-Message-State: AOJu0YwiTSkQveQwGdQK+YCXEmOlwJClSpQ2pZc8XVV4lWMTvrBjIdCi
	s0atlZsIZf95ooAUZThLKy2QPAkGarDqVPpYDLZu+Hb8SYKwvdEhB0nltm5xlXJbqbY9OMlxd1M
	SQhKPXD8Qfpz23602WvH0+dBuluHGC4qVaqLcm7ilWO5itT0NnqQz/uhyIjZeLe30
X-Gm-Gg: AeBDieud4rtC5RpYkbcf/AsjMNSvqzish8WEJREvU4KfdkksWghXi7NQ0d/TEYT7ysE
	61MMSahFZXdqDefzNEKL4No3DQGMPx0DkoUIbd4H6LP2/wiX7cCuB5XFPdftBaAoBnDLSrvLbeW
	IB/GBR8Q7x/36yGYSds0ZP+mxzlCoa5zDRuJdUwoLNdcIPp3813+BF4RkMBGblCBwEpL+SzSl2p
	Kn7zZ0CJFkDU7WcRqIIx1SGZr4V7Zonr6Uk+4+Dcrn6XmSuZE8TiaWVO2s5LhuX8brl9RNICIHd
	0qE2yYQdSzbalN8NumaLxl0Ibo6xgG7mfQsZoAUB7Z05AkLB9u/Leh6PX4ES96oNsDW3piTi4nM
	ol7FigOztfei8FM1faZTmE3kl9VmvRPaMI+vnz3Id/Re8SduLDdbW7ejDElay69S0UMm7RBnF2F
	23mxpTFqMw/9riaQ==
X-Received: by 2002:a05:6122:2057:b0:56f:79d2:2e62 with SMTP id 71dfb90a1353d-573c95e5c03mr618682e0c.1.1777567084823;
        Thu, 30 Apr 2026 09:38:04 -0700 (PDT)
X-Received: by 2002:a05:6122:2057:b0:56f:79d2:2e62 with SMTP id 71dfb90a1353d-573c95e5c03mr618673e0c.1.1777567084448;
        Thu, 30 Apr 2026 09:38:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d8c2sm18068766b.17.2026.04.30.09.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 09:38:03 -0700 (PDT)
Message-ID: <937db5d1-f5d4-4de4-879d-e6f4d51e9ff4@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 18:38:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Teguh Sobirin <teguh@sobir.in>
References: <20260430-ayn-qcs8550-v6-0-06a7e7b54aaa@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430-ayn-qcs8550-v6-0-06a7e7b54aaa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f3856d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=ggS85ixeqhIU1JcMt2UA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: pz51UsdROFPTkPCJCwDhs84TPk0iDZ4U
X-Proofpoint-GUID: pz51UsdROFPTkPCJCwDhs84TPk0iDZ4U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE3MiBTYWx0ZWRfX6SL5VVfz1aQV
 1ELNcIqbNJwqSTYtqD+H3o7fJgbkWdq2Aj/yly2KSTwEAAHubuzuFqkbtDt+8MO81bmR75CCb5v
 dIjIlpVKjCEschSfEcRasAL5SjcR1tBaCYDrLdmVOE4YIdtyO3LGyewpdVFqnpiB+a6YsZaf4y9
 DC2lITLf3VPVG03eoLx9D03XF3qzafF/wkeCUX6FhTIk/4hFwA1KSkR2g7yjQlUwEruQi4Dt8p7
 uXBUEWjxK/4HtrgqChR0TovQkQfcamI2etubG6v9LIoQ98NDogYh+dAHm0YbuI6rpwR3054Mxs1
 j015zaAL11gs5LR0ewBX8vHMP+1jBpzmsx32XBTjYvZ6tofg+AyykY933aHDvS6sjcVsdFWb85R
 HMpcaHUlXuT4Cm2lXEF/H+DMLmSZ7NWRyNQ6D90zJpfEB+YftwxB8IwFcYVNZ8UBjDJyY2CA/Ym
 A/QUb4L1xX4NpVWc6Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300172

On 4/30/26 6:03 PM, Aaron Kling via B4 Relay wrote:
> This specifically includes:
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
> 
> The original Odin 2 dts is not currently included as it has not yet
> been verified.
> 
> The initial port was done by Teguh Sobirin for ROCKNIX and was made
> available on the AYN github [0].
> 
> Support has been removed for things not yet supported by the upstream
> kernel, these will be added later when the related drivers are submitted
> and picked up. Such includes:
> 
> * All panels
> * The Odin 2 Mini backlight and touch
> * All rgb leds
> * The built-in uart gamepad
> 
> [0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v6:
> - Fix comment style in patch 3
> - Drop a pair of unnecessary pinmuxes in patch 3

It seems like we've had a bit of a misunderstnading.. I was referencing
the output-low property within some nodes specifically, not the whole
nodes

Konrad
