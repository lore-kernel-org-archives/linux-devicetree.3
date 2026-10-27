Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101029;
	b=e/o/cblPMvCNO/Yh75Qda2ePLImh7TteR0veeiC4in5xYUtXQtZUhfyeodiqPGPFs62L
	 Z32dxOYixUPImvTOHMaqcKoyDU5OkXAuYzbvFCVAwZpvg9FtD6XGbmoj+/gtf3WLDBxBM
	 ZH68nlimvo7ktw+8s6KcPu9v3N+wQ/F3J9DFVO+TUCGSWMCpY/FJ94uXsarJ7CIeAiVcM
	 t8Ew+H3pMOQ/AW/hx1mzWTJGTjbNCc2e8dXsbO+36n4yex+NsB8TUP2FusAyWxfb84Ktn
	 B52ORoij7DiTSCiZmSJi5aROanl8WYWMfkEMsMQzFqw2rlh42ERvcZXBPr6UIkeiuTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101029;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d9Gksr16Ym7a6rQh3BsSgLKtbW1PN6uAQD1PHStu3Cg=;
	b=SDjjBuY2rcunERbDucls7v3rfiLb8/Xpp+bRQ+BgatMpOZqLDovg9lkWvV2joGRjM24C
	 UbxBmBAUHehIT5jNqKtykTLU128i46M22WEvQQb+zhK8OoCuwrzvDE2H/1uFssAFF4IA1
	 sp4QXXGCkBlA+ODOXrFkdVmFKlWuNflb+4qY4DGlQYUbeIXxi+GnLXk3V9nk9+rS4/BKe
	 2xDpFMwnIKGW16clNF1/3RUkp3PEuhBhztYvHO3YS1tBD/++cUMLuCDjwZD9fEwZCNG4u
	 WM7HR2IQCy6q9LFnRDT59P49mFytt33CSda2HEz5UCqKM/XhJjLoixwdgLqSDDNijtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BYkqWIL/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYiB3GTb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD500606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD500606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BYkqWIL/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYiB3GTb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe4HY894352
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d9Gksr16Ym7a6rQh3BsSgLKt
	bW1PN6uAQD1PHStu3Cg=; b=BYkqWIL/vT76gUwo2BPV8+qHrr6gTQHtEF/qsZzV
	t9k7/HNQeqhwS+OHKqnDsMIWulbLG2pqkKIwvCy+qUpRSxC99/XxZBrYFP4cxZ7l
	/Q5YOmpG3L271QH2G5vKyPoPM1U+Mq8rSMuRfxu5hdQR1Oyw80YcKP/fbSWdHayk
	T1s4ECD6OiTjnRcPlz4xyWeEWk5/6k+IM1aG5CEfYWk//wv8JxvDfs9IpI340eXV
	4UYya+dCPcGYNtZp5Y0LWnfYkoc75+7VeOWSCho+8Jf88hndccM3tEwzSWSew6Ic
	bV2hVKl418/lToGDeg8NuPuK+BK//WEAdS2VFXbsnHzZsw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smv8t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:37:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf08dc2fc8so981465137.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101027; x=1793705827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d9Gksr16Ym7a6rQh3BsSgLKtbW1PN6uAQD1PHStu3Cg=;
        b=MYiB3GTb5L7ix1BI1N8Jpyt+VCP3d8sLmnAczb+NA8WC2GmILuLKf9Cgx0SCAHmdms
         zX9H8/n1Et56I4rbUf8cCbhHU+hT2nrEf7Tq4uIdSInkvP0hTEJ62mMXnG1mxQl9B1qO
         dSVnoP+GA/AziQHhuNimf7gTmptyGjzMhu/WV9btYfCUmjI3J/J6bBDDydotEi2jxtq7
         zuQZG7kteIBHc2p3eZyKWgel5d0xnDFON7kqPb3Wy/ePe5k8YgYzvrJWljU20Qlz5Pyd
         z6SybKf11ShDACw7I9Vfq0bc/1n/VXB8GFQV0AVdpgRc2eRq4tm2QQoNskU1y8ov27AP
         ylow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101027; x=1793705827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9Gksr16Ym7a6rQh3BsSgLKtbW1PN6uAQD1PHStu3Cg=;
        b=Hj4e09tJBfT9OxsKvQ2LaIfcss+EFWQKW7WwHxWH+/Om3z4YzRvQ/GC/0esahwnv89
         CVeOPD9u2lsWRrI00GbFpuNqcadDhWbl76YeAEUJ7wxGi4BxYMIC0KhaH/f1cka7fmoR
         SX/njCxW+xWTUT8KShUAMFSQYw9s7WnNQQH15XydOpfti6+xh4HoYwZ6EOhpbJrHmf/l
         lTWF2euSt3qS9GWn5i8fHNK6AL9LGQfYcz122UE0BlpNlivBZ1Rv+dmTLh6KyuXt+aH8
         PzdcK9I/qFJKOypiRUos+vRmuO370RFsfK5TzpWj0Z6bYqyVJRo+0jNbiCbVNZnw7i+A
         6rEg==
