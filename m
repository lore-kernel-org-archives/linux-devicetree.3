Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729F53F0AB1
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895877; cv=none; b=O6rM4LreM61rEb/sY1D42p6bs7QnRGdj6qG7PT9qEMQ3f/kaR3RAVsAz15UF6ndGiO4uPt5e/ch7wrdEu8eQyKv4DIX6tHb8WAtLZRz+0G2IuuEQHCpwDzuTN0MhcmNMujgA2BiV9e4XLru2mh4W9bZOJA+NPXZVzw7WUW8UyH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895877; c=relaxed/simple;
	bh=aPE/zZRjQ0I/0gtY25dgbO3O2yxZYZWaVf1Bob8OoRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0I+wh48/MMnc89kPH3SRE+ZiCUyXIxBkC6uP05vg/h13Dj5iUG8VEnQU2lBjOeS6p7ANay67ifeGXr3MeK3YP09dNKi3b20CvqqAAyuEvWA0RB8RKOY164u9HExvA/5ebyRoT36O9xcnkiPbJi8xiS56ktQsfI7wAWHGZIa/dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOzzgwHS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MWpnX7lF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOzzgwHS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MWpnX7lF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GGtw497257
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hCs8R90jU1FepMNJh+g8I1+w
	WaNV+J2sHz487ThAwxg=; b=OOzzgwHSnGJn5ijuchfrCOZs/eEJ+HWNXvmBO8K6
	CU/835l6Yw580/YJAITkQhhiiv2MAFhnsUNPlVbLiYRbIohXQsW8zCJevIqYQo/v
	YZg/RFfaDlTuStkc6wTg2pzj+pZu5fl5OVngXqpGcxjWKv1cCl/fJ36n9WaPdbdh
	mzNV40RCGlcRVVdkRfdcNeAhyRrD1io5HzzyD6u5qiZz/Kv26Jqkt9NooQC0tUK3
	SkxJkwF/VIp7RXHnxr16gRgaSsBSyFLvDPZ8Mu5K6ogcT7K8f75BdLf6F5ScRyoI
	wSlXyE82bRX4nuAZiFFdE7FsaqqIKF3nkXqbm772MACREw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktb7s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:51:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so46252485a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895874; x=1783500674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hCs8R90jU1FepMNJh+g8I1+wWaNV+J2sHz487ThAwxg=;
        b=MWpnX7lFN1NaoojH/gjN/i10YGOk0lb+6PJvrRh6ttNNl5YwR92ArrOC+srATsMBFT
         lSHEJgOTlgYdJtd8GmNd/CCtIHGGOlJ6S29Jvrc8dcd1dpSoBBWh/Zag7I+b9HtizryA
         ASgM3j+Ns8Kg7qyJlnv3R2jH9udfEAZjautE9ym8fn2ZQ+Hi1tKU5OAkdiVG0Jn76H3b
         2PdvBhRulcqcM9NWL8FLuVe9Y6W4xxSGsdD9x5pbHl9uph1QTPZqVpOMGENSRBUOmAwp
         24dM/DOiNH04VDsA1b4v2yABXVocCDHFaz4Ekhixu1IdLOlPXT70bhvlfGCXG6Oj1Usv
         U4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895874; x=1783500674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCs8R90jU1FepMNJh+g8I1+wWaNV+J2sHz487ThAwxg=;
        b=AAdPbYkdhdAuO/2HP5tQLRZhvGqQ9otpXkVU1XW2lfvOsZwQoMW/YC4oKv2JehjD5u
         gXnC5R2QijvRzL3QlbI2Jo73pkBjsToOxHQb3PXiDToVSluwMXE/G/qhMyZBejRbBKGA
         D/foIcJ5mf4Efys69hEWC+TVIfGlDjmQixNWzjgFKhTedjzGmX8iBh7CTOqWFR2X22Fe
         XNP2hklJ1VlaUABk6id0QrY8/hNsMWrO4nMQjS8jvg0pD1aIatM1zK5Ie4K0C5iAf2BQ
         UBAetu4pk7jOjrBuXW25k81gKYSpfVyq7Sn9EdbBHBd3oNO9eoW3uB00T0UOtP4j5ec0
         J/mA==
X-Forwarded-Encrypted: i=1; AFNElJ+TZeLjJ9TI7zsNz6Ll0HrKagm4tzkwZGt2/cBCSK6nwaWJFzq0bNBEDiUUWFtF0h6KV9kv1QTGpAo8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd97ZnuUZW5r0b8YYursMuKcHHy6pTMToOrTC4DIv+YvK+vqVr
	fgVnZ+m2C+ZkkzU142OZBPFFYKSPotoJRMzsJ92xwMBhntYjM/RTIzs4OJvtHoRMwbD7V3BkqJz
	ftjW4yewdweRBYFP8bOxPF4R8soxCKP4AniWNcv782E4Hm17wxXxFjEDSe0Q1mh3v
