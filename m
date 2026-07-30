Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0691476693
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453985; cv=none; b=bAbwc9qlc8W+lixlVY61BvIbdrLSREfEFxzsNsE10A1pSb6zNMjLUwy6NQpa5LS+u7JiSilayDHfswQOkrRnj77aH2XWUw23fiLF0rctwjq3m2NCm6CIk/FK8MvPAIWXCmJnEXqT6vQUC1IcsflWfblR2jcyW4pIYp8P45ucfeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453985; c=relaxed/simple;
	bh=k6apMPixZlxcTl74lLpn5bFiVwuwYrQsZsfUSBIgEOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZ6Zngbw8gVwabEasa/7U3xIfOEXJ8GG4+y3Ta1S2oCTkQrdUdn5QquO/zjQzTWmHFGqyhuyzRG6uzQCw9ESv8SBZ6HyeP2yCn6LZQri80tTc86G+JruUouD6+c638ufUuNAWL/VX7e2EdpwfXv/q5UgZ0z6twm1msPm3tQx4po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UpsyGQ+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffEwgLRI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UpsyGQ+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffEwgLRI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMs17S2479426
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t7zgfw5kw7a6w6J3MvZyT7fQ
	YOJ9kkcxGw1kAwrJMcs=; b=UpsyGQ+4W4isutLL7OQZdDFcRgq2UYJkThOjHWIR
	QxJ25NnPm/005CTCRfCY56DeIcb/99SD+4b6zU4o2u/ZVYrRYYJEKYcStIdssV1m
	1FY6JVnd2MWREKWtqaFakhOJqJPYX8FGSMIzc6+DZmVcmZW+Am1Faym0L/HLYck9
	+rmS8wstl110bF4gPRkrUMadqwHCkzz0lvqA0L3szbiDAylpY5HBk867Xy7XftET
	hsduqIV4pXvDpetIlWkeWIxixODJUxRg15e1hMR9QfgoGQEoE+r3OD/ef+53DwRe
	kHbsm+aEkmv9RfTdjgiKgpCyvvAf8raC1sgYM2EplC0caQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfpfr338-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:26:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f39a46efd9so12139616d6.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785453980; x=1786058780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7zgfw5kw7a6w6J3MvZyT7fQYOJ9kkcxGw1kAwrJMcs=;
        b=ffEwgLRI6eh3HYBV8XdJPND0kZWMKM79rRkIYI7yhk6mDFqeUVFbSMEfWPE5yXP4pa
         7+UDPejUwKVMuW/jpj4Yp2VmOyDt8XAgJ+UQO5EHoAOPRnPEcQvCDEN8rbOj9/0hbrX7
         qQ5a/kpcYJz43VAxDVq4i0ECUIihXFMy+SDAd2bGjHTHaaJzf621/A5hcOHB0BHn16uv
         yeTktDS91bjYWXsT98+vHug3ukObExwn0BDEigp5bZ+tYoA//ezz34if0P15r3xPGOM+
         YDZkBuBp/Q/h55gu9lhCOqFDrJfQ/LfsJ57288OaJvblF2yfD7iypyHJOP3OjdP9aFnb
         QBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453980; x=1786058780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7zgfw5kw7a6w6J3MvZyT7fQYOJ9kkcxGw1kAwrJMcs=;
        b=kXtSVj1FkvaS7F5Ep8Uo4T4nT2Rmn+APUD7pQnZ7IKy+ZvC+TFTcjGpTEUi8+hjfu+
         pSlMVDjSP67DmKpOoqixjt+6VsH/dP4VfR4i4WYS0ZlIK6o+MQsC95gkWFOIZqRssFno
         Xv9QeOkkAbAE64UMTzUxCuDI4b/T9pAoQCAg9c+OaorpJIZmgK/bffE9VUbthHdODmFg
         p0uAC1Jkyv2S0w+BBJW88M5sPeYx72vGRQFuQ0dGsvy2w92GZrAuc8Dj722OZEZZl4JV
         BzL+D4bfV87s7LJge2EOR0d3oNwpZZ0ZXL/WVOzLCkiryt6/TZAzY+E8Th7klfJ8kk/j
         iziw==
X-Gm-Message-State: AOJu0YwXl5b93uq0cgKqQpTEqz1yUtBWAWkQfoEOs7zKdg+G4yM0PS/a
	GrYaxPDizb1XK5gGEELtNzOdrOtWL1W24trYwR2TMxktdbmXPcN+r52oDs80ABVIBKhVY3ONQ3S
	JgDfWj3rl7vub6OZFi9v6gRrLs6E8oXdzXLkaf2z+73L1DhMFoeLs+OXpnW9fLVO18vPlNyOK
