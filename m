Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4174B39B4BF
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332519; cv=none; b=llXYGfnEsp2Qfb8BcLbXdlIKwyo/jlxXW9VDbDSSSxCEQ1mHnfMoDuyXH0DyZVKbuRuSawUegQS1mj6roCDl7HA+aDaDLxLC0d04Wbnn7oOk98hIeT1YfFAqdOje4orroZrJ0chOe0Teo8ilBwFjazDHHjx8haf2d+PuJZ5BLp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332519; c=relaxed/simple;
	bh=MiO9X46xV19b65gJgZXFSIe7YyLKgKI6TakCQ5ivCjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RVG3sqL16I9HNN1W2DaFzTb95b2dodJj3W+Fg0z76DUecLQ+cM/QfaRAq4ZwfyyxxtyK/18jBQt31Mby+ajkiFHnEcu/OuuV18U/cS7LbWrWKzF69vYvghr1g7IwvlxFxb5x6O4AtP7qCu5F/VG5BfE/EB706PVaEDoLyXafMd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afsuRXXc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUd59s7d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afsuRXXc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUd59s7d"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8CTxJ2576006
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 09:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xw+jx/GXqObZ8dGpASTFupBMCTg/8Zpcfvl8ZKwNU4s=; b=afsuRXXcuHaTeIxi
	3WdY3RFg0Ccb2FIa9cctq1kZkBRiyXuAXPeQ+Bpa2baQGFHmfW6Ywi4AxgrjTWv9
	S8l0KWdehkcHfJ92F8pQwhhoga40a2AYvHgY7EAVeeQC1kk22RLuOA5jaC7dOxV1
	U75uD4sMDTD2XBRrbwOxUpABwATvOzTm71AhBP4fccRujYEP2jzWLygFvwPgvsO2
	kuNQQtke1xu6Xv2ky8PaS1SonHpCvI/5PlvSQ+lkvqM7JHo/zwTr9XDoXkfwzWgy
	adx1M1rRxjBMrk9XOWQ1W/7yQ6Xh7t8ZvheJ3kXM97pbEsuOJCWZiDEy0zBCz39W
	Q2GTrA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djv27gd3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 09:41:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca5b32b89so16336256d6.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776332516; x=1776937316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xw+jx/GXqObZ8dGpASTFupBMCTg/8Zpcfvl8ZKwNU4s=;
        b=kUd59s7dLd9QkTfWxi13g2R4njmI1Jg1qcsZ7dNryw5aJ+/SzzKD3OQ2c96LCzVHCj
         Z+uoMBoKS0TsguTMzYIW6fVyCzftqwKMYSZBEkXqRqzq2XiKte67+Czv4BlAfnYGNRuB
         nspB89V+YcoENmZa/JmVhwKeP/S4n8XkZS8tQvAVsspI1HN3ZDaCSRSDtFDe24bDjoMx
         puOBLftzosbIPW/7HiJccoA3wXJ87gGLotv1KmUbY/iZx1VYVcmF3eAQ1q6lXNfej3C1
         h7gAy35BEatfdeXEbyUH9Zy21/vkmF+O+dgsQZw9SM8+Uvk4yBBrpPsOQt7NmnIpL6K7
         dDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776332516; x=1776937316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw+jx/GXqObZ8dGpASTFupBMCTg/8Zpcfvl8ZKwNU4s=;
        b=a8I5Ji9QUGQ3LEz37W7u1h/ASf0G3yh9MrK24J5vRM9odJasqxSYXKwPXP8uPjqTxA
         CmXBfGaMkFYPSgtmoXVfc0V/QUmAKy7Hm5uk8YQBWSitEBdd5c9/rlzgnlisJ8/+ZpS6
         nQo+h6Nd8W8LKaYHOfh9+sFfF11DG5DpleLTIztZBh8dTPUAWs2EQMaINHiOXF12SFA3
         fmkPJE7ENMzjGYaxqdWZ2LrgHNIjYsSSxuWleL5m/+rFY51GAAQ7vFtTGoiDeO4LsuOp
         K3v4XmY4095zGYBvjdiJMNl81090wcrdz8R0wHNLrHh/YqcAyEhYeHHpBZYKaZUJGu7b
         +Www==
