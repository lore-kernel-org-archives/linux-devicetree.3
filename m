Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7AE27FD74
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781224782; cv=none; b=VzBjlfGzGOmR/GGDPOtBMaXMKnXBkqlII01GTCzoOeHUN/uQKV4UCVnsC/QuxL60zVNXAt2YCKoOSFZsKJL8X38yMx/7rR4gzruKp4p2yjDPI73Ouoc13YSmLJEuonwXPQHp6sNtdCZOUq3dM5LNZyhXsYG0ngfpBlg16YAst20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781224782; c=relaxed/simple;
	bh=qN3s0xS6mEz5jVfdgX+2b/WgZ8Le4zRpIz5yLmm5qic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCjvk6YQq1LNwB9aJil3wahW//J5mK0f9NlIe+g7PweiFdvdp1pUom8uor/K5o/M8Pq460sHa5uPEMl1AlbkGD/NJRo19tPRRO3sffqDXbYQ3aEFPPkdJJ2htK27v5rZCUg/E10GPgpdp/wB/gusW3BtZQI4oVLpEWN3r+gjs9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCESS5gI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFxsqMP0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCESS5gI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFxsqMP0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C00Fld2132623
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5qQ8e+6QnBVjDDTImvqK60bW
	t8XMxUyo3/iEy7fPpGU=; b=DCESS5gIwMluiS8dJ2s5VqpNPtF6XHo/KaprE3hg
	79dqmF4Dk0roT2GdajIsDO91xkDoNLwaSg6ZxveHaKF3utWFQUYZMC99YjefrQX2
	zoKpCLsrzHTaCp4DqbWK7HbLhSbc9sajANAT2xd/hCFQGIG2p02+Dhw6LDoqke4a
	Fb28BLULMWmnaAfq0zxfF5xSC9uNF4AaGucKzeOj8NTQLScDDK6yasrvHdMJJqSp
	UZiwV9vl6vIcpRKUpvWoZbWShZ/9P4Lv92RwahBGlXYP8D84MU5SVJi4v9vtL6lX
	MJu14nBZWgx8aF7QzeCdFH93cs9iNJ2A3IpHzlnMoIa8YA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76eg3hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:39:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3080bb0267dso1013534eec.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781224779; x=1781829579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qQ8e+6QnBVjDDTImvqK60bWt8XMxUyo3/iEy7fPpGU=;
        b=DFxsqMP0rQLIud3HST7+xhirSLEqPOjXTIf8lmdR1uY7XSzTjGwFpdS5b1jDUj5U3g
         LJMUYirQwt7BDy/s0Esu8OVme8uVjcqeobhbkzbsyDqu9NWx0aJYZLb3QMxhqL4OrIW4
         xEMDuWCnpav8Hc7XbyvqZmro4NeOT46l9eU6MoBDpj2DrAMxixZAWLbeVOMgL47ZrejO
         TEj9F9wuokrv6F9R69Zvxt7SQJkb14EDhiH5FYoT9vG+YWH7T1OszqoWcim8+S0bYojb
         14AWWe1SqW/GFD9i2a3wPyy1xyNLxi4Bp0tZJ0GH2EtyrQfM1I+m1+0INqF3Ve8VRpVY
         Za7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781224779; x=1781829579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qQ8e+6QnBVjDDTImvqK60bWt8XMxUyo3/iEy7fPpGU=;
        b=HSNvPK6lXskU3pL9QPg1TjKwVCAMZeqZt/ZhmtawinM1Hy1jy32w2R1zNtht91Woci
         PaICcDWanUDs2moGReg+ftBtxtrmv396TklJuS2FwFnmkpS0QznAlZxQ/4GUg1GBTiHq
         SGl8tN7hxTV/W++YU3mNmmh7ZRSt+UHeMVPMubOmLXnasHVPGI2mDdHLtcHIw4QNLBIX
         XVf/b+I2NeZEomqqs12097QYZ6L4gsRxeS0Mi35qy6PHAwvmcTlZof94r81qTMSaltbR
         zGzO2bJBFUHAvUihLvi+t9jeAveXC4YKT57IZ8JGn+TB1Gh1DHd4N2t2CvVphxLm64E7
         7rwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gheWFmYlybZyxDgPvYc18o4YlEtC6dw+l0yORwLRm7oVDeSlrhUTbMauvJMfPVUTJP9E7UTZeypeo@vger.kernel.org