X-Gm-Gg: AR+sD12oriO75ZPrncWdDPudgAk3EkLMi9hP7UJEQaTNLH4PbBmkxjnJ9UGoYQGYhFZ
	aMELx6CIEWavuScpe6/7lLzaT7ZxKZOnd33NjfjoZBlOD2H9FqEiazhrJB9MyY8rljeq/wZSMIC
	P2r2NX+Rlw5Li6Gae58T2V+yKv9tcgujBbFCHNksiNZONnIRsrA93DDjHfK+mEyRqmr7+SXIOls
	FiEp500u7UaELwsXTe8+f6gE7ZFIUx1Fu40Q0BcZ2+IG6cOy5fYGNRSorTV13KhREqCJUjfmim4
	0rc807M0+u4bpRSB1uwNCUVDCtyadAttspzmRCZ5EPPEjUlKQ+yxf5elMqjTuZrUcbE/05Aauqo
	y217cFDatDxR0+n4rYlZvCSp9HHXOHHupWZ0eSuBHHsBhQhqf8poO6BKJRktCqkPqsKBa1pk4Gy
	eURv47uLzMXt8/Fw==
X-Received: by 2002:a05:622a:15d2:b0:51c:b91a:33f9 with SMTP id d75a77b69052e-52b424e01b0mr25975941cf.13.1785453979643;
        Thu, 30 Jul 2026 16:26:19 -0700 (PDT)
X-Received: by 2002:a05:622a:15d2:b0:51c:b91a:33f9 with SMTP id d75a77b69052e-52b424e01b0mr25975731cf.13.1785453979186;
        Thu, 30 Jul 2026 16:26:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ee670sm606530e87.74.2026.07.30.16.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:26:16 -0700 (PDT)
Date: Fri, 31 Jul 2026 02:26:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        media-ci@linuxtv.org
Subject: Re: [PATCH v8 08/18] media: iris: Add platform data field for
 watchdog interrupt mask
Message-ID: <oqcjmsukorvnorsejp7s5njddzocksqh77j77ydv3p4t2emtyi@rerl6mx7kvcu>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-8-6597c08cea6f@oss.qualcomm.com>
 <20260730153230.9BEDF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730153230.9BEDF1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2NiBTYWx0ZWRfX4xo5inLUH0JG
 Aglxt5Zovt4czlLePA6jcPYVvSD4CNM4w6GnWOoVlRO98Ej/csSdRlItLz1bUDoPRW/ZSS2eP51
 V/+IjpYqHLpy82GGZ65P3hoqoJE3THCgUmPCSZcFTBgttRiOaOyoqbD2dUuuVAMXJpq+QGGNGOn
 YzKmjS/exsvfbGD1dcNvbeOJRv5G54EQZ6W8OrwA51GTUUb/qXoRojBef8A7s08fAVBBGt4IG/C
 bDYoIhW8mrFADCT2chTvmNa2o+dUqBXT9n4sERgF/B+nHS2c1FyyBPqJ5+SI5y5vQWhv38OUA0H
 /NgJ5aEz6lBnXzrYPXMKZIITAtKOw+gbvi6yuGDj/KtzSaYsgf2SV6hExNA/FCc1rVcVTrqeXb8
 HpwAMdypnjEVOa0ta0oyfvFX/bG9Ph9Ypp1DFDV/KEp6MbaSkM68vZKi47qQOX4nG5VXKs19r3K
 oRb/WIp7hnIqISiwGbw==
X-Proofpoint-GUID: MpShjwbUmES9kkVSKwq5uVGeQmNTJLuF
X-Authority-Analysis: v=2.4 cv=XNEAjwhE c=1 sm=1 tr=0 ts=6a6bdd9c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=fCJy3Uypc3c1zbPoOmkA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: MpShjwbUmES9kkVSKwq5uVGeQmNTJLuF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2NiBTYWx0ZWRfX4Hs6ClXzknn7
 5aLA2VKr54vTGNdRis/kYIDaH3jdvqASNVjNWfFxsZZHc8RQYdBugSjR8NSZEegbUUDAM8SxxaZ
 mKf3eREn+9TocspM7NYbSgvVrk03epE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300166

On Thu, Jul 30, 2026 at 03:32:30PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incomplete refactoring of watchdog interrupt bitmask. The new `wd_intr_mask` field is used for clearing and handling interrupts, but the hardware unmasking in `iris_vpu_interrupt_init()` still uses the hardcoded `WRAPPER_INTR_MASK_A2HWD_BMSK` (`BIT(3)`).

This is expected and fine. AR50LT will override the interrupt_init
callback.

-- 
With best wishes
Dmitry
