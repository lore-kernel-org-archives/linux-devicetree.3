Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56168346ADC
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778230283; cv=none; b=eIxTnNcqkpCqU8BTMSOXTYgthIK9uz5mtFGccU6k1L95/R9ITZyDie1eXsu5UO7JRXHW/BA7z8qnNHXQTT5jJ2rq2/JxLSzCENv4WWxW9voX9HnTi7GHv9nz07VJxrESV8cQLAWQz6wL5MEB2j6noNeYoyFfCnJwzFvJ7qt8YJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778230283; c=relaxed/simple;
	bh=VtsjDtpzf1aSwXKAMAiXCL3tDm2zBBBXyjYr/AaI1x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+mGWMP0aZqqL5t/kOWLMW2CW5D8RzzbNVjlKGsfzVcbbWZ9Vex0rqcHqXq9YrwNyMRF1y0ff/hR5AFCBqjBk7qweHa80JNhzpvsmZp+Wlxn/ykSpKJQREbrm5bPavRhSmRqY7sbcqMeNiffWElkpmbKfWUsqNLBWlAXjr6CgYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7c6drTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUGsO6yN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7c6drTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUGsO6yN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jG2v257892
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 08:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Go6MMG1FPNgUfm3yVi8/f5fii9YrI8DP0LqHCFgBeA4=; b=M7c6drTFyv6zraF/
	T/6u+JilJa7uUyx8eJYMlXLo5qgRpdTPdq7FjP5E+Lo2YofWdsXg5zubXu0cbxFt
	I55TpKz+OkZffbamuPqwFXhWXZOZPJtBj6liNQ/OdZqTLBBWdjcX5AiJS73QAn1+
	8Qp68VBpJSlY3ygHZ5Eq/SO7+yckKjwiJCDDf+swTsFSMWBjy6EGaY965Nm3HHPj
	lg4yqdi8bm9nbpR2LBsUygYvMERpLOrwYCCFokbrDDZXq3C3pN0c6mL4iMSv9jR6
	GmCIcv9i0xgSlWBs/py4H7Kr89B9BdiCUcpfAowexy7wIcq8Y8qpjCYjmMRg4kLE
	izU5dQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auegf62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:51:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb39de5c54so38824785a.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778230280; x=1778835080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Go6MMG1FPNgUfm3yVi8/f5fii9YrI8DP0LqHCFgBeA4=;
        b=CUGsO6yN49YrS95n96cae8oFNbL9l8WMWa0wdNoc5ceRiG6hu686zcEjPOh3o6zTn5
         2zqapPQb695eFFsQDm+jKXT9Fopqak8RltIu3Moomqe84ng2MPpVK5QELmTGLzLCzAv5
         itMyWUk748R4ca2NbK8JRXv+8f6kk+xJUQZdIQYOmiFlci7haA8TJyMlDLtqyWdf4CtO
         N9TFQp+hrk4y7REUeuqajhuWxjl3SuhUFnGE71pyz3OIMI4IV27fm8ZlbLZe/Wp1fIAc
         wv5Dq069tICJiitLjMra6sAy9HEBMuIOzNE0sb0hIUSxgGuEsoPqqQZez3zcEHMbr9eJ
         q7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778230280; x=1778835080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Go6MMG1FPNgUfm3yVi8/f5fii9YrI8DP0LqHCFgBeA4=;
        b=O2g+nvV0wLSBHZJXmSW2EQlDcS6SLI16uYcI35qVnuzoXEeEUIhYnQgf8KziR85v1s
         ceikLFrafeCeEJe4Je2eIfNltzkz2+6Gkx3QvUuH0V3JIznIXTL98tJEnb7Du1c17X0R
         3GC3ZxWEBheUA12n4dQkcxEec+q48ciecVvovJA97YyaHDLvccKht9p+RgJqvd1+EnZw
         vi98tLYd0wI9HmCjNCdDnx2lowrodYG+MoeRrIikbfe/CFRqb9xgI0V8Zi5tdotiULgz
         98sV8gAmDrpQ4bQQB52NWsG6LiXSBc8sD8U2VQBX/Em5gyPLiKlQf9g9pVakmoktVyCb
         9Q7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9J59pPDo0O6iRkm63GxDtw80YDycAcqAEKbVDoD/j21Rm+sCSzbixdJv7PhAGYwIBHUTVpUZNqU72b@vger.kernel.org
