Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69B02D3ECF
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 18:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780858652; cv=none; b=Nwz/3C47MT1l+bI069KudcgE/a8zVgOB+miWrXfvQBmLrdTB0RbKlWdOp1kY2hB3B1+yBEI4kMWoHL7fTpaJkWT6r1GhEU0qR+t7iAfPy4wvwV0b4QBNug81N2UFHxHayF61KG2vU+FOhsG6gn90UqcjhFKrLIJY32bSyHqGj0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780858652; c=relaxed/simple;
	bh=0Z0rUk3P6e1aKqaUDC+dnxoHSCEs3RS+zTr6XjUVdHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYO/tFhKzS9X0YH326rjgw6lI4IahJE6vOOcLZ6wvYzHW0pAoUxdeADR5HVY0DiD283d4tcSEqjvxQwk+U4JGFqBWSBbIup+/lI9bPlbTZRxvo4dsbmEC9aPpikf6O6D9zGD/Qf9lnJqDx7mrfGHWKLHfEx6zbGt91e4hrV7hx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GR4fj4I+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZqjJT3Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GR4fj4I+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZqjJT3Z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EmGPR828826
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 18:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=irC2sN3m8tT4b9PsGSb62/W1
	2PvIW057qsOi4D4gu4Q=; b=GR4fj4I+5Yz+sS3CGE2HQGMFN6ob1xrZKhgDfVSI
	XHYfD0QtajQzopGXtY2seqyKweMXAPyDZYKSLgVMMbZbIrp+Nx6tn57tGFIG1DDS
	6ZerZA6/IUclEhFd9cPwSge7X2rnVbC+EVndjkBwyhB6FGrAE3efhDUEMMDz7Cbc
	TZFnLe/Ea5WSMZC0lu+ipcZrLcnyHomcrY81sD/KOFuHosHErJTv/W1iG8vsRtwn
	MvAqZaGJuYMoYcisjxJWuBWABFK74b6l3eRhmdCGzgVJpP+0NqkFHGy6AMy/1GbO
	yv/07LYfTJs5Z+HzwP+lwDhfRxAEMl1NyCw9MWcJQn2lFw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6cf5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 18:57:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c69c788ce7so1597302137.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 11:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780858650; x=1781463450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=irC2sN3m8tT4b9PsGSb62/W12PvIW057qsOi4D4gu4Q=;
        b=VZqjJT3Zh3Aa7eVA/mmu/rnGOlUZ49K9vPO1DnyOzX6X38++0xjkrMZbcQygVm9n0i
         pJkdhzcbhzqY5jwR+maVykf7Ec8T4ww51Rmzni/LGRnokDDAWv+gJyMK9+HN1Oy/c0WQ
         Z1v9wa34Q+DxuQUEdKTviLt1Kw76CrCTc46S8fDkfUBzubg2V3APPKs/jUdHoR1zYlxc
         PCit1AyEf7xlu6A4fL2QAxIsP2JjLA0ZISZSkEmjX08rDuIF26wuQWmzrc2AbGJxEJ/3
         cTTrqVyuW8Mn5wkatz+Z5mfC4UqDal5KvSTwu+l/SiYINssQHfPAAdHdqg+X4K8RFxgO
         eO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780858650; x=1781463450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irC2sN3m8tT4b9PsGSb62/W12PvIW057qsOi4D4gu4Q=;
        b=ToQQkBq0/zTlH3HEbhLineWMjFN8nfPxtdmHXBqnhlnYeEhtAn7f8rN70M68TSeLvc
         /yVxUuldH5j1HAIpe+NfMQcBJn2iiuARgA/J9NoTOY+3TrVfGUd5uOofEO0OmdvLWRGu
         JkpdDcpAjrCCiLqJth0muPajvO6us87IL+Upig8+Zvy3Jw1XQr/folPcAOyxrYjrTX9K
         xCGwXMStrLB5+GRfmiDWyUGpersXGfvVSpdxeNOVpTZ/FjM8GBAmHNL5XcmutmDdkBqt
         RrM7w93mjGxMwfBqgQzBuUoDskCjpEQOcjLsIksTzp/O9zehslgdB0pxbRndEmKqigL6
         f2iw==
