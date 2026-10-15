Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF86493D29
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061505; cv=none; b=CueMpkraI3ePsaoNy7D5bin7CIHGvP6V3QhdlR7poMTuhXOS64bDaKoOE2CJWBW3oZDVPuSNFGTtmDjSlsKLdGzDkqDDTYDXhlzb6YssjC4J6douK7fs+NespZcWO2WZAa1y5zpsj4dvORC8OADGo5Lbf1BpE5UFzlvjpBrlVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061505; c=relaxed/simple;
	bh=OMY/Xe60UBY968wgbz/CYZ1bEgUa1Cb2nvJ9EExZqTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfLorCRTj6osWyluZYue8qA1sFscF/ZqMFL8iPqH551tCu2LZ2K5q28/22cN60/k7vfmuWXvVbs5iwUPoLYpWr3Cq+4LJWDupHo9xr2nyXcVJyECSVsfUZZhiM5S7/drFkxA9rAUMKszk+EpfdOSUOsBU6fN0yg3So9hB37gFYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gI7OFKrk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J79c/P/z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gI7OFKrk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J79c/P/z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jjbX1956177
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dc0xqqqCiVqo5Myd8N75P9isi+bPJQnuJ8HETB5D8Mg=; b=gI7OFKrkjd41uoc6
	9jwMd++P7C7VOXdaEdLtliukD+2R7T+efvjS68Ia0LuzhTvKIEEuJEuxUlr3bOkK
	aoX5nEf8qwjY5h5yVMwsLjeBWvpICct2Nyplo6xsYtZu11SuxCWLOhqubl6SsjbC
	KPw577Rld5Yo0XrnC5asiEcsrS/DsJOyPNAeHmDDXVOSbH5Xg8Ezc0RYzoiA+0f5
	2q63U0dbv1VnMx/Ktxe6NED6XG3UYVRsaYsnpaV7A5cv4S0bqFgZG3D1rWZrRzTq
	Iavd3JwEsdDiuwvxg2x1Qwpk88tI66musnLfisOgZLGrBVXa1fTFjnEfHrvKhgKB
	2ichkA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdetfk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:51:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179fb39cb4so12849546d6.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061497; x=1792666297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dc0xqqqCiVqo5Myd8N75P9isi+bPJQnuJ8HETB5D8Mg=;
        b=J79c/P/zSkC2DtTh0ZJBZ01esKbWQGsUgWFDHfWzuFDOJqYMw2Nb4Unywq5lwdQI9L
         PgSWDNjLmzDDJkiBl8XHh5ntyyA+w/21yf8Jb33x88RoiC9FzQJRrdL4aq1P+JK53K05
         ZVrMFR9OXntGypCkMlUdJgdnIvUxagvRMOIg8Ewj/qwG4qsIs0D6FaJw+h+XKRRYpG7Y
         lVwgBBiCT7LLdOkzNxE7aEdhhb/2ROxob7zHfe8j18tFjRMdZuH12oIDma1n97NVUYyD
         4tWHocp77mfSUHzO17jI5E+IJfzk2BJeKZLHut28vcxIF6omWLdXpH10PnJqlerb1kDA
         TjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061497; x=1792666297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dc0xqqqCiVqo5Myd8N75P9isi+bPJQnuJ8HETB5D8Mg=;
        b=0AEMEUJq/6o0v7gqyNV2N903wR2LucXIvt8nGTyXRPsUg1B0tcO3siOf5FiS6CAqU1
         MDf+/Oul/bqqhVG8FYLwG40svXPGsmCA/ogy2qVEVYDcc8IdOT+Kb7IFlTnVDsQpkH6O
         84Bk9H9fLd6dc2UTUtpdtnE3H3ox+wofmhhbv6qAhwpThprmXax8X0lbABRULn8Z0Ozd
         etbNzkotODtEoXBp3kAt9TVj6xiAFjbq206Q3ZETzqFxB6iTs+9Q/YFf3NbT8pCbyPWJ
         n+/pvSxPNXTztyOhMpInrhD73LbTWC4kfo9WCJyL1CNMrssanLFHayObkrFxwaQxnWus
         cphw==
