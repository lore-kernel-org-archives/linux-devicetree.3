Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A943AFB1B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360039; cv=none; b=rPuaJsu7OtC1t9+6N+MKh0ukVhwF6ShxJaX2kktVk7mbl5xIfOhmGdb2Ow0zis8uOdUV+n1ahNn4jJeRD8AvLOiP1wgitAPWzpYocDBY6xY9YvNQQ0gSY0PC/aFrEg7FENZ2HnuXlD+Wzzl+Y/zmQYbdOh5WM1P3uyt78EfavOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360039; c=relaxed/simple;
	bh=5bOmYD47KumyTOb+Y1qYhZXDQ6MEozeWdEp60mgsnpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeO/fQisrBejY5ATFHF6PF5xnZXGG+mHo1GtzxK7sgW4JmHMGszdSF5Cv3NkNvp4fEJx0xkoSPpcJNE36XDuTX1W1cTUXNDYWPc2GJqoUA6o+LJd/Owbon4PxM+niBBOFsWgCmxAz46CFCkGiNrOWdT4h44P897Z7m1VqmLrxRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhfPQC3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyMjbkY0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhfPQC3/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NyMjbkY0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFDeU762357
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 17:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=apmFEM59O0B61gJ5WxH6Ae7z
	ChxrAAcQn15+cvRZUhw=; b=PhfPQC3/q9NiNTgCQvS1BiHAdQ8HBNaOXp5VPl1Z
	J82gW6T2BnNDO2cMfYvSJci955vGMEiY4Tt3NbL4hgjlIc5kPcQioYOl/tz0Hsh+
	pvqvsxTv0pOCaEDc+vwhEGcHvt0U8lJ1LG7dMM0V2PvUy8woIG+EpNrMDCZZydcd
	WuuHNvvUNI1KvaWm7zQj6ztz2DIbXPjaF1PZHMOa3dintSRMwMoUJFJHUEsrFNJx
	y3ARG47UrJ2rghFb+DOydUsWspQzZlwSbfFnhx34+qIY0deFjjiE6Wu9bx7i0lqM
	jCz17NaUvpezMIKQA20EoHD0cweURIhUDNoyXqgmReBvGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxtu5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 17:47:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e66f9e2baso333974785a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783360036; x=1783964836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=apmFEM59O0B61gJ5WxH6Ae7zChxrAAcQn15+cvRZUhw=;
        b=NyMjbkY0FapE+sQkOAkx6As1D7z4KerhqY7GM9Qy63Ytpoip9EIKz9yF+rHCPIeP9T
         HUCXqw21tf7qmz5okYfV+11z69umw70WAXDpBTR7/j9QV8OBW6WPfAhWLxNpmoQcIHu6
         pnrhHgg+l4SSt3AhaXchuJGVC4zh6EUBBNB+mlGsc+TeWFzfl6IN7MNcuZ2IRoP8jwAZ
         oy6ujKJxLl2XnV2ZkGMDy4jsYkZLSuLEc+CjSBaTek1RHrfa2hqrzYuBcSq4qz66asre
         C5AsBCPmuU6T4sCUmlppq3ErFxbNhkMm0r8XGyoC2t7E6baMzYk5qSzrQTW8AdIf2AFw
         9Few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360036; x=1783964836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apmFEM59O0B61gJ5WxH6Ae7zChxrAAcQn15+cvRZUhw=;
        b=E4eUKMlPZKIG/t+gmPH6XYtMXlxoiE0PkWosFSNTJJD/SlTsrY5/dT8oaIA6pLTma/
         cNvDNcFNR9okb7rFVO3/CGPsIshrX5kEag0QMJ4bo9GV1P43iKJVdHxB+8jf+PdTQE3y
         kxlGK3yZI6JAch96AxEkIBr78gPIrH1y4CdWxzyxVVKcLrd5qqBsYnridBAO4rH3wIDg
         BhEVrjdMMyYqV/9WRqDPAFcOMSs9suDhJLklOHJCHDy12gaBfAu9xFRmPS2UN1Taycho
         oF0KutVGwsa8XgTTJblbnCEjOrkrXVqWAmJwvjA5jYRidtmE9mN3m15SAaafngYigTEe
         9gvA==