X-Forwarded-Encrypted: i=1; AFNElJ/EVkkUxhtrkebogdMj3EBiCrJ3HGWApJ+58tU0gmOCqX9lzldzORYa6omahmWC6fQgnjKID1szwS1E@vger.kernel.org
X-Gm-Message-State: AOJu0YxhRDDuEY42T8KrVkjS/b58GcMiJvtjTd3e8RcsYU5eHX8qJRdK
	VaLXm+3PouzCkaWPQC2QD9D26/iiN73H0xhN8viaOi3bQR6fRp+zE61lnlxj64zaP7spDtwQ87h
	drBgY2gIRMTIDNmkUoNbDgkaJv+KLqQJxRQHV2AEdu7rTdJN8tBwu2lk9qXCr5r1O
X-Gm-Gg: Acq92OGQl53HJ3PmCyuZQSD2D1YsIFX9MB3BFcc6EgvCSIjjHIvPTuKekhMfwGs8Iox
	I4UGUB5uiPby1XDnGzL9fK1Q1kYFUlFVnQPuhuBrrs+8SMNDlnnfbgDJG6IvVBl3lzA9VTBfcME
	b0Kteco30+js3bNX+lOPi6Pc+z8t8GSR6Y2aBc84YW7JWl6wLnJR82Z00Tt9Vqx0ksiOHsi25EU
	rGGjXv92jRjH1RVSvHy8a3GyOge6G7JB/xKGSRVAfirVfThRvKE3bKdmC494fBfO08LmlJ52zPa
	g2JnyoCAmWXHbiAtMG+lm11qTuieB7B1jlmPlOdeJqiF0nW/PP7SYnDDSpSUhnABYb7RNHTQ6wt
	ywfLObmlGEd5zq3MDi2FRGxRTl5LKhgraix29D9KznN77JfAQzsG/DFt5ujH/jYCJxLC/V5CXYB
	jG7kqkmMTEjH9DFWvyzMuJu1pA5GIdI15/Qbq55MYA2VF7Cw==
X-Received: by 2002:a05:6102:161f:b0:6d4:ba3e:bf97 with SMTP id ada2fe7eead31-6feef46bf5emr5702256137.4.1780858650097;
        Sun, 07 Jun 2026 11:57:30 -0700 (PDT)
X-Received: by 2002:a05:6102:161f:b0:6d4:ba3e:bf97 with SMTP id ada2fe7eead31-6feef46bf5emr5702244137.4.1780858649647;
        Sun, 07 Jun 2026 11:57:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b042sm3249598e87.47.2026.06.07.11.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:57:26 -0700 (PDT)
Date: Sun, 7 Jun 2026 21:57:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Convert fb
 to use memory-region
Message-ID: <bkwnuydwhalxrvr623zaxwad6g5hb7eop73cgn6affuqz3ozya@wyt2ppg7jtuu>
References: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
 <20260607-shift8-fb-v1-2-72b9dac25f4a@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-shift8-fb-v1-2-72b9dac25f4a@ixit.cz>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a25bf1a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NdoN8BoSjOhuqMYtIe4A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4OSBTYWx0ZWRfX0YJi7n1lU7kA
 yrdrbje8bYXiMfrzXgB7SQqsxXk9ITBIOMOeF95MLkNS10vfW8smh8qEZ+qpfApT/N3yW3d3qcD
 P/dopb9eK1EMmTEs9T2kktfhEXZ/kLULMsFs4xNM6OCdO8UoC1jLqE5XCfODEfiYiNOiiHr6EoK
 dYkz2q7x6Siy+7f9PAB4wusqRthPcYGLlAFTtLmqebPxVQwgGEWrWrhdspIO/GLZHRfeHBx+nsL
 hiQeUuyrb5P8i+3k1wir5O1lVGIW91RlmYsGgVwn0xhDnOyAUWFmEZgW2JpIE7pvtDmXdt8dvBx
 SxJ/AWVsvXiRqhBwyFXg3KQqSUBJZRI5PreuHO+/whgq4SizMYcuO/09hZc2n7Prsug8YTQs2lT
 6TryzdJBBeaLXWXOdvifOeOFNQXhsS4wGf0ErtAP3enaq/q23HTJE6hdF8Neyj/WckMyWRdB+Cf
 74FLmK7S59/3DbRgwDA==
X-Proofpoint-GUID: fF306ONQxG-x_GXIi3xVM6ZWCZmmDGQo
X-Proofpoint-ORIG-GUID: fF306ONQxG-x_GXIi3xVM6ZWCZmmDGQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070189

On Sun, Jun 07, 2026 at 04:12:19PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Instead of manually specifying reg, reuse the memory region.
> 
> This fixed mismatch of the node naming (0xe1000000 X framebuffer@a000000)
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
