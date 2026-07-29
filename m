Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39E34ADD88
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785333922; cv=none; b=tB+ueYaoQU/xOm02qf7jEEOurG9AC0B8PBySMGh/T5Tv3q2OlB3iUNvY0Lgpj5KUcIcmBJfq8CeGPDE/IkZ1V58y8TMHCRNIduAwThWI+Ai18Uwnt1H28ZKbKqpJXMeHS8YsFTVJI1UZ0+pTz+o2SjbJmOPALrWGfuzYDt2p6NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785333922; c=relaxed/simple;
	bh=kedJqclyCyRJp/6i6+30OOv6NmXTkEEPXp9aMCp9oEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxdpTtdCgvsZj6yFGeZS9uRLz+u94CO1J2kHkpgQXOnTySvNa+KEV03+zjnvh783b3UZ+HCdM7+4h7xLCkIuVCPq0+OD+P1w/j/tTACSHEiND7TBQraCjPXmbjd6c790zOQJo7uGyEVMFSRPqGSg5jOXkt6yG87Ba263z1FpScE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjYJjsfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c13VMtom; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjYJjsfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c13VMtom"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD85nF2061077
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dtdy+XMyJko6rbke1I+HYXXk
	E83TfRSaA1yEDFKgiGU=; b=YjYJjsfhT6NJP/PNCN02QupJhX46Ya30fQF/PoUj
	LET0fwlDTdhAuPeStwMMBKIOcrrQa1oaNjAH5b11a8Y4nFDbAzgroyHRoN1Lx54y
	mM/giatmvOdw9N1ByIGEICPlKL/Pn8he0P2ObHEIkXsfLRoAK6QBLTRBSXPVCNkJ
	K42Q1DcxRKwJUnLdYKOAJAgapp4tdtepZ+Ra3Yfn0Zt9D9/gmeuZlrFWpsUXglVs
	+mMc/kMTfE12Sf00VYi/oX3EVf8L8LWUl7tHHq8vtQYM93URIpUudMxvndo+t42i
	qymuK29z+D0q7/QjyATpuJWuEWhYAWPtJxo5icNlQXEZLQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrcgmf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:05:19 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bfd3313dadso1185108e0c.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785333919; x=1785938719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dtdy+XMyJko6rbke1I+HYXXkE83TfRSaA1yEDFKgiGU=;
        b=c13VMtomRSjTZlPrT+f4XLw4Lb4BCWZCSSkoa4uAlnwugRXRBtWeee29PEg1TlfJhj
         yF7cGCP9e8tplc7A/tGcT9MdRajFfX/EPEfeLvDGZLHLT/jKumpzMJZOJLVIwi3s8MUp
         pI0fbcPfCunAPIOHHjDlBkyqebpwf4XCRzSxUSudcJ/6NGEd06FptlR+ICDO0s7xL9hK
         1VG0KInbnYWZ2o6nZgljznkaKe69cX21sl1lAfH4Z1xv6LV8NJwyWDGx/xBfUAVahRyt
         V+SJocJQrdXcIYYx46XD8yK5JeN2iL3IA3c1N333/fT9Pa8zS77Cv5jUg/EKd02OkvoA
         ck+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785333919; x=1785938719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtdy+XMyJko6rbke1I+HYXXkE83TfRSaA1yEDFKgiGU=;
        b=OoiNtltsXJohfT9UydrTEd9aEWmPoYfJM2I/QlDtGDFzFmMgrbgO6jpvylrvqBJRgy
         PXXa+z8zWUJsc9HoZF1klVAHqIoPuKp55O8W2m/1aL4A4USYlBKyb/eaVKXq6gxl2Tg3
         fPPVwMExvyoEUUrLQL2tfhOjOjQHwo9R/yEWWcowdVcleHs6a8jNTLyiz1VRRXAyuPeC
         rq44jLS6JchlkP9PReM+m9ZJK2LarWrh16XjHLear/FmY5yqm64dxTvq6gcmqulJszl7
         FnVQ9smBI9b086dvbUdvk1BZL0J3hBmmE9TOVCKp7DoO0FYhGYoZO2cAtRzlR7Gjjy61
         1ayA==
X-Forwarded-Encrypted: i=1; AHgh+RobCs00/5cwTALQD8wRVCwVLkh/mOFwoHtMM1QQhJGwaif2gVn16+nUbVAmZWIaikuYkyOOkzsWgrFv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5vN9Wi44Ip6KQaS0JhxnK4kMX7MWIhzJMnfKOYEX6VMXnc4+e
	2WLn4tPhDhBJpTttSDU6H4IN73HoaxFbMyK3aHmpbEgv5uty1AIQ4Ytah3q7qeBHwuuNOpLjIyi
	FMuXjeP9g1Tj2oDWqp6tu42bjGVfqyzUytGih4KbE7M1mfk1PjjnCEPfJoCMvJnjEZY1QMA4aOA
	ch4g==
