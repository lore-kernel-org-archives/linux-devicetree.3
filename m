Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD3919B5A3
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774503058; cv=none; b=lTlax0aiJmRnvg3mRA8OY2VLQZKmjCFsypvd+EZ6n2+/iYgBhfUt/9DgAhrW+IU0mobdH32RhAnuFn2ZpSwgdmw8BahO0QOwtYmGZQ/npSuoME5EUDnwzrw3g8j/yrtU3eckYquY5N5D49llkKXw39ZZS0Cy4iuQA9rB/fde+cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774503058; c=relaxed/simple;
	bh=Dq7SR7mf0Ly7LwIQCtz2LyQdIOgoABM6QUbDgADI9yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqe1/tQC6zOvKbPGvsMx7QbvzqLhM6MeRbZuylWRUG/mWDvPwWZZRYfJ42ozGmF0VcNaj7EGkdk9Hi1z/Fsya5yHRe4Qn8mbhJ3zw6HyVqSAHmhpTK4+p1u/D1/0xiCqTQPndwouKIRrzFlj++mZqHNdBFjbQkoYsIDkki/CU2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ih9+RDyB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEYf6lkd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ih9+RDyB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEYf6lkd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PMI5xb3069869
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gMXKWgO455kPcPMgxpEMZpFQL6OheNgUeaCwfhrzN3Y=; b=ih9+RDyBz0zclr9/
	BO4Oktg+F80XpIqcJQz9vmeFNVhig373WCPVNLXmpCkmIhB78HaQJuMx9d3pRG+k
	oQOy2oKgYhCQLNO3fA2aR/QpQXEZdNri/3WG/rVyh0D6lfxAnGm+Rk0pkSIDDWyL
	bVwAX2WSN22PJA4sq0W8CXkx1ltJCeJxfogIATbZH0F26AvuFNRIxFu1EUoVWJiu
	zuTlo0OATSVxDY1zrcdi+fsdffqkJXhotEHkjm4zYqSvXMuCjGIwi5U0QbhU9033
	WnUdhlFjy4vJOBE2jqkNhq8WwUpbE+mPVPsPL+2IQHEw/T9iPJyJhUTXoQ7kbsyZ
	axOj5w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn12vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:30:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7656dba76aso416743a12.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774503056; x=1775107856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMXKWgO455kPcPMgxpEMZpFQL6OheNgUeaCwfhrzN3Y=;
        b=OEYf6lkdpnDKgDPiW8pok3NIf87K4cIcyTJDkBox59nekIhKLVRt70MVXV8ZJiWlcE
         CnYvcxWuKkYfJ/jXHwNulzo2pwR41vg4I/xxvlInTcwVdJYzF16g3weK6f1/JjDSu1zY
         YDkoDMGN2e+ghA5c1pbW59hy8OxbqgNOLDEm6hxu20E03hSf8jirK+I0Tq1MLJZArxtn
         0Er9sSbAaEjZsRpSuJ4MmHHkkAW7EH4fREIsHEhDXvLVbyjxKrJ0Pp/2ls0TqmD8sVvV
         af6SsHVgHjyqL9VdQ2fsuxNONd0oU5NQHSWDYMzMgVrfOUAYG0ifUF8IbmC5QKTiKzUe
         Edqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774503056; x=1775107856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMXKWgO455kPcPMgxpEMZpFQL6OheNgUeaCwfhrzN3Y=;
        b=bG6oZcMgKBhHWaE36t81cv8qQtSViU8Lz8nmEeS8zLW47yFjto69Ama9FF0nMEEZgj
         kuR1Hm9+rkBR2XA6qt10bda/5yde5tjSrRNTWPT3dnPddMwTmdN1BGayBxlvNAd4OmRr
         6ltDGneP5QT1h5lxMhZIYlLtKP4LSUlTZm7r5c2lf/+tarCpHmqmEfwCb1pzEuJmHBEK
         EZEdkK7nLvV1E33RvIas2GbvVFJrTPRyR15P7mUv+MM3vOk/2UXtfBEDMr8R0S1Fd9ku
         +mGItgAr7hm5Kxm1ca4/5aoV/uau4g9qn9m+FmfINIfNDxZ7oB0opmthpq3iyxK7inZn
         X1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtoKjPyznxZ1DzaUmDlwqFTCbYnE9Z8i86njQqckqWC9XKhMI1XKo+Q5YO2sJ3wEDLuEDDVezwUNar@vger.kernel.org
X-Gm-Message-State: AOJu0YxPkbIH7qzsBexpnrQXHCc03zDAWoXZ8GR1wK+lrdx8fkCdV5tA
	AWfz+PXRLcdIifBYUFkojxpwa0SE++yBbHqAVrF2DCb+WeGOueanWz+299LIe3c7ulIjSC+lfgh
	6qymX6LEgVZTjk506Erq+6Yppqx4Ooa3/yJl9HOfIBCByaO23ffUDAMGAoZWA9M9d
