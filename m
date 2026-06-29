Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3463F1AD3
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721809; cv=none; b=Nkk7+YtuwYocnULKhgTjAsCKqme9213UxlEKDIenMgrPOhbkG3hm2Lcq74Sa4gMRaLhneFGBZCwwc27/4iGNuZa7Z5LzbGU1ng5kzmhu/vwHL2C1FHTrsxuot29t2l7HhJb4GF1ADkAaNz5FG8PD8xSiBaihy1Fp5wcqpi5ILII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721809; c=relaxed/simple;
	bh=D2MekIVdjxuVjVCs+BZYpnHPIsXNxfXk4QVxou+Zt9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G26xek24XlBViMEfPia9noBacow8yUStd3jc1+PexOD+qf02aQ56YdZZw18wG1PMYO1Q7r27O4WO0coStlhSZTG222R5gB6CVtwh8knRM1ON/Bn7ZC82bnzmn5ZegrLN/llu6KdS4mmqI7bnyUL9mUYPyfDXP8PpCvZPDIgQIsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1G0dVSP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7WdfBLA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1G0dVSP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7WdfBLA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rOmg2097370
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DgjW8ZL4lRrhVK+OqRbfP3tne1ypBU/sYPdCUfm2n38=; b=E1G0dVSPnSGNVJoz
	7zvsooXKU2XSxZxLDuELJtJhHfb33QR2QmEX0IAyaY3Xu+8bQZ7ynPuoRhxyt4cL
	D6Uu7ihHnM41Ea/eBstSQcp9a+KJg0AA7idZB++tkUanQPgy+D0KXMAd+SfC0O6A
	dksmw0gjonaduJzEGBDQBr6aQUnGecF9sBfkRbCPXkIJFmhkEDBmStTusokS2fIF
	0FoDUYf1afLK2rETiyvwXgoWkNeXovaNUg8RvnJpemjAlELFqO8DOadkodqfFrDV
	u3EAFFNz9ucMd9j/XhgyRXaCpBYPLynZSLKo1zJIovA2j4GZ/PQ78iLiKlecX5Yq
	2wiaQg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7wbut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:30:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7392d893428so17039137.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782721805; x=1783326605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgjW8ZL4lRrhVK+OqRbfP3tne1ypBU/sYPdCUfm2n38=;
        b=j7WdfBLAymEV49XTLVDjFJe8CB1GEg2zBgTPSC02F0GTABbYbZt2VasFLKS+wT+nd4
         T/jYpmUma1gyo3XOinpZhlXlsiSXA8pH0ZxXJD5ah0pQuW20o302n1byIVMZ/j0d/HpK
         tNOgkAJUOvvNF4vXd6XPDaxNhcBTGs7L0x8HMwMDiLDtdZQTquKIMc+M9wub0WLasm5B
         Y2g83jBxRFWNuYfIYu2eBfasghsf5vQjAK3xJM98OG92FflddMYI3gj9jw1HB3j3J4pT
         JNf0JaxXi7qSSE0vJ31RelI4O0jlfRnZvty+aAsUW6HoNGdRT/Tyr8wp5IvuJG0LLOoT
         MKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721805; x=1783326605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgjW8ZL4lRrhVK+OqRbfP3tne1ypBU/sYPdCUfm2n38=;
        b=DbASyd7Pgdm0Y/NcBDyf+IPwmfsAAEqHoME/dx37NDl8VCAGX+NBzw4LaAYxl5iPqE
         4gY8trm/6qyby8vtzdd3IJT/V8R1qQSNdgNfxPtTKPSkdaO5pBOziX2kqP/C7VfCg89+
         bfWIDwW4F085SyuhlVLcmYqk2YUcnrREdahCChxuz4acCfoW6refRLIInhyNKqz+Jynx
         JwaxsVUOuJIHKMRt5CmSddbleYSSgFNP5JZoqvNBE4xIu94c17nlnqlvLxwJKbWrxfI4
         u9yazvUzn32KLg+PcKo1Tw9QR+YLjLXezhg0JckE6zYLuQ2AwRq9P25mK9AhdTUlIgap
         TadQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcDqCtJiYYRXAUdbMqpXaoOZNztQ+xGSNuakH+HjYpZ8FQbnsvnoOc8jAOsMwHSzwwoBm8AJFZ9b+k@vger.kernel.org
