Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127BA3B7752
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701969; cv=none; b=qkRRyvD4gEMRV4p9ddc5tq3Ci/97d5EKXW54eG3Tjf4dbPYxyz+28vLzqNcEl3ngycefCtHkkr5/+B7NssmMF3Clenjy2b1kWV9JimcCqIebUx5phD8L3+3LukJMVPJh6FpWKIWQVQmk1P8HAeFjzLUGErGo6TfGhOnQ7ecp9l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701969; c=relaxed/simple;
	bh=/xYSuDuApVlDwRl5mUUmCd+M8zOhVp0QHXRqk2UrHUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBegauGpoJaZx0BShqdBnyQ5ZpLOsd5Qk3pBq4SngUrgghPfexWIaU1WaapqzWkOhDq2EBSqvu4+2culyPBENNY/MlUhSa+9yi6VWtSupuYACXDnWGj+q5GAIERTKge1O30yJyJzXQnlc0jMm/0Ts96ymVK21QYh7hatC/+9nyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQq5qqaW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgj30RjP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQq5qqaW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgj30RjP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HDBBPx2903935
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bl7Cu9/Rb8h2gN+c/vf6cviy2rxKrYizQzQi6ZcXv4Y=; b=PQq5qqaWT6gifv18
	migQ05k3hZ43x0ykGskbXeD80/VilkA8dDLPyv7Spo4U44PVGXoQXbs2/B8CWvn/
	5q+0ncb/PcTNGRgXLJKUlH1FngDJpQlabMIVrJKHcALj5nrn/WYb+fpabdhA31SX
	j8LV2vjWmNqIruTpxh6Ctub98JgA5xuS9KlJ1i5ml2s7x1aqL9ovpLFjVC2tXDWs
	QMAhXnrrWmraODZqRggj7XBJN1sEwlbg10USIKoJoIE92sU4azyJYByLVs8n/6pV
	f/fVmDLQp408A77TLMKIjSHbFQOrOr/xi72sSwWPf+AY+u2epAy1aAda7/GGHznk
	h86uAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef2bb0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:12:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914b9d0162aso65817985a.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781701966; x=1782306766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bl7Cu9/Rb8h2gN+c/vf6cviy2rxKrYizQzQi6ZcXv4Y=;
        b=cgj30RjPRCAYvKX192WDMTBbfd//Q3CGNMucT+zntmwUZwWESNd1j0FX64mfMwDqcx
         OImQwX8Ct8yk40kIRpHgUzF7bZQrBb4XwFEyUdwo49qX7fl5nBbBO9KNwSQ+icqWabra
         ottE11lK9/wqRnqarq/T37K8TL7SdoJH60V0YFA8tNTu9W6L4oeDo+2C7mlkpMIV4TcO
         jhT1Dgm3btJ20yULtqdvMQ5UGQCFK44XHtYISX6ns1wyi3q+UQy1Qqr7qNg20ah2t3Q0
         /Y72DBkmYA+FhgzbAoNDfiWHwIiBMLcHgCYGexwxtt2Tgchf9jYa4dx8IQt++N1YsLhN
         Au4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701966; x=1782306766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bl7Cu9/Rb8h2gN+c/vf6cviy2rxKrYizQzQi6ZcXv4Y=;
        b=YvDXMrJqEcqHSiuMAHecJyvAcKqc92sVoElD611te4LfX6AEOH+zR3DPMv91ChXBI6
         YRJ7BB46Cbv98NBmHxJg6jiOGxaaXV2O0D4v/H1RIiqWrA54W2uWJr2ADK8ITeyGMgmI
         5V90i7vTXdt7F2Y1i2OkJQxJI3wUan+bynJXzkEDhQay29mmfTddwypyqxUHTN6w6+py
         oe/3ODLsuZAxqxTCYP60VxdZrPDHTC9xCW8K6+FShKA374hjUYAK5PEz4SOeW77zg3m8
         1ZO7EhXMrwvz+veuTe8UNV7l+Y8dc0ppp7Yhen/CSvh/sM6yaXLui4CVg6E3x2YjsRDA
         s4SQ==
