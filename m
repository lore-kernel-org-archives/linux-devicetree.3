Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDA037105A
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442762; cv=none; b=C216xKIpOoU9iR9gmnFsJZTQGIC3BiUSbllFfJBSEUiF7Xj9mOsdACHCyH4z2XnYHPSW2540gsNRQgUqEbkYjuRHWj3viaP6EwSzdXQ09RgnlZJ+hBMhy6VSteG8m4X8cCv7Zrp4Pf+J0ZOvPZiG8rCzZOx3fBhlputKcPcg+hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442762; c=relaxed/simple;
	bh=Q4ubu0LoZOVjTnMIFREBOyr3zA3F/vFWUl5oOcKA4d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onxNA3kQYvpYth32C1OzKF09AL21JfIHwtQ89r6aVQ2z5vcNDAn5KmgbliGWQZfAI+yf2T3CH5JiLRIXP/DeUYl4YPTMIMByUzODX3l4YzwgLCJ29DibK6MCUrPXpxtw63Y7cM80ntzId+d/2+7XE+aWTAuawPIM39kLmaYQWYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inV6jako; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIfFd7Ke; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inV6jako";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIfFd7Ke"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTGBd018069
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 16:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=li0pG6/934G8KYeHkJPSyW/N
	lEpOX2i7l0YxZTpF5vA=; b=inV6jako9JYZ8EFjKbuloptedCjrnSnPruF+dgAQ
	VgHrpNwQaKOATc1se5S2oJy7pOyJAjFC+ClHzRnY1aplgAhAffRIt64wYJLNR8di
	crSe2WeYD1mQ+dhrrHvmMkKv7xq8mhqP/B2ocvAdvxHO4/kqlai8Ab6QZ3nyVitG
	viTSf3RKrv8kGAoq1QeLoG7y9XtQyA8Q9ILm09coOJWpc26I2fpsMiaIGKLRv49v
	Huul7FbPtEHnG9GYmixxaxwoyYd1gqRKD7foDk0sTW8z02Zc+nBwG7VRRfTxWT/q
	pjBt53ScX2JninJNiffyfpone+MxZm7AHkF7gZi8p6Qedw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep28n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:46:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso49681801cf.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442760; x=1784047560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=li0pG6/934G8KYeHkJPSyW/NlEpOX2i7l0YxZTpF5vA=;
        b=jIfFd7KeTbSWv3l4BHyFBIgiKXdD23zVDE3HYnoECayQQAAL2v2z9xf4tc/ECKj0s5
         pnmuhyM8quyzHRU3kL6dqJCUbixYzFkLhrvm0rfyzRWkVP0akPtuV1zbwk3vsLgGt09G
         QjlQca4OqjH4e+Z1Y5pttA4FYrMCW1DwWVHNa9zNyOfcT3DThihnFbVkhuCG2UyudwST
         qLztEgo4OuSxgeNqZ5+Y10QtPw3Kilp77zX9dtVnWbKufgPu/VMLJ3Htr60a/gIhmv7T
         fbbmp6fsZR5AVIH3nBntEZ6nhMUjZRdpvZsCu1HAA1C1Izb+h6zI3L41GPMM6xUZHaWh
         NVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442760; x=1784047560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=li0pG6/934G8KYeHkJPSyW/NlEpOX2i7l0YxZTpF5vA=;
        b=cX90IZmYS8MxjvWe5ZZ82e2eWUczDGYcfOlUiZ9bmdzqM3sFsNR6FRwstH0GoBzo1w
         LCM6tgwlonLkUrtbxrt7LPSlbM5QQ6qWLQnH7MSZj8hybuvD8YSPyUc3WaGX6HhJcFcc
         aFzMVZrYpycLyVRcUA01c3UkkrqoThJVddfbxpoELYhrVraTZ+24E6QCVDN4sBRx1h9x
         oJ3DRh9UU8fOUhk9+CROIqt/K+DXD5lPdqTJjxrifRzW0Vd4pOMSDRZ3uJ9QaBZVYrOe
         VuVTPLFUFD77T54FNjLhiGzzKd1xOiWyVf2Ure/+UsrfTYZoMLML0Dx2hxf7EKQfkMrV
         ZL0A==
X-Forwarded-Encrypted: i=1; AHgh+RpMqk8OIySv/JyRuLk7P1DjEAvw+C/fJ6CgRs5zNOCGD0tlj2tRB8vWheQKgssmebVpu/V9d1NGarp9@vger.kernel.org
X-Gm-Message-State: AOJu0YzXO8CU6v12NaudUjRz8MQVRDUbHxDVOUxXBfJcvX3wsBTd/ruM
	H+FxF7+iGS1s6vH7pORIZcoIslR/C6vi180OhetWYprOVLoRy1BpBm/64wJRd1avte5SMBNcvXt
	fjtVlRuPuWGr6kqDYBXsCfWPYTg05GuZiN6HTxAs6pDNltoAiagsuJO6AtWN9sPLs
