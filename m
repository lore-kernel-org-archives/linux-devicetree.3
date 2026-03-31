Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DB13D75C5
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944692; cv=none; b=ddem9/AoPOt0Jwegzw2Z7vaO2Ga31cBzg8A6CVuWjzKpjmX1BC+kzOxD4ZVhYEQNsoSEzi4z57D3K9S1V5rzOKDVkdkgORNlbIRsJxHfXX1WmV6oA535x7b69Ytuay2/ZKLH7AoqcmKGnIzb+WceIZcSunUb1loRJ2wVD5s8WFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944692; c=relaxed/simple;
	bh=egz/YBysPIT/DR8xazNLX/IWZeq7/2xoVdKwriG25yI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acve+wO0tDh/3QUdYer6LArLgLQ3zWuxCeiK2YASiyY//VOfjHGesMfmBYOdJtb62/K1BbIpV4siau2CQOPJvbhCPU5FdPbZs6OROgoXlO2ENB1m6wuR/yVz4X666KC+pZ5G8ZFtkTf7bULbAIIKtXwrk5WGUlX/WWS+7yjQZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4jkQKek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=izlp8XG3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4jkQKek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="izlp8XG3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4S8lZ4053435
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ya9ss3qs88Jv2C6GaxnSZ4/OaIyRrKMXJp2kiZJl0I8=; b=k4jkQKek5GQxWpBR
	/P10y3kb0jNU/u8YAYxTvOTJyM3brSMsExKqMikRpna4SuEmd+G3i5FKLJfxrkYg
	A0sFO/9+mcCsUxvprBhidexfwwaM1/UU8ANTm7f1G5koOEZw6nm+1AE2ruhWJMxa
	2hG6COAEYEenX4SVYKZmtUhpOTdUYn0QjJCNykZk3AEmJNVoIFoVqPNWwP0lZOT7
	AjRrZiBGkTWF02GdOpwXheSvHkCuVqchCunCmNuUEjoLv19i+ilK4xqIKhErdAYf
	eTTm1aFvHpAcMWTZrozSsRPrpV8WobCPK3oD6d3ZXXjWeJv1D3BdxLjDO/EgNLO5
	LuVkqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3agwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:11:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso185852885a.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 01:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774944690; x=1775549490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ya9ss3qs88Jv2C6GaxnSZ4/OaIyRrKMXJp2kiZJl0I8=;
        b=izlp8XG3C8jVBvr0WLYQs/xIhG5YGsKsGLh16mWNh5IoupunM3/LJjIa+PPktvAuaT
         XcV6sJpy+7dTkKMPNitsdAHPGzv4U+ZfRV5+xtlazwLsYXApQ6E3UmYt3iNt4kd+pQRC
         i0VRR4pagrb4wCjuRVyC22G6nYaOqkAl6MF1L/O9EN+b2jDStJySdtzYaJdBMediPF4l
         gAO4Z2KbClX4Gbu8F97JDYjGXtFMzoApivEOJVp3raO4VtmnBukKONZuQjWeFliPMCU/
         7THeDw3LPilKsVkE7VsEX6V3jZzc1oCiHwHipK7WirJNGoJRQfSeumYOw7FKg6ZDMbjA
         bQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944690; x=1775549490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ya9ss3qs88Jv2C6GaxnSZ4/OaIyRrKMXJp2kiZJl0I8=;
        b=lIuo7FMvXIG+UW8SeMuvqu8QhVaWUUmYW+uEEEQBsyqAfF/rYpKzXoPZvxiAP02tTi
         juyvGUe6aA9j8DVyp/eAFj2MOHayFLRWAE78BK7e0FBGZgxR/D3fKPkDadAX4c0s75FO
         IOtelGOtmgmrLcs/EQ89YRyclD27ndV/jnMdOfM9v7lPayqs4T8C9sfxFDeQ8Hssa39M
         joc96KR+XRj2rKTZ0+7IKkZirHm8DuajXnoq/LDTbEotMUY7f3cImTo2QQ7USdLSMWaT
         8VS5EOphh8+qHNGY9GdJdmLccsBkfdI1U/9DjZjJFwWAYyPxpWN4a1L9jrNP1DkXdJjy
         vzlw==
X-Forwarded-Encrypted: i=1; AJvYcCXdYRbNk4hKrcTjvL4ghKTqGfr2vW2S81E1INgGviVoejT0dwH7KrQch6dGZWyQlnxhFVBtLnYR3NFE@vger.kernel.org
X-Gm-Message-State: AOJu0YwOuQpEfD6i1TmGud+t0yemNvg4y2e5g25RxsfQBSUfHJJiLNU2
	CYuGe7jrFy9nDJ23/fcohmGy608DihwVkXzRXuZ+UhOJt9ORVx3tOIjke5dpVXn+rGoEWX8EWxJ
	mxCWp1NEBvvWfDG6EditYScwZUK/2Hb2FFjM5y8ytAQ0JH8mC8Krcl8C+KSh2tE1W
