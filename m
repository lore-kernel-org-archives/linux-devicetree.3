Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B4D239E7E
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 20:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246999; cv=none; b=qLpK7zZGGVnmGu3zVo2h0hDahT6EWeQp7Dw8OjXnyOL8Q++59ZGTtF6up5hyBNlwd9qD5Swgvpx9+rOViEEmmXOAjjgrsEPx0/HCPM+PqsOgD5vIssCv1yaCJtsQuWi41Ntx/MLjZFwfP8nwC80N6kqZledIS+A2xOuAsip5sJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246999; c=relaxed/simple;
	bh=jkvYpgiFxKcrudqUt5ZqS48t1pdomN7v15LlgCfguSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUTJIIT9jCQG5qVv8BMePl9swkwh20o++tlTmNh4Z3cagPLqlIASuv9md6jOZMdV+IWn6V+o6eNNgEwK4BaXIAn+yKYqeLuQndgZZH88LilorAUV5ADP23QPZXroYRB/tkyHg1ZOfSj5HCOPNPwVZZN4Aq+8ji5VNz0mEbv6iFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oGgR9wuq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZ1a7UNq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGgR9wuq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZ1a7UNq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633Fuxov258364
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 20:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tk1FxohX6VP8eWDY7hN1RAtxXGNxavm+7yLMo71jIOU=; b=oGgR9wuqJjpXOfxW
	8ZOgt71TbzyfJk6g/U6JG16zoBuTQMy7G/fn4q4k53YSNPuz/+5gHyZssTLkXYPc
	EdMJF8WXcsbqC1w+VR4VFb653RwHIuSdE5FJq0rFyeo6H0HUTPhtwKhNGKCTHaoq
	cAGGJFamzJ52hcbJJTWGZUu1+zGCQ3eUEXVOdGwiGq+bS5NYbb16CKadCCA15ie2
	yIrR3XkKUWDBOb7/OaBTRWoMvbtJImfC5SoQT1Td4Cn+RUGDjPTBxVi67bsRA8kk
	UmuiUoVa330FHdmp0bSpD6EqMh/MtnwsQB/k92/+wO04HMAWUdeSQS15tRCT8b8i
	zMS5Rg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dagn20n98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 20:09:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso31719055ad.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 13:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246997; x=1775851797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tk1FxohX6VP8eWDY7hN1RAtxXGNxavm+7yLMo71jIOU=;
        b=KZ1a7UNqgEfpi6wxL2T5yHetHs2Rc9IXJKXV5W1l/GeqQhnzucDpK/MgE3iFX5oy1u
         8Wv5D6bn1REDnv03sEG/VpOjPFkEIlYFOwuoz/Ju50VyHlx6L+JuYs+6JyfYgyPEOGow
         pz5quhad9ja9U2YAFjUBKUxWAiS5v6J36Z9qtQ60Ee/6X/+m1l7aY8RhLZcqN6AAj3ND
         gwD6rPSGThbHPbpso4x6mfLp+xsTT/50BmdoF/G9rXGMjOqOZUrIa1IVCWbso+xhEAQq
         ur5MTiF+H9QPY8uavfCjMT5BAtOm3Si/MNRmlJpN/QnniSx0dVZhb/0z2HrI9mzKZmY5
         zWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246997; x=1775851797;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tk1FxohX6VP8eWDY7hN1RAtxXGNxavm+7yLMo71jIOU=;
        b=Q2aY0Sap8bJ0KrayuglqCoZa7dDNYMoo2pOhxFXolq3955S1AzYt8oFq2dlaRau61V
         ZusZ7s8+60AtOsVyQVfi8GIWAKw2tJQI0V/DMu1/icqhNxqbjNlTWjE1Gg5qYFncAHvv
         sAuefjK0ZXd59HqTqmjp6pFo2skLtfwcPYn5MC9SyTe3AKXMTpk72aRq/gGNVA8E53PK
         dZjcia9FnJVOautIWpKDf5gFr59xaOXkMEEsoxmlS/rEJDVMmRzSHspB11db3thE7Q5S
         /71fIheNSDJN+V3oyfGH1w8RvEctl8usbKYvmQja84ER4iADhv/m0BG1L8747X65GljK
         QdrA==
X-Forwarded-Encrypted: i=1; AJvYcCWHsyeoGld30KhzTrHoarXoZyj5DrLRm2lgy4icTEMeaWkiPFDYTNE7lvVCNSUHihG6+Y1Te3znezOX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6VXox71saW7ZXtpRu4LpqrZGCnoHMAknMTvZhrW0990S87mkd
	Aspjkukp6WUAd+gmDSPJO+R4cCVpNzpGFtPq9MiUg2Y4fJ4gE+EF3//1ATuCVlJHTuPlugxzH6e
	6aumu5sbSVlWRZUQ0VYk0dFLcc0sTp1SDlPT+d4PBnX9zcnP6YaKCIOvjoyyf8BjC
