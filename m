Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BA6409280
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525693; cv=none; b=W1Ka5Rs9JDSrwsdLuoY08XZZGx5UBtQt3HNS5XMZrczW3JlYF5JE7j7tqjbMBJSso7sER2os/KsumHhrqS56aIDgjGuTNts4wSoh2vEj+yj+Q+PmL2PkT5RzRoIqxGbosOM1liyZ1F4RIKI1tdKwhggukLWOhirYq6MoaT8XMWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525693; c=relaxed/simple;
	bh=sS3qzw9xUKznsxErwsW7mmRnR3TRES89Ik871TJ3+CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqpimLCcCY6zq9b4Nf/8efRu77GTjrvrdet7JlSj1OspBpnM4Vifyb3irarCaIOJj91bycZLHsHXt/BnHXR94Dt96cBWeFIna3TvMBn0sV9oFl7c7lJt1J0BAGUxHbk1AKVQjBEHHaIlEFVDk4gqJN2wZvEliSDMAXghJuuVc8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itEaViqA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYN5BLZI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itEaViqA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYN5BLZI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3sdE2751523
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A+PAvGZDJ6yETSyurP4IAMt+
	zY4ZyHmiL3Nfcgyr9TA=; b=itEaViqAkiNf3+YxcBVwePq/Z4YqB7zUEK/6Pg1p
	s4YPocLF7+Td0RFRuIWboY+U2OVdWtwXZeAxTWnTfS7Dfe3QESh8R0OTwMCdLI84
	9Q6bvAzKX/I/x7Z1tBecy0UNqrKkX+HQlvha2PZb8gNdwYoNojQgIiUJafqdoo3y
	D7mcagbRXPOBQpuc6/QHzxP10EvNOVR4SEDAr0gIqur5CQ+uoqrNquo6ZPEp5kyo
	lWOr7W8es+gwqylO2IQdKFe1QyPPYWJa8C+ArLBJr7X0vg87J6u60JslJsWDjbBV
	vB9UVch5EJmd69o73fM7OZg4YdWDZ8C/2dMljtV7uHufYA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssu8wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:48:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7377e2f1a62so252415137.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525690; x=1784130490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A+PAvGZDJ6yETSyurP4IAMt+zY4ZyHmiL3Nfcgyr9TA=;
        b=FYN5BLZI36NA4ge3tAz7Ft/6InpSAlBi0SjwVac3q845rZanBtEyEfZtw2fwiWUNHE
         ZGIe/hbqTM3RMiLdmfi1DgjRidgf1USALcZroUp7sNPBhE3+LukNJgIpNDlhEr/gfxNS
         KmVXPzGBPfIqfb7iUxwpRuXKemuYKTxACdSYO8jkcdRgYGflCJBW0wGecmDYCG+zbbZk
         zuI66OW23rtA6FSPxUPodilDZC9My55/gAd3IGFa3MyGp5krFIJPVOms9irYCGZQObWi
         BO9UJwSh/yGAYtYoCH8WkgjLSqH3/hAxC0ylLA4rrFU9byXSWm0uBXIXumA8hnjVQjjh
         +w0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525690; x=1784130490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A+PAvGZDJ6yETSyurP4IAMt+zY4ZyHmiL3Nfcgyr9TA=;
        b=n13FOIUaRZ/VekHejeSU7CCacCpKoUxVGIndGEe5R1qVSt7q11FWPAMpJptDajHhi4
         msIRr1txgoCXiGv4x8chyKmdyMf7g6xI/M5qWL4SleGS0OdL3XqSCLMgYzPISgwu9Qjz
         xcxIRq6x6xb1eWWcDYBIPdhGc4Z5yxMJTh9TEoMdxBbka2yYBuODbBeh2gbl1j/hN3Zy
         SC8xIfyIfRs9kN64d5wjgRSgW7JUCImas7blTdh/Gt1fLds0+Cakf9YVNZ1V4CVE2YwE
         w2BUbFFuJWk4024MPtCS6xQ9CYh2SbKiVNPCdoLg+24dTjSucJz6xR5ChZmFvQj8k3D3
         TOuA==
X-Forwarded-Encrypted: i=1; AHgh+RrgSv4l9kwqDtMjTihH5OX6b0BqibulC4SENKYfHInxKFiVnDCG0TtWuA6gS5w9ifwE1zSyUvfkuMVj@vger.kernel.org
X-Gm-Message-State: AOJu0YxzqEVRG7ke1a4dA+/kqsFbWc4/L1MKpSMHurWazrMzCN8OaHrV
	xvnFo0IItM+P4oKk9EyQLX2jxHRy3qN0bIxplE+nWHKM0xsHGnDOc6EBBfhg1tgVadc3zU55UiQ
	Gw8XSK3WczIfDaTCn/ZyOHuKKERhFdLBzv5EXxuqL+SNkkgykY+RH/txMBC6gR41A
