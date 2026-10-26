Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009877;
	b=cGy4BP3Dkhnv+c6QOjqJQggGAxXN2byxsOgLTVdNbdhRbVHlLK5/pg8GVbKePMEOrLsH
	 w1gBLkojZVLyJbRpj5e6biVhWmstFNOjeqE2evOwqB8IAlSv6ZehCReSnzPPXTWZ2rKCX
	 Ng0X3HNp6d0hHvQ+oksfym6D4Aq5PwvA0iik5nhQEWtTKgb+2mZE8PLfYKBby8wgKzsfb
	 dtqx0eU0OopKRSbBN5+GKlBN1bn0/Tc1dyrn+0yMYMnI0nhjG1Geg+8q3Kr3Ma2dcY34z
	 1CvtAzeTdHq96nrGx2U12p+auj6Pv53xlSrO+JySDW6yL8oaZGM8qdlaz7A4z/jKFuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=78XFvnCPVHn0LabnIkSaSmfw7iCeIi7jK9513VDUmZ0=;
	b=ckIVPUgFZN6iMATlGUv9DSENh2oZajqCToQcvUVLq+sQFSeigGDUUSI5KgBeEcp0AsE9
	 LUNhiOkb8H4QkJmCAhp0fbxqUaTbGxSRUDuwQCaLWmF4zalMLxtrjsWJBBM7lMyfrbfbj
	 CbyAP0G/E8AqKMriac6g+W64y/O4+I0kjWvDhYihE/2CavQg+rMWYl/rPdmw0PZnrEx1S
	 4Df0l3bvRMsiC5v6Fh4f7Yz92roiBBqEbOBpLqOf6XKYMnskOnfhL+vJHWjaJKq6SEUDK
	 Iwn3vuWnS1/JwlHtl2th+3A12OaO6fj5DlZ+HDaSE+RoZCJhQ1bXlHaVN6pWytR6q8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dSx13RSA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KUBWnrJo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAD8606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DAD8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dSx13RSA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KUBWnrJo
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bKJC2206725
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=78XFvnCPVHn0LabnIkSaSmfw
	7iCeIi7jK9513VDUmZ0=; b=dSx13RSAlAAD4EUSzR9AAOMLfIHAGtEyMLOfHTRS
	pN1Vr8xV5aPEqcZmnOE3vw7Xw9+63iVXiEiPsBrFbnxmiJwqMyMPdo/DqFUzAqr8
	RFjb/wlh3sKurhr2fnnUukWrR3BZhHqQ6XmUmStb8r82aNvCS/EiKDAI0q/nGBuc
	ZpksdOnmhTL6RGYy2D8KTRlt85jKkJcXOjJlVwUsZmrGJK03ka8ft6g80aQJRAlM
	H0Uquj7iyHtk8J6zPfdK47S6h2LwhINz8FAes8aYQWRTbDKcJDFZcoXeqZIbKY+c
	nhWGRw78uQYZcMREksvGT+NUr0ZnHfX7P86zYTo0o7/STA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunw4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:17:55 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ec17386b57so2943358e0c.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009875; x=1793614675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78XFvnCPVHn0LabnIkSaSmfw7iCeIi7jK9513VDUmZ0=;
        b=KUBWnrJoZ2+GAYbUzhOAcOheUGlYn9ERCmfYzKVaG/djJbOSGTKbot0fg+EhlL64G6
         xwrBrq52sdWF3ywP7RtZ8ahYdYpRTDPtrPei4nSGC7bUimnOcLHwxB9Cawi6hExPoY60
         RwnkEqS/UySqXjg4bAb+OBqusISzDluS/hwavC/ShMdxgVLWrwV+/xcBaBWqKwNVSxmj
         ILhcnSsdX4fFS1nA8moprNbWegg4DUd93+Bu1PgGOCmyRM3H1MGCXACPGBhp4eJWvkt/
         XPOJdSgPg9Z1JEuuORk6zUMkJEGu/h3aoBMz7yICCsu1LdwTzIrfDek/6nTghXy+fiOr
         /ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009875; x=1793614675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78XFvnCPVHn0LabnIkSaSmfw7iCeIi7jK9513VDUmZ0=;
        b=2eaPH2LsjytfWSYKS8tsDEHd7klyiFzD2czRnB9H86dq+vfamlACROA+sK9jH7kla5
         wBqs4HXGbkKQxcwYIhmiQkwNJ3gfY2DtktcNj/AHNGiTv5y4YgutNYfweo64liEMO67Z
         2fI56A0mLDtVcFErw0PQLFscPhsEqspCguTrSC9flhSZISWtZnOpzIrjldCZHHFafHsN
         CezjefpB6AKvapBhdXgjVtqPOUuHbv+cYKQQ92uF6MqzEVEb9PEvusRoF4z1G1z+pj4j
         jMdO4p5KUXHJJMVa3vSiUIpi9HQil7aN/kd9lEaNbeFcVHDZQpHnurc1WuU97VEGyPlj
         Z+OQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7NgbEdQ11/kTGKcbMEjG7bK4URYuBLpPHxt4RPyp8fulnUos1j/6LcXO20cOPGxpXcHIbbB3u7/EB@vger.kernel.org
