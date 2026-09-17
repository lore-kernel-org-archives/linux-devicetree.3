Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A80501F53
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651165; cv=none; b=Pegbwnb613fDzQOFUkHoo9esGxO3kaTB111J5JJJ4okN8X7om1dUUnnRejQgZNNOU9VQ4+K1laeE+Y06GYNfrFPJzB8SqKbDGsdswbIemV+zJTEW2B0m8LRZw5gNmRJHO4Tuc9Sj6T2/uIDNFadPlrR99DCmIGOzHXmrIEXcLG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651165; c=relaxed/simple;
	bh=8j8skYM9nhkMoJZfGOrMaZuQ/ShJNnliNXSQOIg/41E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSmNyuGPeQCnkakNxNIZRDrjwG+MANcjv+WhnoNTJ6AMClydUsv+SBoL1eYYwnH/OrJlIO1sNvHuNUrX5U4fi7/IfYXGLKyz3qfpKTDz2hve0jr7ApjUZWzGYv0yBedNAbUqghMrkQvpqGm4AMOLbZzclfq6dpau4OFYxMzPPNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S68fAKnp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaI8nkzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S68fAKnp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaI8nkzA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZkKW746698
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ov+KJXLMSy+Y0RLLK5WRW/U/tz71r9xiy+wF4r5roMk=; b=S68fAKnpi4m8IcIp
	g7sve4/JUKXst/9RjdVy4l3iLwKN15TCqaHctSzPFVeTcZe58c/ygjZWkp6wCV1v
	bAKFe/au55Ht58EvfAdHdVfyCZgJji9dqkyt318ccx7ZoZ8yZsy899wDRgMSz0XM
	m4gDipUNy/WidmznJWFntcPwSiuMcu094i67eDirP2TWlmSF9tPMpigsRR0VhpfC
	/nOYHf2MK8uGr3k3h2sz1HbO9qbCEtoKDjXpSlBxPk+6fSsfmSiX6eqUnXOfCYCH
	jIHD+Vx9oZUJoad8/nN73iMnocCsvbnSaKhSRS8k4qs1t59kM5RGne8pyhqUVp50
	F0y4jA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra96v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:19:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso1498643a91.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789651163; x=1790255963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ov+KJXLMSy+Y0RLLK5WRW/U/tz71r9xiy+wF4r5roMk=;
        b=PaI8nkzAveLv1E4Js9fu03PUqxfR0rk5IG9FHvVAjOKuMuPfT8Jbou441VUosHabAt
         Ex6jdIXJ4uWmFaX0jR5/RZcCj5WO+r2iGR80mkQPqMg10AWcqJpUvLQoI6+49EL2nkzS
         /scD8sj52yHPksVnhAPkwtUl0F079u0L/5HIghuBNkXeJxPyfRAs04Gwn12J1mC9ATFs
         zVL9WYQuY/pP711xGuME7Spr0YR78jND1ABM1kkgKx16OCaiTNFgoIxgg9g5dhab6WUn
         h3xJ7o+r1tpBbWNo4rF9ef1XDJ+W0hA0VsOfb67tfng0ri1IVFUU4IQfob/h1OFCLaCQ
         S7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651163; x=1790255963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ov+KJXLMSy+Y0RLLK5WRW/U/tz71r9xiy+wF4r5roMk=;
        b=VX5rHFEeB+UZYpDbYboRGaV9uM3weQQOholOIqMKAsrXy4ro4eEL2UcyrwGhQ5BYj8
         bLjJP4XwXgbIgaM05WMPhp5IGhzo0MbHrK5NHwfqpy8RCW1w1sJJHKhPcRhqn4bSk9kM
         ql80ndEEgLila/I7x/61W7y67Q57LeV5H9gJQb841O2ZEK00QaWpv+x/I5JhShF8d9pw
         86RrdXJOci0o3IcAIY3/aafjuyLuPQ0EcgvUcCqkGAiJx5rxQl/ubtyo3442P1PH4fRE
         qeVmPZ/g4hD4YMmJ6XWKpjdM7jItuEGUEiTvSA3m4Jgp6nj9+SfjzT/7FLyE0tg2OWWf
         kKuQ==
X-Forwarded-Encrypted: i=1; AKwUvByxpC33CCU4nQ66B+LYKBCeCGds67LBxQGhsPkc8A1vVif/CrQSUiDllXbodqcN4gRTOZr+5BvEfxTe@vger.kernel.org
X-Gm-Message-State: AFuF++kMx0yGGg13x8bbzJsnHylgOtozMWLlGbmz97MfVivRoo+CJicd
	GcGN5DlT0I+KOSp3ny2qT8h5S6SWrZcm8Y0dlhLrX80ble9ZrOeIpMRVR10t29+h6A4vUCkn7IV
	Z6mIxr38LrlBgpLEjgZuDbByr1mCcTs6RnhqREoSyYFrvIbAQCg321UiF3CcqrEEl
