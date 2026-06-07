Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C9326930
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780867801; cv=none; b=APXqEHCwNBgiFDs420Pz08C/852zd7JcqpLF/xTxPBc5Je/ILeohn+cUzbbpcIW5I7IwA0UZKfUaVdyP6RQlrUiOj8YvqRC+JYK0bNE9KxZuKgxoKnnvgNFqxhdbdEjPcB1mYISNMDkqNDJlK7OVQzIpmxpstBrISjKmGajsixo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780867801; c=relaxed/simple;
	bh=yqMDBqhQg99rPWzLQ7ylmYdfuTA46f+CvMyRRW8RxPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5cg352N+uNDydIQR+Vc5JwSr9L4JleJerQvy6KohHzdk5FQI4/kgMt3KSO2y7Z8TmD7aCbVR1Ung0lH5Yd+IDTc54q1K5OvyxHDvb0iSoU9tisgs633HFoLK3cufefumtH8g1qnitmh9plbRtyNR8HPPhkSmU3w08jfxYhq5VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMM1m8y8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khTNSqWj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMM1m8y8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khTNSqWj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElXJb887150
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 21:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dAalBrR1nkmk6nGcSxQfzLgG
	KDM7xWGT9pITI41l4Q8=; b=ZMM1m8y8bzczLwvhYySpJhtNYxarPfTnt9DqerSP
	UiX6wVsGNb/UXRhNN9D6Y/sTj5yFpeOW1rgtKuOTrnhYF4hqhjkEZz4U6xE1uNsg
	LanNod7In0kn0nT+BrnNqU6QMW7BqDZ06vriFWBm63ltwsuof4eFdkbzT1NZBM97
	aUBINYIKYYDH5Fnl90+BpDe+gbAYke7HFipxBlHWHIsHqzdrvfWFM3gMk8TgAIeF
	2zfvWk04T5EMqpbOg+mNrXXckkcRq4DYwxPRPd0CqbZscR8Ekamth87Z7x+1+t/I
	TYrSVH8RTumZhONWRx1bS9WUbNOP1xc4v7Bp7DySGwKrlQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrcuum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:29:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cf37fe12faso1524385137.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867799; x=1781472599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAalBrR1nkmk6nGcSxQfzLgGKDM7xWGT9pITI41l4Q8=;
        b=khTNSqWjeKlr7aLvjaV+CYVqFixuFWA7vhVrY2mddNFrAUm5aXFk+Z7CAbX0iNeJ0I
         3gTSO9wZ1GjoCReydtszZxFJbUkXkvdKDO3527NuyJoRYgURl3GkmYFfmrGK9OzQ4Gij
         bL2J/jjO+sjCid9zwAHtW5WKpOg63NpWhLcRfW3kDFxHvENRa5FHKfz9K78e1RDTwZKw
         K9SePqj52uLU5t3Vj+UadbxjWFA3CNRBfn9zfdbwBvfmUTwEpWxXWFLn1bHoA8sZtv0k
         vhBYjZSX/iqXssKKSJcKPupRihsfdcDzCxUa/lgTAqxoDevynHEEDphw1yMXQntK/w6s
         xyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867799; x=1781472599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAalBrR1nkmk6nGcSxQfzLgGKDM7xWGT9pITI41l4Q8=;
        b=K6doliuzU7cJ2sRMvdZLKZ/mUrzCDvjinoYaCg+QpQiHaIP1YhI1IF9xCZGgLE7Sbp
         NBR7hvmPYovXk64vn6EfoPFg4JnljwhwOZM01K8HP/UzhcrMDrHT0KaWZ0+egJp1+vh/
         wuwIFScH37PMTuv/bRsITUMeltu80cq5wPVIH0SR5jg0Q+CaosKM9n0+MFcQX0BJ3rtn
         VHaGTTmVkZ3nZr+nkBD6AvCOP8rSoQbmoXUoruemCDt/jC8BR7S5PtY/fEIXZfPSTfTF
         xSC2ELtowUWAWS+/TOffkdvcAvhYEJoZYsVW2JUWKgaZm0pspm1KlEHIcm8cB0WmxN7N
         OEfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iDG+NWKTKJry1PYXuHySSa52npjq3oGX1ynso1+Uk148ZjMTWfulN/JbAUtfZ2N9PMxxoomY0IeJu@vger.kernel.org