X-Gm-Message-State: AOJu0YzwG4GfpsZ8tsIYrqb3w8N77rz6rTdurW7jQz/lLo7aLpFBSUGL
	6jYdoKZ9VRL86crpWKSURiU9ol00oOx4etESYu24OZKtQ4tFtwKpd24C4DH3KDYlGMzusymEGat
	261T1AyzmakrQKOLPdhbDMpqmC86igNUoGsT92MYFDdgWimwFhtUPalez4wAFVe0n
X-Gm-Gg: AeBDiesMKPKLTrGKLlmM3AuNoAsolGtCHHUn0p+C9ReuH2IQTsjhLpiHszz877igUW/
	pSdhr6wj9uaTK+KaZRCQs7tH97JAM6nKhLshTEDYRJPC+q3WN7frf6SMcZ7NlUV2/HfW6zT41+a
	/X0dW9A23jfEajDNLb0+C1XnWSEKEJ9elIlRoz//AM7Qyud/cX1AhSsG4xXIkrnPopRb0vd1PZl
	O7pQA+9m+l9ZzOcaNZXq6RUXscqxh5h06v5hBatMYQNS1++NulzphtQbuw6hzg/4hRxVDEx+Css
	bwhNPp5IMJzXtQXiXuT3M96Lymf70+XK1Hg07ba5F3lZoTeYV+AtOnZDdSoGyIDS7JghWdtjFH4
	9cAIUNRrjeTU8t+yZbD1xOzUWGuLoonP+adjPL3yYUDcPCvFefEKwekmeZ8K7z5DkinAiaf7eEk
	BZ0FI=
X-Received: by 2002:a05:620a:458f:b0:8f8:cdd0:df70 with SMTP id af79cd13be357-904ddcc2a73mr1168441285a.3.1778230279559;
        Fri, 08 May 2026 01:51:19 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:8f8:cdd0:df70 with SMTP id af79cd13be357-904ddcc2a73mr1168439685a.3.1778230279185;
        Fri, 08 May 2026 01:51:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b8a939sm407542a12.13.2026.05.08.01.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 01:51:18 -0700 (PDT)
Message-ID: <cba5bb2d-a885-4476-aa16-eb1384fcaa58@oss.qualcomm.com>
Date: Fri, 8 May 2026 10:51:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add gpio device node for pm8010
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins
 <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
 <20260507-pm8010_gpio-v1-3-3bce9da8d2ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-pm8010_gpio-v1-3-3bce9da8d2ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA5MCBTYWx0ZWRfX3NAMkpzx4zjV
 B+xFMaC1xQejC2tOron+9w2SaidbzCj/IAX9pQDGBfbdiwDz9Q5Z2Vg+4JFpZQl3EkfEOaYy1EF
 V2MZ+dL3n4P6Ncn2grP8iCbPnfZPVwvXeTmHTvst8MviXgbZSjjk26J9jBja6qa3aBwWhGFYveM
 ukhs9brTTEtPob4MpBUqRfsj5kt2ud3o0bYeRwzyfOeiM5hh38RlepbE8J+MuSYWPeKa+K43vQo
 pypjZVF7kpr309PxL84QXNdBZ/O7RuIEMKnT+3eBhVv0L5uoYXAL1fOpcUVsD1J2wIdyxaaj/mM
 pl5DogxzWsUmJ6171BuLv0F+08A4IXgFAbqKbjf+LWQxZeDrODW7/Uf+RPsH6mX9J7AhRQe5t5D
 wqiqdqcZYSoplf3VikqmD/MhRLc7B9BO2LBhcLGT7pbU002W8AOht/Jpavh/fuhid7HCnQLf8Hi
 PrbIBMjOm7uwZCsXq1Q==
X-Proofpoint-GUID: cZ15oAuxwhzEZ_VqYPq86DZp_uTevocx
X-Proofpoint-ORIG-GUID: cZ15oAuxwhzEZ_VqYPq86DZp_uTevocx
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fda408 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iQYToJXVBgYrGeExREkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080090

On 5/8/26 7:34 AM, Fenglin Wu wrote:
> Add gpio device nodes in pm8010*.dtsi files for any consumers to be
> able to use the GPIOs.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
