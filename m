Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486043D25C2
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023907; cv=none; b=GYcQXj1QNCQ4tO97jgboBoX4clsrYDok0Rxgum9u7aAPx2hhgsA0mdTsWcoXXleHtz4OKN+/KBJBAaMDOzWOi9DJf60x/R4jVLHq0U8viy/2pdXwp89waxmH/rUE4xLL+q7mWQ/TNUzoh0TRDMwjQuMFQxw8z1Ec1nfTGHci6sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023907; c=relaxed/simple;
	bh=kIDzJ8B3tLVH67CCuFXSh6BPkyDJbIix5oH5ciqrQAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbIqxtSG+LZmHwdlA5Din9tbHqVCke/XQ9ah6ffyGcL89DpUBOWsQJK1kiubrNZ6ASR7DnwPAAOM4RHwDfxRQ/ZjvdiT6fFkK+u5vimAXa1mTD6yuzIREv6jMZYusy+yVC3NI3vSHAPwM/9SOMqQOsuFFB94fpTCqYJdGQuLzuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0a7jmqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDuZpwL3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0a7jmqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDuZpwL3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I25A0e3603497
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n+O+aZ5N4bg+RGWDpZ5iVQeO
	w+4epR7Fbm6jiS4DyUc=; b=O0a7jmqdUKzE7fEym4TB84zrfkYrhZ8W2ryz4KKn
	6WZzHy4XZjdBMiylU1/rdVO6jztSvn70rfmM/KzR3SPwIBEqSSxmDw+9RdbO3z4O
	CAgY0eyVUQ4TJKRO4SHFerUi4BZAFeiDs3B0aJ2wODFrIei3/gR9KUfqHAn/MFXX
	zf1vIMqWDjgcTciq+QQQQGUyRyrfiBcAjBtND50LLZ7MT15IZInsjE1o18bBzI9m
	Xu4y/Ixmp57ci26+v0iBlsulzb+HJEQ0UMxyFskWd4fRZesqRYUTF8Jp6q8ndW8U
	UJ/q40YgQSl05jujtdO1UZNkGxvPD7I6hr8CWnEVXGIwSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2gb3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:31:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so408877285a.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 20:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023901; x=1787628701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n+O+aZ5N4bg+RGWDpZ5iVQeOw+4epR7Fbm6jiS4DyUc=;
        b=gDuZpwL3FVq9KownW+MKwJ8aY99H6g/cJ4Oadjh8Uu4Ujv+z8GkCreCei69T1BeJRe
         JdC3PncIX2m1b0ZM0gi9I+6l0QrC1Vz8NyejYOgJMtZAjcvTS98oYi/BfR4+g7mAcv5q
         H49NLchY16PqnlAcWXmhzpC+k8kCL4oKC4+9/9sO9m+5ABeXRn9TGYu0l6qfubfS0aaT
         Y1UMo1Atmy4tevxbll1Jy9A2tVvGn7wsnM7rq2/fVYbDfxCMIyuUoVr8kQl2Y9z4UQCp
         3toye6O9pr7JajYJzFuqG0T/8pigeaj3EcXJDNbZ3da7vpsq2AC/7L1Ava52wXb5h/8q
         2vAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023901; x=1787628701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+O+aZ5N4bg+RGWDpZ5iVQeOw+4epR7Fbm6jiS4DyUc=;
        b=K8+gP54eE9bo39NwSYhyf2ERZXDBBsUqLK3AIUXTYckVwV0y79JzZ+wjD1e4PvDhrx
         sVEhwyp3HGHzUjBpNb3bFkuysAdQYvVrukpjUcmFDXq8KdqE+Shtfw7Tp0THEnKM/tAY
         Q8TiwtLFAywBAgOMieb6G0fKMb9k7Tu92s9FOXSt+mvNSCYLoXlsVQuVUGtnwCTjtdmj
         /F4w3Z63aXK6xKqI9KCmXhYPWEOmEuRN4ihS767uIk+GrfCrd1omzQSsNMzmbmMcjeTf
         lDm06z01b0ZZX6En0AU+4nYxenF29avBH5Au/Wn4KYauHdpqLoiHq2IN+gDyaza/3ZbI
         pXAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcoFw2STOjCQm3a/0YlUZk/i6e40ASPmqz/3yODGpM9+B6uVKP9+FtbH1Gl6QCCZOtBc2DRqwksul2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1uZIAjgfG0niTZzChEZPDSzlcdW8hPV65BYzb4b4Nnja5VqHk
	nemsTOo6erkJl7IceVFOrGvcIVOfwqXZD9TWk6jEJr+4AEr3uFy+6/5np3oYZvOXQsk4i4DPoQ8
	d4OQufai7kyUyyMhozrEWP6yEFFL0oNAHDjOfcwf3wXeI6Vv8zMoHO12q1DBf6XU0
