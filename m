Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6EA37E2E6
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263077; cv=none; b=LaYQUwHus/btpXLAXMAXjBeZZf3epfdPuSYvMUbA9Rc54wah8BS9/dY1FUeun4UZLAHoS9hxYJ6Y3kyOSB8s6R2lezn7xLCdGm8dTFVKeeFF1PCUgXknKywBUybtXRQw+Eb+VjLjNRmLOQ+6fJBD0B/s1vACQLsqnGDLzWniusc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263077; c=relaxed/simple;
	bh=WetkROzsCjHpZW29EE7hjoK851wNICws5WgeWcD5Q+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dL5dPo/YKVMgaRQBKeA8j5XXXtSWQD0igEIBzixQd5lglR8VSGRxN3M4wWJA5aBqZtS9p0SqIfoXznpe8HOpGjZUa2AdiIzPtN9B3KzB4tRMYkedITRvoZ8ugtTaivo8T+pQtlcq+2ZsstGVwsLYODt4OgfmtS8qFJ8WmlRztIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INiS6Jpb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdkNg5J9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INiS6Jpb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdkNg5J9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72Edx075280
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvVAGvQ8HRCve2hdxj2jFpuQ0wBfMspeRR4KB+mva4w=; b=INiS6Jpb21ZJDnxE
	4HuYuZj91w75Gwq7tLzdpN+MWixjGblUjMhSms2Gt1ac8wWXpBvVkZQZLah1PuiW
	LCUKIru0YGIrgIWQhIj1NTlsaD15aOpJszlbtwiRjfYgPMi9TCa3ourj3xMZbN/D
	2I740LZay/0JA/2EghXmpC1O7nc8xEixmoREHQNIA/JZLgsZtlIuaUl0OCSU8hKT
	Oc1uB5Di8UQigDSRxwkidKFu3e1YZNeU0DXY84q0v0y7/qYUoSPp6ivy5ayQxV1E
	bSZx0kdVu0Ed4ejcCkToCEGCFFoXwNuoJZTN8vADLtB6xkpVDmB+R51FDa2YKibe
	lISv5g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e55jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:51:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a081737bbso51086766d6.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263075; x=1774867875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nvVAGvQ8HRCve2hdxj2jFpuQ0wBfMspeRR4KB+mva4w=;
        b=hdkNg5J9XjgWs6vByw1nG/82gBsdNEoljrNeu1m9nf4JfVRVfz7iLgTjOuqJp3zBnx
         jTDE+ZGIxaNx5BWOsHbQxGjQmC6/ud+FVz4pUI9+sW+J5pSWSs/HpuYFRGG5kyhUMj4b
         YF+c8iLrozfd/0JmyHcd6F8SeQTgH2x5wiU4FKKHsD07NSVGALzRpViZgED3yWeUDW7b
         u6tZIrjXeTXXkSGR+tx6X2hSNXsQjcmgIHeRnRk/ovP4P7/Eq/cGDxnxCGm+XfozVzas
         h2L3kihj7WHwy9ydm2n6K0Ye18hDYXnYe6iq6SwiGzZaqMri2ri4OqqLLlXNKVcJ4XO7
         WEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263075; x=1774867875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvVAGvQ8HRCve2hdxj2jFpuQ0wBfMspeRR4KB+mva4w=;
        b=NqjC51MVOB3kA306B0dNrhCLt+7uzyeqS3hHbcAjKou6EWFI4sa6vvDZ5hG8IXQslI
         JnpUpZja4Z0OY2Rq6dusDzV3tEIoaH5js5J/ftIh7rMrTObOTEyDtu+JcrOHklxfKAE+
         CqMKQfJd6KiDrZU1zMk+AeKdHbd/wy6V2k14x+6ILj7uljM/aaMo8r89+6MdYvNJWNes
         PNjYayWIQk4QDDX3mp+Te8MJHdV5Mju5hVLXjuUKMmB0bMgEAt/QsBbg7Rgh74LaoSqN
         Y8nFwLXNqqwmERbK00BGBtH/YRGiH8hB0rx1Jvc2CxmyChEb1TcWk/Mhmgatr5Bs2BLK
         Rndw==
X-Forwarded-Encrypted: i=1; AJvYcCUXhaxdisjmL7W0ehq/Lb2G76jhGHpeCzxDUIUD1e/NRYLmRkKd5irHo0NUrvUJfI1oHQW9PZkG6Muv@vger.kernel.org
X-Gm-Message-State: AOJu0YxNLNWL6SGWvz3YbnvL8choAZKx90P3RCA+tIOiVwrl2idYfiCo
	RJ9vtHAfyrO8rrpheSAuXvtYu93kjxLeJiObaJu0MleP++wExhw6U4ad3mytrns8GLw8LwQoEdL
	n5pzJiSUGQ5KqkZEn1FGPRl6yNek9uAXgl2w3S2WGWsqFKk/8W1neTsfiTzzkBlOa