X-Gm-Message-State: AFq9FYJLnV7ncinRBRZsbIsplmejL+/hOJiQS0iCCLZqHPMZocYadnC/
	noGlN9IDKYCaXDU7BKHD2IzYCvDF+bUsTmWGTo9I7CidRK4rq6dM6tIGYdEEMqo4GexqxUBFfWk
	S9tU6PsFIjZDaBkSIchyHMhf/Xc9Dtnr66iAp5ZBAI96o1MSz+jwdqa92nIKPgmGf
X-Gm-Gg: AYBFou1OcmrPuZZyt7Sm3zC0LyYA+uCn/et4bAXlSVeZE49EEv1NX/1rSg/E9924SMW
	J+yqQQ1rX8fJqhCdTPLowrV5Jpb0Ewf4hjE1w3PFj0JB2xTvMpW9snAkdvTtJi9GwbNLDPFchYz
	BhXHLV98pGZ7m/MJtXW9ePQaAAlw8QLCj2yf/g7lb5U6AWbNC/40YZMGN+Q7PbabiM4d1JV72Lb
	XhnBeZdrZOmoIWHCH5bE9B8E9CHf4S5P1oPwSV3iUQvVKeZMLuAlMP/yzkwdGrajYUXRGRcn35v
	DH4ZhkiO3nRO4y/r35MFOFSf4HXj3fAz40qRs//iL2CT074QgzURkSCxsulV07x8KNSxR3kxDBQ
	qje0yg2JrZ/9+lv2OCDZqRbYk8XkhsYkvMf2M5vkDwohqpIyLdvWbWblDQ5LQNcpYysbmne4cg7
	+DvS//3BnrCWLF
X-Received: by 2002:a05:6122:130e:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ec23319c0amr2162225e0c.21.1793009874680;
        Mon, 26 Oct 2026 03:17:54 -0700 (PDT)
X-Received: by 2002:a05:6122:130e:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ec23319c0amr2162205e0c.21.1793009874219;
        Mon, 26 Oct 2026 03:17:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d0606sm17076351fa.14.2026.10.26.03.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:17:53 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:17:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 06/13] drm/msm/dcp: Add planes, CRTCs, and HFI event
 routing
