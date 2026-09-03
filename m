Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7DD40928C
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 10:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432102; cv=none; b=LwJaN+pU2a8ZJYbtGpxifbnkZ21rBGB1Hj4chHA4RYxab2/sSK0bIeVqt3pkhMghyGCKiRahiLjJ0IMRWf3UR7jKUQWDDFgGLbYo1VvG1socOruwivZV15WS25ND2CYZQyYUAszEaEOb6nhCoMN2xADd43m1ziQBF46JuthSD4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432102; c=relaxed/simple;
	bh=68B3t64SOxXUwsut1P/YJ0Xpd4G3o9FiApHDctPM+z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlNZW4Cm7uEZvDhpgkAzWXihGcEid6vxxUSxaF8zD3g0Qp21qA0Y9BG1C7z00K+BTGJCIB0s9sReNXJPZNVut+XYzvYOtxUz44PLcetoPLvl/QREOr6IS3As1nQhopE/7f3HTv+dSk3NyPF0HMBcszFWj+ezG7bGIABZC13a4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1b8yLeI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6O0sTOi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1b8yLeI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6O0sTOi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHBPq440196
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 10:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6nUWKkYtFk4ALnCq1etgf1ghLbMCyTc495nhaOBwYw=; b=e1b8yLeIQuggebWD
	YqpVSGXwLusCv8DoR037i7QpLbf8cAhtvCLL8U57FMi5NI4efMWXGdgL6wq850TY
	g9aofQ5CZHR8Ve7G0V+oAYPZ0AduUUsQ4GQ8O1EtuC4VBTnbITCzulp3hR6PUCdK
	4BSBykN3xa/GR1fjMLj/KOfNkuwvT/CjMZmRgRC2qTCZLJcI+RyLjJCZ2mWUM/AS
	YYR1+3RxzXKIDsxkeGDuazI3fCi/JfEw1EhOju1nAhyMJ1kwRmb2Oxl6dvs+qRBI
	CHtMbfymMbCqkWhiPG+tn+l5lV0f457vo/6i9tWtsxwdiTueqiiIFhQH0e9aSYwu
	l27Crg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p7060d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 10:41:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939062ecda9so325505985a.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788432098; x=1789036898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G6nUWKkYtFk4ALnCq1etgf1ghLbMCyTc495nhaOBwYw=;
        b=R6O0sTOiD5u6K2HH2vtdCOk4DG+TO+mHyFI79LkFw6YqsWZvyqmhzIfUObeSDwp438
         DhN8HDa46y/gexZ4ttGiXNoLcoEh/PSyauOtr+FjLXc7NGieqAnbLLHpahb07n7WPoNU
         EcL+4R8qGGROmSbyV9ch/BZW7HJmFqJIdBdUcQ7/tG8F9yeQ80swLFjV7RSvNrt+GpPG
         TEa9nSpmY9fg/oP4EdgQYDsnglESckfgvgyonxaui560lhHNsUdWES0ttIPJ2ieiw4Hi
         lHWehVS4vjxWIPiCebhvGn3NRAn80dSMyprEmWOrGlZKAr4VM6es8zSdQZBKz0H0JT7Y
         WT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432098; x=1789036898;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6nUWKkYtFk4ALnCq1etgf1ghLbMCyTc495nhaOBwYw=;
        b=hLwNnd/5RBEqMjhBfs4dP4PTDPwc7r0vKOKP1G4JL25RtlTGX+4eJKhlqVTAf/fcXU
         DWXT3FG0m6VgrduWqrnK4tC6j39dgsWHSOBIzdNwbjms/sX1VlXnpK9x+7TbpwfLMp+J
         FQpVieH1InI4b+g0GEFikvUInnRO6J4T3tGwiv7LspvVVdxSYE+uNSvBuc3c3kAV7RG4
         gb6jGwW6adp/8np+8CX2RvkEIlSJ3PnIGQoX/9GHJ/eVhIzQql5SqrWIVhdUT5n7Xziu
         9nck1MZjvGaUzRc3NevKtb23BpL6gFHmCqI9uJ2uA7q565f21VDL5L8WiHAuHPoFzE7G
         zzmA==
X-Forwarded-Encrypted: i=1; AKwUvBzsVQkYjh67Aq6IgvWxnZoIRvSEiIfWjqT6sl290UFKVQIFtnIABQm0up0HEf6XyEHoXwjl6uuOOIeP@vger.kernel.org
X-Gm-Message-State: AFuF++kOOGkjgdf6ytHouUuCl4yKmCfJg2yEOSOtamaq7Pcqsdz2mc9G
	A5OioPEMsABbzhhA1I5R8DqUuUNnpw74hvKyuQFkm42Js8INGER89BUChmRdcLJulb9RhbWiM3B
	31jXvOurJcyEGAp7bpSUls1O15xw90YhHYEx9DjKsxcU3HGeMx6i082F93HXeP0PX
