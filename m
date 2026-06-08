Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398E23BA23A
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926611; cv=none; b=WlECyCx356bYTmq2r9oVdBLMFbBrq40oDRuNO6Il51jnjYSfQcmykLztyNK3f193L1W5Z/C6f9WTcgPScWDU3FAwOaeeFRaYnXUN7GWW2EKCoM1p/jYrMnoRkKroRZdp4CEWJEGod+SsVIOO7Y6vpnMb5RwJls16s3b29ZFhISM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926611; c=relaxed/simple;
	bh=mAVANFWtLDtgAHnSQBDOOB+4RTESnvMxY8g61AhDU7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSWWQPZpvX4WKPguQpYKJEgoIlaJ+NwJ0itleicK5vXTDuJRVOollb2I5q1qj1G960MYYWSb7oJbzxHiNQc9eap4U9R+FxKO1pP6h6yWzktMkWmmpR/oNOq2XyqKB0vurPQd2k2Laiw77Ifocg19qCKVWYDQEIeyKq6xPjW+Z1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvJgFHCf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZaI/xErh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvJgFHCf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZaI/xErh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR8I03789310
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 13:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rn4SKsuOStAQRXD00Glk2pD8
	NtpGz2H7OLN0fQ2CGPs=; b=YvJgFHCfHUmbSTsXt1NQmdmu34caGzgLNedm+MEE
	HFinemN9/tnZHwDZISbr9U5CNtl2eeg9ZFMrM1bkohpALSY9KQrNYrRgm3uWgB+x
	w+kapoBckdwGqVRyOXQOWCgKd+70I7wiuDD2dsj067Hq+W3xtuKDuiGmzTgxjWMP
	/m5/vUMFHiV1dTdkf4SDjI6N5wUGxDTREJEoqrDjqpt+qCq2TwuRnAnjvNMcwlOf
	PDTBhtZ2dv2aa53hg9GHP8mFKU8uOARhwjIwaekJyPUiRWczpKZszy/KZuB2YKsC
	JlL4u+0o7RitaX2dLASjBG6hqTZYnX046HkDZUkRuxLbSQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv8dg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:50:04 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963b2863d62so1085371241.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926603; x=1781531403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn4SKsuOStAQRXD00Glk2pD8NtpGz2H7OLN0fQ2CGPs=;
        b=ZaI/xErh1HrxCqdWSZzkCOIHvXD1DQzEOdgHzSke8h9lpg3ZczbhwdGA2Pi9TekjXJ
         ii5wu7GpznBbXaA3/sgLIcnt2gbQ3uqRUPEAps/DVq26mpp1n74jD//0hU/DRysapQcO
         VVRD2knI0EFhfOoJdj0/ixHiPddiFLtsqihmTVNb9uQbk6OVI82J5MPvnqniZ3XQ0+ep
         fq6dlbJ2YBHRCVTBSI0XuHzqGAafs+S6PGO//xwlX2po7jZd4+YljW6sBYEowPh18L3z
         g7gI8ldYgnsHYcO5u2nnJr3aCDRNpXkEZDWd7V9G+t8bjTK0UyHImT1l1cWJfIQvHfpF
         II6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926603; x=1781531403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rn4SKsuOStAQRXD00Glk2pD8NtpGz2H7OLN0fQ2CGPs=;
        b=CnlzVFmLrFmKIEaIHA1TNF1/Hmw4qHS4DJ/0P5rLLbqKfgNJ7L7iSRcGFVHrhssQWa
         0K9Q3ncIFBJLA9rICy1u0yuUHCXyh8e3uiiYsXNmd/Y3S2QlyQmlSOv5EZL60xMED77w
         QJ3TTU+QAGqcsGdWTbk6cR5nkU1bYJAun5G+CS+6xPL+/N72FsjhRchvFz9E+EmSELMg
         +spPstP/xvlpahajccXwNvJgPYNHI+PCg+m+lLDDDDapE5duD3rqJ8VDFDC2k9P5zmv3
         5KxRD5KB+ju3aaQGup4tb3df1cHYJijRiN+WlyHtpLHY988G4CdliRF6Snt3GuWiVzxZ
         4PTw==
X-Forwarded-Encrypted: i=1; AFNElJ/x1IvyUedwL+YDmfBEZbGbkI06H7NznHOV0LaUS2fKKP6faX9QWAZcZPtHBrO1PPuqYCEdYzELghNM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1YPJThFqgqVaQOCJCAA8f6jTETY8wRQWzyuCBz4qdNBBWhGi5
	Ivw+M/VIKxVhx4kGx0CWQSIzeqGWTuR4CFfuvc+Egf5rmngTj72GDNoV29mGcEsLXDsA7veWjyK
	RJaOzcmJxD82u6l6cxGtajEB82oz0BVix6sVdiT5EyOaBvIyBgAGJAF9qfnXlLK95
