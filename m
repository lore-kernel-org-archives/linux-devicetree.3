Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD7E30F819
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972236; cv=none; b=LGWRMKdjaUU0Hv40QzJpVvluY25VeHeFWmHbSibtQLW2q9VWZifeLUEOGFnts8IH8ikI+AWYs/pe0KEvpNWArHXG1G0UYTbLQrRNlhjLHM8JCrJqmwvsF3T3fUz8X/GWJxo+WAn1tLP2JaykJSfihKqKsL14ln0qmuy8eD4nxvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972236; c=relaxed/simple;
	bh=ddfn3LbqEOO8JuUkBmmymYxPMCnLmvYpUAoXtX2mPhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nezUNa356oTxCZnc5f+KrSNdIRI6mFKVwy7GlXzaREKvQYUWCViXjD3UPiMFTgExnOgkttyTRroxAaW0rBkH6eHYjJzvOmnWpboPk0q45LScn9+uRM9v2Kmx5/B/hdfsVKcFTcCz2MW9INZXoQxrq2HMfswdZ3G7nBzyeUC0NxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7MeMR0K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGQtHowD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7MeMR0K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGQtHowD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZkKG636239
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gfTLiSXODMZ38Zdtd8E6UO7a
	gf75SjCHxDaJtukqv3Q=; b=o7MeMR0KyxgFqFNtza/daLmBomdhbj4Sn+qtId8R
	K8dt79WyZ06RJi0zGfQyTyL1+Es4Ux/OQyQGbSBEvM2t1uKqPeBjroWkc9c4WggJ
	tUltikZUPcp7i1q5DH99c6fsXh7Mbo561P8CfV/L4qu/T6wYy0hRjVor00550oxM
	LPExgWtFAJYRcwl/dHMpuSMJSoKPV11Dw/mKB2HxFzYhPtUvwXezKV5Mkn+3gd4t
	TVNO3lbswcjMKfibQDBujtr+tnyb/VfPsbLcWQeIsclbKPrkhsX8pYe43+IcN25/
	L4fLmTgsd/zcUCLHpsUDXrsxKCYSKyCyBcJlSqa8awp/Jg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxw2mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:30:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3305449a12.1
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 23:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789972228; x=1790577028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gfTLiSXODMZ38Zdtd8E6UO7agf75SjCHxDaJtukqv3Q=;
        b=CGQtHowDSOi4RAihz7Ll152JgSiatEADLGz67nsL5H2b8Jm2PA72xOf/xJYh/TLwvz
         dJEQCTGFIYsqK5UPNDKz01Imgjv8lN41dCcnDQqyUe6zux3Vbi2KFDyM8a8HhbcdueuA
         Na9Z5f29QHq1StODfOLGgi95vKp0xARP/hEawZns6ovePST6DfmyAd0bNGpvTl3L+4SL
         KXinn8M0yZt1n7LzSz6/9n1vaeUdbFhh9ztksDVR/AH+VqHNnSMKCWfJnSb+xrmdCBuM
         2kekdcn+2MllI4CNzIgXqfGEyy2kGKpG6hDsOIxxNGsT+OcMe7lScvG12SP71UEa3IFc
         oJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789972228; x=1790577028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfTLiSXODMZ38Zdtd8E6UO7agf75SjCHxDaJtukqv3Q=;
        b=hZn3M7oXaNYlghSVKW3nwIakIIs5h9MR7ZpW+o1irr2rgJwCdPTT1JWTJoHIX6NcJW
         zZUHK7jmA4bR0L0pM2DJlmmplrdsJdKrh2fCsAYDo3GEwFaxm0uskoxG73McJfQxSWKf
         Qg1IyHRv1pV8QWW53f9tu9YTwTEmTg7QS5rQ9mKNSbXmxwiignRBVBZ7+Kj3BmmFvkml
         XaYyyP8/OZjjMuGlLfXO/nWLuYfgBPPCmaihXmrH8zBesuf3M6c/KQ5FN7ic9KxQ+1St
         ww8UQSxPBYtWaiDgLk2320rSLTqSF1rxf42SyHDgzIKw/bSnRelxMaaaxFv91GWCkyw6
         HIwg==
X-Forwarded-Encrypted: i=1; AKwUvBwB8it2Mh9TyvCNxHgpKSrusk5v/bqp/z6jgXasndOSrYvH25BzQ+3YmEIZ+5tc5z0tjTUGy52qBLLd@vger.kernel.org
X-Gm-Message-State: AFuF++mN8E2Q2qsQVph/s/KVZJRCfSqqi26+y1085pR1ifofKVSCpEb/
	v/+ajGC+uOkgOg7YNvzNt0tLa80/rdtwfqb8fLzGCFONI/mD3/1m2Trm6h4HPDs/RMjaexa9agJ
	1zPJWSiZp8FDZf2xH4dJ/mb7XQD3DQs+RykUfi6K5Ohhtmmx0GAqXVEMg3qj2HuF1
