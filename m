Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603847;
	b=3Me6Go3efeTAwJmIWFilLM9fN6eiFeO0kF10wj9r75f1of4ucSfQPT8wbo3ACmvJY7a1
	 z+AdSSdpXlUGTnXCZiDGpKFMCV7THeWMIyNrSqb9GvIU0RY/kp4U2NPrQlUdxL/MimCTX
	 uMYZ2bQxhPQ9IehKNiLJCMc4XpUxWXUs6u/QTqa/iu8/76GoVtt6TGi/9ZSOZmPpMgMOy
	 TuD8xwL/xw4HoU/i5XOe0pYSaQFq+mjSasRQhyGNbuQS9kimGaf/FRF7oZgUUYppEXd78
	 gvAqPAGi27nPNCqUafrhw5gt+z2czG7d03eBG9miHnZCb7GkHRJ2/TCBX+ExRgN6ZVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bia8k3E0+Fi7EKvRHW2oHQSwTE7OqUkyuc0dBUGcvBA=;
	b=gMpgSzyZN+1p653acP93PXZvyqWiqzw1Q0okACOzcBckyZ1iBmR0mhWrQ5QVBNfYFzVt
	 zoJEBA7Ql5zKiaEvSqT/viOFMGe2ZjvDeHNTT3W4YoO7DWJEUnb5vx4lDY0SH4Tr3tZ1Z
	 j0iUEixMO50CpIb+KJo7eWX6jmvqwarZU69+jGJ0LN9uKN+8XUpQtCIrGPSkrK+NaEXHY
	 4eeFXZr8oFTpLtLvXI88jY+yGfWcHLcIlW563+P0nVGdp7YrIwbpMPebzHuX0MYXw/FtM
	 EVxY6X/p0wCe1h74c229F7S1h621uok0lx+7yUA6KGVpDeprS2P6Zsy4z7vyD+jRu/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TdzD+GO/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VtW0JMYd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A01606A331
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6A01606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TdzD+GO/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VtW0JMYd
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9m8h74130785
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bia8k3E0+Fi7EKvRHW2oHQSwTE7OqUkyuc0dBUGcvBA=; b=TdzD+GO/kXtb5DDk
	iiQ8TAlSDmVWjIjqcfdRUXCclCB3/n6dN3v6J1wHiXZcKBIlGD0baCQlN+U8h/4Q
	DLM5iABHb5NAAG26K5wjYjAwLg+/V60Zu8OpYT4AXkyUGKP+XeRb/YRIrZPT+hqI
	LLRKGtSkpPhG0vZAvIkSGd8gqMZw0PV2j1iUyUt6WlwkUrsMx/B5/7wTSbdGrGug
	Z8p9OmqvJC3GS2f2AnRfdSsVuRwmeDmMYcJwiyNRKNsfgmzX0uebiPizxtoYwwck
	pGNByZ8epYMbMYsni8A2b8kM2rYLiLNzynfvCCQkK3Eka/E4c6+qmSSqcTKq4Dkf
	OBfbxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrf83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d2d54356fso16937081cf.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603845; x=1796208645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bia8k3E0+Fi7EKvRHW2oHQSwTE7OqUkyuc0dBUGcvBA=;
        b=VtW0JMYdhB4CPTEjJxalIy/04+DknY32XYeuFaddw2D45qYwslnM4VzxCXfVP7MXhi
         Qqj6rQScbCwOF8BP24mwvUA5Bf/uCPFDbuGYJJk/gR//dpOytfUiHQIN+u8KPmygDqzr
         ZbQhRuQB8lRPwwnpfHsfr/Nsoub0c2+/QTF7FD7ZHIhBhc0g7MCi3vO+CzVvf+dCTSzA
         1gyGsuM3gf+3CxOjkZXoDVwBUZDAuNsqkPF6+SrPpqw+bNR3u4VZti9gR59Qmt1D4JJl
         FaJJn6dYJHbJzFbXz5e0et6VLxV4sgdBa7rM39RTyN2HtCySm9uwX9ugtuU4FTZiX3fH
         oyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603845; x=1796208645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bia8k3E0+Fi7EKvRHW2oHQSwTE7OqUkyuc0dBUGcvBA=;
        b=mHmONhCoMQVn4MRabjJ7z6HJ1t2LqnbxqGVZk4ExnlnhSeXvTjjvIxaXWinoK82UT7
         koE4WEk6cFs9QHQNd7Km0hpRTZBHHS0Yves8LYaH7I9w5RBUQ8mo9LY8yt2ujKW8FmRZ
         0XZyt2ccBOohMgwpZtiOfTqnatSN/HVbHMnFjTOhTvTlsEEAhRlKrbRpLm5OyblOFzKJ
         zCnoT4PpMacpZXNEQlpwnV+qlN1GUqadaCe7agXcBNOmkpxM0so+8a95j3IKXAPb/9gY
         b9pFm4CXhEjYt9IChOOYdvLlaCiVhJhXd04XLaxfX9rWoLQBQAI75mFn2rxHpLJwGB4T
         aiCg==
