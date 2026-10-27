Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793127315;
	b=dnv2q7PJP2M7GwvwyQ+sgp50cxzDVj2QVgjC+amnKtZoL//V2jlPs3sE2lE2hs/82owm
	 A//ZDBV6cD9/C4CDihTJW4QvfaHAwwnB00x0in/jq8lfxxMBNtw/VxhQ2LWzghvl7Aqos
	 f1WhllOdzNuGuM4xliJIPhSH5/XjYuNdE5IOJddNXhppsHsDjsHEQIx2bz+jd+9m/lepq
	 2UWsCEQAOV/aiCgHJnM3mOBKKAIXQxVzawkwEym4s8uOVhTJm997fup+4vdQJFmoyTJmj
	 kJRnIaG0eWQhwdOloZgzg59bfP9s4ikeJaE8LrBdKr0kT59aCB74RFYAUm4IpqBYIJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793127315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fqBmnY8T0CqGP0cX8wFwCoHFxWCAuxU3CcoqNGTy3Js=;
	b=qQ3s0Oiv3nmqL554hj9JL5ia20V7AmduTF+ceIcEf14lLuhnzZADKwan+oRFNZ0acmHi
	 6Pd3BDDjrpTYqmRjvI03l0OvI9jaazPqiXkjwiAVapr2Aslz75dmJiNevTqELZpWvCk2c
	 l4hIeMfLu//H5fvgT9hkAapmzsO77DUqkQEEJpN/hFFjpXINEFPWKrldZgTeEu746FrHZ
	 KPiRAolaGpKdKGxNL8KyIi7xpjk/jXoKUNWCMsQ5DtHSfCJ21Ca+J9l8mJsfPvysr4O7D
	 rJZ6q8yscfxaBiLB67DQjwMPUyMhTn582W7geNQXzouKvGPW4fNxquwuGUL/7HrCJWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vb57pl2t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h+8JRMKC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E27606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2E27606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vb57pl2t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h+8JRMKC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHL8K4051097
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fqBmnY8T0CqGP0cX8wFwCoHF
	xWCAuxU3CcoqNGTy3Js=; b=Vb57pl2tMbv6ai+TSzye1rjbv9idcPtDHHdFNQpQ
	pZE/q4OMfAicpWV+ah2+wQabqYkuCVjJYeW+B/icdqgkBm/3zI7d5ozIXIde4oeD
	AcTbekr2Ky4CeOb6XU3tSKfVRyqYfU2Cm4pbsUa1pEE333URuBqxaJkLE1ZQYB+5
	gvcH3AAdrapWLPLFPBlj8iIFgFIxguwSeFN2knlUxfZ268DwZtclZ+db5Be4YS2h
	GxDHh5O+LruCzwzrb5KU3Mjty5BQOsxAWaJ85BABikYlzMI8dv521HCPfJ9xSWyL
	6RcC1sW5cVcbVhCUHr6mcu61e2Et4JCwS8+Davs7sVzySQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pr52d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:55:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35179e7f081so12710eec.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793127313; x=1793732113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqBmnY8T0CqGP0cX8wFwCoHFxWCAuxU3CcoqNGTy3Js=;
        b=h+8JRMKC5Af15pxpNJsVkjUcGGxTmdDFFjTV/ooQrZ5eGP0mTrrKx0Zn1DNbrgEB/4
         nIRGs0U0ZFWQ83H1kA78qSuMs/Rl+ZgzAgIGEYC5fPbqDck+xW1YIa0OWABYp//fxKvN
         k6Pt0JKWU9Xa2zRJxffyMKLfSBC/YuxvsXNZJJfBiAhYiBVP1Iiz2sr6/Yd9w1JaRL7U
         i9qXUlguYdB3bpuKC4EF4w/zIPcB+hZFH4hfJHML8J4oS5MmTx64LRfnGLz1xcAmMKo5
         Ej7uManqS2+q6h146LCcT0ZHHG587nwfpmKWXpEDIETwU5Hu/Rrq0909wSubLrrH6Nfu
         aiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793127313; x=1793732113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqBmnY8T0CqGP0cX8wFwCoHFxWCAuxU3CcoqNGTy3Js=;
        b=XB31Rjj99hqs7WSJljIKwhZGFnHV9hT/lkKU5rXSJqka2uhBa759GeTqGcT74/hAVh
         o9IJiS8aceWJoHcoN/NBWV0ze2MO36vOxrxCmDVJB+QVr5hU7JkWsA4QgP0xpctEZ5zL
         4zeJVgU2e6kFCBaMbBedMYXfmtv0bD7Miu8mhQHs9ypoFIJC+WTS+4f2RfDdSCpvtKuD
         clyxnsk8WPDoSUFoMDVU7hn5hmF04lHagpeIYzzzrj3gA9XKY9BOilFKdrdvEWwRbele
         44w+hpbWheIBFmJwk6gVsg76Zqe7VwWgwK8mkxFNVzi0YcmJG3Uc/re+wJLUJtFxJUJC
         W3Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxBMa6ps/y+YLRf0cp1RADRhbUHjvN45Pq1BT2Ld4nK1yP96xXkTsw7uH17yCRmtm7EY6OTHeGapfc1@vger.kernel.org
