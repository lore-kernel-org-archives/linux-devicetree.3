Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1099338C2B8
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 11:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830722; cv=none; b=omJxIaTubxlzucZeAeqj+TyZ71uQPCIlm2GzbNsCqmvV6iPm22FDbnGsVavcTrH2m+eW3bR2ogHpbUs+iHh7gehPFoz8aMXOsS+MhkKHwOcuioBsFj2yF9kmFV481Wsp6jQ5+eRGwDeeoAcmLE4Z0VpfSXU1baJZ7ji4sIU/2ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830722; c=relaxed/simple;
	bh=gXOs7xyF3UoJeaY0FmlCNYsF0TUd74tf/YVDSRzzjfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUvvxZR338o+CouLNFDBWkxpC93G9QA04TnMbfAy7TQ70mJHAOuJEW4bpYYH/sHZEMlFOFpV0VlPisZ+/znJxa7SYypreo7U+2DQlLuKr4BoiTUqhBTRcuAyWXeZtu8/h3AV/XREkh3Y68Qn2s0k8mnY2h/QAdY5l6H8Ry1PNUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnMQ2Fjg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLlh2o3Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnMQ2Fjg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLlh2o3Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B0qfD4140990
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 11:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=enZ/tluXe8uhwFgBtqOA8N+V
	Y9yHa7VDeQa55KuB+cw=; b=MnMQ2FjgMuNjX5Uu9p8t/O2IquGVC5yZY91yGNYe
	/FyVopwZPPM7ZYdXJCxlqydZ+CAybJLh29dL1J2N6bDz8fGLM6ZEcvkH65ioWep6
	qZrdE4lNimODiXPHqPpzAXxic59PdHMZplSD6rd+EJQSzM1cSt6KlUprdOHftAZX
	0Upt/TiWddt3xeKIP8oTXSOfQ3mLxawvK1QF99plKHJdfkfYGbWeP9wSlMbpqLu3
	JIjK2XEVCHcbYOFxcrsFULF06M7MpLQAx5OuZNDa4RzJQ7uDMWfhDFr0xBH90wca
	zRzikH11wmSuDtFpOKab6sDgbhTzHosY6Os6B3xaWzNmNA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrbwy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 11:11:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963da2c73fdso1120556241.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 04:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780830716; x=1781435516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=enZ/tluXe8uhwFgBtqOA8N+VY9yHa7VDeQa55KuB+cw=;
        b=MLlh2o3Ym9MJg0WfxZ4pMqDqQinJzpksHJGX/p7yA4O/EFD4uehGHFMD+quvj+NtB8
         We3BQut9Z7rYPD31DAe/A1DROR1S3vblFqT3JuSrrWTmPXUfNRyxVHBVPWWLUJgSsgnc
         Bat+VFbAk8yhFVa9OJAv8KjYbxrIoEW7H+F5EN9a1CaYmQutyLZM6l16YHR8Lt0egnqy
         G81VQmvJXOVH2zbU5tzHVSmkaLHPEr8jXu9rs65L4S9j25bZqHI3Ehl/uw4haJLdwxED
         NsO6Abz5qhAf1uea5HJYn0JA933mJ66M0dv1eiQINd1OOUyottfJlJ+a+Iar6gqcnfIy
         B+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830716; x=1781435516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enZ/tluXe8uhwFgBtqOA8N+VY9yHa7VDeQa55KuB+cw=;
        b=bm0vbAirao+/0f29v1UL/axgPeE0kN02VfMMxL4b5vDSmRbCMfVoZrD/XpWE1meDJg
         hrpsn10ZkMD6M+TXQgeu/aKHmxZsUzZn3fLgdbxZof5qeSrY3USYQ8ijO7xj5k/3K1Ci
         fCK84vdDySfLZICUAqhf3Fq+zJpq0Opxx78TynJpNrT8SrPkNGNg+OSCPY8abAciZGO1
         kUMKqzysGBJXcVAyU6XX1GK2FUC7WO+VYNIENU6dpTfZKTc44MXsPcWQwiNi64hTXYIb
         4CWiF9vVfEYl7Cy793Bp9sa7UKgXiJ/0MsMZPsMn4JSci6yXUMaaWNEC5AMcPOPyZfK+
         jWqw==
X-Forwarded-Encrypted: i=1; AFNElJ9m01OloIH7bZmkLERh6iQpbcmzeE5lYZmzWw37pjSQUjBOrDxHZ2vki0Nra5wCYb9UQIp6maTxTbF3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf6MKkXtDACSQuap4BL6NAJcl0rnGevvyh6Bl22H+EpIpjx/k9
	1fUBJA/cJDXxmgJDNIJJwTpg6dHawaqSJPsFpU3dXkxqrHua4pXfh5IPtov3Qmo7Vkc/oEWbb76
	jtwtTdixyohuhVFmdhG9985tzX+qhpggGry8Kjh1HRYKCCqe+W5EPWYi9t1Lx1n3W
