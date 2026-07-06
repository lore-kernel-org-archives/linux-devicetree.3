Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517232F7F00
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 05:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315356; cv=none; b=ZksEOmfwgG4T8Ml8NyXTp9k3qZcktCCuYCUSKuys0QADjZmF7WcjKbEq5l08wcSeJ3yiQM92aETkVf+pjlzmnRgFRQUkqlymktLVGETqz+fbn25qMX5HUx3y4/x80G3IQfORNIAFjgZTYPXs51UuovOd8Eny3y4/L6tqk7hexTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315356; c=relaxed/simple;
	bh=fgHrxfJ4suBUW0kN+8kLcEywmhNEd+44JP4hCrz3Cs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AGRmWmJPOhmKYCd8FfvyjmXxm4ogiQkI3d35gwjg4gmejg3yp6Z+hGc7fTDASazZtgar8ryqJ5RGfnQyyJaKRsos4sEXFpMNkfLSrEtvwPW/KtEgbpoxsIwhhP7mt9gswQNx7FAaGv8C1V9/5FR03qy34IqubHPX6/RbTdIMii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyuSX+PT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MG+2H0Ff; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyuSX+PT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MG+2H0Ff"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641TeE3470434
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 05:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4/rkxRtX0uFMh6gYc/GZ4w+bhzIdW/NE6ERvdxmeV8=; b=NyuSX+PT5xfcw3hE
	vY1joPs1yagJOjhbrj2c1kivpQ/Q4Zs4kDfZYZRLxim8JElKPUSBZEDZFvaTTYTR
	6sjrHJXg1jI1KweZPaoJRA554xcXicrOXPDhpk4nDSvZbN350b2rG4Cvhay4x5SW
	2smmY2eFF0ho6W4l/n6iUXApA/4J0XmeYHT4nYXUK33mordC7Av1O6plbRnxuaa7
	4q9U+u1BvrRJrYPlG2IMzza18hKO8XZ3iMrkDaycMsyzSPq6p/K2lvAfH3VrSMk0
	o8LKmxyZpgZsfnjB74tEwX5CIxfgwF0zu7GAO31c4d0ZZqn4uvSSoftM1V9ZM4Ts
	FedYvg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txembmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:22:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so2314373a91.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 22:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783315354; x=1783920154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4/rkxRtX0uFMh6gYc/GZ4w+bhzIdW/NE6ERvdxmeV8=;
        b=MG+2H0FfUC3ULHBmq9AsRjOq79WaLvS+0MM/svHl1r1j6MTJvWnQrJFE1tF1IVcbsO
         Q/1/8Vdfw3KRv61lRnbs9sjusHgFGBV3FGN0jVDoqdtCkjEypqSwxmSbOeD6Pn41yAv3
         xczNxWPhSYMcMFZZfWbcbedI06Ppw0BblGkUGlqAxu7uMP6gbeqhA45nuCmLvko04wJw
         yhZBcOfcExZLomxG+DZGAjhgWNHF2D38EQDsHWegSLnpJQzFPitibBNFFtqseRv5aifl
         6EKF85zumFLb4z6WBG8Dm/X5LPqhFTWB+d+85labsQ0sOFQjT53peOwqILqij6AMw6BS
         TuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315354; x=1783920154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4/rkxRtX0uFMh6gYc/GZ4w+bhzIdW/NE6ERvdxmeV8=;
        b=h08IAkdvCkObrAJBWwNEUKQRTYVAp/TLoIWYnlvJpm97hPyxGvgeDRd3AnoC3bdx2d
         z4+Dbgx0S+ushFGrSnYwy9+YLdQPJuCigYXSNZ73DP6E/+YMTy4yli6nsQa/eGqehKwp
         7IbiWXnKm3nqqFc8+NmI2ZCK0ZOWV9vrvXgiGpURc9TMPemOQWlcAOuPwk8y1saczZQi
         P5v/g4Sr6MczTWIocsghjylVMxXAjJOWe73OLosn9rCcjs8UoG7Y3j/RZfsExvBqOavE
         9lbHim4ZKZfeAQVprSiqbRpNU1vIWcJLdnwNh+rGhpe/uOIsBPodw/pBE6DSTgwBJVzj
         hLwQ==
X-Forwarded-Encrypted: i=1; AHgh+RonJGujYZfW01xIh1vI5Bd7cGhpp1XB9FbppHcipreS5ZRWQYLkEVzpzkKl3AJmtM2TCXtLS6jJjQwW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6qYOqu/MUhEw4vjJ/6CRZbB3TJ0tlfKg+8b/IX9tM4ki9MFG
	pawWtgwsoNJquSeN7/Rl0Jc/LBzI3eytGOfpzs7ePqTAl4/SC+YI5Q0aFF/EAiCxybpvoEghoKo
	H6EoWN1eCwaSNAXCXbQZlqib8/QxiuP4Syvra9LjzkUk023SLr6GnurwydrR3mOcO
