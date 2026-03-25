Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD82359A7E
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433371; cv=none; b=ojadQqPKwENQbUEZ3f9Hbian/3d2iFMBJ02NIqgNavss1ILDbpGQVpYBTGmqsIt9JAB0WM/vkw7jLH0MA3PdOfHS2gOcpaDnn+TzZKn5L3AwhOKLhcuekE4YEIqVycDAE8QpLO1gRvoowP5xHZ/JM8efYi/h1XE3Bym0/RzF8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433371; c=relaxed/simple;
	bh=o0VZ278vh+tWOjoO4E3ZJn5z82pkomtbeITdYUEpZzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUWYcS9IMKKbt5YXgQiCaHoV+EWlYaU9BuLtOYzpCOjaikzQ+5ovK3yZYfcv2lHqYhJgpZJA5kA34549l2DA6ear4sww7huorjmV4b9GAnrT9ZRjy12mL6i5l/WevBKRBSy80+N0JXcqAj41aCNr3WROqDPd0MVYKW8dJHI6BMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2PNfjz1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zhy8PCTF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2PNfjz1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zhy8PCTF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5GdFo2974194
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lf14XtCDMSJhEsxer3Ovdkvw5jpasXmDlwuhiAqrGR0=; b=B2PNfjz1Yt34Faiz
	ccBQ+6pFltlFcNdF05NWdLazVA8ebadcYStaW1SZucDjBPlDri5WZG8v4YEwK3DL
	M08uB+NPy0iCNxFgXCaoo6ZqK55NJkE6lel48m337V4tLgV/DRZ2fhB6EBioS2eQ
	MLD5nwrQTZXMhuoBXWE2RVyNttYr9swNsuANmLPMUFlZ6p7dSoRny1d8n6bcC3NP
	oSvOW4AJdGCTFA2Jp7VJZ2zxkkZfY30bgIEvVn18W/aCNupH5pxYvwKslmdHf4cM
	GWpayRtPipri57T/NACfUyHwF+VTup8DzH2s/q9r0AxTDABUmfeXrxdjHHMXSDQj
	giuvLQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4jnqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:09:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so159006d6.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774433369; x=1775038169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lf14XtCDMSJhEsxer3Ovdkvw5jpasXmDlwuhiAqrGR0=;
        b=Zhy8PCTFEbo87IH2N5MrS2oZGX9K7nyGQKslsI7yFqIGSum4bcGz3xvIrSlw3hvLQ5
         R8swotquOS3kdhVuClY4+tWi75UXapToN6pe1o7d8m1lzYvsYv9EaWqaGPfdav5DhIKX
         dKOHLKKYH7kuN/8CxZNrXdfE+2GUS12Sx+vgBiucUzl1S8/yi3gbl5lfekjvvTzseEJk
         QZxk31rQZ76JxQWcwyz5LmyPrWGfVKAMizGvGs4R7/agfD2bkdpL2zmwrHhpS9bF5X/j
         yh7hfSZsnwZCcKknhO0pAPREU8zN6L+QEDwQyZ1DLNsHwXqOwVERratTwcMuwPuT6YFK
         Z8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433369; x=1775038169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lf14XtCDMSJhEsxer3Ovdkvw5jpasXmDlwuhiAqrGR0=;
        b=qYUKIodSeU6eA9ELfsrGw1CNJXfdVAUOpn+ViYN5tLb6qMcwS5cDFLsbNFr26aa7z+
         LeD8LoO2fhM3xbee4EzfZ5AKiF5bGcpAIzncZ5lMWDOVrdNe1WrxTVP2zrCAZZJC3kDk
         ggElU0Aa5CZafWGGlzglEmPXmV+lgdh3RKp9+TfKKClIwOKb70NQjBdm6d5Bcd7O/QWU
         aSRxKDSxYN/uJNFKXNAxXmRPebIXZe1mrE10aK7BDnnCLa1BbKmAGMmlEzyA2mZVl2pB
         iQ/pY4SaHCip1HmTNqmUjd5Gfhy3PFhKBRTOZxDydbuboiBpk+FWseMUy+ULzEwPjG0o
         IZiA==
X-Forwarded-Encrypted: i=1; AJvYcCV5Hpv5byvpUZtHf14VqCh+axs6LoVNUOy2pWlyGhqVyNFiY0yh1YYc5XWghRVKV/B4Jn/qObXhKhrg@vger.kernel.org
X-Gm-Message-State: AOJu0YwJK2bDLlOTcpOImivs66Eo+Tm+0i/3IaypnnMx7GNaX/E1AVxZ
	VMtErCqHVt8V5GZwrk9quj4HVv8LltFzxHwfTJhyIwXZjktG7S6yFx0iqb4paaM5BDkcvNlkb3p
	NIEyznk+X8sH+6bUrfSKxryrf3yRq/rqB76pfuHufGwY8ixX5zAUnSN9uFvxYHNL4
