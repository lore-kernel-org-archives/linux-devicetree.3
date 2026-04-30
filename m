Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F33446A7
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567720; cv=none; b=oJmu8W34SW1lBv4s3AK+cIjRJbCoRsgURsv/sioPd+A8+WlpUCgU8CtuiqB3jeFD557EB4ill5l4F67ZT2SVqIwByJkn7/9F91o3R2KiLCYMJ3wK/GM0X/NLpMrdOfCbs8VhZTLilvbBBj0a+YSX+vnC6ODhodajoKL9iomDPAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567720; c=relaxed/simple;
	bh=iyHbIkFdXPqVIKb5+L3th6PStWzVqWAUPryssGRqqWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WrmNs+W8BbE2VcMbM/90lMJ0e4D46lQbjPpOoCTRBMmUtsWoVRXeGPDcNYmS2wC/PJ5XiMJ4qvIwlgPcrsGAW7vnzJmOs3aWW4N/uyEqXC0vpmig0dsManhuTEwdlgTPGGAiB/vaD5UrGUtzZHbicn5xEdAEGmgwsQi+u90ZvFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIFTqGWt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTcrCQhF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIFTqGWt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTcrCQhF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDN1jb564091
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 16:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SV7o9l8CrqKI3O2AoXkSm6ZCuba3HAZ7LYr0cPU1ZLw=; b=ZIFTqGWtrPS7GYxw
	DtQ+Q2j/lx1w7j5e8vt9Y3cXUiEzXkQpK/JIJirhMTfYX1gaMpft1DL7Gu+WexdD
	/3al3xWvIU8I/cp1gZ4sMx9IiehupzxCSAe2W/W/KSn28mFfytoJF44uglxGDDUj
	tqjswAjT74hwz4AoDoFG2Pa9d4SEnxziHbH4HtYMYLQKycwJyeYDDP5QWJ+GOMnv
	plYIyBRagjkiHbN6GIakI95OjF5S0geQdaSTKViSD6xy/IWGRqqjtxp4ThYP3mvN
	hmpQwQMq64hbogG/s1HaafP/+F3LYe4LjYDOL/GifdjllIEMk6p/zE1Zffo5D5w6
	nbxlkQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7wuryv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 16:48:36 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60598e3f83fso99709137.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777567716; x=1778172516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SV7o9l8CrqKI3O2AoXkSm6ZCuba3HAZ7LYr0cPU1ZLw=;
        b=VTcrCQhF1EAzGQz6wBEdYW97cF+Or5trT8myfA+Dm4dBtRdYpvG1xIgL+03B8BgdHT
         N9NYNCfTh6mp8rrhlneKC3J44fKlnX/jYqnbRyWxZUcHXpf7wBhogI7Z9eIddpr+mknN
         AxVfJ+v3rP3PglHEnYnse+wu3ndWw7SZgW2WMI/wIr54EZF//JMUZHs2jLvlLPtvCaUM
         751fs6MLpcgtEh2PGrXLY1vDdiv6D3B4liZNTIl0ShW3a7mLCZ7RjG5PA1VSwGi/n9jB
         kTJwdmg84BeKqhKOAzNMkDdf0SDVQrd6G4wxyUAgi/TVoYZDnv5m47AzC5o2Xyh4ul2v
         OJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777567716; x=1778172516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SV7o9l8CrqKI3O2AoXkSm6ZCuba3HAZ7LYr0cPU1ZLw=;
        b=XsYAFKHK/Huh4jKjX5wbf+CaoBDfpV3SdREU1sIpDWnsLWCri8ue8CV2rtK6Vb8s1o
         2+VXzfjYigF8RR2JiUSGey8RK+NquF7BuHMK5XhE2Lp5nTdg3w83ApFhbOMoMdSN+yyY
         aUntGEJErp72WrKn7XrVSTcLzWTkbKdo3WAc0PeEC8kuW1Z7Lbd/exTLbmcAxmk9HSQc
         3ppZ5n/f/3TEjIEZ591kecVgAuS0RF8YX3fftWswv9WTN9Hk51p5iwo3hYOAS3+8lhqC
         2y6j5BtTxS8VwiI0ach9bzQ6j0a2GXJVj3B+nJXwH8+eF9zc9BR1k+gnbTR2SDaa326y
         rVEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Yml7ZEnpKDopUjbhxB2mCd38QP5GHlZaasnp+XYO7xJtVHo8Wp2go8Xef5pfNiGpYsHgJeEKylmSy@vger.kernel.org
X-Gm-Message-State: AOJu0YyzHmoJqJf/lpB2jqIUJnh2DrPzeamM2/+t0vvpolb0BoZKZQRN
	AALTOqSqAJi/u73J9oGso63vnywF5AX4dHWsVDzIIFS60hVw/WritlJM/eVb1w2y2HHFbd5fU7P
	t1ntEhYRZ3s5kDndw4G284VRnIgXHW342vyBWZ9yGKGbB0gtV7pS1Li171vJpdLQb
