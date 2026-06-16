Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20253672AB
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619288; cv=none; b=A74uDGrmIP1vTGzMmt4jrF3bCB9En+ygvP/LxKf6UF3plXgvvZXEPfLSFeNgO1lBUkCivCBMgjqK/ds24+jUP9bhBsmHgRKexsfDckBlNc6QwXBBywVHsJKLf5GQ8lb2OiP69P8S64aI8Tl2ffetW0n8319s7fyxZCqjGRCUcbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619288; c=relaxed/simple;
	bh=irl8QxA5C9eS4raapfmrswfr3OhWo1FcTIzj3kwcHHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+BiCHfnqNY0Y26F6M5OoFVuiJk34hLZUIBKWK02OQTIOjMHSmGZ+1Zh6m+i0Vhyfc4OHxgDZiqUecPlW91ip/F4Rxx8mCKkV9hoxVYg+Vc2bmC/c0PHRIBdMMxuUYlkaVVVbxfYid/oLjnTdjjcP+SoHBkBHMgxhWxU9daHBnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAM1kyVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUsvkNr8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAM1kyVT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUsvkNr8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GE07km3314856
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=; b=QAM1kyVTARUAiUx1
	HwN+Rt6ZPoLOrdawDoHFv7Fqdc32iTUYp39m0XzMLGHkpcqd0xkq3fZgHcaemSmN
	ANGPium+D5z1xual38fwaYY0vF/sHhoJ6Qglc3O7zImBcQbIu6aPNpiFueoVY7Wk
	OhvRw2QYbY6ukTECrhwTWbCr+mxQjrvSgMWy9VEz44c4mV8SVxkLqacih9//O6nh
	GDzAvqhArXNn/Sg28e/MY+SsHZ0p2+409jVroHjrIULgFyj+hZFtPLzQY3RkPkRL
	sO9NSscH/uSIWI3FrcEPfDskndnhaRb5hwOjaUv+7ogTIeycvXbhZwIvFzaQBNQr
	N/5jHA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7ta5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:14:46 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cf9fa331ddso188291137.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 07:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781619285; x=1782224085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=;
        b=cUsvkNr8aM7a+6Sca1olvc/J3uuAVC42YaKvMrAm5oPJ53s2paflvxyf9AAZha1zOe
         7fWLGUAxvatzyDgoJ9jM1aFCE9RpJl3JYPJoTKUwRmINMdtpmzTRUSYsyJO+GmWkqiOm
         zyOlOcA9095VwaWT9TBAK4pnXUHJGyyB5lhb8cp1GA7VX6szrakJdOMxmchvJ/kpLy41
         2Phm5+aS7k9H3FRRKqVk2tYaC/dJ3foPTKPdGdYtDFLvJb4aaCOi0FjXMDKKamCHfMqB
         A9nOPnagJu4PTMqdS00qkzRPdJNhtsBFdgvEHYGXeOahS8ogRXr91waJPUhRoMkMlu22
         bT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619285; x=1782224085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=;
        b=RoR/fU7FRJHgrCV6jhePEZwGZjHSRXcwzEVMPmT3+7Y/kltT2yuVTPcE3TF7C9deEz
         nclmWR7AFlE9kLggmvWXm2RdWsjDiOozi5KhqECP0NUc+LvYY5Wswzl+yPD750m1EHSF
         CYyqQD7m0SIKT2zh0md4e3YfjCsIWbCzuie/UYCNk5F+r8pT7vd6qeEEa5L3o9Jyr0gP
         5q5rw8NpOS8xnp4gtQrsYCVscwbO+IEl2rxxFKJpL4Y4HIVC3M2VuHO3TT8pX6Yhf2ZO
         DalAx+SMJFSAwAD04psZ1fCeqntUkCZJhnz81Zvmg0VSAQRkK5Kgnbr3YnqUvl8vvbKP
         UYpg==
X-Forwarded-Encrypted: i=1; AFNElJ/j/a6jrkjuAh5wLjiFFDeJKOtlhDtmzkV8PRXlqUz7JL2/NDF7AbGbnbN8eklJoa1cTwC8WVjxnYcP@vger.kernel.org
X-Gm-Message-State: AOJu0YxKTdCXlIeWM97PZi0VQdI77b6gy7yDvQx6JqDqV8DaqG78uDkb
	g9TSe1KLfl6u/nol14FYgOgYG8eWJfq1GdzMx/pc+HbAYHs9reaxrLMidLoEGLr7TBFIRo2C+ta
	CyEVAnSBN90fwAOQSXD/zRW050I5Ag3eTVufnwv/ndYIor9DcdPEGktLsCFuNSMIk
