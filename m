Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF145428822
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744274; cv=none; b=f2s1i0tVRdJWIb8G4Eyg422MfQV1K5Pm87CKHqQczHPtP0MDHjl7qjFwNMz47mBOlPmr43aIyJFCCZCigW/fn0fzav3MX+EkbL/Ung2k/zqPtDkRcEdZr41NsuQNMmR1RbNhnCrURJwRU6P1rAszcc0UpYF4UizoY7T2+OeH26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744274; c=relaxed/simple;
	bh=VY4WrvcbVg3c9j4t0PvvlgL3gXNchz1NJrdvaXZQ730=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqmI4uI1vv1fqKl+06fYX7CXPSZ5HWAZA/pVMU5dpml2qNPfa5f+eEEnnSqh4smFvGNtqY+MbvFeKrtpWeCm0xvcEFZp7e3hN1hD1t0rr9H1lgSe3xB3K9mDL3sCq6lIWrAamqsjwwAaH8rEEQXSksKpa+espxhdjqUU7mA/ksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWnyyYQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwhY5G3f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UWnyyYQY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwhY5G3f"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASueK2640872
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5FtdrK07MUFWJmkkos6+LEbmAp4CQiwNSczwv1GzzE=; b=UWnyyYQY7TtlIZbO
	6PTSnY/amyftL+fqPbu9JwET3kbTcnwZftcwKuHJ/n/mvNajjje4E9otmBfpKLrb
	00qlKSo3u5KfgcmwUIuYKIJsK0HOnrHaOtdXhsTRvDRA1CaD4D5veaeLWw97aVz8
	z0reNb2DvbkJLq26P8GVGW+m0Fv3r+HSKzNWd2x/7hMRjjLBRNcQRZZ8aM+VjcD9
	yAOZgtPhRIcuTx5Ms/IviqlNmixzJqCPS0UKc0sgXjD/AAGG1ettGxqgpa2Jeei1
	0Wgnap5DdmvScQraDT914U9fJTtNOd1GHE/Kb4rGUKxBUdLVm0P9GElB2pCeQWEk
	voYZqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s1h3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:44:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915c364ae3bso544534985a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744269; x=1783349069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5FtdrK07MUFWJmkkos6+LEbmAp4CQiwNSczwv1GzzE=;
        b=EwhY5G3fcUQf2Mf77j0S7AyYNjkcThAz1rn+XHzYZP5CnLdl7cTjHePLRXcIgtDh6Y
         EiSEEZezzpHkiHPY6mbAyGwZzTdOogPSX4tpxcOmsv4KfznseyjAstqjABZucyJboJ0B
         nt3DSlp6NJH5IXHJJEZuYKKNpqGDaPUlKdVe7V9sb5EikxY/yBDo2PI5gyTsFJfy77Wy
         PLG3cfslO3swEbEcC8mmw9T34iWIH1X8EOW1sLLHwxM1SxGp+5pGupn+z/UIJfr8RZWq
         lmNkiCOlBZjl7nASmJNu8K3zICBgNVdf86+uVls6ExxuXshoMY19ICotyMxnwSprt9i7
         yqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744269; x=1783349069;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5FtdrK07MUFWJmkkos6+LEbmAp4CQiwNSczwv1GzzE=;
        b=Lv9XtnSiib+Logy1faEe5pHpTWjn6/UAFHUdvmkCxiH8UsprIStDoynORy8h4OHUhz
         ciFtxENYrFfDPM76EXwUOcbzIKSBYBA9KWCcKPSpJ72J6cEagAZuAZJ2Byg3grk1swCV
         GzfqYuHCpruHElMBANBsi5wgjolHIEBZypXqcytnac5IndCpTKnn0Kz72+6ncci7WfOB
         OK8VSGZ7lj17dHL0jUxeioqRQVfeaxpou1z8kDq3sH8mlnfr5AvpSs6sJw0RoqKxuQZa
         I3rdG/uRRb+5jOaqXboCewtrdqloMAE+4DkGaVGzDhhQrULc7R+qY+NIjw21uce+jr3R
         cnzg==
X-Forwarded-Encrypted: i=1; AFNElJ+40NqHkJ8/n0kxbXNToyDHQ4DzFooYGj0NEogzeH85gO1G3g5EgOAo2OdAA7245H17qrrQrmpQEAzV@vger.kernel.org
X-Gm-Message-State: AOJu0YzJxoq1zWK+PiUTpT/XqEndONsPFoEc1RX7Tq+TS8tbzYaT4cYL
	JFQfKmQuEp1v0+2FCBscM2LHqdpGGHy2acCP7nDzFqH9vnB83PZVXxUQbjLjOJcTwwVIp/HEknD
	y9U/f2kk38Vlz5TUXYBNT3Akeb3UEpn/RVUKldQxbOZ0BhdJ87LWdHVE7KD7jprGT
