Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E103CCA02
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536895; cv=none; b=IDuMcNWi7mzoshbmJhzxa3I0viFw40kC1P3q8//swrPpRdAnyJrR+oyPvLm4t1OMhtt/0P+MmGvJOyunH9/3+Mb1swuwCIwLHLL8kODMS8vaOPkTaMuPO8oxC2HOUJWDT/eWjgFCvgG/YcWZQeYDvYRvy3ksjwGgUw0h0sbxQdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536895; c=relaxed/simple;
	bh=XzO/Thq4u8jivFiauimxf1OAICu2UyepNkrMhTjGQvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mH0U0SNFRjUrLyOxlkKKqwY1sICG83pY19wDWWFm7V70iQB4vGcBoA2up2abmZRnHWfnpGHTqoqRv1u3tapWXQ1hzc3jAxag1G0xH0RCr/H3BtrjZz59ceTmyT7hU1J1k+UjGgfBKaER/A6xXU4SCDVkE5XesWpwlcPdNVywDu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuGHuX6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYD7hwuH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuGHuX6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYD7hwuH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K76QpY1712940
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vtmk5QDb7NpILPuyCS+NFxf+tPdClvCNWrRG5T+hRHc=; b=AuGHuX6fKEVuB0ju
	SHtGHoj+qPxPBXu/3mIetCPM0zyizgpy45J47NpNT0AEQGygb4uEHx8xNuR8WzqS
	/9WNH5Q2zVX9X5asTUuKYIkFV2Z9h0KTAPuteUIDWaJfiIUUmKC+j2vgLTb+r02x
	HvX1rEn8XR+6UNnQ7Q5z2O57K/k0bBeh0FpdpfGqbv976KunCRdhV+QNMVS522wL
	mTiYOhMgOmNXwiho2d41b5DdvPoGrcO3BJEr3X29UA1O/yTA3Bz94ddup/hPR3CT
	4am0Gf18acVOYQct4oUGUAy+QkBvQ5XPXIISCNNOmzldh3qA7zgIenesrBj7+TQe
	WsdI5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c0bc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:41:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51caa0b48ccso18578761cf.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784536892; x=1785141692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vtmk5QDb7NpILPuyCS+NFxf+tPdClvCNWrRG5T+hRHc=;
        b=GYD7hwuHhO4pnrEkGj6RqMV+UYN1dm6p3K1clEGfVh2AJZSQme0NLKFHXSDMYk6lpm
         ttZjFTjB4CR888l0j43GRUJqse8fpaC2xVYdk5th4ymHGgduQSk7RopE0yo8os5Di8Jn
         HpSXdqpGg2Q3tA8KXPyXRygYk8CldXG3VeTJDJT2ilvbKcGYfnbU7KpgP5vkOWY57ef2
         ewdZQJF1bElirOp13hF4+J6RVxJq6f4zX6DBy1yA7Fbuenkio0vOuK3dTJxiqEu/IO2l
         1QIR0radNgMCvLpwJbEDjVtVi+9moJsXJhlR0lBdeow4b7vZ8NaG33C2y7ddr4l4wHFi
         IeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536892; x=1785141692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vtmk5QDb7NpILPuyCS+NFxf+tPdClvCNWrRG5T+hRHc=;
        b=FFxWiL3XA26Xx8+osRq6pDbEbIcMDCGlwLuEtU3DWGXihjfCuF1AtQLOZJCnpE4pxL
         VPUkt1mMNeSiQ7aYjbSRZXpGxnyG0qCFPkh9Frx2Yry6zN32cqLTGM3+vpuctuiOiiGW
         78pz0tuJIiXRKEmFmftPf+h4nQ7fUmMFzeiaK9vRuU65I1W7LNzCUzh9USeHj80jkHUi
         ec7hX4UGZjfeJH16YO6U6U1JQnFynGCphM87ZlGam0BCE8FURnIZ19Zwu1IYNa1c/i5K
         z2MC7FRdgVY7hkNwxCWixSjg2Ytv95fGTeamyy4+yIViL5C1+NFKnJVI7wNH95q7pSof
         fyeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxGv0LfQvGNHrfrl8uoqXu96YiYLYsTqSJP5XSM0W3b3QGu7DX1zZHJLFDhJJsqgQpBLZUJQarAUSY@vger.kernel.org
