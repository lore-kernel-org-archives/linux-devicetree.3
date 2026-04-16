Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AA63D34B7
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347384; cv=none; b=YiCMXPhgxXnOu8e3vQN7ngD5O0DdEhgDSs8qZpPjAnyrkMOwSYlM7gYrnZHVyN3v7dCKVCMtcUCVlrsl+bTG3ONcMy4sn8U1OiQahxnOD1dAj/WJhe5CuA1LVyU51qM2jrFMWpfXGPEtsAZLZnQWFThKFort2QZThhdsp1Tck9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347384; c=relaxed/simple;
	bh=ZB8QHmnI16kH/a/B0OkrUHPxKGpdp/pz4wFFK2+YkVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRDeF/xbUIqb6B0dWi6C/NvSOW4szzNIOQp/3MVEPNNJjmQ+TbvTpd1YWc7ldNwRNlBEppuR3EZY7CumaTdxM/Mu02KkBxgFfSVaSwGFkVJZw2wA3Hliw1/UOOwBu9rPYjKWx1cFkgBiXqDkG7h0wvyfMFznBrvSqJB4ma7xbaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX+3Rd1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brDEbeOA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX+3Rd1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brDEbeOA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GC2Dpo1668243
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vp/HXPaQ0G51D+8PCdkwYaxrgtFLEn2Rl+hEB4QvY6Q=; b=CX+3Rd1EK0MuNj4w
	BggEtQAKJJnIgZ+/4QVS4LLC/WbZ8aG6cAK23Q4srqu0JTk6m09enKkIHDVFWkfF
	LGG+TeIqR8ksAJWrzxhzSzfNHCGymHB04xICUdkqZjaHjcHK5X+mYMq1eIHgP27P
	UDnvHUbLybmPFkDilyMI594rUj0FUApxZABF0aPQFmFme6ykD0dX1+KXzFU2cWmf
	Z6lJY+z5wRA/NnLS4NO/VZ8NfogMTUFvKdV9K5/+YN0CmPAUikowQSDxCtxzYfgm
	3dNWnlrhqVI2mwN+j7kGw7UftHDzFvTtvQ4uhpJcCKD3R3O20CdKkqgCKW8O5gzP
	PdDMzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd91jg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:49:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso200915785a.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776347380; x=1776952180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vp/HXPaQ0G51D+8PCdkwYaxrgtFLEn2Rl+hEB4QvY6Q=;
        b=brDEbeOAHpaeZZi920kD7hnYLcanm77QXTKpdjAm5JMd93TZUtoNeS1UnhwpCxz5b0
         D6i64cshLx1QDIGOhKjvfStXHBB8aXfCVQQ1J5LdqQBeomUADakbGfMWrAELRKp/fZIw
         uEKYv5120NySipu39CIjbgEWoIY1PZkWetqJiz7fv8ZAM4t1E2csEyj2HrwbC3dlBWeQ
         4pjE2MNoSZnXJnamJwd33SQPzxFqqVNiXrzdNF2ZNzk7EVhgqV+ygzT9Y4BmtBWYrZKZ
         s+9vVGSoMvlKLskrii28+sFLYYIIfNjl2W642yFQNGW1csyZcGQlo2zvmNo31oBwMH5Y
         DyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347380; x=1776952180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vp/HXPaQ0G51D+8PCdkwYaxrgtFLEn2Rl+hEB4QvY6Q=;
        b=Yp4eXaaGvn6krdwVoVQGoz6J9mTAE3vKU053+kENOsiIKsZtdhNrxHcSPyP6sLrPOM
         YA6y+zUE7bjGZgQzzF3IaxdQb4/9Rf91HW5mu2XFvEqTbUci2iBqDFj43Ff31qDBq/XG
         LMAqIqSBSJBKO6jRGurkPb07fjagWr6HnRbDmWCoFMKaTV2tmV2KV3ozsjfGImP8ENud
         CvTbgu0zpy4jFFkxWt7pTtbVYfR5u/qlPfvrq1KUfjhIX9QxcUpfAzEXdo3j7tThfzeZ
         M1Ai9rqTPylMlNshPFTLaR/zIa1neminUo2S0TaKrq6J78Sh1ifOlQYM3SshBjZN2ZnQ
         Xk0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8QrXgPhn72JA0AfYvLZE5BNKizXSinLqX340qlOJ4T2rwSCiVbjQJtz3CjbYNlmgooXW4qUP9n0d2E@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6f9kjWKi7cKb0oIp1BCL4LG5fTekFtkbHBM+xwfxhcHYq8el4
	Xne1UUXr5mj8os4BCfmoYi+waqTsUuerajmXD67YwFq23J7kpN7JIGqC28doeAu4YEm4Dug8c4W
	1rJr/p58v9GJIEerhHmjTkuaZLbVXorfgu41AcvnT3d4i1v/Uak+osB3P9SOpMX+G
