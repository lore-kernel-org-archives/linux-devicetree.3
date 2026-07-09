Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468EC3CB911
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583001; cv=none; b=fiDwGw/1R7KZ4T6ANPm9gIEPGgJ2Fd9LNclzJc0x8z2kHyfskw133s788+H17SnAlYkIYW/qlDNTqCbd2ip3ifPg6bjlgzISSDF5GgwyH1ut/1IuFZr+JfnzyCqHwLvKafgd0Fj1T6hZnelHjE8kU9Z/swIUfg0GULhMVNoUDwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583001; c=relaxed/simple;
	bh=N2AKOZPF3QCaU8pDNcD5OHSjYdPrRJn+VfVH8dstl/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQH4sqt7ggWt35xMIDyl9O0nyO4Zy7EUcFawNssKMluBdCp9BGu76M/ECCg41F10SM4Cx6pYbLhkQdLkaJI0cQj9v+mBVNTYOan2MXcJNFELQzZvAJqp1lCdEw2JveMSFokP/a/fPMvfrxlfKGn8yCWe9pcJO7ZNlgDZim1MBKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRo2GoJh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCs+VP/3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRo2GoJh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCs+VP/3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669618G1892153
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 07:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iEaAOjzS0I8yEOShcxjJ6Zu0
	Kvm310/Pv3hHpz2NeO8=; b=DRo2GoJhCoxoV+Yadd1GZopMJ+VP6HYguBwCK+6U
	6mAy1OpV1Nz7Zp/ukUdzUxikQr/MQJvBaaep+WSnXlAfkPjdeg2Sdt5ruJjRbvjc
	Sjnu3PQymcMWUH84o3rY4DlJCUW5v2w2JGXNEfbCOnhkqMvu1PF4gYW4ISN5nAeL
	v+Te4uNpkyIYe1QxycTP1UXB+zwFaZWknI8NdMLSrPl3U6pidTlGCpzRko+Mt0/a
	2eReUihmq8U2eiy4wI3FFpoiOt0VCn+/t1eAVCzlesnYN9/uX/GpsKZCd0mvgCx2
	aoFreZH+mEeX+K0RurYp5kpi3BaFvpujU/WBOH7YFrmIPw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvte0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:43:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-737d352d3b0so1191239137.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 00:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582997; x=1784187797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iEaAOjzS0I8yEOShcxjJ6Zu0Kvm310/Pv3hHpz2NeO8=;
        b=jCs+VP/3Sp8RdVUFtTc+xHG/Bi/0XKGXXb6ASitLcXlCMfrRHwU70BSiVslf40KEKN
         GDyHw3XYESVzocb0TIVz7g8Cbpjt5kx/HlA/tNveW+F2u+F5pZDgLqMxa9fCWxH3dPZm
         e3hky5v/jCoSwl+ymxMyQG4YPa37pKXnVTxn9JH2scOUVC2jKSR9AypdhSipiDZcAedc
         UnAIwTsKZ3sIwwMDdU87SplimY7wMUeGeK0mcRaPdpBSefqUyTDr0KbAQLdhEWNU4LUg
         TjQQPH8V06RYPRkZBG9HPuOQEX3hLdoL+nUlVJm3ydh5auFb24kpXbOrS3LrqWUeNUjE
         SLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582997; x=1784187797;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEaAOjzS0I8yEOShcxjJ6Zu0Kvm310/Pv3hHpz2NeO8=;
        b=S2c+BUq9mdoSNpPwaHWAGhDMqlHPMSmZxG46dXKdPbFPmv2qlNpKmVGIoaMuqSA7I3
         y3DeD4A+d4E+QNV8/uG8CseCDops+V9CCDQ5uf0UzufePNP1i+/vaP9f4C3iHft06LJG
         pSB6Xd5RJOI/yRIzO0FWZPmlikiY2ltuGN5acZg/l/GYn6X4G/Aj0znSFBAKpyqsAwtF
         9cKB6t0B2TMREU2T+c47CYkn3iRXlLoEBQdUOqNe4/N8fyt55s0+3pVsfRX3PYi4uJd5
         Ewo0v5zoKWkMppZXtq2PFRc6Zl0OIhVtQw5eI0yyi7ktbUeRaPwgVCXcLLAbB5IH97KZ
         EqiA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3ddhKVWWnbWW6CmZdKp9G1oKAo+Hq2dK7q+z49tOEuTm1B5cG60SzBjJ+tC2B5CghXjzpfzeLMJ8A@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8NU366dWBiU4Sz6LUK1RRmv58vMApPtuHWeDCTelq0++4O8tn
	VUwdBlg8p+K9hoQfRH1ozaEF/EunbsBTE9EWFMbhnei4RKza4xyGm8GcG8ksvTPUiXZLDZbQ9Wb
	41h6rKRspC/4jNFVG6OMABtMxOtN/y8BnNjk1bLJ9TM0mNyRdZV18YooY4q7YlZjm
X-Gm-Gg: AfdE7cmBfsz7i0LxGk/iz8gq/aVLtb9ep8bHHp1ll/f6SrHr68oxt7TmsW5bvnyYBP6
	JQIStY4Ve/64TLJ9gf7HiWqmQZZAJ+IZ1wOjm4GHorjUbsYqgogFUc/2MLglGd5PRQP0Pq7xCqL
	eSBbX5Ybh1HKBAVrsH9l8A9R+6B17fbuvWFfeIuTowPtTYLiEgl7Gwv3QcwwQ2PCDKVS+jjgTMT
	/UbaoUrXozm8vC7k0ar/n//wxgQx1bk807oOtSK/uRiyK+TTogc0/MgFD2ex2YqDC/A2H/xJmLX
	QZ5fFJOKB2AHyB8b3lfW8DsoSowfCwu1DxHttzXQ/8Dv1+a9ledAsN+vrq1LmgucKgs7XrXlAII
	CU/HfnqaMrJyPWxgu0yV9rwD309NMolwqIsq+HCIo3HNwlGIGhsTaRalPppHt+wDj7npInd7EV+
	fyPqhZV8Wl04jXcZ58cnB6Mza/