X-Gm-Gg: ATEYQzxnvJwOe2p6/D2Ig57PKfF73mq+k2sbknZ8WxL1vHlsq6BJP8gcD9pZldXgK0M
	Q9ACfqoZQp9+zKOQhjoypq9jylw402f3PbiRHhRDJpNKH41KDjLZ4o2mSR/gmaVB3KIjUJjHzre
	nXpxZDGhuOVy5gWPbTYCl16iduFESKtfULIAwjXtckONNSNfsrC4JLg1wV7aoIL0xZ7aA7s6AXh
	V3vMIgo/y9MrSBFBh93CaSqEdmevH5yA3z5Tg0aKnAIgZy7NPkVPFkECX/KkUJNfrj4sAgJyBM6
	DgnUL9D6HQ218FQN1lp288BkAZXmo+5Cm0VqkoYjz4aro3T+JbU9F4PXLBWJdKLNpPFWZeM86FK
	eYLZWfEyx1T63ukKEdIQdxzRIccPita5JQE8NJf77WG6YiQU/iCmonPb0G7/YIERu8toN+X1wjB
	tMj1o9H/jTE1OzmWTMpjtacVvIlZZxUI4Awg==
X-Received: by 2002:a05:6a00:1c81:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-82c6ded3a6bmr6338211b3a.13.1774503055596;
        Wed, 25 Mar 2026 22:30:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c81:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-82c6ded3a6bmr6338176b3a.13.1774503055118;
        Wed, 25 Mar 2026 22:30:55 -0700 (PDT)
Received: from [10.79.196.200] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3bf324sm1637749b3a.40.2026.03.25.22.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:30:54 -0700 (PDT)
Message-ID: <35a6600d-c2bc-46af-bf18-07f13038ee8e@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:00:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
 <20260325-add-driver-for-ec-v6-5-a8e888d09f0f@oss.qualcomm.com>
 <95d9636a-63cd-4691-8d72-c1bb59c605f6@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <95d9636a-63cd-4691-8d72-c1bb59c605f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c4c490 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HFQO31-wg_kNNkEnh5UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 8v9JgtlkTgmQdw2HK3rKDpnLvrhGvbYr
X-Proofpoint-GUID: 8v9JgtlkTgmQdw2HK3rKDpnLvrhGvbYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA0MCBTYWx0ZWRfX1jB8BsFZWZj6
 e9rxu3rVm8///88vGVRehoh9aB4UHaV6ouyI1Gem+uTg/lYQ7nbUIbS9qsErCdLk2pnsXYWeMhM
 ayujfhhupA+DkPTww8R/ooRQBRpeMW2zXZRRwUpKFBWcKl+Sk2DIgVX4VeQ+QvEkARd4eoh2Fgd
 /lAuHjphZMql7CmXrOAza6iZHBwMnxuklrCUwJWDeKg2khaa2C0krIyJTv80JFKCxb28hIJFGlO
 doKiu6rMbfrTTuwT6tJVrf70FLqgItSQ7kbY6evh8zg2kXzRu8hucUqdv9ZzvI1uwoaS1xa1geA
 MyFU8Ay6iY0ZpiC2zS18tr9WEhv2nl+LqBV7qFVmy5iqko73Hq33UjjrCBv3e2/D+OyjO3UVSMf
 9h2wpsBFK6zIm/jdGzkhSTeBv7zuDGw0OAwBEyaorJpfPc37eV1cSJMXNcYdavP2oRZt3Xl42Xq
 EWRut5nwT53VhwprlGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260040



On 3/25/2026 5:50 PM, Gaurav Kohli wrote:
> 
> 
> On 3/25/2026 5:09 PM, Anvesh Jain P wrote:
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Add embedded controller node for Hamoa IOT EVK boards which adds fan
>> control, temperature sensors, access to EC internal state changes and
>> suspend entry/exit notifications to the EC.
>>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/
>> boot/dts/qcom/hamoa-iot-evk.dts
>> index 460f27dcd6f6..a0d2ccf931ec 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
>>           pinctrl-0 = <&eusb6_reset_n>;
>>           pinctrl-names = "default";
>>       };
>> +
>> +    embedded-controller@76 {
>> +        compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
>> +        reg = <0x76>;
>> +
>> +        interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +        pinctrl-0 = <&ec_int_n_default>;
>> +        pinctrl-names = "default";
>> +    };
>>   };
>>   
> For Hamoa iot evk board, i have also tried and cooling nodes are
> reflecting fine.
> Please feel free to add:
> Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>

Thanks for testing. Will add the tags in next re-spin.

-- 
Best Regards,
Anvesh