X-Gm-Message-State: AOJu0YyFn9MnHzYtv/bhdnFCFBsBol24Qy8QnRdK2QT0inAgzmhRRdRJ
	yiP1oaj5BR/ngsQIb8BbhQ0jJugflaRp1vLCO1AKf/G0gmTzcNQJkCxmisVxoePrW6+LXdC4Un2
	bpqCzLgbnBTJ8Y7v4vUQQm7oPFKww83xYzW1aLs/j8i9aoIjuB0WdTKh0WZ/hg4fj
X-Gm-Gg: AfdE7cnB1chYL+KlqdVkna/b2+LEW+RUlS7eRbYun5V5EuoN6p+XRa1lVKUF2uQFjMa
	wb5ijPKMqTMm8bLs/KBYPDerHzJTGoBm42TCsKZBbTr4PIRb3WR5DCAG/v48Y2VVE2Q7lTsAAA3
	d4EKcppp8htWMczKBuLaRL+4+btKz9wwoEXrJ3mcd8tpWFVtuwQtbRqbTZTWCIUXSd/p3bWAgN9
	u+2WE1rIuLsNNGdNEdLUP586LvSTgOXKmfvR+dmNr38sqUaBucp+ss7Ii8fK06EEc6YAM+vyk/L
	iWvCsFLmqK15ShbL63T1tegOdGeu7+6oJSzfWtEH80Fi5PMHy6NCAr8OvN4UhixF4XU/HawkHmW
	C2jidAMaUM7NItOhav2hbH2f6
X-Received: by 2002:a05:622a:a993:10b0:51c:d8f:d77a with SMTP id d75a77b69052e-5213af574bdmr76331051cf.1.1784536892107;
        Mon, 20 Jul 2026 01:41:32 -0700 (PDT)
X-Received: by 2002:a05:622a:a993:10b0:51c:d8f:d77a with SMTP id d75a77b69052e-5213af574bdmr76330901cf.1.1784536891688;
        Mon, 20 Jul 2026 01:41:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fff5efasm4464224a12.26.2026.07.20.01.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:41:30 -0700 (PDT)
Message-ID: <c311efc3-7dbd-41aa-8b36-15afe85088bd@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:41:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add vbus-supply
 in Type-C connector
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260718-ginkgo-vbus-typec-v1-1-d5ed0aa6b78b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-ginkgo-vbus-typec-v1-1-d5ed0aa6b78b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5ddf3c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MzIpylJLnEosbEr0IxwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: F0Ab5Eskfgjozh6IpfuSBHXzV-DaPFUw
X-Proofpoint-ORIG-GUID: F0Ab5Eskfgjozh6IpfuSBHXzV-DaPFUw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NSBTYWx0ZWRfX/Au9zNih6cnY
 v3ZwlzY3ljtR4RRvUMNdLQ9lsni1DjWQVrEEF2r0/3ijTOoplF5NMJ9Q2fmkO5PPqxLvlLJszsY
 wC3LjoNPztb0dJaD5vwu99l/RcFxVuo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NSBTYWx0ZWRfX6n9isL6rRI7c
 NPCeVuUaJE04I+qzhBnP57RfWK4zm+seVFiwlgLiv9Oar27T1UT0PgInTodX+W08h77L9i3Nr6g
 nb0mCYZrNr7mLlpKO4hnvaep6z61xqvEM+dFmYikO3ynedwYpi9O46tbQYXAFhfs120GMv3vT1x
 WYSaTjg1hyGVNxXEEj2hGnCuPytbAVvl3iX4smvgcsSKBRqTHHtM0COQRscolt/K2Ji9hj7NHJF
 tQumJkPavQxH70ZptahNzZMvsgriZDbRUu0vj/PvryNahl/T5jZmy7/mnCcfRH8Pe9wdkmlXSJ5
 UTfVceaCQ43uu36VdJD8vatElKbEDsDLqxa7os5XMI6piN2QXRpnNF6zdZFN+UdTgHFYPYJkElw
 u/c/OZ1gunL+wZN3fvYVqb+mxLMcuJIa1RHQ7tV1aeVAhlAgTqrdXdX/9NzG0fhKddymmy8RfCb
 HVQlUrshTTCl82F/x7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200095

On 7/18/26 5:21 PM, Biswapriyo Nath wrote:
> VBUS supply property was moved from pmi632 typec node to USB-C connector.
> This fixes the following warning in kernel message.
> pmic@2:typec@1500: supply vdd-vbus not found, using dummy regulator
> 
> Fixes: c1da9374c3e0 ("arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property")
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