X-Forwarded-Encrypted: i=1; AKwUvBwDOcgcjnf/B/Qg4bxepsBHXRyhzN32m4kbiqqNEtsR2dy72r7YQlUAsVvwrSkZfvMGHfXvJWBZhMiI@vger.kernel.org
X-Gm-Message-State: AFq9FYJJycn7dzBUsT+cp8IRvsAW/XTZ4bECcXokBwVfvYsBUoGdsESL
	tSsWmEXp1lUPBIxPO7SZZ60ghwsWjJB861tkuVypqLMfrnnwBecxV1e9CwuBs5/mXQY1fLKo0j5
	jx1vpiDNgAEtpXgWdaULPR/+ZkwCo4mw2R46rSshlZv6kcazfDNM3HQybF0EkrCwc
X-Gm-Gg: AYBFou0C1iSx2PPbH4BGTQ/PTNnzVLpC+vUxBnjxFJil5j1kXAufzBS3ih+WK1CoZ28
	0ngeTGGAYZ2JQXBly/V8+Uvm6OYKvsO/hwQrFoUGIdyKsxepK4EWMBXgVg0CCTZx0YsBEz+OfJW
	d6I3pjb/p6J5L5SEnfxOwdiVJOv1OLyw9/C5LYepIKeU0fFt5QCDjaDPgAlqZRV2GUvA6gNOCD+
	mygbDnpOSDPv20ci3ieon0tAFQ7i425h1jN17bgNHnm0JEdZ/Y9S6g1F89Yk2lGyuVLIMDVQzir
	wGU6a6C7UAfpraiqjc16VshnSQ1VhyoUVh7emWrUMuXjqv0z3euVU58ZeG4H/x0ZL2Zxy+Saokc
	rQWLdD92lJYJgaUOVfUR3VlH0B4oHpj2emhtDThb2A7TbyKT3JQVmB/aNvQPS+gWnj+DDdbY8r1
	Z+kJPSh9c3mB9Q
X-Received: by 2002:a05:6102:644a:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7ce5ccaae68mr2852910137.7.1793101026932;
        Tue, 27 Oct 2026 04:37:06 -0700 (PDT)
X-Received: by 2002:a05:6102:644a:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7ce5ccaae68mr2852880137.7.1793101026222;
        Tue, 27 Oct 2026 04:37:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a8930dsm2093206e87.46.2026.10.27.04.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:37:04 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:37:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 21/23] drm/msm: Support KMS backends without a display
 IRQ
Message-ID: <jmsh74ugfivd6ffwiqvofwnkkxnu5z67hqdei7jarhrftvkgac@hq2e5s2aj7fr>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-21-7cf014efdee1@oss.qualcomm.com>
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
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-21-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _0vDk4IW3t7Q-9IH7z9njurDW3yDVnv0
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae08ce3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=auR94sGctrba0TjZuGkA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: _0vDk4IW3t7Q-9IH7z9njurDW3yDVnv0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX0SeMV5JR9MCj
 F4C212Z4kSNcAT6j9v8yr8r0favU3Bs9g1QRYgZRqJfucWb9Vik0Fi8ArcMPhFNDBfUZAPUHMao
 FxtBgy4ry1GE+UPu7SzeYf9ef12FtxI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX1dZE1bZduKke
 4oOJENnhitnNJgnefRqgnIPfgv6NMvhu9q3EZnkdHeRgOOrwRp0olMfACdcAawY+9u+ArEombop
 RHeKG6JwmZrv2b9N4BoJsqSWNzgWdkYqiMV3K5ATyXiZCTHF+fL0jiOqSxc1hgVERBNYoUPTiqC
 2bodOvuL35eXlHrkIKxC1n9CA7/9a3aU+ClqHNCCxdeDZdtQzHIq360AetazJfwdlljLJHUSHv0
 tNlN6/+iKrhwo1601/J0bdlmZHKToQqjPsGeSdzSuPCEthz8GcpqgMXRAXriaaGqcBGZnpEY+Io
 x+BLSyMt+O+armIwNh0gMOIuIuMvimTfbDk+ANmWI3dLoHKPYl+QE1E/vWuwL9zIIALj55FofLI
 KgAtaSsW7mU9iOK5R0nn7afklqmIrJ7USlPW7qeKJapnBIvSdkZt1g0g22FG1wJoGiWdgrGq3mJ
 GtolIBQ4RMa24Wpvwsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270046

On Mon, Oct 26, 2026 at 11:51:31AM +0530, Jayant Shekhar wrote:
> Some MSM KMS backends receive display events through firmware or

Which ones?

> another transport and therefore have no host-visible display interrupt.
> Rejecting such a backend during common KMS initialization prevents
> it from using the MSM DRM framework.
> 
> Allow KMS backends to use IRQ_NOTCONNECTED. DCP receives VSYNC and
> frame-scan completion as asynchronous HFI events over VirtIO; its IPCC
> interrupt is reserved for power-notify acknowledgments. Existing
> IRQ-backed KMS implementations retain their current request and
> teardown flow.

With the commit message fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
