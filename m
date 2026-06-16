Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3AA449EC3
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611213; cv=none; b=F2zCuZm9qVqgZXl7kB7ZQkKnK4yekOPny61vdkpT4W1Na1GRkBT0zvBV1aFAsHmTqu3+1LZH8nNmw7MArHpkUfS/WwkljU1MTAfUIkKipV4yZxCMA2ED22E47RVgcwpkOfoHRCA11nq5qhYaqKi5WL819w6z1HRtcyr4zI+eF/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611213; c=relaxed/simple;
	bh=RP05cdVRyEgCRmaS1UsZPi2+neNfPD4tg03i5mfdXng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUCJqHjGtQSk1ltzhoQ4eR1R6Y3lh/761nIQLkEwRDLr9e8VeSCMNwytA7+5Yh9jqsz1pUTPqkhobc7Yi0vsw8ZhM0SjJ6bsXHgauEEP/5O9PlXmA00y7COZ1J7xGsv6LKKUxyiJlSNKlN4VL7P4sJorBGt131TLRO4G+CnXypc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klUSxgpX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQs2wv2+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="klUSxgpX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQs2wv2+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC1Mu3256225
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzUX60GvOS40Xc/59yiLIRyohnTxUcrKAkEp2XOlfjE=; b=klUSxgpX4O1I79ya
	Gv3nHbHTf3JReJSFg4+ztGkzKMlCZQi6rA/hQzNPFus0x7ZjtcvRhAS81W9fA1EE
	MHi/cnnqA1tkEgj/NFBnlX/sJgo/NhRmDabX299anHB+PbyaBVnxKud0B0+JWgo+
	dPjq51ZkifxdZ9NB9S34YW0E1721S0sHfZ1GWGK1BN5tFaaPB2/bIwEuiIfHvhVQ
	F2mibudoFomBIRpr1UiIHoC7MJCH14xR/pOVpa5VqJUe2G3p85raHrdcikW4yiGF
	J7URH7c7cf4oYnwNoTTkH6fawnpgJavmUCHc/bERM8eV8NqDalx0YCi1Nhn8/Zbi
	/PjIyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9m40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:00:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517647fbff1so12671121cf.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781611209; x=1782216009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IzUX60GvOS40Xc/59yiLIRyohnTxUcrKAkEp2XOlfjE=;
        b=VQs2wv2+oQobSMKYZpMPEyQdYpWNbwXDmkdZS8IB7O2cAYv1dWbI6tTEdtdzlr4gFg
         ZcshHRtTwM6HSddwSqY4t5kXlRcgaLUEkQ9PmD++R9UPO9eEYRr1o7qwtD+aUCqKYdwl
         T2lwo+ZodiqRpE8HAEIJHwaja8bGY+AinzGDzBHpkKXGpJvdpJSbBwKzIEsyMxAT+dGV
         JSBMSsjaor6aTOFZFMq+drkC1BHSn403ZKM+mnlbw2GWDtudbKK8m51D0ER8ZkaUovmH
         BZkUAGSocEV6UkzMLTIyC1plvv1ukI5DMWfYNbtNYtI7woR9K9KY2z3DVqZ/a4GhCABv
         jGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611209; x=1782216009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzUX60GvOS40Xc/59yiLIRyohnTxUcrKAkEp2XOlfjE=;
        b=j9V1Y8MAJlfrQSBmNpJmhM5YekJWwL1IH2EO01oL0H9WDeHwjqyu7mBzlBRRj7APD9
         4lTj3gzxTG0yUsBR1MrnQdJ6xtApxiXTUkJ9P93AjuzzGauEQ3HAKakW7JM1c6BnD/++
         o7hKuRu7JKt6nBm33+Nes1t5OeUCIEAv3ECRlTqbDqAf+NtuXacfkD4JrktgSeCGcTH7
         6wEZXrB0wNuvBhygkBOgTVaI4FYFUCm+67xa7mjZPfeHbK8wELDfgRIxbpF5xG/2+t26
         VrJBcsU5mr+ojOIKPpVHt02V5ppNPexKS52os4Jzvio4Uxy4RNlS+jpKOvRHiB8fBSVc
         KiiA==