X-Gm-Message-State: AOJu0YxaYob5B+vuXmc7SxohI+NPUEMWKsFdh+tsn1wmcbk9juyWnTef
	jWrnvcP79C9rwAUV+khibxBs2Q/cBOzboEOSoImVQrqvQESec8tMgGYqFWfS7i6OeZokcDUBrTs
	lcimKvEUP4JgnfVoEbh2UBnJpTpjqFFw7WoEN5FkMwKVAYWCRZ/damW8rzOBQBbeb
X-Gm-Gg: Acq92OHLJ/yeW8o22G6kVoenolwfJmAPL15QZTwy5RMKEYp61Vnp0bYn8QwT05AGsOK
	SFwrKOw5tQ+OnH0fvjRFxOYZ5Ih7oCoyo633g4sV3NYE+9rSogrKfSs5fhYkxtdzKoiC7O4VXbD
	dYjXg0gNvJw3esOJxtdsjS47vQNzTsmRSnCPHye7CBFap7UoCvEVB8hPCeq+6ngR0E0vD3f+bqk
	JapEgTNYc1r2//H5fkBes+GHITrsXkgss8+AhLcbEqLGeHYNbXi5/n0rI08ZfEv/i7qjMz26K7+
	S54Mg0LWscMqVpS4Bqc9MXvTkgGHwfPq979ha1UGf1YU2ceREAPhNO/H/Y+2wRfTojXcfR+9RxG
	0Jih2ikOOm2qGzS/Bj+E8JZyJXKzlc/oDwGwQKLfkMbqIM9gOXXak2MjC2MLhrJsNdbYsGnYvUB
	OlRg==
X-Received: by 2002:a05:7300:5b83:b0:305:179:4dde with SMTP id 5a478bee46e88-308201e35c2mr451389eec.35.1781224778914;
        Thu, 11 Jun 2026 17:39:38 -0700 (PDT)
X-Received: by 2002:a05:7300:5b83:b0:305:179:4dde with SMTP id 5a478bee46e88-308201e35c2mr451363eec.35.1781224778353;
        Thu, 11 Jun 2026 17:39:38 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm987482eec.30.2026.06.11.17.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:39:37 -0700 (PDT)
Date: Thu, 11 Jun 2026 17:39:34 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/10] phy: qcom: qmp-pcie: Add PCIe PHY support for
 Hawi
Message-ID: <aitVRtzigfZg6Me8@hu-mattleun-lv.qualcomm.com>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
 <egojnbup5igcre6ccegojsdrvtokwfoccqhwmfxkoy5ukvuxvj@ailtbrgrgocs>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <egojnbup5igcre6ccegojsdrvtokwfoccqhwmfxkoy5ukvuxvj@ailtbrgrgocs>
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2b554b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=JfrnYn6hAAAA:8
 a=KKAkSRfTAAAA:8 a=ph3dTG6zQT6veRjdJtQA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wEjHJO8RpJGAZUHwl7J9vTBdHhb74f9o
