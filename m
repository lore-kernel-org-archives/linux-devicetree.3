Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417E13DA5AA
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 17:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185013; cv=none; b=LO+1Q+I02dWY9I35YZyoik2T6501ojcTxLTXX7C+G8VNS5yfNaB0FfF5UozyxJfkINBn3RfChIiL11U+mp0Bsz7ZMrT0YagXcUCwTWFj8EfTA+uZweTQcd8hrFzuy+1Xc4+MIlVaJTCPA+7VHwYceHVnYd3qPjAZd6Cfr4jWX1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185013; c=relaxed/simple;
	bh=kzhBehIAs4UFbTHjcorqhL0zXljuHrD+zdfXi3pBatE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwgNPEDxVG74PvYmR8kvrPgz1IqgXYUJHoW4BckoHE+WPwMIpeKqpI80I8bJshJzgdgIgoXXkC/5iCWfGhU2TW7hdRSQ10le/qK9BxNPABpt6ucCmzyIT6D8hF+zgcL0LDGqlBRLOq5tZ75C/jSPM4MXsGQgcj+wACCgb7WrQcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5Ac7Cab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Up2nL7Mw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5Ac7Cab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Up2nL7Mw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTaQh740284
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 17:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z2LIMIvO9xx9VpTpkJ6YJGQbEYqEewvSeY8+Qz4XTcg=; b=F5Ac7Cab1l+fa2t5
	rDeAiQEiaJPPxcVWqUM4ZvwxmIfFHJEFlw6uWnsm6pDUIueLwHIaIhbU9lr0x5Wh
	VVygZeko33PySeFD8YrmGFNJIyUXrxY58K8doAuQDSGB2KyLxpVt4WqRM5OlJ+51
	JNN4eG3jTtb6zm3Ixx7oObG5PiLkEe0TxE8oAIPjM2eX6ACMXH2VkFj/hKxqAWpg
	zi2d+uQO69QlPiZULu4xfScNcFEfNpH2yj1VL8F+XiegiSHyMFRejbKDEki5UpcA
	uDTkAs3eZdgD5LDRhUtFNCsT9r5PkHCDxD8RQN7WzJaPAnsVieJ+KL/cnRmtvAyC
	cluV8w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsh71j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 17:36:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-868f443cbd0so746519b3a.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790185011; x=1790789811; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2LIMIvO9xx9VpTpkJ6YJGQbEYqEewvSeY8+Qz4XTcg=;
        b=Up2nL7MwpNN3VRzV3jwnNXDdOB2ztzP2ratxvutbXcg8n5/GGfRAQictPUSfEcGAhc
         7BD03656vikFrj2ZvJFJKZCdHfiDv79atj1giALugOQr5/UtS7idmYUSoIHlqV7y0OFL
         Bu5EPGNsNt/yskF9zEGw2SHJhb1y+PW9ZvjrS8Hg8Y7bsQ8HoMjDoZVd2loj/YzxTNIO
         1bXoHXz1ji/LvsvfxSdCV6Xg/C/OmWoDrVDSFiHRm5UNffrqM32nzOraqEpDk0MqLv20
         QqTvxJrX/1+oguK4XE6u99AlJbzX1GzgpgGXMQ3Al6dW/GKC0TS4dfkIELjr0tYx4cUg
         44lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185011; x=1790789811;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z2LIMIvO9xx9VpTpkJ6YJGQbEYqEewvSeY8+Qz4XTcg=;
        b=cP6zoNHnhDluGW5ZA/HeQ/Anauo1B1NQYWaqEWaYuRi65kHwDiZ9R8wNrKZH7alGX4
         RUuO0Fqv/Wcll1ObibDn6Q859HGt8bUDi2rYhVGqXE4gVs5FVxpzGlfcQcy1wSCPUwTw
         eU6i3Fds4LWs66cEUzK3xH+32I6RkkTjMn7EgqZWouEUVe6vjes0/1DfbFW98nzeh0Rj
         l3SZKhSlNuuH18W3PHm8SrDwi0PmJN3JFF3RB3Kwf3//C/TaAQZ6nVOTwYSrJLop99sC
         1YmBVBLhG4is0tEnbM0FL3zDKF6MbLtOtUjX/Xg5AXl0LzCOE8MwGur7Tdw0OTZ5VAmc
         VKlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPDm7NeXwuqLB/PD9fW9XvjoOeuXikN+XNF7x1Hbcz7n8Mhe9QVijSAUmTmohUzRV0vrOeBgLynVQB@vger.kernel.org
X-Gm-Message-State: AFuF++koBF6Osn6P2j/z00XFMHJvUMqXY95V//jHmbnxYUPc382Gzol/
	1Rt9KsrN8uV06luaqTX6X9vgnNZSA0nPTwDqoiivgNG/pxPKmteAP0YES84OkBWvZi7fg4/Tiyo
	wBXg/FH8LXnQLXs2VE17Livz5RHX/OTSXC4oOn6tsOGzM7qUPNk/P4lXo3yJ1wl4HQtlm5O8w
X-Gm-Gg: AYBFou1RA1omEM/c6HKwunFAyzTz3A9clPvcKY0NZZDOjzLA37xJxbRF7edhOaFItwJ
	+q79ATeLnHCF28dukmV4htpHHpDdlb+dINithksxT92KH0U1h5YSkEa5JGnQ5TJcN3liGXVk5us
	LmDJtujPiaE9sK7ajLIP3waITCVn5TqOv/W71w4Agv30C36NpFa9tOMhMwPSocoPGfdP0/DvaPw
	nFjNEtgE9Ju2WER7u/GRMrEtBBXb/8xaWisv44qyg4c7KAxOe7GbsDAe/BDRxuLHvWLBtC3Qa/i
	7O1q7rm/X7YIrcPiwtTjAvW1M0Nhcm0ZEwBusNDkUqa59tY+XgYdjSHLtc4bmly8Ipk/1qPPurb
	azG934DEBiaMTB24ZlilHuorKHfUepV5y5Dic