X-Gm-Gg: AeBDiesvCklbeq9ynsjh3QjhVh2y7NxE80HV1eBLGPnUG/QgBB9y7y6N6H0ZCBGNj4c
	OqwzmQRi3DDRXvPawoj6DnhFzkoxB+dyP5C7crqDDD4LdBcEY1XQ2eP0aHb7YzQTMIh8Sbtf46r
	UBoI16yZsJeBxZmRRZSFL/Ys53hXHBZ2FwbOFE22udTNdkVzJ7q2+Qc9JNJVNfp2KDTIVFhBCpU
	qpO4V/E/IPo8AX3XvszwW75WrpWyP5taDRVRfA9lhiXRGVOnva6e2T84XbfujawCx2v2lwi6aJf
	X0Ya/t/9+P7x9AEkoGFxZodsiF8wyyOoiQdJEcGQ3/RgoVhv8fHhmAFR0otm1evFRyFzEgG50CJ
	KjTlDoVgd/EUDW5l2CQKk69EJ7Q92au2B3JtaYdHsxdLtUQ==
X-Received: by 2002:a17:902:f603:b0:2b0:9a61:9e9 with SMTP id d9443c01a7336-2b281769197mr47455025ad.32.1775246996538;
        Fri, 03 Apr 2026 13:09:56 -0700 (PDT)
X-Received: by 2002:a17:902:f603:b0:2b0:9a61:9e9 with SMTP id d9443c01a7336-2b281769197mr47454725ad.32.1775246996036;
        Fri, 03 Apr 2026 13:09:56 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.231.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d688sm67019775ad.8.2026.04.03.13.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 13:09:55 -0700 (PDT)
Message-ID: <10a9a474-7612-478e-9fb2-85b7b01ec7f6@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 01:39:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NyBTYWx0ZWRfX62zNswdi4y4v
 WMKFyTXZ3oqnGpVjFia0Q9RIHKtpGHo7ggMEuzR3bn7Rc8y60iUIyg6O2H1GhJ3TmIzywBPLsyS
 JNp+EHOPXW+SNLICkcGq7NJDNpAFnXaKQLoq6mCOVRm9412xHnepd4oFtfcYNFB+y5fJrtFQVRO
 GQTi3j3aOfHqaE3pRJkzonV6EAzlEjodrjDlWyTZHtDPqABfw1rZkQ+IQM8a1AvO+fpCkQ4Yym8
 nrFd5ZCvnHwj2dHpsdc9U3S0tEwk1mDdxlg0gjVo6b97cyNHH8RApMtMZ1YmlyRgxQzgibiM13D
 +wmGdo+DXScAXPPoDhoXUrLikCE6ZeN5xd9RrGD6qNYTWRtFGJ9l/+NMTy5LV6LWoNhvmSt+DXh
 bcrWX+BZO4Hz09FAsr1quS0LA6NgOy0yblbzBEnqpYXyCdzj8uLq2CC61WYmUhjAgOnMaGWjv88
 ywd74k5HkcUTODHH+5A==
X-Authority-Analysis: v=2.4 cv=Cc4FJbrl c=1 sm=1 tr=0 ts=69d01e95 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=YUf46QchBRIYdusOZX0V1g==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CrB81z8CaJ2MUqEuDk8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: m_r-M851RXW1o6Ho-ykX-F3pZJmtph69
X-Proofpoint-ORIG-GUID: m_r-M851RXW1o6Ho-ykX-F3pZJmtph69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030177

On 3/29/2026 11:22 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali MTP variant. Enable USB controller in
> device mode till glink node is added.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index a603f3056d83..38269aebdf03 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -82,6 +82,11 @@ key-volume-up {
>  		};
>  	};
>  
> +	pmih0108_e1_eusb2_repeater {
> +		vdd18-supply = <&vreg_l15b_1p8>;
> +		vdd3-supply = <&vreg_l5b_3p1>;
> +	};
> +
>  	sound {
>  		compatible = "qcom,kaanapali-sndcard", "qcom,sm8450-sndcard";
>  		model = "Kaanapali-MTP";
> @@ -1326,3 +1331,25 @@ &ufs_mem_phy {
>  
>  	status = "okay";
>  };
> +
> +&usb {
> +	dr_mode = "peripheral";

I can see that the usb port in the MTP support 'host' mode too. Should
this be 'otg'?

-Akhil

> +
> +	status = "okay";
> +};
> +
> +&usb_hsphy {
> +	vdd-supply = <&vreg_l4f_0p8>;
> +	vdda12-supply = <&vreg_l1d_1p2>;
> +
> +	phys = <&pmih0108_e1_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l1d_1p2>;
> +	vdda-pll-supply = <&vreg_l4f_0p8>;
> +
> +	status = "okay";
> +};

