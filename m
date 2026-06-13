Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC1F37266C
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781342652; cv=none; b=qHrELaLUinZAM18OAhRF8jx/thYr6cilYH3I2WuzvXfu5QaTClDaCNoY1c1w2ip19QpKNOlDFRjGs/sYRcyyugQVUaZxj/6U/RqqaLpB9aTJpMirZV+XULKsdKkxywOMOCuirskujcPEuG2da9IP9xYZ5hoqW6r4K3UMkwXPfxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781342652; c=relaxed/simple;
	bh=8cBHyxhK3M1DiH0ERPP2rDyVMsOU2ZvsmDqgPW5FrxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELUG+oYfcEbPSSKnVD9LMmxE2/IygU3X7TlhTm3n31G0P/NoZ4C6Or6iuRyltuG8h3fdVYiRrDwEGR+/Pjtb+hig/j8fVC0v24i3fjoq9pguMODHiR2EjjE78/Z9ndSGKTa3oBEZD16sxSBV5UT+2fGb9ct7LDojaqmpWF87818=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXseLHuH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFPX4uLp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXseLHuH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFPX4uLp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D6eXBQ1747038
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 09:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4S/HL/NoFo2ZHKsSRY4P5EPW0iAMj/MKdhO3xQ8vG90=; b=XXseLHuHd5l61azv
	uiiExBTObCduDSU8Sxvqz3MZwx1rLS34gSFrsJFXlMOy1kvg02/jMgiqfo77TSFR
	rheZ7sjCvjxAms7H+LedobecItRjAY/dEiHN5rLUVMmfo4Autxh9MBkqzRhAkSnk
	NKpGq65HnnOLoZU2GByWNRa7WBQ9ptXm2xA1bsf4RXuZ6FowVaPTIMrWMIZauSgZ
	TMky8B1AUm5fYi0OB4qQ2eA+5HeRHVzRGpczrCQhHLc9h3E0zMDN73qMgSKuYq2p
	YDUnEsYcXLv3XvInqBTKo/QEHr7kGXIMhLjekJJgp60K2CEmSfHuqqCb/h+F6aq6
	siw5UA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye10my2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 09:24:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915d1d4fc5aso297941685a.3
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 02:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781342650; x=1781947450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4S/HL/NoFo2ZHKsSRY4P5EPW0iAMj/MKdhO3xQ8vG90=;
        b=MFPX4uLppbkMVpUdTfukZ3Pk2dkilfZ2zlWHFGsahvJ2iq3SKaS3+j1uY0FGByOW0J
         5QJnY5wPlzo+PT+Jqmw88LB2su5mFTPAJMxZPgVGuLpcgAW4lgFPAeEMdh0g/S+6uhag
         QBBqei08+e2DycMAXKGwsxnfIRvdYVfD9xiNvc5qNNPH3RplDF2OB+YskR5ME6awqgTS
         AYuNvS1GiPYv7uzW1rNiw+GjOgYfXhtLeT7mpHNvrdR8SHbXocnkpegyBBVqg3ahB/Zf
         mZxag89/+uIxdRqAIzx24ZFmDHG/UFabUT1nhwRPtXyoEciPfzeZ4feDRyo+CCD75W0Q
         d9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781342650; x=1781947450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4S/HL/NoFo2ZHKsSRY4P5EPW0iAMj/MKdhO3xQ8vG90=;
        b=LBj2ZOhxrvLlOm+72Gz9ryDQjuLxDUXLDUupmdsgskODOwvMStJeeveyv1b9oYHJUa
         MckKLhd4lm5Hkf4YAbUcz6Cdj6sW6LVxt11hf5kooe2/OxpH/j/h8l9WGwqcwBcTFAMH
         ucm8g1FX24CdZ82Q21UfU/3r41QJU4kONH0SHtnDKciyG3AgxjbpnD4aboTPICJOSTEs
         9hE/S38ZAuF0M6T5efsbEeaKyI723mKiHd73Zoc14ps2P24wMx5q0FTgFpvqPnFn/vTF
         dpQvYy6o45d+YtRXr/CumAqFyzCbYvIahk9Mp/fwu59hyhBaKriq7jm4TXwnX3BQ3ijk
         +uaA==
X-Forwarded-Encrypted: i=1; AFNElJ9p/i6JHQfgyVMXIi1eOA/PwcqmbRGVkivnA40Z/ecwfhjaVgcUpbcK9KX0PpEG2LDm9IbEiZz2Cr8c@vger.kernel.org
X-Gm-Message-State: AOJu0YwQT6GopSPdKwzmnE+DfPkzI2uXFOC19NHJkN2Q5SSXE7DBWX/V
	JfbE1R8V0MkOWzKkk+kGqtoLRinoAMSBj+FC2/m6Tm+LkaDWMjg9Zl4IXz7C9vy5j09h1xTbF2U
	sK2xgw8tgg6tDuD5b3KksDH89LiCgDygP2cCejAfKatyF6ZDOfO+b10U9leTRq+/u
