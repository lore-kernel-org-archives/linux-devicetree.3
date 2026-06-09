Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393BD3B47CA
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990240; cv=none; b=bwuBMg3Hum7lfyPSMPOeBsUCSRZh2ZzXsdfPI28YmKWDXRtaAaM3uA+jPoH6qOn1ICTU9/I2pdfgai46gZQFWdYKsWNGLNS+IChtF2dfNHCgqoFFQJ3L+rymVn4b7kVztLPfkSCAb17fptHStAKH3WG30ossQ2+xKeUplUUjS1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990240; c=relaxed/simple;
	bh=+v6IEbQVCpkDL/Xft9tmnNB8By/FFw35YP6vmoZkLyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXQDBoZmItIHkwnyGX3r0Q8vaHAnGS1HZ+ZoruhaqSJft6hK9RoedLd9AEmkTWcLJwA1kRppSWINSfkINW+wmJSH1MdfB+C9qCbRFUJzp/LQKs8tixCzS8BqAzl0QhgTxPr5Yg8zCBX866j39FFuYAbELicUb737PS2H7ACXnHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8tV2zqC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LozUe19h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8tV2zqC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LozUe19h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597PY881973107
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 07:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Np3vAMjL3J6o3Lpc/P+gOzC
	v/SDCraSG0R5DHfhCvs=; b=g8tV2zqCRLS0QTs0B/bfHXXVa6nhGyBsHjCFT0k7
	5kvw3I/W+pvwb/x2ATNYFry5+xt0OYDgIONKGP2LMS7h2cL277QwoutgMcuukNL2
	R3LsbN6hlX3pETgeLqYX0RP5lMAUMxplbfiRENNA97Q3+2B/SqsR3wQ4S9GBBn2g
	hequbsauchtEC9+McPIcitgC+ZK+949rRV1KBz/Q22NmTp0+14t5Zvd2eBPCdm0h
	kPskV/dp6o/nR4b7xkOsG+dGuS6/Fp/72gqcC8NbW4jK8gF2equ+PGej1sWdnIQj
	DWdbX4vWO6DLywfAARW8zzKoPxTB8TRIND6nLuMcI3rQIg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeear0p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:30:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51776d4355cso149156431cf.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 00:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780990237; x=1781595037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Np3vAMjL3J6o3Lpc/P+gOzCv/SDCraSG0R5DHfhCvs=;
        b=LozUe19hPaNflzi2s6/hYgl+UElGMzjdCS7XzOVi9lnWRV1tWjgA0vIIrrtAI6PJuP
         Pb/FFkEHMzJ084wQfBbXxOFFmkK6hAvfIEax4LAQygO7rzBc/W4Xr5Iy9kBiqB+/9AFK
         gfenB+ji+l54RLRE7e0BRbN7yBQ0K77DmCWfh2mssaCW2bkv1oLvxBhcjkjeumdoZ5gt
         LEgTUMDKUKbDTZbErAicaNArYn2Se2CAa9uowU6/8ziam+urIfdppwPGMX7Ue4Z0Jixu
         C5T6858rvwXKeied2IHnVCLsaytGC4HdXyrCP6d4RbqcIKovcue71IjXfimrMaHm2KAS
         MRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780990237; x=1781595037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Np3vAMjL3J6o3Lpc/P+gOzCv/SDCraSG0R5DHfhCvs=;
        b=nHfAkBxCAXJAarjs1fJ3mIsDX9h4a+7ameoungBkNBfohJtZT2FrWuCGKYgIN8+di6
         ITJxlJjpM1itASu1h4q9SqZxLbW0/tcRWTKyDPFsRWEX0retIBRoVLe3pj5jU4hCPlAn
         J6ImDrlB6WMhEYEuZbs05y3DBx/u257kS8CWef2tUATfx5JoNdFko4hRVMdRHcVrMBZA
         YbbZJGlc/Xz7aQZjmeQnbukobNLPahTQk1ShsY26SCGC93fysdEInVTFlsXB0bHVe+gm
         R+N/94SnhUJYwDtw7JU0p4NTq+Gmiock91dZYRbUXX9p8bWVFHVfP2JipPLu3h6nhh1O
         VKTA==
X-Forwarded-Encrypted: i=1; AFNElJ/LcFDfTg4G3pWLTUlC69Vl7gXxDYqA/xnGyJeCcOXjLkalhZZsWJ/a1Z+cn30kfLVEIqllvslL17vp@vger.kernel.org
X-Gm-Message-State: AOJu0YzrPCeLNMj4uWVrPneXY/QeNn0QfcLlHePiSLnI+0U0q2WAIMuq
	XjmCOevGjrKav5Tp0Otuvpivr84q5URjDjNUEiAPx5jlq6Kuj6qv69/JdzBRXtY74Pf/7MXEd2p
	NCK3NBYyfKam2l50xOe1zISsd8ca+LVkoBbIZgqjTyKmpuGT3jTyTrJsUb7JtrNl7
