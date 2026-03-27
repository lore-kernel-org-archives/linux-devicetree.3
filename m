Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D0F3A7599
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615703; cv=none; b=T/2CeLTpobpikUJFDgMtp1j4YR0GAMW96E0Xu+nFrovMP9HhDvHZZBp2SrGrq3VRwLxxNyeIU/V1dGX8BcVHs6PX93N5Lo5QVhPPt8wwckECaU61SgNUb1If0kpSVJ+SUpoSUJgThrLOzsTIClc52yqoDLx3Vaac/3O9PsJzicw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615703; c=relaxed/simple;
	bh=zrNw37Z9aUjycSTKk87LEf2TU3iKm8zSEt3jmDexEMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nksIFR+g/bZSfV3SxJec3UfEBch9tuqa8z5dQlpjyq8v0cOePPsztGMYL/PXgm5Bt4cKUgVLabFDsNketvL+NNy/+KN6YAjz4JPXzN179U1uXOvZdO/xxpLqxyLji1oWufMVTsrqvoMqUW5DZVL8V7radhumOcT9UAJiG30I1wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXgVTv7D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xv5Ji3cq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXgVTv7D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xv5Ji3cq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCgv6U731346
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkeF25ERsaBTPXW0D7Slwloe6k7ZG6bH8zT5ZWMqWjA=; b=OXgVTv7D+O/x4gi6
	12YadJ10/hvCS8L+g2cvaJyXsBlPXfAoT4QIDpbLqI04f+V4yEpg+QpIghbW//nm
	M/o13mrZYfLgC1cYK/LJINIdtSHTSkXYu5GNyQlCEdvoeA6g2qVitHE0lr7wsKwW
	8XZZgYVOSgq3gY6RGtir7OMjfZUh9Th8PnA2va/jf3NOOs03V7fAHF861tPJtqCE
	ZnCvCcUPlZYCKx6EnYzKn2/etxo2z/7Suw+8MgnZxYg2waG5C54UoqDu80DuuBXy
	XFgDx6R7goqMoXnd6q45fXxARESBXbnx/CNBYlLgB9HFFuXtVEBpbnopzSp/uGYY
	XcXucQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q3cpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:48:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ccbfe176eso5816616d6.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 05:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615700; x=1775220500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LkeF25ERsaBTPXW0D7Slwloe6k7ZG6bH8zT5ZWMqWjA=;
        b=Xv5Ji3cqE4v0q5/22AWb9qPpLjVUjr1K88dVRRcqvBTrM7irbOe8IVviv+MSCNFojE
         m7LOxhjAYjsMHxdnmRgmGJNAgeLuEJUfYX68iOsCJH+63x0BFdWoieizRpoCMYyzCGDO
         QKj8fJqyNoK7z75kVVwhaUcpZ3IB7U/JXYfUoJ5QvLUmjKRdCuT8SVXa9IR+kcR17tia
         1MzLgwL3m0Bl7pbEtZyvr1t+u6lr00ZHU1MRcd4qq3KlnacEMIce06QU42HeJqvYxXit
         Pm58IYZLKpkFo1T4wpolLlq1xa9K97sdBTetXdX6pgh7e9C5qeZntT0yOm5ZdpHBgbjf
         yKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615700; x=1775220500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkeF25ERsaBTPXW0D7Slwloe6k7ZG6bH8zT5ZWMqWjA=;
        b=F68+mNxQ1Ki6yDg+rjbWl4lOI2IXbNGYUEkSKdK3gvzRhIkHwBS34n8Ony0PPXe/zj
         63YgQj+Fvwc0nGhahX7ywXujjqCw8MwE8viqPpbXVMvP5K2lA3HnMmZs88IjtSuvNPSA
         Axnz3BRAR3i+yH4lYB0rj57g+GcVMfs5chmFOfNzCZVDY7fGQ0p+erG1TB3gnJi2lBvO
         qstErBQAfskK/a9pSUlvZ2JKNTyY2yK3d1f5dWgkBHolluEa9LghyKMiCtyWxE8hhu+R
         +PtFwJ5OqLvuosAhiq9x60dCybDHzYxLK0XD+RLSXnHzmqaUecQ+ZBf9Rz9YMMXNkMgC
         N5Fg==
