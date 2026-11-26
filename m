Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704731;
	b=r0BegguZZWhP38eVX/54KGBIeZaBK5MQ+/MQdTqcxwxG15UOME8fpY//RzylWIBauSnH
	 1XoulrPvPI9B3PicIuTMBcvGfr3MOd1/erk2Y3DvH8VPcZMhytTUvMGw4bB8Y6R7ZDZR1
	 yTwxnEvpeMNm2H/GBhpWkSYncYs1+xHvi1uvLWs/EMRASTjyc4FyEksFv4bJL3UiSn0mu
	 2mjdtdJrmBIzEX/kUlrD3VSAXy5CpWM183g+2GcB9M/2uU9WV5jqkkQm7PnVBic1eSnM4
	 cJPtTr/dAsdqAjAAiLSxobuDNX9mxrUIMq0fjwq86MjIyFmdWUaKo/g9gdDjmJIAtoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704731;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H72KJoBHayhYZ4/SDSW7IDXdiM87q9Lxr+UY60gNodg=;
	b=xoQMDl3+3Vp93RzG46Z5DQxpNRHrqm0wbmjfPa9hldNKKIowGPAsxbA0UMBA5dts2m/X
	 wz7/9GS3upHsG6GPB2EIj1tnEtF9GNdClcSmfHy1QdqawFRJWqEevPOiDu4KupZo9Xa/j
	 Ngl2KI/ROwUr4OI7QrcuSUBxo6bnZnEYUv5o9PO5x6k+qs9E+v31mJDAZMu+hJRIpSgIs
	 nygf24suu4VGtPoYhOADD7CwdUKGZuj3j4APH9svPyLBVd2NAfm/vI+b0UV+xaSYdJpAL
	 UzAQFeh49UqpS+2hKO6Sht/wNsHE7CIhW4i7kuwJL7BsbzCae9XeyQeIehwJAQBg4kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DcH5s7q6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eN9XL/pJ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE9C606A32A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE9C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DcH5s7q6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eN9XL/pJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUxcf3563219
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H72KJoBHayhYZ4/SDSW7IDXdiM87q9Lxr+UY60gNodg=; b=DcH5s7q6VzmfovC7
	X8ERTzZzLQgE6u9cK21TkKmvdxx5K+XVSLYJKfmdBmOtOA45vbkf7+RG2WSiu8TA
	0hL4hjusjemQXIxZYXYFUlUFW5SNyxNHBnMDqeAnMeLHIpJ3a5+wrDSpzjp52WVS
	L1eDXaZZiJYQv1wYMupMgoeMyCSCpCl2j1pwNdczpm21ymlwZaQV8S0Af81gdHlY
	J128FRSE3Bjm11YnLUj+rV6oXoih974R1ozvBsaeyVBVlcX0ny1Q43yopRaDqtU2
	DxhjY42h0PurEyjxMEyu7X/q2uO4J6a8AS2VE5WDmKXT6ku2zly1nZrqKGTiB/gh
	cTQl2w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbk90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:52:10 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so361040e0c.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704729; x=1796309529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H72KJoBHayhYZ4/SDSW7IDXdiM87q9Lxr+UY60gNodg=;
        b=eN9XL/pJkEZg7QnwWQY0qHpGE9Sexmhunv+Il8LAmLZsUY3fK+deje1346FeKCDIp8
         MY5xEjvKyU0i30VuRsqDjyHaOW9ns2VNFGbcYlvyA/2hEBgdskdnErEpeHbrcnTP0Vnq
         81dolm1WnbsDvvokGcZWGDaVB+jAQxURNy7wJ/JVCSYzyVL8CtbJHCeY/Hk2m3CfkOkx
         V6VtdnzBv9qAUH4Kok01hLIYn2GIWVkynTX0eoZRVSKVg87MXW8zI4qp7SATWXswCy31
         D8Y5dctYiZx87iE5Se/oqySVFwwFZ3EEWrvu6jmh1RrOg3aSP56AbzcS5A1OBSML/laV
         RteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704729; x=1796309529;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H72KJoBHayhYZ4/SDSW7IDXdiM87q9Lxr+UY60gNodg=;
        b=FUzuI0Ne2LpL2iPXgeIxGFoXO4fHo8ZZCHlHyfa94BVj7r9X8R7K3PjewRVGG0zFE7
         ENdl/Jryek8AoxHq0tEg8eyK3xITHnb6tMeFYuMa+QMlhD60T0SVt5KBQLAbui8Syc+g
         /Ncvuqq/2LG/oQCHS1UKfnNntIJmb7uXXoU0Eq2nPEjpFxG5cyvLVZiRdSd1Hkn+hakF
         JHj0DeRAhIITSZy+aJZH9W5P5kUkgJI0FRjWZ7pb+E5G/MhgC1NnvdKq3V8S5+NFFCN0
         iOGR+BHt9lHWiXl4lr1U7gmlErdzmaswdcfSpOm4tbyFluWemOPEd9+JkJNDApiyRwIm
         +Kvg==