X-Forwarded-Encrypted: i=1; AFNElJ/KULBr4iptNFwlfykiChvOUDU9onfQ3WKwzZptfrB43nsJAF+sgPqrYDRKiexgdw35BSPwBDmT3WfS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4KSe4TVCjWF2L1ESu9GZ5uOkouM1H6ytxQ+BPo/yIHH8W2nee
	RZ+NA8Jpg7ouLbCjypOcJQxqrtyLlg+8n34PEPF8WZIqv/w/WCXTNs0AcpVZTC5FMQPAp1kOj/k
	1j4uazyJi0yQVR5/SbiEu0vk+LXROEssdIHNE9Yr1ipXPX1+udRD/wtOKNYtvH2SY
X-Gm-Gg: AeBDiesAzX4Hfp2t7gowDUuyJlrv7hE83YWs6D5nStL1/H2S+vvMh/dOHlx6Muh4Hoy
	2YWhTZUsUUzaIRnpxfv5QE9ztyVa9dzD0ADKUqMLnpMOV6Yc1foQaPNEqUdJiow57wAHzUIws7/
	zw/LMmHs+zeTImDRGsvzSCsRKnJuRKsKADo8yyHv/87PSEyfP3P3ztkI97xqQb/PENleFU9QSH2
	AOl/3YvIJpz8HkoZLoL+WXVxREa9HcLwfEM/bdmSdSAh0YEolIDWm38Rt5UgQmA0rhOarwPXnv5
	FlfXvspZ5rRRJeJjcVwZwltBT7TFbb1/9Z3Idm9VMJdRE96Ykiy83qktLq85OXEXV31kUUd0bBc
	aDYwFBgTa9TKCtyp+QgaIY+oixRj7LPpVWO9evRAeAyMRgpAGgwGEce+Pf70E9ONy08BInq4Lgw
	J5RmOUhxGCv/uBWA==
X-Received: by 2002:a05:6214:29e8:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8af6b6463d8mr20001576d6.4.1776332516158;
        Thu, 16 Apr 2026 02:41:56 -0700 (PDT)
X-Received: by 2002:a05:6214:29e8:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8af6b6463d8mr20001346d6.4.1776332515676;
        Thu, 16 Apr 2026 02:41:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba24dfc5246sm91967866b.56.2026.04.16.02.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 02:41:54 -0700 (PDT)
Message-ID: <5a6fcff2-93b4-4dfc-8fe0-e1cc692399d2@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 11:41:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT] arm64: dts: qcom: sm8650: Fix IPA IMEM slice
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-fix-8650-ipa-modem-tables-v1-1-95f8f425e416@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-fix-8650-ipa-modem-tables-v1-1-95f8f425e416@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJQ/P/qC c=1 sm=1 tr=0 ts=69e0aee4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=p7Cr3RLbn84ePFTaJmIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 7cPZDzZjHmfWKHCsasSL5Y2SlPGQb1-j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5MSBTYWx0ZWRfXyA5C9R4VUDab
 pIkKOiJwmLL0l99EeadQIy//nidIitLJMrLQ6vQjNc+blz07G3ONh60Pz77lDvWtB6SZAHyAJwA
 gfhpTiUwHJF4ttWULhQjTHp/3zs31ss9y63Di7Zc73AUItR90gmTSsckYx/NhBsjYxsrKMy9oIP
 KqDXwud/MOVbamrwYKCdKYWmfXpa1Ftxt5kzmITKLZCFpqRkVDMt7zNScLRKMwDtaXcvsgYajO6
 6evmhjKPoQn67ei/cDDZ4agi95DAJlmTwQ+iws1tUJVNWSJHn2bLQrUxu/DMzjDd455G+1lON+X
 rSL1PoSTyPoKJyDSuPBd3nN2FBtMmloOTRJjtPMBt+4ewDDKdqyKXrApAM4MLsuc2YrBjXhcmMK
 CSHmuljrwDnvQHIXeexUh2eGEhPfb5WaIznesJj8I/X7LTnKVwjAv6g/51xR1q8DAFzjvAm8f7q
 XuRX1iuevFy47B6Y7jA==
X-Proofpoint-ORIG-GUID: 7cPZDzZjHmfWKHCsasSL5Y2SlPGQb1-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160091

On 4/16/26 1:45 AM, Alexander Koskovich wrote:
> Downstream the IPA IMEM slice for SM8650 is described as:
> qcom,additional-mapping = <0x14683000 0x14683000 0x2000>;
> 
> Update upstream ipa_modem_tables to reflect downstream.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Thanks for catching this!

Fixes: 581fc5d5ade6 ("arm64: dts: qcom: sm8650: Explicitly describe the IPA IMEM slice")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