X-Proofpoint-GUID: wEjHJO8RpJGAZUHwl7J9vTBdHhb74f9o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwMyBTYWx0ZWRfX0E2DVEZskvJO
 O2xQki+eSVTrR+7hejSqoeFXvV2PZ2wdQQbRKuMhH5gHeqQWOkTQ6brZxmpfHyLnyKd108hUDP6
 VxV9keB5ZtyHMbE4sMBZ4doevqsuovsibc8APnNYuNxVy0uoM/c/FO3cneQZLOM5i3chd74KmKu
 5QXCbHBKvZzwZHdAkNDjWom5hXb5m8lMwGrw9JuOAde/rYDbsbKW+80KxcNIjmTm3EQF5AoMQSU
 VSwUUnV2num+XewqacsGerhbdj0IdD1Jr2Do83bH4omnBEjtdQ44TpUuEiz/hkJJnq82Nz2DXAT
 dmUp4ibguYaBY60S+8/tlLjQgAeSfIOzybODFv1IXUDgmn2mobE4qSITzzPbCEBYhHKKptNYLoj
 KP1s3HLgfSGpSvENlpsi/Sj1IN3hvVxDkWnd1mdYUtSxSSVjNUoQMfGmRRiGRh0R3za4vaCvCtg
 mVC/ge7qOLr/TgF61lQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwMyBTYWx0ZWRfX2vzQV9DLnQYm
 HK4cPOBHPdU0PJNRLpbaIc01TKqGLJ8KngLdPnax0lSBlntMSwCIGPz/0PvFU1/DMtg+gU/sLJ0
 PWUiyV81jlkHQRmHIW4v76pjD6Bksy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120003

On Mon, Jun 08, 2026 at 12:25:03AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 01:32:54AM +0000, Matthew Leung wrote:
> > This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
> > platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.
> > 
> > The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
> > v10.60 register definitions.
> > 
> > The series adds:
> > - device tree bindings (patch 1)
> > - v10 register offset headers (patches 2-5)
> > - v10.60 register offset headers (patches 6-9)
> > - driver support with PHY initialization tables for both configurations
> >   (patch 10)
> > 
> > Overlap:
> > The series has overlap with "phy: qcom: Introduce USB support for Hawi"
> > by Ronak Raheja (see link [1]). Both patch series introduce a subset of
> > v10 registers (this series for PCIe and Ronak's for USB). I have
> > coordinated with Ronak regarding the overlap, and we can update the
> > series to resolve any overlap based on the order of merging.
> > 
> > Link: https://lore.kernel.org/all/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/ [1]
> > 
> > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Rebased onto v7.1-rc6
> > - Patch 1: no change (Reviewed-by carried forward)
> > - Patch 9: rename QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG to
> >   QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG to be consistent with the
> >   naming convention used in previous pcs-pcie headers
> > - Patch 10: update usage of renamed macro
> > - Link to v1: https://patch.msgid.link/20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com
> > 
> > To: Vinod Koul <vkoul@kernel.org>
> > To: Neil Armstrong <neil.armstrong@linaro.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: linux-phy@lists.infradead.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > 
> > ---
> > Matthew Leung (10):
> >       dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
> >       phy: qcom-qmp: qserdes-com: Add v10 register offsets
> >       phy: qcom-qmp: qserdes-txrx: Add v10 register offsets
> >       phy: qcom-qmp: pcs: Add v10 register offsets
> >       phy: qcom-qmp: pcs-pcie: Add v10 register offsets
> 
> Squash these 4 patches.
> 
> >       phy: qcom-qmp: qserdes-com: Add v10.60 register offsets
> >       phy: qcom-qmp: qserdes-txrx: Add v10.60 register offsets
> >       phy: qcom-qmp: pcs: Add v10.60 register offsets
> >       phy: qcom-qmp: pcs-pcie: Add v10.60 register offsets
> 
> And these 4

Will do.

> 
> >       phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi
> > 
> >  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 382 +++++++++++++++++++++
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   |  18 +
> >  .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 ++
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        |  22 ++
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 ++
> >  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    |  49 +++
> >  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++
> >  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   |  47 +++
> >  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 ++++++
> >  drivers/phy/qualcomm/phy-qcom-qmp.h                |  10 +
> >  11 files changed, 747 insertions(+)
> > ---
> > base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> > change-id: 20260506-hawi-phy-pcie-283933b4113e
> > 
> > Best regards,
> > --  
> > Matthew Leung <matthew.leung@oss.qualcomm.com>
> > 
> > 
> > -- 
> > linux-phy mailing list
> > linux-phy@lists.infradead.org
> > https://lists.infradead.org/mailman/listinfo/linux-phy
> 
> -- 
> With best wishes
> Dmitry