X-Forwarded-Encrypted: i=1; AL+hErGlMhzdrckReero2BPUrGoqgreBf+vu73NOT1htiJbwsvFpd0P+Yxw4A1gcuhD2KIKdjp0Sd0AMN16D@vger.kernel.org
X-Gm-Message-State: APuU4Z+6liTKe2+IlgVGvuHlk6Y5ujrJQXhKwTlHGehvvjFZhsI7ApC/
	KY9IW8c4bn1SArfwig8sa9lkWpB+K8V6W/ayduNvC7gcy7c5E8y2y6tZTxMOecIksZgG2+cS8zW
	J71zffzvkvZ+xALTx2Fo2b+BqSf6xyXulWZrRKn37Peeui5ayU5URMHgJ18Lvle7J
X-Gm-Gg: AZFdTZd2JZL0pwV80i/PeguXFd2DJm0M6lNVOe+zBYq+P06qO8HLKWslw/M4VmLW/GX
	Su4cH//ltxTdIsJdaifVvLIT/E90rJlEb9zSeMo9ueoHSFJYYeJc1lnfdnhMaACblf1YZsbSvAz
	2vJg+OeYTQo4VfGrp2sHM4Q6S6+MT6iTkyeoDyEEl/qgJYSZF944uDIQWGYv3SqPSn+ULT23arL
	VfJbURkn3dPwk0pqvRxLc9b2GqsdK5NPUCW4ns76E7PKmkcEii0djk2D6BbqpKzZZaQXiyaPPoN
	a48kSQGlKQxpAAXSoGKlWiB2hjRnUT94gcZMREqgEVwtS6OlctwKyno+asYgpQlEYtcTyYsEpoF
	ICKkqXwmHZMtXcwG1sj7CtccMZhIwu6YDPYo0wk3wdJRqYaawClJgiZv3cklLGvnMJ3MHlhY=
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr13243937e0c.5.1795704729563;
        Thu, 26 Nov 2026 06:52:09 -0800 (PST)
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr13243903e0c.5.1795704729006;
        Thu, 26 Nov 2026 06:52:09 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b003eacsm750204666b.81.2026.11.26.06.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:52:08 -0800 (PST)
Message-ID: <c19ccf6c-f7b3-47a4-8288-27da1120585c@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:52:05 +0100
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
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add GPIO
 vibrator
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-2-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-2-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b08479a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Mq9dOPq6Hou_Oe_0EYsA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: iOhSOlzdxnd--tdqywq0xyiXpUVAeyuU
X-Proofpoint-ORIG-GUID: iOhSOlzdxnd--tdqywq0xyiXpUVAeyuU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX47HkkAiX8m7s
 nLgEtOB9GABjn59hP43C2XQm4yHefWI247oy0m4fSSTLr0aK/httPF5k5kZxDficOcPyMYxmcjk
 y1rkkF5fhUXWGfVLahRtyM5ya+1bbNVSd105mFOBDr94KkjDGIL+k/aHfND/tfle58ZGa7Gtbxk
 8pIs0O7+S1tvKeZT70Y3CxueRbNYwXT7B1f/UxjoI00XcvlTL8kGYYubnNmk4K91zeeRIRRHCId
 e/jk2hFvSgImUwyI/lWok8O47HrIX73E3qfoaWtd4EQ0NpKl07TUokp0BsO8S5zn4qiNh1BCEsY
 7w82HdHndFhbDpbyc3sNBtn8HbTaegBrLrx7lDTSXujAlv1FGvidbazL5bHeOH13ifV391BHunO
 a+T0VbVxtd460MubH1RS9JxfmG8ewvjwEipvjNwqJjtZAo9MuEGKUHv/wIOMgdS/npQbVB2Ba2B
 E4sHkHWNaM+xzsinpmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX7yUPUqsdqIOT
 l8kM506KKnpVw2PBQJKpXh9HqPWoVl6vl/zipQ970GGlEm/eo69YU5DWqKySqm+JJdqGsywgwzs
 oKRDcTWvbhu3rN7N5GUtn3KQ5HPfDnY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> The vibration motor is switched on and off by TLMM GPIO 18. Describe
> it as a gpio-vibrator.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
