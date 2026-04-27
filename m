Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9003D47A0
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299769; cv=none; b=eyfbKZkUkjJsPfI0PdzAzLo7Y9zxe4GcNC2PZy7tAXcLDMadoJAk4b1FaOm9g6yPWz7dzOsq/AWX9F6I45/FIWKIKURgEyPc88vD80cijaS3i2A3Uqmc/LS/zdL8BA4Ma/BTHAnQbuBCNXJJc77ysfJcFgCQMTE24zFrjGriN74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299769; c=relaxed/simple;
	bh=//5y8usvnlLYIU6Nfwsa3ikRzmN9fsBFZ2GRchFaaCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTn5KgBSUOlDTSVxgETsbjc4Tb2VyiZGeE3f44/H59QQhNveR/eo/xWacJeh+rNsyCvagTREXc0TMTmHXYMSvFtcRFu099jkuBkVOjIxzPedKr3RTdJnwmuz7Pr/NKB7VlZBNIMOTGDrwqnup8n5xc7JNr4tfWfD8DjEg54yca0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jh0mNiGJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZnSCGKm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jh0mNiGJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZnSCGKm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9Ogro3825281
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTFrH73lEwXqL7N/MOKb8e5ZwbO+LjToc1hBsxjavBc=; b=Jh0mNiGJnaEQYxKK
	omUPGyG5j1o8r/izROyiLXmknMGdYdLnYKcpkqfA3k3TmiLW5iQTVZGncB0Ou0J8
	Vx3yu4YEhG/ZuIGgdCaooPiLGcV8+S0QEQVkBcQytIYcibuTiZ4Me2evpAT2U8yw
	fNbCfLj41pdpXXR1wXaaUNbiFRnez2VMzwgZEvUMzGjRkc1wdUVGIcsI8w6Mvofa
	sJ69vuFcXPtLLceNPR5p+tzVPVg79t5Q8hRJfHzjWM4d+sq18Vk4fjHFhk0TIBe2
	Etb2k4lt+cnTxZS7HmnQnZb5iZ2ur1FIyijdiUlv+x8AuyQMkQxmmWXUZ20QtrL8
	1pNVGw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5551453-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:22:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6055c46b2c8so642039137.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777299764; x=1777904564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTFrH73lEwXqL7N/MOKb8e5ZwbO+LjToc1hBsxjavBc=;
        b=MZnSCGKm60ubRgUHscjOi0lUffsmH38o11RlQwBLtcuvPVOo1VtLhe6ulLvf9zFxak
         NialSHyF3xur4V6N0As/ANT9fxLSlti2ZIrXwny29D6gIMMYkECGjFGmpWaYXXUedCHl
         zFF4V6rOFlv2n001EABBW+aoYhcKVhx6IAEXkXSxc/dx4ZIst8E9dYhwojA5j+1iHTbW
         FWiz5ZTrMJvRnXmbA2lkYVSxke3f9CU58m/F4wM2hRJiV7qyKnYVt0SOSQLiIG5LMbi7
         s/+EilXYhGISIX50U0EkSYTDk3qmeye9yPp+Pq2K2136jpyfkTxdiTP3DmsmW9INKx3+
         buQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777299764; x=1777904564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTFrH73lEwXqL7N/MOKb8e5ZwbO+LjToc1hBsxjavBc=;
        b=WrZD9DgkHgwvjPoYFum4bK6NEiq011DCSlztnCEtOxqqPFFpssxAfTfVC2+HwsIjxl
         34OBMFRvFER4iezLkj7KLceilh3QQruVVA+5iL2TSKYk5GO/3V6eqgdIkWYM/yu/u6c0
         usp/jtY2mylziQdacvjdm1ofaWqeZAQHE8F0oK6l36HRP1teHtbFO3vNSNXat4AKXCem
         a0MlL+202pMi9y6Z1aKHHCvNL74G+I/fU5NI7KUaVLcMkgbNTxfzAGa9qmWlI3watJ6W
         bb3BZZGNyGkT76NyGXoeEgSslbddCjmUoSfMbA+Nd+u2TycOlaBov25OooqNfuCi1RaH
         RL0A==
