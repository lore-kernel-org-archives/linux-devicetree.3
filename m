Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8515472769
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842239; cv=none; b=cqYM8lBUvGynpEu04im1Lbfqo7BbLXNt5gy3le34mrOuLFzOi0qTpruIXDOJpMPn2GL6uXV+fiwqOef0j187+xpYPHAk11twJ81pFOTGkllSdHpyoSTOQoMNbjcTV2HN59A+J+y88ITUcWADEB7Xda+rPi8jQHwA67PPFcV4s08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842239; c=relaxed/simple;
	bh=KMyOHu16pY6J1De+EjL/gBkrSz+CmcDSFz4/6Ha9ewU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7bYZDwev1pg3UXCcr7UVWlBSpTJ5nNjfXrdp5Ls40CosyTBxn8jxRleMCqqw+z07QY/ClVGPrRw/LwtMMbKFHATbaeyZbEIhy0SDfCb+wNQooScvg/G5vsv66+M1keF+JEfyNxabR1olkX68/nMeXEcDq7NKNXr1y+zMRzp7C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUi6NUco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D13Pe69+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUi6NUco";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D13Pe69+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5BW3S1847945
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o41tmh/VLWIFNzReckCYUr62pFMM8s1kcNK5LrBLNtM=; b=kUi6NUcoo83jJfJ9
	VGg4av0vwR67RaHD4YGqKISYmqQBLkSbaYFGgT2p7t11/qRyFiaPakIPnx5tnDK4
	MRkt0F5xks4ZqW+6G0zIhsl3jbjfBF5137ceVIWCwTmMQVWIpOv5ki78SbIqQugn
	7nW5hANLiTyPfx5PI2JbqXpMcGwdSZHlvtXbzhAzqaVhDV5Ihlb3a7obRCASpd/4
	hSc/ng+UrD42yD0ZFdtFVwtI3uozW5RyJjB+j//vHQ/MU3q/PEdkPD33R10IiBbp
	hLRWE/AToOq+PB50munjSmf9tKPDjmhvJehFs0YE7Shza18b7FUSdypYWx9VedRQ
	q1IhwA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2vd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:50:36 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5751990b248so790996e0c.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842236; x=1779447036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o41tmh/VLWIFNzReckCYUr62pFMM8s1kcNK5LrBLNtM=;
        b=D13Pe69+G3dnw7Q1bsqN2HDoaoJ5/lw01ZkrgdrUix+40mQmXiYDDn8AU5sa0fGnKC
         2ac6JsnHdLCrJ0XBo0HwCEcbvLMS+dvpcqvnfHcjWd5z6bIzpLOI2xc5D3Ljj0/HOye6
         MXdLJiRWSX9AT8Vrps7dMrNT9IiR0akrFi8L3t7L7saZYog661sMeUF1Th7ejqxIXhuP
         4AwOIS1+f/nujslMbgaV+4HL97rjIev9iarxlUQOx3DV5qx3pqvqJlUFLnza1AltFY4U
         aXsfd3NMHzslxQ0/yiXo9LRBsNqkAeikCdzSSmQQLm/SmVKpWcuGwMb4+lyHYlgZfQ9m
         9ZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842236; x=1779447036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o41tmh/VLWIFNzReckCYUr62pFMM8s1kcNK5LrBLNtM=;
        b=ipBLW7hmdbQ+p0wc6sqSW684x7xeCPxekRVqZaUOOoh/AxMSPvCXKmqlw2apMs7gMe
         LPBp3ZZrvba2zORwgpEKS5vB/Ga1pc7loJlzbumT+l9GdDG10QgX0ABE4dakQjCnldFs
         vqO0T1zxDU0MHK73NGpBRlXfxRxAZpmW0E91hrVGYnc/TO8zJzHjU77KpzH49yMBaOE8
         31OsTyQ5GbSm5boo5HooLB9Zd4Y+hnBeeQYG8yYbcDySsCQ+cYuTecVErqL2x5f6vtdj
         Jb+T2oblIVZxdwjzEddMDsgfAYmhAIygE8Jt81viEbTcoqxt+1V6cBTbYE4j0/lob9v8
         dqoA==