X-Gm-Gg: AeBDievNRuIi0X6hW+iztSAjIoPU2OE3zteF+dLFpVFaEzmwomRNPs9jIvOAJGrOUk7
	7jFTtevZMPwD5Q3P3FWlqLUAUv8pfT/1oetsXLDp+1YStaONdDfjn9Ot/1AGo1mKqpLhsJbRZvw
	XVxd7ODyyXNEHz82NOiK95map8Iv+t/CxuycDb1oqn0fWAxILYxWxTYTn1MG8OXHwtcwpuUvEPm
	9W10bfphmuUq19TlW7aIf0SugbSelqv8ezR9tMHhKg+xXIj/uGqzl2/rxzGS3EBtPfgVfaz0TYV
	ktbZxZiuTN13iEUuMiTHEil+Q7u3crxhhwawmeA5AQFXc/8qOFy5jeGtj89085UBrSM6DKu04j2
	izKj054Flu8wm0n5/6WJUQfz9cQU23ZnnIYAwtkngx+t+U7fegrHVEMH07S7s+LivS4JC1eVqNr
	QQHv0DaID2FN/bCg==
X-Received: by 2002:a05:6102:67c:b0:602:7589:6536 with SMTP id ada2fe7eead31-62ad2e44437mr760334137.2.1777567716298;
        Thu, 30 Apr 2026 09:48:36 -0700 (PDT)
X-Received: by 2002:a05:6102:67c:b0:602:7589:6536 with SMTP id ada2fe7eead31-62ad2e44437mr760325137.2.1777567715784;
        Thu, 30 Apr 2026 09:48:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d919sm18279566b.23.2026.04.30.09.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 09:48:35 -0700 (PDT)
Message-ID: <5c838838-00e5-45f2-9515-edbdcddf50ec@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 18:48:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support for Lenovo IdeaCentre Mini X (Purwa)
To: Mostafa Saleh <smostafa@google.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, maz@kernel.org
References: <20260429141815.827157-1-smostafa@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429141815.827157-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE3MyBTYWx0ZWRfX1UqqI1epF1t0
 jonHaeVdvULgcbgl2E3GWbYDRCFDG86zaew04uKFrNtLkt/zMvgAQlgr/qTDLLi7SuBd06Kh7//
 IzuSMfTSEEsIUYTxF72Iq/zN6dNr5w8nrUIm2Z1yZ4vg5CnAf7cgh0FAYZM/7KB363b+DV+VWfL
 HlCH2rCVFaqmvmHG7xx09aSks2Q9kRWJ2fOlnP3Cq03ZUOL7u5rx1y9gNTf6I3p5kMIw29YRHhS
 lhj2tiRGnXvB8hMXEqFB/PwynWeW+1molUWq2wRBJoNmA4XWogVz8LQ3xnssUv7TDa0uMwB1ezr
 W4A75x7rH8TKJEvK2IHvXW+KwSU1gZrILeg1v0lSKW11LWZQTZLwF2nQnFzgnMX6OvYhPoUR9H1
 dxZEfQsLrbubLW7HJVgbKVky80TnOFUpjW0j5yHHcuAuNGtwwlTnkIEBb2Er1k2GckjmemFIA8x
 sglY5NhX1Cwr70DBRag==
X-Proofpoint-ORIG-GUID: gtOvVPYGVZkCdw_Txiell2oCFWmkQ4AW
X-Proofpoint-GUID: gtOvVPYGVZkCdw_Txiell2oCFWmkQ4AW
X-Authority-Analysis: v=2.4 cv=GMk41ONK c=1 sm=1 tr=0 ts=69f387e4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=yZY3LKPz1QgPfZ98hF0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300173

On 4/29/26 4:18 PM, Mostafa Saleh wrote:
> Hi,
> 
> I see that recently the support for “Lenovo IdeaCentre Mini X” was
> added [1]
> However, unfortunately that doesn’t work for my device, the board
> resets once I try to boot the kernel from UEFI.
> 
> I believe that’s because it is another variant, as I have been using
> my device tree for some time[2] which is hacked based on the crd
> device tree with some trial and error. With that I can boot with
> PCI/NVME/Ethernet and USB (there are also some other errors in the
> log related PMIC), this device tree is based on purwa.dtsi unlike
> the upstream one which use hamoa.dtsi.
> 
> Are there any plans to support the Purwa based variant? I am happy to
> help with testing, but I can’t confidently send patches as my device
> tree is based on trial and error rather than a data sheet.

Hello,

could you try

diff --git a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
index bfb7cea56df9..845f303c3836 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
@@ -8,7 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "hamoa.dtsi"
+#include "purwa.dtsi"
 #include "hamoa-pmics.dtsi"
 
 / {


for starters?

Konrad