X-Gm-Gg: ATEYQzyT21+zXZB5psjE5RdoZtc8L+TmG/f6n+7ZG4bAo9OcfGm34BZ90gVQBWU4TzR
	vD4iCaIT0Amk4Q0aAREkw6bl7UuIbt2jtDY2ax0I8nqc9CL5UKv9K6oky8posDr+iwCNiVYwfYd
	kG6KbedPwDeQ6SkVkNyQro9lQ0ZhIjLbdjEKO4asqvcTL+fnAlm3wTYuV+Gr71l+BJa6iUPCZkJ
	BpIiPVl4BcTRC4aUqVUhUYkcvsLPZ97IHvz5lhOOTL1YgQxZDWDI/kP1Fg0x5b/MAoquLsUu6wR
	Kdiq1x0nTbragMJ8CmXO8L73lPagU9mQ9CzrBw+3fOgnGCN8WQ2TuaXvkFcAi2Dntn2kqWT5A8K
	CWDeLRKze6mkjnVh/017yrBr5PPPdR/1hOynZPaWTxCfRavARgQuNl6MKfMAhjxOK4KkU4egp2E
	HSMm0=
X-Received: by 2002:a05:6214:3012:b0:89c:69f6:a1f4 with SMTP id 6a1803df08f44-89cc4ba9c55mr31919546d6.8.1774433368643;
        Wed, 25 Mar 2026 03:09:28 -0700 (PDT)
X-Received: by 2002:a05:6214:3012:b0:89c:69f6:a1f4 with SMTP id 6a1803df08f44-89cc4ba9c55mr31919256d6.8.1774433368256;
        Wed, 25 Mar 2026 03:09:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398c16esm772864866b.61.2026.03.25.03.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:09:26 -0700 (PDT)
Message-ID: <fe12ccfa-d201-4740-a317-e07353a96b1c@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:09:24 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: drop apq8084 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-drop-8084-dt-v1-1-a0255a404355@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-drop-8084-dt-v1-1-a0255a404355@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3MSBTYWx0ZWRfX/ce8L2NIYxSu
 8tecXmud/i70dXM5h0iwC2FToZUr+ZGycHb5B49XRC1suXaIpBO0fdgDgS50zyBNvGxi9+Y2hEJ
 a26VjSG53Qh5z2X2ge2mVLpYaMQRGupYmd12y4FPDCPn3yvdSunT4kVaMSt8b6hW7JcDyYY6gvR
 TUWs+ose0zsKxeHNow6IDkNwKrQd2GL9cbk/uc1Wrt257LPmmEmPcDpgDkrGAvzygmOYtsUrqf9
 qohqKurhUC6rfhHudIBE9UC45BlGUhGBsMj1ZmhorPFp1JTq3GTyKI7HeEv/O+jcPetmBu+21MJ
 kLgeOexYzSF5CcmOrY5Ru001W6kjYUZ0do9yLUhJAoNs+XWGfbIAPuZvUPxKeimeAESoUxMJBvL
 zsLwhXR7qRw5XeTtH9qbgzT8MwDnaWI7KDO7wjSXVuDgGTcvrXfkqHmreuGwz1I2poGdmp7fdoc
 rbjWAmfvUwq7PYm2diQ==
X-Proofpoint-ORIG-GUID: 9n5BRLBKhBoWr7V_Z8D2GPnov8nKL1d_
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3b459 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=3T1j78d6Ci3bwRAFHhgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 9n5BRLBKhBoWr7V_Z8D2GPnov8nKL1d_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250071

On 3/25/26 2:45 AM, Dmitry Baryshkov wrote:
> APQ8084 is one of the platforms which gained very little interest
> upstream. It doesn't look like the there was any interest in these
> devices since December 2019. Two devices supported upstream have very
> minumal DT files. Start forgetting about the platform by
> removing DT files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> ... and start dropping APQ8084-related drivers in +1 or +2 releases, if
> nobody objects.
> ---

+Some pmOS folks - if there's any community interest, please encourage
them to contribute sooner rather than later..

https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_805_(APQ8084)

doesn't give much hope though


Too bad - this was a really technically interesting platform, loaded
with all the features you could dream of in 2013!

Konrad
