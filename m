Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A24466B63
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388904; cv=none; b=ESlKrzb9G/jSkI0vqtS5QDvYJGmjbCRwfL9hXoSTET3ngltyMh97dwp7srA989aKWyAvXNFa4HbYTxqzf6aTbrxQTqUwfT05eBdcuEZPaCutIOy8rP+1xyqhXt0/g1zg8UXdugOPCQEAp+8GIYMHHAI1099XodYkt9o0X/OCLdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388904; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fN31VSG+3WdWPf+zoekPldGd1lkeDl2gmPOsPR2cOgawnF+zLa/EVaJfA1m/OGTPaLwtxXvNIr9nE7q0VOcdeVfqAnN2LbJ+wnktl8CvjmacZUE9fw8IrcexzlBVhvQr2fTEKacBeDHnXnlmughVEbvM9GjWlqtgxEdo6AblOx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKeuKdSX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1K0VnjN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKeuKdSX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1K0VnjN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmLcB4032464
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=DKeuKdSXMgIYoI0g
	Y73xzRGE6ORJTINXPoAbyMapHuohAdM4Iql7m1pf3aH7E61s7gqHJlxIV0pR2m/2
	BMdJ1oCVEJcyxr9qp1vuY4KSYceCvDdnPWIA1sMudUZMm8amERbp5ITdBPYz9SOH
	26zDlhfQw88ZqB2Er1vD/KcpbWpDBUNXG9mfjyHe9iS3KegoVa1FeCWMdIpY+0AG
	tRtsZcP9ZQejEiMQkU3C72d4im3x6+PifGlW/Vi8M6SfoQcnCU5B07uWrcKmGcxD
	KfghE8jcjLTavNFNfbQOCU6pShuVT/7fYYeJpiEMW2kmPXY/LYaWts5wXjP+KWGf
	PWFquQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8hcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c8383e6a13so56873e0c.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388901; x=1789993701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=c1K0VnjNeVZpoSwW3g9k/PlTHiA5quJxzAiEUjSqj7nClEKiYHJVQ8wmg71wPDNNml
         lIEI+PMUEs7HalqTB16z87PNnyYeLZbttiA4LNq+hHgzbwh2Ml/RrPXsZsI2sk4Vy9SV
         CdixNvVh6aqKmwZfHjaalRxc5ctgEcuN/q3u0h2errbQQpkyTeRACAy04qDUlo6R4RTU
         OtQoMiYMOAd5RuA0lfzVrtv/j7UFaMb05rsyixTNuOIsZ7mLbqT82QprP9TRN/aY3LH+
         5cVtp0jTd/NQPYMFhP8smYRCH75NwAAXGgw4chYxq71hOhHpvHH4FS3HqDJJ7VDfKuxs
         CCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388901; x=1789993701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=n+Uu84m3xKMtRt+mj8go1/YBhIT3bZ7E8IrOEC+wCUfTBnSrm+o/IVPbmN7RpQqOBR
         doACAL9PcLbMr4jU6kN6EPjYS3tbT7dJOdZYkkuLrC9xdx0poywjizmW5hrBa+JuEq5M
         QX3L3hM3IsIb2hzUiN5/5aH1idX4rn5tBn7XpJP4+VtdqR6sJMeZ8w2+FqVGGZ6N2uOP
         5Wv9oc1PmKH5zDmpx+yUy54P0OAsk5LniKnxSRZKFFEnwwIh0FyhrTy3jkQkQSXDPnRn
         yQtdhXmC16Sxl4O2On253Wtjfa+CY1uqm/+Wr/7hLcXDvlGiPuK+8GOfy+O0z0md6AVy
         weWg==