X-Forwarded-Encrypted: i=1; AKwUvByWpW4Ktq8LS5Zj3CzRrGucDptuT/JzojjemoeZgnbCM6LydQRkVaznMsJo6QUXCEezGdhMuBiYrKK1@vger.kernel.org
X-Gm-Message-State: AFq9FYIwWWzr7TY+Mqzjvg1H1OoeRoz/nVMeOLUi/6t6S6ofnO5BxWy7
	CK8RQEP+RujncbbERXNxwg1jEKmrPHMLit8xI05lv1WUMvVVhwNxTxyHEd98gtB0zu8bgyEwFAW
	rhrDiy/jo68Cb7UXkyAzQ3aFwxBS2O7SczPx5SywMbg+XkwhppK2GLf9POws2fTd5
X-Gm-Gg: AYBFou0rWkFuWpDBpoezI8S/yKOtd+Xt+hGjn2rg508fJanHrSfYShX8Y157s2Dg6et
	WA/gGq9Ho2ADYzEz+c9X/+PY0HKYcBgVpGnz3xkStVSRqduhCUtJASn2+Qw2yGbX93MxVAE/YOD
	3ibeKP3ADMkDJy7MWn8jQY4bh47rfoqzEsDUHrPQTxgA+/gKSbhS4AvVq1P9V2ymyCKXq4u1LCE
	2C81NLFvh6Ilx5jf+xWTTZqpvjaREDbjXUYfRYSyK1sUM+vhl3tJbgAdYm0tGneMTr605OKZJZj
	f3wX5yHIWSbO6jXzC98QK5GwdTaWg93fVpdUIcvk+e+UxAuEiD0sMbDCKHKTKWolv/K6mRGA8tp
	SzbNr3uW08qJDaec0S8iQhA==
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr3642743685a.3.1792061496633;
        Thu, 15 Oct 2026 03:51:36 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr3642741585a.3.1792061496206;
        Thu, 15 Oct 2026 03:51:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9640488sm108759866b.25.2026.10.15.03.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:51:34 -0700 (PDT)
Message-ID: <512837f3-597a-413f-a8de-612e26c8c78c@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:51:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm6350-lena: Enable wifi
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-6-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-6-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0b039 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=If3Kxn03tZdP4ytwtUoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-ORIG-GUID: 9Z2uZlF6m_PIwMoazVTm8t_N_H0z4Vaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX+632ZlDY3gXd
 SvS9mBDkTNTgxg4bUUtjtqS6GfIdP3pw9UuoyYD3s8cD+SpaOS5wP8fANb7/g6zUH+viRuD3/y7
 IndW47iVNkJhNapmSctAjIAD+22NebuLluV02rOGaIpLXYC02IHXTESozwKtnvhPXhbjgmxKnKa
 yeVl6LjAU3bTZOwxg54Fblm3nd4ObRnLndSuNqAUp6uA05ZWZU6DNTWulk1se6j6rts1jVpYeWC
 +qp7EwWQ2vRz2RWoo/MpguD9NXYtgAXj1ym4gLT/6SCRVc5JfAJhc/TT1JFMstzN3bvwKiOc5f0
 nm+a2llhy8zGiQSJGillaFrn1G7s8oIRli0FT26wYi9IjEnEh1jzGKZQkqmHo8RCgO6SVnh0K1G
 0GCt57tGyaBWSiGyUfyW/cjXTof/Hrq3c+D/3CH2y62N7mjCVDRveLO13KignpU2q1OCdn3PoV0
 pPyorhy1gFK6BHABi2g==
X-Proofpoint-GUID: 9Z2uZlF6m_PIwMoazVTm8t_N_H0z4Vaa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX9574akySgQ90
 AWI+fCBFutyHNoS2EddrBWaU8S3eSJ0AjQQf6bKiZPCaf14L2iEQ1maCEQwPi5sr9x7s2qUzhSX
 4guttl+uz+4MaGDmf4wYszZdaWz4eYk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150043

On 9/26/26 4:00 PM, erebion wrote:
> Configure regulators and enable it for the Xperia 10 III
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

It would be nice to have some more details (chip id, etc.)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