X-Gm-Gg: AeBDietq9QSCWioUQRMQPsH9W1dqMeaIQsCyGmLQZrt25R+L4s1BDjFZwae+TCHwl+D
	N2WBcTA/oyH5/aIHZvUfVtKLgS1Qn+BTDHXjrdUCnGdZocijIuKzX1agr7FNqgpoNfxauGq+3gt
	iULGzPovL0jjRbY12DhrYZkPlBGlydTcXHml29hI80lFTn59TV3Mt+7bzZom1+7H/Itvm4JR4Wb
	dt4XcRLNNWkw4kQEeFtIPY0cvfmH1oDI/0lyp7KnuBoxWjL6E0FEcUj0PGMF4idx/8V6MC08Td5
	yumoqAAn4rA1xwHRXARd0bI8u7eSbQsVdz3SqiNv91ZVzHNIGBz+UYnWUBvJdAK+XSEoHaYEGF1
	6hgUbC69PJptRn2WLHDi7eIJYDByIzRbAVIDfQ8UlxN2Eh8J7dPTUBIVSnuSh9G+3oiFMj31n0l
	GjnOfD3o2Jco4QYw==
X-Received: by 2002:a05:620a:2a07:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e6324d73a9mr261649185a.1.1776347379624;
        Thu, 16 Apr 2026 06:49:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e6324d73a9mr261645685a.1.1776347379181;
        Thu, 16 Apr 2026 06:49:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d789a9sm1348465a12.3.2026.04.16.06.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:49:37 -0700 (PDT)
Message-ID: <00e40481-9e62-437e-ac75-a04594ef6879@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:49:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
 <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
 <caa589af-f026-4664-8fb9-6b23b0e087f9@oss.qualcomm.com>
 <71751331-651d-43aa-b30f-135cc62e8915@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <71751331-651d-43aa-b30f-135cc62e8915@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzMiBTYWx0ZWRfX7X6a0LdcRgOr
 /0jfckpYWR/Z1tAGubhbaCxJR+kBZk/ZROvdLdInEgv6/U4VEYibd2/xFImxtNIOuK/jHWtVq3X
 UlOrZ2D2qC7KneVF+ZtTkw00tas47XGtcK36r0mPnSyAUaZlLCY04ShSq3lVoJDj1voI4rkj1wf
 9gIsarqESNLisqc0ZD81C86h4/eSR2UmIg/9cd6MbjczC0OQ0a49QY7Xo045l7dD5O1mPSs7EtE
 OpL3nzX3N89Mc7Wy4G3LGCEcO1PNC2UbhkFzpDaoc2x9rwIlpn4ckzxS4YSBnsQTpsd0Q8tXiEq
 kO/BSE9h07mM8hFFPvGlGenlzgV1a42vmeucosINwCicRjzq8bgr1/4KouGcvtnPPiEehd4P04W
 V67nEoBq95QaFUdak9KC7GGqsA7qj1vi5n0FjPo1Z+cgPCT7D+ezfFF23CCk/u67jcJrUX00syU
 L4R9iKFMi8RCQdmgBew==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0e8f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=wxLWbCv9AAAA:8 a=QgWWWv2VTRXgYXpbdksA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: HuwElrGvPN4gByndEljpiTk6Y88TKgpQ
X-Proofpoint-ORIG-GUID: HuwElrGvPN4gByndEljpiTk6Y88TKgpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160132

On 4/15/26 5:20 PM, Antony Kurniawan Soemardi wrote:
> On 4/14/2026 3:07 PM, Konrad Dybcio wrote:
>> On 4/14/26 10:06 AM, Konrad Dybcio wrote:
>>> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
>>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>>>
>>>> msm8960 uses the same clock descriptor as apq8064 but lacked the
>>>
>>> This doesn't quite seem to be the case, some fields differ and
>>> apq8064 additionally has:
>>>
>>> QCOM_RPM_PM8821_SMPS1
>>> QCOM_RPM_PM8821_SMPS2
>>> QCOM_RPM_PM8821_LDO1
>>> QCOM_RPM_VDDMIN_GPIO
>>
>> Ah hmm, the MFD driver seems to provide *all* RPM resources..
> 
> What I meant by "clock descriptor" in the commit message was
> specifically the subset corresponding to RPM managed clocks. From what I
> can tell based on downstream code, msm8960 and apq8064 seem to share the
> same set of RPM clocks, even though the overall resource lists differ.
> 
> Is that understanding correct?

If that's struct msm_rpm_map_data on msm-3.x, then I see that 8x60 has:

+MSM_RPM_MAP(PLL_4, PLL_4, 1),
+MSM_RPM_MAP(SMI_CLK, SMI_CLK, 1),

While 8960 has:
-MSM_RPM_MAP(QDSS_CLK, QDSS_CLK, 1),

Konrad
