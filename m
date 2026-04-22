Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC81D1F099C
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776819498; cv=none; b=m22h1gZ0y5F+FaRnfnmglyBDZ9pYbvli9LdwWeRk+fPIhIC7Ct++7vH29cris5etVyh6WynVWdbxJX8wPDJC7rSvbgmUuHmrtvUXJ1XKOj+ESjb3MdyH4eGrXga8dpeCbEQAOkjj7PJtUrH6FCoCdoU3JPbacF/CrcbYnt3ktao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776819498; c=relaxed/simple;
	bh=0v/cGg5pUVmJiWfDkY0F4IX9flkWG6/oaecceDVh1Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBuVdI4j34lYyiD6rd8K9u7h6cTlxfh0FMfSo1MNCnEjtSYOwl1xiXfUv9R4hiXvoiDj8o0E7tL7hAsFXZ5uvAKWXRaa8Ii68KLMMNxbMUPph9PmUQyoJCAnXZ5hZpGXtszV4+D8nH+Zxp4ccE8QaQTNOASzuXIEVO2qk9EqEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwhw3Alh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JnlZfOzn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwhw3Alh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JnlZfOzn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZuC73730894
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=os7fT3QKhH/Yv1x8DZHj8ydW
	g5CSTjDgo9cQ8O6Q6Ng=; b=fwhw3AlhbUcdovjSX4nEG+a2lO5+IMs6e5hlV8Cj
	1lz/O4wOUJh8UrX8cEVcBJVTHmSW4EPXvCIxoPAfjgDRltKl5D7A7k9FtvyvpJuk
	EECUggnXwJ0lVGFSLx4p+z4NISy8CDD7RMk5sHxyfWAsgC1ATraRfd6nfym1N98c
	PRFVfZDvaTIOIlc5Y2YQVSVQOgjNxAeM8nr2Uuwzi9V3Oqk4OjnjM5Xf4KCTSMBr
	thNlKkzGHcvo6y0vzg4YI9za+V/CF46S07WRBtVGvH7Q5Egq0zppe4zcXJjmOMpo
	nKWwfU89bvaqhE0K0yGC02RvMVmPqECi5fWhu3j7+oHpQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfry3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:58:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d826ed6f9so25363831cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 17:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776819495; x=1777424295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=os7fT3QKhH/Yv1x8DZHj8ydWg5CSTjDgo9cQ8O6Q6Ng=;
        b=JnlZfOznbT5q6eFFyYZOSFgUws44bQkfi0joQbmheWDLt89AO/a+Ap/fG0zPJ3nJgV
         7MORL3YVnE/ExxeEJq9rNXnwq/GS52rW67NW/G1K2UtP77d9rjSLe6glnPbkOEtwyQeB
         8/UU81F1psC9BmYqiT7mu/fJoWAmD8b0muPetLY1GXt237Sqz6ifJ04xbm3Uk7KRDy/n
         jxHZehDjkPEKFV2boGMqbtPOziAmaAsvQLwC3QYDL6ty2CtgahZdIltiSBwzE/AiAZjB
         uEZ8Zny74RPNi8Cg+KBNLLNvaWLO1C1ba+Oe4tYXJdwjBeHkjeh+mwgiJ2KT4szYwVIK
         67JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776819495; x=1777424295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=os7fT3QKhH/Yv1x8DZHj8ydWg5CSTjDgo9cQ8O6Q6Ng=;
        b=ZewXSLzodYbeMp8o0pbkdjtRQ445lS6NoC6fudVUr0Hl/apWX2UVqnqBICjESApcMw
         HnlzjA9p6wsa9Tm3I2Sky///X5G7Pf5QBtDYbquTOgaTLj78V+cLBJp/87hDsORTEHTF
         iRCnzEsJMBTnZNVqGunukvur/7M3ybknj5Vo7SzWxS7do0r+7V5FNlhgtKdNLH3XPvyQ
         ALP+fkqMnHINis6f/9vQOi1vSN694Tz57W2w5/yyB7aQcJgM29sUnKAJkW+yKDoQIcxG
         /lwyOP5+MBSV1Z2zohQVsCk2TLcbDkQsN8Q1j2ZYrMr/SrtFDF8thjBlV9w+CSX0HvDi
         E5EQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cizr2ahDUmaWuLmu9/QVI2ODdYKN8yBXhDR5SXh/G2AqUeHqDkZBAHFLEDHXvpmZvBsx9fymYoEPJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxYrZ/o8VMcSl1O/Hs2uwOloH1OEDPyXX+sYgwfws3CtXpXd/fh
	SpnCKCmF6BJQphIT3X5ekcSz1nbJYbDTH3UIexsxZnf9Cz8kr8JWXCQo0IgYlWZnBpdgJZc9Q0f
	+lH5shMcBeYp73e5JpWu/UnB/sMdftn1h8NRjtubV0yY2zaa3xDMg/0jKwJw8vTae
