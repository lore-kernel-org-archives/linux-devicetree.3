Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AB354A7F9
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955425; cv=none; b=fWLUf8logLsiBuq58kpDNMkozrDndlvZTTRy/xopu+3kuTMH8soicTjDH5jXpajOMVQUa1rhbwEajR6EieaqXh0PG1IQMyGcjliGayIXlBKXaGB5WSsJxbjUmRTEmt0zifK24tUfuYur1yyz3pRMgkzrEi2L7v4NP6MZuCcWyI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955425; c=relaxed/simple;
	bh=LTBwD1h69J9FSsjHehddPX+hOWUr30Pz+tfBZRGQ76w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6llkU1XDKavyZmSclS5UQ3xcm85fsjpZW2dh/giFDlV6+bcpEnSpc1aKDDlvCIg28NEzzotUx+DNnF1RxsHCTCGwJpKAEsKKjUhNXpcMTqy0wScg40v2WcG31SoxwPk+raSw+X1rLjAE5OCU56Kfh3wB2ipuA+VHFFcVvfn6M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nq7ReIHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIZlJAQF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nq7ReIHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIZlJAQF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUCsX2019456
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 12:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7myrCA3xPiz3ZcfTIUST0TcemtCB5dR4O00mG6ydPY=; b=nq7ReIHKiSIozb3F
	PhCWHLTrHzlOg9SxQNkKM4oXCr2Ssgi2WT0qC15hBGnybFQmDOaw7gh9PuctG0WD
	DurvwmU77YXDi7MV+aArP9rt03OswQv+H8CbIE+o29i6r5hLVFs7MXaLgYt48HBZ
	AF0n5BD74z9kwX5Z6LykHOI08HU2WM+7u9uqBRBgB3rjfw9zQrZ/Kyf2bvnpgj8z
	DY3hYrqg7+NgoI6dSIwas2HBrnYJGrmQe5Iw7FLAvyD3/IqWpb9oiZVPVY0bsl4w
	n4BJBxoSiQJ76D1uMD+e3iATfdYxgJfQhxxJvngRg9Kg7cJeuKuJQrRNvGlKulbz
	D9n4Zg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x884g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 12:03:42 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-459fb7e8bf4so2557062fac.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 05:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955422; x=1789560222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7myrCA3xPiz3ZcfTIUST0TcemtCB5dR4O00mG6ydPY=;
        b=bIZlJAQFqBe4V1dZhAgSxGb2ATNS3dSzZSIT3Aq3Ej+tEKOs/t3yb3eA/3VvDZ7IOi
         K1+xnlz4mpyVAlAig94SMAzrmvjx9BJxr9WHISnl0Mf/CRfHoZdeZVFdP3fAHI9WaChb
         iyFiYjKkBN0CTfviA2bBe533wCgNSmaiG+wltfH40RcHxYw+2x/VaDXOl8dM85DzYXDZ
         56zMNL+xJ6wlJvVHARtYx/kHiXogLHKa/6rEY6fwlrcbasaufsduQqrBGvxQNJdMOPmT
         XCOfXeQ8ueDdXT4kr6lFTU8yN0c68ibraNiz4qHFBiT/w+PQ8fz4MOsu9ad5B42tPeDU
         2NAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955422; x=1789560222;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7myrCA3xPiz3ZcfTIUST0TcemtCB5dR4O00mG6ydPY=;
        b=qwTeq2m31fK3dCRaXO4dJJHCMqOFcpZXE+K3dwO/QY0VF1tqMfJYlcfA6bRcC4jkR3
         wtivVPhHCswz2xbtjnMIFjVXuUA9zHDIG3wFoXn6xJO1czmrziFuOpVA2ZYPVcIZp3dw
         +8t5iGXbDVJdLaMdM35KpRwGOwLfZa6/JenEFa+jolowWVZhBtuxWnM73ssonZCGNmTU
         wm/Zn3psVm1C+pyc+U9YsH0JorUMJP9XHnIciyIuPBgGPWYK/YUEBqpArqVQQTeg7Tqf
         uoJ6RKiLew0JV62saSRSCqLGM/jHIV9FISuV5Kh2a2vNilrHBEF4SgJdnbAdLERzjh2O
         w3cQ==
X-Forwarded-Encrypted: i=1; AKwUvByZ4kQC0imtoJsNuUV1WNF8BwkyjYyR3sreMYYVTTDGtTDTs9gMTg2VbTdXoEuCQ7aVnAHSBH9ssW6s@vger.kernel.org
X-Gm-Message-State: AFuF++k8zKTIl9aRe/dc7WPsagn79S5/e4dTINZDYS1Xu9iL/3T7zYuX
	xjkTzTYL7HIOfqLAi+CdG1rK9ObpALPmzbOpNuMpzY0XmQTyb/Py0JjOPoT/YeoukW7wGiZI20c
	JE7G3ZAZ/HIhy4OeqLEBpQiWSmWbG15vbTZqeZR8vPLuKdRbcCLAdVdq9+Q6PY9NU