X-Gm-Gg: AfdE7cmubdrqaITKLpL9yiTwnA/ivVSIrdPdtjEZVcWAUrgmCv5jiZmjVz6QhkkP+KS
	gyZxLO/iHDgZQ+W+1s/RZcRvqtmbn3zKuCZD5M0T2irrJ+unqHPjIUtkygRfcLIGgH7ozT6IEeI
	UQaVeEZQ8hTEtZlWL9Q9WrMOqXPmpe3DzhvA+vDHWDLJ2TqAxyq9eHtl6EtDGxYJHKipYJdsORe
	Yoy2a4O9qaZ3JL8fsEcouK4y2+sq8773DVNoWVv8mor04BPyveTPrsO3fc9yM9tczDyvn2FeIMH
	TUoK3hA/XmgD3mnRCc7WCGNy/6Wzkj3zUKmONod6TgwhA93vBlxcuuP9kKJVe0p6i0n98CzZHXE
	KG41HrWfclmxUsAtWq6j5+Dm1JxbLYioQp7Fm22axPYpIw9HHPO+cJ/QLqJTu9eHr8vNiS5n/rP
	n76admf/0Mlatkfq3RDEKJhD/d
X-Received: by 2002:ac8:6f10:0:b0:517:6550:2a0 with SMTP id d75a77b69052e-51c747e7017mr67957361cf.19.1783442759311;
        Tue, 07 Jul 2026 09:45:59 -0700 (PDT)
X-Received: by 2002:ac8:6f10:0:b0:517:6550:2a0 with SMTP id d75a77b69052e-51c747e7017mr67956291cf.19.1783442757448;
        Tue, 07 Jul 2026 09:45:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a0asm3798176e87.71.2026.07.07.09.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:45:56 -0700 (PDT)
Date: Tue, 7 Jul 2026 19:45:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 0/3] SM8450 IPA support
Message-ID: <udhpg625pgm2zoeohuvlg5ndr6ivnjkrwxzy5vklno2ktcnro3@ryigk22l64ji>
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
X-Proofpoint-GUID: iMdT-kfP8YdUz5aLzcQB-ZVsUQJPfT9W
X-Proofpoint-ORIG-GUID: iMdT-kfP8YdUz5aLzcQB-ZVsUQJPfT9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX32Y93gVf/SeR
 jn+ongYa7Ur0C7G9n8180lR8f/PJeKB2bskp/kUwAarsb+BH0KI38nMtdX5z41xR4pCZeTiOudT
 iqOrOaZTcFUoSuEviEVnLIGVYrhdMs9KbWLXPmkKFkdMTQNIdNXpVgaYDV9zfqWuN20RSKrYbQt
 muQlbDLR8o1IjOFYl4tpaUk/3I8/C1Do0Om2bnk4aCOzHAg2OqFpIOgHBbh4+v5fsxWOPE5paNQ
 GZ2kDYr4ReId83gnkoPVjZIY0Q8yiS64PXOZUSAal66sFqWTU74ysSLU+jHhvnuOtPNJByYgn0O
 N8cWUyhp7Zyzt4TdWEv6Tz4uzizlFWIP6X1HyU6Hryvu1cVU4R/aQSSGYhLvqRNsEjNvzSvE/1l
 /9I10ExoJdfGTUYBTOPUI+XCpBbhwP7m4HgcjnApeLdT3rW9auRZ008cR0twJv+CRYF7Dj1lCRs
 6CBmP/30fSVBvVkju+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX+aOY8IP4r9Sa
 5lyyFewuCxh/lbtavqAVNpjRGW8TT+ti3DAVmwSNa2hJb6/Djz6d714+2enkUsWk7BqAVkMBlir
 /Flqp9OLttUVOEeDfl+GwcKSBQVV54c=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d2d48 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=MRZpAjOZwpHdsA9w-08A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070164

On Mon, Jun 22, 2026 at 09:44:16PM -0400, Esteban Urrutia via B4 Relay wrote:
> This series adds support for the IPA subsystem found in the SM8450 SoC.
> While IPA v5.0 is very similar to IPA v5.1 (heck, it even managed to
> properly get the modem up and running), it wasn't perfect, since the
> modem would sometimes hang when rebooting or powering the AP off.
> After a thorough investigation, I managed to create the proper data file
> required for IPA v5.1.
> 
> Regards,
> Esteban
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
> Esteban Urrutia (3):
>       arm64: dts: qcom: sm8450: Add IPA support
>       dt-bindings: net: qcom,ipa: Add SM8450 compatible string
>       net: ipa: Add IPA v5.1 data

Please reoder the patches:
- DT bindings
- driver
- DTS.

It follows the natural way you'd read the patchset.

> 
>  .../devicetree/bindings/net/qcom,ipa.yaml          |   1 +
>  arch/arm64/boot/dts/qcom/sm8450.dtsi               |  55 ++-
>  drivers/net/ipa/Makefile                           |   2 +-
>  drivers/net/ipa/data/ipa_data-v5.1.c               | 477 +++++++++++++++++++++
>  drivers/net/ipa/gsi_reg.c                          |   1 +
>  drivers/net/ipa/ipa_data.h                         |   1 +
>  drivers/net/ipa/ipa_main.c                         |   4 +
>  drivers/net/ipa/ipa_reg.c                          |   1 +
>  8 files changed, 536 insertions(+), 6 deletions(-)
> ---
> base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
> change-id: 20260622-sm8450-ipa-5da81f67eb65
> 
> Best regards,
> --  
> Esteban Urrutia <esteuwu@proton.me>
> 
> 

-- 
With best wishes
Dmitry
