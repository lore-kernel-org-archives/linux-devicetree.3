Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFF1531600
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072817; cv=none; b=g0Z00VyvkPu+mOvyvT4DU3Qhg15uCgAJjCNx4RpTep3BovnP+PnbIyR13aio4EvEqoLYFS77MKtZ6ORzHe72adjf7pDmPTFGzOCMZk1ezQvqvvfzWgp3qHOzOAD1NHMh7HMwYoqb7u6jCCQfX6ZqN987JV0EswmjK2nJdq6tFsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072817; c=relaxed/simple;
	bh=CnteW/QQydDTia5kiku2DODgBP0WEZ2kFVWX0qHslvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNuv4xCABqCHj/nsPLLOXaURutzM1pnXrB2L35YcfcJPaNFpa4Ie69vMRbL7cffb8GEm54c1Za4Jf59BnYUiLV5BiqPqQrJUY8E+bKeqBHKS18O4UyWJf1LUy+HNPKX86R2CCjYy0msqjByWsVojni33cGGj77jW1JOTRVAgvE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/CHkvur; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxtVD720; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/CHkvur";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxtVD720"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MA35eB801440
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=empcgrZmVB26CyzoMm70tPXe
	VVtlzHO2oeqvJZ/GtxY=; b=m/CHkvurgZ7qH3f+0tFPJxZoC/2bhBmuV+vnEEdD
	2JNG5+RqdFISlBUm7Ol+Ga3o9x3c14QUBk9/UqROQMO7z5aJk/6+UJhzEk6VYaXr
	R3yxqiZhWJr8Zx4WPf6mxcEGKdh8yntewu5p0kpoBmvg9OgRh8L2K3b1bDesNJAJ
	nqZ/bDG1OCFo0/7vrCeRIC1KBmcDaW6kFOLzmntlIxNk84TtBGOBEDa4XHnzt8Er
	L13IuSvqdCq3MOlShpSdvbp8n1Dccc+TnMw1SDlRcQ9+M0W02NQIz6yeD5UMsrrj
	DndszRMesH1pG5WY53u0lHiel8YT4mdEeeZNj1UsPcQJiQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4r2yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:26:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so4783378a91.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790072814; x=1790677614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=empcgrZmVB26CyzoMm70tPXeVVtlzHO2oeqvJZ/GtxY=;
        b=WxtVD720HZt8rBS7sQescuYffKnmQqUux4JeCbXmLOuBiF/zPJyGxifAz0XlLnH3fZ
         tfYUi7M8qlVX23eL7bRvQ3dkMOdolwOIbECFnej28eO3FlA+nSWYVuBT8wqUMFs+X/33
         M69F54TVKNxEZXq01hvHRo1DnoEgSAdf5rFtTG+qLKvBPZakPQuM6GchEbXNaW6dpcAO
         dhc2fkzF2l5pGFtgL+CxhgCMXswot3n0ELHP/uhHr0e+Koe9uXQwZLfUlJHYwAOGKzkA
         +jyvLlmu240xS1RQ4Wr96OFXaB3x+bdIlyr0T+wlEVqjyOgEU75DO4TGI5yezT0TuXIM
         bsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072814; x=1790677614;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=empcgrZmVB26CyzoMm70tPXeVVtlzHO2oeqvJZ/GtxY=;
        b=GV0mg3BhqBUG+NCaRJYK0/znxA0YOEMft650etrFpkU9GAxuvp8qWF0hIzhPvnxjzs
         I9IjyCRVjRKqhOXaHMED/jkcADPS2SgmwODWSa4zsWlP6XCge1+EAIkETbvT9IUOIHN3
         zj2dS1QvyqjiC43mdcQCZZO48341oFpDGCs2fbZmwRWwg3/vFnPRwoytEZff8Xqy3f7c
         5rxzC0zJKxv1mTna4m+9cSIHvN7E7WUsOINP2a0zdy4CmuvD+fcsWkzNqHNQ1Bzg4gkE
         e7TLGvd5rGQTHUjHLtIVessGNQuxw45/gJCe/O9tL1a3Qd+xlbDWUs0fivuYlumiS6te
         symA==
X-Forwarded-Encrypted: i=1; AKwUvBzEBEK44bG3P+wG3xNNjvYOYms+GKSVjQiI12032v6VqPVGNE11SBy8RTyShNp2VJuj0HRxiT3c5OwV@vger.kernel.org
X-Gm-Message-State: AFuF++mXaUEqq4ZF6M1OfrA3h4i+i0fw6xTr5RfIIF7R0V6+eXCnra7Q
	L5mc1m5mjjFZ0M8JVRnO8vNz5mMKIPt3vbBxC3kFp69DE9D3P0mru6A+i/Gvm0SKSlT+W8DEgW+
	rg3gAnhlxV3nodMbqfEzHUNDj8GNAkCH6ZF9xK1IOFQIRJ6+nPZZYoMaHssJ8ow5Z
X-Gm-Gg: AYBFou0PcGMTQGrjv3cuhG+JCNgmpWJwNGJ1XAPBQaRkyoOC+kY087SHqKx+fzBeGfD
	Uv5o51uolqtBnTQhgTtf3S738VwpNCYDKYiSnx5sLYoNdHplAWOSGTxcldBcFrCLvEkd8ik6I2I
	RZbhD3/BbIb2btkTLZf629eH9skdEpt7dNywa1cGGpQmgkIjE8iff87xzpm4cSQTjU94EC66mEC
	akJnijAEVG5wYqXp8fyf+yPN4jHqZyz0j4eulD0CWUvkYuMeh/EhfM7NMKZtl46HtRzowS04LwL
	Fa5sACluzeGVOxI1CPEBYYaGqswGMux+0DAh957Ge2yU/MSJAumw7RgAns/MyfJMfplebgLOmT5
	deKcQbgdvZzPJzfh3xbdz6hWtgkFPb7+Wko4WV31b2nk0/VO+trHi