X-Forwarded-Encrypted: i=1; AFNElJ+JgCfKTGccy78gySQU4P667UTecBTRlO5pHP74omMy61kMKE8meytOeOAGZQ+/vQpfkWvHnrMCNpxd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ubqiStPDCftAJ0kcTeZlUfs+CDIzl/Pxs070kc3nYLW+CI/L
	z0/HFRBwxEUhQGekweXnNuAICS8DviLWcJvrM9hJlZI28FxSyAhYBrC6wo0jooFl9WNinmeEWb3
	ZCk3OxOkT2T0U5JlqTFAsg+idY9l8hV4uRnHAa/84rRFrj9udgglh8uoeeEMuBkdo
X-Gm-Gg: AeBDievxJBZlpTzteuQ8rETL24H46TGe8GP4P1dh3sogotfVZFHyTIj0cPjj5AkTHUH
	VgRqEJHBkbD0CPrYbf7l9MxmJC6QUBYpPvVI3x2RSUVP791gdyIPvQBASIz6nos9siGajZrLzK6
	euulZWyKbtwDhwfQ3npeAu9m+Uk91VdkGMHXBoBYJadg4W1DUJjPnPSmSCFQQYvc5ZKt3GmYdZU
	vOtetXjRCau96W5VgDyPi7XMdaHdv/1N3ff7OFTuXaKQJVjPjHDw+dK07awZa84aGabJ9CEnzbT
	8MPCeUz866bf1MOP2wH2Ohoo2RN5wPHan+KpuYxCXaW63FL3Y8K189ltDXrTBVuuW/IYNiiBmNA
	cKAGZ1i5hNkkF9oxQjE6KKpRa0fkYhhYJH3iXhH9aaz18Xmv9ghJPzpRT4G2vsUZAc/TkRK2ciG
	tSJUzkoi+xw1MOsQ==
X-Received: by 2002:a05:6102:5c2:b0:612:13af:f5de with SMTP id ada2fe7eead31-616f6ef8614mr6671741137.3.1777299764460;
        Mon, 27 Apr 2026 07:22:44 -0700 (PDT)
X-Received: by 2002:a05:6102:5c2:b0:612:13af:f5de with SMTP id ada2fe7eead31-616f6ef8614mr6671724137.3.1777299764061;
        Mon, 27 Apr 2026 07:22:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553223bsm1134937766b.55.2026.04.27.07.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:22:42 -0700 (PDT)
Message-ID: <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:22:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EA3870Z_4oqnq4B_lV6LN0gFHwkoM8D1
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef7135 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HtS05e-23YgY9VhomDQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1MyBTYWx0ZWRfX88Zr6wTC5rY3
 0SK1ypdPfdwb2bIu+9IqaI1TK9DsW4JY078qDcfgYyYjj5ZpMWS6vxIXeoQ2sNfsr+I4E06F/p0
 UNiX2+z0nV6Sxvd63Y5Sf12CtRROhyrr6ChdN87InBAD3BxrhZg9JtWVRzRUDHylBWyycBflomq
 07EgGK+FMkkcqPkihCUOBqd/PBIQTSLmYYQooMaAFk+LQDQvYTWofILQiSyzETRxC2NM5Nchbq5
 3WCpOqAxjo34f2so1qLVHtl0bYkeJ9u01qVUh6VILO0DE0bupwmKsKXZxwjiB98s8GyrESHJRDk
 kh4wNgk1JxQLO4zE+8lWYQmJaFD66pgNg33yq1/Fd7CUpP8s27PP/6bVkG/AcpgclXUaC0xLnLD
 wChYFJyDXJTcZm8kyve+L/M237QgHB2ueEL1eNqiJU2F3DFlNW0aqoSkT61XahJi1Hf4SVRg+dr
 NML6l+JpQwKdppL58mA==
X-Proofpoint-ORIG-GUID: EA3870Z_4oqnq4B_lV6LN0gFHwkoM8D1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270153

On 4/27/26 2:43 PM, Loic Poulain wrote:
> Add Devicetree binding documentation for the Qualcomm Camera Subsystem
> Offline Processing Engine (OPE) found on platforms such as Agatti.
> The OPE is a memory-to-memory image processing block which operates
> on frames read from and written back to system memory.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +        clocks = <&gcc GCC_CAMSS_OPE_CLK>,
> +                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;

Should the two AXI clocks be aggregated by camss-top instead?

Otherwise we run the risk of the OPE driver setting a rate of A
and another sub-device setting a rate of B

Konrad