X-Gm-Message-State: AOJu0YzyPNFr5G0bSLJymTqJgKMD4aNekQiZeALk56p1BMsb16Kna3es
	CiEAOcgER/4e0RCppJ9NVKrFNY7M84vv54Zm7056TvqygKjw6mYbaSXKpadOavDJYZY63CFlCA5
	tVFdmVZuML0N7Nm6w9Ki+/LSCe0ki7biNqEvxh+dfW0x4uqOhFFuVPulz0QUziKJJcKQT3xyL
X-Gm-Gg: Acq92OGMabDO5M408yAJcLvLOkQTAMd3ziViQovwgKGKQlIQHoHcbTHv9fmLi27MCro
	rIW6oncajqxxDowhUjuM4zz85j9+pMHPp2SafFtc8A4MEq1TtPkWOGNARDWWBqRrbl3zK7UCTIo
	loFMM0JrjaQONykcZHlIhX9c845kqUK/g/DEA0WDmY14jicUXbk2X9fqxAD1B8CYOWbcb9T+/zV
	wsnpsGrzb/fg2NKv2GlKflQBp86cM7BcKpjcNUBsW9dA5VQoMmBYkEwtIGwT6iNoZvc6BBYTty9
	stbgBPuLWirWl1oUmiHD+V/gXnkgk+N0bdSfJV2pJcZJiMe8CD9ifiln/DeDZRAlcRfkLs4xVxD
	C1Bd+3Wa7u0yAAUWUbSKN+HRSL5Z4fri8geQn5TT/2MbkHamizOmGPYGoabE2mlWbXU+fCogHDA
	k8c21gyCiCck8OH3djSB3U5c8LTL682yj9WUqxX19F8Az0lA==
X-Received: by 2002:a05:6102:548c:b0:612:7ddc:52ee with SMTP id ada2fe7eead31-6ff02387138mr5734770137.15.1780867798767;
        Sun, 07 Jun 2026 14:29:58 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:612:7ddc:52ee with SMTP id ada2fe7eead31-6ff02387138mr5734760137.15.1780867798352;
        Sun, 07 Jun 2026 14:29:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac3fsm3332615e87.42.2026.06.07.14.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:29:57 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:29:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] phy: qcom: qmp-pcie: Add QMP PCIe PHY support
 for Hawi
Message-ID: <h6fbnsqg3gcobkc6chzehy2ew5hczidzqulr3xh6d6u5kazjhd@ygsd26b3neyo>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
 <20260604-hawi-phy-pcie-v2-10-be908d3560db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-hawi-phy-pcie-v2-10-be908d3560db@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNiBTYWx0ZWRfX5Aq4PXn02E/o
 rXqIWx6PrS5N8oFs4rooY9VydzvrRscjLg1AeuhFj88Sx4GEGo3+jP4B3Ftwcsasq266R8G7NcU
 OqVMNmZWtZmAqTF3XzSS1y3xO2t7TwLjliHpgLSvlKOsRALOT7RB6MN6Y8rgUsMmXfb8uxwPKif
 tGHAwNop8AaoCNOePef1Bqv52gcKR5CYTJKBST5PKFyOOlwyxxy9fCv08VkRhb8a3oQWKlJpbDf
 i3Mnmkv/ZNdpaQfSms2GWnzyhtETpNlLxHDs+4XYdjAeF7gOlK5slbLayGneImfWu0B/Nihtx17
 9loEld9xtzFEiyPFmQ4qrCkhoDSesugu5xRbef26z+MIw/i6j3GwcotwFvD7WeJeP7GiOg6S18g
 01TVEcUOHQYVfA6F1vTAiZy250BvA8vjk/tTnhvwHR80NGlPb6ldpAdBhB5N7BNI7J/Zk2JmJXN
 gvTRP1bszHmaWaRTJlQ==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a25e2d7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_DP_PzDrpJ8qHd2sDw8A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: klH5EmYA0gh_kw3CZM8UHDVf9ZWfBWqn
X-Proofpoint-ORIG-GUID: klH5EmYA0gh_kw3CZM8UHDVf9ZWfBWqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070216

On Thu, Jun 04, 2026 at 01:33:04AM +0000, Matthew Leung wrote:
> Add the QMP PCIe PHY support for the Gen3 x2 and Gen4 x1 PHY found on
> the Hawi platform.
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 380 +++++++++++++++++++++++++++++++
>  1 file changed, 380 insertions(+)
> 
>  	u16 rx2;
>  	u16 txz;
>  	u16 rxz;
> +	u16 txrx;

Can we do what we did for QHP and reuse tx instead of introducing a
separate txrx offset and data pointer, etc.

>  	u16 txrxz;
>  	u16 ln_shrd;
>  };

-- 
With best wishes
Dmitry
