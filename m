Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6DA283FCE
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 06:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776581175; cv=none; b=IKZZamV80zIOj05vdr2vRNGQnOutxS8W9wgzAnWLdwbhA7pu+3v3ql55xKpOnAbMwQW7tO6GxOfgsEyew+mio5DN1MOd97o1TMPKeasL+RD0Igzi4FHLLaW0j/37Lp8OR/0JATIY/p/JnrZ2MOLzZARxVIYo5AWqZsA+h0wvRtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776581175; c=relaxed/simple;
	bh=MKhme6VGRdMs8WoQPIQpd9M2Kb8PpwgUu12R0n5gMi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TK6CLbdXP7MBIizuXKH6rpi9tYvfNe822Q899ZhxJ9D4Klnp+XO/P74vX7Syxgc6Za1fcUf4fk8QZdTAuq8GrbIY73bZ5wakHjeaERonVOLIdecqPrjn6kW9aIcltmY0izPm0FIgGmB+ej9CONb8KLiWWtiAVwgvKNUly+iu/xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fS4RfbI5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=felgypiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fS4RfbI5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="felgypiF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IKvoB42292654
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 06:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUEaDP0CTk7F4TTEkQxPhlhAjl2H/Y16v//c4Ml/85I=; b=fS4RfbI56eOILrpQ
	tlhGoNrL1QdEMwSQzin0V0fVBv21aqpe9bmWSwLv8cKXMgSApE6o2CvgmVkpDLUu
	Bdr77rUHuOSXY1YIkgUR01yWo7vgZlp0wvUpSleDnt2qiTvHnivJUE98t3bXpte/
	L9b99adzjs9X8AgRHNwm4kVu3J/shEUbleL2YQoafvlLws/I/42T4gizrcTS18Fm
	jaIy8VAMhhoFozGb7w2tsFWsgKJvp5DjmiyC5ssugtGFXQ3JEphWLR+dNUhBRbcm
	ll5QI5XplE0KwscmBIyl5YGad5Xg6CIt+6yY6KwQ27GVyC0gkVp31UzR5poN1Ie9
	y6s2bw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34ha15w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 06:46:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e6ee9444so20311365ad.1
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 23:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776581172; x=1777185972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUEaDP0CTk7F4TTEkQxPhlhAjl2H/Y16v//c4Ml/85I=;
        b=felgypiF0ERXEkmwcu50IdiJhWD5FRjNw5o6nBw/46YhLG7oSJt1pcTOCX+QBpmnR5
         gthX1szY+YnpF8Lzub4zrhIoUnlviv/GhUa/LonVR8KPiabpe0Bh2qg8pUpl22CyVFjc
         CIpPFPwvYT4UbAdpp18+LoamVETYdTqk7splBlWf93BHawWXsvYnsSziHVGXxhBJHOFs
         I4x1oqy1N09AzwHkzeTO16jtUFl0Fs64rXNIzKy3B2C1acpxrqtffEBfk29etffkQzb7
         RMqtXpahm5V6XTGV/sUk+M+lr+NURhkUxzQO5I0BlWU29sSeF4yf8f23w/I0eLUuSVo9
         uAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776581172; x=1777185972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUEaDP0CTk7F4TTEkQxPhlhAjl2H/Y16v//c4Ml/85I=;
        b=AEi/tvOvVG1LJ3yV3BtLV1UURE3EOSSrlXLCnx9r2deCyrnUT3yVUXLzFUTkWqfl1s
         m+jIaWDXY8L+mZ8AMUjOgCG07BXbJkc4ksQKfO/c+MqtcBJd2LStCCnD+9kYKlb36U0B
         5GnVMtcf+dZJ2ToZgE80m2a5ye9CeL1UST1+eNd5O006Ct5SwuNuMrsOmMQOMVRG/7jC
         hAipVsu5TKHQQdaFqYB5UXhCuHvpf4IddSKf7f0FqZkwLBQ/YmOi4FIXDTgycr7pjA22
         ZjQPTToh+TNCSwf7mx9vjDMYdWT8mNVMy/mIB68EmsXc4pJllZT1O9aChYIEVOM1Sk/r
         mi5g==
X-Forwarded-Encrypted: i=1; AFNElJ/3ASf+jmEVwoxGHX8yD3A189zh0q4uGOfga/iGbrrDi7he8EeDZlN61pHL29M2ByHavr595h8z9w7G@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6rfJLc1pARwa6uRE6GRu43/HEdtjNsiV4w6kqt1QgIZFe+TL8
	p37hkUDwguTNELLGM7U0/BYG/ws/sAnAHBtI9IrCHkIypjCDhBKbAMOiWEHEJ31NidI2YxYDbyg
	Fg9zXni5GcFhBQSkp9lXAqbkM9DiLDC5U3TjwTz6X/ijHls0K96pFY9JG+JohnetM
