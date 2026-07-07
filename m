Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FC7F4F1
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 03:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783395503; cv=none; b=cB3qFdpOKvwVRmIdv0Oe01ZWPG2vzCUpgRJ6QQiN5OFUWZK8D2+B2PFMZ/3PoGJuvKPp9kIm7Ht3hB6FlMr1oT/si/SKcN/s2PtdIJl3DQ9WkozyUSsJHEl+abRJY0wPmkWtX/FV+AhZjFI5Gd0z+Qp8zTP4Ws9TNQWQsQoEw9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783395503; c=relaxed/simple;
	bh=1R19W3UJiMF+o5dXiMyPiCVU0LUlZzWvzTRuI3yjAWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=he8QFK5HEfmRItA1yqpxvYpPCPv8vi5D0/IP5VOrhz5PS2b+TxR40ocedXl0a1NXFk8e1uojj0QJaIOn8mpKFUFzUCRS+XScYchB/kOmG826z24o0qXwHBIY6xpbcg/GNP9aELZASzDSNUvIKVoNa6tfnj36bF/aKmiES3XOmec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPspTZmr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOQUQuKE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nPspTZmr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOQUQuKE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE6cw1428900
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 03:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B2TcjwvrSLcx95mIcFbiGsi6
	rjGASOKN5ZORqhzeVGk=; b=nPspTZmrl/QhCJ2qBdBBBGG6cQo0ZHrLpnyjILAE
	tQBQsSsIFf9S2sH8oWbLTez3mH/Es1OGrP0hs6c6UPYhmfNkvhf242C8h8lj5f9+
	Nk5g3EGtf2S7nDYl+DP/CTh2ogvPkV1LLr392P1yPKbYrd2SVVRiSgouVbV8lhsp
	lgHtjdIzwChh6fJx4ESddXHkAxxeaGYvt+QvkiNxWc5O0pdxB3vFYUgI2NHQhqYy
	u2Dk8W/dIfgF4A80og0PsukAV8uNbfO26bmFjRYV6s9Zq0ulf6fIjxmbH/cnMKgu
	WCDxDfVbc78Y5RUJFSTNrRiUtPZbHpyC2R1WyRXW/FfKeA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxvka2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:38:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-384419c6c74so3359509a91.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 20:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783395501; x=1784000301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2TcjwvrSLcx95mIcFbiGsi6rjGASOKN5ZORqhzeVGk=;
        b=gOQUQuKEfVUcZKcxr9DK9ePqBImeKA9Lyp49vZ8sS2pdsBtqscZVEKQHgh31gqEsqW
         S5jnA5eG5TM1xd1CiM8TNCEix/RCe+s+fhy2ioc1BU/K0znz6vs7eDq/a3jyePtVsc0z
         Oq7GX6oURRwZ3z0VSGc6e11IE/ywCZ27N1giYYrRlbNWnARDTV7svAy3HBj0rUSBxuhF
         nojgAtRwGHkRNYFLQDDKSZny3dzgTAE2YONwOIgRvHz8mmcd6hAmyCCf2yuZCCTcFtnA
         N8QsnnLNGxX9pxrAo9qJg69YjvrVhgg6m98K3tFxFwDPvhchNSr20IuWaoAaRRvx+dL4
         uEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783395501; x=1784000301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2TcjwvrSLcx95mIcFbiGsi6rjGASOKN5ZORqhzeVGk=;
        b=RcVX4bUnLyKfdUkvpd7CTW7SqN17HjTi79IWA2/NHScI6/3VtNEIX6caen2xJaH2m7
         FWILFZ+TJnDSFU2hH2Q27rVUVlR8UIzzgLpHpUM+En0IMCkfb47Thvzf1znxCGs2GecB
         kzuxM2ummJLD1uy03bX26b4DjgW3a2lbQw8rYOz6iTr7sZ16YKZdeAnHET3Zb/dcGRjz
         bhjWAIc+MsitVZflWqE8ThCI8jp4cuUDubUAmbhRHkj3sxASvIELOwbMCZj/3WOhMOdY
         QpUT0MbOzcRxSJh4E5rGpmLsftaqC2UvX2zlDuZks3XI6p0SWzp3mfjg0JthY1jIrQme
         r7qg==
X-Forwarded-Encrypted: i=1; AHgh+RoHzKMhcrL0A7BWuYMLdBtIDtjMtOGroIJfPhpGaZUfKTEBVWKAqz6sRpCH2VZR86BQvMPGZtfEL0PG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+wUrB52bwQlEJWxCqzQn7D7uhQlsMzUw4XqHjboFJ9dY5qooH
	zOwMDSEpXwtA4M4KQfEelaYby1ugibqGKEf0xsCtBDhBb8y17hoT/3gnZ9J5ikQhjekmBRwDYsI
	vzzqkvVRAUz8aiWongEWUJVnJ7tzFuDoY7f1i01YXO0bPQuRcuzrLcb4nWLuvUlna
