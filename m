Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1CA43CEF8
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803753; cv=none; b=g4yvdiNsN6bVWjOrPFhBGA63VZb1UHFuqanFX0WiLi6eF2eiAhErR01g/f/PswDZzKRa6A5e6LYRXF7GbDTqvpKWdXSuGZsbl6q5bkekH/y4iTF7NGaEGRjlsel0tnn4r6CDUZFMMVFz4PxnnjcQB4x5ZqDCBw3uhVOKnFahLR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803753; c=relaxed/simple;
	bh=QON2PHVweGoUtL2sEBtxm1pos4WoqKP3hUIn/qW0iA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlcLRbj+GLTXgeOAQ0BewDe4jxzxhDuQlnAmyTiSbnCd0MkvaIr+Za92NNGrjtbWPwRljfeEEmfuvpWfn1qF8THdVwiqtIhTt9mA58x812O/ns3o/L1dr0ki9xneqCYQG/H9pYQCbLncU/FiBTcLTJa6XMNSxtpprC3hy+VUX5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AC1U3uUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9k+CjKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AC1U3uUw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9k+CjKN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qaZg3261217
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Re3yCZBWlEjS1PUt043mIvak
	0+Wz2BK7cm/d50zPimE=; b=AC1U3uUwLWrrMgWqRj0ygCfIOsiourKGY9GcaIdN
	5D1sVtQwCjkJ3HpoCH7XPct/xbo7tVvySoKzHefgeq6U3EhLGVZs0EXg9pYMoaMR
	qQE6Tpk4mo/a/jDSgh5PLc3zbttPsXUp72gubGMzN/HpsMP6G1InHvPBfopDtNS7
	4QGZLtFl2DdmWEJ+oOwN0KlURRG2Z0N3lm/7zq/GOaxVNdmDfx0/Ffejvo/kynuN
	Sr+Dx8KGieAZ2yjw5xeoEtkJ0tkV8RAoUJzlj/ypTDin8MyhuhW03aD6ymyrkGD+
	/JnhPP4U3b36gPxOGyyr2+mZhxWMkzMqvz97OeuFUK/KkQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw1rbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:49:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8efad04d884so13437306d6.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803748; x=1785408548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Re3yCZBWlEjS1PUt043mIvak0+Wz2BK7cm/d50zPimE=;
        b=P9k+CjKNiChQxaTZ7YJbpEPagGBGro4YctSQQWqqghFcs5vfvrmkrLwc+YuHvr3xuy
         iOPDnxkHTLZVhFRSY+n3CSA16Ie3fOadKtqBGwBcrqGQYI4Ufh75N2rWIjJp3dGHTaYy
         W92KhVg+mf0FGkBX563g+7nQKcv8F8I4pvCWXizxwGpDxEvL9QPNhEwBH1ninwzz+3U/
         UUn+0+FWRTleAi89GADNdbnGdReeZC/hxnxku7m8omSOLX1xcCK3YPW6WxNRDXzqJO45
         cYNxTkYnDBj7pr1FhNzaQ31oI8l8nSvWE101o4Liga2ZbrruHuYSfmjeZ+7omhCxiffS
         h91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803748; x=1785408548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Re3yCZBWlEjS1PUt043mIvak0+Wz2BK7cm/d50zPimE=;
        b=LdgESX20TwwW7Llj+KZ1vCKbgBsFZA8DymL5cbIXWr6hJEr0V4YYO1pCp9ByJWZDD1
         ctFGYOfeas/kDSaymmr5fk6F/GFrJDN48gip7tgScgksBROFUlNcU8CoWY/mHWQdByKJ
         Pdzb7TxxSJ3iBerfIvA0JshF5/WzZqX2yh9h7azchVg/oBhWOveN9pE1cRGuXDKOmPr4
         g6xJQgFPpx64CqklgcEjD/X6ohAbWJ4ZiDSudKuX0JKUlVIOrXYdLERshnD1MZGLdOkw
         zUs6VyAewIEvzqjuqS5fo6OUv8CuU22qBaueXU0g3yYaSCndRBGMyY+FnCJ8cPeA9/wZ
         oJSg==
X-Forwarded-Encrypted: i=1; AHgh+RqNAvkQZmA19VlUJZmt8UiPTpZJymozbm9T75Gy3usUnP92GmJhoznaoCxEm4TMmIeFEzpOVhD7VKX5@vger.kernel.org
X-Gm-Message-State: AOJu0YznJJqdbL2AlAUiTFiZNcaNQInfQ5hL3vq39o0SQk85xPLd2Cmx
	hlS49UQ28mFJ99kjYALhIau9G/3JGj+XLfaaYqCcktYE+4KQ3joetzGSeDRoqdjZaEdxiELlbgX
	GGxajOQSo32od1GJ21wkOIcdboxkcL6EVenMDG1kNeOcgRJeUR7sIuuScXUiH2Njy
