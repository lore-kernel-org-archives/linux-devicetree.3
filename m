Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E5C34D916
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 01:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699646; cv=none; b=uAJyyAbQBq5zj9V5xJaXbbUAHGjb3FTOtMUZVVpFPIuGR6wDkAeIFG7XXcPU/vraTXj6crV6Myllk90KKMw1X4nporMHKhC8e8e8azQ3QCxX+19iWx2p3+BTXfH4qr5nnJEButch5bEr7EeFeeNOEwyaaK/Te8dVsWoab7HeGCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699646; c=relaxed/simple;
	bh=eA47FzT1EGG/lamfButgMitcRPr6SgDq7yGDxrc26Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZNhQsbyCbnTMAOxNPlR3PZooN6Ve5GLmVoUJkO9x3WZ4hNv2/zjxwDhDYwTOJl9FdDjIBj/SnbZvdDP2jueyxZNtSARQA28b6jlYZugpLGKnBlbCikW96hDApv3Lx8asdnQurW9Rlt5MqrCn4kG8QoyWILHrDbSMXeVTgGPy8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOcuYsIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efn+Mmik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOcuYsIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efn+Mmik"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638JY4MT3326658
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 01:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v8G2+YPB/SBAigWP8cicpUlh
	on92WQOzogVuKzi0AyM=; b=bOcuYsILWql9JvTFzzh7Kmwx5RThK3+xWut1qOJL
	R+dHoWPH6V235KB06DBdqB4oPrE0PE+2Q4BkebgiHJgqcAs1KYLs6mhQKbRaiqXw
	JYA/SGC5vskBa3dYsEtsbznRMmpVDbl3/lrkP18xkuWDTI7ywTQTOyCVO/IfZFUW
	2fHEUxAE4Wk3g9u9N5tFr02vb/1g+uUwu/4QRAUHW9GOeE52ELLt7B2I85WD9/Je
	1ZFbdmFelDBPJFMbG0lyLuDnPRConGJi4AFyuZUvTG4H7M6v/ah7lTUc1hsVOwrt
	mOCIgyPejCF/0A7shXVnslrW9UladvYnv6IJcmhfyxeibQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddw9ms1sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:54:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b34223670so24235211cf.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 18:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775699644; x=1776304444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v8G2+YPB/SBAigWP8cicpUlhon92WQOzogVuKzi0AyM=;
        b=efn+MmikHzl5l0pashwXBbolNKnKI+hDui8WqhZ534kyrOjX659XETk1scF5GBv1e0
         JFS430cyJqIkSfFrW7WqA2FsRj15NMt09gv30Lod4DHpC767pMmjcpM3tWJs5utl97Mj
         DrzoX8V+x4rUfEBgb6JgDWRxYxp8kS8ewD35mVQ+8am2Rg8C7yEXo67xvc2Idzh2isn+
         v7kG+8r1VcHBfdbPvhFQpv9sZlX0jCXBmxt8FYBXhbqndGkyOKyg3jtzpopfiy97lgir
         mDLDkCqb6BWZSUY4+kBXeGj20aVwenSN7/KyKrjfmX91yj+4fTjf4fvchRo4mHlfNRBu
         H6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699644; x=1776304444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8G2+YPB/SBAigWP8cicpUlhon92WQOzogVuKzi0AyM=;
        b=JlbfKNeOJ49kD55wL5Zq5r7+8QdmbAuXBNQcHn5VQv0dCJus7i37lfv7u4ctVC8tn5
         MlRA9ghLWLRMFGIvgKbYgVritDJnDMqVRlPGiJjHuuFtsCCQiODTnMfXV4WUoakw8SRa
         oYqGGOQdtA0xkM2zEW26JXQ2vupcdnLh1umzHjS73LHPw9sq0Fa82F7Lo8MIvbBT3UnA
         wajXOcntrgFV6t1mcd6MdwyccmPDKoY5IVirSR0B+wdP7vpzdRdD/LHL+SSQb2Xthu7W
         khKn008/YcrXOO2lJM0P08qR9y0tGXv/is0H0mYGItN+cYBp5GMA2AWk0MvXx1PHdCi1
         3XoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQSIp4/OfkOPO+GYadWmV//XUhRDf8lGBhYFaw8bU1vjowriOWIxNqOsuGeX4IyQYAbIWhlqmzYOya@vger.kernel.org
