Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FA85616CB
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874092; cv=none; b=fnjF7Z0CFgNSB2O3sB3D5WxOaa0uLcmxN5rDa/qbxH+sJWbVQAHNQVgCCmuqofDdXeNaSNTyC+SF2fhsX3I7Zr9kBqBWEQmzH2pBJwMAqE2iuhQvf/Jp9CsK/744kVnfU/dfFzeeBe7JTkG7kmwNrSPcp5j/Y3AQRnxjIA6T9mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874092; c=relaxed/simple;
	bh=e8BuZAhC+MLAr3dIChDONBH6Nn9xUIL3CVxsjkAI9pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThhfDSwATcV73f1xQFdBCZgf4WpbwRXH7Xwt3fOTO2VC9U5tV7rFxi8F56iccKaQXp0zqnLk1MnpgnFd4uLnduVnc/K08xFI3LN4FWqp1CVKRVlTq/0FGA3mqh565IAQURnOwvAv9nVExpubufbeay1gEUPdjl2GlDf3Dft7hCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHktZt23; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgsC+tkl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHktZt23";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgsC+tkl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ClRnD3014824
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 13:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xVBfE4bB6UBnPqaf4fcSGOt+
	V0oC9kKvBZySwiRwwVs=; b=KHktZt23Nu/EUKMhStOdFK/SatUoUuxEpdqpXY5e
	4UmrF5lo/Z2FvxKvsbUjbPstOQcuAv13/9v1KxWUAPxt6pD0nAcChhOPzfDisAKo
	lOfOMqKhyz6bv8YYbYChggjfN3Ri1/HwXhoCWAIji3FHwwyikwKlJILMHVLQksfn
	AIOFywXG3OK7+yDirBlNOA5YIUUInadxAlgUmRP+C1VEfFfCeY+2uVJMEO/aKjUF
	zgNnKfBCrKW3xEivxg/W3vRQ09TUCA3sJDycWc+25erxNkMsVYVaQ3S3VaiPH7jt
	HsLoF90GzWry+XB4WtkT8tVFt4PiNuUmZgeEdjHOeTpUcw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwkn1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 13:27:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78d25a8ff32so253832137.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788874076; x=1789478876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xVBfE4bB6UBnPqaf4fcSGOt+V0oC9kKvBZySwiRwwVs=;
        b=dgsC+tklxaOovxqcRSWihGHf6DBEG9AO+XFLHw7Rs+Q8AMzq4wSJ77GUW9lfZRhwk5
         sSHHizrNJiMmAGQfyH8QUj7UYqm6fA/oFw3rSx2Exd655wy5WlPY/83ftpgWycQx8zt7
         ERyjajksIw8le/A6qfcegc5BsDlx04GUWhzUwPq12NFz37wrdSIW8KLDKryKOSBy+rEx
         EwK9IJwcHr4Pty1mbC+3KEB522LIMhdaTLEAuRsNu4R3R8A35HbhT9Xnx2gWTCOiLp1F
         qGIZSK+yX9yjDL9ns/arS3unIG8++5ABCmz9sUG1ZTlUxSeyIE3wCfxpBTTGJzx00Xur
         F/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874076; x=1789478876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVBfE4bB6UBnPqaf4fcSGOt+V0oC9kKvBZySwiRwwVs=;
        b=P4aHcJ1N8Q/bsSuu5e7s4pzrelkeSdBK8NPgf68DXzr3aWoPgnxaasjYP4h6VrbfSI
         yqsnLEtVXHIebnDPFJnl6IZ1YCvzy3ycwubKjSlE2jNbjuu83rxKRHp/pr8Viz4Zg3NB
         fIeQQgH6BLwc+j49gFydC8tOafKJCa1jQJqi07J5QWM19Ztq5Br1v8aue1Za4qeIjyEW
         eM8EO/DrCcPK4GVeG5fTgIesbugZ8e+lfaOgL2H7qUPyIhjMTcvwe9Qal+jxbgyZ4oHK
         u1F0kO3mIoHqVdZD7AqcBtoXRKZog5F0Nm1VZARct/lkBmeZVlLCC9WGdudkwt15UcCS
         6x+w==
X-Forwarded-Encrypted: i=1; AKwUvBwtN+au6jN/q/48t5z0hfR1DE3aj6tnaAuv+2Y3V+fCAnhmUQJ4J1Ef5wGGbizCamrceZTT+PpUIf9C@vger.kernel.org
X-Gm-Message-State: AFuF++lYnlRRRhMrmfbnxYG2xww22QYrT6VzaLVzgbVlQTqT7iGVOnp6
	E0zhaHfzC6e/HMl5KZHCkYE6uNYoBszEqyuRQWepWPU0x9bAFmLSLbRkFHccaKFsfxFgrjGScOe
	jG+jQ83EaXpjyOEUPuK3bJhfA8h9S7vfZbpYioBOm7gpjE6oObYr2iNhPI7z0u1QI9UqvUP7E
X-Gm-Gg: AYBFou1fnL+ZCGacypDJhSxMFzioW33ze7VEsaa4aJspvUZMuko7jZav3ULWjCTZswg
	yFDeEibIrBJgWlwIlbobN8B6tA8p7uhjVVXXVsY1Xtmyk1GYaoP08hVXD6Rrjt3VINx0l4oLJVx
	WvPza/W9HCJDREi4S/LA8o82uPzUf5dMC95iL3F1cwFEsM5E47r/307YVAWQBgjs7NHuh+MXVCz
	WzA+WWl7I7URBs/u2Miw/jic/xnTRSd0OVOWC7kgk1xK8GLGd5Ypn3lR8oAkKfm4ub3GWDf6BJi
	nCB06rxQtvaQ0jTIigG5qdwqjagjMDp3ODqe/rnb01P6HFEzkf20eF2yqiFLczwt1kvm2e7nqYu
	CcXb2qOu2zEYVf7udySv+Mg9AjX3rNvS8MRL7d0yeFyfiT2+Zl8kqqiQ6/g9lBOUZd5gUrAt76+
	56LAVbWBEGrjei
