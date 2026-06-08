Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B7031E83B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904676; cv=none; b=HRLcgg457XYQV/n0EXEr/n69rMkotAgzPup7TVTikGHDUjlnBf/5cTDNzbK5aBIvTDSZjJ6U6iRBchPfJevcO9qtQW61b0wHEhQpOzBhAQOW/dnXyBM28EZm25EQSnefrvlXhoH/M0JsRJCdTPfxv1uSYltYSC1GL8ELqFN6zvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904676; c=relaxed/simple;
	bh=KWb3kxI1hzOhODqZtIDXwc/K6/WOw09NORDY5ydQsgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4xDyip5w0eM44imSB2XyIn3IR8HPn0LljSL3uAzeO2YWYTlf+1L4bK8/hVpXfLvPDXj6cWAPeoq6Pu1hQY37YVF/sHOTmKu/XICGyefkiBLc8HzRPD+oSx/DwKHPrbVcv1k9hM0BBvCiUesNd7SOdIjkdMSnGD3ku7IpEa2x7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdTbDGVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhgQ290N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdTbDGVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UhgQ290N"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OkNH2382817
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 07:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Om9/b3InRoC7m27xNLOqNi2c
	Zral7wPlDrE1Hdjnq5s=; b=TdTbDGVqCbMhRZn/ozDNKNXieW+sGOrTrYIF1GiN
	mDDSJ0jCTvTz7t0MiyDX/RnvUrr+tMO9pNAOAlfFeoU2TKle90DT/rhX6NfV5NIK
	xie/r1KN+wkH2RbkeVxjyABzq1ot2eZQkMAU/wpW31owgigaVtUP77cfJrGwjaE5
	uO0vv2quHt9LYuNmKjjXdFNfPSHRL5IZmUU//6hbOLXacSlJvJNG+TZLbVLnZjbT
	H+LrjVXWUy6sY+AJQJ5j/F0t25dUZIR8OchaT/ybO3Je3dXWV/0WafpuRi4XFYNP
	7nPg3QVEOZKTWawcfAeK/yNZll8s89Gdhsjfp+7ryHzAZg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cy3m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:44:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfc66167c4so1579678137.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780904673; x=1781509473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Om9/b3InRoC7m27xNLOqNi2cZral7wPlDrE1Hdjnq5s=;
        b=UhgQ290Nd7gTttNeDF07bZjf+lngbg4C/9cdaRYGAgNrNyRvks6hU2zHg5HG579R09
         zK6Gg3HVlAn2w8TUCd2bBs8EmRsMLb8DEM7I0Ub+Tff9axtzI7rIi3vCxHJ9V4vxQCiS
         QbDpCsRpibwk0Gc7mUq3t8Nc4QAexxDJJYlWbSDM9tzt10IuaBa81H4qbXuZNAPc4I+h
         Z161uFWuHZGUHibmw17J7J/29e6z5l1xsh+GRgNOimJgdWT22N4tuEN6Kojx6h6aJZwg
         AQu9yTG2bDswbN10i4a3BduqFYnh8aVuKvJXteC7/FURSK3F8wSvfD1Ze4nxl3pwV2cg
         3LvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904673; x=1781509473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Om9/b3InRoC7m27xNLOqNi2cZral7wPlDrE1Hdjnq5s=;
        b=Rw1dbmI71vagJggdF417j/EaNyrZDtc1TOlOZHCa5O+Uqo8l5pEFvci7xCAMgE2OeZ
         DLeLgcLdlrtjsEPQwAtvFaKYGUvyMeq/2bwnztIfIhcQWS7rlljXXkg9jERpJCXQcZrc
         TFEcDLfldWTztRBPhl4oQLRrJyAcTkBKIpRn0NXnyrTaCKN1PK4dm900sXD4chw6+QTn
         I8fmmHmmn4NOdXp0O35m4uKOS5bfMr1aAYrjLY7j97ZNWWbrJdpEQYSFNwDldLaE24hF
         6JYUIOY/5L8BrrbOztPqRmtfQKEls7Dy2W831Saxs5HV0V8rjit68y7lHmAFBkDVU741
         1fkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lh5ogwRXJ7a24L53bymnpNA2UOyi4xc/aM3OeezEd22VyGDhXZKsJnfVEQanwPdyRDNROc0u9CIIW@vger.kernel.org