X-Gm-Gg: Acq92OEU+G93f+u1FVufrVlu42ULi7ZAJ6LLlJ6Vo9HZw89bR4DMhzUkiBvJJutdERp
	QnHM45uxyBPlLs+xcNuNuGn3EVuswA66Q9xcCMv9+Ha16iA1DtaHGLNAvSG0EDWM2uYPJvBEO1i
	T1loahkgKhQnOPAZDLpFxBTM91tNMjLCWcKxivpy2LIwmQ6jo1p53B6jEmeEyXRLdo4Wh3diq6m
	He9yYwxegh3UhYZEOm2pmBZTiEmgCt9H7uEAiKkTBcrHZf96KlqESgYDl1xCquo+Z8kyHtHkQs2
	yNoEfvQC5sGKmM5ZWvgx9iNwJ3bvV1BwMd0lT+7ZWDGJddE8qIqtYPK1vuaaFVUwjfbd55/DmBv
	qohOtoLngkrvJYnVELh7Z8wG+FDuwrXqIAlXMB7ojsBNlvw==
X-Received: by 2002:a05:6102:510b:b0:631:4d32:a86 with SMTP id ada2fe7eead31-71e88e3f21emr2770729137.7.1781619285168;
        Tue, 16 Jun 2026 07:14:45 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:631:4d32:a86 with SMTP id ada2fe7eead31-71e88e3f21emr2770699137.7.1781619284575;
        Tue, 16 Jun 2026 07:14:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d8c2sm638601966b.38.2026.06.16.07.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:14:43 -0700 (PDT)
Message-ID: <50f7eb11-7bac-4d45-9e0a-b209f7e8e9f6@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:14:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
To: Andrew Lunn <andrew@lunn.ch>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Eric Chanudet <echanude@redhat.com>,
        Lucas Karpinski <lkarpins@redhat.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0NSBTYWx0ZWRfXwZc9uC0Izdsg
 cHunmalyHkS+561lBFYghPqdt/4XjMvZIOKbJr3N9Q8smQy0Lvnml4mBmnxbxRfOyqxUINhdpg5
 cMKSPdrfeJyOKWOsrN4sOG8HTh2qdTeoPUd703/BgO8LZ/LGn0fhtOg4vQovuVAmjyjQ1T0r8Ng
 0gVM8/3ScnUy8sG+/W73nrmXrJl/Jm1rogsF2a9YDXCCnb7aF4IoTb6wUr2KPUfyDNzSco2ZYVR
 VVPMak3kPB8pjdA7meby/xT9atVbdiBDmoRG3Zu1dlpyQtXmbBiy+2Ls2ZbhEIZAVm03yu+7tbR
 CS/7AKbzcuK2+5CLzDwITJeLWSYX4r5cBiAyt9sci/spsX+tE1CmJofvJy0pqTb5+GcYMxrwb6d
 01Dk/noTW6fZ6g4PMHGA+SASBQRTtWIOOTNj8tCz8KGMAAgqFVHSfpQLNgMCSFkCPwBuD0saEBP
 fnR2VjKGnkVcD4J5k8A==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a315a56 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=RaRby332RutXx2QLMF0A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: BG2ulb89VqrllJOwg1lH9_kzkQZqEzel
X-Proofpoint-GUID: BG2ulb89VqrllJOwg1lH9_kzkQZqEzel
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0NSBTYWx0ZWRfXzdC2+F+xXJcU
 aAAtHPrkWOlDT8Y5fySkxmbTJK19Vxgw7uXT6GdmK4/qRQq46D+cikAJ0ZPHHM4//jqNzt/fDEa
 z0SVcbpUH9LRSwHG9fAXBLqKjzSMRgI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160145

On 6/15/26 6:48 PM, Andrew Lunn wrote:
> On Mon, Jun 15, 2026 at 09:24:07AM +0530, Mohd Ayaan Anwar wrote:
>> Hello Andrew,
>> On Thu, Jun 11, 2026 at 10:54:37PM +0200, Andrew Lunn wrote:
>>> On Fri, Jun 12, 2026 at 12:06:59AM +0530, Mohd Ayaan Anwar wrote:
>>>> When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
>>>> the MAC must not add its own.  The driver currently falls through to the
>>>> generic DLL initialisation path which programs it to add a delay.
>>>>
>>>> Power down the DLL and set DDR bypass mode for RGMII_ID, then program
>>>> the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
>>>> ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
>>>> 100M/10M, and remove RGMII_ID from the phase-shift suppression in
>>>> ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.
>>>
>>> I'm curious how this works at the moment? Do no boards make use of
>>> RGMII ID? Are all current boards broken?
>>
>> Searching through the DTS, I found that we have two boards using "rgmii"
>> (qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
>> "rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.
> 
> So this causes problems. We cannot break existing boards, yet it would
> be good to fix the current broken behaviour.

These are a funny bunch.. QCS404 is a stuck in a perpetual cycle of
"no one has the hardware" and "someone has the hw but zero interest or
time". I think we've considered it for removal at one point..

I'm not sure to what degree the two SA8xxx boards are used. They
may have been stuck in some sort of a limbo. Maybe Bjorn knows?

Also +Cc some of the folks that contributed to them in the past

Konrad
