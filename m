Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B302E2852
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346426; cv=none; b=EM96oWVYaA5EjyckxEHcoR9qpQ/i4sz0hb0W58K7FnbrgZ0eR7HyBvt/wJscsDDUKixgGJzvhz+R9669b1C5UfijjrKjxt/y1nPv/6FhQM9slyWiNhaG1BEmzsPTr0nmaTV9jIqhr7YOCFGw4oZq/aLsgbpggGoF+C9wPR/0wOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346426; c=relaxed/simple;
	bh=0ZaLZijLXXD3u+xQiSHAIo++4vJ6pw7HiIlwbtIi6Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhsHj35bxY8dNl2oI2nX1AS410d1lgqIZf7hZ3UPgwcJPT3csTawb7Qd4G2bVcDCy8+uXn+FVphHP85K99ioQiONuMXDHIhn5I0iF5dJ2pd1DPdx+ULGTXMInw5QIuK/ZLnwTpxENSO4qub3B0tuhVqS3TAZj4iHOojLKewWm2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKzEQMnc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EUdwCwsJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKzEQMnc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EUdwCwsJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8Z9OP1702363
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXaFwYu5q9PT2J3pfkVA8q6GTphn69FAyibCCzM/8SY=; b=GKzEQMncv2jUhCkz
	x+Jg4GUf/bac1n+cAcQmsTl2XyS3PKp0Puq4XK8lcYTZnUDDU/3UbxK16JHy3Te2
	l9V2vkhJZ8S9pk7RMdBFvicR4NFbQygDQfavuwRHQcjEYRPr/6CZk6SYDZKST8J8
	6Fqv01npF9jB4oSSSuqC9E7hmJ64AdQbZXB/OMikK/2wmD4qC8ZFnDdIn6+Y3Qbo
	u0UulKkCQfCyGTLrBcy6L2DNerouofQ3vOl8tgZ/quKkae9eP1RSSZLkTMRpL4/p
	FmUYrZwI5jmjfUc8o18+2hoR5yPhsTnQjXDjQyaotSQZPmyNkUNENNDs2og3LAUy
	i/Ak6Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamkyp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:33:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so506694137.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346423; x=1776951223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXaFwYu5q9PT2J3pfkVA8q6GTphn69FAyibCCzM/8SY=;
        b=EUdwCwsJ/kYCxj8mqIXR87kbhohptaD/5umvEyC6tM2nbhAs3pzqX2V9FobiSVea07
         JP5B0ImsxYTIGIWrjKjbxe/iQRp1van6Oqrd4yK958vQMbgGmeGrNd5BoqVLoVKrC76T
         p2ZSSKQTj9Ev74dBzCm3GrCnEL+0a62WRYwnjB08gmIzEVSUHiuG1t9SH2SRO0QvPSL1
         Y0s+DKh7OHJyhn25MjOmGKyuIqdunwF23raUf81B8ZH9BsA2kwnVkirwD9cCfxERseKa
         UR99uAioKngAbNXnKvbXiiilnc8i4P7d5kl/n2YuY0Xh0Wk0DHWeHe0MP8UhQCoDuS/E
         onHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346423; x=1776951223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXaFwYu5q9PT2J3pfkVA8q6GTphn69FAyibCCzM/8SY=;
        b=eZD8Jz+VsQt9FVYjJWZKhEWr3NWNaykLf0aKA7sv9/eVRMGIvHvTlGv+C8EahkLNzp
         sv1HwCVCStcVwqacnwcWvimtZhuMsMKLzMiNUgqGMRO5leI7HYfvmfT05+OH4rp40x2a
         UfO3Mwrgo7cWOKSX3zOuLcaQsipwCtH6wOoqmu5KrgGJ8+CwvZFd54hOKSokIWPm3G3V
         TIKUmWGpotwMpDbLNnFEqU++CehlH7UP5GsfkVCWOuWVsbiZNLe04jc7DSmJ4KQU0IS0
         obHSV+soKXFTPyDkTB/EhMOPIqYs76KcaNEA8nAdxbbYnDBM4ISlNP4J2v0818hcPFPh
         Maqw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ok2GdLzuLoim7qAhAMyZFfteYMnisJNtU5x3rGUHPSNELARXPpSaEADnQnt5mYt7rsrVPT1e+HLmw@vger.kernel.org