X-Forwarded-Encrypted: i=1; AHgh+RrzXMT93opiGSI+qZvAKKha7Az7hJP9DuiAXoq94+yGO2SJLMqHTthFGpu3/UggTVAkPEx4H8cBGFDn@vger.kernel.org
X-Gm-Message-State: AOJu0YxnpXEKapepXmECjUKbuuksbWq/1nTEom6XtP2+/gKDvHK7uPT9
	bWhku4TUjk9hZsSJwbrqaoOYQFs/ycs54/C1MhI3WGYubSGMJNk0H++xizYzJ4ezyPa5/f6kzuX
	BIV6Dns8dxKWC+qEj8BY7RvPpnawKSZIx6He/d9sLLzF+H5CdhiNVzYZIiZHqx4nw
X-Gm-Gg: AfdE7cknOcFw/jjS0TG9aBN6Dk0/wft3QP5FHZymfGzQcEVf3JoxqBPEXNCA119EsXx
	Sr15C8g6JY0ddBYvE1WGPVB/OXujPjTZqBu0wrYF1oTIMYHgqxmL1umj+jaFYIXn82nbRB2b/7p
	o4eWncoS/p6WYoWMHgxThA+PS//VDoBvwqK16Yfpxy0pb0npgOWdS7iXQiwgK+Or1dL7kOqvVfZ
	DQ4YTZCogcTV/LoqfDi950F/QMwDoQ6eqs9XqlyPWzI15VJnMbYpUqqfnmVfuakeVTsU3+YBdZU
	jdTUKio675jrbkD+eSWzY+wDIie9EfU3jG8TWB/JMdFKyM1BiO5Oqwh9+0MwMQIxOKtRE8xl8Jg
	YPAM6rzijskLcR3mIn72RnG4ypZd/ENqUUvYD2MJMYnywhMvoyG2mxWxhruceGKjuxUMJ6Qwn19
	dDUc5RUuWR3JuGjpCeCIYrKYnF
X-Received: by 2002:a05:620a:4412:b0:915:b852:4361 with SMTP id af79cd13be357-92ebb4d57d6mr203279585a.20.1783360035667;
        Mon, 06 Jul 2026 10:47:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4412:b0:915:b852:4361 with SMTP id af79cd13be357-92ebb4d57d6mr203274985a.20.1783360035123;
        Mon, 06 Jul 2026 10:47:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ae5c8ecsm19731901fa.35.2026.07.06.10.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:47:13 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:47:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD
 device type constants
Message-ID: <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5Zy6T8fYwpK56b5p0BtP8CN6ya2aDWUs
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bea24 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2pRoOLr91VfmbNnP4VsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3OSBTYWx0ZWRfXzvhr6Xm3FNDO
 w+g7us5PZsJmyrQhTwx7gp9GOtHvjXvhwjmUuH29D+yjJ+AsMhEpi4DSRzsguN0L8njLAzoyOP1
 Fe/aOp0q9YSIXETsvpj/5MDy+2VxK+Q=
X-Proofpoint-GUID: 5Zy6T8fYwpK56b5p0BtP8CN6ya2aDWUs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3OSBTYWx0ZWRfXyGg0Wn3Q7kQL
 D6I0cgOlyjy3Ry9S3fethd05CKmq4PQPbuzBoaI8fd7RmGkHLEP2UP54IsRI3GnZC6Ylx1ttqed
 Q3kq3+S1gbxLazTkky4F9DMRVcX9aViXQVX9QMA6ExKhnN9l7flJhHV/nsj7AcIHL8HXDXIbZTs
 rC+0d/3uaqDehqejSniKjNKWkHG+nyf+kTJlVc7Nz1Vv1XsYpAZiIgIJHgM4OiOgDj9CiIC6xIF
 9JK9P436enzaTWqhh0rh/Any96F8GtmulvTMEdD9Gac16kwqDS0j6tNH4YMeDGuFvY4zUqPc7Uh
 cxRryCjAfKn716nfhRpsU2JcnEpnXeUp+ZhUxBPJ9vsQ5W5NPsIYJdoDJ7Go6fK++D9KLgKzom7
 iAN9DGFbFKOASxtU/ZEPO/flIKBEXGThVMhlAWFYvxU3wmTJYn1Szl9ppJXDcvnxOad75lZHEQZ
 ilLURIJgvc4N8jB+TPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060179

