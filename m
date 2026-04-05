Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347720D4FF
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775384660; cv=none; b=GqTQVRvzed1ailJ5z64Yp9umk+YXLwtOGnqGFCSxasMJBnQxFZr7cjS9YBHVgd7fkGjKh0XaW4TNAKi0S66dCxgvgGDsJPII0/xXX/smXDgjIX9WAfxSc9Jabw1CGVkEMY3cspMtDMvZVLYg/H+itNcohp5swM6N+vXkBu0xsUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775384660; c=relaxed/simple;
	bh=hrWbOHYPAA3iEPIZbUCU0iZ3rdIbPal/qxpSo3M8OtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERwx5mNGlFRQ13PBzAsB/XcuTJbANNBkPJgfZPz671/GSYTiZ5ZvVXAFWtGnzfNcI0QX9WTMbyo46nGzHOJWvr/zGeUrWfXLRikIHbS5Klyqm6cYK8pbw1RomOqk572LHxcxOP/+IXg3W3QSPGp7xDapz48g8LXA/6t/Mr0PBXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VcScc5Qg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SB9sEUwJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VcScc5Qg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SB9sEUwJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6351eOuZ2279462
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 10:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	viQzwuJ5JofOVV3fbU68hzJgpCE/ISX1x5wMcqxbC4I=; b=VcScc5QgC0KK7IHU
	td0sK9z4dM4glhZ1Uo+gLhyfbg72YeReusSwToK5otIQEirfEcR4zqarPWk5WnQv
	GMAWAqVPvRJZeP6xTLPXgKkJs/SOCzVFv6A2CHZp3R3z6V5w9f2VexbhRm0GlnEt
	MZx6DIIDdLq2sGBozs+nmGQ8dLeWvxN0hhbpvlGNxx0DEE7AVFJb+0fTZ/QPIVMr
	ve0QNdVFQLi44FHaC2qLFORYTliLrqGHjoN5CCLIgrRVFOOLv+aAOAXPPpgJfnlp
	tSfA4Z59fWUQCa60fHaGZ4f9jeAW8ENWeCezJUG6akAhRsQvckOhHe+9kXYM2lTx
	nxFbrA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd286p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 10:24:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c68a134df8so2946711eec.1
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 03:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775384657; x=1775989457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viQzwuJ5JofOVV3fbU68hzJgpCE/ISX1x5wMcqxbC4I=;
        b=SB9sEUwJty2l6H0VQj8ENS00YivexYp5QX24pMv1gD5+bYpaUkSpNIjfXtkTy9AgXj
         sAb8nbQ0QrD4wzEfcMRFmbE8hTWwHal0ola0qM6VGv33yw7iPA1ro/Zhrvxa3S9mxv52
         2dMLpFVBn8+WyBUL+dZk25K4RZvTQK4Axyx0AbnE35notaTdiJ1awwg6MFQfo5DgmFXN
         xXOFFyOQxFWY5sL3sMs3Qt5Sb6LZUj8QNFpTuoSkjlDamRSRCuXB4ppc1ueQQjfCsblo
         /+AZ7jnJ8tq9Gh5yjy8iAHvXY7ZzsfS++kOiK6FEJRYcJ0miDyvOpt8PXVShkLPVWVTS
         yWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775384657; x=1775989457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viQzwuJ5JofOVV3fbU68hzJgpCE/ISX1x5wMcqxbC4I=;
        b=ame0tVNcdiMzxvqBjwYkp5Xd8oQlkMhikFt0rq8gqQAb6SbR5EfCchfHB+YZycelfm
         j5YtIWZHyqlU1TfeT96mZM0vS4eeM/+RzxHamynA7btGaqaLcqYYE3iK/F7SngCtzhYw
         ynm585+j5tVV+VVLcZbVfNhEMGnaHJkzbMy8imo2FViCn7InPU723h1xmmRGxRw0OBvn
         OdMy1QD+KQ7P7CnUSQWe1lI7TQ0gUk5kPJRlgdLQuXGD/lkJbK1WrEcSDNnmpjHxbBbN
         8CMmY5N8cyjundvFvxvcnoyvjB7VVqMWRwGAbkdS15E05/kKs+3RzFUQp5ayo1oObs8M
         CTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU4fW0rL35Nw5+S6cYXgQAyVf4Z03Iyp1za/g570NplJlCpEWLu/K+gtjn6fmvaQB+8HfXyeVBe3lR@vger.kernel.org
X-Gm-Message-State: AOJu0YzJITlSTC1wK9GStZOTXS5b9AOEHdS/t3F5JaN3bO46uFUT0qLW
	WCq9zgpTsl8c2TKYbuhQqdZpMoFwLbnivBV4R7ZF+qQopVEUNW6sQr1WlcAwsnSRUEAvSN6CR94
	fb9NhN0hhLvdz0xW5pyfnCTrWA6Mdtc89GR2nehKOHdmznpMcw72ZcEGJRYetGwJr