X-Gm-Gg: AR+sD11vM9S6dFNbDn3ZOLPKKqt5Fsby2+qcSV33l1bVp7I/qv57arKLD+Uur/yK3c9
	XA0kCSqx5Ps6qVqjF0w5+bJadLIhjSXbzw/DGgwMThOsVmkftJSvJW+JJ2YuGkf0NZfVEKWf0oS
	XL8wrMnszEiv5+LuGygjiyrqNlVeqFIl40UPFS6JionYNAlx0Z+emoghP5GvVf3zMLQkVtWDIWq
	IpEM1S5Nw/AZE1TmUTcicP4wU7U0QQau3XaTS28HuM1/0mT5vbRXymYJGvBm9Fwv+ts7YCU/IFX
	9MVkRWUfFgg5iXuq2pM/yfIDD4L/SfXP2H/jUX/aHjP8xPmPyrO1DeR9ibKtFV8ZoqLBGxsbahW
	/SKGCxJC9asbc308mvIrJuPUAN35MljsZrqLv9fiwlG7ABKzbiEjRmf+GsOn7q7fsDaV+zEwaOh
	Wh5BldrZodV9rY0w==
X-Received: by 2002:a05:6122:168b:b0:5c1:47db:cfcb with SMTP id 71dfb90a1353d-5c33f94e88cmr3208366e0c.4.1785333918999;
        Wed, 29 Jul 2026 07:05:18 -0700 (PDT)
X-Received: by 2002:a05:6122:168b:b0:5c1:47db:cfcb with SMTP id 71dfb90a1353d-5c33f94e88cmr3208312e0c.4.1785333918363;
        Wed, 29 Jul 2026 07:05:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f5d68b24fsm4265361fa.22.2026.07.29.07.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:05:17 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:05:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: mohit.dsor@oss.qualcomm.com, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v8 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <5xpvwwovgwuxltjqjnlchamwcvppdc4376fcujeqovm7fr3uhw@6r55ztlq47ob>
References: <20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com>
 <20260728-lt9611c-v7-v8-2-bda216bfaf37@oss.qualcomm.com>
 <20260728112614.BF6721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728112614.BF6721F000E9@smtp.kernel.org>
X-Proofpoint-GUID: aNpvag47VhYkt6IZWUInoVO9oVT7p3OO
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a6a089f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=CTjjQwyGzVbXpAY5hREA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: aNpvag47VhYkt6IZWUInoVO9oVT7p3OO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNSBTYWx0ZWRfX4UMyYvTBE4Lm
 pUTw2zQ4R9VZSFmagdCsl0u44VuaFAMn6CPwJYl9e6agWK70Uv8VOexiRU1sj7ifkKc8XZVvtyh
 8lFX2vdqV5WTbT9mtN4Wk305SCoIGag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNSBTYWx0ZWRfXzXlD+FSLgEkj
 jFAuPUht7A7zIZbYBC1tngEpXctU772gV76n1z5sNrWkbybIEPcXJrou3EYdlXZmNwh8UZNvGXM
 sd8qy5OqJOTy4G7mi73wa0Yh2gFwR9r1yEI1dnhHs4CxsyxPy8YidJrmv41Kb/N7g1pLpoF9iNt
 +pTwDDKopziyLrLKTqr2zHkk+9AXRWYhySUgTmWBT61lxxxcvUmXLJ8RVGOjlOIhH7AlGNaXut/
 2who2tqeQ2KDs2uNMX/f0YYTdOxYjVyuhkTHw1TvSD/piDKjcKrMkVz+5HERLzvVU2hPvkoAeCv
 KuC+Hoy2c2YM6l20wp0P2N2MO31qTQe+RedKYqG0/XbwYiW6k0Tcq8qKpYmZNBsbN0PePHfSeSI
 A/bOE9lR/CM4SOGpRtEa1o6G/UM39cq8pAPZXqTmJjEE1PGg2CUxxKSN9IbIvTNk1iomxCmLTIM
 wsbQl4x93lUcq9i0+lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290115

On Tue, Jul 28, 2026 at 11:26:14AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 12 potential issue(s) to consider:
> - [Critical] Recursive locking deadlock in `lt9611c_hdmi_audio_prepare`.
> - [High] The IRQ is enabled before the hardware reset is completed during resume.
> - [High] Premature manual teardown in remove() conflicts with devm_* APIs, leading to UAF and timeouts.
> - [High] The IRQ handler incorrectly clears unhandled interrupts by writing an inverted bitmask.
> - [High] Early registration of the DRM bridge exposes it before resource initialization is complete, risking use-after-free on probe failure.
> - [Medium] The return value of devm_drm_bridge_add() is ignored.
> - [Medium] Selecting REGMAP_I2C without a dependency on I2C causes a Kconfig warning and build failure.
> - [Medium] request_firmware() is called while holding the ocm_lock mutex.
> - [Medium] Missing `regmap_read()` error handling causes uninitialized memory usage and broken firmware upgrade logic.
> - [Medium] Incomplete error recovery in suspend callback leaves the device in a permanently broken state.
> - [Medium] Synchronous firmware request during probe may permanently fail if the root filesystem is not yet mounted.
> - [Low] Firmware version is not updated in the driver state after a successful sysfs upgrade.
> --

Please respond to Sashiko findings.


-- 
With best wishes
Dmitry