X-Gm-Gg: AeBDiesihQCzHKfUceSYR71DjWzUFJLU8eyc9V4E+4DZX0a1ScMG+5Q4FzzlAwOlEah
	rBikM1Ln/mnhr7K0t/8mqcQ/2016Y/3LDYYK+57PR16WIIlEwd9pmR4sJUAHYNrAopAq0zXF25S
	/6xUsRFPnXr3+V96uhwEyPps1HhXksF8GJyULA7ZpVMZD5N02nSs9NliP1l91L4wfRFKe2qX3NZ
	xOMBJG+PVmPZDZP7ZuNaVOXBEsqiaJ3G32e89wZdC9CpJ+XuW/MMAVZZVc4zvoLWIiz0CyDXBs6
	yz0eXkRGFrPtvk46XC+sS5+SJ/xF3ur8KqOPBHAuCVo0ZytZ+bx5K5H4t6PKFqqJrkWZT1Ezlxg
	id+vuECQPN/ghFdtETsjsfiSBebGsQwEPC1orxTbDSh/ljgJcVztso/9vbvG3FGx8vwCy/5CqOu
	aYJVMMerTiQ8KMtHEvE+oiykp1XIC+g6LoKbBJiRY7ekSaxw==
X-Received: by 2002:a05:622a:5ce:b0:50d:987c:8174 with SMTP id d75a77b69052e-50e3661c13dmr256709941cf.4.1776819495269;
        Tue, 21 Apr 2026 17:58:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5ce:b0:50d:987c:8174 with SMTP id d75a77b69052e-50e3661c13dmr256709581cf.4.1776819494819;
        Tue, 21 Apr 2026 17:58:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a3fsm4007411e87.59.2026.04.21.17.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:58:13 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:58:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 6/8] ARM: dts: qcom: apq8064: Fix USB controller clocks
Message-ID: <56tmjiwx3xepxky5nqiwhqvgivgwhnq6bdm5lcvbkydnunrpip@blaaof5fn5s5>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
X-Proofpoint-GUID: Z-29Dsbr4qN_f9zDXuj9WYD8kUMzZ9XR
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e81d27 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=accKExrkbF7l0cSrD3IA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwNyBTYWx0ZWRfXw/X2K8BLqUoN
 y4ONy3SQ/J8Up+M4K+UodEEx1uAlyFE+V6hBxAesOwgK90yUkkTLF7cCILnv5DPA61SCLv4kNES
 BFmtV/dVno9HOgjGu2UWI/kY4jMFu0Qbta31avGOolYlI38TiUa3gMlM+ULcl4zebKrTrOoT9Hc
 lbDE0hlfX69UKRkE765pKR7botyr2qsFuZVXEWmMIqvENG63alUksL5UJWNjRs5q+yPNC18aN+c
 pyOYkeTGyQURm5PvbJY7rPwlDi5aObJz9c8yDl9GPV3P6U/V5+Ui7+cFHXmGKQJTX6jhQe5h1f1
 jSh1annJymiNac/NGh+sC/6c/936ld37oRauOq6LhCuChvh35q/6O4Got7wA8Jvpy0Kfz+LD2aR
 EViaffORmDKfGVS0RjAFMzulCsCSV6lMN50LKmXXgfbFSlhL0dkp13VRw/EsUVkRtAnkFWHPCoq
 QOyE+EmSj1nESwte/mw==
X-Proofpoint-ORIG-GUID: Z-29Dsbr4qN_f9zDXuj9WYD8kUMzZ9XR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220007

On Tue, Apr 21, 2026 at 11:45:12AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> The APQ8064 HS USB controller nodes describe the transceiver clock as
> "core", but the ChipIdea MSM glue expects "core" to be the controller
> fabric clock and "fs" to be the transceiver clock.
> 
> This mismatch can leave the fabric clock disabled while the controller is
> accessed. Some boards may tolerate that if the clock is already enabled
> elsewhere, but it is not a correct description of the hardware.
> 
> Describe the RPM Daytona fabric clock as "core", the AHB clock as
> "iface", and the transceiver clock as "fs" for all APQ8064 HS USB
> controllers. Without this, USB does not probe reliably on Samsung Galaxy
> S4 because the fabric clock remains disabled.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
