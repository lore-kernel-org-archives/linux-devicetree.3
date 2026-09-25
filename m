Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3159546D551
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339876; cv=none; b=XF+s7iD5waYaT/201bXgAeaQa6SNAmConTZx0e3t9a8IGOJEPn8TfvSP2giKtKhmcLi4XxFQP5u70qtdI26ffAm4fxX0THn8iTUNiQlMgmZKcUH6pOYv0Xzy7bHUFnHJkBQc9og+CnsjSgLsLluO8RjO3wdGmmliwbQXrTGjN5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339876; c=relaxed/simple;
	bh=ZAInGioxgaspHdUIIOX/eDMYqHB30em6vwgzlv/Xf4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ofd0XakvDGwR/mgHMoNGw9QD8xPloXIlhO/y6LIfV27J2HNJgDJofq71OXjxfOgCkql2dsJoThmNRX7ClCeJSbvLyZXrtLTo49xtNDIbq5EzeytQRyU3X1FVuWqcR26fqahFRv2GxAqgrQXCrZaRBBlwbcHZUChw/xJ1KpQkFpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFnZB3q0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qm7PAG8v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFnZB3q0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qm7PAG8v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YkGK208631
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fHy0VaMdwfLk8ytcPXsYGNtFKhQUOH0pOJ4gFXHwe2c=; b=GFnZB3q0wvUti/N+
	7kgE87Z5w+O13aDycgABTwz+J70S08q5JG9X4vIvYqEAZ3G/BgvIOU6l9wPui+hR
	YAPgnS3x7/VVog3/wUPx/aOKDhUmQU/iTP+R+Tx2jLfk8jTA3xU5vI262WhwbhmK
	PDNugmxkUGLlHE0FNHu3FDtvXMWkDYrNALgcoeEPqgbv2j4/GY+GOocu0pFMWb1C
	/I0mYAoJo8PQjmXm2gUGyZ6uoXnpJ0VO5eb9TsQemJjDB+DoNcX2+RQln4s7ja1+
	J3uBOVI9JZvPXY4EXcEz0uf6rOKV69v3ICn1J/1s6FDU5He37YbMsIs/CioX3HO7
	zFjlyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898ufur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:37:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9349ba88188so16393185a.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790339873; x=1790944673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHy0VaMdwfLk8ytcPXsYGNtFKhQUOH0pOJ4gFXHwe2c=;
        b=Qm7PAG8vlGknjyIrnXqBOKY7umkYqLRdkqukDra0WPtC2A4Vh573+eEBt8o62tSytN
         WOoD5ncevP+/MDEUWCuj8y5KFBICSZ8tIzd6SclWmAHtIOkmIcX3w2kuZ2BgazyZnVRq
         Glusq2quRvy/P5EUnfE3oQ+dibp1/TJP/RSdeGjzRO6zYQK8csolWjbvx7g3+yI8CmOq
         kDBLtqLEe6nQtScsm+5hQgmCM5+c3SRyxZI+ytIZCdw7I2GzAVOMJYmtcPnGTd2tfXFI
         8zLZ+btgwYrlHlra0EcOzq1vQ84fbvcKLdJQbiBo48FEpj07csaNd+Jg22dAcsQQn3QW
         Ob8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339873; x=1790944673;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHy0VaMdwfLk8ytcPXsYGNtFKhQUOH0pOJ4gFXHwe2c=;
        b=P4RzRF77DwbEkAMsKWDYBZLXyk1EplaUZ4I+s6/f3sp2nb0HkKwoEJ3N6cqyP3jO8q
         tctanKZPovVBOoscdrOx6Fszf8Z0l0hrbKjWFtRSxKVJnS7Jn3J447qlfT7BjQ0lopEs
         qX87TR7rCePDH8LxWLfozvEkvg6haFm4gXkSCdiwlZJqhepL77t0qKisblYMMFdhIIbd
         ID/ZBINuRxjKtP5afq/IgjqQVCcHihm84gebYrktsTEwW6Yd1h8ZeSUo7krdo++nbo+a
         jiM3UOFWQT4ESONO/CbCqg4IgErjjZ3im1yst6Y9tXm0wYo3C0JbvSa9Eu4+TsrkRVUK
         rj0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcFU2MFXGFGDRokabeL6M6QVo2knlYKK6b0nOwfsdqVdMDwQaPeYkog+ZFlvnpVs/v+652QNfkSIYe@vger.kernel.org
