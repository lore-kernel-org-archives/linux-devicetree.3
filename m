Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E323939DA
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430409; cv=none; b=kS5xH9LXDLWKIdYTyhPPfcIkgVAXFSDhiQoQKtojItxRFqr3vNnJBTwl4g8QT5B7htoodrE8hJkuFe79G9lG8OB5zwgsT6mBARzPOv5LaI/JPuJ2FizpVXz11SgmiUXskzU8lXP0NAVjae7SrrzGmIjA2k4MkV/4ZVaCtqE+rKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430409; c=relaxed/simple;
	bh=lsh0IxQXOOgQbNnH10YvgW1N3cCLJtX/jZvaD3IAlhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVOH2n7MfyHJHkR6sjONzgHNNj9edqkqvq7+unb2P6ASp14ArJvi7D5nvAkPUKlVBQMgdjgoH39BKgz7HBAiQS8aCNJXM1PEHoFbrc6ErvM7xPVNg/P4CimFlh6m4jZdQY7PhMFC48ddn5KRxuJVwOM2pVKRxTY6nUwVQE/Z2Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKVl6K0u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNeFp8vX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKVl6K0u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNeFp8vX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWXbg1379016
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BH4vo42HystURrWkRuETQEdEA8r0spbsXweM76sahMo=; b=TKVl6K0ufHC7kpJD
	iHroKTNiKhqR79c+Gk0CD0Iyh9xCuc8m3cgX2jWvq6dv5qFbrHR5/ltGI/vN1e/q
	b1cpILgokT//qO2qJBRkDZXZOfct0nkszDYTWQjmNMGFzC7ombqneEEXBIaP7Sdu
	BCkuSRy1vArgp7KL9dNZ8sj8TFIZBDUuJCMgeQ+4HYqqZVQH3NVO3qxnNgzbULbM
	tatG0juc5rYUxv+OuMUSElMKgfKdkmNyQ/Kj8+iwGtknYer/bmBS5NeHHTnSaQQK
	H3+ILonPbgwnt0fHfGBG12CXOOKTDdG7y7MSJR1NL3MLtTHg/vyHVqr0dTkEL+yh
	GwOVmg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8kn0r4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:53:26 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e6ae12b42so999337b3.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785430406; x=1786035206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH4vo42HystURrWkRuETQEdEA8r0spbsXweM76sahMo=;
        b=CNeFp8vXvoXVHm6m6e9sbD5E1Rid3pn2FlNzB6apVbjkXyt4LMjmZDVj7kmDJvQ3pL
         IOsoKcwqatG72jPXSFss9oUgy+DqNZ6Jzun+0DmFbQMf9a0vrX8LIui1ELfO8BioARNI
         ktUMLokgqP8qbtqx8B1RSwUggpKT6lcvh27uF26hyq/ddSpt7sZSIsOqzPwEw7NJPwXk
         21OgQCFORaLllOanFdrymYOhrDH47Ip9wkx0HfN6aKn4ZcEDWzc4x758Ejw0qgo0XS+p
         KwLaphXXllyyIUY8k8RRPyZGCWUuXzZ97QfYJyWsthtVnfYZ9/yvgUqcj2KMsfHwpgdN
         MJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430406; x=1786035206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BH4vo42HystURrWkRuETQEdEA8r0spbsXweM76sahMo=;
        b=rVsfsF/1YtWKXYvVi4ol6fPTpa3c7DpStYt2Wglwbo5h9xQut8GA1r6ILIIm26wcj1
         9NqvRle2U3oFkIs56NxjLgAOkn/bmkZRTnGucV1FCyVey52TdAuuv0VeN2fAx8+EiyGD
         9xpv8JwSxpyUrNoQgmIc0pHhF5pJH4d/4ScYaJ6f5RTzPpZRNANwPdVyzfq81OD55v9T
         SPfIQQHyuuyP7l2t8OjKLQs8jrwEznursy4oHV4l8ys4ihPlXjNenD5990fgHNN1iNr3
         S+EN4rqijTLUcsFzLGQSuqaf+EE+Tr0c1EVVHCWKInhTFmJ7/Ey2Wbo/7A7foSJFZwAn
         a1LQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq85m4rBi1vJDqIoWNw0xI+atQ8lkNz1noLP70d7wOXFboUuyTfOeGk42Mue0sFqBMT2dnJeTNzXdP2@vger.kernel.org