X-Received: by 2002:a05:6a21:a41:b0:3da:bea4:621e with SMTP id adf61e73a8af0-3ddf7e7a6b3mr3083041637.26.1790185010647;
        Wed, 23 Sep 2026 10:36:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:a41:b0:3da:bea4:621e with SMTP id adf61e73a8af0-3ddf7e7a6b3mr3083025637.26.1790185010069;
        Wed, 23 Sep 2026 10:36:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfc09efsm1743697b3a.16.2026.09.23.10.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:36:49 -0700 (PDT)
Date: Wed, 23 Sep 2026 23:06:44 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Introduce Hawi SoC
Message-ID: <20260923173644.x5jda5lxokjtebd5@hu-mojha-hyd.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-3-e41473b6298b@oss.qualcomm.com>
 <20260922203818.E7BE11F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922203818.E7BE11F0089C@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3MCBTYWx0ZWRfX1AXvu9AmDrMr
 ijV+O0/8cyG2xVRq0AIdeoPYTVD1o+xCl3EV6RW2Tj5IbIoCc4xwbKThD43gM1vgRQAkv358ajf
 Pa5m+eNEjbY0zVSa0Wsgf73VaQoZF21sgAOj1SoGJBElJUk+bPI2+czMngFbnE3Bl/DWbZVSdLu
 +c9RzsH0icUCOg/XSOxhqMDaWiUdHaGtNZiLqydzaOX5YrbpfzttKFteesx38mH3xsBEsgmj+79
 nDS/ygOjCR83iaquElg1EEsdoizhbxrkdg1OpmwGYQBPQMpUDwlPsFbndQSJ2MNRFZh36ZGOkDI
 imMe4A/TNsXoZKkjS17ZRDBqd2nSNfyuvJjLJCLS8gmT9P/sTpHXDcmgx89YDXy9FT/Lb5ImKsD
 BbK5r3B1ulJ+m3o2fEner9oHqJyGeUz+QFcnoLlQtE4Db5eRUPJ0ztdg0OK4jWe35/z8hmq2beC
 4cOtJA+x5rGHzBYvAPA==
X-Proofpoint-GUID: 1_mR-uJpBFqRrOKq0FNfDrithI85FxdG
X-Proofpoint-ORIG-GUID: 1_mR-uJpBFqRrOKq0FNfDrithI85FxdG
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab40e33 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=HEPaDEBX9R-tSKdGgq0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3MCBTYWx0ZWRfX1G7kkfPvG+8D
 MhGpP6d18nVIEmoD7qEDMPtGL0iCn+pOgKWzMgYTGuRm3juduuN8PCRJDIZpeTnvH7amQC/d0RR
 Qw64ZQtfcY0VhqdVfudsm5oF7S68vWY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230070

On Tue, Sep 22, 2026 at 08:38:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dt: pcie iommu-map property missing mask cell
> --
> 
> commit b9bce85781ff89249270f3214ceed073984ef78e
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> arm64: dts: qcom: Introduce Hawi SoC
> 
> This commit introduces the device tree definition for the Qualcomm Hawi SoC.
> It adds a large number of nodes including CPUs, interrupts, timers, reserved
> memory, interconnects, SMMU, PCIe, USB, thermal zones, and remoteprocs.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
> > new file mode 100644
> > index 0000000000000..c7ae8133b9cdc
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
> 
> [ ... ]
> 
> > @@ -2957,8 +2957,8 @@
> >  
> >  			operating-points-v2 = <&pcie0_opp_table>;
> >  
> > +			iommu-map = <0 &apps_smmu 0x1000 0x1>,
> > +				    <0x100 &apps_smmu 0x1001 0x1>;
> 
> [Severity: High]
> Are we missing a mask cell for the SMMU specifier in this iommu-map property?
> 
> The apps_smmu node defines #iommu-cells = <2>, which means the iommu-map
> array requires 5 cells per tuple (rid-base, phandle, iommu-base-high, 
> iommu-base-low, length). Providing only 4 cells per tuple can cause the
> parser to misalign the tuples, treating the length as part of the iommu-base
> mask and stealing the next tuple's rid-base for the length. This completely
> breaks parsing of the IOMMU specifier and results in broken PCIe DMA
> translation.


Need to fix this in the next revision.
> 
> > +
> > +			interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH>,
> 
> [ ... ]
> 
> > @@ -3139,8 +3139,8 @@
> >  
> >  			operating-points-v2 = <&pcie1_opp_table>;
> >  
> > +			iommu-map = <0 &apps_smmu 0x1080 0x1>,
> > +				    <0x100 &apps_smmu 0x1081 0x1>;
> 
> [Severity: High]
> Is this iommu-map array similarly missing a mask cell for the SMMU
> specifier?
> 
> As with the pcie0 node above, providing 4 cells per tuple when 5 are
> expected can cause parsing issues that break the IOMMU specifier.
>

Need to fix this in the next revision.

> > +
> > +			interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 106 IRQ_TYPE_LEVEL_HIGH>,
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com?part=3

-- 
-Mukesh Ojha
