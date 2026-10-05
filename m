Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CB424EA90
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199091; cv=none; b=bbO4N4pADJRAJBmgNUPdTqxHGqZ5lZch/Sr7seKEeIDRCFzOTi6vdexmLc6oXiIb/BA7cxKI8d9pX5bBAP/hR1I4doTORb3aFKtfzlrho20Zy1XuxW5SrRvGfsbIv8CGabS99lCUD0hUIoP4rBzTVPNgmw24HYHpaIaURc2jeAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199091; c=relaxed/simple;
	bh=x7290+K8LDLQJRqw1lTNeGAFCtidX+nxRjEF0hEh1GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7jFxwVmsG96AUJfLlcgKir74g/Enf7PjIA8+gZ6bTAtNghLt5Ng7ocvFJJzTOjS6UQhu6B8iejkOwC4eFAGMxLytY7CVWDMLfznJb9D3EpTsLV+5tsmbUK/IWwPe8Fwa6UAw5qEJAU6JoaOu//rokFRZD45zSgUoOsKbsRtaZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omXrQawA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hu29Vsv9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omXrQawA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hu29Vsv9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AoWg81541783
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 11:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+nl4ZBj/sgZVttd2nadDU3SE
	QhAhmStSAizdtAchuBo=; b=omXrQawAJWxTwbu6A7T30G8bizluVgW3suoorbBH
	0K9y/Tyqusek9E6rJf6RDBmwraZY8UjSTVQVEFY8eOgem+XoLVmaHROGXPMYrDtb
	TK6sq4q9XsUNSrZJ3yeQpz5FYu847oGrasFRFUjXrdLbES4i8wzBz9cwupzwOPL/
	WUht0Dxm8lSNJV9rWu1sQ/oGhpeZXvDwtl/NgkAudgpUY4oM+uqQ39mIJokRvT/L
	BacO9lI8A6Ed4arp4GxBsHdUO4W+fZIS+S5T1F7y5zRM0tTjAXgQlbDmd1M9S3Mj
	zOv7+hFRqUl9jpIf6DMzSq4dVOap19KUjS3uSg+TIGXdBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs1tvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 11:18:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so346377285a.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 04:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791199086; x=1791803886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+nl4ZBj/sgZVttd2nadDU3SEQhAhmStSAizdtAchuBo=;
        b=hu29Vsv9kOH3nBh546Gy4Y9kdd2gRbviXmFSVKAFCtDdDgWetxoPcoNwCQuhNPdq/D
         T8PL6sOsxJgttFzwwb7mVH0Z66xrK5SHvRpx5DV9r97gO1tftckLg7HyFkk1s3sOZK2D
         0w8vv+5ukVyUhzPcWGhXPJnVAv1W+TBsl1Oj+hL6CrlvzCGNUI5USYxgzbYVz/fBVC0B
         s/gZPZU6z5r2agE0oYAuaDnS6rDLhl5/6/xaQtyrjKel7AE5mGXSf2pqqSgZqsDnH1em
         scpzwS4OUwHfJN+3Auj3K0sfacLKrgEb/BtRR7cnWKA2CfzRBfXe8663kOzcYwktlbhL
         0zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199086; x=1791803886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nl4ZBj/sgZVttd2nadDU3SEQhAhmStSAizdtAchuBo=;
        b=Nz99Xlfbyfj7S+qnwYBZ6kutgpqFNybs3aiTheR2b1rmX2qpjovP2y/oTlx4aUWfag
         I+7ygd6K3/5x1BO8LqprnswsDpF+qQ3zb0J1TTx1+lyTymytwxXEYmHCn5k0xjWRSZR1
         RwoUk/zUt27NjOJxWCQrhx5AZC/GKk5KkBymuIn5F3uIWNy/wcTTSnXiHCC0/EREbQ1Q
         AaRjq+DHRI6Sk9Z0oe4qQPc01A1GQbPccOXXRULiHHmEP/AKdbDLAeelZrByzBKVSZGA
         8akdoQ/Y5Rde3hNDC2IKTU9gVq+YSuMjf4qiJGKp3e+RGRnqYWPLkzayO17OoxXNwtpf
         LLkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAAVCMyM8CNMErTMVCD/0E4z/2AXbxNxUx1kT+swxFPbUAo0CBlNtO9JyXTtP6Ir3U63In+kQ2XWxg@vger.kernel.org
