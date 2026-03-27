Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FFE379EE5
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644674; cv=none; b=T+ZZNna7bvGMZfrfdFuS1Of0MiImkZ0TOUGJbIptqtu9wYMDIcM415zjKi7u1iOAlM8LE74Ld1G5tL+tFt1Bo2zGTCl5MOwueXNt0mmVGcD4Li3zf32/91q25QFvJhZ/W/uYCKGmmGG+YDl5YICbL2KCvZooFQONIXzF+CBJDa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644674; c=relaxed/simple;
	bh=Te03HsV648pFJkyGTNt1Dmxz6MZhJrSjreplqLeUXwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ah9MNPkUtoFlBNdAEn8wj9XoclfTRoedKYql5jf1GerRxhlKLlQjy7ps1F8AfegS3J+z8OAsFt4mJKSSRtzAIPMmHpGCiUzOQl40p6ehfiGaAnBRwOsJXG3QSI6MK/g3K2yRWKCVVxvzYiA/R3Foy1P3BswaCEcAT4AlKNRTqMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcgozyTN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XpaDY6Ut; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcgozyTN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XpaDY6Ut"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2O0S4030342
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5vNj1FkteFeY/dYUVbMc/bS/
	d+JE8rzOzKMJKumnlKY=; b=mcgozyTN+95TSr5y+vMcle6H75WtNTDawO4OJPxB
	8OiSc//+NEPdLsjDNRwlFZ44/U9KAz+sKWjb89Nq8QOxYg9LX0a0cgR9M4Ho8Uwm
	EuBLRlI1vWRUnZad1isiC1+7jzhjvZZu4MMWVhb7lU8y/evPuMtfwsFimzrSOdAd
	in262LVUWrQoTSV+yNi7TSs0fcPQI6nceztj+L+/aXnjyuHLEcVswJPan65XZ3Ba
	O95oYjPDxrTMI6KHwfBV0MwoThdw3WYom28iMTQTUTxUZ0rT2NAswUHfblQJBdBr
	D16y6YxSVLP+lQTnlYXanNRFE2lBILf6geFIBeOF27/cvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5v6b149t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:51:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so64078571cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774644672; x=1775249472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5vNj1FkteFeY/dYUVbMc/bS/d+JE8rzOzKMJKumnlKY=;
        b=XpaDY6UtKjZUP41UMoQQt4fjH0Cog4/90izXVdbUpHtuBxVHoCwE11cTp2KiJ/RPDj
         xNIyacODhit4ugOViDvlynStTzQTW2qCMMMhn8zEqDB+Uikg2AbBGaJyvKOc1c4XT8HU
         zlwD0UsnzGpq2qMoNqmZIIqQUlZs1zFPkuWJbARxG2bmkzBw06TUK854psRicW4yq1tB
         8jmG16xJAXoDdtOEP2/Sae0wLif3QMK1QMApiHEoJ59JWc661IIIZrkw55o94EYYu34V
         N2/eXTSHcxwwyOSMJGEMh7TV/xu+25v6AGr7eV1n0qClV0MxTumq2sBCKfTPm3Hfm52/
         Q4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774644672; x=1775249472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vNj1FkteFeY/dYUVbMc/bS/d+JE8rzOzKMJKumnlKY=;
        b=Kd2QTAn0zksV5HI6sJIc0iXVKz1b2WbGDqHBqFQlkADCjNPxarAw+ORRe4rA9scrgw
         d9XpkiHtigEyYadx0WkTuhH06vnkUfVa/Rw8e66AV4C2OePV/H2Ni1WRP0n1CFPk03G4
         K1B9rIfNVS9U/YA6Hz7GWsN9CCr0maPYwUEnampwsKAgdAvyMZ2ODT44CvoffZNoeNjx
         asn2T9MVDQenA3L3JKYhn6rTNqofXm8IH3y+r35zTo7r2ShsVEKdnyHOHn9JDajNfxt7
         ABVzYuCKNYS1VTGlKTnYzBcRSOVlqvsx4dSNNmeUDKQPYjE7YA4Eg+5eJRwz/CfZPa2k
         xiLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeEwgYdUTkG4zTsfuMr65T6kDLgTuQQwJFL5wV5zM3XLwMvGokJFT2IscZqIb+2dzSH8rF4+48NbnS@vger.kernel.org
X-Gm-Message-State: AOJu0YzhqWyKd6DcqAmRG7g9k/XHW48K/+w2SRymeVL6j/8IB7F2oqGa
	YiSZCA9Jcmzce/zEOG/kMYimM6fjuQpVhtMWXE7blglS5bvcfpiYLAY/mCOEdOn/RdGhgYou1cS
	H1nQQR9YUpbz9qOO/r4P1IrJ34yoM7G2myQB82XAwRReW/7ygliiKw5ZtD5JiGqWd