Message-ID: <rdaviyavkytkblgqjqp334mtluji4t6ybron73wm3uv5hdbvjf@5uxq5hb4fclw>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-6-48aad0fe4f72@oss.qualcomm.com>
 <x2ppnksfdan6yehawencv53qttcxznr367iuaw3ltwttkoffkx@ccrzx7alvdpm>
 <7ea3f000-086c-49d2-8409-04d5aa6e9ded@oss.qualcomm.com>
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
In-Reply-To: <7ea3f000-086c-49d2-8409-04d5aa6e9ded@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX0OnVNgWv08FI
 4I5SDXBsQdE4LTCpvBEAfYYqRtiH8pmWKx60i/IYCYFsTAc8RJLpHev37IxraDlErSXOeyBtLbK
 CooW0yr2jaMu1qK5SymAZGuRF8qgXOkSV5c8lXxDKB/tqM8NXJcMPJ4i+HKvEppMu96ixDbpT40
 0D7wJm0g3CAYBoFptJZJu05swOWCi+L1PR414hUfR6yk7CFCJqqsi9luC9FYiWdRYhHPasieyP5
 /BTXuuBF+o3bjNE2M8YMrVGdePRbDQAdlnuoSYgALr6//uKgRWHLrNIB7nw0fI57J9LYvE+JaBH
 oCFbOKCZj/pdj42soO5gRO6Rl1suD4TIunRnBSv70W9HMOnRUdfZOEj0gefQdAVPbm3kuGlLJUk
 IpTmimG0sC4WoiB9X9ju0speMaeXWwZFGlIXdXC4RqzlrLcGYQK7BJ10zIr1YsE5xzaFtcgiVXS
 /LSh1hfKsMtFA7wC67Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX/QcXmNdiFrAV
 s84hx5Ci1gCM47KoLixHw+9oG7TcoFMfywgnVL1BE0cHc/o0DlDOcUTlJJqxCP0u6/IUjr9BsAM
 kVMGnvlZYw/nf7+GuCEGCP9ye8JNXVo=
X-Proofpoint-ORIG-GUID: FN1J9nVxG2QXiZqXf-iKKFjeRs9jbXfQ
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf28d3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_9fECkkFWEdeBB18FusA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: FN1J9nVxG2QXiZqXf-iKKFjeRs9jbXfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260040

On Fri, Oct 23, 2026 at 12:41:15PM +0530, Jayant Shekhar wrote:
> 
> On 15-10-2026 18:48, Dmitry Baryshkov wrote:
> > On Thu, Oct 15, 2026 at 01:08:26PM +0530, Jayant Shekhar wrote:
> > > The firmware-owned DCP pipeline still needs normal DRM atomic objects and
> > > event handling so it can participate in the MSM DRM device.
> > > 
> > > Add DCP plane and CRTC objects, validate framebuffer and plane state,
> > > allocate firmware display pipes, calculate bandwidth and clock votes, and
> > > translate visible planes and CRTC state into HFI commands. Route VSYNC and
> > > frame-scan completion events back to DRM and retain CRTC-local display
> > > session state.
> > > 
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > Assisted-by: LLM
> > > ---
> > >   drivers/gpu/drm/msm/Makefile           |    3 +
> > >   drivers/gpu/drm/msm/dcp/dcp_crtc.c     |  733 ++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dcp/dcp_crtc.h     |  104 ++++
> > >   drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c  |   27 +
> > >   drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h  |   49 ++
> > >   drivers/gpu/drm/msm/dcp/dcp_hfi.h      |    2 +
> > >   drivers/gpu/drm/msm/dcp/dcp_hfi_core.c |   21 +
> > >   drivers/gpu/drm/msm/dcp/dcp_plane.c    | 1073 ++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dcp/dcp_plane.h    |   60 ++
> > >   9 files changed, 2072 insertions(+)
> > > 

> > > *p++ = lid;
> > > +	for (i = 0; i < HFI_MAX_PLANES; i++)
> > > +		*p++ = lower_32_bits(iova[i]);
> > > +	for (i = 0; i < HFI_MAX_PLANES; i++)
> > > +		*p++ = upper_32_bits(iova[i]);
> > Who has invented this? Splitting addresses into two distinct arrays.
> > 
> 
> The field order is defined by the firmware HFI ABI, not chosen by the
> driver. struct hfi_plane_buff defines the wire layout as:
> 
> u32 addr_l[HFI_MAX_PLANES];
> u32 addr_h[HFI_MAX_PLANES];
> ..

can it be fixed before it is landed? If somebody made a strange decision
it doesn't mean that it can't be changed.


-- 
With best wishes
Dmitry