X-Gm-Message-State: AFuF++nLloyI2nuhKwszfX0KE++XU8C4/qmMC2IdAWdpe6r4VkeGe47R
	9oJk0Ioq4s8+Absay1BmUwB9+AkzJGFo9Tr/fzyq5bZ1c05SyR129NZzxS+K55ZIm4i0hX5xwct
	eP1mnE0jIHJ40JhEvXE1e4K7VmeAPrHH9khfhd0OzZ0RestyOGrTmpkEp4EjDTL74
X-Gm-Gg: AYBFou0ZiSoomvD7un4QSvRt0uGaH5kddsMmJ9UqhRh4kGCsz3xXhkeIgSDU7OOBsb9
	aJ2DzjEbC3pUKas4DQwaAu8bNr3asoF73cFNvqbEZLM98Vm81gf3e/eDsGoG7o/lsn056p3YFWR
	HWQeSJW73ZGyzvHP32rArTtldrw6Lf1JczeE9shJ0vHriRTEdpXyUhGYpDaYf4wsx35jaGJ6HSR
	t2v9Bi7EGcZNP7Nbt47VNGgBYNZNqVRxItySOY2QRiYtfAgEVfL5IaTFjEdbYpKTEEtRLOXu7nU
	uYOhHQJvS517UyOUjwNwf5ftSZloculEb/mbt9qonJJYOLQbffcCSo1ydi8ixcWrRUxpV0VytJF
	rWySOt0obAI59KPd3m+WlXzsavlf3NjFKjP5ihREVLxDVjJGIJvr6CLLuRstpOTkNcefprvdBUh
	XTNOFEPn19NL+5
X-Received: by 2002:a05:620a:3196:b0:93c:b420:c2b8 with SMTP id af79cd13be357-93cf1a50df0mr2022035685a.61.1791199086415;
        Mon, 05 Oct 2026 04:18:06 -0700 (PDT)
X-Received: by 2002:a05:620a:3196:b0:93c:b420:c2b8 with SMTP id af79cd13be357-93cf1a50df0mr2022031785a.61.1791199085999;
        Mon, 05 Oct 2026 04:18:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7b04fesm3065087e87.69.2026.10.05.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:18:04 -0700 (PDT)
Date: Mon, 5 Oct 2026 14:18:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
Message-ID: <gbod66s7mtmmx5uj4efkc5sxu2za42pvn3ojumpsdua2hng3es@2r4bf2becz76>
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
 <20261005-shikra-el2-v3-2-618f7343695c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-shikra-el2-v3-2-618f7343695c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BUSg4ZxN6-c5ctT-E2Rgfxkc6s-4c0Oa
X-Proofpoint-GUID: BUSg4ZxN6-c5ctT-E2Rgfxkc6s-4c0Oa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX0y+Rykx6pEP0
 PzbBqVhSdxF2+F/y6ubldYkSYGnbU/OBYwZJEnyiYRCdUV06/JVIaNtBhSYx5l4CGtZNCguKI1n
 wauP1Bi1VIYD45kOa7ojNkP8nVCHMpA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX4vr+kvfRd/1J
 CnttzYK+JF1xbvxIKDKkZsT6KwCcHfQW9F67Y40F7LMJLgFvFYtmZVkmGaLwqVGxhSGJHtowUsZ
 nTS6UL85Z4+eCBjhsGCDmQ2QKblRIIfKMTdTJFClXrn7K2vvo8g5TLlHprEBWzQW5lpEFCu+CY7
 VTX/ZM/PRTB4xudELyizEf9oghRe+iksAR9Q7PPvlG4J+IoKpu7CdbLQcafsE40+UNBG9GqIy9L
 WF4DCV3cLFO8EO7VeH4wRmEtNEZ07SKoVsdXj6uqyDnIsaucwwQSku0i46opQIf8FExa1tZw9vj
 crzc5++YL09GXqRSfEyLYuoT+m/ZtjChPOrLynL4ZkPscY7jzAQnM8jIl3nNUsVM0B5ZVHqH/qD
 ffeHNNdBngI2Vd1kiKK6xFoXBKGOWdk5JnlFejhpGLTkVwJLQQ0qffRXDRArEA2FwVRu4u2MxU2
 7IRYCNpjbYMw++7xIMA==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac38771 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mkGK_8PVERwZuiyPypMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050043

On Mon, Oct 05, 2026 at 04:44:46PM +0530, Komal Bajaj wrote:
> Shikra boards currently boot Linux under a hypervisor, where the
> remote processor firmware IOMMU streams are managed by the hypervisor.
> When booting Linux directly at EL2 without the hypervisor, the IOMMU
> is instead managed by the consumer of this DeviceTree, so the firmware
> streams for each remote processor need to be described explicitly.
> 
> Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
> devices to produce an -el2.dtb alongside the "normal" dtb.
> 
> Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++++
>  arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
