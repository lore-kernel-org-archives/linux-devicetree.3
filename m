Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EA038F628
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334942; cv=none; b=aBprgZw6OInsSTZ2+04hPNtXCLv08PA3ttuKI1A77JXBx7usJyywMan09NhLaLjlTQn4/WfpK6M02HyIrGbyv9Hi52+aH2GxA8NKkgytDryPTT9IdC94sEwSt4+pXYO81DAZYssQnhVK4PUgrYfsXOSz+cdB3nxqo7Ju8a2OXHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334942; c=relaxed/simple;
	bh=iCB7897HV/XIy0aWQaoLcOKCxNFHQxcW6skNabD13Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDMjajq5++GtCZde/HTW3srj1pr3utsNYS+PrEoGqXQqX7Nufh6asWYpt3bv+Wl6D5nlI2qBjs+KKyTq+Cwsjep/KlkFfXsx9/hORfRHzBryXJQT/rTP/xcYHGyf51UIbpRIImO6dGbot1Zh7ZCHn2P4X/cR4d0z3f/fdFzkxR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WdMP/48b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oqj/1ttn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WdMP/48b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oqj/1ttn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6OxIA2652259
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b3qEjPRcJQn6pYg7bXpBVgJVjRdVFl779OcCItfqfT8=; b=WdMP/48bQKMP2x+8
	8eUedH25TxjVsykzU98QoP1WGR4sxeIZynkQwNvv2MLOCPD3Y7IaVPAAzh/wV7/X
	TvL2fIlnGua/QeSvrTjJem8vimNEPSZQPShCKx95PQ6PcOiZifvYbjmmVq0ca+1+
	K7bwzFL448J7Ln/0wMkOQCSUD645ZHH4x1prgXTs/SI5XYLaOmbTrx7xnr8ukQqz
	ZiumqK5wPsBEGAa6rft0P2jcr6rfGWiHLP+BjWOveJayWTHTi71lD3kuuk6ww5EG
	yyIqeGaAjgzmjRnEKWNdAUg+FdPyg9WY7d1bSa30NnIKkBNxqQDT40yfss13gdy1
	916yxA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfugvvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:22:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso68649781cf.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776334938; x=1776939738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b3qEjPRcJQn6pYg7bXpBVgJVjRdVFl779OcCItfqfT8=;
        b=Oqj/1ttnvOazDZJjYPf3H9WXF5vA4QSCxaXRXhyWMVcAhyAmiHzhCmSlqCIW6sT9m0
         JVHRl+bX8Qa7ubBbCBofSffZTAgbzbyRjEvyz71W/PDPOSo3QH9DjbJK8ht3wYFFAWcP
         ZETi7M9ZuBX4nKmA04M5N3336f2/uP5HT58SiK054bt0oOomtUrisVaxlFWAKvCDGmwi
         EnpIKsYPUpdlJm8c5Zp5CKTwHgs6saanzgCeguzJc5BYw2+kFuUNy7yU7hqZiDXer9hQ
         E2+XN4UDEjSZNYrXa9A6UGhZhYJeGKBvqIl96wVxGZMOWXFhzrrZwtunO9X7sKzqQwnw
         H7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334938; x=1776939738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3qEjPRcJQn6pYg7bXpBVgJVjRdVFl779OcCItfqfT8=;
        b=ckWQuzRLLY4tR2xZEo9cBZiCeIrJuhUzuUw10Hnr2GwrJrxwqj8diLt9a2OzT9xc8z
         ihoXJAwHoQceg7VpUDJAFzE+cnYMfT5cVQhrIe8Dk3QFBgDJDo3g+1h9QCdTTDwYUSV6
         B/vDpTYHMNDz222fQp4d5JqaqzTIessMga64rj9ReulMgQgPWo9UmZh0SNq+z35NVWa1
         VlV17R6hLuYfKr3k4ixEEesdiGICCvRL5GXtZU8ab5/PEk3cRihrHZAO2+DNwC+qc0yO
         r36SH/uLoAy1YbTaAAnajV+sgWmimzjQtaez/gbo+0yX1o4ffVu+PqS4e7A60UoZSQtW
         6a5A==