X-Gm-Gg: AYBFou13bkvERr2S1VTBxa7ZGiXF5n5pcZmsaFhRk60lAhhyZV1y+mdqCNkJ4fDarFU
	dJh3qDRDCm9Z+Tzx0f0I/JdkSdNp3eBHlfdC7J84h1J462CHgsXFg5VtYFjjXypUJpJwA43T3vU
	J9mBjBAA02ffLCfIHKrIhS6bBTZDTRh7NJw53KC380gyEKYph4+YAEpvdLwI8qKvrUMCruAIdQd
	tgc8lBDZ2wrBsg9sjFfHwG6u0tyunp/mvyO3W7HcQL3rkuLgn2p/IJTIWRB/eh1nHtmYlCMk+jJ
	P3o0ECKuHKOyhA8XUuWn2n/ekvtw6UKmFuzIwaX90PY7AxR150r69IV0nFKtN3mIYXtl/4URFV9
	3gKsdxdCnXoR70YuSwffiQBoVqcqO
X-Received: by 2002:a05:620a:2982:b0:938:fd60:4f9 with SMTP id af79cd13be357-93960eddfcemr1154356985a.27.1788432098239;
        Thu, 03 Sep 2026 03:41:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2982:b0:938:fd60:4f9 with SMTP id af79cd13be357-93960eddfcemr1154353185a.27.1788432097758;
        Thu, 03 Sep 2026 03:41:37 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce55259ecsm84661625e9.2.2026.09.03.03.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:41:35 -0700 (PDT)
Message-ID: <36e58345-a236-4b77-b49b-961a0c439b5a@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 12:41:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Marek Vasut <marex@nabladev.com>, linux-phy@lists.infradead.org
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christian Bruel <christian.bruel@foss.st.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Rob Herring
 <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260902141312.649406-1-marex@nabladev.com>
 <34e63564-0191-406a-973a-eb601292b255@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <34e63564-0191-406a-973a-eb601292b255@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VPoWLVVDcLcBxn8KVFJB7QtZRfPNYUh1
X-Proofpoint-ORIG-GUID: VPoWLVVDcLcBxn8KVFJB7QtZRfPNYUh1
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a994ee2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=8b9GpE9nAAAA:8 a=5JN2l_4S2wR4MYYaAzQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MiBTYWx0ZWRfX/YY4eL7inNvI
 q5ux3+T09TZtQC6T5UTWlCU3cajkqwaAunujOw3v06tB5mSKGxZnhKYt1cqAzfNEPKUT11/SAiN
 f93S7HQ5VnpWOf9MK0ucgBv71NV7XEA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MiBTYWx0ZWRfX6I3W6HCdBEY5
 kKpFGu8mDETcsmQFLCaOlhDzfKti8pSxGal9CkQXL/xVgmFzGVP2P21roRakKu2Ob8OZLW4RqIF
 BZKad3vW6g9vce9uVdRa+mjlxT5R52hn9uENMS0NVltsP2RnUN+PQvLWsn+CrDxne7T5WhIK3+y
 sh9XZ3XGrC67PauFxpT7nYWcUB7NqybUXoduJ5+3Xz5rp8bJO4AY3NxgMqjnav7IgzbmhLC97Ol
 u/sFUraE6QlZ1niW9Ey9jxR+Lb6X6UOAxTi4JKcCUkLc+TQEujwlQkS7umRmQCK0hPyFiisluqc
 IPEGbUyjp3U7McqF0XXRItKKfw4c7Whv+07r/7PvK49ToZofOzNP4WYcVPX3SmKtunbB+p3nT7C
 VIswsCYjgzbjP8meGfI5T1iB/2gL63PkFUGHU7gkL6TcZkiJXy8EruuBhzm+Jqf+c4OKKHzse3j
 wyJ8atr3GrwvvUJoMwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030092

On 03/09/2026 12:19, Fabrice Gasnier wrote:
> On 9/2/26 16:13, Marek Vasut wrote:
>> From: Pankaj Dev <pankaj.dev@st.com>
>>
>> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>> slightly different, therefore they use different compatible string
>> to discern them.
> 
> Hello Marek,
> 
> I'm not sure if/how this fit with all below tags. For all the
> contributions you've made, you can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

This does not apply. Otherwise explain me how to execute or interpret
this code on the device.

This is a series of two patches, so why can't you provide two replies so
the tags will be accurate?

Best regards,
Krzysztof
