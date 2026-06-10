Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC814408634
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097620; cv=none; b=YUddblkmauG9j0v7QB2mBzOUQWTML9YGpd0pqxJ01shHeC27kseJgsdS2Qb0LRdtO7icWgC3FQncDJxlfcbyG4jhJjvy33styO4jixh/njODjr9R8CIhbVix5hMz1MsZQhZHZh3lkFpQqV33Zsw7JMEv2AFU+8J07O+tGepXkmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097620; c=relaxed/simple;
	bh=gU+XCuiGLk1uatCGzt6/Fae7+muz7j/ctBB2xXLOdZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNPyYmlq5zJpWwQjeUSyiSJ9KkoD5zD3Q7aEz9Co5pm8yrvjpFkonmmlxqGbLJz6VnPwTyZ3WAvW4c9S1I16Zbn0sjDrHstsz6BqkHgg2wQaUwnERGcIVZT2DpRPWBfJxO9LYp9sm1+ypIHGK9KzmkE27zvj/mi9DuoCOi1EgOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wp01LxkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Au4dGUBb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wp01LxkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Au4dGUBb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBiqC1138115
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dqR2B1jbSFWY5YhOH3YYZLkD
	N4ze6vPwfHF35RjzG/I=; b=Wp01LxkSbdcfdzVaWIPEOcshdfnbwbBYhcASZypM
	NJBl07epf54iboZuX1pLceKa4RRyydgNbENz7536lOnv9zLuPjWwe1jgM7TAzesr
	cCO5rmCwRIizU8IM2QPj5GKefVjyAdT/QBH+EsHaO9Xvpn5JhEAcUZ0dMW2Ase5I
	ONujkN8476ygNfmQ+73AsT3874/coHNy8iY08To0v3oiUfOA6E1z2aFBY5TwigYm
	4lSt5c/b0DlSNjOD9VEp/KKDg+ndTwUeB6FDAByUxqKnHEhIbs6Ay83m75kJSKZY
	moMq+mBeoQpUA8S5y22MKNuxhXjm0eD564ZCNTWtWcsucw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jk0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:20:17 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9638fe9399dso2907640241.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781097616; x=1781702416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dqR2B1jbSFWY5YhOH3YYZLkDN4ze6vPwfHF35RjzG/I=;
        b=Au4dGUBbCq5vn6SxNlu0cQmcqAIQpEcOkOM3VMAUxIPJhfsGi3LdF9Dxrzt4FKyFqF
         dXFgYnachtW5iNIDYag4CHa8VX1wb/sW4XbrbsgMPWpE3kI00zxrK4P+DMVTOaLFFzUd
         vI4/ygs2vLO2GPzaOHqYf5Bc0s2tQkasJh+GCfK/1klKizCGaRkBgZSg2l66zL+f03dE
         J+T7KGoF413EVCleTOKCIoijhiNXP6JzSNx09/8FrEQDHxRCSL3Pi8t1FHv0+Gpk7v5u
         yaDJvNXsSbankGbullAP6NE+uMjMsFH8qI2zt5OqUTUIVWtZuOKPbFTDGQERrDJzqAb9
         wY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097616; x=1781702416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqR2B1jbSFWY5YhOH3YYZLkDN4ze6vPwfHF35RjzG/I=;
        b=FWpnj9N2a3wlXBICmgeRmYu4ZNFszGzhMNUBBX3xfzUmOpN8aQNAhRxgYVe7S+T0pO
         eFepVo3T0qG1pp0seNKYgs1EEymhC4QTylaPTv31YMFiJP6MTEi+dWuJaKSrNImGdgZq
         dE+Xh9u3/N8ueFNlCqm34FN9+6kr6eQp2vD7b5pTtEQgt28Y2hhvbV6zlgGPUCNFRgSc
         VqEXQVw/UVS7KBhOCQuQXVnQmA+PXYONq6N+suziPoOX+oPgyYfJwLopul5iMxUaoA/U
         ATPhKq4oj1ayyEwOvsM6HBoCJ2Wjfjhvke5zwEjEckvHlnck9AAI5NdqdvpHhw+Sgmmf
         np6w==
X-Forwarded-Encrypted: i=1; AFNElJ9U2KH2XbCPiT/dX35pRqqxTk3B44TrkjaTShncMEjmzOCwE+kCyyJNM26jTbvQ3lIgPuO09TSB229v@vger.kernel.org
X-Gm-Message-State: AOJu0YzAHKsHHhP9aDgmu0ExElA6SAcGzQzdgo6a5LtMDvp4gJbkQ/PB
	/X+JssAWwgaVIU0S3+4gLD2ohIHdSuVVZHlK2w7RDe+I5sLOo9Wk9hbzZZrElNgIXSn5YImIIY/
	M4jGcQ0Zy9yzXncQGLuxpCTL06tFU7VHU01XGGRlz9QKFifJEOZAy3zHRYNRDAIjX
X-Gm-Gg: Acq92OHH11K+8fzxn3MyEPenllka6jzy1N5D4i0opPgNB2IRlcF34UIZRTEMA2tb/jI
	j2wSCZxK8vSrQnvczgyHWeknKpoTK7GmdDsMrRs+rFOhVLahkl7ggokePQkimUphXeCVK9BqNSV
	xU8NOPev71HRnjrwIyL1aS27KKmvuXhxNwksBxuj/XMJIQyAZLJ7z2CNdtM5BreVzRlXssZ/2ZO
	Ulk035YLA0A1YYiNOFFrEgKVmbRfM04rdqvDuUnLClbI9X8LTc4xgB91u6jkwXf0bd6eIetgvIC
	vOr33c4R52fyRGkrzlfFljfjMQeXIuW5Gr1yzua052CTl7P3u7owOy7afHoGkEzDFMTN1Z44Jk3
	8FaJA4Fu0NTxwO0LmNz2fjHQnddy+a+yRSAGYfL4dCZycucRsMsF2R2YH4eNcgf7ojvw+cVjc8/
	GG5yaKr7rVHcK/rMNjtDczuBSIDM4cgbRmmVGhsrxiIsNgqA==