X-Gm-Gg: Acq92OGjr9Qt8mBCYV9k93ArP3vANMariK0aj98ZI7IRD18/PlRCZhs/mqrxSj1Tgh+
	Fiw+Plb/MPxqL3do/V26abWW+eOWCfzA8xvSfP3HssI2gy7/hILnaVwZ2N8Dyyu0fsvB0+MgtL4
	39ASApNK8peApD/2ECKfIuprxaCeaHrFENxF5vMf9EBPEZc9TIYbJYobX1Ts+T4V1bJDeI7gxZF
	oPXUQnkTf2G1pyoxwLKKeFNWWo0KqqUAQCJxiXXKSbtbxAxBsJZQ4JFtg2kDn46aXKOeREJ4xvJ
	AXFI89FtRcBYqczC5Nxevt6nK+QjZpR+8p1kBObQqkhJcvAOfJS3/FspHQsiShbTAB2Ju1UjPLf
	bryOTULaT90SoeZT02OM9hhaAYkq5hv79N08vIyfaNuGQCMjwZ7AXZ0hCsHCw7/bFHBVnJ1bSst
	betgYJmxeSJT/1uO1gHI3KQ9s9vyBDzVCZ42SJaSbTEYLmzw==
X-Received: by 2002:a05:6102:4485:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6fee79766bamr6807375137.0.1780926602472;
        Mon, 08 Jun 2026 06:50:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4485:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6fee79766bamr6807345137.0.1780926601852;
        Mon, 08 Jun 2026 06:50:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be038sm49107501fa.22.2026.06.08.06.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:50:00 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:49:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <2roy5rvazzb5p3vl3dyutft635n3acwssqnqvrzqziivh3ebq2@wptxg7exupmr>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
 <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
X-Proofpoint-GUID: 2FOWPnxll_rGZqNb5MbDXdI3F90TKnSE
X-Proofpoint-ORIG-GUID: 2FOWPnxll_rGZqNb5MbDXdI3F90TKnSE
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a26c88c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8CyBazYyq9SD5gnPOlcA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMSBTYWx0ZWRfX1Mes9lF1R8Xf
 p1fqijljmW0fT5KsAUuj9wxygH5yzUU75Uwp35lDYGeeUQ255qJM/PlnV2se33uuxVyd6adKz0K
 iHZqkUoMd2+rwRwANxoX54xFZFx/IajLYpBbAxIznpAqcmD2JSEhJR1+/WyuQ70/kVnFD83QrNm
 HJi3qr7Jh4vXprNzUtYq9CeFrfv/kpnBluppj4wfu+2e60f7kCATSQdNvgb/ZR87VrK2oUBTsBr
 Lv0pEMRT6xQpzNnTbuuAsuuPiXvjv0Zz0y9a3hhtDIWgZtWfIdT6EbOLY7GEsN1HIXp26hvwlr6
 rODXC13HtiTKSH8CUtg3AArXFNJWSBiqiBflInUgUEjKfNJrNDevKqBV/qUXTeDLXiIU6YW6Rk4
 z0Z/SzNro3kF5qzX6EdvsyC4qb6ah+5iRFCfJqJuXYNsVT45Eyh4VO+pW9VE2JcxOlxrhf9yS/o
 FL4sPKFpO48FpY8gWwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080131

On Mon, Jun 08, 2026 at 07:14:43PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 3:22 PM, Konrad Dybcio wrote:
> > On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
> > > Some SoC implementations require a bandwidth vote on an interconnect
> > > path before the SMMU register space is accessible. Add the optional
> > > 'interconnects' property to the binding to allow platform DT nodes
> > > to describe this path.
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
> > >   1 file changed, 27 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
> > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > @@ -243,6 +243,13 @@ properties:
> > >       minItems: 1
> > >       maxItems: 3
> > > +  interconnects:
> > > +    maxItems: 1
> > > +    description:
> > > +      Interconnect path to the SMMU register space. Required on SoCs
> > > +      where the SMMU registers are only accessible after a bandwidth
> > > +      vote has been placed on the interconnect fabric.
> > > +
> > >     nvidia,memory-controller:
> > >       description: |
> > >         A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> > > @@ -602,6 +609,26 @@ allOf:
> > >           clock-names: false
> > >           clocks: false
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          items:
> > > +            - enum:
> > > +                - qcom,qcs615-smmu-500
> > > +                - qcom,qcs8300-smmu-500
> > > +                - qcom,sa8775p-smmu-500
> > > +                - qcom,sc7280-smmu-500
> > 
> > This is a list of targets that happen to be supported by QLI.. but should
> > this list not contain _all_ Qualcomm SoCs, or at least a much broader range?
> > 
> > Perhaps
> > 
> > if: properties: compatible: contains: qcom,adreno-smmu
> > 
> > ?
> > 
> 
> As of now platforms where the issues [1] getting reported are added, the
> list will grow.
> <We still have to evaluate and test on other non-QLI platforms hosted in
> upstream [2]>

Do you really need to test, which platforms have an interconnect, or can
you predict it by checking the SoC documentation? I strongly belive, the
latter is the case.

> 
> [1]: https://github.com/qualcomm-linux/kernel/issues/297
> [2]: https://lore.kernel.org/all/a437f9f9-3560-40f8-85ea-35433e33c428@oss.qualcomm.com/
> 
> > Konrad
> 

-- 
With best wishes
Dmitry
