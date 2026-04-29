Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6638947F
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454124; cv=none; b=uHA53wbsYLUFxgsbMtDsOycuPeME2WbUFbofX/NLfEABtzzD0OfNcaswEi/MQEMblsutpG3MLCCNEnnvLS3/mKggZWVJn8BTPU9eWZAX8FypzHHSTLa8mN3hsqBwVMvJmgK7ERKg6mA9MvmT4wGSsqbhv2aYvF4/BNER+YWP1lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454124; c=relaxed/simple;
	bh=FgmhRN2ZuwB7iAMQrk6FPKhaSD+uzFSTghTcYvlHS6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODE25tDYt0Caf0+mumzZc7aU1CC6B98zysGL7aYR8Mxne4rBzFKGQnMB8YBNaW5jOOTr7f1JH55jmmgrLnHyup4Z1ubpqW7Kp6G/4/Brm0ToerVFDc3pgz4k7BugNtjDrmrI1E4NVslE4fysch8OJb5j62zN3SzZtEWx+M85vb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8RVDjZi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JV/2RHhv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8RVDjZi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JV/2RHhv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ppWK2094109
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d2y9MLNRsMzuRk0cn7P4gB7NpL+d//Uf4khrC7oPh78=; b=A8RVDjZiodUej8IO
	ARO+Is/G4SILqfEWKqEgW6a9vptVta7zQv29mT5JvXWw1DTajz2LXfT3KW9ahZlE
	pawjYwFEqXWB/AHz5O4ubxFrKR8A39P04MsW0NGi+QYaLm5VlO5qj1xIUSAR2qrJ
	PcjLA63yiubOYmEZG5MqB9nI+dPjSZpr6k4s87tWlPgdPtl0qjkOCd4jU1TObi81
	C8gWjSTieUh51bbwzHN8zO1nAhBVhEweWV5XqXKNLNoSvO/c2mVdeGSpO6Gijs8S
	USKEa42DGnHt6v6nzrkNDk1+pLOJdRhdBcqWXYVykgH6apzHMXGM9/2t9E3398PW
	S2YPEA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3rhrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:15:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-362eb03240bso5574475a91.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 02:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454121; x=1778058921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2y9MLNRsMzuRk0cn7P4gB7NpL+d//Uf4khrC7oPh78=;
        b=JV/2RHhvjQxW3YC9tCBF3ioqMOcqatcKoL3BdSJIvZVgrMvKYjRDK9T57G0O8yQyUO
         FOn5gfK07PLBtJciEkVfA8HO1X50iofDTo86sj8PpE75UXgedaAOx794gGo26DIcPWD6
         Uk7je0hSph7bLpV5zAsAXluTrt0QGf6dSZ+YfSfqNG+bGdw0YZJ5Rlq9nO0QDKC/aDzl
         z9hbhffXj9SHqhNl+mn9PBKI8Oh4HH1CaMjfVEFZX+qCwGx3VDfGpzD5J1FiPhwcv+kA
         ZpCHdhYHWyTCCigCAoXq8F+e9PZcgsWDKhJ8OkqjjDrPFPhLvzehDaGr4gSZML0iJ7Rw
         qF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454121; x=1778058921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2y9MLNRsMzuRk0cn7P4gB7NpL+d//Uf4khrC7oPh78=;
        b=Zr2iRblJKP7iLjnzl73jwFYF6D8b7lIquF4W6QhFFw1S23bHS0B+hrDtaaCRzY2mg7
         dyHh903lxIwbFxYJw9D0EylXf/jWwBZvO2ykacwjGvo5POg59/YnSKCbluoGM8iFhr7C
         YiO7Id43NmdwQKPVQsiiiCyxofyTM6i+kwvXlfpxDwsKSXoOKgKYglw8yVZcSMxY1GnO
         6yKzG4r512IZ4SkYRmGq7/rLDfRG7r2qnwWTYmksbCoabPzVIrWW6rqPfuy5C54KQtbi
         ULXB6pGODBMRV9ea1SDM4KvnCbixSTirfm6oSfbmR6iuXTjhv3Q0SVie+SsjbWXFP19l
         J/Ww==
X-Forwarded-Encrypted: i=1; AFNElJ8d6BQ+z28L4YUGAxEiqUEWAc/0zX/mHFMJI2I4oX6HNHAH4R/zZHbwTWE5HpqQSoxM2sjO8V2F8lGZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe9Y3zDLMUcbG4frjlg6oIy3NBh8S7M5eo+p8u6nMhjVde18TB
	Lu5z+0T6tT40Yj/sSKsqpl3uIho1+TMcvXBcp/MmlY1LRjO/OuWCbaENCjEu2A3JXRu/3DTa9Bs
	Yu2ct13UJhf+QHDUYL8BHMFdlqtcKo4XIoYu7A7x5+F6ZERbXGPyUgKDBKvXP9PXX