X-Gm-Message-State: AOJu0YwrrrNKS5aJ76EtdozVtW/qGdFy7vVou0HXIYIfZoatRoz8GlZn
	IU8RMeA6dN9/uCJ6KzUdS9mdtllemVJakp+WcXZ3lE5mnNL0i8QqW7JHSgsH7xqpRDUwSYrx/oA
	iE67hIKKmt/VAZVhhNUyuHnZoPcI+Q83uqzc3o0fi7r1EIhXFYyvKDPaQzlZWEr+9
X-Gm-Gg: Acq92OGlKD7pgleBM7bouMbC2xIc52etTMi+fGtMQO8+u0Wf57ghfMpi5Z2JKyjO89e
	Ro44ouFEHZbkdHtOKazlMeh98k4+B4FD0JL4xq1nAc3NhI/0mDaVVlxzNuLHF5koJxnIs/rdNNo
	Oz6sY/Z9h81qbVTtDai1xlaR7QTs1leb2Ld8y9XVO42HatVPXS47uQE8FYXem+M3+qIsVZWMlfk
	CYnOwn80aBkmqh9/2Bi2ze9dHAXK+9H4Hx+w4XYL/ilpIsD+kHQT+m6YIswWGAd6e+pHxqGObSj
	KR68NPDZMQYNTes5p0a69VrogOCclrrI3BDfE9gibLCfVRgBfl9HjzAQBRLJ1Vubix/UMBAn1xl
	9jEZLlFRKO9vKAQ+zZ4oYYWkuDDIyrNk0Kl2yq7YL0nntpdvL/lVbFmqHTvMZNj2E8OL0JyDWHu
	1bhEzTQDTia/rzf8EJQyfSgrP1FyAXyYqA1+VNktzz33UzNQ==
X-Received: by 2002:a05:6102:510a:b0:612:c135:1b77 with SMTP id ada2fe7eead31-6feff62a683mr6073296137.27.1780904673337;
        Mon, 08 Jun 2026 00:44:33 -0700 (PDT)
X-Received: by 2002:a05:6102:510a:b0:612:c135:1b77 with SMTP id ada2fe7eead31-6feff62a683mr6073289137.27.1780904672939;
        Mon, 08 Jun 2026 00:44:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990344sm3610214e87.65.2026.06.08.00.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:44:31 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:44:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm670-google: add lpi reserved gpios
Message-ID: <jbaedqlb62m6pspq46e2wdaqlvimzepqjzxz6fnnroluu5bwqp@cotavveesjvm>
References: <20260602021722.30760-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602021722.30760-1-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MCBTYWx0ZWRfXzE1ZJqfOYiIp
 uU+3VWP4KEdOfdFpmQlBOzmbDvlGN3frmPvke5BkZFQ9kKzeB2966MMlWUZATPDhjdM0QhaS7bn
 uYWJV1e/xzdW9pRNwLhnHSr+WFpSipr1CRdb5+/ohI3tYUqaqjTWAslNxMV0irlf5nTYRBbwKJD
 Rretb2vTnUrk2VBgIoak218IJ1rdqwVy27Sg7gE7W0XMbVDwZ7Q2xBZIuFVGgdsfR4VmQaq9652
 58DpodVQiBd8dfunfIT7pFDPhC/F/sElk68K1xKd3U/w2wya/vPjPBGOWXDby1Q+YYO6ZPOC3dK
 xPJMPRGCYLiUhOE5h3OYH85SjFkIPqu5LIRASK39ccTdzqF3XlTLrSazxm4VCnvfCfEfFKJrTEn
 6u6lRR0ER6qM1I1gTsufWgtx6r7Yrl+rSzXmV+jrHfZZRE4CJqqmkRabbzSdH4SdNaXRoudUKxV
 wIOU+iNfN2D/+Z1f7Lg==
X-Proofpoint-ORIG-GUID: nS_QXnTl5UDYW64o0kYmxksSXOlZ9qMA
X-Proofpoint-GUID: nS_QXnTl5UDYW64o0kYmxksSXOlZ9qMA
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a2672e2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=BITVXKfNEooxrV_AlJUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080070

On Mon, Jun 01, 2026 at 10:17:22PM -0400, Richard Acayan wrote:
> Add reserved GPIOs for the Pixel 3a, which blocks access to the sensor
> GPIOs. The hunk in the original patch was dropped in the commit because
> it depended on an unapplied patch, which is now commit fe9f4a46895d
> ("arm64: dts: qcom: sdm670-google: add common device tree include").
> 
> Fixes: c4b423835ee7 ("arm64: dts: qcom: sdm670: add lpi pinctrl")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