X-Gm-Gg: AeBDieuEcrU+5dDnCmCu9qbhdyznnypIND8/MQM6CFCibwlVSNUUMtPYK8qh4avRivZ
	D9/mqAaj3dvmIhL4GEbBbIvwBTN1PNATLlsgkI2QvxV//htQLWsxF60hxHCRynQ8JL54TCABsFB
	KDRa7qvc0/V8uCr6znGU7gzBkO3SZ+POkl0kIf7sgiArKNSeyudrG7LE8NMn9v5tLqgqhnZFq0J
	+hrgejqqPaZ7y2yPiY40MIskISuy04MU8t3x0qqfnufP88kPaSlGCVgOlFju0ka10lpf4q0txyB
	fz8X03FXeN6keO1cyBJapyxKBkjcPJBKJnmeSFPA0DllBZVOQZ3p4CaW+1cHeqzjcdUYkMyo5W8
	lQyjeJauIjdCdEFwHirGn/+3M+phxKMFe576D2gA5yxwAuZWPEWd1xwls
X-Received: by 2002:a05:7300:6d05:b0:2ba:a60a:15e6 with SMTP id 5a478bee46e88-2cbfb994665mr4637768eec.16.1775384656825;
        Sun, 05 Apr 2026 03:24:16 -0700 (PDT)
X-Received: by 2002:a05:7300:6d05:b0:2ba:a60a:15e6 with SMTP id 5a478bee46e88-2cbfb994665mr4637739eec.16.1775384656208;
        Sun, 05 Apr 2026 03:24:16 -0700 (PDT)
Received: from [192.168.1.3] ([122.177.240.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cf2be19f85sm1116968eec.30.2026.04.05.03.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 03:24:15 -0700 (PDT)
Message-ID: <23755291-8b53-4926-899e-8d3d1d8ea91d@oss.qualcomm.com>
Date: Sun, 5 Apr 2026 15:54:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: dts: qcom: Few dtc W=1 warning fixes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2R44t7qspicVeV8YeKEPzWYuSNb5FtYw
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d23851 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=WwE2FERyN8QvVYJ+zedRYQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ICNLo5bXlKK3KSsG99YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDEwMyBTYWx0ZWRfXwisxZeGOJGXf
 3GCySwBwYIL86ZkwUf61oVlUXS/YrJx9czlW0beXV/fui5CQ6FvZu2LiyM4v5C2APRkoO0mS65/
 cAj/UQImgA7W0N9yAwV4nSwUKjxz2rl+vpecQokeTsxS7872BDEi2B1beuzYNVPK2AlPP1eEUKu
 rd5icdjhMvhXbtadFFDrLvwMxISRoHgY5DjF/l4tcPeQTlHFuio4IKbCgeQmbVcMQCtP07jCYON
 xRCvvM3TVg/d0pgiFs+sCBJsfAh1yqE1hyY/UlBYvoTNzwHPWE/MepNP3/zWJALxt/B+vFRf/yD
 1xSGWNG/oBWu2Z8baMVQDuIFMrOvxDtfNNsXgTEFV7NP6GUzGO2r0V1EJ1Ul7Drob3t/7Glhkur
 UjOyyAxhZSfFFRYuIki0gfd+phJPBv6eSun/JMNy/BxxU98VWDEt+7qVhTfWjtOSGfyEdssvA/U
 sy/JMF2tdTGRnRQg4vA==
X-Proofpoint-GUID: 2R44t7qspicVeV8YeKEPzWYuSNb5FtYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050103



On 4/4/2026 3:20 PM, Krzysztof Kozlowski wrote:
> Not marking stable as these do not have actual impact on user, but still
> warnings are not desired.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>        arm64: dts: qcom: glymur: Fix USB simple_bus_reg warning
>        arm64: dts: qcom: glymur: Fix cache and SRAM simple_bus_reg warnings
>        arm64: dts: qcom: glymur: Fix USB simple_bus_reg warnings

This third one must be "arm64: dts: qcom: ipq5424". I think its 
mistakenly written as glymur.

Regards,
Krishna,

>        arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg warning
>        arm64: dts: qcom: sdm845-mezzanine: Fix camss ports unit_address_vs_reg warning
> 
>   arch/arm64/boot/dts/qcom/glymur.dtsi                             | 6 +++---
>   arch/arm64/boot/dts/qcom/ipq5424.dtsi                            | 4 ++--
>   arch/arm64/boot/dts/qcom/sc8180x.dtsi                            | 2 +-
>   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 5 +++++
>   4 files changed, 11 insertions(+), 6 deletions(-)
> ---
> base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
> change-id: 20260404-dts-qcom-w-1-fixes-1a25bbd0519a
> 
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> 

