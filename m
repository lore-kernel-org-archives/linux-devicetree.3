Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000813CA4AD
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270716; cv=none; b=jmyza7hM7F9Y4oru/oDQuzC6J/4kuF13ndbMsSjWSOpgqenuaJBah+qyg30KcpOPjYhrDNfhADkJ4K0w0GHBMYyATlQU6AIC9I3fll/MNQFxtIzmGgG+3MMlvPVxBcEsyla56dRPDTeYwbc7O3NabzsWxuhlC1vCxHO4gUu7fZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270716; c=relaxed/simple;
	bh=nUQUz2ZwrwV7hyjdRkTWtYe+1x7qlMef9vc1soOUgjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EE6z3FfWaeLj4vEPEJt9mB9Cz/Mrbi+731ticzFl5GxizpmvH+7yjPK8Gs8KjvJbVmumoQGnU9IfFmc/5F6tVrNhhJ5gdU14sRvzXpzFczFRrqcPTCIDRlxtebCxuHl1cktHuAourlgJea+1TJSemE+tEN1tPNcfpesdrwzJqQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fncSJCqJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TmYlkwfr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fncSJCqJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TmYlkwfr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7Vs8n1636919
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyJEuae2MVU9lq8QGGE+EQXImrpko0AP1JD7+dZ7iEo=; b=fncSJCqJSC0M/6Ut
	5bGXeIrghQEcI8yD9x7Z2DF2pJJp9kzeGwTcne6D+sa6wsG3wYcxI6vlDJxJQGZo
	5hIT0vU1/YhyG1N72BxOunisr6h4VjA5axqYxavlYhdOROkGVDN6JBDWKhp8iYgi
	Th4+aVoANyvM2q/6NNAtRKRZkj7/JkCLt30ktM0bWnoP6UPevbGY/G5+CYu9rkJ/
	zen6TLeh89HwyrLNNN4arfjjQpGtUnOEERidhm89f4Vnw76uTn+RKTxtfHBHjCS1
	WvN6yJZgPg/C1L6s3yB6z8HB6DwI5lvLZ8aDk0hRCMnuVLd9sq4Szlp6FcZqqMl9
	SNUX3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sc0v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:51:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9114b077480so105386185a.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779270713; x=1779875513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cyJEuae2MVU9lq8QGGE+EQXImrpko0AP1JD7+dZ7iEo=;
        b=TmYlkwfrSW9OMeLvdLceyVW52rEE+bMGETaLjd3Awnc5xWzEcKdlBOhYQqLhI6vE/3
         +NZ81ab2KmFbEaJNtWcQ5CzNOIneWMy/TgS7Q1F29QWfU4khY7pztUBYRreH9kYizA7/
         PVleCIkoBbdmD8Reaob+8fyriKCg8Z9eRqrhgtWZNiWCBFln9GJl5uwtvkhiAFIcyILn
         x3AgQ/VWqiZqD9q5kq+/z6BMxapWKdH4ouO5gm8IUxxlTcXzbbCxcEmtK9ovRAxbXoT6
         8Bh5jw3o3KEHG9h35v8HQJzB2SBYg8xN8CTc0pcy5xVF3yj1M/2s9/jgL/LS+jNxT9Dy
         68Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779270713; x=1779875513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyJEuae2MVU9lq8QGGE+EQXImrpko0AP1JD7+dZ7iEo=;
        b=mN+FoXuLAYn7WHgMlk09tO0xYHuaZ/dheoIsPCb224Nsu999JFGHM3gfz2vTRUQgvO
         p0jVdVVLLd3gbIXlDggGRA0VF2SqNm0hUeg7726YocflWq2V6yuixXu038uinqpWAlo3
         0QXP1nsDr4XhugvnTxwA4QgZlwh5OxILhD6IUSzMt/7wBpI3VHTkbKOoNF+KjU/uLRDY
         4zogwCwwsWVE/cz9+Si3dFNbKzMrang3EsqZaKIGBWRXFX952bF5cHx1rLTGJ17pkcK/
         zD2wOEn1AtZex3i8//eBJ7CpkW/bN/asrQE048FIajpcb0p+kKLl+Ue2q07KiFVnZApW
         mFsw==
X-Forwarded-Encrypted: i=1; AFNElJ+Op0iyWZdBaEQZKk5ssqtYPHkqriobZM5vAe+s/rQlWzwOAIiD5GVbgJM9Akiu0zVAtW0zEiVCJc9h@vger.kernel.org
X-Gm-Message-State: AOJu0YxZUQYG6atmImjVnkQDnDjsaB8yosP9WKynrxmXrb3ZsU0m3ORO
	2fCBIo3o3+COzOdVe7RGVZb8iBmA6hDjcHnJacCk1mNaE/NqE7RULPXc31+rqj79YOis4UCsxXa
	hrwxtg+vQ0cE1qE5rXMxYNXuDU/opY5pebwqMn03+B33KV01LlxGXmsw2qVpsSXNy
