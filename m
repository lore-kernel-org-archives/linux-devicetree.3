Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C63D41168D
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824521; cv=none; b=msiw3HXmzHo65HSIeGwaYNUWyCpNgnlU13ZqeVm6/FjPxMY+c85MzxqVKplZA8fxHBZn+cCmmVsAiNdmsimB77ONO6fsw/yopNn6BK4WOy2WUXXafq6kf8CNdwaIvJgno769+UXIOssXepHio+vFmT5ec16QvKO15ixIcemBA/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824521; c=relaxed/simple;
	bh=XisiafNa8TNxUf6HIvVJOnurbDpa5s7FfbLbsSlbCQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PrBfY/kHwQwCASaIoSKbO/xIQWGf4+SO9T68HmEyeGDk1n5aGPOy5BGgqGhPYzdgxxqdFIgwzOQ1aSQan2LN0xPPi+jF/yDvaadzdXS/i/B3fK/piV5rIanYUua8tWgC1Pt+oJH7bj26b+AslvhNWkufoirgxaNoKrKB6ipFTdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3ipeDtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYLNd7Ek; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3ipeDtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYLNd7Ek"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mp0p1611513
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkaC2ruG6J8fgfMzShDr6/Ismy8R8ymEnpnKKfiD4oM=; b=Z3ipeDtp/dzVm5g3
	Rc66h/oANnogMqvIAa5bDs8bzOV/Bt72zsDTgYTfA7IA5uuHFgU4RvJ7GpAwgR2G
	Dboqs40UBavLWrMi1eikLSTci0PPalFjXL57Ppjgo8IA5oLmhxd/4vS6sR15kd5x
	cLb7PIBF2A1NaRFS2LKy5vJ3KVGqDD5qZBvBJtTLmk9tzqG8YEus5wv1owfZyF+j
	GiqV7LM10sTHr6IkMV1LC9h3y4pUtyMn4vykzUAYwhwJ2AukP8v3i5aRnPQOgjHP
	IWiWq9Gye024+uleDmiu0Qptjryj+kxovx1t5Fn1LF+mbrbGgNwlPn/Pj2jr4atQ
	geWL4g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gtqpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:01:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737a6ec882fso104520137.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824518; x=1783429318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkaC2ruG6J8fgfMzShDr6/Ismy8R8ymEnpnKKfiD4oM=;
        b=OYLNd7Ek+ZvC5zp3OqXcgwwifHh59U3f+LrcP7eNUifUUxnBTmZPs3hhq2+Qril00P
         c55gUCwlBDVFNV8uBOBPqeVcxvPsr+3iJmd0hKV0mAjvN98Qk5vh5c+YmJVBXahjtbUl
         cJaMWTstjgC5BFIqCe7rIE0FYuNtXuB+Y2I50Sp8bxXfqNssthbNHhXwG0sE8kvUHxii
         BWJOxNzZJRskwONoRYTdTNph+Aw43fQbNaixcZNnPNmaVaJjWKyTL8niOBelp/MJfsew
         IDRrlXukpyHJUqoP2F19RtAN7d8WOnWv/+XAkIKzGMaO0m+t9vhzvLPOEEa2rkY80ecI
         BSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824518; x=1783429318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkaC2ruG6J8fgfMzShDr6/Ismy8R8ymEnpnKKfiD4oM=;
        b=nyH1FhbhD60EgjGqAd/z328h1PQW9IwZjPtCi3v/hK+sYIO8Yio2hozdbiQ3UK6Nl/
         o3aFiuzYOXrP+lwI5TkDNiJyapmH+EbwlxQjO2pEAacsE8aFyBYLs7jrN50YL7vi3d+G
         RJJ2D2lmG83aQ/mUXeMUjH3GcOIko8+zGjPHI1z5Sl2bjLjKTBZ/O0Usx8nu8Rv0WbDV
         bCZ6ykGAxgorseehXzkOP4Leew9AkdoZkhf38ZTtki1zzClWomMYa3kGnkUTKzTyX8fP
         t1xJooBkC7GV+093OrYxI9SlDRYFRo9GTuepBEzGtYBprAC0eB6O7Y7hFplyEOCZwkNC
         hxOg==
X-Forwarded-Encrypted: i=1; AHgh+Rr35oQtGrwUaec6CuH8z8gnVL8XJfSzMS70RdYSyRMg8rVXvPeV8lCVKmB6a+VVTmuSIxHq4tx6Y77/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3D1tepFf+XhvufcmWuXCeZ1jrLnB0le1RvX3G/6iSOYMupVmt
	qGaepdDM/8xG+Qk1yLOGlVHK9WdUp6xqlha/Af2fYgMzm3OvPxDOiczyOZ60ZZ+6nwv/NF12U9Z
	qGAChsOLRTgs7Fy62z09p242GaT5u4vjHFOj2kcNLTxcd95uGtI1ciLTq/yJmbGZV