X-Received: by 2002:a05:6102:554a:b0:780:5605:743f with SMTP id ada2fe7eead31-78a4a8bb311mr10294381137.3.1788874075908;
        Tue, 08 Sep 2026 06:27:55 -0700 (PDT)
X-Received: by 2002:a05:6102:554a:b0:780:5605:743f with SMTP id ada2fe7eead31-78a4a8bb311mr10294352137.3.1788874075438;
        Tue, 08 Sep 2026 06:27:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74cbfdfd7sm2572414e87.75.2026.09.08.06.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:27:54 -0700 (PDT)
Date: Tue, 8 Sep 2026 16:27:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/12] iommu: qcom_iommu: support non-TZ-managed instances
Message-ID: <a2fy6smhao73nr4od6wo443622ym5exlj6qp4nb6wdfzgx7nkb@35a3nyftkhur>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-6-87f5cd492560@oss.qualcomm.com>
 <08bc7c0c-4e15-4e76-8ed0-34dbee36a6ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08bc7c0c-4e15-4e76-8ed0-34dbee36a6ce@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6aa00d5c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=JrPXT6BsTxOl0o4Vz8AA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0NCBTYWx0ZWRfX/QMQ1qwjELt8
 M1S1byJhgG2jepzcnjSs18OJYpPm8C++okQKEqmwJqQGNCDtZkT1Uu6LHz2NVVodwgAAFg9J18I
 YYQtJX9/NF4Fkd0GdPgAX5FS9yb4ejW5PSh+a8Q6JsPVSHbHgKAbUxJJL35aoG105xLQGllyUDB
 bTpenBTtKuyCH13roSsQvTOEkA3BU76OTq1EQ8cOh8CJ9p9ya4DX/N6SxpO3xZn4pMyx6ObeUez
 Yyy1DxN+RMa/5D5Xz644TIfzuJDNZAUDrDcbCiY0moIUVSHOWGBq127wK4a1plsvGrJttVX91tg
 DDiKNq3u3U8hsomwKdSQhHkNxs+lZxz+rzyGCnMyjY30KLQ5IYZovFHhs0C0F2HAHsj/kS7sW4k
 1OOlBcfUC2SRr2w3JhYm3z2uNjS5vmeewM07o8oHPv1o0RTrPL6YuLz8DVF4f7PtKS4AY6q8nEn
 37t/qsZUndZ0WNN5TqA==
X-Proofpoint-ORIG-GUID: Vt5qoMO9TWQzaHZLQ-fDkjnUaYE8P_jK
X-Proofpoint-GUID: Vt5qoMO9TWQzaHZLQ-fDkjnUaYE8P_jK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0NCBTYWx0ZWRfX4RDhXti+T8EJ
 ZBxewa2/WWF0100jh8cx0hRT1gFhtcp6KRLKdB4eOLEJPfPSbhzEo/+ULHV/8nmzIggoItUDJrs
 riSb9r8PFdHLkpJaxUXHvRoWuR8wbhs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080144

On Mon, Aug 17, 2026 at 01:40:43PM +0200, Konrad Dybcio wrote:
> On 8/9/26 10:15 PM, Dmitry Baryshkov wrote:
> > The GPU on MSM8974 has never been usable upstream because its IOMMU
> > cannot be driven: unlike the MSM8916-style instances this driver
> > supports, where the secure world owns the SMMU global register space
> > and the OS programs just the context banks after a restore_sec_cfg SCM
> > call, the MSM8974 GPU IOMMU is not managed by TZ at all. Nobody sets
> > up its stream mapping, so attaching a domain leaves every transaction
> > unmatched and the GPU faults on its first memory access. Verified on
> > the APQ8074 dragonboard: restore_sec_cfg is only accepted for the
> > secured instances, while the GPU instance exposes its ID registers to
> > the OS (IDR0 0x78034404 / IDR1 0x10000003).
> > 
> > Add a non-secure programming mode, derived from the downstream
> > msm_iommu-v1.c driver. When qcom,iommu-secure-id is absent, reset and
> > program the global space at runtime resume instead of calling into TZ:
> > clear sACR/sCR2 and the global fault state, invalidate the TLB and all
> > SMRs, install the per-instance stream mapping (SMR/S2CR/CBAR, with the
> > downstream MEMATTR/NSCFG/VMID/IRPTNDX values) and enable the SMMU with
> > fault reporting enabled and stalling disabled (sCR0.STALLD, matching
> > the downstream terminate model). The stream ID map is per-instance
> > configuration data since it is not discoverable from the hardware; the
> > SMR index allocation keeps ASID == context bank index, which this
> > hardware requires (downstream msm-3.10 commit 4d92ea10aac3 ("iommu:
> > msm: Use CB index as ASID")). Also set CB_ACTLR to redirect cacheable
> > requests to the L2 slave port, as the downstream driver does for every
> > context on this IP generation - on MSM8916 TZ owns CB_ACTLR, so the
> > driver never needed to touch it before.
> 
> At this point, would it make more sense to retrofit this atop
> arm-smmu-qcom.c given all of the differences vs 8916?

I'll take a look.

-- 
With best wishes
Dmitry
