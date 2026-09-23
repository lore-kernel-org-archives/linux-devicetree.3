Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426C75383CE
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172206; cv=none; b=F6niKnwvrGPdk15JDWm9/RwQ+Dpyh1kdq0lM3aJc7bmrMcKqTUiMNLPDRbKMDE9tmbElgqTka2JeMSYBOwj8wy1/C7TfEbonY/t1iGzGzrAnWsvamgELWc1wfJQqplFcrnIO8eocZqah0jghMVFS+xvOvfWiGlUqY48g4rxMXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172206; c=relaxed/simple;
	bh=GSQllyyTxbdIQGfOjUU0cPCdBxDt67B5m+P3z57pWoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V29lG7AJfocyexYLFFAIsJ8DW3iE7bNavDKJ7PhDajDQsgzp+XTEjmG51q7XN7MBY/RgFj3WYUymxdnBhIymUEBOaU3PqZEAoAtB7PXwkHcPo49Iexm7pGlnpPxoHySK93kWcWVYXth32OHMHzDONw8C9m5WG3Zl9eEY3k8S38g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1YyJPzH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSTaZ701; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1YyJPzH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSTaZ701"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDLvln3842812
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zLOh9Kb/p8pBZNay6kbh5A1C
	JFhDDZYL59AUqu/b/gA=; b=O1YyJPzH+HP6pm6E8uwn/gVhKqzy4B81mCuRhqh5
	braQwxSA4e5IDI8LmTnnWPCPAgaZ3nT/khK5bIezROpCUttIkxkpfQxWe2OC7cUB
	857enoXG8KAe9nStaZdZhtAsXAnQjItJRac79cfVh16Ws2OHRIAbHQnd4yLuVpPi
	IEpiGX7fxA505iwdpi4FCuq4VBxePNn2uX1N87b772VCVtZUCzkzeRu3eSO4QFkU
	rzPGEwNtmWQqjnT/HkxI8tbKg/xOfIb6bW7VXePlslG9EwwLqYcuMYeRxR7qMVSe
	Puxyne0tqSKUI4J/0PED4k1WRvtKAF8J+va8dwEw2G+D6w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbg5wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:03:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-868db1b2c64so806995b3a.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790172201; x=1790777001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zLOh9Kb/p8pBZNay6kbh5A1CJFhDDZYL59AUqu/b/gA=;
        b=dSTaZ701kIQl/gJ/oMC33lxJBvx8DIvf2tdfbJa7mHA/c8rDIzZ5BVn1/IndjvvCnK
         +R+qTsO0jrw+coo7FdrSK5duZwng2HPwW9B71adugPYZRlzjUqD4cZ6tvK3sOUnaOovM
         duFv0UlRQMZOVaxytpE7VwD0HlTSV084g/tMINxOSJi7dES/dtQShsiZ/qzMHZatGzTc
         D7l5Kz5Y5bMjBHFcap8zvtbYsMV3YULeme2Crwmzyi/h2MXd24/kbtRe5FGraHa1WQof
         zJaOXowNY1hQF+ia9T1e/+eFEt2qySg3SFZfBq2LH90pYt9QR+LkrAu0fo00rTXQZu56
         Ib2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172201; x=1790777001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLOh9Kb/p8pBZNay6kbh5A1CJFhDDZYL59AUqu/b/gA=;
        b=ijyiF1E2NSF7bb/0Iu5+gIfvMJBxAe3/t8uzHTVsG/mphCYlhQX6mf/fnqm8cj63Wr
         e2Hz13o/g5SrZmrtAW6bOtIXsJqjgrs1ITJ4MMrUbqu5d5KCGBr/Ja+sfxPcddSQ7nYc
         AP33To29f0wLoWhWVnX1/SWHxteClrqWT+rTUqUzukwKonshkeHcKhFGTk2LLGwvwNWs
         vOcr8X7KGoZLEkwTc2/BDXCWQR/HIfPdm+K5NG5bRKoKP9JZfvN86+EZLLT0Dz7cRJKG
         zJ2YwlGGva0uGsI2uppZm2oKBBcoBki8BAFLjxkoFCPzzrzktTVmwvbYWQYpDAxrj/gM
         1xJw==
X-Forwarded-Encrypted: i=1; AKwUvByH8L2dFPjBX3DDZF4mFN2MGDByDmbRaqRc5VW41MLVUSNH+VnDUn6W8t7dj3QNg3krS0n8pwywYs6v@vger.kernel.org
X-Gm-Message-State: AFuF++nhpoDqfF7yDVdHcAfs+yv++Vv+lOdIhQdXjXWt69yBkf/m06/u
	TixBCpnIR7wlDWuNvaG6KDLxY4wu2mgX1N1Wu6xDuJX2WyLb0H/npPLiJCiFzScubZEJeruZCIu
	4QyTrmXVU+xx/rueir6T5ZHrSYeWBP5cBgiRswXIzslockuYyp6AkJS+C33Bq6EYU
X-Gm-Gg: AYBFou2sOT3sImbLVhVTrP45i8RFohSijp52OGM785MBneu+jbpGC1UVV+j8lndNKR4
	9ilXwcA/x+O8aaD+ZJeLapNNgKkganWaJ2aMaZELaVTxinc0/sByQk4FOvzkZGK+jwY8J6nCAjl
	vdU35qscXIMtn1VhTccTCIaOWRjKS/U5tObkPOXjGGPksjAjL83bBthxZA9YTR/UiVHeeFAWA77
	+L1CA/pvESu+BXMoNrZhiGBakWAUiXtfhFDb904lCim1jFPcCHzgwCLh4miye+QeiLfC+Fq2VcH
	0JwSetRKEcHDYgmPvwEg7FbfeP4+RKzfXbU7cI8e8VLfasrtt2X/qY83rpArjoNep1j4MELv6F+
	OCf2NflSEs4hh