X-Gm-Gg: AfdE7ckQTLber/IvTgtmrsYSVmdBzAVhj8lzX7E/0SEzRJp4/zTYgLpz0yKxY4Qvn8G
	PY3uspb9bWI4Tc/ZcIYF4D5wSqZgM0R4VV7+/v10Zch03i9qRRUj0WisvF7fgfFRXnkHohh9Bf8
	StDXzBsKicllqdWT27lOKWWI1KlEMkgMg67BxH0bE+C3/JANCta1bE4I5PUePxST71uQQpdgMCQ
	w4DSdWLbAj+5HltDg3F4qW/NUd2aekjExXDWS+KpYGDJ4Za8cuhj+Q2nubVCOOLtvBypjRB55Rm
	Dm2MEgkTthavqMVCEUwCp50XgGyvIcvRo/vQyDyV5npO8SfPZkE/x5f5XjlECT9MIKH7eWXN+Xu
	/LBNvlkCdzD9LLncSxTrDvGBG9m7VwOY+4Hb55IpKQzMbF0StE5le3kzRVYL2ehafwxCSb1JbXA
	==
X-Received: by 2002:a05:620a:170c:b0:92e:61f1:6b72 with SMTP id af79cd13be357-92e781d6ab1mr85644285a.13.1782895873665;
        Wed, 01 Jul 2026 01:51:13 -0700 (PDT)
X-Received: by 2002:a05:620a:170c:b0:92e:61f1:6b72 with SMTP id af79cd13be357-92e781d6ab1mr85642585a.13.1782895873213;
        Wed, 01 Jul 2026 01:51:13 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e621666dfsm518168585a.11.2026.07.01.01.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:51:12 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:51:05 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
Message-ID: <akTU-YQkms64qivB@YUANJIEY2.ap.qualcomm.com>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
 <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>
 <20260701-uptight-piquant-raccoon-abceb4@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-uptight-piquant-raccoon-abceb4@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5MCBTYWx0ZWRfX3sqDF7iaeOru
 /uKAFNklXn1Gg6tEcqf3UQrzGb8L+xUaw1eq04pQuQruO6ztH2ggsllg8FUutnDS5mWQItImuEQ
 V/agv87PmBUi/5MPSoVlFv9KX/CQvEg=
X-Proofpoint-GUID: jFzXWWmxxxNRc4YMIdEOwJqkmDohWJTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5MCBTYWx0ZWRfXxvaG3xoS4lQM
 9aSY92E28r1IGlomQlyTRrttvP0uLZw4G5u+LvXHwyX0SUOabC8Zog+fElvLpNWY2PoSDKgEIh/
 9GkeaN8gJ6cJCeLJGzRdZ1UiY9kJChLcFC30NkbRO4ON4YwmZJ2x42UuJCLgMN8oLQCc73cY/Hq
 +2hF8P27CdWR7r27kIO4AjKjxx2cIHXZMQyGVNvaYe0nfvNP3w1ZhQveVKaTuyrPBA+afuKjTDW
 FwaHxlrnaSzGe52FvnG/d+Nqws63U/vKAuqPyJBG29kzaXxLlSwURzIVCUqOhMGJMB7cyRQu74L
 tEJFlapoxbkUeclJQw+w8ZrkynDwchqBdpWfmQ+wR6uf/5S40qtncmLMwxLMhtLsugnIceddP52
 GYLt67rB979P3StA1cC341wFmOaBq9IXYc20f6jFqbKNqh5IuIXoskGoBjGVAQRklyvjsniKtrh
 xbbxLtrFIhFjlojMyoQ==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44d502 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=km2eNhaI5psHTDfmU8sA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: jFzXWWmxxxNRc4YMIdEOwJqkmDohWJTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010090

On Wed, Jul 01, 2026 at 09:29:34AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jun 30, 2026 at 03:10:12PM +0800, Yuanjie Yang wrote:
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >  .../boot/dts/qcom/hamoa-iot-come-sip.dtsi     |   9 ++
> >  .../boot/dts/qcom/hamoa-iot-come-som.dtsi     |  38 ++++++
> >  arch/arm64/boot/dts/qcom/hamoa-iot-come.dts   | 108 ++++++++++++++++++
> >  4 files changed, 156 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
> >  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
> >  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 6f33c4e2f09c..549287e3eeba 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-come.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> >  
> >  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
> > new file mode 100644
> > index 000000000000..935af96c2b85
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
> 
> What is the point of this file?

This SiP hardware is effectively the same as the SoM on the Hamoa EVK.
It's just called differently on a different board. I want to use this
file to include hamoa-iot-som.dtsi header to show this idea.

Thanks,
Yuanjie

> > @@ -0,0 +1,9 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include "hamoa-iot-som.dtsi"
> > +
> > +/ {
> > +};
> 
> It is completely empty.
> 
> Best regards,
> Krzysztof
> 
