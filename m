Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D0F2046BA
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569094; cv=none; b=HotF0NjQKYIQXvOQuxsf2cyNL3k7+kIyLDcNYu6kAqpjO0a0DR8szXywdluu6fU+FAg8vUbUHsS7qAQgYRGWTtuequDJK+Xl66WWrc44cu4AIaKAs9zcUCUGgpo/7jcH5EU58y2GvVx2feJzk9emHKjkVzgFiZS23VT3kC9mId4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569094; c=relaxed/simple;
	bh=9vCegOvm02QK0AtqE2izy4JK/HP646VqdIZW7JindyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+DlSnmfdb0YEjK8/HsR0+oaeCkiduCfJmQgPyMAwgQ418l4ai1iWUJHWAD8vnimWx61ZW3AVVdsGmKQpOQkAIIyMCA4e0vjTgNEMl2QI0H+rzTYr57YUhNzc05hOud3u8Eo324Qu9QqglIhl4XkjCDTcUWCUSiqBEBP2xXJjU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajKrQt38; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cN4hvavd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajKrQt38";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cN4hvavd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ2Mju1245790
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i20IcmKQCtSpRNFUs8gx8htg
	mWtH8qlgtcQsTvxKC3o=; b=ajKrQt38ygS+n4lMp6F59aVCCgMCTv03uQ+bp3rr
	uB1127SRL7ivvincdM15beeF2Rj8Zk99pApGrI5U93riFFSBjkFkzuEIaneSZcnE
	Hh7wNUPL3Cc7z7z5ji9NfKuaOKimTwKP9IYrtkwFGrIBhltO9JzWcQjYBn2k6C8N
	13cZgqyrBXi9BMoU0qKal+v2iC08L/se0psF6wS9V7y6EFB7SiVZJz86jw7WV7jA
	VqO7X76mmzCpncUNKHjMjoyamhZzZQ/lauQM5vZm0rQ0fTBAdcQ4INkYtZymkAoV
	WnBq+W/2BsLjM2YE4HR76i5mTqv4yjlpy4TgnhY+/ipmBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf3pc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:18:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157f453a27so571634885a.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569091; x=1782173891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i20IcmKQCtSpRNFUs8gx8htgmWtH8qlgtcQsTvxKC3o=;
        b=cN4hvavd6KaecNNctaDFYPxffiBAGHB0piX5M+h6Xq4jE+X8EO1s4W7oG/d8PzWLon
         pmtrLT3UNSnyjpNp+UemVtQNyVLUf7TFf6Gp/fgFBgujyxofRWvHVmMWzy/kN3UUmkHh
         ODALbJig08Nh5tQmzYAmgyH0GMGjlsmfEkEMRMkSslWw5/tvs9vtSZbFev5ss3dceBlh
         Ckd9f+CLn6w4RgbXPl8kLz86PXkNbolMOL1+2DsAKgQjlI7fDnLWU5ju7mUetn90B2pT
         mTjEm5GWKDBbQ9FEz8x58LusAPq46HVRTmfHkItWK0itEMvXlL99Z2BoOhR8sBc1eJ4i
         vM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569091; x=1782173891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i20IcmKQCtSpRNFUs8gx8htgmWtH8qlgtcQsTvxKC3o=;
        b=SSlTggfPw0clF8SLVZZF+gZCTNUr8dmIEVK2+GfQgJa2XBuCrxxpI0wZEZut8e0HVh
         V/Ki2uhAlRs1kzujvvRGiJHYZbf5V+3yz33e51zrpluxvi5TqStDkRKHdzfPAiPrigQ5
         AbDjm70Phr+6IJu+zy2l3fEV4dQu+FNYyplwHz9OTTX+1nkcEjNbw7ypnP4LMt1t5D90
         Px9giiVji9oiDzJU47sjLumduqJrrRpTJSBhGpASwt4vGv9iAxLUPQZaXoBXDruTg2Lt
         Td1Lns8nc0a4i9addEfru1eGZ4DtscTt2yS+cMOT/F95GxUy7cGGHx8XgsUUU+WQ35fz
         Z7UQ==
X-Forwarded-Encrypted: i=1; AFNElJ8G81mmIdnZdmTJzDvoZHoRlDqckcbGDrBGOzOIjLclFL0VLNjwzdI3gbVtnbFrFMgUHbesNbgokyMq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzci+Opi7+KjLqaz45Q4/O2N56gE++phkFMSDVtZcdTWVs79MkL
	SZWWYTbtmfjnA1lDVBQOV/CT3BRLuOnJGZk8fSyaHcp9TgreVNZe7xxx0Jgh3Ixz4JTL1DcfzZ3
	SXTGN9xwPl3mVQXyrpRv75oPKtzQAQTlYXNCdDC0fNR9EkQGb40cLaMgDRq3v80Iz7q1rQNuY
X-Gm-Gg: Acq92OGba/QODCDUgUAp/GeHMsC2LgMwbEw/7o30Qwf/L4bEnUnLcF7P1bCQt0MBZnk
	odv28ccDsJy4/MPvh2xSqXDtghOjnQW0BoX6rhcR4gV4Q97TzCFBE3w78nrs+5xT0S9aRDj/pMH
	1nE7BIoWgIRZg7ZagjILCHyqlEEYKa4TVfp9ri6ts5wqG95fgeKxWEZb1hLTHajbnK+imFLl42J
	xUHrBYnqUFC8tDG9ZmdSlhlAdocpaL1AtL9f84qWcNIJY3/Lt3dSUbAtYRxePAh7mwCJtuj1r+S
	6r8VcRDat3+YeyBZ3YTNRRmdki6uBCx8zvLTmZtvE9FZY5R/gSYrZv2isJx2g2WgKDa3EmcMGoS
	9CdLRciOme2kJlmanDAe681FuMdY53599E6H/lUKCVLz/UxyUom097vlWmw1yR3lMC0V5gsEyDx
	ytUZN5zXQPrHaS2+wfstQmZ0U0OKm1GwfdYeE=