X-Gm-Gg: Acq92OHJRw24PgJ7eB0FDYX2T5wK93OaWgzj0OV1GpTgpsfpDIqDa2TPxMdi5QwXQlu
	VV2q6wLBygFaflFw0GzA80CFxJHJTg2wgF0mICcNHKRQve9mKaGen5b0ehc1FRo6/QWQK1ZcpFk
	cY4OyYPKSpu7XtuYxv+IWsWrMsSI1M0Homj6vdoRJbIh4T9AYKH0BzuHeW/AkgSvbyD7belfst/
	SEnOw0XuhAGyOGpPv3oPE7H/6TVmGdUha2eKLlSbOkdq+zespacbXq8TfaYCrR48u3G3GN/eH6U
	D06KMyq1CABBQzA2C18UTXRgwnBm/ifB6brIGCkaeUfd0dM4Fu0eTt6Vm8TKviq985ZfEnHDba1
	pW+mGnxWd778KTLSAATPD3/9gDqemkEMoMDDG/M3SyVcpe7z86YEAuExOfhdXcfsPzos8Rt9LmP
	Xaf1o3NszgkAO/4MuN8toIscF/ulA5KxOZhBeFV0GqdVZ0sw==
X-Received: by 2002:a05:6102:e0d:b0:6c8:aed:ca95 with SMTP id ada2fe7eead31-6fef3bf72dcmr5306228137.13.1780830716284;
        Sun, 07 Jun 2026 04:11:56 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:6c8:aed:ca95 with SMTP id ada2fe7eead31-6fef3bf72dcmr5306218137.13.1780830715882;
        Sun, 07 Jun 2026 04:11:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b986c42sm3011518e87.58.2026.06.07.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:11:54 -0700 (PDT)
Date: Sun, 7 Jun 2026 14:11:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <oibdoesblpjvwovevtrmwdbmeci572bofr5oxsww5xepzgl24t@gws54xvpxbhx>
References: <20260519125655.23796-1-blfizzyy@gmail.com>
 <20260519125655.23796-4-blfizzyy@gmail.com>
 <ny26r5a2npafcryx4z2xoyzkdbp6r5vbdoc6asyfprw5q4hgzh@ukbc7kfpzsle>
 <aiVOZDqBGq_hal75@page.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiVOZDqBGq_hal75@page.local>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwOSBTYWx0ZWRfXywUyWLi5bGgl
 SfQ+tiJ5X/tPt+ryEA0mRCIGskI8olo6RDReip4DByudLzLZP130mD0T9NxVOsjcgYkEXQpu2bI
 gZC4sTaP8Hi9AI01z+kHaq8D4PxIH9+0H93X6FWx1hwGeQjY3emG3TTzIvlEGBX7oM0tcl9WTEv
 qWr0poJYFbQ779Mmaq7J84Mu7vwu5uHI2BOppoet7l6z5J1fodKVGsfckAIdXvRfYqaRa8aCC6D
 akteLbKcmt1riuE38dVNhgLZ8XDpIbbLO2jEmD2KXD3e9hHcKO7MzMpG7zWQw0bmLfdlKLpBIq0
 U+++TNjXRM0ZeWdsdF7SOHsnhBDzKWan4zaazYHfMNUf6HqTuTONwt4pBdGXaPJgTXraUYafkv7
 qDrbAr8s1deumFwNU9hybP+eqOOEXCFkOL60gxLlZxbkxaKP+OteD7VMw8KFnN2SvxquuevdMcT
 26kgvbwbiDCXZL4QzFQ==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a2551fd cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=dKimQ99n0vQM2SySGJAA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: hAqQXSksgiANxy4diQGGxeu8mUAqLevr
X-Proofpoint-GUID: hAqQXSksgiANxy4diQGGxeu8mUAqLevr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070109

On Sun, Jun 07, 2026 at 04:30:10PM +0530, Ajit Singh wrote:
> On Sun, Jun 07, 2026 at 01:17:43PM +0530, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 06:26:55PM +0530, Ajit Singh wrote:
> Thanks for the review.
> > > Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> > > QCS6490 SoC.
> > > 
> > > This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> > > support along with regulators.
> > > 
> > > Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile             |    1 +
> > >  .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1025 +++++++++++++++++
> > >  2 files changed, 1026 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
> > > 
> > > +
> > > +&pcie0_clkreq_n {
> > > +	bias-pull-up;
> > > +	drive-strength = <2>;
> > > +};
> > 
> > Could you please add a /* pinctrl */ comment at the end of the file and
> > group all pinctrl-related changes after it?
> > 
> Ack
> > > +
> > > +
> > > +&uart5 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&ufs_mem_hc {
> > > +	/delete-property/ qcom,ice;
> > 
> > This should be explained in the commit message.
> > 
> Ack, I will explain this in the commit message.
> 
> ICE is kept disabled because enabling it currently triggers an SError
> during qcom_ice_create() on this board. I am keeping ICE disabled for the
> initial board support.
> > > +
> > > +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> > > +	vcc-supply = <&vreg_l7b_2p96>;
> > > +	vcc-max-microamp = <800000>;
> > > +	vccq-supply = <&vreg_l9b_1p2>;
> > > +	vccq-max-microamp = <900000>;
> > > +	vccq2-supply = <&vreg_l9b_1p2>;
> > > +	vccq2-max-microamp = <900000>;
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_2 {
> > > +	dr_mode = "host";
> > 
> > Is it actually host-only?
> > 
> Yes, this is routed to a USB hub which exposes two USB-A host ports. The board
> does not use this port for OTG or device mode.

Comment it, please.

> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