X-Gm-Message-State: AOJu0YyCose1+HG+w4Fia8Ntrb4y/hc7MFPoMsL0lpncJTPEGnLbsq4c
	PUmyIzQ8/MmHylTsi+cgmJSUFZdJkxRxXlRGPYjkLXNaibye5B1vU0qzwQdw+z3VkdW9u6UIR/Z
	5BHH5jEAZsels78ybuTokfQNhIGN3NyUUeZsRaMOawB9FdxTiFCccbJqwTpHVEOey
X-Gm-Gg: AR+sD11M9sTBNHJhhOWWBjN5I8y+vJY89ENDELHiRdCqsotFmD5z2AEF/iIfDgmhPlQ
	qF1k/ImvemzXcJyMA1MPWG94wpkJ6ocRlzqHIu0IWrLAWNkQGWzin8XsOKJO79esrOw84swA6J4
	SOTh+XiG8+c2UXBn07uc0TbVyH8Ar18p+bu6K8hUJM44iF3KfRRw9jveZB0uzEepeHZE8f7J+6O
	2gPf9LZ2qHmdK2UQfxWh49xyz3ATCRDoKOgAsZ1kTsmOkuV5Yhe4+UzVjOHPHi0WT+SttlId5+F
	OdYOGEHCNH/7I/mHKFxTKHKE77SReDD4Akp1MWRkB+sFHZLwUbMWwQU3BHm2jVlkvylboDRRgjp
	54HT+RYaq4E/Ib15a00qAh3I9otMWpHQzJ5Z5YZuuJY2oEIot/yNtiURxtfr9wFKR
X-Received: by 2002:a05:690c:7249:b0:814:5840:2f92 with SMTP id 00721157ae682-81fb8a99832mr25452787b3.48.1785430406199;
        Thu, 30 Jul 2026 09:53:26 -0700 (PDT)
X-Received: by 2002:a05:690c:7249:b0:814:5840:2f92 with SMTP id 00721157ae682-81fb8a99832mr25452477b3.48.1785430405777;
        Thu, 30 Jul 2026 09:53:25 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb891e1a7sm13560187b3.17.2026.07.30.09.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:53:25 -0700 (PDT)
Message-ID: <009be7ea-c886-4029-b09e-efabb94bc153@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:53:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-7-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-7-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNiBTYWx0ZWRfX7jYlNyoVmUjP
 r+YEB8BRomDDLbPe3MwiagsTg0MskRHYA1pVt7n1NEDD1AtD5rFrGOHU6o9mZobWhRAoC1/LsdT
 lJGtXIbdPFX+jcFNvhZWuvRbRPMnXoY=
X-Proofpoint-GUID: JABDHbtFOltJLsI4TuSWFVth1sWWiDlv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNiBTYWx0ZWRfXw5tLd2qiz/nP
 j4HppUoqJ4B+ihoB3bV/2BoZsjoBVvJqvkfr07k8gB4+gmYP1vVMR2KxHoa332V8wZhRG3tFI7p
 lCAborFFi5+7xf+JW6l/axFrHocHOegHSSBWjUkPFLATBv7YQFm49WK3Q98ZaLXedp2jBZQZ002
 oqmWTaNF20/XecqML69oOVmResLiZyOS5GFsxV6SAJnYQ51otqhQGKsT33skcg7jC/6z5S/rTeC
 I7LCrecZX76iN3zbQmaOKDbdyHnQMD2uCOkOhFMeLdj0lsDGmnLB8aIiYM7TOIOVxYAgUFGM3hp
 QSAUG5eUkqsakPvng38w6ftxkBHdKVoBxE+3T7zORlNQbGZKBag6u3cctUWb25KW0Uj6uBc51Wq
 vqS7hmhwavkFxRWn8KrupIDN7GAK4h8Y7mIT9UJ1ZfMXGdSJVOg60uZ6hJCxyS4zjqCxqxkfADU
 8e1fGm6bZs62Nd7mr7A==
X-Authority-Analysis: v=2.4 cv=V7NNF+ni c=1 sm=1 tr=0 ts=6a6b8186 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: JABDHbtFOltJLsI4TuSWFVth1sWWiDlv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300126

On 7/27/26 16:22, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in talos.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