X-Gm-Gg: AfdE7cnPwym3VsRrXtOLkqgKzUIMzxHyFXSvJu2SSBP62WWQoPFSzieYs7peENF3M3z
	pPTGAA4dQKxlXhEv4cRRuJPUFpExm9T1fgv/dkAX/VWigjoItlwVfVK19h+qAenZ3V3jd03Tchi
	G9Q1DWZclD7/XNSRQKpGrNEIPJg4luEzzex6uCjAzAbdK1lMlZd0vXKhXIxGtgAUF1Xbsb2F11N
	5jTEEO086I92TC5LW9Dg2x7bDC6kVm6V0FfryF+qZuF3QSqahvnACjm+qBeKQd9syOm5ba9cI8S
	N8kUjrJUlIRvhL7o2u1WC8pszMcQgEQ98vao1AO+j/JtKMBW0O0v8wQ+I1RzA5mhAFixcVOpxOf
	buY8X4VDv3aPb41Ti5MQOhUaO8G52KVIs5m02gWkM5V6ukTo5iHNhtvjkim80rMyujW0Et/7+eY
	qrUEnct0dh2ac4qTgm0wlr/yOW
X-Received: by 2002:a05:6102:e0d:b0:738:9c30:2ba3 with SMTP id ada2fe7eead31-744dff0b224mr1584552137.1.1783525690024;
        Wed, 08 Jul 2026 08:48:10 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:738:9c30:2ba3 with SMTP id ada2fe7eead31-744dff0b224mr1584493137.1.1783525688728;
        Wed, 08 Jul 2026 08:48:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b012e19bc1sm388228e87.26.2026.07.08.08.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:48:07 -0700 (PDT)
Date: Wed, 8 Jul 2026 18:48:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add sleep button
Message-ID: <2buu6nb2oxk5r3okzc53yyu6f5que5mqjbwiwxctypwzrpqmma@q65jf2hzr4bn>
References: <20260708-buttons-ios-v1-1-f19feca52b60@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-buttons-ios-v1-1-f19feca52b60@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e713a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=F2uzNt_Jvis__oCUEkcA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX4Bs0eQfrjz7K
 kiJS+fwmRtZ2R512nDb7yCNCPzTlqIawN50Wz1+Rghbef3G9YMSFUH6XAYNetGTDIZAkzFRSHdx
 JbVhgu+Dh1MsCj/avs5kZWYtoYVDAL9ySUpp9firiJFVH7pDIERkrgmlAqd5bvYawJWWCABt4kr
 8AwHRrAi+CYFfSDEDPKqSKGPlBAeFeG/bLOKzBJ6S2kOSyRHwPMH32ed7p35IFitnDAgANbR74C
 +UT70gNPhSyKX4eWgsbnhbnblOD8yeyjczJ4xklenQb/ol31Kq0uPvy3ScdbOHRxitD5vMH3R82
 pKxIRrd98LOrECVkyniBg7qj4b/oCmsWJFI7BFluaRUSm5Cs/i57sj2+qI83XSMiQf74hUMQhrG
 n7n/++CnZ5qRHlVhitaAr9VwCDChwBo5nP3E8RG2oODb25Z06f/V9MFd/9bped+GDBxPRYhLHe0
 plU3Rv13lUOfiKwNjhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX1Mgu3pWezn4u
 35PRVc4tEwWn1RVsmy9XtlZH7C4exbVUy1AJ/X+iw+urxGbZRWCAlZW0T2mLKFh3p+Q54K5VQRN
 jF6KJpt7L04Zv7gkKygEOODnE0vbQnY=
X-Proofpoint-GUID: 6KRY_WFpo6G_WTJhlgivATdo6rA17nyq
X-Proofpoint-ORIG-GUID: 6KRY_WFpo6G_WTJhlgivATdo6rA17nyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080155

On Wed, Jul 08, 2026 at 05:30:13PM +0200, Loic Poulain wrote:
> Add the board's horizontal button connected to GPIO69 as a gpio-keys input.

What is horizontal button?

> The button generates KEY_SLEEP events and is configured as a wakeup source.
> 
> Note: The button is actually connected to the onboard MCU, and forwarded
> to the SoC via an active-high GPIO.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