X-Forwarded-Encrypted: i=1; AL+hErE7AZb2PuJduFcuQQ3XczK9FyEOpSD2Tvma41gBcUuPOZlptirtyR+i4uZzlpucsCL+wGY6L/ka1JS0@vger.kernel.org
X-Gm-Message-State: APuU4Z/38I09lMRYDIhYZ+bwmLUnYrPloI2mM+Hf2sUKvffc1hrMzd9A
	JFmas4pWpSAtLDOe63U+JsLGQSHWL/gHUKzCufkWp1xcnY9sZxRB0CFU5RIxcK9CWVTmGEe/xHU
	J+qqxiv8SfBoXbrFlPYV8dUBUcRLiNbAmS0k2Wj9w/gu6a/+H1gSZEZOuH5poS1Jy
X-Gm-Gg: AZFdTZeC+M2XDJhidTLdK9QL+3riiDGdiLxQZQS/cwDSyBP90nGPYMolpjvEEhGBsy7
	a5qwuxEe55goZVIyO4owI+zeCXUlRaoCn15d66raUvihdKTUQRsGpdCs/dxtwPHeP/G4b1xayAY
	kLVnzWeHUA0mswEpBbCMNk+f7EtVErhLuPzEe5L+hA7PaVc0jGQk3n7UM2TRcoBsXY0gzpVx5tG
	N9Ydb7CPjCQIriM073tHzmzghxAwPxN++91fM4T2s47zjOCWfXw2WZE/pBwyxGviWBqgTMl8GTF
	N23bp9wBYypovzfNnOkWGGraxuVhKbRwIf3FvVs/S08NXG7z6PUFVJBeDXYsZiFx/6s0vMopJCs
	FbXRu+8C/k8Bc++Sa+fScpJAf8NfBlmZ4+kWXYSqozmJv0B7VS37tahQq6EC9hNgWmXS69rM=
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr308082491cf.5.1795603844978;
        Wed, 25 Nov 2026 02:50:44 -0800 (PST)
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr308082051cf.5.1795603844557;
        Wed, 25 Nov 2026 02:50:44 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85ecsm617406766b.70.2026.11.25.02.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:43 -0800 (PST)
Message-ID: <2e7662c5-d025-4186-977a-a011a66c582a@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:41 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] pinctrl: qcom: maili: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-7-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-7-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06bd85 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AUjckUqZSjTMZ1qE35IA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: UZ6K1v_TtVrzBIq5Rs6MTa52jy8Yj8ik
X-Proofpoint-ORIG-GUID: UZ6K1v_TtVrzBIq5Rs6MTa52jy8Yj8ik
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfXxgNSSWVQ79i4
 sc2a1nK+DtoeBfYAuoIKwN+T+hvmf5p4bqTzV5qKDO17znyhpo1D5DnylQa5DYNaaR1Oc4g2jwG
 ZNj1yjFuRrmLULKoGpzRIPtPVsHKDNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX+rHZQVzXGZxa
 ULpDdLC2y064cPr+GJ7glZnvGKy7oyhkLXyc74QLR41Or0axDUvmfSeanKCl78Ke199l8/oII8H
 xfoatoPkuSHEPwSRFs/eNgD4LFkci5MNwWoboSBTglQYtx+BXx47MgSB8lMrU8h2QIbZHUM3UYF
 ZI/UxhqFsmTNz1Q/oT3uMhQ8gSiF7lCt31F+CvjQiTu3LnyHSggvPNt3vSLhHgvddhuRT368uP0
 22jR6xAiHAO6TTBa916x/KFUck1aP3oV/ZjWv8kqBV3c9paCxiq88Ohq64IggN3D39HIIuUj7RJ
 Ik7OrWtToSWpdIKv/EOEf7hH2gyWDD9n2r3dq8LX4Dug8dvSAG6UlkBVnXB2zx6mbpH0i2By8hl
 rT2sJcU8dO7Buv6NNiFGx1vNJBD61JflZAS90oRZUDNLnMBl/exqPCUgvZtgsJ62rcOvA2tNvkb
 5OqLxNRmdxJylvDGXhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the maili driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 251b53103a2e ("pinctrl: qcom: Add the tlmm driver for Maili platform")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
