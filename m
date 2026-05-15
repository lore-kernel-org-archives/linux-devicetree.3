Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A7146AF00
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842436; cv=none; b=PUtHfVDqpwRD12xgQHisv2A7SYI8zPFg+HHFN4dsCCUEi59S/Ps3ARccNiMVx5X862BGtz3Yca3tVd8LH0/FrA1xdcGJwiFPjfo0xeZgQbi3oOSpNTT3L70yygCNX0b/R8TQtLO5mmy1w6W8kSrOAwh2g48Rpf/oc9kGylLYZf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842436; c=relaxed/simple;
	bh=P7+2xwoQIbHA946IMLaU3RvFr4k+V5jtaFqys75Nr9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+Kmn9RWbW0+ZYws9QEVdmJhARYvMJEXH6Q3DKXvw1LKdQSClLgZsMYz2r2lW7aT5XuhqIk1TUf01owi5y8398TzlgF5GzROnfTylQVEteBKI/7xdAhb7m4Kq3mKOmnTF08v2psgO5H64eMm4fDcpuphgdndRPbcw2dJNGkh+k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcNUlfFs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmHU3NrW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcNUlfFs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmHU3NrW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F95dSo1714959
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qV9wsZl8WKrBHBkTAdbssnMUVospcGITV573zzUgjjc=; b=OcNUlfFsgC+0coGK
	IKaI+HdvKzg197ZJNGAMN5TLxwl83HjLJEq6XyutSYPHTtuy0oeXZKQpBpPfVWVe
	h0RIuyWKWfwU/4OoZ0wpOCjjpIGcRAgYfjhFuMPjUMq7RQZYOLzmKEbC0pVdVpx+
	IAf5fIkC3Czr7CEdc0FdYn+zFlmR0JmcdsO/x3LJYuq4C2oWeSBfFfXUx6zKa3PP
	8O2HbZp5vxPQtaO63dSx3ZLgg+E3M9+Y80f9adMWrLTjrSD0X5rllBJD/FlzW3BH
	Iwf9TbjVDUXSJkH8xGb2WYfyPFraxH1VmWjbmDyasT2t93sPFnTsnyIl0i8x0ebx
	smOmFw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxsq3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:53:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso6261443b3a.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842434; x=1779447234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qV9wsZl8WKrBHBkTAdbssnMUVospcGITV573zzUgjjc=;
        b=dmHU3NrW/VLoSrixteiqmPuC4myDYxEm3shl1WilxyWbKCvyz6tuSaeJG5Z2mIz83C
         NGNAP7keHf3jyCcMm3l5TOzX6NtIgT62unKUqCcH5nUOhyNwGHmE06Ym3qnTIFwsKjaz
         xzLJGiedYLruV/MbRMZJE/6gkVtPJPWccg/MeEbaZGz0fiKTNeduSG7l7SeLdRIBX0rt
         baez1yn5Q0G3xV6j7mBHOX4F2bc2c8dwThFxNteHpR3o5ACXHOIX/azqoj4VZvB+Hjb/
         bI9qGS+kigHWK925JLEsY/zpWrSbw+EG4UOl2OH+IurxNu9lOrEcgk8AoE+6Sup66VZD
         eU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842434; x=1779447234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qV9wsZl8WKrBHBkTAdbssnMUVospcGITV573zzUgjjc=;
        b=aGiaa3QkeDjPNtxpF1msLTpUNukLDI7KUiDe8Cz10+laNy2rshygNZ+2H+a44phqt3
         Q32/0gB7gGGb05kIGbq3nuxU6+szCHsg731BxFOUYTFQ+9RbWf9SmJkrFSS3P2GKjMcn
         rSkH5Ft2aK4QzeC6N+08fNVdeZ8qObCuobAbRdPQz7YZAwCmXXxB+8c8F/Uf+FNYM6b2
         Z9YSq1oc4UFJKL9Deg//rszBeY8eQm4V6fGPDBay3DmQGD9yhY/13Y4+1qZo5yiM9iCK
         N2zhUIHo040xJT0aPsuRXoGxadbo5y135ILt27nhLRDibmnZHbRuHWap4d4zvYndqH63
         8nmg==
