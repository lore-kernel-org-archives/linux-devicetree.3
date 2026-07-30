Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DFB38B150
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428746; cv=none; b=H4iCbS3OClIc/MQqsNhN8khPbxwXLZWowm4ICRe+wdmnu8uquKBSWa0OTJENCMHqIGDEFCoa1ZSm9+RhSb5Z/jKune54hl+C6VAwljtopddEdCpIhrwna+nezOssMvGCVx8b9Qg5GPq2XrIUPk9Puhk2ZZmUgnYuFJUzm+hwaKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428746; c=relaxed/simple;
	bh=e8krjuXORD3eiisq9t1nWDxjYeLTjw3YQstvDkeoZ4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj9KnfKSo0sGBhnAq7TWPlTRAIM6rOIJPcQ4QzGdUQ3rGuY0I5hDhWb0ubPZomALGzNh/gls5l9H9Rx7tuH5P+1D7zdpioXtPk9hWRJsBKTUhiJrDLrQJWhXpg4CbKs8srlO+vL3s3WL3umxRbzOLE2hX39C5WCDDmA4MwSkhqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f54vVozd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SmP+USCO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f54vVozd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SmP+USCO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQoOA1087237
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4rZUWXyiPA7EzNtyFdqNeVBBODKgqKe4kAxXVPsMPVI=; b=f54vVozdJRdphjSd
	CrWcy4K7L0Nr0p9d8YMr38TCfHqSJD1NsrUEWbfZcnNOWXSXnyX3rWvEUAlgujgS
	RaIuyVjk+EoAesW+ixBhmyOzcR0gHtKEhaOu8YhzPRqXHZdhgftOzeFVjjw0UE+f
	FOB/ZY+cgJ3lz4xWVPgaPjIQf+/4j1DPsffB4hg3ousTnqytZwjWYTlz53x4RDT2
	VnuZ3R7of6s19/DK3AYSvPeLuOTfYFtAptWAboo62OkvoswCLsDWCJH7DdWm7DXQ
	D3inmviQBYZNdNspyTHCAePVp69/Y1JenN1UBRhaF1hq8WG6xLeAmek3iblSeYck
	p9QX6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n38j6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:25:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so44782711cf.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785428743; x=1786033543; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4rZUWXyiPA7EzNtyFdqNeVBBODKgqKe4kAxXVPsMPVI=;
        b=SmP+USCOQiGUbJQBwfVjqsLsjvwGkLdu8wIiGAgO/fNqjBtI7rEfJs+s5OxXVlrJlG
         FiYvSz8k9Lvdb9/RhZAKw7K328ZUSosbt4iRf7ljxBkGjBfWe+9kPF+xUyAj4oJlz4wx
         C4U9bGokofg+yFNir6Ca8MCzSAnBNSUO60YtVywRbTKHXMDl/RVRyswpqrz75ULVTQbV
         d4i/juwE0Qd4lzIA3xV29Vk7DHeT+5E+AKGotjlRgcvmy0/TBi+8q96G0fS5j7eAFcwH
         bsiNwL9IMh0psKG2hmMSLMKcfJEyPgQWR3/8fXfQNyNgGO6Cz8g9wfSY31xE+VgRu08O
         QsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428743; x=1786033543;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4rZUWXyiPA7EzNtyFdqNeVBBODKgqKe4kAxXVPsMPVI=;
        b=hMqA7Ub2aDqHzyWDvIw44s+9VDvVyFqes3Tdz0Jm0SlOxtez/nNxf8ucxxXM5Am4Eu
         2aZSv8xoul9vdXWWQ0JARCftaTETNgfDGHwu49jegtmyZkoxfMKtpnkAn9JHdsfnRPNp
         bW4yUFLwF6ghpCyfS4B0frgTcJDXdH2J2ZQ5m0rjt3i6oGZc/4ecpdN79BGoA7KdbZNc
         nVCXsyyseOjzBy73kM7987MJvmA6DkeBu8XyuQz6KEhonaAR50dkVjS3V6a0D9SksW4+
         C241g/COYVReYQvn7P0/4d77zFdJpsSy2HscDKBEvVUM7nuvL9FBq5JP8ASMEGJfC32o
         vb+g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+xAiS534VHobdQ+AR0CYuNtHeI3uJKl6eO1Ko+00jWej8orzGrkGl+evco00UWWPzSnoLTa+8e9Op@vger.kernel.org
X-Gm-Message-State: AOJu0YzHTBH3VBjFEHG5HZIzdAR1rLquB615BQ3Jr0Ft5Xgf6G4Li5Eu
	ykPSqsJxKtIU5UWH723TLl2rCHBN1nKRtlAy2s3zdiSWCQnyI0wYm90xgFk5AjIR3YhkePQBp5s
	kjHaknyQylTTRyT45p8prKe9OAaz1Y5iV4PjDBr8xmiyn6CBz/QOnC/yLUV4IfIkT