X-Gm-Gg: ATEYQzyS1cWdbBXK4gWCYlSPiUckCxaIS3HCR7ESumkbx3rQ5oah1GG/Zuz7dBMqCV0
	EbhBaSVELYw7yIzUQAuJFheYR71BO972LN/xE/RlFH84MqGrcB2nXii+hiEoHKqddO3qmyw38pi
	GBu70QmZyHlP6UsGgvklgIpbhCzqsUQGlCn8UtYmAwbRVdsufve6NJnxwNGfRivMocBXRWIW5g2
	w5f15Kv9q9r9uVPqTgMdblf52Jlz/WCQVGKIGZBghCk0ZZNZ+48+v341pYA9GhKcBT3toEXbfdn
	WnxAt7tE2MzwjacEvUa6pKwXLRrz+28s9bDUrpolBs3GTD7xD3/jHZ8689tw4uA05JuoiccxNn7
	PEO5vQbi0VG95c1+x42bDjt/9n96lC0RHMfskaxG82AWnlUjX1FogCt0k/wJOBwhVkMc2u/GQ7p
	ETNIk=
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr44693871cf.9.1774263074647;
        Mon, 23 Mar 2026 03:51:14 -0700 (PDT)
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr44693741cf.9.1774263074179;
        Mon, 23 Mar 2026 03:51:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de182sm472066666b.38.2026.03.23.03.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:51:13 -0700 (PDT)
Message-ID: <f32a09b3-6d9a-4bdc-aff1-0097531b4f48@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:51:11 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza: Disable UFS MCQ mode
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C9UGBphJ7A8tbPpKGMu571ZAiuLnMYFt
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c11b23 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nub5c3HCzl6ex5IZEPsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfX0qNG0Tm8nbPL
 IchOBULErVWJBl3XCFfqkeM6aSI70wpU6EF7QskWliXEcHLmVA2MAYC89nufs9UEAG6q7ERiTj7
 cqbM3sslHt2nTgwffwoeEjeUzEpty/qkkFtPNQBLrWOpg2kahBm/Ku4BiSuyvJXZpvKHun/YGgo
 KTq8gV1+iFmMJRFj1dDQrM3cpInPBbhuiD1wCx9LwcGrlg8Y3guSSkC1ZEJAZtECydce+wh0g0R
 0B2Zls3gyEtY3t+NQshGx7OCYGcLOPoFSdRTbcTQVlnUd4PuixAUwawil+ZESeXrJcQ/zoOTsSl
 fgTdabf8WhcmedbUg1Y9xUnwWWe/mjl3KAJDBvN818WHgy8RSrneNuJZd4oxbkj9BZnZ3l4p3nC
 xQyEmHQlxmpBfpGWsp/q+xgLTeTYBPkLquPvpe9QK9ZD3dCk/3hyWNQAaqpGfg3FI2f0/r7SMLh
 WFDfyZ7FJ9TxKYSvb7w==
X-Proofpoint-GUID: C9UGBphJ7A8tbPpKGMu571ZAiuLnMYFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230083

On 3/22/26 5:08 PM, Abel Vesa wrote:
> The UFS MCQ mode is currently not functional in the driver. Eliza is
> the first platform enabling it, which results in UFS failures at runtime
> with errors such as:
> 
>   ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 4
>   ufs_device_wlun 0:0:0:49488: tag#4 CDB: opcode=0x1b 1b 00 00 00 10 00
> 
> The failures occur when accessing the UFS device, while the controller
> and PHY initialize correctly.
> 
> Disable MCQ mode by removing the corresponding register range. This can
> be reverted once MCQ support is fixed in the driver.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

+Mani any idea?

Konrad

>  arch/arm64/boot/dts/qcom/eliza.dtsi | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index fab603cd8e42..60a3c861a5c0 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -743,10 +743,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  			compatible = "qcom,eliza-ufshc",
>  				     "qcom,ufshc",
>  				     "jedec,ufs-2.0";
> -			reg = <0x0 0x01d84000 0x0 0x3000>,
> -			      <0x0 0x01da0000 0x0 0x15000>;
> -			reg-names = "std",
> -				    "mcq";
> +			reg = <0x0 0x01d84000 0x0 0x3000>;
> +			reg-names = "std";
>  
>  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>  
> 