X-Gm-Message-State: AFq9FYIQUjZBWusbanABxP9b14BdP8sSlAGtyJAtCEDvzWPsZPEDwjzo
	USvFNC//H7LhAD8DZUD6+U0Bety7kEf75flyhj/SkJrX96IfzuTmjuNDdvC1741uSdfwHqwkoJb
	bwBoJPw2N+n6toT721EL0lVjJUu6QeswdsTphHOPwKDY0ITc5q7enNkK2ChiKtEC8
X-Gm-Gg: AYBFou1qAoCtAafo+YO7LFj4aFv47lkXqAqoySovVH1p8npvNjd7TF9JyXFALwiuaMi
	+1wAPuflhFNq6GCgSmSBVFDT7KHIZRNoDNJ+bm98lqjv0pAcrRoQmQMQyO4LIw7foyZ1r8whWTI
	lFhgma1dZhNFWK3fun3IXuhZ2/3kf7DJOaesMp6DjKpwElspmXTA7qA5H9y/Eu1QasVp3RI2QKq
	liHY2DTatacJKRdSAHwK8pC1W0MIP1iGdPlKbRLDFK0njv9NfmNN9Ezm71zrjKbEp5B4tONcENW
	WuHzkMG54tn/iYOhWIJxtQ/8e4OTARe3uEakqJC5li21gzTcHeDRcxttvd3Pbsfjnq8xhHy/lnf
	WmgpyPabCFdoTbolkfW4QGmEds7XaZrsV7/HlBsIcNfuBYuG6l2hpSBfFBhGN46UyXSaaSQOwJ9
	QsXSWi1CfOkt+HFLfLCLKO0jOnXduSFkxELfP2hCeedtrLtVzqVr1ICOpf2HjJR2yt20/CGAbhj
	EYPEGrpHEZKlQxm4QkZzAr1h+MpYg==
X-Received: by 2002:a05:7300:148f:b0:368:5521:612f with SMTP id 5a478bee46e88-36a1ffb195fmr1204231eec.0.1793127313120;
        Tue, 27 Oct 2026 11:55:13 -0700 (PDT)
X-Received: by 2002:a05:7300:148f:b0:368:5521:612f with SMTP id 5a478bee46e88-36a1ffb195fmr1204066eec.0.1793127312021;
        Tue, 27 Oct 2026 11:55:12 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a005c0188sm23309209eec.9.2026.10.27.11.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:55:11 -0700 (PDT)
Date: Wed, 28 Oct 2026 00:25:04 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: display: panel: ilitek,ili7807s: Allow
 backlight property