X-Gm-Gg: AeBDieutSFgUaeruzVVy/FDgEBL167l8i2UGpIIngHj1CMd+0t2ySJSzxT7COBN47sw
	pO4qe3acmPejYWHb4MQhR4L7ZSJ9aAnXrf3Jew5LFgnK8x8JNZFxw8Lfk2rcmnkESjIXw3zA1nD
	kWjAUMdfyMDMdhBN3J6+Fp8e/RJt/yu3IQpwzNg070GjvCrYRzsaKaJG6I62pvq21hBPTJeVIVg
	mEHzeVJvBAWeN71ksc31oRemRSoA+Mm4DAUz0Y8+nyOuR+I3AdkdJfyerpQT0XzLg9C0R8n1k21
	/19Vg3iDGX8k8zOZElaJUJoby4DpyUI1CkXvqMUBFKlt2WxcB4j1px+xfhnwIsEgS7CuejVm1H4
	UqRsMhFHNZhdFfgKvvHcqdmU7d4D+AHAhIXZRSt0kVri2IvdZoOMZIqaMaUlLFWbo
X-Received: by 2002:a17:903:166e:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2b5f9dbcd22mr86504895ad.2.1776581171602;
        Sat, 18 Apr 2026 23:46:11 -0700 (PDT)
X-Received: by 2002:a17:903:166e:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2b5f9dbcd22mr86504685ad.2.1776581171128;
        Sat, 18 Apr 2026 23:46:11 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.229.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0dafcsm68959845ad.52.2026.04.18.23.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2026 23:46:10 -0700 (PDT)
Message-ID: <bee49f32-cf46-4cb5-9d84-0a813b64bd6f@oss.qualcomm.com>
Date: Sun, 19 Apr 2026 12:16:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal
 zone
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com>
 <xxouwrtrhgyf6y6xgpqev3cxomn72mty7kvuzh4tof3jnmfmnf@6deaf6mhhdpw>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <xxouwrtrhgyf6y6xgpqev3cxomn72mty7kvuzh4tof3jnmfmnf@6deaf6mhhdpw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e47a34 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=wZmMAJJy4pskoH2Iw57Smg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=P-Qu3AS46n603wzIVHIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: nkGtbWJQrhtbh1bb6GAO7L0amKLP71YS
X-Proofpoint-ORIG-GUID: nkGtbWJQrhtbh1bb6GAO7L0amKLP71YS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDA2NiBTYWx0ZWRfX9GR+kQMWBqKx
 vXrganpreSEo3OgLVEwT9ylakBqzNqQUfosIKNPewh/bTE5dqhyITrcLLpEyvPP/RBiSD5VwQGE
 W4WhVvXGsdHb3tl84oejIDKJwZ1n88NnSAxBDh5tcqxXGKHefKXl+QI/ml8p4Ro6rfR7C8flKQd
 NbGtlC4eW+iyA2E6xt6Y0ebZeEt/WlkhJHt+/1gSTiVb745tVdWd6HlHlfB3BT0ksIjtHkrbRT3
 VGnE+yRsiXw9kAafHV0ottQS1PEwkQz5uR3nhugpsA9b8lblyiFMQUVY2z/omhXnn/vjdwacpoX
 xuNr9zzCWqO+3W595JKsisXvrpqmmbnzMhpslveQlc6LW/JWuOIrAN+JY02ZLVIeznVnM/sTsxe
 LGbSCaLtMazxzxqX4/lDuC7lxFoYsodO2vKY0FgO6Hya17Mfs2YVTtCvvNY/DxJPXhIT1oN/S4X
 +O1ChJ/U/E8VKH+zggg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604190066



On 4/18/2026 11:26 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 16, 2026 at 05:04:48PM +0530, Gaurav Kohli wrote:
>> Purwa IOT boards support a different thermal junction temperature
>> specification compared to the base Purwa platform due to package
>> level differences.
>>
>> Update the passive trip thresholds to 105°C to align with the higher
>> temperature specification.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 ++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> index ad503beec1d3..261d1e85651d 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> 
> Is it a property of the SKU used in the EVK or a property of the overall
> form factor, cooling, etc.? In the former case it should go to
> purwa-iot-som.dtsi.
>

thanks Dmitry for review.
it is applicable for overall form factor, 2nd one is applicable here.

thanks
Gaurav



