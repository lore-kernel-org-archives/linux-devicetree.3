Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F304A0C
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243565; cv=none; b=afilAIFptjgqE9qIb1YN81J6/i/iZyWLoVwkylJq1eiLi/SPEpUWY2eT1Tc0TZ/LBKKdnifA4R4Gnnt0WEFrqCrHoDtADKUmBIdGKGlqXT2uqTIdA8FYFANeLfQTlCGdzFc9b27n3YwtkMHFUS+HON8Z4UvQxaPpP8XN0q+4vG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243565; c=relaxed/simple;
	bh=kGld0xNfDz0zDVpiCsicu7zkr9o5D0sKwZEZ6dZiTPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmTFLdWJ4vqSI1O3QJS08vhhoQsL4dirBkMFgkG7zsBrhF6xLMvJ322T+VlHuaPKRuy0hwB3+9ZffcOULn+1KOpbsFXaSEr6pPAk5jJz6AtD1Tc1uKYY1pTttXb/T+hM7ih4ukGIf9WMxSxWaIRhNqUKWGZuHGIxVHFFiIwfJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBmhZGsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOwAqo5B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBmhZGsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOwAqo5B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4HLmf2071412
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fuHeB8k/Mjlbeb4t9l+3i5xFCcgNDDnedViyIzx50s=; b=aBmhZGsWbc+vBlCV
	VqEMSS8q4afL81ytUaQ/8FRL0x+OzOswgXXtU4OlLZ2E1tdOOJrAQC5FCwHOMheT
	U+ehyjKbnUtuMR59E8Jy83H12TifqkNsu5ysmC0mDja8m4tmZBqp+x2Z4Y/BBG4l
	Jaiwi3vmftUu3v2/DVfpJ1dVw3KmHgMh3afGFDlw6T8MKsOjI6mdcYX2vCnoYokK
	mD8eEN/fmhNzUwQM/QC+nsPzwLJHzQHpndfmvT9evRLyb4JrqJlGZsBCWAj5rFv9
	1UDlIYZOqp9870R+uHIZzqP+m/yU0acamM680lDbUDg89/d82Zpsnb7S8cWhgPvW
	g8iV8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtc2ah7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:59:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso58114561cf.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 01:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776243562; x=1776848362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4fuHeB8k/Mjlbeb4t9l+3i5xFCcgNDDnedViyIzx50s=;
        b=JOwAqo5Bsr5g5/K0iiV5pmezNSkG/vEnLrJWLiHYj8zZzIh8IVq+bYM2x4m8EV4OOP
         V6FAfvIFeVdthF1OMga4SzUijTDER8pRqhE+0aS0n1wEp7e6ks2N2Qsw0UIc/o2BBTAO
         JbS3BgT+Vys5RQkFWv6MSe3KEwqlm2ses1Dg+vZIIkChUhBmPwcbcJjKTsBCmbVoRP3L
         mpYWlrkHS3VfMO/vEJdOQVjOgNCGUmnuGGHi/abQfCF+wSk0VDMQDxWwIJCMywiErL6k
         NAIWIsIkhq8qK749P3LNuoxnJnF3XwhGW7giIo04gXu2JhzQFxO+FpU+uyVYcGLjnZCX
         Cvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243562; x=1776848362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fuHeB8k/Mjlbeb4t9l+3i5xFCcgNDDnedViyIzx50s=;
        b=cvrNDbKW5x80BPTNzSzgabrmmOyzxupHbWonTR3QSNFUNH5tHIBI2YLU3eGzAqBicZ
         ef9VMSPK7OCKAbwQzjMoWAO423U1FvfjksFxz24nKrvyT6xiA4bt6/EKQXmoYh8Yui+y
         rqMZO3rYFiP5p74rCZy37rolSbB8Y+f+VPLYOd7NI3RR36xa9BNLPC33PcDzbgiYXO3I
         915one8cjOdq1MpldwbDFR0wTHMp9/XkqaDgx1TX6jgBrkLB1e77h1b5ESnLrpqBG4CR
         OnUoDsuR4l2WdW7nlmM6306OPBRu8EfIQtNMhN3k1cVQ2KUKBTu01oFrmsD+GWJgtPcH
         XqpA==