X-Gm-Message-State: AOJu0YwT7wkw+QrEDIWfz7tYd2ZBp4E7ZPzuyG/batlHHEal5Er2Oz3Q
	OfpV0dUV99dQbaX4o+v9Emo6Gy3jbqdjZ2zjjw7NQahnK6ytqELAiO18QngSYrYlfaxo3oYYPuu
	FjU5FQl2+4TUy51dKZk0yEsCp9WXtiDdHTq6GG1QlGx8STlzkqw9RxrtcbZjUMjl0
X-Gm-Gg: AeBDiesZ65Btad+sUnuRy1sf/JsXkpAo6AsnfaOi+qxlPM08ln6jaLPWJGISPDKNYvW
	wNY9CCNRzwsAByoImH3mjcmxFsfAJhiPTVy9w7v6v/iRS+1MKGus8QkG1umg6UyoCfBnOsmkYeG
	/RecSIqXqpBOMG++g3RbbVcBAG9xxipMAmQG3uzNLeakvd2RLHFYx9+2cMzyIHlmu7HluDm1IXq
	6zWXckNCM2xBhS7T1nfbNYSrXXbXSMhBW2fHt8jS9PJhW5NUG9SEraSDwuaWtGnjNgt1lyt6LrV
	Sb9w/aFb12N1Zkz6Qmd7uPd2g0D+tS2xAMPmZTZ2gxN4YPPB0g7SBti4fyxADjf7nfa8l59n42h
	Sobr78xSXlxHeu0EeFTkCFH/pRxKF7KtIQykzFieTOkE8dXk/s5/ZlEdDyJGnmSZ0gj5nvyrW9j
	RJCyWLueffw65XcA==
X-Received: by 2002:a05:6102:30bb:b0:610:6eb8:3f8d with SMTP id ada2fe7eead31-61417a43179mr322619137.0.1776346423503;
        Thu, 16 Apr 2026 06:33:43 -0700 (PDT)
X-Received: by 2002:a05:6102:30bb:b0:610:6eb8:3f8d with SMTP id ada2fe7eead31-61417a43179mr322603137.0.1776346423119;
        Thu, 16 Apr 2026 06:33:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c3c96sm164875966b.36.2026.04.16.06.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:33:42 -0700 (PDT)
Message-ID: <68a12065-2811-48c2-8aae-95688bb2044e@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:33:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: msm8953: fix modem pm domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold
 <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-4-6098dc997d66@mainlining.org>
 <i6lymgal5c62ud3aas3qvzv6fjnjrzuncguwechraahmflr45l@5t5qli3k7npu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <i6lymgal5c62ud3aas3qvzv6fjnjrzuncguwechraahmflr45l@5t5qli3k7npu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TkCtpg3L6_JQkrnOlkSjs7s7aqw4r7he
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e0e538 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=T6802ZzQLFeAEQQ1qNIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: TkCtpg3L6_JQkrnOlkSjs7s7aqw4r7he
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyOSBTYWx0ZWRfX2tbN5P1QlPN1
 t55kQx94T1PEIhgYLBWsrzNAwuWrRi8yU0dgK/XDFSHGyxkQV4HG4pnRcTyIwpm8q7VFk2Kodfy
 4L59SwBKsppqhAdcDZFOULcoWpg7ndxeXfCtwMGXJQTRNYtlkMgIjwMVTUJL1Tuj+W0XRk6Zn74
 aYmXMmoVEqIsU1k2n2KHcErhF+OmAq9zYlLN+lFr3/yDtycVVZQiwg8Xwiz5BP1lDzqRrm9YLFj
 I5pQa+aPvM0LPzJK9ZK57kGNmhHQzhjgoTCfeL0i1dr3CJnG4fqY4ChWi/Ta1jIHFQu/dYSVFyN
 OMo9jhsg7EaFtmvy8S6XkE4HoFLNT7G5hDu6l3NZDPhqW4f7OLoU1PW77ZmtfKYNTXNIHvwUF0n
 BN9PZb4DL8guWi8xWcKXLhAeKRZQswm1qyYZ+jaKzDhQYLLR5LmHFItus+Sn0T7ZtmANCkXUS8t
 dMHEXNe3lPXuvMHw6ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160129

On 3/27/26 9:35 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 27, 2026 at 09:11:46PM +0100, Barnabás Czémán wrote:
>> MSM8953 MSS is using mss-supply as regulator.
> 
> "On MSM8953 MSS regulators is controlled using the voltages rather than
> performance levels. Correct DT definition and model the MSS as a
> regulator rather than a power domain".
> 
> Also please squash with the changes actually making use of the
> regulator.


+1

Konrad
