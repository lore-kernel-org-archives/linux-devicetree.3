Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E446538D94
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953995; cv=none; b=Qt1aqRBVEyYPbya/0umMkNM0rzjajhp74AEle/JepbsbP3gDhMjkEFKziJDEhW4R7cujDiGmvzRIvjzFEv3iBIJfawcd9juaSYYH7KRzMCy/EcLLv9WHL4awY3RF2MUFELNqCdqRjJfHs3VQKYUrUrvP5FQhkLECOCOq65qjRjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953995; c=relaxed/simple;
	bh=jyBRmYpXCpDJbVY8rOr855AO6lww7636SkJgGsvfo0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/vURUeSsIVUqnZo/HsKmiqTxBza5B3Ldartc/XUSMTK6r4UZRjlWyggasbskAr/JJaP+xG+VgeDe8FTzCYzAYsry2/dFIcP3dtjBvNPHGZQln7jEaPFE+wkmxFPbCCFhhFIk8vMCAwi0NaihOvDdqWZc7O+6JcFAeCCreWT+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnxEkMKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RsTfX2Fj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnxEkMKV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RsTfX2Fj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUANP2653583
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 11:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9m4Z66gMGNnKI2MZsthj98sX
	oGQbEn+eH/Ga1n5jBmo=; b=cnxEkMKV9Ekj+H4T1ait1R5G9upQEYnuWn9mGbJc
	8IrGEHHYOJ31aJ9xNnF7C66Y32YIQbWb6vmbCYAazDjacrVrhrAVz+sHfryRnSIY
	VaW/kLAnZ9OaisXsN7RfMaRnHom8OVukQGO2Z4L3u1ck5WLbFZ8cOhpoLCudDnBn
	oFV4M7qgSp0YQIqpObCuC3wffTXFRYVGwv4bfcethAM5mq3z7Ch8gvGaut5NlOPc
	e3bnyGfG1gdiDdOFGr/qtKe4R1I+u2Ke98gPIILGJ7BG5ATg/M3J6MgrvG1mC5Lg
	nw4Ux/0+FViOb16JLflu4n3f26bEVrixornVxfyJ1ujaIA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha3tqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:39:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so9055711a12.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953993; x=1789558793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9m4Z66gMGNnKI2MZsthj98sXoGQbEn+eH/Ga1n5jBmo=;
        b=RsTfX2Fj7KnffWLuKwAPt0bmaPLSq7y4x9zOovz0rXBWAEizlJATNzzl1VjYpKFPUc
         zotwYuQxNRYxccBy995QhjkutCQdbnRck+cqjQVG79Vlh5TevadOctKQ5fci3ra4uIbZ
         qXlOxOQwHG4ZTD6tdm71PbGPKI7nf61X8vmnbn7+yKD1Z5gAR6UFuwZnAA0uwLwD9Vif
         t4m9XgOw7L2iGJxoBWLqvgIeRovxdqNDNgJutMxoizKRxumTketrv+iI/WFw5M08A7Ga
         yr6RCOh2H7a20XJG0V+3qq6bB7hUdbz0bexLaG4lAVUkAqCi5n+5qdN+G1GLYlkk//+J
         OJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953993; x=1789558793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9m4Z66gMGNnKI2MZsthj98sXoGQbEn+eH/Ga1n5jBmo=;
        b=YG79sW4x7N69LFDMUIezgiS7P2HMn/QNvMmJG6qcN/s7PoHwE3fjJUI++nj6h2Nwpa
         TCqCtQMUhPpGisCguYqUvuk8SvJRfWE79G5a5OGbY/Kg6gU5xoYcIbzwLX3kUsPkZ6Ya
         bQbv6h1WH7iLx3FErlHLqoOS20ot5ojb0z13NsUHEc8ffqWXz8yDOJE6gdAQvK3IxgLp
         zTyIUg1zrv/biJs37S65uSmVTEqL5S+EFl7JSdfv0O9F4PdR5b00j/HJROZyqL1Wj/7a
         YlgH4yZdm+4Jn2aPt6lX4LMLK8RpF9uPkoe1iEWYhSe5qH/xshgulXAW621BFnWmtjqf
         lhLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOhTbLvBfu0vSs0jmqbP42qAAUrn4YQSh3I1nfbIqCQu6N3i+LBM0LrYrqi8eyzOWqjLkXKZUrfDKS@vger.kernel.org
X-Gm-Message-State: AFuF++m7bknwSpxK4/7uMk+um3x8XkAi8Ua0eMlDuqz7OOfJ6uxNMUZ3
	vqdut0k8p2xnLDTrQj+HCg8jIO76hWRYKtlVXB4kVoIPf1r9wDoSqPklaN98IhI4NkQpkPMPJXW
	Za6hmAr69/YD7GN6Tqyt2U7/Vl5PXrU5gYLvTIGZEMDrJvv35XXG8kzOwXBx0woX2
X-Gm-Gg: AYBFou2ig4XYuxCfPyK8GBzcWvHEgV6762tNj8qvGJ2fYr+YpNfA9utm7q5Zt2wVnYt
	EW+T1jQQqB6S6xpwJ6Z8xhMJX/knSQcuBKZq7+lIIhheCjj/98BVS4BWC5Mm91NV9EJMFPGxu3K
	vNEkuzCY3lTLo+z93IfSlsKp0ntdyIso3W++gwyTif89O0SAPbZyXWXQcSYsBjWjxLitQqaOCmb
	Y0VDBwWDzsaD4IzigwQNhKmft8yumRtiwieBcX9NXrWzpPhPumP9txvT+x2eIkgqecwLHbUnJZs
	aBWX4g9Fyy8wo5hu3XaNFO/atxHI92TEP3UEwdFfkhthzredyPLYGHUJ5pWfq3Q6A3E8Z/vxbZ7
	Yjazml/5SDS1NFA==