X-Gm-Message-State: AFuF++nZNM+Cus9ZIoBO/088zSM//SL99I08wp5X3tGflmBK4yOQL0HR
	KHJfyh9kXU+WYAwhDF0+UOQsKxaBg/VUWApg3xJVIiJoDoQW8jz2MHKyvjgjSAXqXGYAcr6M3fO
	nkI3Mx/gJPLRoQwMM15UVhIEhIw9EqF65j7me4JDFMdvIj8srHNc69uDTLdE6BHKY
X-Gm-Gg: AYBFou2I2VHRlNaSmRFv2tOd3Qow/EsRvpaCCKKu0KPFnjrSzfQ0VFU0mUy/muS4zIc
	SOxPCpJzNaxNQh+JpRsXewJgVoq7Hlbk2uUOaC24+RwsN992Lp43VkPsSRHrN9tZWLrlgotgmnw
	UtKEOn6mT7fZaiBT+qRjKrAe0hZRGvK1JTunU+s0wdxV+RJJeDXcU63+FQthKH7wZSXlIWLEX17
	UdcgGCGaICGW6a0s2iHRbFObOspevsFwTh0Aky+oNChvatVC2H43+eoTdCTRqKh/ymUP9lLsaKg
	+lbZ67Y9gwblubcczOGOXe5Axe4tuUQQo/YYlkR7I4lxXg4a6K9R5oE/58b51BQoVpOF1t/JhOv
	DxI1YoU7+dyfkCZOir6Vv1A==
X-Received: by 2002:a05:620a:d93:b0:939:eb09:4458 with SMTP id af79cd13be357-93c43cf80f4mr386335485a.3.1790339873465;
        Fri, 25 Sep 2026 05:37:53 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:eb09:4458 with SMTP id af79cd13be357-93c43cf80f4mr386331385a.3.1790339873053;
        Fri, 25 Sep 2026 05:37:53 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae678c90csm114632066b.6.2026.09.25.05.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:37:52 -0700 (PDT)
Message-ID: <6e91b34f-367e-4835-a7ce-e899953a5bd1@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:37:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfX4msRflwUx1Ok
 1K+m66B0pVtCnR/L28ur/2oXl39AYlUslmyCE3hTe8FIAItpOZi2zpoOin4IeDtEwEl77NCCuis
 z4g83DMSs8lmhZtGRnHDI0shcbxPf3IKzjYgSjG3/GhyELphIgLMM9gmxncyBDRHRwRiczT6nR2
 gyPdVqYqAafgHH7PUjk7ZpTtVLbu28LjPFx5DftNXQsqIqurLTK+OWwnu83nqbsMBcOfIoOVWR5
 cnI3Io3eG6izjYzm1gA/YFq6gzdSQQ4sk9EywrXQHMNuWaKqWqvsNibWwj15IesfIfGQdk8GmP6
 eRRgDQgN992/NzlKZ6GqbZArrQttnWco8KFniEiQqUjjmE328pIkmWx7BISpRyFcOTnUTsBrexY
 ty0BnSov5g0LVzSCBOkT4nZWHgDVpR//uAtRMS49n+THPdnadKiI9Bbnwx1ZP05fS6JZ5ZqboQ7
 cNzW8pX0mp8JN8uCxwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfXw5IUzuSD+WAJ
 H/YQdphmd6wofJkXJkS+txNb3DZIdgKDc3VYRcQOqkUtiqfq7GvyqnLOrRqJhqrAEl5GFqeUWSJ
 h7MRoYs6qwPnsvBwnYs7eyd8rZCgRUc=
X-Proofpoint-GUID: poaiTEJu32z58TIodilfjHBwrMBp1434
X-Proofpoint-ORIG-GUID: poaiTEJu32z58TIodilfjHBwrMBp1434
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab66b22 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IF4djqKm59Tmvoe2PpgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250050

On 9/24/26 2:10 PM, Bartosz Golaszewski wrote:
> Add DMA phandles to I2C and SPI QUPv3 serial engine nodes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

[...]

> @@ -1182,6 +1218,10 @@ uart0: serial@980000 {
>  				reg = <0x0 0x00980000 0x0 0x4000>;
>  				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
>  
> +				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
> +				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
> +				dma-names = "tx", "rx";

GPT points out UART and SPI are not the same

Konrad