X-Gm-Gg: AR+sD12cCPWZw6UR/hhy65uoJkZVeUY2NbuurcHiLmk+ryeqzSgTV5t4HjCdNmtWyl+
	pXYyo6xf5tLGJF0Zhik827abVJLySfAoaD6JOlgHEGRNi8b2kIA4AJ3UH+RdbKRxgxvLCbs61CV
	qQTMST2BWQTD/2hxhxA5BRwkRyj7Igcw2YFazVGV0ORfauaqYgXOUQuE6MQ2wV/5hfn2DUN2G/w
	pSgkAljFQlrOqIl5vnlUxhwcNkOJW12HMRCQIQdxvCKHpUZhFLh3VG5VTX77AGo1rtUig9BkPZp
	IHuy/H1x2YweqJL7BFSsyU6d96+eoFwZkKWFGLbBQP12Cuvl6/JqMDAfV/0yfrMV/j2UjMSJr/y
	zj7a7mAzRuR0gH283IjjyEiFuC1xfjNFq8Pe0UQBTv7HnZJehU2/eFQelX8nug0vOfEeM2xQAaK
	pNgBE8CHAtfVSwGw==
X-Received: by 2002:a05:622a:1ba4:b0:51c:7b11:419c with SMTP id d75a77b69052e-52b38704761mr36932001cf.73.1785428743011;
        Thu, 30 Jul 2026 09:25:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba4:b0:51c:7b11:419c with SMTP id d75a77b69052e-52b38704761mr36931671cf.73.1785428742524;
        Thu, 30 Jul 2026 09:25:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9530e5sm466968e87.33.2026.07.30.09.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:25:41 -0700 (PDT)
Date: Thu, 30 Jul 2026 19:25:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/22] arm64: dts: qcom: Fix the PCIe iommu-map entries
Message-ID: <mygjnnq3jt32mg5azihuxcrdu4b5uyn3bhebt6cvwkkcc23pb3@yia7nk7senyu>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <qw62kk4cv3knqbwa44kvs5hj2uojkkgwrvd4mljd6g5qbn5xb4@jv2lsctxzliv>
 <4sbgvbb5admwtfsggio2tzdwpb5kimddxcpjxjuoiptcuwke6y@nr3nm7577tna>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4sbgvbb5admwtfsggio2tzdwpb5kimddxcpjxjuoiptcuwke6y@nr3nm7577tna>
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b7b07 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OlEKn_Yfc8uRCJjl9zcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: SfqIXZ1JXd0taL0e2JH-61cbhy2kWr9U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMyBTYWx0ZWRfX1ufK2q+7VMbN
 aMRmtMlWXvkJAT4aBpWZPGCjYsqYDUczSREJiXpsdeXXKcd9CFsJOB4bZx3F/PgBid1AKufP8+o
 UsrQS0gZlaInqu+TikKZsAA5ndVaQxROZMW8E6VjdjIb2CZs1urKloKqwvmIqWNYOAIqZK5cnfj
 iFUCaU/PXT1gFFu+uCbHzt5TmxzmLTcw78CSumUh0/Le6Po9PRUpfedCsBOQHM+bd2wa41Ko5WU
 q/W6V0dKZyZFTQt6LFNaqO6S52Cok2aIMfgr70ac0MfDpwZgX69SkXGpLgJhoqHhqjuGDghrbQ+
 gkVe73E3+SnWIylGU4iDH7xvN/4pMcItSQJxDpCbMxKL2pHmmuNT3INexu4JGcUy2Rw3oK6tqfa
 W9Lzl6R7erCFkK0ryfM1loz/YbQfUqCS/TJ8pmrMZY6CD0l1tyLAIsSMwn9wzEDwe4BYi6x7pT9
 pW5wVgUOrNwly6e20Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMyBTYWx0ZWRfX+TTsY0z4qDUz
 Bw2lIjHe+p42jNLVj5Xn5l1jrIgZ8sjlmSYYPtW7PcmZ8NDV42UXBQrxPxDydT8ox39g64OaM/y
 aaRty9tGJ1hxVtF7+2YygJaAEAdp77M=
X-Proofpoint-ORIG-GUID: SfqIXZ1JXd0taL0e2JH-61cbhy2kWr9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300123

On Thu, Jul 30, 2026 at 06:14:09PM +0200, Manivannan Sadhasivam wrote:
> On Thu, Jul 30, 2026 at 03:23:28PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 30, 2026 at 01:55:41PM +0200, Manivannan Sadhasivam via B4 Relay wrote:
> > > Several Qualcomm SoCs declare their IOMMU providers like apps_smmu and
> > > pcie_smmu, with '#iommu-cells = <2>', where the two cells are the SID
> > > and the SID mask. But the PCIe iommu-map entries on these SoCs specify
> > > only one output cell for the SID and omit the mask. This went unnoticed
> > > until the OF core started warning with commit
> > > ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps"):
> > > 
> > >   iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output
> > > 
> > > So this series fixes the iommu-map entries across the affected SoC, SoM, board
> > > and overlay files to match the provider's '#iommu-cells' property.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > Note, this must be merged only after the commit fixing iommu-maps lands
> > in the qcom dt tree.
> > 
> 
> Which commit you are referring to? The commit which triggers this warning is
> already part of 7.2-rc1.

Ok then. I haven't tracked if it was merged or not.

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
With best wishes
Dmitry