X-Received: by 2002:a17:90b:3a0f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39bac34a3c3mr7585787a91.15.1788953992505;
        Wed, 09 Sep 2026 04:39:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39bac34a3c3mr7585750a91.15.1788953992067;
        Wed, 09 Sep 2026 04:39:52 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm36764429eec.6.2026.09.09.04.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:39:51 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:09:44 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 1/5] arm64: dts: qcom: shikra-iqs-som: fix
 GPIO138 reservation
Message-ID: <aqFFgPpqsHG2N96X@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
 <4aee70eb-bd1d-4320-8921-e55bb8e0d176@kernel.org>
 <98602703-4a1c-4e91-b7bf-934bb9894eb7@kernel.org>
 <aa6ec351-70a3-4edb-9c8d-a1cd2565fc29@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6ec351-70a3-4edb-9c8d-a1cd2565fc29@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMCBTYWx0ZWRfX2AETSZbBhwG0
 H91Q1TvzYWxP3rS7r126lQXSEl52vw4GbET/TzwwhDrjYU+FGEYN1nkZBPYpPsIqFHNDPYkF3Yj
 HTI/N+sR5PpXn8XlmTfsp7BP/pdJ2dSPYaKdqOAS+wRL8VmsMio1PhJXuSF0Z7GVXn3oOIRnc5M
 bVVcG7JIjWcgQkepaTVpuxfi18ON8monQ9MgObYasp0ypNx4WSBYT3eAJhzW4T82DfuKjZCnXgl
 PUYqlnGGBiDGtc7eweqEZuwL1tAwYQ4ZjsntnLlelN68s2JDMeaYGOgIOpgoGKRFXCa3jnmY+5L
 pESMW+oALHQexH3JB9Vg3aJfdytvmU3FvtMHo6nAiUkJApCTyVZFRcixS8GEKKy6cGYyY0XfBXK
 a0/P1xqL+FuUgXjiHiA6+533V+bHs5bdiRGEG1UxAjKGX8DZUsLeLeJewVV0KMZs4KhsrJHwVNn
 WBjuFP8A0zH611ljNkQ==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa14589 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eU4lnWU2jQs4ucgFyO4A:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: KnImlHvxe2Fz5RXX-WJRDaTk3GfByp5Q
X-Proofpoint-ORIG-GUID: KnImlHvxe2Fz5RXX-WJRDaTk3GfByp5Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMCBTYWx0ZWRfX28nf9O/acr/P
 zyFtFrN0SVD7jzt0Qs8JGIW5Mrq8AO8EazTfLW6X242NGAKpLlja+MPiPIe2Mm+yGmQRN/HUkGg
 gzzvJMSMvqL7SQLDmzWqUc1opvlXI3M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090130

On Wed, Sep 09, 2026 at 01:33:57PM +0200, Krzysztof Kozlowski wrote:
> On 09/09/2026 13:30, Krzysztof Kozlowski wrote:
> > On 09/09/2026 13:24, Krzysztof Kozlowski wrote:
> >> On 08/09/2026 08:23, Mohd Ayaan Anwar wrote:
> >>> The GPIO mappings on the IQS variant differ from the CQ variants.
> >>> GPIO138 is connected to the RGMII1_RX_CTL pin rather than the NFC ESE
> >>> Secure IO pin; the latter is connected to GPIO49. This incorrect
> >>> reservation causes the probe of the second Ethernet port to fail:
> >>>
> >>>   shikra-tlmm 500000.pinctrl: error -EINVAL: pin-138 (5d20000.ethernet)
> >>>   shikra-tlmm 500000.pinctrl: error -EINVAL: could not request pin 138
> >>>   (GPIO_138) from group gpio138 on device 500000.pinctrl
> >>>   qcom-ethqos 5d20000.ethernet: Error applying setting, reverse things back
> > 
> > 
> > Apply this patch and reproduce it. Is is possible? Didn't we talk about
> > this already?
> > 
> >>>
> >>> Replace gpio138 with gpio49 in the reserved list.
> >>>
> >>> Fixes: 779aead2dace ("arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm")
> >>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>
> >> This looks duplicating:
> >> https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> >>
> > 
> > Ah, no, mixed patches. Duplication is between other works:
> > https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> > https://lore.kernel.org/all/20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com/
> > 
> > But nevertheless I am sure we talked about this, that commit msg and is
> > not accurate... Cannot find the thread, though...
> 
> So here was v1:
> https://lore.kernel.org/all/20260612-shikra_ethernet-v1-9-f0f4a1d19929@oss.qualcomm.com/
> Where I commented that code needs changes and now we see again v1.
> 
> What is with this patch versioning? How is it supposed to work:
> 
> b4 diff '<20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>'
> 
> ???
> 

During the RFC, I mentioned that I will split out the series after
initial feedback. So the RFC (after incorporating the feedback) was split
into:
1. This series (v1)
2. Changes for net-next (v1 and v2 have been sent out):
  https://lore.kernel.org/netdev/20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com/

This particular commit message needs to be rewritten as its not breaking
anything in the current tree. I will fix that and drop the Fixes: tag.

	Ayaan