X-Gm-Message-State: AOJu0YxIl3qMNJNoDbAjknZXkFFbiB/+/Ks1sLULvfs0U4pZHsHNJkDt
	4nMrpvcJbnpXvtM/IIl+5RPPKbk+2lwqJbuylTPL2TxhbvXDMWn4r3jHwcgqWY3ZFE4hKeUt+Bk
	3TU+XoQu3oROa2BCHI+aXOBVddifYQEWaly4FaRp6pRlCVoBRBWFszWLih+RaMeK6
X-Gm-Gg: AeBDievRpLSHfR10dE9vzjElMaXI0gEU/rfyMV9xzCMzwgP0QNF7x/oX7671eQxwuYZ
	FTjv8JXxacX2dibfbMLgFbs/n/zrUQ+MuMQITkaYQY6opXU7XyEEof7NJks4n/ScWHC4DRidr/i
	hkOlYzD9ibIxZ4RcFOyAkx2SSEtALDiKl+61d53gku5fSFIgK3wnJljcaNjX6TK0rMlyuqtWYz3
	JvizYzWGkqkRme0oalpW8+S50WsQrFDKKixbBgGrVPVTd+n3CywGXu7KIPYw7UAsbsTyBde9CvS
	mfQSiwc3MJ3tPo6RG+z8YLrZlSmYxE3rZgSwANyijYHfunJ3lqWP4+0CsOp4pHXXzmJbtyZbfls
	VJHZ6uQjLZrM+tkJWjSmUMbXaJOlqxMO9GvzAgFczKYV0jLFUK6/s7NlMH46jgg0rd1hW6zK3yX
	Tfud1dStm2oOv219D6Bd5kOAJsEjZpaPIxzi8=
X-Received: by 2002:a05:622a:148e:b0:50d:a8f5:d525 with SMTP id d75a77b69052e-50dc22b301dmr26151251cf.51.1775699643598;
        Wed, 08 Apr 2026 18:54:03 -0700 (PDT)
X-Received: by 2002:a05:622a:148e:b0:50d:a8f5:d525 with SMTP id d75a77b69052e-50dc22b301dmr26151061cf.51.1775699643152;
        Wed, 08 Apr 2026 18:54:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95294sm5198541e87.12.2026.04.08.18.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:54:00 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:53:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: add SoC ID for IPQ9650 family
Message-ID: <5wwulhvswdyt7mwbzu2asmakb7e6orr574nlpxrnvpdehp7czg@xaoncvbzel7n>
References: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
 <20260408-ipq9650_soc_ids-v1-2-e76faac33f77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408-ipq9650_soc_ids-v1-2-e76faac33f77@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=69d706bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=V6X-YPDo6O0cH8H3Wq0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: wU5JS7y-ESPTS8lZUPHKfvilniRGpy4n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxNSBTYWx0ZWRfX2cFwDMNA+LtD
 BsPYzjqFNCk6p9jPjvbdt5yvVh+1Yc0RmJXN66joVYyV+dpS0Mga0IphuCiOojjUEymQNAdLDl8
 98WIhz5rZJtdb6GUCUOB50o9a1ThJgNALMNJUkZhnwpd9l4hjbsg6Bk9df8sVVUfTNumJXca62f
 XNto7GPdgi4X6u4xDvucc+RLF3ptHLhv7R8NSeYQQT9jt/Hwxs2JoxTL1qiZGwkHBVdZslg1QHL
 2fpyLU1Lm5ge1GDJTjc3dEAe44UshnjLw2bFOaeaForwXpmKg/In/ahqNlbkHftO/DC13SaDGMB
 IRoDLYDxknNoKs5y1XyqmMCB0Jrpim9mPb5AuSlwtAbKoHma498WL5f1WiMeKw511AK5UQx+IxY
 o3siv4jd8ULV8Iy2uWY3e6zcMjfm2RpKxvqFXnoISuPScRZgCLQyGPduRVgPiCNs8CUWJSmfpCp
 jpdEiNmQx7Peb+Ai9cA==
X-Proofpoint-GUID: wU5JS7y-ESPTS8lZUPHKfvilniRGpy4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090015

On Wed, Apr 08, 2026 at 03:28:35PM +0530, Kathiravan Thirumoorthy wrote:
> Add SoC IDs for Qualcomm's IPQ9650 family.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/socinfo.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