X-Gm-Gg: AfdE7cm+Nby5xp5QI7YAvwqND60D6c1hT3V9tR4BFkHFUnenGrUKKZewMFvFqoGw0t0
	3ejmmkKelo9lGQuKui4sacP66/U/yiI7VG7XIDGf5XgcL2ODZgUizGA0mcXLCmc2GH3zdxS0R58
	USS/9xkxArdDw9Vyc+LrGQh7sQLxnpizC66xbGIcW1J3NsB6fgFv5ba3cofW1x2QfXGlP7Fi8/t
	KJRp6Ach3alzYIx1+Z4Nd2wur+wDj78w+ubf9gt6o7XSjNGdfHO8DNTCuZZ57QUv72LwooYZaZ6
	VHvFvFxE/wlvdUYxIxR4ixNrRtFJm+oEVr5rGY+9MhG0Y80nud7ReCohOmJxczp0fiyk9qep3MK
	6G7g8AVXrqlV/2UHPMkWliQ6XzQK0kXj7K/fmM3ukaM4=
X-Received: by 2002:a17:90b:180e:b0:37e:10d1:c05b with SMTP id 98e67ed59e1d1-382933033fcmr8550245a91.22.1783315353942;
        Sun, 05 Jul 2026 22:22:33 -0700 (PDT)
X-Received: by 2002:a17:90b:180e:b0:37e:10d1:c05b with SMTP id 98e67ed59e1d1-382933033fcmr8550213a91.22.1783315353496;
        Sun, 05 Jul 2026 22:22:33 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127d147a8sm4232021a91.17.2026.07.05.22.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 22:22:33 -0700 (PDT)
Message-ID: <b5a6a0a4-4c7e-4fcd-96eb-54041c29ccba@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:52:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
 <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
 <7ce4844c-8025-48e5-a1fc-4d1cf9f7917d@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <7ce4844c-8025-48e5-a1fc-4d1cf9f7917d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1MCBTYWx0ZWRfX1Egs6GrtVepV
 SwQhNnWmeB2gy4gPIws1eXqTgfCAZHK800/82YQH5uz5yoY6U4lFuiST9En6HYB03HxWhUyG4cE
 16W7DT8s186jw3M1OZl4hbCmgw2gy3o=
X-Proofpoint-GUID: kMsXUmwDrgRPmzcy535mPBDqjy_yW1-P
X-Proofpoint-ORIG-GUID: kMsXUmwDrgRPmzcy535mPBDqjy_yW1-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1MCBTYWx0ZWRfXweYyY9527/V7
 8LDRFlkwBN7A+itfqiqytfOc0eZmGDu3QV1TWnVWzLJMPZzWGWMgPveFL4qO5aiXbZ/aTR0g9eq
 NXFCKIy2Xcdt4qqVoxwK5z53wJLsNWvhBSMq45uNrAwyFcNKHfM+6cuFEPw5jsgxfee9zdu1SdM
 oyjXJMVIbLgnNJd3ESq27TFe3+PsQwHXIico/RdOOQAHUeUTBwrfrLiA0ILkaStK+Ebm9iVfuHd
 XAeXwEfZ3LD8wT31eh6KoEN+QjYOUP/h8M0gMEEwAxH2GwemoohcA80cl7DCmM3nFkPQknZjg3y
 RFWyamgLxldBrya4TKjEhDPrWqFy3o5X3WnrPux3bVbMns/i84yja8vFwIouwz8USCwd5aOX1To
 Fb1VRAt48B0V59GrfmwNhkBnUdNDNDdFU4Nq+aBwgelHhjPPMbCUeNewGjdISp2OqDCy795hv0h
 J+DQ9rt6yWzR4u/CpAg==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b3b9a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XhGPO_9aslPW_XT5sbUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060050



On 7/3/2026 8:39 PM, Konrad Dybcio wrote:
> On 7/3/26 2:38 PM, Krishna Chaitanya Chundru wrote:
>> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
>> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
>>
>> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
>>
>> Override the base iommu-map with the expanded set covering all the
>> switch's downstream ports (0x1400-0x1408 SID range).
>>
>> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
>> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
>> from the PCIe controller.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
> [...]
>
>> +&pcie1 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie1_default_state>;
> flipped order
>
> [...]
>
>> +&pcie1port0 {
> This port should also get the compatible
for pcie1 it is not required, only for m.2 connector we need the compatible.

- Krishna Chaitanya.
> Konrad

