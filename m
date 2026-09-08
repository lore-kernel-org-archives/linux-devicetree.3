Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507B58038F
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 16:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885203; cv=none; b=HsQqnpA5zjofbM501jJS/ESqe3qmZPJQkBldexHs9/EX8PMh0VDsvHNVdmn/CSjIIibOOFZoT/nPPVNgZUAHT/yJAKjIQ9gnS7WwMet4oY9PstRFbEVbPDpxN/pVcIqTNC/UzkW5kKuFWjd/OYO6409aSJ4qH/xBQVTIpZYuYJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885203; c=relaxed/simple;
	bh=jd9ZQ3vft6U3NWY6w8MBNL6oLN6MjNOIO3EqXQ36VmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRx8d2Gz1t+ieSSO4x8j507qDaKjOC+e/obwqULBBOF99KU0iAWWcvy56f1qPoPYvB5shlS9axMeIOzGn9da5Fqz9Z1/vrfU6aOKzp9mpPJVrafDo9KWb1lA8q/drGBXHsK2qCIu9JLeFiTi4FP5FWvI+2X8il05CsCy3uSeDyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4oKYS8J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGU3LK/A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4oKYS8J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGU3LK/A"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688GLmEw3502003
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 16:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qqk8M3irSEHsxsm6zyDtTCOD
	y4klo+uYgHanr3V9UbY=; b=l4oKYS8Jx2zzLlHFXuWZyyHfh7nNxZj0MhHNr3oE
	tm5siVvkwJekE/nkUc8yBCzpMvoNTt9e7mVMZWnTE7dYuefPvBFLrVYF2zFtJegs
	/MtMuI4tW05PHC5svbA7kKCO4BnfyXxqd5p6eMA57dppaQrfN01nP6P6fIR/6amU
	6WBGJ4QbWESW4JcZ/BeAMigexN1FmMIv3iL2j0WqfSBiv1uKbgblkbdDwgL6iOBn
	LWmxsn8bREeW4EEEXE3auYNE97TqxeZdaICPXChl9afRVgfGysFE1JSSFcoVbUOd
	cBq/N8lwIW5DAnvZGLMTJwGoM4nsV2+eRQPIyNccrXIs3A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpg23p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 16:33:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c4292d5aso866758a12.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 09:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788885199; x=1789489999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qqk8M3irSEHsxsm6zyDtTCODy4klo+uYgHanr3V9UbY=;
        b=aGU3LK/AqIaW2jng6sSCnLaPT0rnq+70T0yWZuh1mSYmLBwDa3Os+xqCSmFnqnP6ph
         RD6dpctPeZQaVxG7+vQiYA8GKPiO9uwfukwR/BuI3xf1O3mDGWmIsU3vXk3tD2HtwdCY
         B6Z4cvwnC81m3Pv0AoXHBWQcxWexIN2OOsuGubN5By02/ghZnHXGG/whKg7TMnUWn8O2
         P+QEOZEs5DitmoInoF+n+n8EWgJ/h8S5VxoiwGsqI/Mva/HPrHrjPUk0gi4ClQ825sCJ
         OLQ3faBPzMYRsIw/YHmTMOgr4NR1y4qxFD7wLWRSJJUBHKsMTLvZtjfBDDu3TTUw/w2e
         XGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885199; x=1789489999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qqk8M3irSEHsxsm6zyDtTCODy4klo+uYgHanr3V9UbY=;
        b=QOBqZe6rOQP8c2yhgmiKMyHZceqP32DXF3HArwkWijs7qJJWX+TqHXP5Fy7+FkQrdX
         IJRbFR4/McyReyc0bN1pcDqYZxKk2NAAdBd4I3rQiHUHA8MtGfkuXROZqK3lvtI7LVlD
         C7SHyP8D8azk8eOqaX7/4+ZPcYW0VNuqwSNDMB2x6QO6/yMAKwvJ8D9MIftHjrNZ171q
         JuzV8GoDuCddgVUu4q065WD75dgUtX5m5rgjegNn7Oo4Ujt41y6hEsffNWUJwp2aymTn
         1zCr+bCJWr2YYxcco+zuG+cZA1zoaSTWflnmj+PibxiZUP9altDdQkqk6X+9PI7mxCI6
         lL2w==
X-Forwarded-Encrypted: i=1; AKwUvBy277hC8ImdHhBXUQwb2snKIuLPaAxPSmse6VzDVECrS3t9JEz4+GZfqSsi3Eb5KG/TVxmKS6wcwXdG@vger.kernel.org
X-Gm-Message-State: AFuF++kIhqjJfsU4YMXDshnuSD20cHEXrITYQ0zvybjPOGy3lhLZLdMQ
	V56m/x86uc65qCehIW4qoMB9ACCyBoWPhdABuUzXBNlGeGTX1t5GHDMKqDrbX0Tcphc8MIzNdB6
	LXodAYC19s6rZU82vls+a0TZYS6FrZpoA6ZjN8U5o828fC6MM/nDppvA1Jn6ie7f3