X-Gm-Gg: AYBFou30Kf7NaeiTLqzCyM7vW52VvKikIzN9EQo0DjzY8ThIdcK4aM+3sRFLmBiAhGU
	cBRFInyzfiFiWmZ8rZIhSbjACf3lkLGj51vCZEDgNKChq5w9YLWwWQQFgS1qPT3aAciI8SewjdD
	SDiNn6Cwskp7mGpngSw4TcGrKCvSdU6Npp3Puphmh/XB0F3+46krhUxZZv/RTRwgKJ8EcWK2OJR
	vC4knZKRuApIJPMLJ/h6X689tVkk3WVi4WXXXE9/i1rn4S1SN9Bo2BuXh5RbBxNNK/JFr/+UJtE
	Zm21zi8H1JKpcSzYqBvhUNMILd+U+85NCBf5m+HMV8Fy8iHKwmkdDxHJhyM4/N3IHj56R6fSzZ3
	05meOSS6AJEDwSWNDi3HUopYh4lavGd8VP+o=
X-Received: by 2002:a17:90b:2c87:b0:39e:4c7e:f041 with SMTP id 98e67ed59e1d1-39e4c7efb13mr591061a91.30.1789651163118;
        Thu, 17 Sep 2026 06:19:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2c87:b0:39e:4c7e:f041 with SMTP id 98e67ed59e1d1-39e4c7efb13mr590981a91.30.1789651162511;
        Thu, 17 Sep 2026 06:19:22 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3c06423esm4238606a91.15.2026.09.17.06.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:19:22 -0700 (PDT)
Message-ID: <21bd8cca-78b7-4b36-ab4f-ea19cd6d9fde@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:49:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Talos Lyra EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-3-e3a76dc9e21c@oss.qualcomm.com>
 <5492ecfe-3c3b-4bc0-ae28-1eab79f6936c@oss.qualcomm.com>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <5492ecfe-3c3b-4bc0-ae28-1eab79f6936c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NyBTYWx0ZWRfX4eiZvpdNTA9z
 2/8Cab2ol/qO2d80YX65BcwZbd7Ki3jzTAwyZ8YgXSNN+jcKinIjEhEi4XfgHF3mD4vEc3w36cO
 PRr/XMMn0ivaD5jQc01DYuNSwYwpsiQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NyBTYWx0ZWRfX5hKcYOOXVc0U
 akOAmRoF+LpS6A6iXz7hA1oaVE8xtdu5zK+pMSV2IuLv+NeHJOoLWcra5a6G6Tt8OQomf/WBwUy
 KhAcg2xBtaS9EuWDPgOD5l6YNVHuxeTB1IpcQp51mK5kA5E41FovCYJ1CqC6KSDeYFo2q7IgaBE
 2yAMGH90G2pZdGUNWSgmQyH+wyX1E0HRm+hwB7S04DU6JU8HtudjKHNnGdYjA7XWtU4315sXukK
 UeiNlZ7YEc97dFQ9WRRj0rfI+csFkqv2JukJ6YmAa13e6P9mt0cWdpACC3EOL+pArHpcCXnIO6F
 FgW83cLTrg5ktfudnJrQmP4jJxKxyv5OuCrfc1HsJnMhHhL0XOF9Fe5PyvIKfPxcgEeLNUb1yir
 KjalUGffgFZ4STZAByTYrPGFljUAnxwp54vZzGXXNE2Uo7BeaR0oTL9WtZ+J5pTmu2dP0liigqE
 gC436uqO+Vckq//b+hA==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabe8dc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=oruCHivJPGXHP5yeABwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: jiefDkzaX-zJNThXturD7pPnK8oitxnX
X-Proofpoint-ORIG-GUID: jiefDkzaX-zJNThXturD7pPnK8oitxnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170187


On 9/2/2026 3:50 PM, Konrad Dybcio wrote:
> On 9/1/26 3:44 PM, Avaneesh Kumar Dwivedi wrote:
>> Add the device tree for the Talos Lyra EVK platform which combines
>> the Talos Lyra EVK SoM and Lyra carrier board.
>>
>> This device tree adds board-specific peripheral configuration on top
>> of the SoM, including:
> [...]
>
>> +&i2c5 {
>> +	clock-frequency = <100000>;
>> +	status = "okay";
> nit: Let's keep a \n before 'status' consistently
Acked, will fix in v2.
>
> Konrad