X-Forwarded-Encrypted: i=1; AFNElJ/NwzLB7E0HoWRksCe6mg9Zd/5Hngnv06lfw5UpW/PtFfgYj98Nk1iieciOcWSWFJpL25hFC0krvhKh@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ4r6E4RDt/WocFRuSOc/u1lMMEeUoYXj8n3YMBwqCE3xzmwk3
	EV+/tKdKTNM3qCuf/S0m3IPrZ5HEchPQAkOUqvvBo+Zr3wYTElvZ2sQG6mQi3D/nlIse2GibrDi
	SqO0w4jqwS5RMDenGDZoKjAhmWX17S+/Y8rB853+H+vDbFwE0rLl7nTUuGSU0paTW
X-Gm-Gg: Acq92OHHMla3iR0XKy9c2hc3L5vqrEJ/8aaYPM98LjdB0ikl9fp/lzW6/c/fVbzYDAd
	aIBs1ajfIspQidA2MY+EIfxPaSLXv8X6bmT88m4JnY/NJQq6Ug0vP4e7e+o4OWIo5UAcGndjrh6
	8B4iIZ+7cAjdKgLVlJEH0O/pHT+ZN1BmIdLCo7kcN8STBl7h/gAnrWCSrHJEDVUiOIki+mQGXnE
	3AAm4xfANOPYu5VKHJ5ru3Kto+OqFjm831c3uIFfBWvc+/JkCE3RZBQ3ngkDlzuEMV6Dwrt8uS/
	ADNuEJmlDI4IioFgNcKjy1ljn/p7s8IBb7imt0o2W4rHasHq35pgpQfEY9uWrINQ/xmJTVxH+6s
	tAQ1gZvNBaLTwPq6fxj4hYSlwiIqYp0T86RLeS6Oyj54BPA==
X-Received: by 2002:ac8:545:0:b0:519:9efb:56f6 with SMTP id d75a77b69052e-5199efb5908mr6738891cf.7.1781611209268;
        Tue, 16 Jun 2026 05:00:09 -0700 (PDT)
X-Received: by 2002:ac8:545:0:b0:519:9efb:56f6 with SMTP id d75a77b69052e-5199efb5908mr6737901cf.7.1781611208504;
        Tue, 16 Jun 2026 05:00:08 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb51007a9sm625307866b.21.2026.06.16.05.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:00:07 -0700 (PDT)
Message-ID: <160da619-2966-477e-bd2b-863e118403ca@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:00:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add UART15
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfX5IFk+p8P1br1
 TbsHh1+SapGr8UrwZ6QvPtpWKPcUlkcP+/bbLxSJqJzbXydyOL655l+ET6dgCvVW4wZaufW+Hgx
 WqIxP4qdYrmAL1AFYRGoK8+pBBhRJF8=
X-Proofpoint-GUID: 5JjSRpZXAhu8rSzAevqL43ma7vlccKpG
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a313ac9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=h4QezvlwQ886wjDLtIIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 5JjSRpZXAhu8rSzAevqL43ma7vlccKpG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfX0QQkzVQFsl0s
 E0hlH1cBbHM4zM3g4i4jmIlo2pm59qzQbZDMUGULf5JpIdk63DXv3Lx9NA9ECfC7ddhOk3HZIn+
 JHCQDuJhEAzmpRW1bH3HxmlnXG5o1AcPftvIbfLA1ocLw1H+XdQ/Qc02yYa5A86J2cayw4AW4Db
 c/h0X6ELuGvDFlNYXviUiq+vRUTuaFltVkBTvjD/jTVEuCUNdCWNNsjo03K+Wc9TINI2vY3vh/I
 pLrhxSdBRVjo2Z80xwvnnXuXBCl36QCYR7zL9+UdC47Y49JTGSZzVcQpGhvtoozygPnIGs07Ad0
 Cl9qF6qbuFL9bycIG/oFomNQVeWBf+I15aDWY9ser+UTw3QM14UiVQDIOMzOvMAE0f6RSY4k+Zy
 6UoIWt7w42XY7E5NxxejkoWFwqphLnwFbSGvOWZYdJO+8z+kbN4pbImQoqzcdYYxlYO/RFgnUnI
 8+L2HPnw2/6a0Fd3zBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160122

On 6/6/26 12:49 AM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add uart15 node for the UART bus present on the sm8750 SoC.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