X-Received: by 2002:a05:6a00:4c1a:b0:873:e3b4:5d4 with SMTP id d2e1a72fcca58-87d18d6d036mr2571702b3a.2.1790172201323;
        Wed, 23 Sep 2026 07:03:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c1a:b0:873:e3b4:5d4 with SMTP id d2e1a72fcca58-87d18d6d036mr2571644b3a.2.1790172200645;
        Wed, 23 Sep 2026 07:03:20 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb99f0sm1366950b3a.6.2026.09.23.07.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:03:20 -0700 (PDT)
Date: Wed, 23 Sep 2026 19:33:09 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support
 and add Nord Ethernet plumbing
Message-ID: <arPcHSGFLrxXFEyC@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com>
 <arOtU15iv5CWPUEu@oss.qualcomm.com>
 <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NSBTYWx0ZWRfX+Viz/zTvhvYy
 gjsT4FG2YODJxtW9ti83p/9rZwQLKMiGdgxk7+TAZ/Rzy1I5q6qevBsJPA7UTSqt2p2Zdbi+BZT
 D8TtMLteP1bQaD6bOpnoFhWy7KdAlpE=
X-Proofpoint-GUID: cZVsfZuuL_sY9arYxuzB34eKeqBoCu4-
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab3dc2a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=dR3U5T3Y49Kxp-nVN2AA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NSBTYWx0ZWRfX9pRP76v7mbK8
 5X4VwnluVMQ/vXUZiXejCamImD/+y/Z3V5wGcExWXbJNpQCTXEvhIKZYefADk5FJlt7iNQlh80/
 DdI0ux/TBztm0gr+zcXykUagPVd/0K22ODBC99PfDkyVYQu4/rGP94atH9nwd4L/whpi4uPHEgB
 LTThioa4dr00R4OgeKOm17fIyAw+VHlO6RK2/mSCEBA2vg5XRIGs5EVlAvFoU0+OTOY7kJtyxmg
 6p1LOU5EUmxXu5qgPwkQ4mdne9yNbhbcR2s75Njpt5PfTvNfFWqiYtwFcCgMSRo7Hm9+q+3Mcgo
 Q9esA1X9et5cNIDNWuTooYDHDX/a286I60IwfRf6rffCVMIkV9cg1H9QYlnyrRd/nDBh5mMcBTD
 9qyN3L6fc+h5ZbTONEGi/PUyEbEIcwlFQTXbLeWHptz7mKgOpyfm1qiGdGpODMjE5rNDBKhqSkz
 d/V9dp7h/WrLKJ5ClTA==
X-Proofpoint-ORIG-GUID: cZVsfZuuL_sY9arYxuzB34eKeqBoCu4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230055

On Wed, Sep 23, 2026 at 09:17:44PM +0800, Coia Prant wrote:
> Hello,
> 
> Thanks for the RFC. A few comments.
> 
> XPCS_ID
> -------
> Is 0x00000030 documented for Qualcomm, or is it derived from
> NXP_SJA1110_XPCS_ID + 0x10? If it's the latter, it's a magic value and
> I'd rather see it confirmed against the Qualcomm documentation or a
> register dump from real hardware before it's used for platform
> identification.
> 

It's the latter (NXP XPCS ID + 0x10). The Qualcomm hardware returns the
standard XPCS identifier (0x7996ced0) upon reading the 3.2, 3.3
PCS_DEV_ID registers. I tried following a similar approach to the NXP
DSA driver of reporting a synthetic value to bind to the Qualcomm part. 

All this was just to make it work with pcs-xpcs-plat without introducing
a ton of code.

> Structure
> ---------
> pcs-xpcs-plat is itself a platform glue driver, for SoCs that don't
> need any platform-specific handling. Adding another abstraction layer
> on top of it to cover Qualcomm would be glue on glue. Generic, Qualcomm
> and Rockchip differ in power management, address window size (2M vs 8M,
> ...) and MMD redirection, so they don't share a probe path.
> 
> Pushing that into pcs-xpcs-plat would also drag every existing user of
> the generic glue along: they would suddenly depend on GENERIC_PHY,
> PM_GENERIC_DOMAINS and whatever else the Qualcomm path needs, or they
> would have to carry per-platform branches in a driver that is supposed
> to be platform-agnostic. A per-SoC-family glue driver, the same way
> dwmac-intel, dwmac-rk, dwmac-renesas-gbeth and dwmac-rzn1 are
> separate, keeps each integration self-contained and leaves the generic
> glue alone.
> 
> Would it make sense to take that route here? My pcs-xpcs-rk does the
> MMD redirection through a custom MDIO bus; maybe the Qualcomm glue can
> reuse that idea directly instead of extending pcs-xpcs-plat. Happy to
> help with the generic parts if that's useful.
> 

I agree with your concerns regarding the glue on glue architecture. I
also don't know if each platform glue should define a custom MDIO bus
with similar logic. Maybe we can have a generic abstraction for it?

I know that Alex had a patch introducing pcs-xpcs-regmap.c [1]. My
original code for this platform actually built on top of it before I
moved to the current implementation.

At least I now know that multiple vendors have an MMIO based XPCS,
albeit with differing MMD redirection mechanisms.

I am going through the pcs-xpcs-rk patch and the eee_clk already stood
out to me. On my board, the PCS link does not come up if the EEE clock
is stopped. Going through the databook, I did find a barebones
explanation of why that might be happening for USXGMII, but I need to
dig more into it.

Thank you for the review.

	Ayaan

[1] https://lore.kernel.org/netdev/20260501155421.3329862-2-elder@riscstar.com/