On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
> On 7/3/26 17:42, Dmitry Baryshkov wrote:
> > On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
> > > 
> > > 
> > > On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
> > > > On 7/3/26 7:03 AM, Gaurav Kohli wrote:
> > > > > Add Device Tree binding constants for Qualcomm Thermal Mitigation
> > > > > Device (TMD) types used by remoteproc-backed thermal cooling devices.
> > > > > 
> > > > > Qualcomm remote processors expose thermal mitigation endpoints
> > > > > through QMI. These endpoints can be registered with the thermal
> > > > > framework via the `#cooling-cells` property on the remoteproc node.
> > > > > 
> > > > > The QMI TMD protocol identifies devices using string names (for example,
> > > > > "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
> > > > > `#cooling-cells = <3>` requires numeric device id in the form:
> > > > > 
> > > > >     <&phandle device_id min_state max_state>
> > > > > 
> > > > > Define common TMD device index constants shared across currently
> > > > > supported platforms. If a future target requires a different mapping,
> > > > > additional target-specific constants can be introduced while preserving
> > > > > existing DT ABI.
> > > > > 
> > > > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > > > ---
> > > > >    MAINTAINERS                                 |  1 +
> > > > >    include/dt-bindings/firmware/qcom,qmi-tmd.h | 20 ++++++++++++++++++++
> > > > >    2 files changed, 21 insertions(+)
> > > > > 
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 57656ec0e9d5..ffd85fd1dd80 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -3410,6 +3410,7 @@ F:	drivers/firmware/qcom/
> > > > >    F:	drivers/soc/qcom/
> > > > >    F:	drivers/watchdog/gunyah_wdt.c
> > > > >    F:	include/dt-bindings/arm/qcom,ids.h
> > > > > +F:	include/dt-bindings/firmware/qcom,qmi-tmd.h
> > > > >    F:	include/dt-bindings/firmware/qcom,scm.h
> > > > >    F:	include/dt-bindings/soc/qcom*
> > > > >    F:	include/linux/firmware/qcom
> > > > > diff --git a/include/dt-bindings/firmware/qcom,qmi-tmd.h b/include/dt-bindings/firmware/qcom,qmi-tmd.h
> > > > > new file mode 100644
> > > > > index 000000000000..73efecef0f3c
> > > > > --- /dev/null
> > > > > +++ b/include/dt-bindings/firmware/qcom,qmi-tmd.h
> > > > > @@ -0,0 +1,20 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > > > > +/*
> > > > > + * Qualcomm QMI TMD (Thermal Mitigation Device) cooling device indices
> > > > > + *
> > > > > + * These indices are used in device tree cooling-maps to reference
> > > > > + * specific TMD devices provided by remote processors via QMI.
> > > > > + *
> > > > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > > > + */
> > > > > +#ifndef _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
> > > > > +#define _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
> > > > > +
> > > > > +/* CDSP thermal mitigation device id */
> > > > > +#define QCOM_CDSP_TMD_CDSP_SW	0
> > > > > +
> > > > > +/* Modem thermal mitigation device id */
> > > > > +#define QCOM_MODEM_TMD_PA	0
> > > > > +#define QCOM_MODEM_TMD_MODEM	1
> > > > 
> > > > What about the dozens other ones that Dmitry's laptop reports?Ri
> > > > 
> > > 
> > > Thanks for the review, Konrad.
> > > 
> > > We are only defining constants for the TMD devices that are actually used
> > > for thermal mitigation on the platforms supported by this series.
> > 
> > Why are you using only those TMD devices?
> > 
> > > More constants can be added as needed.
> > 
> > Kodiak is one of the supported platforms.
> 
> What would be the benefit of having more than thirteen cooling devices
> declared in the thermal framework and having only a couple of them mapped in
> a thermal zone ?
> 
> I agree there are more TMDs but if they are unused for the moment, why do we
> need to add them ? Can we do that incrementally ?

That's what I am trying to understand: why the implementation uses only
the selected two devices, if the modem on Kodiak supports others. How
can we find out, which TMDs to use on other devices.

-- 
With best wishes
Dmitry