X-Gm-Gg: Acq92OGp0lM7vOG5bh/84u/PRal5jq4AHti+2IKaEK/OYdn8BGyZPudHQd+gn26E7or
	nSUn5xxcbuMhvDgUKhLwmNes9jMXo0CLdrwSKtRJYE7bVYUjNyJxBXuJVF+5G/38EaMlWfa0EID
	j6Q3aJgBvAmGKREZtgxRaUoeNmkO3D7/6lXyboCYqd8vzt06TnzdQ9mfS2142XV0j27m/it4elV
	qazCqyehYAYU4X0VVwyyRiN/dN0QkO6veQv8QRl20fZ3ZQfQsm0+H3Kju7Ts9opeqWzraDzrCrT
	87ICx33VXZu+wmude5DvK2ma+7PLK6l/rVQSlHxwLTgsYTZXHnpfsgjH0kJMKpO0+B4VkrUKUKn
	07ivuovG263HnQjUisq7LG9dwG85FgS7xme19G/Cjz7RMIqsYH+zQXw==
X-Received: by 2002:a05:620a:1b99:b0:915:9e84:85ee with SMTP id af79cd13be357-9161bc214a6mr962484485a.15.1781342649975;
        Sat, 13 Jun 2026 02:24:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1b99:b0:915:9e84:85ee with SMTP id af79cd13be357-9161bc214a6mr962481285a.15.1781342649407;
        Sat, 13 Jun 2026 02:24:09 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8341840sm201048166b.43.2026.06.13.02.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 02:24:07 -0700 (PDT)
Message-ID: <3d4e0147-8e62-4872-b881-1452f5e09e85@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 12:24:03 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
To: Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <n0iPW9ltP_HyfKgagM8MIvaGg_NF7KvUV834b6MPuE3llz9v6B1jdn6wEvXMkIHS_zLRsjnb7pXY3dURUOSs9g==@protonmail.internalid>
 <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
 <8d230cca-2023-4a13-876f-d5db8eb200a1@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <8d230cca-2023-4a13-876f-d5db8eb200a1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GrktJSzF441txc1DQgTWJYZBpdKd_srR
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2d21bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bWlYEoAHg9xnmN_O1lcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA5NCBTYWx0ZWRfX1kF6ER/u0RYK
 TNebwdeqqL70ajjKsdwmwblOs2Nh8wNTolTFT07Q2a14MGvgnDn7nlJpo8WvcTScyKyZ0jJG0i8
 WEz72H0bMbGqKOlMF5bvv0Y+W9Iezyc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA5NCBTYWx0ZWRfX4lxBRjbGmXZX
 sywWcQAc3/xmCBIsDWUiAPgZ7GU384Kekx0hjnViHkca/2j94cFCHe40l+7hhfl33LWtMY1w47I
 8SO/6/JAURV6dqu7xAOf9A0CLB5cF+pChvW2dEXWr5QsXhTKzGEJsuK7BE2ikKZ/UP5B/OyZL10
 rHgVI/l1DXe47QWjh0ncIgdkFsJjJp9sIVgFOSJVYNDD/MT4l2RMS7o7byEcMXQ9n1cnhIIR9F8
 H415q+31522gmWlSxl75rtRgwMeudOqByKumptHK5flEvz5qupJaRi+4JCLN0fLeHLY9TDDAr+Q
 aqNwYH2cg5eYsysjlgSTOOnqU0pJt9McYlmv63yP4CzB2L++AnquTFGruOi6R/t/6szhZkZP7KQ
 j/2I0dVyskSti9wKVrkxy7WiUZHtuvOhCED0//6Ata0LDztCWspWiRjsp0PYOcqk4A3YPOg/YPR
 84cgm1dBpRLkSamjhug==
X-Proofpoint-ORIG-GUID: GrktJSzF441txc1DQgTWJYZBpdKd_srR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130094

Thank you for the feedback. I understand the reasoning, but I 
respectfully disagree with this approach for the following reasons.

While it is true that the JPEG encoder shares the same camera NOC and 
power domain infrastructure as CAMSS, that is a hardware topology detail 
— not a sufficient justification for imposing a software dependency. The 
driver is a fully
self-contained V4L2 mem2mem encoder, implemented like every other JPEG 
encoder driver currently in the kernel (imx-jpeg, s5p-jpeg, mtk-jpeg, 
nxp-jpeg). None of those are sub-nodes of a parent ISP or camera 
subsystem driver.

Making the JPEG encoder a sub-node of camss would introduce an 
unnecessary and artificial coupling: the JPEG encoder cannot be probed, 
built, or used independently of the CAMSS driver, even on platforms 
where CAMSS is disabled. This directly contradicts the kernel's 
principle of independent, single-purpose drivers.

The shared hardware resources (clocks, interconnects, IOMMU stream IDs, 
power domain) are already fully described in the device tree node and 
handled by the standard kernel frameworks — there is no functional 
reason to nest the node under camss.

For these reasons I would prefer to keep the JPEG encoder as a 
standalone platform device with its own DT node, consistent with how all 
comparable JPEG encoder drivers are structured in the kernel today.

afilipov

On 6/13/2026 2:14 AM, Bryan O'Donoghue wrote:
> On 12/06/2026 20:44, Atanas Filipov wrote:
>> +        qcom_jpeg_enc: jpeg-encoder@ac4e000 {
> 
> One key bit of review feedback I gave in the previous leaked version of 
> this driver is that since the jpeg-encoder is part of the CAMSS block it 
> should be a sub-node of camss as OPE, CSIPHY and other blocks will be.
> 
> Please take that feedback onboard in your v2.
> 
> ---
> bod

