Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437B23B6359
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866192; cv=none; b=O/dYkzh4C+KKXiXHN+dDV1Frfr6usxtAqdVvzVcOwH21pWFdEcb/2dXDEUD4h5MiXhYEwKCCDXvMpVFwxh3rOIOffGpVx76+XX3yJiJ2qfVltPxLxuReq7TAymyAQx3jkDXzCnwuxFSYGPLeNp9452C0Lfn3hvFcMJbwl+JItXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866192; c=relaxed/simple;
	bh=iyxZrlzp0jx/IPG7Ev8OUWWGOeYI1hFdF8mm+vFbR7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XwqO0e/86l8zPGwY5PDRV/A6mbf4JgJRBxJ+pl9E5pY8fYS1dny6w8EG+PIa0x6m8h9egWmoXSuzsQaDpLgr4pe/heRGJoWIuu6axie74p95WKgZBf81p7hGkCaPWtsXW54Cp1PlBEevO4VEXbkLhjd0p7+vy+AJI2WcqH1qsKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R08ORIwU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JrJvZlig; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R08ORIwU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JrJvZlig"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjJPl2830103
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 14:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iyxZrlzp0jx/IPG7Ev8OUWWGOeYI1hFdF8mm+vFbR7M=; b=R08ORIwUBuSkCwrw
	JNNgQPlVVHiTPZVJqaMXvLsAhyyaSkzqqH5fyz7mt55dZnS3Sf/OStHAqXfX1890
	MIkB2hLnhhVKgIxkQLfwrQQonEhObFok3tIHDkw3OQYOJ6TkA+9CPJcVQWcTRL/J
	NUzvHu+z0WPh8wVibUezffAQPG6HZMtbkEIIK6T/cpD5JjGbcZyqOm1FJ27D/swb
	S15m5/gCVSah9+nzCGn8D0RO4OPWsk68IcqaFj7CGxQWXZDDqAE0A5DM2VoB5Oat
	kubNWdmxlIc4Q5kq1N//t5t7YArYiqZvu69p4C7o/EJn38BgnijGhTr5vlcCLI0c
	bYy0cQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5bgs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 14:49:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc51591102fso4751819a12.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790866188; x=1791470988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyxZrlzp0jx/IPG7Ev8OUWWGOeYI1hFdF8mm+vFbR7M=;
        b=JrJvZligJD9SdrB69xBEeEvJUdylRhRWdEfX/fa8xNvOEvoG9+fCMSOc/MVXJZWMCU
         nBCs/5ztWMROwgUwn3L7qFY4sejhLSLYfFAhPti7RtEKDOsh4+FOh4b2o51iHiHYLLjs
         GF6BuWinZ3e1v+bYs4v78TcfGIYjmfWpbOHEPjycXzWiwECG2o1gK0pi/hIpjlp/2Fai
         N/FxhjvX0UUfHHLMDChy/KoMxetYMgfoTgl6VUNZB+XrcSzDvF8s+rTlihiGgpq/+0uf
         6TgJbxIK3p33hQOL1FvsUV0souXpPAMonRbWT7cnaG4uXYk4Im5SWulOluBtNdLERoAT
         C7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866188; x=1791470988;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyxZrlzp0jx/IPG7Ev8OUWWGOeYI1hFdF8mm+vFbR7M=;
        b=PLSOrm7+fMQWtJk94YtM1Tp7fIlSRUsPWKWtBxeWjckEceowDlKl6foDMORE4o+4gV
         Yf7F0CwfNCKHQ0YkqqPtUxtt/xJDjGp3vbmEmvUqlM8K1LOVJHJRgxqQEco9LNFXmBq7
         pvHY+gFOovh2nF8AAQ9zYYPlCMTy2aKslC9jraJsP+npU7w7VBygYELKLbtaCcV+iWN8
         XAOA+cfUJUWj/jTC9JXSlp4s37d7HOou29iYfERqI4H2DGBJBdPA+PBEbaLifX8ELOje
         xjpCxvCJk/6D3S6QZsBv7uK086Em9ewkgGptKrTMqsntKGRIiR3a1/SFYhvH8VAaw9zL
         psQg==
X-Gm-Message-State: AFq9FYLuYbfvv/BeTJ2N2cJj7JL/CkDtEQ2N19kNw6MY+KV+HzftyEEV
	VtVfLWAL/xn4LSQ+l8tgW630B1XZDZMvMkEKcnRLpp3WoPWZzicknCFb9hCct/NZg5rcAKPmINh
	vEK6XsbOiBamb/ok3zvzCPMKw0tn7BRfZ5a6gxT6+JbZljVUA49AYlwVlQN10ZHF/
