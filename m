Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9634DCEB
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492773; cv=none; b=ixK8W1p+IeCTuxd5/YfqYLLaPSlWzwlWlGp0IAj29fF32mrswNrhmayNWO53XSWaX1rU8zaU0i1F5UCRkDxZFQw/6ql6wQ3Z4tc92ZWaerEwmPtqCu0UvTHI1YbOe59ZncGImU2jOLyv6W1B9lIt8L9g6cvPEJ8RE7ok7qzhHsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492773; c=relaxed/simple;
	bh=1nBMSmHkUb3Jkq9JMXc+5j0fs9PgAQlDAMdQSLgzC2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRMhdkOMujoKAeWJkQ5WKM8LwkuXHzNDjzimYCK3dbieaUuEWgCdyWpe60cCU0SnGdCzLQ5D/gd+5YJM9knDHOxxEg/qniSCw/kDfXmlyC2oUTVnbWncvBSAzSEW7/Phly+AdP6DOPYUwO1UruvFkyyjC5pG1MFRqhU3+W2aBYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIG5ks45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NaOJbtV9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIG5ks45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NaOJbtV9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CMGdv1200009
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 13:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZQM1x4Esz4yRdbII/P6eIDfx
	ohTjz68+7v0muOP15vI=; b=aIG5ks45N2mu/zbkGH1OWKWZrUSRPGfglAxBph1O
	N8eAVRUeYqEK4rzaIELDKoX++7MJL8iXsmufopxacx2HgBBiklHaXsapgrlEsaWn
	G9z1nEZh1zbAvUVE/4n/oxBNA+5H5AhrOGjQz5g9u24yzBFv5NDeqyBFqM/MkrrM
	N9WAs/DAP7xWnzGRAQGg/pCIWO5TaPEnOO7HQ+VmtS0EKmnGV35iXkiz3nb1Wxrk
	jDMgo2aRx9PqYV5oV2UabtP1laYDh4gbWLV1n+QsXrmj/01TNEJdeRpSu+W65C2s
	lv6jnttT/K4Q0XfFeWkfSRKVoROFz7c3rNxaKoDRnFIwzg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw25ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:19:31 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c152655acfso2607753137.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780492771; x=1781097571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQM1x4Esz4yRdbII/P6eIDfxohTjz68+7v0muOP15vI=;
        b=NaOJbtV9dPLn1B5mOu2WlVi59Poj2YDzaqdw76FQCNKNrv/hYf+V5wQ7+URpZMMl6i
         +oSlcPrOCj3rUU1yaMfpDv5utTTFNnCANxPop3iWOYqZtFnP23Av4sxI01Fo7lq1h4uq
         pXV/r0yCPX9rLJBoTzfEAQn8lWjX6p8QMTBC2FCPvhr/jS7/UlAmBEgvlvpib4xl8GZ4
         cC4drc8jPh8uRpXWRcXA3NFFb0ahNUkJ1k8cfL8XWcex8OoOLcugv5WaMVQfgkovy5P3
         3J70E4E0M0m2uCDqVp63PjfSLkbRaqjwr3EhnXeZpKk5w6jj9PPT4t6yHCLLaeEwsZAT
         fuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492771; x=1781097571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQM1x4Esz4yRdbII/P6eIDfxohTjz68+7v0muOP15vI=;
        b=D6e1XVBm07lOkrWoN4oyOKLJlUUU1ZU4E0av9mBvPdahG1KZMjr4rXL5SIQhqMTk4Q
         XvaZY8QO3+hBLO5l9pzSUn85SZzGyHFrF+Ha98ABtXSIJPbe//UNlsq8UwjDWvNFM7UL
         KZMxkHH/6rvRayWSOVbCEXeTwy+PckZBPZEQ+yMfZNdW01DW39QVPLTArf+4o7s/xakO
         WQF7x9czoJ0wc4tHP6dw0U97r7HwnbsH6xe8an6daJ8fO5B9nmcfACFSIzejMCzieeiW
         0qK4kQvKybrlP2yMxikROiDrEEu+JTGTZrUWyZsJpJuVG/In3s+nb/sWDL1Od9PQ4oPn
         hMEw==
X-Forwarded-Encrypted: i=1; AFNElJ/kB/zUAOnSAJMEwg9QrwAiBNa07nHbXt5f/Nc8vi4nxXLXL5iAhrR7vnu0cdMq5FsJ1TYglTx5LZR1@vger.kernel.org
X-Gm-Message-State: AOJu0YyWkZqUuXzGqpUvQn9TswLDfNARVuDZS+WsP2DAfs32UklMdeiX
	KeU8B9ikueWSG7jVkkwYtiqMCHUywF44MJzNNJZeifYOiPbnKsH3Q1abxLYlsDRpclB8kNFrqxt
	50fMU4k0fG43+8lxJen/kJfJobBcWn8wx7YsnCqtvm+7ZR+6bLJMBHshAqlZ5NpgM