X-Received: by 2002:a05:6102:370f:b0:633:3040:ca5d with SMTP id ada2fe7eead31-6fef25c9f7dmr12034004137.9.1781097615901;
        Wed, 10 Jun 2026 06:20:15 -0700 (PDT)
X-Received: by 2002:a05:6102:370f:b0:633:3040:ca5d with SMTP id ada2fe7eead31-6fef25c9f7dmr12033948137.9.1781097615457;
        Wed, 10 Jun 2026 06:20:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b0f5sm5424732e87.41.2026.06.10.06.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:20:14 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:20:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix up QUSB2 PHY description for MSM8996/SM61[12]5
Message-ID: <nrdf44ixzjqdyxdjnf54ucotpbncehjxjqygqnrknc66pyqfau@vm3emv662bub>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <b05e860e-ace5-4399-bbd9-493f7bbfe74d@oss.qualcomm.com>
 <cnyhnyoce6v4d5roijrceuzd3ujvvw7ozklulaxkibptvjancm@cqbqu2aa7bz6>
 <852caded-eacf-4ac1-8fe5-83dd9285ef11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <852caded-eacf-4ac1-8fe5-83dd9285ef11@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a296491 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=C_BCb9cMjCrCBmKrUK0A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNyBTYWx0ZWRfX1lWD3lyfb9y8
 +yGGZIbaJSLurhCFBhClitYibRaY3okYsrPc59br4KkQO2Atto6YJZkqaNIWBRZ4nqOTxvJNFRv
 IX2gDC9AAjMQpa4aPI1K58oNAurqIroHr6n34IWrN/ip6l3E4C9i2mdP9rYq9acVG9Db1qkWb68
 S6FBTZi5e6OIv0H5+WscfHHNFspLrkxh/Oo6PLn/0G4+84Jp/+xx3UioLdwX1gb1nYDLihJHUaK
 /1rOHmBMmNpFAGGizJHOVUWOvM4n21fkOWK7OvtGXsrvaXn3wTRCVedA+lxm1q8EA75OXpNozrF
 q/zRRUo1pansBMDY6FEOwX2ojhMHcFWzxvF48fOlqMbHgTioby+YN8o5836Tcs9tRU0k+JtTo3y
 61jUVl6D0QwnyJ9EBHFLF+PmLVAg3oV2hWPfAUflBe0pdkEOVjAES8q78ggLJ5IF3m83GLwLEsS
 g4jwM3MHpb9iofRRNfQ==
X-Proofpoint-ORIG-GUID: 75eWFUDLgkPd0Rwos7SMBWaqe0M8yFKK
X-Proofpoint-GUID: 75eWFUDLgkPd0Rwos7SMBWaqe0M8yFKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100127

On Wed, Jun 10, 2026 at 03:13:01PM +0200, Konrad Dybcio wrote:
> On 6/10/26 3:03 PM, Dmitry Baryshkov wrote:
> > On Wed, Jun 10, 2026 at 02:49:31PM +0200, Konrad Dybcio wrote:
> >> On 6/10/26 2:04 PM, Konrad Dybcio wrote:
> >>> The MSM8996 QUSB2PHY was not being guaranteed a power source.
> >>> The SM6125's QUSB2PHY was believed to be idential as the 96 one. It
> >>> wasn't. This series tackles that, freeing us of some dt checker
> >>> errors about vdd-supply not found on MSM8996 boards.
> >>>
> >>> Compile-tested only, but docs confirm my findings..
> >>>
> >>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> ---
> >>> Konrad Dybcio (4):
> >>>       dt-bindings: phy: qcom,qusb2: Straighten out SM6125 and MSM8996
> >>>       phy: qcom-qusb2: Fix SM6115 init sequence
> >>>       arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
> >>>       arm64: dts: qcom: sm6125: Fix QUSB2 compatible
> >>>
> >>>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 31 ++++++++++++++++++++--
> >>>  arch/arm64/boot/dts/qcom/msm8996.dtsi              | 10 +++++++
> >>>  arch/arm64/boot/dts/qcom/sm6125.dtsi               |  3 ++-
> >>>  drivers/phy/qualcomm/phy-qcom-qusb2.c              |  4 +--
> >>>  4 files changed, 43 insertions(+), 5 deletions(-)
> >>> ---
> >>
> >> Note that msm8996pro may need even more looking into, but that's a
> >> story for another day
> > 
> > JFYI, MSM8996 Pro is being used in the DRM / Mesa CI. If there is an
> > important difference, it would be nice to get it sorted out too.
> 
> reg   96   pro
> 0x80 0xF8  0xD0 [!] QUSB2PHY_PORT_TUNE1
> 0x84 0xB3  0xB3
> 0x88 0x83  0x83
> 0x8C 0xC0  0xC0
> 0x90 none  0x02 [!] QUSB2PHY_PORT_TUNE5
> 0x08 0x30  0x30
> 0x0C 0x79  0x79
> 0x10 0x21  0x21
> 0x9C 0x14  0x14
> 0x1C 0x9F  0x9F
> 0x18 0x00  0x00
> 
> apparently this is indeed SoC-specific (via docs) but also apparently
> may not be very important (although should be fixed regardless as
> some designs may rely on this)

Would you send a patch, please?

> 
> Konrad
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
