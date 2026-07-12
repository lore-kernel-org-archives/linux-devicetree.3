Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFF633E367
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783821934; cv=none; b=QYJXVzQUP3W7cAEyUi5mCOmMwmwHZ0Ix5gN/9gfe/PVeeAkeK43jYs2+O88UogJ7G8ppJU7fwY6rG6PJNd8BfH6k3GFPaazmrN5EX4Ed+QlBTAuSjBU9BaZ7nVvHB+1F3p0SMwVfcIBJUWDXdsDfu685q5XiU1mAyLjtPKBaOLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783821934; c=relaxed/simple;
	bh=n0ynR1YWxdgu15IVsEs6KG6astlI1V+Ync4MSaGMIMw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u/yNE3lH+8c9yM7c7+SGxQY5uyMNuXxrAtHHHNCuzBJSW6AX2PtSQvUIpEb4VETyvyAZSD/TWDkHGQwc0neukcgrNYnkUKL2mht2GSEDgMJRSQ3YVUgbV3xNx2pW/A0bFp2mj2nhpQ5sXJ+7OfyOc24bTdHOh5YBrdkzQL+aPKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fq9Y0rku; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBBK+yLo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fq9Y0rku";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBBK+yLo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C0XWuI1093583
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4yUicwDd9ZYi3ycSy08Ow/qwfqFoMw6lzLMjdqz6dY=; b=Fq9Y0rkuRYKTYO8/
	UBqIry0LWFM3KslwPJ0w1ok+Thb+HK+SpG75KWCqPaHV5JGKaNu1WDTzvfoyFE6c
	fL9gUdBunyFfvV79S+rtvA5Ensu/7gfUrRWmHQCfslFWaqeriufd1K04sJvZ0lxR
	zwZw+Q/X8hMSb/HfOAzxUSc73ld1ErNxS91AqXQkHnydjiiPqZvtVqePrHiVDWKU
	e1dFdW6g93IVYpVU5w/RbexRxJfHxDIcFibrj/pCsx6qiBZPVw5fa1EtU4cCiIUR
	0/Sn8iOI5BtBMD5KLLq7q627WJq3rwb0BY0qEUJvuRI2Jgw75ov+CeKHw7Fx4FNa
	Bz7biA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehj0my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:05:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso46512615ad.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 19:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783821931; x=1784426731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c4yUicwDd9ZYi3ycSy08Ow/qwfqFoMw6lzLMjdqz6dY=;
        b=eBBK+yLoXiMixcs3X8zElYPh7KZ+Ej0eDFWkk+ajLgD5NjAj65S5NBpLf71yD5pkcS
         tE1t6/myGtCxIbQG61mlh809+BZVeo4HR3VhcZDS4RNJc9lOK5DPOCy996JUUBP8gyNu
         zWkU9kf8oz3bs+WVLxp5dHs5JnsLm+yRU/X+blbpIVmxmfBCSxfLC0xMZBgruV3znMHe
         tan5uKIBQLrkfqkrDAr5ZYsKKtvQXCmt7dZbBjzZZfBRTDYc88OGqRJv53ylb1/TCh/B
         ismpEIcOm3jQYb3sp2/4nuXLz8UL4OL/wx/jL1mUjrTdaxNesyycrmei5OI27S4XmA8L
         /zeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783821931; x=1784426731;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4yUicwDd9ZYi3ycSy08Ow/qwfqFoMw6lzLMjdqz6dY=;
        b=jBOJ17eSm/pb7Hg0wx2/dk6/TFYSzupYbaDF3a6r4hPtmNCICCZya1tSV6P8QRNru2
         ZDs7VqIux2Mf9MqMKwvRmIjgh3SRItOKEUEJfbcGaxnZJwDggZMTmmX0cUS2GIDqGdWD
         C1nZwc50HPRpWhlHdLcBZZZfqKIgeILU3a9L0lDVFaukg9MGkv0fedawtDviVtDdS8TN
         VjgZlrnmLkj27zkmBcFBja6s2zXs1j97BcckzqBAwW3suV2YCtTp7XCT+v5TNaVe36GA
         YvUXinzNY4ejubqmqrdngYr4w3EqErzi2JkujzJ/MEPlvuq8uy6TvkR4GQtYdGyq7duq
         065A==
X-Forwarded-Encrypted: i=1; AHgh+Royaih7/RwgsTQvK1j+2OHWPPN1UIzPFwyQbSw6o873Vk93RO0rA4WEirNvcREch72ztkZpeNc7IjFR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx1UW/qRcobMsZC1oEhtWYAyqnscBUrYUNv79Mhcj73i82xqlH
	UBYtWUVWO5JVmhZKb5KKeLgxoKfC1QbxjDInIJngB+5ee+GE2S8HfZL2ZvXwvxYm2boN4wBsqIS
	xq7PFvdq3Rsu8yhOqu9t39CbDN8WmcubEv2NJj1jjXGOCqkS95xJlLw+glj+91tPF
