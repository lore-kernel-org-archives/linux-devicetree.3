Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0E9407595
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561968; cv=none; b=MQEvUXmLePq56hJTRLGuJcbCd4mznwOoEcNDYbn1JuvOUzVTEBR/wmE4dl4jsmohs1Lu57c/Jcdv/FkJDOqx63VJwR6ZB/DpgukDrrbaaTyFVLhc7Bq4CCrQQCa0XBfThb4/czQgOHOQs6vDmIE2xoDbcYXE2tJZ9CCOKz8JRF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561968; c=relaxed/simple;
	bh=G4L0Xf8IL4fWRdLnsrKd1HOfE8DHAWvVmaVeHwz8C54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ge8IjeBE7JBZlV8oqPnXSTm1yrtlM8oQIU/VBo2h8Pdx7zgWfmYS2MgHII07iXUp7sCydFRwyghU9oTNoiC6LrsOLaeF4Zg96/OM2rDpox9/BntmF2NwVcu5pGzupfHC+j6gJcLemyiqwcLW7t5J32BU/4jsKxMfL22RfTgp/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nA7ZlNwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TFQE49b0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nA7ZlNwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TFQE49b0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UCMTLW088626
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 15:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ulrYcfHf8eIqVY1+cFokIxV8AlG+2IlbHsMqaIrHX5w=; b=nA7ZlNwCnxkpI5Ua
	T6G1AUGmSdjawvYbxrjjjz0AeBOPpy6GZpQNm4/z+usJ7YfN4maIZqsCk0VhKPSc
	hHphZIFqkJB+IwUwPxcvf6OD6uRNnrn/4G7LzIyEjkU1ykNclaSr5jdwQiRmZvdx
	GXD2LS+EsBuZ3is+J1nYv+5lbj277XrsvoFr4xLAn1qyBBUHWo833MoTk/KCJ11T
	tDiBWgtiB79WiozhqPl6RYjded62mRvhoTn+WvGBYFs2LDn49ZitpY+OZ1zkqICA
	zLcRKFcixkg3PFmK8+dko2US/nR73peqs/8eoP9JNywyfy8PNbHOSgnywW17ncCK
	7h6oaQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u426me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 15:12:45 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95687296dbcso84106241.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777561965; x=1778166765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulrYcfHf8eIqVY1+cFokIxV8AlG+2IlbHsMqaIrHX5w=;
        b=TFQE49b0TWm9tyGcXvlmVbSITqFPxFJTkw8S1cJvt0Bp1EsdGZKA+qQUWZdMPkFo6F
         NU4YP6kv0hfoF6BYLtmOUIqHo7Mji+gIxKYSjKvXjxUzRS42PuPx/IvznBBb2WMVtAD9
         7l+05zn+wToBc+6cMwd13X2zuyZJTcSWm8q2z7m/FJbu7WlzfKJuKQDjAEvZpWbJHIG7
         IV+IJwNJn0sKtTasqRJHNNjAtxXup6C379a5yCpfZvtdepfyKpwqumVeIzo3u1eDJpx4
         4fVQ8RWOoDq/k5Pc41LnRt9epsYC1qP9oUDki/DAuvpS/EhGV+/8x06wQAI2LnpJ0tPY
         7QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777561965; x=1778166765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulrYcfHf8eIqVY1+cFokIxV8AlG+2IlbHsMqaIrHX5w=;
        b=GGXVponoeKrQQ2n0//9IHTiAu1OTvR7ghol4EBuyD1hAp5GRsUhvGiqRCe4ohXod0I
         9reQG0YBPcVrKLJgrJ6Iy7tBuZa/F5yiA3kmyJVIJ9uBkiCGOt31EEVLTl56GPcXgNi4
         +NehwWiu+Jjg3xCwGuzwos9Yqmn28ED7gj/HFoKou2A/4g7UXn6is3uAQ/0V5MqwuqlQ
         RCCdyKtS5viPvZvRbxNbLn+bwZSrsA6UVbiIOH22anG15Fg3SdVOmdUHeusRLVXgeLD+
         dK7MXPlfB3a1BWzVg83/ckcg0Vtxc9bgKzCBN23bNTid10Rwr7d3TuwiAr0S4SznCtZ4
         wh+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+p6H3OnXEETSx/lwqQW21V3d66yrNxhkMwU5U2HhmlCMQxOIGdzaScIMv49uTcMjAbTqz2Ea1CN/hx@vger.kernel.org