X-Gm-Gg: Acq92OGQA8+6MUpj8WLRPTtZ9hRQiN2kso6+8rfNJrSXKJRLvNS0dv5aTohO61+Sql5
	aqjyIP+30C+KkzLtsCxmwlaYWhuOpSvpefLZCCdtn8xCrUjFaw3GElIy4n4gZXdlDarEwlXN/0J
	SxuNXIkHxyAjp8YCmK/Q6kqFwUoVaq7K38rZLY/nF0tTT3JK5sanYOq3Z5ULKakX9bGhL9Hl6hC
	nFPdFXw0BXn94/XXdAgh/+OWDRMfFpeKhY3H7qdm6KpV6vWB6KjHizZudFnswGX5OEyqA8yqoTV
	koLnDqvnpjdN/3QbGNsyhrSgY/tXPaIlOAsweU2cXIdeqp4Iz0JdvlTSZY2BE2f+o++xTdF+5pM
	/t4FC/dCYNDtgh3ih6DgUtxvgR21UVGc9kPuVHQtpoDcOjZccNQoWVa/0kjUn18pG1KkVF1QVMT
	RnEFIbiA1hnLRMiw==
X-Received: by 2002:a05:620a:29cd:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-911d0d53498mr2156045385a.5.1779270713414;
        Wed, 20 May 2026 02:51:53 -0700 (PDT)
X-Received: by 2002:a05:620a:29cd:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-911d0d53498mr2156043685a.5.1779270712993;
        Wed, 20 May 2026 02:51:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311670a00sm7493755a12.20.2026.05.20.02.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 02:51:52 -0700 (PDT)
Message-ID: <7b47ca4e-dc20-4155-881a-b1849cc000c7@oss.qualcomm.com>
Date: Wed, 20 May 2026 11:51:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
 <20260520-add_pm4125-vbus-reg-v1-2-f6d15d7dbbe8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-add_pm4125-vbus-reg-v1-2-f6d15d7dbbe8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NCBTYWx0ZWRfX4g0YHqQRt4qE
 2gC25dRFE0X2Ajy6/12krUnVr2DjPRDbHTTmpoK6qlwp9qQ6zDfVmq8fsjso9HWHYbZn1VMW1Zb
 5rsfUEzKctiOxSmYo3D1hG+59Xpsr6p5SwmwjeFCr1+iZhU0BeD0ox+tHtxGqmcB29myn3Lbl3M
 VALkR4WYO2Qu9flNgT95f4uDUgI9JaZwJlGoSc9YkAzP9mM+glvztS/nEUNEAt4tVZkvqsbzExv
 OrYNZh3jg7ytE+NGkE/g7PGtAT521YNdylNlPb8t1rFF9KmJuTDy/rDm12AdPUA7pCuGEEfcBqD
 O20cHpZBpoxo2OcfS0sfV5Z27ELdR6+W32U6Yzd8Tm+xZhjiSJL4qF2FFPkvLeC4kOO8zZPfixe
 +QBG3VQWf0P1nKlDhPTI/MafOr2BIhAhaVu3M9JveYgG5kViCtP7ZxYOTGuW349wLC3lplFDUWg
 cyCxf9sAkgahjwtp/qw==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0d843a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IoUS9DNabq0DWTRCKIYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: zWa3NoC5sUhDgbN4qTyUvAtVL5gZIulx
X-Proofpoint-ORIG-GUID: zWa3NoC5sUhDgbN4qTyUvAtVL5gZIulx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200094

On 5/20/26 11:07 AM, Rakesh Kota wrote:
> The PM4125 PMIC uses a different register layout for USB VBUS control
> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> a current-limit selector.
> 
> Introduce per-compatible regulator descriptor data to accommodate these
> differences. This keeps the existing PM8150B current-limit logic intact
> while adding a dedicated voltage-selector path for PM4125.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom_usb_vbus-regulator.c | 102 ++++++++++++++++++++++++----
>  1 file changed, 88 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
> index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..3d425452a0b35b35c4b454f84eb28e87cc8ba4f8 100644
> --- a/drivers/regulator/qcom_usb_vbus-regulator.c
> +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
> @@ -20,10 +20,35 @@
>  #define OTG_CFG				0x53
>  #define OTG_EN_SRC_CFG			BIT(1)
>  
> +#define PM4125_CMD_OTG			0x50

This register is named differently

> +#define PM4125_VBOOST_CFG		0x52
> +#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
> +#define PM4125_OTG_CFG			0x56

And so is this one


> +#define PM4125_OTG_EN_SRC_CFG          BIT(0)
> +
> +struct qcom_usb_vbus_reg_data {
> +	u16 cmd_otg;
> +	u16 otg_cfg;
> +	u8  otg_en_src_cfg;
> +	u16 csel_reg;
> +	u8 csel_mask;
> +	const unsigned int *curr_table;
> +	unsigned int n_current_limits;
> +	u16 vsel_reg;
> +	u8 vsel_mask;
> +	const unsigned int *volt_table;
> +	unsigned int n_voltages;
> +	const struct regulator_ops *ops;
> +};

And because they're so different, keeping them in a single driver starts to
look a little odd

> +
>  static const unsigned int curr_table[] = {
>  	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
>  };

And I think there's current-limiting on this PMIC too, except in a differnt
peripheral (@1300)

Konrad