X-Gm-Gg: AfdE7cnDBwdOtXYQj1KDLN1o+pK8QbuHDyFnFlu1qKIFHnr0EZDlK1lvFkT2lnBmu52
	H0CUiV7i+SJ8bJvUKC8ODXR1pPUrQjdaZtzn7HkrsK164u7RkPXX3beY4AsGNmYrNe9Cmh1Z2Ef
	93nVg3vqj3kD1r9opxcG5Axlx+mPpnJ0lLVcOIoFkZCKo0IudZ61zIcIbhPKjqhC84Z/XQYQQ1r
	VWWm00hgY7hXA9hgHykmHeKNmRBVAPOY4ACgE7bGGlwWF5zQU4GU2DPbvf+PS2sfMTiJ/Xu9jcN
	HXeMe9tMNWjlZCm4fCjLpavOaeBk7F+bBoDim2P8EqiUKhPZ2YTuMmhyclvV0TJBI/BDgu/MB0t
	dw31fcvaeUqnE+4LNLaepsStbjns=
X-Received: by 2002:a17:903:198e:b0:2ca:d31e:ac50 with SMTP id d9443c01a7336-2ce9e99f4e8mr49495035ad.17.1783821931106;
        Sat, 11 Jul 2026 19:05:31 -0700 (PDT)
X-Received: by 2002:a17:903:198e:b0:2ca:d31e:ac50 with SMTP id d9443c01a7336-2ce9e99f4e8mr49494705ad.17.1783821930611;
        Sat, 11 Jul 2026 19:05:30 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf92bfsm79846135ad.28.2026.07.11.19.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:05:29 -0700 (PDT)
Date: Sun, 12 Jul 2026 03:05:23 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: David Lechner <dlechner@baylibre.com>
Cc: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>,
        linux@analog.com, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Michael
 Hennerich <Michael.Hennerich@analog.com>,
        Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
 <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, sashiko-bot@kernel.org,
        Maxwell Doose
 <m32285159@gmail.com>,
        Joshua Crofts <joshua.crofts1@gmail.com>
Subject: Re: [PATCH v7 0/7] New features for the AD5686 IIO driver
Message-ID: <20260712030455.424a2ecf@jic23-huawei>
In-Reply-To: <adf66856-1cdc-4722-bc3e-549122a912bc@baylibre.com>
References: <20260710-ad5686-new-features-v7-0-1bcc8c280e4d@analog.com>
	<adf66856-1cdc-4722-bc3e-549122a912bc@baylibre.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDAxOCBTYWx0ZWRfXyV9QcLYCsPDw
 X9AWi5uVM01et6jTvDAkzaevyMFONJRGT9tIz4Rjt5TqefHJzwJkF9iBJLWlFkzE6YgjVM9W1E6
 OmlLmokNBSc02Rt8qScaLr3fAENWE94=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDAxOCBTYWx0ZWRfX5Jbe42UzYQCl
 U/UIxlpbmGo2YUK8e/ZfHvDEqNCT5Xd3JhDQlrlQ6TehJ4Uwl0mKPN8C316N7l6kB7pRWigCWgr
 p2Lk3cFb4qhadUL245ZZ7sPc52hGl121fOLgAf+CJAtNA4ezVGfe5lOZjPWRcYQ3+sNL5xptCDi
 yg7GDGiTzWTda+mO3nstznTQKAR4oGY1bVXJt7A6NZyrUArwkcO/7GK5v8mZpD8mmN4DfQTn/c+
 86MQoM/cEoNsscl15QMZOIQ49aKJtJf6Vr9/lfdvv/eBNTil45W3MvLAfpMUYb6VeJXx0MbeY9n
 twEEIeypIEVa2h850IzC+n0zusCnsDUVL7LiHlzCGJJvkNoE5kaRSCUFfKzMtZZjet6978PjQan
 gAubsZhLodPK6uOS9Ll1ngU3yAott8c4JmS0h2TZTsyIpUETf6g5K27DSdDdpVrUnpYzvT/nezW
 ZygOa9YGohb5G4kWLhQ==
X-Proofpoint-GUID: N4lr_VjntA79Nw80sViCUZM00yt6dP6U
X-Proofpoint-ORIG-GUID: N4lr_VjntA79Nw80sViCUZM00yt6dP6U
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a52f66c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=IpJZQVW2AAAA:8 a=bnaZUdZ_d7RInuNZ25oA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120018

On Sat, 11 Jul 2026 10:23:56 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 7/10/26 6:20 AM, Rodrigo Alencar via B4 Relay wrote:
> > This is the second series of three on updating the AD5686 driver.
> > 
> > Initially, a big patch series was sent:
> > https://lore.kernel.org/r/20260422-ad5313r-iio-support-v1-0-ed7dca001d1b@analog.com
> > 
> > Then, the first patch series added fixes and cleanups:
> > https://lore.kernel.org/linux-iio/20260524-ad5686-fixes-v7-0-b6bf395d08bd@analog.com/
> > 
> > This one is introducing new features:
> > - Consume optional reset and correct power supplies;
> > - LDAC GPIO handling (active-low, held low when unused);
> > - SPI bus sync() implementation for batching multiple transfers;
> > - Triggered buffer support, leveraging LDAC and sync() to flush
> >   all channel writes atomically;
> > - Gain control support through the scale property.
> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > ---  
> 
> I made a few comments, but nothing critical, so...
> 
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> 
> 
I didn't find anything to add, so should be good with a v8
covering the stuff David pointed out.  FWIW sashiko is clean
though it does raise a missing null check if anyone forces
a bind that might be good to fix.

As to the DMA cache line issues, I'd ignore those. If they
are a real problem with any controller (or more likely
the interconnect / caches in front of it) than I think it
is up to the controller driver to bounce the data.

J


J