X-Gm-Gg: AfdE7ckBZt0Kayl/5kBr2Ot8QABR/adVVpWJ9Pik6i9mVpPH5h15AgN1aUMD8FBD37m
	bfhnxAGA1TZHrw8aQHTlpRL/oTJ1JKhRpcwYTuM9hOFWJ2Y2uw7z5FLlUHjBm3ovW2mwUgdVmar
	7vR40ZcT1Qd+bgb6hvk419r9IlIv6YPD++ti7cvpAvh1KwrWMY+gXHvc+MK1w+9LJFRvSYwu2Xa
	OHYr2y9mhU8AGkPT21bfMmDT7qc2M2cK9IYnk0qygU2EYd1IFOAkIDrlIgip9RnL6EX460cDM2C
	ghib05mTd3Ynu9RuzrndT0sGi75X0ToAQwx2zlV/zDLZg+4hrgIytEuT1QlCLITNN4V9bZ3c2jt
	QGWY+sPavPur2a3SD0+79os1ISweWKRZvQW96jlIF
X-Received: by 2002:a05:620a:4450:b0:915:92bf:560f with SMTP id af79cd13be357-92e5f198c33mr161353785a.36.1782744264459;
        Mon, 29 Jun 2026 07:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4450:b0:915:92bf:560f with SMTP id af79cd13be357-92e5f198c33mr161349385a.36.1782744264071;
        Mon, 29 Jun 2026 07:44:24 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c291489sm238997765e9.2.2026.06.29.07.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:44:23 -0700 (PDT)
Message-ID: <a4481b5c-e7fc-4619-8a43-ac6ffb29e2c0@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:44:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm
 PMK7750
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX7zLvTmO7NnXT
 CgNSZScSCe4Mv4oGk/73NaOzp2MANWOGu5XkU6Da/yyJKV51zqc1cZoqbX9YMoU3s/tu0scWxVc
 uiKSjcwAqmoiO2VQEf9LletdSMNk0V4=
X-Proofpoint-ORIG-GUID: I4G0qr8veqLHySmq5O_3i391IPRksPBn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX3H3ANRiqDALt
 omNkgQ3OQQ2qa55HZVsinarOeH57CM0HnDRG57dud0Ba9z85XcQMWlqz1gf1m4+Cm4LabYvbxGI
 cMUB/V+r4/hyXcKjtqrEds3N3jbx1saI9Rho99Ob04WCNPvHcsYhEnWq2eS/Nf4j6d9UKyQmAJR
 yrF64auu/ShqDCVkTYtQ8IjP8Dqub/4MMTfPyVxdXO+ph1+EM+2fJNtYHov9YMzp7KEn7IvBUyF
 jH8to9IaGx94NrGm78qkZ6Cd++gvN6Avv7X7OwunKMNX1es7N0HQRMsV3v3DvcDCU6+HFtG0pCr
 wJgAOn0Bje/Y3IRfqiJDkN7x9NFfS/PjQFMrXRXP/K8TKsldq9RYrAGK3w8q2jx0HH/PrnYozre
 dbNvmwLzYzVx+d0B4YeQg/vQ4jwRyFsZg/CFJq3oZxFFzbkR3Rz0mWB5APLuAt5cwsh5qsSEwf8
 cy+BidhbILWXe6age5w==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a4284ce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QemOWJxP2g11TSFizz8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: I4G0qr8veqLHySmq5O_3i391IPRksPBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290122

On 12/06/2026 11:04, Krzysztof Kozlowski wrote:
> Document Qualcomm PMK7750 GPIO used with Eliza SoC.  PMIC is almost the
> same as PMK8550, thus compatible with it.
> 
> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v3:
> 1. Drop stale pmk7750 from main enum lisrt (the big one) - leftover of
>    previous version
> 
> Changes in v2:
> 1. Add fallback compatible.
> ---
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 151 +++++++++---------
>  1 file changed, 78 insertions(+), 73 deletions(-)


After some internal discussions, we concluded that it probably is the
same die as pmk8550, just fused differently, thus does not deserve
dedicated compatible and patch can be dropped.

Best regards,
Krzysztof