X-Received: by 2002:a17:90b:4fd1:b0:39e:4c80:f67d with SMTP id 98e67ed59e1d1-3a0731183dcmr858995a91.28.1790072813985;
        Tue, 22 Sep 2026 03:26:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd1:b0:39e:4c80:f67d with SMTP id 98e67ed59e1d1-3a0731183dcmr858957a91.28.1790072813493;
        Tue, 22 Sep 2026 03:26:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a3e24asm3822296c88.11.2026.09.22.03.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:26:53 -0700 (PDT)
Date: Tue, 22 Sep 2026 18:26:47 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Message-ID: <arJX549pPM-0Rxx4@QCOM-aGQu4IUr3Y>
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
 <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
 <63c1fa59-1a2d-4c39-b0df-ca7c00d2e535@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63c1fa59-1a2d-4c39-b0df-ca7c00d2e535@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX0mzfFr7E889N
 RNtH14GMwFyEPYp3gEP4S1V/xtxz0m/mhL30yCyX3kQ0yAjOjXMXJie0oNZ2BhoZ/Nb24W0ReV2
 R+N6vGMJZaaQpgiE7P6n/B7BxEk+tC9UxWqVnX9UIzmaXDXrr8jS01VPWDobjNHVOylU+JRjxSO
 IZCGg2XhNehkdZTOhRDtj6pXJX04qicxf9r4AKGbZcwhc58x7ZnGuLiNKtWtuvbl5GCZzb4bT5G
 3hb1u54gXBxYPVMgvMPGs228PrdcKV4JyFEKedZxKwua/dXPUSeETGcpn0P/6BQWJzl/PGVk43C
 Go55bbIkBDK/lLVMHqQA81VzYo2bsXeH9PwJ93+/lcDNvykYKfZWIbUvbkDS7Y1pQVumE66CM/i
 qPmzleGvfaBm84UlxIi24BW0V3/jpDsemgyEn9Fj5mDV0PeDW0hDTmxcVLEjzY8w+ZA8MiuU/Kj
 SPWV/zds9UuAISjxKFQ==
X-Proofpoint-GUID: 9H86gC-ctQrEnOK93cohHV6NZMDsegaG
X-Proofpoint-ORIG-GUID: 9H86gC-ctQrEnOK93cohHV6NZMDsegaG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX+eIyospvo4v6
 bPgQtXHwmuC+FEkCQZD/OkQc9yS0XRWbSdKi0Tb75s/HEMwrc0iitoQDQ7XVURddt1+vZsWEFOj
 ge6xfOnxWg6uNGN6b+Ubc2yuk5qN72c=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab257ee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=M-_d4yFJWzV0JcTPBo4A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=IRUrt_SQlIu20UJnvt05:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220150

On Tue, Sep 22, 2026 at 06:14:09PM +0800, Jie Gan wrote:
> 
> On 9/22/2026 6:08 PM, Shawn Guo wrote:
> > From: Jie Gan <jie.gan@oss.qualcomm.com>
> > 
> > Add the CoreSight trace topology for the Qualcomm Nord SoC: CTCU, STM,
> > TPDM/TPDA sources and aggregators, funnels, replicators, TMC ETR/ETF
> > sinks, TNoC/ITNoC nodes and per-subsystem CTIs. This wires up trace
> > sources for SOCCP, BCV/IMH/DPM, GCC, QM, DL_NOC, the CDSP NSP0-3
> > clusters, DLMM, EVA, MDSS0/1, LPASS and the AOSS SWAO priority TPDMs,
> > plus the DDR0-3 channel and LLCC TPDMs, all funneled through the
> > tn_ag aggregator into the main CoreSight funnel and out to the AOSS
> > sink.
> > 
> > Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >   arch/arm64/boot/dts/qcom/nord.dtsi | 3540 ++++++++++++++++++++++++++--
> >   1 file changed, 3314 insertions(+), 226 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> > index 926ccf3bbe4e..3e4fbacc2eb3 100644
> > --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> > @@ -345,6 +345,18 @@ domain_ss3: domain-sleep-0 {
> >   		};
> >   	};
> > +	eud-sink {
> > +		compatible = "arm,coresight-dummy-sink";
> > +
> > +		in-ports {
> > +			port {
> > +				eud_in: endpoint {
> > +					remote-endpoint = <&aoss_rep0_out1>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> >   	firmware: firmware {
> >   		scm {
> >   			compatible = "qcom,scm-nord",
> > @@ -372,6 +384,20 @@ cpu_perf: protocol@13 {
> >   		};
> >   	};
> > +	hpass-stm {
> > +		compatible = "arm,coresight-dummy-source";
> > +		label = "hpass_stm";
> > +		arm,static-trace-id = <25>;
> > +
> > +		out-ports {
> > +			port {
> > +				lpass_stm_out: endpoint {
> > +					remote-endpoint = <&lpass_tn_in18>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> >   	memory@80000000 {
> >   		device_type = "memory";
> >   		/* Size will be updated by bootloader */
> > @@ -1900,236 +1926,3178 @@ tlmm: pinctrl@f100000 {
> >   			wakeup-parent = <&pdc>;
> >   		};
> > -		apps_smmu_0: iommu@15a00000 {
> 
> Hi Shawn,
> 
> Thanks for helping post.
> 
> This irrelevant patch diff can be avoided with git config:
> git config diff.algorithm histogram.
> 
> As Coresight patch is large, better patch diff format helps review much
> easier.

Ah, thanks for the tip, Jie! Just set git config up as suggested. The
diff will look cleaner for the future versions.

Shawn