X-Gm-Gg: AeBDiesPlP03wDyeI/EHCKpI3D+DgUsBuHX0tzACZpXzI44ftSq0SGliAIjOg/6lZp8
	eYFOfeohbJzfc/4vOLAFGKEymONHOSgNv0w5kI1cpZvCemGJRlfzuh+2An913pb2frmlm/qu9xc
	TLaMdVchU/TYFAHy8dImqkUqat3/ZiVA8Tpy1MPjuBzT0wvsM4Werk1bJlwMYPKMwbfvGjYoc70
	rl7wnsFHXKxYTYv4jqmn/5LbnOi0GwgJUy9sXY0C3aCUi19cW7tzZl5lFBsYhHjZnmkv+WeJsqz
	sSHM38i37YwZJ8VIaO/K+PZ0zw1cX6aVrcySb85R8pPWI4bu1Kvxm94Y5I+B4CQrn/OWmSUpcyK
	cylB3CLPuyVa+wdVnOuUdupOpy4reBpW5wUCvKu7Shp3yY6pQYM2q3CmBoees
X-Received: by 2002:a17:90b:4cd1:b0:35f:be09:1a2b with SMTP id 98e67ed59e1d1-36491ff1ce0mr7520099a91.10.1777454120837;
        Wed, 29 Apr 2026 02:15:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd1:b0:35f:be09:1a2b with SMTP id 98e67ed59e1d1-36491ff1ce0mr7520072a91.10.1777454120422;
        Wed, 29 Apr 2026 02:15:20 -0700 (PDT)
Received: from [10.217.216.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a419a148sm1650856a91.6.2026.04.29.02.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:15:20 -0700 (PDT)
Message-ID: <b9bd568f-dfbe-4a5c-aafc-19ef629e81ba@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 14:45:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8750: Add camera clock controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260225-sm8750_camcc_dt-v3-1-a19d3173a160@oss.qualcomm.com>
 <d2e292e3-de8a-414a-9f37-036b65862154@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d2e292e3-de8a-414a-9f37-036b65862154@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R40rQAElC2FUFWXN-rtCZMoZVsU-avlp
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1cc29 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WVJonjGCGc2Ee2brpuEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: R40rQAElC2FUFWXN-rtCZMoZVsU-avlp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MiBTYWx0ZWRfXzv9NIadQtqDN
 xu/49AA87CANKlD+wBNtEs1xRZlKoiwwgS/IaZ+3B2shrxhOq8mIS3eVQA1pOgvX8JfQ18gZ24o
 9m6+ZRdQ2irhAYqkauciViEBmFyM5ETKXovdNt0avKoz9tA5YO1ckE1HehrJwdr9BSI7xypSmwc
 PhpdrSMewr5EHnH1JECjUb17k01nhEmk+OmuNVAekH/sp/cgZGg9HywTstRErL9NxctLFDvh34i
 JjNsEfROScVBdMSfVedz2PWwnWaBuASXpjM6Eu5CQWaYq49YLUO+rq853ks5TSMWbEvf2r1ZOIZ
 AULdVeWPRgwZ1OOHX5iBEKTT0z7Y1y2j6gSu1kwXS3KFFla0iU2FF+8Fi/ER7BvvQGvlx0DSK6Z
 j9f6icBSwBdNtWjhuE7ZDl1Kw8HXeK5nbJoDOb4j42WuymewZft8YpZvYo8IESmeNCDjTlF84MR
 i+7i1gUL7tMHMwGZKgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290092



On 2/25/2026 7:48 PM, Konrad Dybcio wrote:
> On 2/25/26 11:12 AM, Taniya Das wrote:
>> The camera clock controller is split into cambistmclk and camcc. The
>> cambist clock controller handles the mclks and the rest of the clocks of
>> camera are part of the camcc clock controller.
>> Add the camcc clock controller device node for SM8750 SoC.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		cambistmclkcc: clock-controller@1760000 {
>> +		       compatible = "qcom,sm8750-cambistmclkcc";
>> +		       reg = <0x0 0x1760000 0x0 0x6000>;
>> +		       clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK> ,
> 
> Stray space before the comma

Yes, will fix this in the next patch.

> 
>> +				<&bi_tcxo_div2>,
>> +				<&bi_tcxo_ao_div2>,
>> +				<&sleep_clk>;
>> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> 
> I find it difficult to believe, but the computer tells me CAM_BIST_MCLK_CC
> is powered from *CX*, notably *not MMCX*, could you please double-check that
> as well?
> 

Sorry for the long delay in response Konrad. Most of the CAM_BIST_MCLK
are on MxA, only few debug clocks are in the "CX" domain. But the
CAM_BIST_PLL0 fails to lock without MMCX enable. That is the reason to
keep the power-domain to MMCX.

-- 
Thanks,
Taniya Das