X-Gm-Gg: AYBFou3ewIP704I+zVMoUWfYh9hwiHJggLDYgdDdEQyLMSYKThvlk3OY3pnea2SkaAs
	2AFqSIohCV+4WGn/zDfuUKnPwn7fOVcVYMMGX9ZM8qGwYqG9YC6vAJEH1eUl0J5nEqLQVS2QXKJ
	AtCnzWn4X66wZkZ1cLDitIlF0xETIlybQ9XCJM7Ky2h5a/RVUG8+nzoS9mC5LwZyGoPZXvg29Ny
	CPBR0puuDhbs6jJwzq2SmosXrbj1i/dqTx01ySLYy0N1a7l9UMqMx+1a5oP/G5DFBGBNu9LYHfS
	m6WuzePieV4FvdjJ51IAZnTE4bKs071Dlkblu13ojEoZEPVw7YQtNNm/hMT2LknMfpFYqk56q/a
	oin9WamlETXeGL3kddkDCM9elrO/270gmIBqw
X-Received: by 2002:a17:902:e952:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2e2e491a20amr39183095ad.8.1790866187635;
        Thu, 01 Oct 2026 07:49:47 -0700 (PDT)
X-Received: by 2002:a17:902:e952:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2e2e491a20amr39182905ad.8.1790866187043;
        Thu, 01 Oct 2026 07:49:47 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30099c812sm12254495ad.15.2026.10.01.07.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:49:46 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
Date: Thu,  1 Oct 2026 20:19:43 +0530
Message-Id: <20261001144943.2452467-1-vishnu.santhosh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921030315.BDF9B1F000FF@smtp.kernel.org>
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com> <20260920-qcom-bam-dmux-vmid-ext-v2-2-ef5ca2178378@oss.qualcomm.com> <20260921030315.BDF9B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K44wI6Hu9Kizl2HKFs377Qblx1xNNt9K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1OSBTYWx0ZWRfX+I10j4ZV452T
 lgOZh5IpxVjjFwXCrScEAURULrtQzOprRgFLJiGmMZxDOl0lQd5qXe0DnpxMvEiTz+A/m8sxOld
 9ZAnCzbcPnUkOEZDnwhXwtU2/i+yk5k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1OSBTYWx0ZWRfXxt3Cks7dx+xV
 JOlAMNgXoEjJb/r7qUETnsyzQwc85CA6bmXtRcsPXOQBk6zUms0e1jCU3x9rVBWfpRceSR7+JfE
 Ud1of2XOW7oGtRhIW806LscPL6QWLs70Yb5q3wlXBjETiLkXrTy8ocw4wTKFNAXaTjd5+R9AOHT
 ABb5oGbAcaRtW4Q+SytXw1rRthWlQJAxmaFYh546hIPislsq8xgKlDugVybBSVaT3mZrdaPQEXK
 JhL1C6HKYkDQtz1Kj3s1b3DipOXREJhIzcj4LQZ4FRetHnt71UfbzedM/fBdMj1Uthqzgleqq5d
 aevAjCwXHAlcS9+fEXykI1/jSv+mBwfbNeeRmQq65Tt/yMk5+Rsb4RJ9gdf5DVG5sJAweWhjmmA
 7ydAvTem23le7cyMI1+BB5M45Ubgb0FoxA4NwLOP8LBgwz05qHtYu5k+eu1Y0NdbR8jCdZxpsb4
 AYx/n5GpayOxM1d7OAQ==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe730c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=-q9WlQo1SLIOr74ThTwA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: K44wI6Hu9Kizl2HKFs377Qblx1xNNt9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010059

> If probe fails late (for example, if irq_get_irqchip_state() returns an
> error), the code jumps to the err_disable_pm label. At this point, the
> pc_irq has already been requested via devm_request_threaded_irq() and
> is active.
>
> If the remote processor triggers this interrupt, the threaded handler
> (bam_dmux_pc_irq) could be executing bam_dmux_power_on() while we are
> calling bam_dmux_reclaim_dma_pool().
>
> This concurrent execution would cause the DMA pool to be reclaimed
> while the BAM DMA controller is actively using it, resulting in a system
> crash. Furthermore, when devres eventually frees the IRQ, any DMA
> channels or mappings allocated by the racing handler would leak because
> bam_dmux_power_off() is not called in this error path.

Agreed, the late error path should tear down everything the PC IRQ may
already have set up. I plan to reuse bam_dmux_remove() for this, which
disables the IRQ and releases the DMA channels, mappings and any
registered netdevs before reclaiming the pool, in the same order as a
regular remove. I will test this and include it in the next revision.

Thanks,
Vishnu