X-Received: by 2002:a05:620a:1786:b0:915:9229:4223 with SMTP id af79cd13be357-9161bfc078bmr2522038585a.58.1781569091127;
        Mon, 15 Jun 2026 17:18:11 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:915:9229:4223 with SMTP id af79cd13be357-9161bfc078bmr2522035585a.58.1781569090689;
        Mon, 15 Jun 2026 17:18:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c059bb8sm2529131fa.10.2026.06.15.17.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:18:09 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:18:06 +0300
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
Message-ID: <4wu33lbglqmqywhwntxx467uigkpxzctwkdtues4mcpbzjrqyb@jokhryzdph73>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
 <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
 <2roy5rvazzb5p3vl3dyutft635n3acwssqnqvrzqziivh3ebq2@wptxg7exupmr>
 <a1db573b-bcb4-44a5-89b6-6d1c76f4a18a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1db573b-bcb4-44a5-89b6-6d1c76f4a18a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a309643 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=V2S91bIb8oTTECmzoZMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: fqSdikL1LIXAuJZZkY1fh1tBJ7PAS8uA
X-Proofpoint-ORIG-GUID: fqSdikL1LIXAuJZZkY1fh1tBJ7PAS8uA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfXwaKQmXg59jvH
 1nE9DWuxjuFcXwYpDuQ7PlBUq8LPn9A+SO898OsXCF1n1kNgnClpdLrUhTkMRlH2afkLCYW8IRu
 GOEnnNwXvJjQSJOcMdXDFt9AN7aZhNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX7jS1lwmSUAuS
 2yL5imbYpoqBgdDOou/o4UFPgmnEwXjwjAD7pj/1Dv2ZSxVHSK/nrwTfi3deVBq+jXQfCCKF2Eb
 NqDdmm62xlhXEERGBcAZLiXcdX1QcNH3TULR3+QvNsQmCQyk54MwmOhWw4XMnLUD7IKilaHXQrg
 qDJ2sTx1Rt/fZGkQb1Dt0FO39u7/vlI0yKwNVgRraQLYMNKbKorpJ/vuIDm2Vxq5TVFJDUbkdnT
 B60iX8IWhX9aRwlcLhOB1VqbiX7fq0yE4EfNnobGixsa0A5aiKZkON8LucO232ISzJk1jRjkErE
 QM/86UvsldTFyIkUJQWGvtold+hfwgNjU5JPIi9lUI0dOdRqug0HPWduySq4rWGV62DglVUiss9
 yR1oIrhzSkwpDjEjFnG4FZ9m7H3gyVqPjLs1U0y+JeZ5tekKnto052UJi+lcgrrAhuJtrTZMi2X
 LLlGvlkqRseItfxkNew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160001

On Mon, Jun 08, 2026 at 07:32:45PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:19 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 08, 2026 at 07:14:43PM +0530, Bibek Kumar Patro wrote:
> > > 
> > > 
> > > On 6/8/2026 3:22 PM, Konrad Dybcio wrote:
> > > > On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
> > > > > Some SoC implementations require a bandwidth vote on an interconnect
> > > > > path before the SMMU register space is accessible. Add the optional
> > > > > 'interconnects' property to the binding to allow platform DT nodes
> > > > > to describe this path.
> > > > > 
> > > > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > > > ---
> > > > >    .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
> > > > >    1 file changed, 27 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > > > index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
> > > > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > > > @@ -243,6 +243,13 @@ properties:
> > > > >        minItems: 1
> > > > >        maxItems: 3
> > > > > +  interconnects:
> > > > > +    maxItems: 1
> > > > > +    description:
> > > > > +      Interconnect path to the SMMU register space. Required on SoCs
> > > > > +      where the SMMU registers are only accessible after a bandwidth
> > > > > +      vote has been placed on the interconnect fabric.
> > > > > +
> > > > >      nvidia,memory-controller:
> > > > >        description: |
> > > > >          A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> > > > > @@ -602,6 +609,26 @@ allOf:
> > > > >            clock-names: false
> > > > >            clocks: false
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          items:
> > > > > +            - enum:
> > > > > +                - qcom,qcs615-smmu-500
> > > > > +                - qcom,qcs8300-smmu-500
> > > > > +                - qcom,sa8775p-smmu-500
> > > > > +                - qcom,sc7280-smmu-500
> > > > 
> > > > This is a list of targets that happen to be supported by QLI.. but should
> > > > this list not contain _all_ Qualcomm SoCs, or at least a much broader range?
> > > > 
> > > > Perhaps
> > > > 
> > > > if: properties: compatible: contains: qcom,adreno-smmu
> > > > 
> > > > ?
> > > > 
> > > 
> > > As of now platforms where the issues [1] getting reported are added, the
> > > list will grow.
> > > <We still have to evaluate and test on other non-QLI platforms hosted in
> > > upstream [2]>
> > 
> > Do you really need to test, which platforms have an interconnect, or can
> > you predict it by checking the SoC documentation? I strongly belive, the
> > latter is the case.
> > 
> 
> Agree, for interconnect path we can surely predict from the SoC
> documentation,
> But for the corresponding FLAGS/values (MASTER_GPU_TCU, SLAVE_EBI1), it
> would need some testing before finalizing the change on corresponding
> platforms.

I'd assume that corresponding values should already be known. The
platforms are not new.


-- 
With best wishes
Dmitry