X-Gm-Gg: AR+sD11DdcLUZw41EPlk8qumEXZ4PS476lILg0qJlTQNBrMxa7xodszmffwdXAgmi1Y
	HoPZaq7WqDkaxep9Pbdn4twVlP2cSfQxfbv2sgQ1tbZc1jfuAAQnu+kFQA1U1hLFbzNX6Nq28/G
	Sse+jxBUWP2XapQiylnYuII2ID86iLUnL80ZzZJH/gn0Lek5/ENreL/5OZQ+DREPK0a4sq7nTsx
	QRpNnWd29fKEV0EM7WIgm50ru5NSKqW6mxYKH3DpCgLxBsMUyBbtkwTLD32RkJyqVSF7E7uibHY
	ZU4sJtmSOgWTx0kVirtNujoXQQR031Dz1szG5XQuf+xEliCcA42w6JQwnUZLS3BGJ4/G/xhb1bm
	CENnwPgNIAHCBdili8rRamJtq1giM5dVtWUV1GJUVqPax5ISsJe/cwBMK5NjHSZrm1UeSDcbpYq
	zq2py+f/ZN5atZ
X-Received: by 2002:a05:620a:bd3:b0:92e:8a84:7041 with SMTP id af79cd13be357-93704adf65emr502916585a.8.1787023900857;
        Mon, 17 Aug 2026 20:31:40 -0700 (PDT)
X-Received: by 2002:a05:620a:bd3:b0:92e:8a84:7041 with SMTP id af79cd13be357-93704adf65emr502912485a.8.1787023900401;
        Mon, 17 Aug 2026 20:31:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00b5ffsm848954e87.67.2026.08.17.20.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:31:39 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:31:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
Message-ID: <5hksiunlpcuv6b6eu2tx5furtzhsmutlts25vi2t62totceedg@r6fagkhlflic>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX9TQFKPynx4vM
 6AtM0XgVDp8aOSgbw/5GkorP+oPIVzGxXRgOKiuPxn8YUZ4nZahIUpB7XBwhVyILuv+mjaqpSng
 f2CnzCSGKsjPsbX4OoXcPSCeohTV3VVFwt3NDeDWgBXtR//+P75hRT99PUGbDHFy9FWzywgp3Qo
 w8Y7GewfJrzakWbpTSWc5wU+7PGZoHd4ROmMc17vCrCwS9Iyt9wNszx7udHozB2/WFFjGG1TrL4
 t3tzw0U3y2Tdq6jxMtiGG3cllY5bIqBDZRmJeQGDhxFLUesqCh/TgpetW2nju+7mhF3cqo6GZUJ
 5qpc3x/Lzyvd6k70JQYNdDCoVcP4Y+9wEu1NGORaONmiqLk57/zNZRAXO3HdLKnDBBPxk7/vRuF
 v38C+PZyMTNLnZhFeeGFQKBOHQjdveNzJje2ZQ6xDUMZHlF1qWOrFskVmRxfwwye4fgoTSbEjQW
 m2G8WVyuw39UgGciD1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfXwpmy7qnIP8ug
 KQp6yK+doiYK5wKG9Z2GaWSxAFD8CkU3ravhbJXD6EYWxDvGC0R3tkeVphcwfgU/Txf0J+/b6D+
 PbZljSA9KSiERvFvb8U93wQ/hjLJPMc=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a83d21d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=FzwJ3IxCXKmGzkSqTIsA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: aDDDIMqdT-vZgZI2DkMO9xSaveC2MTtn
X-Proofpoint-GUID: aDDDIMqdT-vZgZI2DkMO9xSaveC2MTtn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180024

On Thu, Aug 13, 2026 at 03:44:53PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
> > On 7/20/26 10:43 AM, Yongxing Mou wrote:
> > > Kaanapali (SM8750) and Glymur use two display power domains.
> > > CORE_GDSC powers the main display hardware while INT2_GDSC
> > > powers a subset of SSPP blocks.
> > 
> > Can they operate independently? Does INT2_GDSC need to be
> > powered on after CORE_GDSC?
> > 
> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should
> generally track the same state, except that INT2_GDSC may be powered down
> when SSPP1 (VIG2/VIG3/DMA5) is unused.
>    - CORE off, INT2 off
>     - CORE on,  INT2 off
>     - CORE on,  INT2 on

What will happen if CORE is off, but INT2 is on?

> > If so, perhaps changing the clock driver to make CORE a parent
> > of INT2 could be the simpler solution
> > 
> > Konrad
> That would still need DT and binding changes -- DPU has to reference
> INT2_GDSC directly to gate it independently, so it can't be hidden in the
> clock driver. The two GDSCs have independent GDSCR registers with no
> HW-enforced sequencing, so they appear to be peers rather than parent/child.

-- 
With best wishes
Dmitry