X-Gm-Gg: AYBFou0b8yfV7En51/v50Rf3RlLPxV240fu7Kw/qZja9Paie7rnNHuqiIxgrPoZfQxe
	F9b3SNYBxLlCE258nQeNKEG0LXRQ4RzP8ZIwql4dwEZptmzp1+Nhnj5RQYRFmnv2On8nJTYMRQQ
	JBiIDTywB43HB46BWm4XkO0N4/VQmloaSTCGc67NuOl2DXW9gUbIw2dP5bFHyEd7Im799/QeaYc
	Fkm7lC7e3q8RopJPOuycnanuxI6b56PtDBnlg8CeHqYfK+uxAWBGQDd9tpAASgiPpscJmIybrIX
	T2Xoymk6aBkJUhpDtWEJ85nRZVZ7GKebBCKRUE1U8I0QeeSpVz3IwK67v0+vBsj4lBe7MHDpAcB
	gmcXkhllNC7HbHuKMWwGYyD1Oak5RFFKxlmuqhS+rVlOHT968hMF8J+0+BkwrQcbtbM93MlXRt5
	BSdjmbvyTulqkaFd5k60TN
X-Received: by 2002:a17:90b:4c03:b0:398:bac7:72d0 with SMTP id 98e67ed59e1d1-39b3d86acf2mr21418233a91.5.1788885198900;
        Tue, 08 Sep 2026 09:33:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4c03:b0:398:bac7:72d0 with SMTP id 98e67ed59e1d1-39b3d86acf2mr21418181a91.5.1788885198329;
        Tue, 08 Sep 2026 09:33:18 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm57343694c88.4.2026.09.08.09.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:33:17 -0700 (PDT)
Date: Tue, 8 Sep 2026 22:03:11 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
Message-ID: <aqA4xy0XoXjLrgNN@hu-vishsain-blr.qualcomm.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
 <20260905-lvds-support-v3-1-b40a1b03f63c@oss.qualcomm.com>
 <5954fbc2-08c2-4509-8703-ab20d57be309@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5954fbc2-08c2-4509-8703-ab20d57be309@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3OCBTYWx0ZWRfXzuQOyDbixnSi
 UAy12v8tRH6I33cZIaYVTpieqhFcLJ1mdjtXVY2dVJhlMSvonQX3mFcGjJZ1WLjoffpVw2mzBFu
 Oru5846eqLaStN/LbbKvVQoZEq1ljte2qAKSDr5XBaCsnGpag5coZBuLiXcnvY1E0m9Zqddk2Lu
 QADS9XTiRuEt3WnASg0YRE6fgFBeLYEPwboWYp90YLQF+3G53efy/uJBw1DkwyhoYtj3USaBPjc
 8Pk6/XGkaj+JacxUGOclx22zU3BIsl3P+jmQpNO1hEO3dcoQDXtrBES6hZXjM9LPrhpODzWAjtj
 H2wXAj1FZPkl3af4JTptxO3xgCJZBSElyIT7c+OkUkbFF2JiRadh9YmqF1QF50++jcqWbnT85oW
 +oClr0OS28Ak9Pw4VuPyqfmdcP8g/gRKxSvVh95hFXYSgRAPUICXehMAOkU+U0JB06g/jV2Hg5e
 VV3w81GPkIRNFqCgwLg==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa038cf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=1ApGdNfS97-kAfUPohsA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: CejWF8Gqcf_4m-BqmEHsh_gtwxNl2Med
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3OCBTYWx0ZWRfX05q9LuttIS2c
 HWAcZ1P4qnmVf6dG31qNGOohsbHn4AfQh22sUkjTjJkidN3R7H56E+qhaPLxmZ2fNu9iUsVZviQ
 oT2zE6l9jmwQdkMuzdk+XPdOXFg7TI8=
X-Proofpoint-GUID: CejWF8Gqcf_4m-BqmEHsh_gtwxNl2Med
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080178

On Mon, Sep 07, 2026 at 01:40:52PM +0200, Konrad Dybcio wrote:
> On 9/5/26 3:30 AM, Vishnu Saini wrote:
> > The Lemans EVK IFP mezzanine supports LVDS display output using the
> > Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> > DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> > VESA-24 mapping.
> > 
> > Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> > up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
> > a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
> > panel-simple-lvds-dual-ports binding, which supplies the panel's size
> > and timing internally), and an LCD display bias regulator supplied
> > through the GPIO expander. DSI power is provided by vreg_s4a.
> 
> [...]
> 
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -58,6 +58,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> >  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
> >  lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
> >  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
> > +
> > +lemans-evk-lvds-boe,dv215fhm-r01-dtbs := lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo lemans-evk-lvds-boe,dv215fhm-r01.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-lvds-boe,dv215fhm-r01.dtb
> 
> I have very mixed feelings regarding putting a comma in the
> filename..

I named it similar to "talos-evk-lvds-auo,g133han01.dtb", but let know if i need to remove comma.
 
> 
> > +
> >  dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
> > new file mode 100644
> > index 000000000000..bd3e13c46a1e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
> > @@ -0,0 +1,113 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +&{/} {
> > +	model = "Qualcomm Technologies, Inc. Lemans EVK LVDS";
> > +
> > +	panel_lvds: panel-lvds {
> 
> nit: this label is unused
I will remove the unused labels, in next revision.

> Konrad
> 