X-Gm-Gg: Acq92OERHHt1uTry2+fopYx2Ou5CcnGLswBZPjbWtyTFndnnwxbefpdW0I5XIbCCues
	nU0XlrtE/NxsJvEbfgJYCWLbAOOyCrZ3ONGurw6A5Ycyg+j6yH+uKYKKR3WNz5AiK10JK6d0/Or
	R3ffx96rQmKdUC1cOdBMz+8MaE6lgeSqvgJEOBOjkaYvHiJAKAJBsktvIqJXdvMUqX1RRfuYvwo
	bwJb4SysFc8Wh+6CDx/SXzSsUHY5bCg2M+9uDruL+YQVlJnfTx1DVAQLNDKlLncuqha2HELWhUr
	pceLVcNe0H6L0+7nzumHxfXecoirBhg2aB05mAunkNFNUF0jVcHGTYLCfSTcw+eVtnvB/btRFa/
	xVxZs8ndL8yvoI2bh6ye2k5/Zi0DSL3JTtagqTsdhbLs=
X-Received: by 2002:a05:622a:684b:20b0:517:c582:9161 with SMTP id d75a77b69052e-517c5829bafmr28027711cf.7.1780990237418;
        Tue, 09 Jun 2026 00:30:37 -0700 (PDT)
X-Received: by 2002:a05:622a:684b:20b0:517:c582:9161 with SMTP id d75a77b69052e-517c5829bafmr28027541cf.7.1780990236888;
        Tue, 09 Jun 2026 00:30:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f5612sm57587244f8f.15.2026.06.09.00.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:30:35 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:30:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Eliza CQS EVK board
Message-ID: <fb5mewo6su6u5axg5oludgew5jpmxoimbvsrdc4xxczgyb4uyw@yn7kqgkgsyny>
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
 <20260519-eliza-dts-qcs-evk-v2-3-ad7303659d24@oss.qualcomm.com>
 <786f5464-d151-4c49-81c3-62cbb0a148b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <786f5464-d151-4c49-81c3-62cbb0a148b5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: m1ZQe64myJogUqccE17TYT7rw-hrlV90
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27c11e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8QTKlXtQg7LSafaPMREA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2OCBTYWx0ZWRfX5B5kuGvtVghh
 KusnF+hLnGRnvAlx5F36UNk2P/VGD60Ztm5B2Re+6LH/7znr7Z7g9BpAXzzCz2qqOlWDUxX4iq2
 RTWDCabVdO7JioLrhGv3E2/9G5nuKVcRRsuREzdGzzUtJYbHbMg4rmI/gfNwUq/Z4Q7/zWD1Vv4
 viLoB6pUPNYMn+h4sgRH3ZxDPMm+kzzB5xRpZhsCVS7jfGCAeinxvexYa7j7ZwzoJyrXuMciGGu
 MlEmw+UvjGSnQr02mI8UHh9eMJvXw8UaUlQTK6PWdLu3/AdvP7cZyNx03tbP3+4rv4Ikf/jNSB+
 orz9GN3qoG7sinvPjYgPwYJv6RH3nkRLOjYcVZkZVtQPGtm8rufi9jJyHneK4gAw83QYuY2mO5c
 Bb9tdafKGG1axGfK5fT5bIGXBfcMkO5ojx0VUaQmP4Ly88P3WGKCvF1vlnutKFtXsjBjN/tweJy
 EQT9/2HyRoJlfqcgmDQ==
X-Proofpoint-GUID: m1ZQe64myJogUqccE17TYT7rw-hrlV90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090068

On 26-05-22 14:11:38, Konrad Dybcio wrote:
> On 5/19/26 6:09 PM, Abel Vesa wrote:
> > The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
> > common Eliza EVK base board, which provides connectors for different
> > peripherals.
> > 
> > Add a common Eliza EVK dtsi for the base board bits that can be reused
> > alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
> > including the CQS SoM and common EVK dtsi.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile          |  1 +
> >  arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 20 ++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++
> >  3 files changed, 41 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 795cee4757ab..e244e808a647 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
> > new file mode 100644
> > index 000000000000..d1cf08ce19d1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
> > @@ -0,0 +1,20 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "eliza-cqs-som.dtsi"
> > +#include "eliza-evk.dtsi"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
> > +	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
> > +};
> > +
> > +&tlmm {
> > +	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
> > +			       <111 2>,  /* WCN UART1 */
> > +			       <118 1>;  /* NFC Secure I/O */
> 
> Are these going to be specific to the CQS-EVK?
> 

Sorry for the late reply.

These should probably belong in the SoM.

Will move them there and respin.

> Otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks.