X-Gm-Gg: ATEYQzwk714dCR+iuZWFzrdduiGaeE8Bd4lz7m4FQZostTDLice20bl6uBx/JS7lJCh
	kLEKmg/1zK9TwO7+wfvoFmqZP6cFtNgaM3YQSYtYtYZJ58pkUw0m43b6/P8chJPB6dK2oLa/dWh
	+Uf53bBBP6o9eBysKhCHigElB54GbPvcnTFYvlyl5zUMZwlnEgGYum+7njjnWLJ1b0PM3bKnDtv
	2Bnc1W+0itXHxryGyWWO4/iAfHmdj6yAH7MQMkktCplUXczh4WgbXmq76FqJjtraShRqzMCc76E
	uhs85vhRY3rjOcyWzlaK7y20FX0YM16dDvBXBk4UGNYr6iMRjUM3FSV0LuNwrztv9Ej/YONkDLC
	tgsHodNXiSTfz2UnVP9Z4bvJvhzZAKfsGC5jMPJk5lR7QbJjztxEq7+uTT1R4/1c7UahmcXmE8M
	XSZNI=
X-Received: by 2002:a05:620a:1a0e:b0:8cd:86a2:340c with SMTP id af79cd13be357-8d01c613499mr1640091985a.1.1774944689995;
        Tue, 31 Mar 2026 01:11:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0e:b0:8cd:86a2:340c with SMTP id af79cd13be357-8d01c613499mr1640088985a.1.1774944689520;
        Tue, 31 Mar 2026 01:11:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76081af8sm3354264a12.27.2026.03.31.01.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:11:26 -0700 (PDT)
Message-ID: <393c666c-e182-44d7-a706-7e44ddf28d51@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:11:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
References: <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
 <YGrwXwjIapZW_V-EEG8mk_JtJLxrTU5MYUD26CjvLYIgig9JU0zXq8UIpB_zxYL2Qxq_ZpHc02YfSBkVhDvJug==@protonmail.internalid>
 <4hasliun3wkook2pvfkntjlzs7elu67ine5q7nd7ptjthx5qvw@rntvb7lnajpc>
 <96d3bb35-3fae-47e4-b484-1a37f2f41b43@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <96d3bb35-3fae-47e4-b484-1a37f2f41b43@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cb81b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=otHzuWimHOfoUKKqOskA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: _OfxF_A4GQylLE5_wCdDmZNmLR45WavR
X-Proofpoint-GUID: _OfxF_A4GQylLE5_wCdDmZNmLR45WavR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NyBTYWx0ZWRfX16XvJjCelEM4
 oKyQK7MiB1nqCeMJxpZXCG1XUUwGyRNAq7sUemYW1qvnhT7AB9ul+EkoWS1b9uy20cnddl1pqno
 pok87g9PIn8JYcEEYLC33AmWOvvhNm6tIFfXMQ8PRRhZNFBbEJ0XGHPyGrtkT7PCWZjSWSSJ9MI
 6CzCqEzbZBYRlYbmkwX2ktOrwXNmkzY64+SGNfYFehZk6dhmTgeLRCTH9eNKWZ6ClRx4rizq+ZJ
 /+/Axl69MLPw5lCsCKT/CeLzEkWnAbGO4ONYOFW+aiVqxOzbuqq1Q9WRT8wKJeg5l7G+G/JkQ2O
 ah35kub608GUfF14dArIejxRBuE8d0YdlRo3aHvOboFS0QrjhPS/tsBiGO0/i56Mk1I6XfnUhVo
 zkjJW0me6PCos2ggqt7DOtBYqWE1C+J527X/MoDl9JpTHG+B6M9nHKXfzOtTXYtEATDMsxjgyxb
 M/4MvUe0dpKEGlZYPIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310077

On 3/31/26 12:51 AM, Bryan O'Donoghue wrote:
> On 30/03/2026 19:55, Dmitry Baryshkov wrote:
>> This sounds like the most horrible idea: letting userspace directly
>> program any registers in a way that is not visible to the kernel.
> 
> No I'm wondering if there is a way to construct the basic format in user-space so it doesn't need to be re-interpreted stuffed/unstuffed.
> 
> As mentioned I believe there is a defunct qcom project which did/does just that, not sure why that hasn't been investigated/developed.

I believe this isn't a great idea since the format will at one point be
platform-dependent (I think it may be already) and one will have to teach
_all_ of the userspace implementations about all of these specifics

Unless I'm missing the bigger picture, we're not talking about super
large amounts of data that would need to be slightly shuffled around

Konrad