X-Received: by 2002:a05:6102:a4b:b0:73a:16eb:ac94 with SMTP id ada2fe7eead31-744e0327293mr3634275137.19.1783582997500;
        Thu, 09 Jul 2026 00:43:17 -0700 (PDT)
X-Received: by 2002:a05:6102:a4b:b0:73a:16eb:ac94 with SMTP id ada2fe7eead31-744e0327293mr3634256137.19.1783582997038;
        Thu, 09 Jul 2026 00:43:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b017f150f3sm199031e87.30.2026.07.09.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:43:15 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:43:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <axs3k2rvgmlatpmyexs5lnwukufdmsxipl5npqygpwhyvonaal@3j6nuwgo6pqw>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
 <eb197cd7-c1cb-4edb-951c-dba08864ec74@quicinc.com>
 <46af10c8-8400-4131-ac87-b3f17350bb65@oss.qualcomm.com>
 <bdb6ea4a-9536-4b4e-9849-2ebf2d26fd60@quicinc.com>
 <e4a4088a-89a8-4234-8469-a5f4ee0b9d6e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4a4088a-89a8-4234-8469-a5f4ee0b9d6e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfXwq06NmwyBwWe
 UFRUj66CXakvwdrsKlh8/6lnFGsydriapOgt1tC7gcrtngMntE2TiGwBtkNeSSuAmL0Oo4oXhG6
 w1ulJ2TWVkzYvL7guayof8cmrP0rXWg=
X-Proofpoint-GUID: seftF4kEnRYfrhp1_He5Cwb_WKCFdfvv
X-Proofpoint-ORIG-GUID: seftF4kEnRYfrhp1_He5Cwb_WKCFdfvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfX58FEbV9CAyhI
 m8gzQi7/7zra1+s3y+AUscBjjUJKL7C2w39DILTvWKaMM6wS6kykfx49YBIBHE/JtQmQRjz1PKl
 +P+PIYTTqktNNDjXooQ3/15+8GPp+bjwbr3sARCBB6z1sThDoUwOBwvbaL9pD2wTuTLH30tbdTu
 OBMN741AwZt3D4u+Vk+fGVx3c6BaCK6cCVQheCLwjEp0cxZa8wubyQSKbyq63t+mUvLv9h22n7V
 xcNWs99Vf1NJEQhCwekZogyCZY3xHmrPscUogyN8nw2WuaPtocA4QOyO5b495/f016wObQSKVlh
 6CZ7eIWqZbfqRDrXHX6UA5fjxbFyqdpcUu3jIxKFzDKoO1iXCL9AQ+55N8DG/WlSwE7Zeco7YuW
 UkBXI0Au8AvGy1GvNmNEiL/5vN7tHKfX3G9u33d/AvcguxwgK0zTybIwdN4sptEhKi/QBnySjWb
 15n6fCVAnfJOBVpauRg==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f5116 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=2Sg93fSZGufiyqZajnoA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090072

On Wed, Jul 08, 2026 at 08:19:06PM -0700, Deepti Jaggi wrote:
> 
> 
> On 7/6/2026 8:38 PM, Pavan Kondeti wrote:
> > On Mon, Jul 06, 2026 at 07:15:15PM -0700, Deepti Jaggi wrote:
> >>
> >>
> >> On 7/6/2026 6:57 AM, Pavan Kondeti wrote:
> >>> On Tue, May 26, 2026 at 01:12:58PM +0800, Shawn Guo wrote:
> >>>> diff --git a/arch/arm64/boot/dts/qcom/scmi-common.dtsi b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> >>>> new file mode 100644
> >>>> index 000000000000..0c7ffe9e415c
> >>>> --- /dev/null
> >>>> +++ b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> >>>> @@ -0,0 +1,1918 @@
> >>>> +// SPDX-License-Identifier: BSD-3-Clause
> >>>> +/*
> >>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>>> + */
> >>>> +
> >>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>> +
> >>>> +&firmware {
> >>>> +	scmi0: scmi-0 {
> >>>> +		compatible = "qcom,scmi-smc";
> >>>> +		arm,smc-id = <0xc6008012>;
> >>>> +		shmem = <&shmem0>;
> >>>> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
> >>>> +		interrupt-names = "a2p";
> >>>
> >>> I believe this interrupt source is GearVM firmware via Gunyah's
> >>> doorbell, correct? How do we know that scmi0 instance's interrupt 
> >>> is GIC_SPI#963? Are these assumed to be constant/fixed through out
> >>> the life time of this SoC?
> >>
> >> Yes, this interrupt is a Gunyah Rx doorbell VIRQ for SCMI a2p completion
> >> from GearVM to Linux. It is allocated by Gunyah RM from the platform's virtual
> >> IRQ range and patched into the DTB by Linux bootloader at boot stage.
> >>  
> >>>
> > 
> > Thanks Deepti. IIUC, GIC_SPI#963 may be overridden by bootloader and
> > potentially this IRQ can change across runs or when firmware is changed
> > etc. The interrupt property is a place holder. can you confirm please?
> >
> 
> IRQ will not change across runs , it may change with firmware updates.

If it is provided by the firmware, why is it a part of the DT?

-- 
With best wishes
Dmitry