X-Gm-Gg: AYBFou2bM9EKAkEGRZWiE8GMXn1kTkuOcRqtSrQNcQeRDP2qYc3zTwpv1VBqM1rp8L1
	4U5BqEWMOMypoC0NSxFveO6dBKtELDAKYxEMFShJpQwKrShXQpoOk2wIfPaze9up6L5WBKFD4Xs
	41dSDvhzPNOCQ2FdPd1AYIbFE/muPI7hzcSyZN+xPoeZvF2aI4+XPuVX5nwLWamdqhHPVXfvbKP
	TOngBIwHKyEMcyd+DdzDg+qDoj/HJ4sK4UXFeNxRxYncOcW9Igs4hNUtN0fq1pHEsJWNlCX/frK
	e7Tr9ocjphdotoVZQ+dygwfdQAGHTCRzA4R8r45GuZ4pxbn6CVIY96TKpvLUeLDi8fo+6Ilw2/b
	JQlOLNAWV6xCGZ0l1cg3ttg==
X-Received: by 2002:a05:6820:c3c2:10b0:6b1:aff4:8e9f with SMTP id 006d021491bc7-6b71535d622mr11739856eaf.2.1788955421677;
        Wed, 09 Sep 2026 05:03:41 -0700 (PDT)
X-Received: by 2002:a05:6820:c3c2:10b0:6b1:aff4:8e9f with SMTP id 006d021491bc7-6b71535d622mr11739804eaf.2.1788955421251;
        Wed, 09 Sep 2026 05:03:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262f97f1a3sm586774566b.19.2026.09.09.05.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:03:39 -0700 (PDT)
Message-ID: <9416e173-7690-45ec-8c01-6ee4facf811f@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:03:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-sony-tama: enable modem
To: Shujath Mohd <shujath@outlook.in>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5131FC151BBDEDD2C6C615A3C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYZPR01MB5131FC151BBDEDD2C6C615A3C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNCBTYWx0ZWRfX0ha1UWcNhbDJ
 GIK2rap6H54EzejLmrjCH7hpOMVDW1lPIi2yfLTVxt6Sw4yJ5Q1IOZPZbj2dY0nIeTVDy4ysU16
 9kKAiuFMdf9XEyQujYNF/2wi9lyI83g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNCBTYWx0ZWRfX/PdND0ejCqMo
 Yr0AuzTQgA26MsEMeXED+T23C/ad/fKPv1jdoSIjc4VUnw4CUkE3x0cn64r/NYf52sC04v4ZwQ5
 +xhfmLQ4Wywkd1rdaibBLKqs5dmWqxqNWuXkWjkolLex5W8WUuqGj+PkyBCXEq3ZA998io/5Z2w
 ulyQFnNpQ8KjxY3hbyhsTmkm5VnTwCjWXwQv/q1WgCZ3cgBZCDrbDcumEdBteJk2Lb55DRB6ZH8
 JMgJ9CkVRTuUDaEQEts2yvcsKZUa06FSYZIXnbD22DIaAI5ny/5SU74NrPX+FXK4hGwOXj9CGT0
 VxFTtFVyR8EMIysz7iGYTaxNmpCrHpPSr2bjTHeE6Svh9/ZOAJObKyaztdWun/2vtvlpPIbIrm6
 fdfsC9UHgtb0BbYtFwDMtPQ0nAmWlE4GxJ7ni/jbVYRcNz96x0nr9jjL5A6UgR6KILZ88WKgiXg
 UnalUStR/7gDf1WTpSA==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa14b1e cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=q3xCwlIlc302ULIvI5EA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: SrYCZ9jGlabMKp39iplsPJVIDXhcl2sg
X-Proofpoint-GUID: SrYCZ9jGlabMKp39iplsPJVIDXhcl2sg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090134

On 9/8/26 3:16 AM, Shujath Mohd wrote:
> Enable the modem remoteproc on Sony Xperia TAMA devices and provide
> the corresponding MBA and modem firmware.
> 
> The modem requires ta-service to be running for proper initialization.

A link to that would be very interesting to people reading this
commit message in N years


> The remoteproc firmware configuration has been verified with the
> following firmware running:
> 
>   remoteproc0: mba.mbn
>   remoteproc1: adsp.mbn
>   remoteproc2: cdsp.mbn
>   remoteproc3: slpi.mbn

I don't quite understand what you're trying to say in this last
paragraph, given the other remoteprocs are standalone and unrelated

Konrad