X-Gm-Gg: ATEYQzxnqCTyldVwLCJ5QPlHYXgXireKccbEUMg6BeVAJgHVt5ChrreR36b+gyTC34F
	ggKl+fdFvszGU6pNyk0f80GDwbFY3Qg98kqp2/Nl8SKsk8u8JQwMQXdpbIEooLKVQcrLg15qnfc
	CZgSxCN5yp1dJteyo3+1EAJ9qwX8V0dsOAWem764fjnXAuXDZ+KCYLu33QKJv2m+ymu663e7rEx
	K0HJaicMJYhsMNs7pWPb1SH3ItcrGblDRCtAXp6PQeTZRoyikawFOJMwKTNnIj2ppbBf3P2KStv
	ZzqEAst6QSRqv9GBY8zJrmNUTayFV+EcTGcUGV3fBtJWt0R9FOWXdwCfxHxch2BkZ6sKpdFeBtp
	FQRW+c+JGk10Es+bHyfWHCI2Uy8C16uF38YU0Q7NwMLX1T97tApQ+h3+F/7aMxULbfn9TY2UA4n
	IfAdZ/PcOzNHJWQhwYLN/hLhFy74EkLSKBQ1M=
X-Received: by 2002:a05:622a:510:b0:50b:3a6d:db5d with SMTP id d75a77b69052e-50ba39ad465mr55341101cf.65.1774644671603;
        Fri, 27 Mar 2026 13:51:11 -0700 (PDT)
X-Received: by 2002:a05:622a:510:b0:50b:3a6d:db5d with SMTP id d75a77b69052e-50ba39ad465mr55340701cf.65.1774644671181;
        Fri, 27 Mar 2026 13:51:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4329sm16395e87.3.2026.03.27.13.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:51:10 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:51:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
X-Proofpoint-GUID: IZw9n0Kc9SDbRnoDBPVTyF7GntpREKNx
X-Proofpoint-ORIG-GUID: IZw9n0Kc9SDbRnoDBPVTyF7GntpREKNx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0NiBTYWx0ZWRfX+N87bZv2C2jW
 2byJnHPJCzTjhC/pRwgwr0DQGwUKfdSsXH+lXsmRa9U8p2p5FrIeAaN1aCD7vFMd8RRiy5V3eEe
 ehISywsHsbpio2waOOR0GbSqdDDYxdX2HfbljimfxpRqYhRRmDCJ25hD+gCFfeYFVC+EEHEGebm
 DdfKi9MoMLHif3g3SqcuXk+031jg2gBq6YQZaTekJ5oRYmwIXJvSQPbHK0KEyDh0yUNewNcNVH7
 m6c59nkogrdd/BPxnOD353GKpYhAohjELIm1jvH7o5+kAIBZTnyCJG80mXgfs7hVod3DF9PmboJ
 kp3z5u0xBHD9tqGP0ujsDi/7Yw5UrhlVyl+bIITivQBCkyJfqPtHbDOLEyTpO3nk+5DcgmVJ/LH
 nzjxonzWWs7XLjzri8JMY8+qmPi8tg32PIr9EgquKp/F7UNkSsIg4RvdaiBs/sN5oOh53+OUFnk
 rJHtKhZkqMYZuoD0Idw==
X-Authority-Analysis: v=2.4 cv=JLs2csKb c=1 sm=1 tr=0 ts=69c6edc0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=g4nqrqiC9Za9_vF1seoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270146

On Thu, Mar 26, 2026 at 02:42:10PM +0000, Bryan O'Donoghue wrote:
> On 26/03/2026 10:28, Vladimir Zapolskiy wrote:
> > On 3/26/26 04:03, Bryan O'Donoghue wrote:
> > > On 26/03/2026 01:46, Vladimir Zapolskiy wrote:
> > > > On 3/26/26 03:04, Bryan O'Donoghue wrote:
> > > > > Add a base schema initially compatible with x1e80100 to describe MIPI
> > > > > CSI2
> > > > > PHY devices.
> > > > > 
> > > > > The hardware can support both CPHY, DPHY and a special split-mode
> > > > > DPHY. We
> > > > > capture those modes as:
> > > > > 
> > > > > - PHY_QCOM_CSI2_MODE_DPHY
> > > > > - PHY_QCOM_CSI2_MODE_CPHY
> > > > > - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> > > > 
> > > > Distinction between PHY_QCOM_CSI2_MODE_DPHY and
> > > > PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> > > > is
> > > > 1) insufficient in just this simplistic form, because the assignment of
> > > > particular lanes is also needed,
> > > > 2) and under the assumption that the lane mapping is set somewhere else,
> > > > then
> > > > there should be no difference between PHY_QCOM_CSI2_MODE_{DPHY,SPLIT_DPHY},
> > > > it's just DPHY, and the subtype is deductible from data-lanes property on
> > > > the consumer side.
> > > > 
> > > > So far the rationale is unclear, why anything above regular PHY_TYPE_DPHY
> > > > and PHY_TYPE_CPHY is needed here, those two are sufficient.
> > > 
> > > Because knowing the split-mode exists and that you have asked about how
> > > such a thing would be supported, I thought about how to represent that
> > > mode right from the start, even if we don't support it.
> > 
> > It is good to think about this hardware confguration in advance, however
> > the process of describing such hardware setup is incomplete.
> > 
> > > 
> > > To support split phy we will need to pass the parameter.
> > 
> > What you call "split phy" is a DPHY, and "split phy" can not be supported
> > by adding this parameter, because it does not provide information about
> > lanes, and after removing this information it is just DPHY.
> 
> That's just not true. If you read the camx source code you can see
> split/combo mode 2+1 1+1 data/clock mode requires special programming of the
> PHY to support.

This needs to be identified from the data-lanes / clock-lanes topology.
And once you do that, there would be (probably) no difference in the
hardware definition.


In other words, I'd also ask to drop this mode from the DT. This
infromation can and should be deduced from other, already-defined
properties.


-- 
With best wishes
Dmitry