X-Gm-Gg: AR+sD12NXHzVyM0AWLZgqQeAywVzCpEqffXlSvhofGRUukvg2pB1O25Tt+znFxZ2txe
	ThOnA8boh6f8aZ+n1SqyoKWZpDH1TYWqcgZeNGlNA4+uAeG+Pipp2omPIZkxh5cDfMVQfq1BBR4
	RjtboYFuM+3y0pRr6+Ec6PCF9ATlSGiZOBcACs117VcSuh6BLbkFqdzQwAHgWzM2xilV7uC1y9V
	uUtTlJxZWY2xz7VEcKcdVl3pXj9kZnR/9mf4ogWm6nqctNG+SraKRJrS1ixTNXRun3IlVBbkkwB
	cDKniVThP94+KSLYObbwAuQSc2tE0fb+gGnemLqWfxM8L30nqzYrBmp8ApyUa929Ce1EMN2aZ/z
	LjCpk19kA79QywSzmlU9c6wGQL5iZpkzByUVB7WwthWLw+F9CnFis3BzQqdIOPEytP5cZ+dwiuJ
	9wCV8ThwAr8e4LRg==
X-Received: by 2002:a05:6214:5a0a:b0:8fd:6dc5:94c with SMTP id 6a1803df08f44-907ca6d63d9mr29038946d6.65.1784803748015;
        Thu, 23 Jul 2026 03:49:08 -0700 (PDT)
X-Received: by 2002:a05:6214:5a0a:b0:8fd:6dc5:94c with SMTP id 6a1803df08f44-907ca6d63d9mr29038646d6.65.1784803747447;
        Thu, 23 Jul 2026 03:49:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68bb919sm8063981fa.12.2026.07.23.03.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:49:06 -0700 (PDT)
Date: Thu, 23 Jul 2026 13:49:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Fix DTBS Check errors in usb
 controller nodes
Message-ID: <cbbqb3vmhjvrvadlvuvckw5djnkk3vt676z7u3hqryautnofjh@faszogm5fmmw>
References: <20260723-qcs404_dtbs_fix-v1-1-c9ca0dd69f23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-qcs404_dtbs_fix-v1-1-c9ca0dd69f23@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61f1a5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=8NsANrjZta-JMvGekbgA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: G80hRKlNFODem0Doc_ah8jFsCW8DG8QN
X-Proofpoint-GUID: G80hRKlNFODem0Doc_ah8jFsCW8DG8QN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNiBTYWx0ZWRfX41WXYtmMW6M7
 gueUE1qXzBB2W85126Y9mLwFXE5SAGqOst10U9+uE3G34PPiIWofhuR7RCirNm8ywc7rW3d4FDn
 SLmxtlTyE3qMbBiOI8n8lTkx90Sp4D0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNiBTYWx0ZWRfX7jQ/ptKbtEaP
 ofxQ8Uu6o1qZQ8pXo3/UAHPI/ijNtJPJdKzRE5LfaZLsADk9LqeYhnS2wYx3UxnpPJpI3MVL01N
 Eibx/+2+cLiVjmL5KUe3zF6hoYEkoFH2D8THmTOECgIDGt7ByOg2OesOx6wivNx85vFlnyuOIF9
 atIjB9ZeKfYyNK7c2EJGDhh0v0nZVm/XzEJ2SjjUKWDRyovupklrkofxLrIRdmAG14EAX6s1JAe
 qCQcHcxwKirK2rglisBlyO1B/o/mz03tkz4NbMh+uCL92dCOl0lERHBdGzqm1hL51+urzKxwY31
 pfbdSrcSoij9UPdhriH6G9JC9wVh/vEKpw5F6H7XWI96hy820ZSLrGcAOjCdMTS4vCyCxA86TKS
 K2oBcYjr5Of9O7TjK41A8k9v9VY4FCgMiIiyZWa6YyJEOg7tMslh8G/ZxqzkoIcEPFluDGR8SOE
 nLYFQkjsw2t04/rMI7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230106

On Thu, Jul 23, 2026 at 01:47:04PM +0530, Krishna Kurapati wrote:
> The following errors pop up when DTBS check is done for qcs404 based
> platforms:
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800 (qcom,qcs404-
> dwc3): interrupt-names:1: 'qusb2_phy' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800 (qcom,qcs404-
> dwc3): interrupt-names:2: 'hs_phy_irq' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7678800 (qcom,qcs404-
> dwc3): interrupt-names:2: 'hs_phy_irq' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7678800 (qcom,qcs404-
> dwc3): interrupt-names:1: 'qusb2_phy' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> Modify ordering of hs_phy and qusb2_phy interrupts to fix the errors.
> 
> Fixes: 927173bf8a0e ("arm64: dts: qcom: Add missing interrupts for qcs404/ipq5332")
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> This series has been only compile tested as there is no functional change.
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