X-Forwarded-Encrypted: i=1; AFNElJ9Vs1GMVAY9dwXfX90GoOKlAJgijCqTTR/xHtpj369Ib7Q5iuGSDp5ICOe/tkuNNpOtCY9H7NAkQNwD@vger.kernel.org
X-Gm-Message-State: AOJu0YwEaHx6nchyE9K4By7s/fQQKs23DBPgYfggMLZKv8kgoELl2j3s
	vWz9y0FBdiqBQ0ZVbjpPbMglwR5jlckWGCD/hBmla4Ft8wlmLGP99Y/icZ23KA5DiUCt1PVhtAl
	lqwEjyEMwLzR41tMlGl/XQhajQl+pOaQKsJxaJnxqbIdcg9cc64gdCda0XF1GCp3k
X-Gm-Gg: AeBDiesV6CD9wP+efy5bc3x1wqWBerc7Sr6jUIPTeV3A4LPpXy6by5NNp9wC5isd4JL
	dtJS1gZDafrqVIVFalrn24BvpxM7whwWUv6jUfL0WS0bgcMZ6boB05e58eVBTAyiGppTNlregRv
	X22QzUJQBdmdTdx4AP0SOXPzsFYlO4UrO0BSJmjxtzcLNikWWcXHQq2CVPa/eADLgdjT9WQ6O9Z
	sPXlVTKpX0qbNjiilS6qP2PeFAilSefBH4jTyzRzrsI8EhHQNtvF2YCNXoChk+LbjZp73GqBpjP
	2R2viEReByvSop3UwvsB9Y/3/RsCMhW9SMZrTLVeP5gqaMaTpBeo+Q31wLr8hy61fmjZMn+EUaB
	eKDfxDIeE5G0LsB527dXtfahPGcz0Nw9opQUf7qnqBMqOOv8UFgZdh0RBMP5+FWOnmM1UihdGP4
	0er1LmsIW5Xm+R9w==
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr14268221cf.4.1776243562117;
        Wed, 15 Apr 2026 01:59:22 -0700 (PDT)
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr14267921cf.4.1776243561646;
        Wed, 15 Apr 2026 01:59:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d789a9sm236176a12.3.2026.04.15.01.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 01:59:20 -0700 (PDT)
Message-ID: <780812d1-f6ad-494f-a323-4b7027a715ab@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:59:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop RPMh CXO clocks from QMP
 PHYs
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AFo1nLHTRJ6f7PvKcwONpVr53ivfPmqN
X-Proofpoint-GUID: AFo1nLHTRJ6f7PvKcwONpVr53ivfPmqN
X-Authority-Analysis: v=2.4 cv=HpNG3UTS c=1 sm=1 tr=0 ts=69df536b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GxPRKtRK2lFiV6y-FhkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MSBTYWx0ZWRfX98m11LWlWFFX
 VUnYN0mWfCnWZepwtjfDT0U2hN6po2qKvbVrDDfp2KQCRVFJEr2/8ZpdVxQAuuT87FDoCTkSxix
 Pinip42krvde22+KwwtLwPGsnAJvdoycFnDXzhlqeX7JVFQRXo/jjOuyAM172N/uPJPbzij/Vbf
 wHCax7NuGhRQqusmj8IsXlC/y0zZbo8tSqvpIiLCujkZ2+lSfKsqi9TBLXZYSs8KpLahT3P4Mz3
 It64O0+tKudSjwoGuk8pUKpoxpnkduKlzxnaeDndipbAM8QeMGV0P1hftQQotdtVlTyJ9ABDWoD
 ceGH8xZ4ooLJhHDGnqFgc7xBu9JbWuTBifqhNvAQ/kpoWCNjgN5D4oHak1ggG6JeZKdUrtTjD45
 BTsRsF8L82mcjUKQ/MeogmkFwCXqN8TAQykr0eeZEEa2YOGIjfDPZvU0Qg3vcKNYoQQ93Tjt6so
 USyiz/6WMDDXEhKpOEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150081

On 4/14/26 7:05 PM, Abel Vesa wrote:
> On Glymur, all QMP PHYs except the one used by USB SS0 take their
> reference clock from the TCSR clock controller. Since these TCSR clocks
> already derive from RPMH_CXO_CLK as their sole parent, there is no need
> to provide an extra `clkref` clock to the PHY nodes.
> 
> Drop the extra RPMh CXO clock inputs and use the TCSR clocks as the PHY
> reference clocks instead.
> 
> This also fixes the devicetree schema validation, as the bindings do not
> allow a separate `clkref` clock.
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/r/20260410145205.GA554754-robh@kernel.org/
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