X-Gm-Gg: AYBFou3xXJqUgOgt2468lSImTiH4vUfgny1bidITTy1O8yJKzuy1ekQ3RjQbNVN42F+
	N5baUZVsrwupmF9INMU71lJeNllHSUe5niQVhDNCUTYOAoM+a+IeEorz4A+2EWJx3I7tQSLHfhH
	Rw8tJeavM5LQ3HFkY2KTnumWh2suCmRyZZe+cVmHXaMIFQ1zFLmEV4d3XaHMOWFtdDNgy4a66LH
	8+oywRvpDByQNlvpGi63+FKgWDOqcmqR8XiCN77YOG8lGX88ue0TGhdDM3EFr50U4uIyLOE11OF
	P1MnpVHhq1tI50Q0CNMsWHkCN150HBfgqbZhPENuywAwiwb1m7LFGTaiWmKPog9nuQ07obrljyY
	ZomGvs/MUWxN0SdSM4446JUp06wq46iLjYVVZuDDALilGkAM=
X-Received: by 2002:a17:90b:384f:b0:39e:455f:36fc with SMTP id 98e67ed59e1d1-39e455f3d97mr14697474a91.28.1789972227596;
        Sun, 20 Sep 2026 23:30:27 -0700 (PDT)
X-Received: by 2002:a17:90b:384f:b0:39e:455f:36fc with SMTP id 98e67ed59e1d1-39e455f3d97mr14697440a91.28.1789972226826;
        Sun, 20 Sep 2026 23:30:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144df9ad683sm8871128c88.6.2026.09.20.23.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:30:26 -0700 (PDT)
Date: Sun, 20 Sep 2026 23:30:24 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/6] Add PCIe support for Qualcomm Nord platform
Message-ID: <arDPABIQl9wKYVKa@hu-qianyu-lv.qualcomm.com>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6ab0cf09 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Tp8Q_eIeZBUexgL1P5QA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5MiBTYWx0ZWRfX/HHkdy9/SL0J
 9Ys3Ces2+83LsLVWCkBque7S1dBE3hlDthBAjbcW7Os01taA1mTlsRfKFJOJ002jpTusyXvTMdB
 GfRTi29G4fKXCAi3j5I6YhkVAgLiwBM=
X-Proofpoint-GUID: E3TjyhthmYajL76o4WuZ5W5NAapPXJKm
X-Proofpoint-ORIG-GUID: E3TjyhthmYajL76o4WuZ5W5NAapPXJKm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5MiBTYWx0ZWRfX0nV/CZLEdioy
 BGHUQFE7T9D7gD9UoPlyN3aFSUhVsOb3oB/8bqF438HjlKo70/7KD/9SpMcXa7DMFDmBRc66N5C
 Lj5oML4M31sICMoC8TBKtVJTZnbCjaZQ5auxYSf2jHpkvMfU9rkSMNhrF/IwkZ6n3BRDvulCU1f
 4rCxmwVVdomcGgdzWezktKkzQyj6stCbI0Bg94eijoio9CTcNCMPi/00lq/3R60/KnuuJsH1Hy7
 ZySs2fM5uFrDPK4LkD7yBICZo9tuWI+Ac6ps30l+TK7A45m+Ng5a3iO6BsM9rG4KaqfLy0Otg6s
 n2LviWlEz2A5QGJXWjn21r1aNU/JdotRP8j5mJvJ6GM38IytzEN1PNlTMwHHQcU2CDg4eEft+gX
 cveeJmu06x3dDaJ5Bt6uPUzRe33fOhtcMSh08XY7qje2peGmY/NmaM6NA4Jgf+aw3Km7wSsr2a/
 XyyjoKWXgQQOjiQoZPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210092

On Mon, Sep 21, 2026 at 11:07:08AM +0530, Krishna Chaitanya Chundru wrote:
> This series adds PCIe support for the Qualcomm Nord (SA8797P) platform.
> 
> Nord has a single Gen5-capable QMP PCIe PHY block split into four
> independently-clocked and independently-resettable ports (A/B/C/D).
> Firmware selects the active lane topology at boot via a TCSR
> configuration register, and the same PHY block can appear as a single
> x16 port, x8+x8, x8+x4+x4, or x8+x4+x2+x2 depending on that mode. This
> is similar in spirit to the Glymur multi-PHY support already posted,
> except Nord's PHY registers are programmed by Linux rather than by
> firmware, so this series adds the PLL, TXRXZ, PCS and PCS-lane init
> tables along with the power-up/power-down/soft-reset sequencing needed
> to bring each port up.
> 
> The series also documents and wires up the qcom,nord-pcie compatible
> (reusing the existing SA8775P PCIe controller binding), and adds a
> CORE_CLK_CGC_DIS/AUX_PWR_DET workaround required to avoid a timing
> convergence issue in the PCIe power domain.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Tested on Glymur CRD and Glymur QCB, devices can be enumerated.

Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

- Qiang Yu