X-Gm-Message-State: AOJu0YwfM4b75ENrpUPbvaZk7Oq3kxhBE3s5SDlQ/luM+Gq4f+ncjfd3
	xT/JNmuI7MdZdAbgcvPVGEjSVi1T+6gYMTu1seD+j706Z+GFZ3dcAJAbYoL2uKEIgqqvNjlvuGa
	BgiMkM9ao9Fp0aNdhHPcnNP+Vb7RQv+nUDxV9qWYqKIt/zvddGhmU4AVIMRXY0Smd1wzxWK/O
X-Gm-Gg: AeBDieuW0xVm/Yp4ZLAv0HVgu45ncwrKnk3eS3+b8IiRE8f1zqv57kIq8gjKOJd9vBl
	kCIU+MRmjN0ENm7P1lB8hjERnzaldi6C6LtPPaexLfAerwdhkCXTLd074RZNKg68XAtnzV1KDIi
	TNTxwBMtqiB33n6dKOfa88eWQVjBI5eIxzIt9NgqSHtEwcdt8fnKoA2V6c0hgClmCECsuTkMNta
	mvcxS7EEXAxGrObqTPzFRvJ+B3rFyS90ctvbrSmuvWC7kEcUa+IeBYx0mrZMrId3l9KSfZvj0jI
	+HwV20TMGeFz4OgMGJ2VX/b9jSirAJ3I5CXQ7ELosYYGn/2yVWVeJP1rXG3TwDnfk9p9QPZ10yV
	UrQ90vHwlqgEFL2RFOb2UpqIRTfy2bBkH6cQKGsVC36sHpC58CyGLXJ8xSIUDhcO4TAHCkHodNw
	VHrOpJPhST6fgoLA==
X-Received: by 2002:ac5:c9ba:0:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-573c9698ee3mr610463e0c.3.1777561964657;
        Thu, 30 Apr 2026 08:12:44 -0700 (PDT)
X-Received: by 2002:ac5:c9ba:0:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-573c9698ee3mr610434e0c.3.1777561964239;
        Thu, 30 Apr 2026 08:12:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d919sm8497666b.23.2026.04.30.08.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:12:43 -0700 (PDT)
Message-ID: <efd349b8-eb01-43ab-ab0a-99e6d9ec0885@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:12:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom: move gpio-hog schema to
 tlmm-common
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f3716d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vT5BNdOIVckz33J0OJoA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: coT0p4VHYbHJ1iEIqdcZl0P4EySTSJnL
X-Proofpoint-GUID: coT0p4VHYbHJ1iEIqdcZl0P4EySTSJnL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE1NyBTYWx0ZWRfX/Nut7YSf4BE1
 GQIMi/oCX3prdjE6AAILbDB8Mwyu1prDHUfHGNzWyzYRXC2Ii2kiPIHs4MzxthyTg+clFpDVWb+
 w6wfji/OlJzFbvpP6IB9RFdioP5QFB7ahvlYCioNQLNW7qwvI4+0x6182e6LxdMEhdTZk7YpVt2
 aAbKBHKaW4C0irI+8Y8oEGGVZBlOBWRenhDCYebCc7XGRFvixfmMGBfLvJ5XGenBOxbLMhTe+YJ
 g7uqtXkoTyhPvGIQI4+OehFeQDhLtR3n52TJLwS4F5AnUHMJgXNSNh1BPDNlrLgcLk/U+QHqzY1
 rjV4/05QmOKZ0SeqMva7duWb+FQqONZUijOnVvjtngT/bNwPS/sMc+7/MMQVWX2XLCK6f2Al9k2
 IebD87Sqw+3JdvUjSPVrGarIuZLQ0Lu3otnDA1N11j+O4TJ5eUCQ1g+2de091kQOQWtQ1mma1J/
 OP1qhy3kNde1UH6BNzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300157

On 4/30/26 4:01 PM, Swati Agarwal wrote:
> Qualcomm TLMM-based pin controllers share the same gpio-hog binding
> semantics across multiple SoCs. The gpio-hog pattern currently defined in
> qcom,sdm845-pinctrl.yaml is not specific to SDM845 and applies to all TLMM
> controllers.
> 
> Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml so
> that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
> duplication.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
> Changes in v2:
> Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml
> 
> Link to v1:
> https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com/
> ---
>  .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml    | 5 -----
>  .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml       | 6 ++++++

Please also remove it from qcom,ipq4019-pinctrl, which also includes
tlmm-common

Konrad
