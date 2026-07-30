Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B255429024
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414217; cv=none; b=OpGozZ4ED73/N7K9ptqFONs1SC3pOV3BTi7zmWbBGEwwg8K2KcxT6CUpAM9zbzd/dsiiN4o7rJGkVTmOf/x1ydM3RhZ9IK+MZNGa4bpi7e1jh9MUnSToMl0zDPcfRSdVILWqiesCqwzGsGYYMlhz9y6MgzjLbR0c7viOmNWwk74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414217; c=relaxed/simple;
	bh=fj3OJW+2dZcUTiyhRjvyOQFWiBqLd96EJ3BCs42UOd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJ1+FNPp9Kw8vYOhbzTAFbDRRFma9XGYNT5n9T1UgwKwNAHUF0CXswgJleKURapMq/CO6yn36iiVsayM0/6q5y/Uk+b++yroxg2DjPjwtutCJrKLxcNKiEUs0n3PYc2gpOYDO38vTW4OcV7ImXklbwF5nhtrXL6vcagwl8a8Rp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIc/oqoG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDhCUwfX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIc/oqoG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDhCUwfX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBHPV2917816
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cNcKBSY8I9iGvFthlr7brnym
	gfKII1KKZSodulBejgo=; b=dIc/oqoGBpAe87b7onndrjj3lDi+md2R9haFMMpN
	t4V9ssVuVy9+AhDiHBZHqS40OJKJGdoaOpR8zRvfWqA8dOXw5IwA54fEdKJPiWpw
	QQJCpmQ/8Jniewu5irC6Dmd9VjHKhVug+Yep7gX3W8WY6ZkuDBr/A5qhPjQNZe05
	VEhC2znNWDlhHtkN5Pu3aVF2eyZDWpmYlSLYHLj94N+XFmQiTM5M3/8Yzjt2Va5K
	L6Du1MELfIY0nyR/k0JOzg+TiOxdjGhpE6rp/sZTjZu34CMIUZ/TKtGcP8Z3sub5
	lCgRl7pB9TVYTQ+CVsR6ucdx9EdGJHbQCq+6n7grB1Lmlw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5m087rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:23:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso21192401cf.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785414213; x=1786019013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cNcKBSY8I9iGvFthlr7brnymgfKII1KKZSodulBejgo=;
        b=NDhCUwfXaaTiudlSx6V7S0ssqb6wDoSnLZQWEYLYRwXroLueIBko62ABsn22nUMrQH
         Ck+ssSImG04bbK70y+CwtcO1F7Wu6H7QTxaj2IjYGy9SpeZv8HtKWslbfaBtBw3N3XGN
         MvLnQ7d4HNXIR1PE5cPAFGIDISjQ8ms82k7s8Ilu9i63uU3HbP6mpZYlFv2+uUn/r21F
         zkBszKr4cxZT/UKT+CUyYY7AlhNMRFQZ8IRrQaXJRgevCIJXzhzsVhMoI1d2at8KQhvA
         jwQOTqmJq6VO1nghaho57grkzipdeUzgs5vDT4vv2ebLplbUiWNxQ945aZlbMo36tFui
         f7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785414213; x=1786019013;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNcKBSY8I9iGvFthlr7brnymgfKII1KKZSodulBejgo=;
        b=UWom2uf1OCJ5k/5dFpSqBN8h8Im2wa2DCiPXB7D6OjouRh6oJTf2KPg0eV9QIIE3gb
         SsBu6H52mdmfUB/M0RlhAzL2vRHqelMqUMQg6LZbmwcPjLbFhivWnW7CEv0QEG67he2d
         vjMrBJXhpZ7tgj3oAdTw1ladhcJlj6dlsxST6YR37m5oXG6k8l2IbGTNE2TlGinqGgZ6
         a39Ah29HPV8OxR8uZGi7f0oLtj7NKd/YEtlvVdJqXrDfgirChFpRGYkctQosDnD/exrb
         CKxyVeFRY+Cz4ExZqXb8jD1gjo9ABkvpQ6RpRc5fWKhs/qG3pZl0SGLuBotfv72WJf0+
         0dWQ==
X-Forwarded-Encrypted: i=1; AHgh+RppDMeBrP0t0Roohb9N5hOx6SCqLf0+OlVkfHc+c+2spB08Uf0mvYI8kCsz710bmF5ZprbanzyCJe1C@vger.kernel.org
X-Gm-Message-State: AOJu0YyGM1VWp3iCjSScrxu5SzFpneMKCI0K0DDKtfnPZ8f1eGJDKtyS
	njStm00n8mygKhsbfsMMW4VHTnUT4ktZTABqkCgSIUWvMnxskb7ACUGTQLxrZRNnOO4pKrQ/AJU
	Hqc07FgOlq8dTGuHJoy5MK8BBAbZBPoYbAaL2GaGRp3yiyqpU4UrokmQw4AvpfTPg