X-Gm-Gg: Acq92OETzm3xZjpZRke8KeFxulFCbNr4bD1Zq64Nx+qOeJq07H2Ft5x+Jxqq6RvMtbW
	+rQa0Y2hMbf826yyiJjrMipY4WbeI+dZyAhtsxKDIRxuFqyCrRmtBCWsPVWSSPwIgg1ZP5jTtuL
	hv5JcAfBjNPBt2T7vu7MDNHPr/wuD7DuZKYP2wNp9/C01Ut49rcy5mf2ltB1/ZeivoAprVB1AyZ
	gj1Xx2aqrxfU6FfCHP/NN1fZW084D2COJQrVrUqPIOivx/wKsz0EkjM/PEANNuUEtR+guOgOPYn
	X15yG0FvpmNShqnlw7kxHGteVCkzsSz3TSTqR2j1d0ot8pNNIU/8Ne7MDqBwfs9p24ABB+CFdrM
	M6Vktml8HlToPExQBeZNKiFwOloN9mS/oYQwxUbLdbXrAwKKmZskj5X1sT1OYq5sdb5hCB7GSAd
	xNOgVIHohOZ6ggPjbfeid4M4K1RPaAsJt9fQawU6gFbvFTMg==
X-Received: by 2002:a05:6102:9d3:b0:631:2f82:c3ce with SMTP id ada2fe7eead31-6ec2b92f476mr1386558137.10.1780492770607;
        Wed, 03 Jun 2026 06:19:30 -0700 (PDT)
X-Received: by 2002:a05:6102:9d3:b0:631:2f82:c3ce with SMTP id ada2fe7eead31-6ec2b92f476mr1386534137.10.1780492770149;
        Wed, 03 Jun 2026 06:19:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf678d7sm9164781fa.7.2026.06.03.06.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:19:29 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:19:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: MINETTE Alexandre <contact@alex-min.fr>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] ARM: dts: qcom: pm8921: Add USB ID extcon
Message-ID: <xklnqbeuf4gblh3l57cfpd2xchfy3rug7b37f4redumfsl4g52@dh57ssbrhaz3>
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-7-dcaa9178007b@alex-min.fr>
 <20260428-jumping-discerning-oarfish-d2caf1@quoll>
 <50c433df-d737-45da-93dc-76d365052a6c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50c433df-d737-45da-93dc-76d365052a6c@app.fastmail.com>
X-Proofpoint-ORIG-GUID: CLx93CfztAw0nrjQHWBtNUUTwQ8ErhgU
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a2029e3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=AvYuMi_7Bs4finmeaUUA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNyBTYWx0ZWRfXzTlwP/fWdtej
 r7PV5DZi2MUJAT5trDdC2NZLJJ8vFDICmWwhUacC3lyMd11pWMHcRGhEmvoBN43XPys6pv20/jn
 RLUQrddeuYEv7uUUDb8pPWq1WJMc6PIwSEa/IGu0bM9xgcyaJPElj5t+f1miBqMMdAJnGLD67HZ
 zXfYBcxG6cfGJ1cWq1cgguNJRjLuMmWgzxZXmsVp1aWl7FuYsiM4E/WLyWvaHhsau2uT4WHPlVf
 kjDYYNmtM/6qJcvwcFmgOqzb9spXdlUAEcsYLSkktBOQaWfj2VTyXvVRRziVBmbWUMn1Ztmz2WK
 L3dNCUb7vTxv3niWCE3Bpq3txQ2KCKWpxPOcPhfmgIUr9Juzfs4UbhfEHZs42xVmjmZX1zHo+Ro
 idfACBiBh6h53yyk+1Aq5lIhM1AaDZE8vFOd7HXunZmPl7fhDYzKPgY+oGLH+vH0xUqj0vPkLf3
 n6nA0FDK5FvUoLQpcPQ==
X-Proofpoint-GUID: CLx93CfztAw0nrjQHWBtNUUTwQ8ErhgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030127

On Wed, Jun 03, 2026 at 10:39:24AM +0200, MINETTE Alexandre wrote:
> Thanks for the feedback, Krzysztof.
> 
> Do you mean that the PM8921 USB ID handling should be exposed by the
> PM8921 parent node itself, so USB consumers would reference the PMIC
> directly, e.g.:

Please stop top-posting. Post your replies under the phrase you are
responding to.

> 

-- 
With best wishes
Dmitry