X-Forwarded-Encrypted: i=1; AFNElJ8qyJF7gs5tGs1pTfDx95p8urgCTWMFrAmP9yYYkCB9NNuXp3XC0H9zvROTdwqALSL4TF2vVPlJhzxk@vger.kernel.org
X-Gm-Message-State: AOJu0YykUmj8Zyf4cnsZJVTFogJ1I7nUP27bITyPwjvAJCJnmL8xmMRx
	2TaNrOnwOyjCjGGXbFW8rhcYKDlTqtHMB+41sXVi7bwukl5enKJTL4r3yl2bD2+vRCHFm3lHYoK
	tCz+PPwXsGVks0yjAXU80SxltMRtjxGHBaT5Q0w4kFOQjtKhyzFtQO8NIRniaOfoa
X-Gm-Gg: AeBDiesBvcpZ+5Xw8YJe+OZAwdsQWt+iELpwbiFUzHcNmJDfewKCUfB6B1aplRH62tr
	sLnYK73hABRRko3811OgyvP9KHU9umgholaGS8xtgj85fq9feZ4/vhu0diTak780GmeFHF9TbyV
	2BkisCfdNA/72f1uFoCiVOxMfMUYeJedalZU/ZnFDEULuU0wGN74E8IIHVO8lUVQrPJl3hZqCtM
	15+1SiPN1ijdN+aBpI/N3MvRcHAg1Bg8DOQrhh3+Q5UoJeL/YUNhifHSrMcdMn9hUQjrutjYemm
	NawyZ6tJ20MHRkSrlGUw90fz8iLBE9FK1QVZjH736WjG+J/0+mvxvaUUilF8pA/I+FpnRCNos+i
	JkPytkOxktqjSW0MEe/hd14vk5PXXIDycSLxHzQF6uai8C73tX1ONTla+UEPJ4J6fxcFoyPjmNm
	Kd8Wvo6Q3e7jQ+Aw==
X-Received: by 2002:a05:622a:59ca:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e28f1781emr15688191cf.2.1776334938496;
        Thu, 16 Apr 2026 03:22:18 -0700 (PDT)
X-Received: by 2002:a05:622a:59ca:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e28f1781emr15687971cf.2.1776334938080;
        Thu, 16 Apr 2026 03:22:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba24865492asm96293566b.24.2026.04.16.03.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:22:17 -0700 (PDT)
Message-ID: <eaee286a-9bff-40ce-b9cd-5f8923736087@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 12:22:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: camcc-milos: Declare icc path dependency
 for CAMSS_TOP_GDSC
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sHIR8ldTNlfgt_ZR2IIMKau3iQpe9WZh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5NyBTYWx0ZWRfX1+93DudhcEHa
 SzXKkSYgj5XIILtgXn0v8RLovlHJH9fXGLJKbRUu0ILe1iLMSVaz8+lVMDGirdP4C6lTxTAn1Ap
 NrtjoFpeDNFLATcYG+PQQbxvatC9Ky2kryIxqrfEyO83rdodYEPZeZxI8L5sHlxebwH1tqAPq0u
 keZaBr0GsmX2NRHjKV3OXgSFMTenGKAnhTFdvwVXqjqbLE9wtgB938Dke1XIyN5iPPQ524NDGIh
 VweeY5KDoB2whltVS7x9l1QkP+IGFt+q96e4cve92sm+oxLlxEi+rLbaIlNQgAALppCoedmo/Cn
 83VCZ0x3r2O6hcexhij2nhPtlROZyDAAs/M9+TuQp2vZIYjzZBrfKdr8+Zy32pM0oZBNZEaukkF
 w++fc93tVBF3mwlzpmVFxVibhJ/17L4rPS7eM7Y7jxqn4zPU3YDbMRm89uQJVOHA3j1duxKnhh5
 MXeq17b49Hia+ekPvTA==
X-Proofpoint-GUID: sHIR8ldTNlfgt_ZR2IIMKau3iQpe9WZh
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0b85b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=uEvfv33MuhQ9VhGiz4IA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160097

On 1/16/26 2:17 PM, Luca Weiss wrote:
> This GDSC requires an interconnect path to be enabled, otherwise the
> GDSC will be stuck on 'off' and can't be enabled.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