X-Gm-Gg: AR+sD11pMKIpnjrodT6zUsT4HHzkHvFd9GWBms4zlOCwCYRkbjHkuG1ZZ+/hpbb1QY0
	u7CtI03BaZe+7hoD+lMOtCMVRaSNHhZAQVHuqMyVwCUPzwIjOnIStps5rawNrPdVY/D52sHx2Qx
	zHjm2fuLQr+KVOzPh41G6k7pKjEGoyjfY7rhTOX/sK3SofuQTLZhOn5N1Rt1txYF8ZdrktGNm7G
	uk2dSKWPVTZZNY/W82lmk+MV/ODW2keIskAue0ESwxs5eitGg/fGBt+xjJESvH/F2RnmmMdE/6u
	FwHYOheQrdRUD0SAQ9Al5rdM2blsa2hPIbx1PWClOrrcBc94hG1IgC4PXVmfwjrJDQltON0CYqy
	y8lewe4uKpuJzlaVMqGol65PUOBPJgUMvHbcd5tsTkHtYFOtXF/t2NFd7PLkPLx6aa3b4/Cbb0g
	x0T5Sj26KsU0V23Q==
X-Received: by 2002:a05:622a:4d90:b0:51c:1f97:e860 with SMTP id d75a77b69052e-52b38369643mr25104591cf.3.1785414213101;
        Thu, 30 Jul 2026 05:23:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4d90:b0:51c:1f97:e860 with SMTP id d75a77b69052e-52b38369643mr25104281cf.3.1785414212626;
        Thu, 30 Jul 2026 05:23:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2dba017d2sm299539e87.82.2026.07.30.05.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 05:23:30 -0700 (PDT)
Date: Thu, 30 Jul 2026 15:23:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/22] arm64: dts: qcom: Fix the PCIe iommu-map entries
Message-ID: <qw62kk4cv3knqbwa44kvs5hj2uojkkgwrvd4mljd6g5qbn5xb4@jv2lsctxzliv>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
X-Proofpoint-GUID: XM__4S_-c_NPlplvM9ZoDDsZVzf4eNy0
X-Proofpoint-ORIG-GUID: XM__4S_-c_NPlplvM9ZoDDsZVzf4eNy0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5MyBTYWx0ZWRfXw4qeaR16v6/E
 vqooEMhrrQIv7ZSyAljrL2kCa+7ZU/r5nyBz3h8ELWEKv888CbQ71rlOQH3LX7ZYWcxvvW+4SDw
 OZya5BB0cG56D99TE1nMxHSgBCd/znQ=
X-Authority-Analysis: v=2.4 cv=esPvCIpX c=1 sm=1 tr=0 ts=6a6b4245 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1D2sd95aFPLQU1VH4ZgA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5MyBTYWx0ZWRfXwQb/K+Udt36C
 /FotknnY2Wh6ysPcryCNcizXCt0LWquiLRs/lQ3k8W8tqaYY1pT8NmI3RqAv9zR7LrTd9IHQfYG
 ujPueZayR6qyGk3UfD9hglT1+2OjEw1+UUqPLMVjyH7UZf/8BnCgVK5OK9XscSezx5XJnsn3ek2
 RA4eJVVAVmo9MdGHxzJkFBoNfJFecXKl7l+ha3Wvb24lO5Iq9T2Mmpqas18MCcmKZOs4KuzyfSX
 UG5VJpk6HPPmSCHXAxgswfPoy2TIYrOULX1b98dg/b/259MNI0O6tZNPlwOo+JK8W3FTUOlqDqJ
 KTALQiAo7Je4Vf9s2zbIu38AokK7KIHMx+as/kn33+QsRnJ0JwJXsQ4n8ZEiDtBDrhLamk9M7v+
 IzU6Go39g8KqJRBmH5XODn16TYMyMIGAEW5KWIqM9cQqn8ft8eHeGiVZbHtyNV930g7Pd5wzyhz
 mq3brjgrKGJ/cN0R70A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300093

On Thu, Jul 30, 2026 at 01:55:41PM +0200, Manivannan Sadhasivam via B4 Relay wrote:
> Several Qualcomm SoCs declare their IOMMU providers like apps_smmu and
> pcie_smmu, with '#iommu-cells = <2>', where the two cells are the SID
> and the SID mask. But the PCIe iommu-map entries on these SoCs specify
> only one output cell for the SID and omit the mask. This went unnoticed
> until the OF core started warning with commit
> ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps"):
> 
>   iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output
> 
> So this series fixes the iommu-map entries across the affected SoC, SoM, board
> and overlay files to match the provider's '#iommu-cells' property.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Note, this must be merged only after the commit fixing iommu-maps lands
in the qcom dt tree.

For the series itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