X-Forwarded-Encrypted: i=1; AJvYcCU7fHXIo4aq8rPOqalH4PikACVqhQxqOoQbOeGOPoBAPIwAB2+Rc7FUXmrGcB7NbbB/GV6dhrIFzOeu@vger.kernel.org
X-Gm-Message-State: AOJu0YwLfs6lTAR8q/KQzofRxvqyJZnRXMeFeBqjs9rVgV5BIUSaFk9m
	067PBly9zJHauLNdLboJAyHWeg88k+RMChWIqt/iSuADBVBiseT+cEVykHU7oGvcIClMS6bEl3M
	UoL+dPjOZZST38ueG+PWi2qlnqhVVNkLqp5Z+8Ktu5XueN3fD4WEt4k52FuYNg+YR
X-Gm-Gg: ATEYQzzgtHw3y8FYkmjhIA0SJm5bPAgHeednZQpydNqVLWQLLnNSFDhjm6gBmK1JUCO
	aJkdRIqeTH6trTz0hKB/UkQdAB5dU0AeUom1ObT0rbPx6RdYKUC8rrTtezb/jJdSd+294+Ig3fE
	ISajkhEhfcu3+n+xKocW2QAz4DcyNy6mqxoqAeOqUJ83ihe/LNJCCswDbmgwbdeUeFxPhbnEy7d
	CfTP2bbRnWl5Ch200Sckll4dTDaWCLXgy8gcE9zMzkO/h049NTroOVtHeaHg5s+blVxgl+fUp8Q
	T73cB9eniRNcnXvZH7UTB0nhmtqwr+bDdBrNPp+qvHx4uYVlpTezl0dian/DsWWOXAIfwjcNKGT
	E+K9X7CDzBIzyTHK7TWJyrNxiZE1kXxATk0ICPzcEstasjswPfaoVkv/R1zzo+npHRRW4nZzGZq
	GG/Ew=
X-Received: by 2002:a05:6214:252c:b0:89c:d639:e7be with SMTP id 6a1803df08f44-89ce8e1d8d3mr23215326d6.5.1774615699985;
        Fri, 27 Mar 2026 05:48:19 -0700 (PDT)
X-Received: by 2002:a05:6214:252c:b0:89c:d639:e7be with SMTP id 6a1803df08f44-89ce8e1d8d3mr23215056d6.5.1774615699594;
        Fri, 27 Mar 2026 05:48:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20218741sm245644266b.1.2026.03.27.05.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:48:18 -0700 (PDT)
Message-ID: <36e5cfb2-63a5-4c7d-a799-98ae3248bb20@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:48:16 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: soc: qcom,aoss-qmp: Document the Eliza
 Always-On Subsystem side channel
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260327-eliza-bindings-aoss-v1-1-70df76adc69b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-bindings-aoss-v1-1-70df76adc69b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1ODNvWfnfxaBZB27Qtqa4eh949cDCOBh
X-Proofpoint-ORIG-GUID: 1ODNvWfnfxaBZB27Qtqa4eh949cDCOBh
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c67c95 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Sgd2lwjIgByo6sUrMNUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NyBTYWx0ZWRfX+F5u3L6QcgVX
 ES49eGDMs8dmlJY3RUs5TgYAWQIs8P7zf765orDbStU6/KWGd1ww4KYaCmoy9ZMxfD944EJx0Py
 lTmAb8Dw+dO5LyviBe728cRukd9yjYtvoekz/2Yg6TyPuIJi4kWxt3MTHXtwd/KYcshO+MdrmuH
 9a/TUQsrkfSJp+EkAFojvRaPy13LwRJxWTdDPTQ7AUgg+V+dUfBZkQF5sC3XjvmFHcbcOx01WET
 wl9qb9hyHYHXSxZnfRdB1tc7SfbYrkR2ZDlN1Q1at9b4yJmTDtNvbRnTlob1Y00uSBkqBfoJ9YR
 EcUtB1Pt3MJpJ6kJAvFjjFxIoXT0F9fM4CmqAtyvcdrnrmkpIYZrxnwm4RKprCy895AcZ4Bt58l
 r9xlDXm/eGoIrsmUHaG3a9PGu+tguX+cDbDwr3XbBncMIY5E9VUGZuXmLRoh1DPUTDV+zsovs+m
 bpF7qLw9HwpJbD/Tkyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270087

On 3/27/26 1:46 PM, Abel Vesa wrote:
> Document the Always-On Subsystem (AOSS) side channel found on the Qualcomm
> Eliza SoC. It is used for communication with other clients, like
> remoteprocs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