X-Gm-Gg: AfdE7cku/e1EP24BSwdKA8O2j44UV/+kEDAb/PRFCWEFH7u1z00q9gnrLmqP08F+G/j
	2Yc81nYs52QW0001CIbzNDVbqkbvKO3+iEpUcuLavxeTV3py1oEMl9OnSCCJfW54qUg7qNXn0+r
	YbGR0Xw2CS4hgTnAgvcJg8YgZ6doACXwwAvzmXpi+nd1euyeo3mjOfthUmx6+hx/Ow37Wmwj4EU
	3U0kphUn2HB/02gTesUtSxKvKnSJz6C352uJRCTxWxiIA/doQGQPu+tgNSLp7c7coCvj5dzyy3j
	mJoefKXZGWhFYP1IIO2g9q7so1G9b6Vj4lqClnJSmNgayk6JfeobPgJJ/uLvuMUumJmX7pyCIAH
	F2lIeQelBmS5UlzeqUs8JsTN3+2FnB8//5sc=
X-Received: by 2002:a05:6102:8016:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73a363e173bmr562191137.1.1782824517158;
        Tue, 30 Jun 2026 06:01:57 -0700 (PDT)
X-Received: by 2002:a05:6102:8016:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73a363e173bmr560994137.1.1782824509605;
        Tue, 30 Jun 2026 06:01:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f5215dsm118931066b.52.2026.06.30.06.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:01:48 -0700 (PDT)
Message-ID: <28bf1937-55d6-4ca5-a572-3bc7d0958608@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:01:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] remoteproc: qcom_q6v5_mss: Use mss as regulator for
 MSM8953
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-3-6098dc997d66@mainlining.org>
 <35e8f654-214d-4e8b-843f-87fa8cc1a782@oss.qualcomm.com>
 <C5AF7872-093B-4039-9F3A-72BF855BB3D1@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <C5AF7872-093B-4039-9F3A-72BF855BB3D1@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMSBTYWx0ZWRfX/kY9+iCkSvos
 9HCFP0K5wgXHKPnPzqtkZ/uwKYloFY9NrKPFZ63gU2O9QGXVw43ghpnFhB0rfuy1/ehQf3m4/E9
 iukP0JOJLOAb7bMrm5BHWNBGZh07qVs=
X-Proofpoint-ORIG-GUID: wWgbXyjzIKRif18_BvqDFErME3re0Bho
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43be46 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=2LMQYQElpYtautYIfiIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMSBTYWx0ZWRfX59CrCVhfWYNw
 BoAN1V82C2F1xpvBPLM7J36yeCEc+PCCx9CtD3FlNnmV25BsBmT2I5iG1amCwLQNl+WdaH3HqZN
 iATM/6bgYJa2DLyKzCqsXntus2r19xo5lrIvNSCgen6nGnLm615cQVfSWNYX5kHmZILcmf6wX9t
 qBkE6x92tcnLMKjVhBhlGSfsHE0nWDzDPUkIFusp7oPxa43dVKs+hN7xln6gYlhbFc5Sfg9yKtZ
 pAR8z3ql7o1ahLv4mla2BgXkGLu4Rz1udQ+oy90T6MM69F/cp8cw/Pw+wlVgU3o0Ta26qRsyj1Y
 VQdsJGpk3eV93tTEQLFhThaCpvZylBqYikFK2BVb7rDCsfKFTSTILVsCX1r1YRPERKTKv8qYJxF
 04+7xDZFTTQl3ucApof4ZCJpJuQbyiAaC0lFDtUQCC+TyfTZJLMBLNg4dchzPcQ79PJja//PH+u
 HyuqEnodbl32h3uKcKQ==
X-Proofpoint-GUID: wWgbXyjzIKRif18_BvqDFErME3re0Bho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300121

On 6/4/26 2:33 PM, Barnabás Czémán wrote:
> 
> 
> On 16 April 2026 15:32:25 CEST, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 3/27/26 9:11 PM, Barnabás Czémán wrote:
>>> MSM8953 MSS is using mss-supply as regulator what is usually pm8953_s1.
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>>  drivers/remoteproc/qcom_q6v5_mss.c | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>>> index 4e9eb5bd11fa..86edd826ede8 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>> @@ -2705,6 +2705,14 @@ static const struct rproc_hexagon_res msm8953_mss = {
>>>  		},
>>>  		{}
>>>  	},
>>> +	.active_supply = (struct qcom_mss_reg_res[]) {
>>> +		{
>>> +			.supply = "mss",
>>> +			.uV = 1050000,
>>> +			.uA = 100000,
>>
>> I don't know if it's a typo, but msm8953-regulator.dtsi on msm-3.18
>> suggests one more zero
> I do not see any load values there only init-voltage what have six zeros.

Yes, you're right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