X-Forwarded-Encrypted: i=1; AFNElJ+r/9gY1rWnT2XuRGsNKRzJGmEdMv0ECCo/18cpVuYv/XjVNs+K6J7gU0yQpqSPCseBT4QstSh+XCE9@vger.kernel.org
X-Gm-Message-State: AOJu0YwfrZGFjf0JmzmFjlsdQXojShfCZMrj9tJcxsqIhBtSwss3jOv6
	nFgeS+mtZ8vT22FznUpnqM+ExELFO/JQv91sS0rfmEKbCHorx2crPy2WdjNJUPXr1T5DpepSGZp
	lH14Maqf3Fy1QWl7UZlIy5kZiPnQn/k9fzwz85k4lNV9Pm4+/PSHT7wCbtx0kToKO
X-Gm-Gg: Acq92OH8SI7LYe0lCwlWcUgGNNQ9B+GdsM1luTliPXaz3049UlVxghn2hNr1PybUfwY
	z+tSQGo6dS6Lw18cU45QLi94UoalNqhNEbaGUS+hNitIZ5zHBvm3WXjm6u3KeeSoLVzWnKQVJux
	cQ2NfvOPLHu6qu6WFzKs44Pgg7SxTxPfL2Rv2mEssIFD3tcdG9jYo/ew9XDsYdFUkyyuWsyNiuq
	2lQKSytplwOyMV6F4oY1k8k4om0dvJm+xYzDVvPMw1yjg/IBulkTKS0Qk7tFG3hOAqcwnK9P0d3
	vguFl4FnHXQOluc/J8qwqoDuzKMfuF1yr9LXj0E25OUODDUlfXiYEH5ZImNrPc4fY0UEhwvoboV
	vCd1NMsgUoQ80R+lYWmU9LRyfFB1jweBQg+g=
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr404161885a.6.1781701966266;
        Wed, 17 Jun 2026 06:12:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr404157785a.6.1781701965809;
        Wed, 17 Jun 2026 06:12:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948fc99sm6573561a12.23.2026.06.17.06.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:12:45 -0700 (PDT)
Message-ID: <0fcfe7c3-ff54-4a72-9529-8f55d77814ef@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 15:12:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] irqchip/qcom-pdc: restructure version support
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a329d4e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=y--pFEGKUWMBhsBSRrIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyNSBTYWx0ZWRfXz9Mu73ZB2Jai
 Xi67PHdRNIkkbUXtcDz77hW6WIHRH1/NzO1P2LmwEHc+WeSZa+pFZuY8QuyFBNC7CUwtrFIzAZN
 N+BvvV5mF45XcH1ZnGodH1May7TPFEY=
X-Proofpoint-GUID: uOMTjAVgA7PESloJ12zBVVUW6swbcC-S
X-Proofpoint-ORIG-GUID: uOMTjAVgA7PESloJ12zBVVUW6swbcC-S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyNSBTYWx0ZWRfX4cGmQDiGkoA0
 C88Qb2ceo/xvgttcPy/0fAbpLVXRdgZqx39186qSGhVum5sAGEnDtOwHP2x2eutPB7LJqwkywuS
 IYsSZ0/8ptVDezOK6E1+OPOfJQmxB3E+qFBDcu1lrJYIHZ1vmMjrj5VTRrHux1XR1Mf0I6UO+Wu
 5gq0rpf8qNYiVPvImc8tu2GjpSbrAWDB2ZgAQp4g4jXzNuWsDmAUayhr2IvFAZ9yv1tCKgWN/1i
 dNXw7qfji9Gk0zxUPSdNXvvPzZ0PWlae0ciwyXRO4qrUdvGu1N05l3BJguoRJaogwSwH5hfXP76
 WTv0yF5C/V7dlIWx3iP+tztcOMWQW11hH0o/D+JUaKtGPP4lD3hE2CkmXCQShHzbTAc0B//C2El
 sDCddKfVNLsmky5vt07DBFVWPwWxk7Iil6wKYa/S1Ykpeaj0Ukkw6OpI+SBj1sMIfJoNj6hVd41
 SrtU0VcqU2X1n4Ua5Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170125

On 6/16/26 11:25 AM, Maulik Shah wrote:
> PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
> versions v2.7, v3.0 and v3.2. These registers are organized in H/W
> as below on various SoCs.

[...]

> -	ret = pdc_setup_pin_mapping(node);
> +	ret = pdc_setup_pin_mapping(dev, node);

dev is enough, we can get the np in that function from dev->of_node

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