X-Forwarded-Encrypted: i=1; AKwUvBzJyxVNixCprLWy9CeGhzqOXKHoe6FziyLj6lJS35TNY7XVOHm8tywiGiCuMruzXLxb1NHWD8flqk4+@vger.kernel.org
X-Gm-Message-State: AFuF++n14vZBMZJJt5sv8dJasI8bea7IETmxOlxtRQsRfxzi/m9sTapl
	D7D/KHc66FTa81rAO7YKtg+27NOYD/TJVKazrDN4Kf67G7rMPM88FH6DUQMdulNTXKxhJ3hmphZ
	OfvKz6tpJ65FgEJj0oXEeBkkUb1cUROyOlzX1i8MKIpjingDu3T2KrBgxNbpoNuRC
X-Gm-Gg: AYBFou0ov4dNGQ/41fs4HxCEmTJCFWUAgBs0qEWHUxVwP4Pd0RPIhrrkOwlR5r95DPq
	k+KnfXykyhmOMB61BI1/X1SlgCcga/6EZMSKEhIomHEYx36/4cf/s2v30u4jkfcdiGm6vl7EdjB
	U1Y1HFBjvypKIl8QUHn6t3YIo4caj3x+B4414xYdH3/TCe7nauK24QahNelAaF6ADXmVf685hmA
	ilzuadMxObzpyuJUXlW8G43/9pmHUoEQ4QVjzpo4s2BA2QM0UUrsyvTjS3z1WQ5fo590tK575OJ
	cor/tfh4t/laeX9GJf6QVQlWhE+gXo5X7lyc+QETj6IBszs7gkIF3CAwdWh3hy5TqZE7HL9IK7+
	tLtTGu8VTDIsSgWnHy1FdOA==
X-Received: by 2002:a05:6102:50ab:b0:791:33c:9d1 with SMTP id ada2fe7eead31-79b5b2922c5mr363806137.1.1789388901134;
        Mon, 14 Sep 2026 05:28:21 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:791:33c:9d1 with SMTP id ada2fe7eead31-79b5b2922c5mr363797137.1.1789388900751;
        Mon, 14 Sep 2026 05:28:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047fd4fsm2360273e87.82.2026.09.14.05.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:19 -0700 (PDT)
Message-ID: <86c93a2e-61a8-45af-81b8-47c9ede40b5e@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/31] arm64: dts: qcom: sc8280xp: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-27-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-27-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX7mUWxvVXhZVv
 kTZ0giiIoqFcMIBEu/nTsI7zKZJ7xiRWy8Sdbi2T23JwfHO9n2/O9YR1aVLECXqhlSnp/4eySYN
 IUfZYgr0oXoT918lkbjEGRTUo678yzh0CORUmTabOJn1p0Jkg3niTPUPzOwhT8s3EnSywlDuAr+
 ZKeL+unYV3dm8iDyGrGgY3xE5HQiaf1f55BBmFxKo4BNg5YvLQ5yww5GP+dg0h4ybxTq9XIuo1M
 xR71P73k60COTyRr8Px5i2xfhZmfmP2bDvmnW9PSrt94aC6tgz7QSZ0wm4Vd5eG5dh6nPKhUa7K
 y3M4RViBVYZF+RqA9+SQv0oraXd1LiiouQhdfZyN9u8YL+m92D7Y0Na4sv/2R/9VubJX2Eyr61f
 D9VrTo3Q6ElELFaN0INuFFkr9VcDFgVhgyaE6a2JEPcIFSD+CJxhJ9pgyvDMceNgo7UU4xVdX1b
 ccUcOpY5xn8gX/CYtHg==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7e866 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: GiBYmGRlX6OvQ2eAyGHqKOJupJk95f5n
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXxU4AlVZIf0wl
 xTQSd5TGC+rA3lJHbdmA+x/eQulHhenvJ3Q1L2voUnRAhRmOy0X0G9wjZc1bRh0t3eMzcx8A4dZ
 Ls/jSH7u0ZyM/pEWiBTynXc2mFAhcAc=
X-Proofpoint-GUID: GiBYmGRlX6OvQ2eAyGHqKOJupJk95f5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