X-Forwarded-Encrypted: i=1; AFNElJ9fDgbaANJOp905+RxIvqEiWVm9P69B+K1Q05sYt8IXShN12yV5Br8h4R7EqkE/mniHhptyno06gFqf@vger.kernel.org
X-Gm-Message-State: AOJu0YxJpnONbpd+Bn2g4+ot8cE4gPus2t/u4RbmGemFop51UiCLhVc3
	QP9bKGdNu2qNFhyeB0iIH25oFwz/bQMjaTjJLvQAJ9MbED+SVcnQyas2VFb1y3PgIm4Rdvyd3uJ
	j8iYHIYKo2DT8NQAK5xDWnVvAXbMHHPoRMqnEmwLcN03S5C5UlPWmtAqXXqZlcIe+
X-Gm-Gg: Acq92OGlKADufbZQl/zgAoJbCkzo1BAAqEXaQBaAEI3dcmurqwcVGzUcNdCxCMMAHuK
	w5AQBzrI5MfF6GtdtLWrbIolrC+jMNg6M2GgFy4RIZ3+8msMIgHN+sbYG/4rOOSCsrs2lATe9/J
	4HEPBVZU7Nu6VXJMUE9aG4L6QbVl2ypLTzim9RMAcHHaliS77w7pfZ9PePHPLdSHsIPI1R10Yck
	4clJ2W7WbBLVBua1UdDtuCMK9qVv3eN3Y4fIWx2pgtU9/hUnbf0f0x/+7SvMDJwUqvFgKPV1VR3
	dGZPwfsS7P54ryNfWmzVQ8/BiM8x0FDbB2nGZ/bWqj9iwAOMgF6JClLvOW5H3Q5+h7V4TqeE5Rz
	P3HmodYAp5JMsl/LJRImtV+8L39Gz91U9HATs4ubsQAFvN3S5ZxGPoUofJflzC9EMx3o=
X-Received: by 2002:a05:6a00:e11:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-83f33d8092cmr3886832b3a.42.1778842434237;
        Fri, 15 May 2026 03:53:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:e11:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-83f33d8092cmr3886800b3a.42.1778842433785;
        Fri, 15 May 2026 03:53:53 -0700 (PDT)
Received: from [10.152.203.161] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f24cd0422sm6601508b3a.18.2026.05.15.03.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:53:53 -0700 (PDT)
Message-ID: <3a6f613b-07ff-4efb-8bf5-71e397b15876@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:23:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add watchdog node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
 <1b741127-18ef-41f8-b645-707083d7a921@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <1b741127-18ef-41f8-b645-707083d7a921@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a06fb42 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cp6o2u_hlgqnvGeBYv8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: eVYDx0a8UH6jm3vkp82uFHYOqzCWpH-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX87msLj7BIR2B
 LFBHuPX/AWVbtyzKizEhYGJALorkCeqH0zb/Xg+5+LENyR5zN/xajSutLPpdqd33Sf12zZZqwNJ
 0itX2hujCtZuIoazY71lU76GCpELzskRBKowDlHqwpZPhyuiqG8iv96qGlM8d5MiGG0e+Iyk3HB
 b18u4AWEQCH3pOlFvYEjLh0cnCkPwozbF5kveku05PoFhedoSOnj0sq8kYK76VL0Vb08CDFezhj
 YPbf3er6vlvMbYHLfdbTgYdk2cpgYGK+gwNVQ9NGCW4TFXjLfaKJEHhZC/VtTeGEqmC6kuDd8Mv
 AQbafbMJVfRp06cG9gYKrGN1DbPbdHDHCQzhIVJOo/0tnfqbMhfoow3Y7o99SAp8KUr89klP7bd
 WtXcBJFj94pjHw7O0bjUzL1ZxHeMyGmalNHHl0O082c6+T6rERwuCNYMw87kuY4dMQ2rNWxbqMg
 KREbjfCLoBd/EaLe9PA==
X-Proofpoint-GUID: eVYDx0a8UH6jm3vkp82uFHYOqzCWpH-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110


On 5/15/2026 4:20 PM, Konrad Dybcio wrote:
> On 5/11/26 12:56 PM, Kathiravan Thirumoorthy wrote:
>> Add the watchdog device node for IPQ5210 SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> index 3761eb03ab24..2cdc10529c48 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> @@ -236,6 +236,13 @@ v2m2: v2m@2000 {
>>   			};
>>   		};
>>   
>> +		watchdog@b017000 {
>> +			compatible = "qcom,apss-wdt-ipq5210", "qcom,kpss-wdt";
>> +			reg = <0x0 0x0b017000 0x0 0x1000>;
>> +			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
> Are you sure about the interrupt no?

Yes. If you are referring to HW doc, it is incorrect. We are working 
with the HW folks to update it.

>
> Konrad