Message-ID: <auDziHHv7Z7k4xyO@hu-vishsain-blr.qualcomm.com>
References: <20261025-dlc_backlight-v1-1-1d1c49c3e101@oss.qualcomm.com>
 <20261027-fantastic-benevolent-boobook-272a9a@quoll>
 <auCDgewe04WKbamD@hu-vishsain-blr.qualcomm.com>
 <c58c89cd-94a5-4776-b186-44c4b1b3c3ab@kernel.org>
 <auDrCTMk3oCLa91X@hu-vishsain-blr.qualcomm.com>
 <97ffe608-a69d-4f88-9e1c-fe991a36aa1d@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97ffe608-a69d-4f88-9e1c-fe991a36aa1d@kernel.org>
X-Proofpoint-ORIG-GUID: uClEs0kmzt_eLOkVzwIfPleP9-w2RiO7
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae0f392 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=d80Fkh-WlB0DjQDMt3cA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX5Gq/gzNihIWA
 KX1OoVc050rfb9GHf6fvK+jXgHRi4PTGUkWXbMklNPe/4hfLXatyjH5tSy6fe4dqfvcBt0ZplBL
 9CPAzus1/FaKNW1HIe+ZMAZuCljNlrxLS58ycUXeaUCWf4xlI4HdJgK8l8+T+PvUcGTPEK7U5bq
 rkj4/U0xh4vZ8lYm8Wsr3bDjyhtrJlJuQMqKZzkwAjQZ1ILzGB+ZUwxAp2HoKw/2HR1lUmqiS9x
 2Oi13ihjSg6oAAkKsYbGltZ9hayYO7kWqxJys67NlWso7d/5oG5NgnoaXrtF5PKhth/hJEmgV+u
 2ejtkd469LWZZzaLGlOzJ8t00NgvHgG2LTh6b/mYSHDKvBYEiOna8R/ZnJMnCceJWWCbF+0cCOh
 NfKz0HxafMITMb+fL/9da3w2Aj6ZyPQUBCxLyUT8CpSrxuXoyMhiF1JYQDno+L/PhNpo74+Mp9l
 yIyjmYkpIy3unP/KTDw==
X-Proofpoint-GUID: uClEs0kmzt_eLOkVzwIfPleP9-w2RiO7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX3IxuI/yy2XF0
 bneDHQxd1laZ9GAYNaSBVNP07XNdP+BGIXMd4qNQv2O9jewO7r9WsG9d175EUI8DpFxvarrka+4
 0iWs6aGqwLkHZOewfqm1zApUkhca4F4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270075

On Tue, Oct 27, 2026 at 07:24:08PM +0100, Krzysztof Kozlowski wrote:
> On 27/10/2026 19:18, Vishnu Saini wrote:
> >>>>> Declare 'backlight: true' so the property is explicitly allowed by the
> >>>>> schema.
> >>>>
> >>>> Why do you need to explicitly allow it? Since when?
> >>>>
> >>>> I see no benefit of this patch and commit msg does not explain me what
> >>>> that benefit would be.
> >>> It is required for below DLC panel, when enabling backlight using gpio-backlight driver,
> >>
> >> How is it required? You did not really answer, so again:
> >>
> >> Why do you need to explicitly allow it?
> >>
> >> Answer starts "because ... " and you provide technical arguments, not
> >> wishes.
> > Because the DLC panel node references an external gpio-backlight device through the
> > backlight property, but the current DLC binding does not allow this property.
> > As a result, adding the backlight phandle to the panel node causes a dtbs_check validation error.
> 
> Thanks, but that's confusing or we looked at different source code,
> because to my eyes it clearly lists backlight already. Can you show me
> how can I reproduce the dtbs_check error?
You are right. I was looking at an older version of the binding which used additionalProperties: false.
The current binding uses unevaluatedProperties: false and references panel-common.yaml,
where the backlight property is already defined.
Therefore, I cannot reproduce the dtbs_check error with the current binding.
Thanks for pointing this out. This patch is redundent.
 
> 
> Best regards,
> Krzysztof