X-Gm-Gg: AfdE7cmoU1CIciY8wT4pIVNvhaVnHzQJVHLnk/fkj+dThOG61bHFsCZJkz2LrHjTxOU
	DpCTrFkFLG4KUiyBwlmpS68iXY+qdj9VTMTsHrWtzZQ3ukQLfSo6d2/QbnTqreZJzcIN4lOMJtY
	8d1IBywyKuoCxz+CdqHEHcCc8AOIwJIJcEcHLio8kpi1ycifGY62dIOiP225lH/A+3w9f7ogJhx
	GayvFjoOD/uXBpaUiqzh3C0HMxiWc4Z0xIiXNvv4NZA2fuI+XogLherXDnkrTzJjKFl3NfE2r8Z
	XXVierz9YoITQZB3xmMuo3VdoFcm3LhGEkqm8D4lXIOUa5TX36DqTnN8QL1P3MB2qqMCnU0Fk2a
	baBiX0P9iEzwv8zPm1ni3SdYlD8tLn/gFkfAf58n5ZP+t
X-Received: by 2002:a17:90b:2e48:b0:37d:9874:9363 with SMTP id 98e67ed59e1d1-387568026b5mr3341539a91.2.1783395500937;
        Mon, 06 Jul 2026 20:38:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:37d:9874:9363 with SMTP id 98e67ed59e1d1-387568026b5mr3341504a91.2.1783395500404;
        Mon, 06 Jul 2026 20:38:20 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac178dsm3126112eec.28.2026.07.06.20.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:38:20 -0700 (PDT)
Date: Tue, 7 Jul 2026 09:08:13 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
Message-ID: <bdb6ea4a-9536-4b4e-9849-2ebf2d26fd60@quicinc.com>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
 <eb197cd7-c1cb-4edb-951c-dba08864ec74@quicinc.com>
 <46af10c8-8400-4131-ac87-b3f17350bb65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46af10c8-8400-4131-ac87-b3f17350bb65@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dV0W29VffevIcmf1WJ5Wm6aGYSfhQQ7X
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4c74ad cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=1l3KTh2Z3xRHg-jYdCcA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDAzMCBTYWx0ZWRfX62UHzGGLBr8R
 xnO58Nh+XTgDW/gHz/FlNuAnMzxf3AE9DxCo4oDBwpcnQJ7cDQ0MI6MaSAMeYRoRNHeSBQJRzMC
 0JiuE8dz+w8F4dJkV6ql6/cs0DpdwZg=
X-Proofpoint-GUID: dV0W29VffevIcmf1WJ5Wm6aGYSfhQQ7X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDAzMCBTYWx0ZWRfX276EvfuYBUbs
 2DXGOeKthh/1nuhsX0h6J5g6DuC5qDT6kcQfM7FxTZEGObeCj9BGsCkW/fdDYLjvmq4TZbhMdpk
 0htg5/9T6QYg82mmlRDbqppW2A2dAbHDYe9uAx0KCityasdSa/3LS4TE3dVWu4myqM07mcRpMA8
 GBxrzNv6keq/NSSSmdn3cfBYVq1quEiZcVK0JafYsQJqWfHYkw68PLQGZiNGK0RZRmRKnbwbYnx
 /h6YGk3dA48KKV+4vro6RJwJKCqzkofj3N2SeT5+XvHJyRQX9viN91WvoqiEowDEbUO413me0dO
 fIcq7OpLe9lhq52xCB4K5F/+Qq18FYQG/LytjdqaGXxdwJQLFUhrWXUbAQSLIPHBp9L4VUv8WMI
 D/HaGCSpNx/P1CHb1yepiNaLy7oD7Fm92cWKd38H/0uYrnSCZCY6wdkFn3TB2YrD5FSKccLnmF8
 F+xEQvDWOhLc+Czx1hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070030

On Mon, Jul 06, 2026 at 07:15:15PM -0700, Deepti Jaggi wrote:
> 
> 
> On 7/6/2026 6:57 AM, Pavan Kondeti wrote:
> > On Tue, May 26, 2026 at 01:12:58PM +0800, Shawn Guo wrote:
> >> diff --git a/arch/arm64/boot/dts/qcom/scmi-common.dtsi b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> >> new file mode 100644
> >> index 000000000000..0c7ffe9e415c
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> >> @@ -0,0 +1,1918 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +
> >> +&firmware {
> >> +	scmi0: scmi-0 {
> >> +		compatible = "qcom,scmi-smc";
> >> +		arm,smc-id = <0xc6008012>;
> >> +		shmem = <&shmem0>;
> >> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
> >> +		interrupt-names = "a2p";
> > 
> > I believe this interrupt source is GearVM firmware via Gunyah's
> > doorbell, correct? How do we know that scmi0 instance's interrupt 
> > is GIC_SPI#963? Are these assumed to be constant/fixed through out
> > the life time of this SoC?
> 
> Yes, this interrupt is a Gunyah Rx doorbell VIRQ for SCMI a2p completion
> from GearVM to Linux. It is allocated by Gunyah RM from the platform's virtual
> IRQ range and patched into the DTB by Linux bootloader at boot stage.
>  
> > 

Thanks Deepti. IIUC, GIC_SPI#963 may be overridden by bootloader and
potentially this IRQ can change across runs or when firmware is changed
etc. The interrupt property is a place holder. can you confirm please?

Thanks,
Pavan