X-Gm-Message-State: AOJu0YyctwSVOvQ1SYQiILAEjdTpDZ8szhd74V7SzoqP1ghyw7ZIi7gZ
	4Di3tCqSXHU4Ueg1BG9A+BGqX9oUtF6t/eaoKxApyY+WjP/iy+S738NOys/yuBQmAV+8+Fwa65R
	oopqbvvvIbklWyIE/Zv3PB4yL5z5J76AGi5IfHYGJHBNWCKqAyQDAZh9YuZTmWwz2
X-Gm-Gg: AfdE7ckNT/RZjWy6HUM03AEcKIFlfk41VCUhRIOybIff1kSw0EYWVj6BasfrW1dwIzV
	DcFjMf3KDMAfmgEdY6M1xowwmIjbRzn1D1IefPOZ06jlgXGPpVDzHhgAd4dg3CK2mojF1lH3Us6
	r7yFBKNmZCvy2Co3XQ/MbRJRCkdUmqps0rJDRuQfIQzLrmeV1+X8Sz3cXr8VW024uTk4Buhbdy6
	bI6IFZa5tqSngMcePSAgYWacDNlIrZnlCbj5ZJtRSFvPTNC9xELf8Wb3V4GBqm0lp9DidQd8TGj
	ooD1YV5ciarobpPFE/lEi1UgCqxFDuZZGqln4a/y3/wXAxiiQaKBEDDaB7LYafbQ69itLCHzmOL
	bTudej/7oisvQVKq3jz119bjy8sUr06ZnHqY=
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr2285288137.1.1782721804984;
        Mon, 29 Jun 2026 01:30:04 -0700 (PDT)
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr2285276137.1.1782721804606;
        Mon, 29 Jun 2026 01:30:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3aece6dsm6526300a12.12.2026.06.29.01.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:30:03 -0700 (PDT)
Message-ID: <b7365b1f-6592-49c4-8230-ecd2811b4716@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:30:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
 <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NyBTYWx0ZWRfXxJQUk9COky2a
 qfj8P5XqBZkNli+ZXTp/YfVgd00zSqERbeJVIU/y4QQCL7IiTVNCPGbFgpkjN65E1lLf0svaUFs
 YPVSzivgDLGOlPmDT0ITFRcZH2OiB8PwFmggQfje9xhxVCYaJMqB1zwm5VCo+cN1h70iB0TmPFY
 OmohRIS0YwqLC6hQdITgG6hy/yrzzAGx7MstC5UV2ypYzdY/s00FokkozxEvEhYsIm03s8oy1IE
 FTEiceasRaJHXBRS7Jj0ohHxnCAPcIIJEwPCcemX2M7nx4oDEnfAholcIDFJ0oDOiEQfcMsoWYR
 fzf3XccNV0zmrgfqpIgvxmaT+UiN6XTL+ogYHlNMHCD0gEemk2h5tL9HwD8Ery47CsB5wfEZXzX
 R3LI6cBdlHbCZgxN7gSl2s6uKbNvygj/5pZXItQYKHsuny6vBWYocLbOaw2h9+n5f+fRKq725Bm
 m5A2Wf+ZDd0AZodS8uQ==
X-Proofpoint-GUID: UOfvixq6pGOtcik5Ra8kinYDUsw-ccsm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NyBTYWx0ZWRfX/PIyEq/fpWh+
 KwA+vRoA7tfYxzafafhiLHCqphqQtVZLxvByqYEYqos6us5iks/B0zvxwAF/V4j2Nz6cNa/WNy6
 yfgcUbKiPpvdVELFdA/qbbRZXaDefEY=
X-Proofpoint-ORIG-GUID: UOfvixq6pGOtcik5Ra8kinYDUsw-ccsm
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a422d0d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2WSQ0cfqpqpHfD7yDKYA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290067

On 6/29/26 6:38 AM, Varadarajan Narayanan wrote:
> The Application Processor Subsystem on the IPQ5210 platform sources
> its clock from the Huayra PLL. Add the configuration data necessary
> to set it up.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