X-Forwarded-Encrypted: i=1; AFNElJ99ltIvQS/6nR2/gMXhYYSjlohGF0s0wT7NITJ6pdhuAksvJDf9PW3XpT+AjgKlBdU9cuVa6nbBr0UH@vger.kernel.org
X-Gm-Message-State: AOJu0YydY/Cex9LFXOsIuLggYEDTA1EFMUYieRZsOR0IG0o9t/VXSoSy
	R/P7hkkiWPUqC0L+bjiVv505cjaQZwU69zRN/0V0V+9KAU52zggyndQsRkJitwYhUsPIXsXm5Vm
	hAsLEtXfb4wlN/sB6z14Lbmkps2tN0dYmBRCJ0x8b29+m3tEA8S6DLhGomlxamLnx
X-Gm-Gg: Acq92OErSytjIh2Xz35Pc8FdqXzKqUX3gzXIipm4ydhxnWKyYKbzPk/vYIrPOYFKsxa
	O9BkD/Vjn7jzCHlKxS8Sn87wEpid8TYgUEpdj8EW6319Y4DihXtLHrf3q+Zul7awhtNITUNOrXE
	qXliJSlO6yMtDnZaNcVQpv/6hO+ZkbfWjplI00R19p6DPhbqtcHkNgw6N+ZzRXas/z704+GeDKH
	YO45fZuyzkAZ9uXoOvjOJ4wRP0nq+cm9PZm9r0h6tM5YeZ6G70wgEDuw7LjBFiUcMbxAc3007kZ
	sOAO2FxyYdxsDWBfE1O7F8L5n0tVLrQNYQ2awITTuThALqkTu1GfGzxKGxZMPvcIJJi74LiR1fQ
	gYuETaXKxArX3MNhZzMRiFmYhwmcoXvTQP+L8cqGQxICq7qXQaDYCPTJPZyX5zKtX2dUaj1RxIX
	M6ly4=
X-Received: by 2002:ac5:cdf6:0:b0:575:24c1:f67f with SMTP id 71dfb90a1353d-5760bc6cd5emr567254e0c.0.1778842236364;
        Fri, 15 May 2026 03:50:36 -0700 (PDT)
X-Received: by 2002:ac5:cdf6:0:b0:575:24c1:f67f with SMTP id 71dfb90a1353d-5760bc6cd5emr567245e0c.0.1778842235935;
        Fri, 15 May 2026 03:50:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c631e2sm204793366b.28.2026.05.15.03.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:50:35 -0700 (PDT)
Message-ID: <1b741127-18ef-41f8-b645-707083d7a921@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:50:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add watchdog node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a06fa7c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jxJJZq3ZtHt7umw_vL8A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX2Rzg4QAzR71e
 tJWQ4qgY7cfK1hDFmYzZQUl4XQLUz8dB5fM3gAz4MzDVqHFFko4Uetx2MrCUSV40TzAWaHN/p2f
 E4tSfk+D7eKbUdEX/+7L7N9WvnCZxMpibuDI0Glm5rkh3KXUMi2xlfGMxRyYwMgvLotX7y2KMzv
 oG4r0QhJO7zKu3DA27kPEEnaZPiQE22ee3oaU1KAGh49rmauNhv7zdCRi7A6BZPQ9UcWQl8STbp
 PVtgIPRiXWvyzb+DYHoe2YyG9RywJt0ekejy8P7ujCm1cSAIimTx6uAKn8oLpVjGRZgEzAUsSNX
 UYErqbjAtl1PzybgRDmLieL6tx7AnhWwKE8hb5/ji1GCXi9Hu3mG63LPYWScA1zpp1HsWA3nsNV
 TTsHmXQVSeNNAsjuR8oRTYE72OuUbAqTccryET2FsuRh2P3XX28YQ8YM72mKSAMxW6FL4f4R33x
 KIOSmPFQLze8waH1UAA==
X-Proofpoint-ORIG-GUID: 0By4SVBpp_-g6PUhovdC97BQ77q6LDfc
X-Proofpoint-GUID: 0By4SVBpp_-g6PUhovdC97BQ77q6LDfc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150109

On 5/11/26 12:56 PM, Kathiravan Thirumoorthy wrote:
> Add the watchdog device node for IPQ5210 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> index 3761eb03ab24..2cdc10529c48 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -236,6 +236,13 @@ v2m2: v2m@2000 {
>  			};
>  		};
>  
> +		watchdog@b017000 {
> +			compatible = "qcom,apss-wdt-ipq5210", "qcom,kpss-wdt";
> +			reg = <0x0 0x0b017000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;

Are you sure about the interrupt no?

Konrad
