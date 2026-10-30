Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370667;
	b=depR2ZJLhd3GXaEFhiI9koZL/c2UnjCV/NAQF+ruUU8YbRBFmGdPMcw5fUvvitRrgSLO
	 Lkg63WO7mIqa2oGKnxTN8jhqU96a98eLblMi7Mte6IfQOE5rosukGreg/bOKKgZfNyC08
	 ap/lF75SoqnS3kIcV5v9DT8PkSWx9SkSppSocdjniTOImY+If+AuLoyZEyhz49AwXqGsa
	 o9hCPWmmfZx0ADlUQGc/vhgh89fxsIvEBnm4zumVw/xg7cv2qNvIt506ZyOSxXpdQ4c5W
	 rIxJDbn39+VaCGOYT0byP1+VQPq8GNA8NoaPBNvZ3QpRl9BAksasjxA1BnZGRP8IG2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370667;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0oPHy56QkcZEgYC9Z+yVB0occlet/28li9Be+vVQ3xI=;
	b=G/5SCLbqXZ0rqz/qXGxo8tpQ6n1hFj66+JMFK56eabnp8MAks8obC/SgIPijGcN6fb1w
	 zpCPvD2sZKCXqsPQfD+h4WeGwoe7NxTLhRq6f413A9rqbPxe+0rBVnzh3EqoHFLX131KS
	 cEkWHrEk9/fSBrPTcL3SSghj2juyNxLfe0zqdBQqnKMpR2inHqM7FuC4cCv94pLZzLWHv
	 azyZ7ps2AgRnLEbJeTKuU2tPLMEMO8eMTBJebRngf70r/nIOxobBrEGXmmXSKSWYFUk4S
	 lULPbLaPqiPJ9Y1JNfYHldQSrZplggK5F7aRdyqLxbseZOy69V7ig0lJ79Jntc1l7mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTAx3AFk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aL05AlYj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CE0606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0CE0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTAx3AFk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aL05AlYj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER3qW377953
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oPHy56QkcZEgYC9Z+yVB0occlet/28li9Be+vVQ3xI=; b=ZTAx3AFkNOyF70Bt
	hUswdeYulFQe7uuS8tZkr6zKVWqmI6hwQN48p25dTOnYfhlZBqGUw6sihtm4TZ/K
	bSQjp6bK1Gx/aT6fg5fqgsGEtmUXjQsyrwKEDoXHyQg5rt1svezAA8+FQJ1OWnAW
	JhZJtreUsBJlfJk2t+7FZKfeBOcSGhXHfFkHJgnJ3VcJNWO603x2yB/t/DKxmNtG
	x8URvFLQ2OGtE+GgLtw28JoxDmG4bp4FztaeW6bHmeX1tCEwUcE2/a+lw/gR8aMM
	6HCotEXqaF9Ls+hgUbeoGvkmtm2U6Ngh5aOXnfv/landWJRwQqe22DfVjtyxzXNd
	QjHAMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme753g1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:31:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e987ec84afso7657785ad.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793370665; x=1793975465; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0oPHy56QkcZEgYC9Z+yVB0occlet/28li9Be+vVQ3xI=;
        b=aL05AlYjyZszCASGo4Ac98UEe2a9brOWIssrwpeFAwziQVu66WPXaw+kltl3/3yOc2
         QrtyFamXBsiGBRzop2yvQ0iLPcfqDZlH/ce6aFUVZfq31S5HYCcLPD9+Al+A4lSI0/v0
         32HCArImyfI2emXA3We1fcM0Sqs63En2wYNGQLSnV2NkMm+3UtbnntLpQ/OUUJkIqOSV
         QAoxZtQ/97cbxJgTvAC/mdkESaXVoBxQgYQKhjW9teCaXyXRUvz+ZYL+wyRwGzV3d2LM
         eBYB6YCZah+heZ4R1P/drzFX9wFmxOyvoXLU4R0ZSqXhckGrlNpFOCma9ZHrWkBViTMN
         imOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370665; x=1793975465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0oPHy56QkcZEgYC9Z+yVB0occlet/28li9Be+vVQ3xI=;
        b=j2QnDPNFjIRLLWbxfb8eJamOwRrDxI7AWxT3S7zoSbDHIZMaBqsOHLBE5mA8uTod59
         lGKnAsWnQYo8yRMsW43PCBEVz6lhV5OFG+Rm0H1APZS+OCNFXT36CfT8N7/oIJG86dZE
         psVfXy6UAYBkZu/+k6lO5swV8nPZD5+LZdFXkE1IleTntHeTN+2hxGd0OrKcvAoQl3jL
         QQrbBXfBuLu1h4Tx5UmEk8H8fOh7eVAFhWDv2cs5MhVEeJ736Oa1K33H7NRKRDt4ZH8W
         SLmHGh8WVVB/AgxvYTWTG34FlMLylx11MIOJTcwonPYTi/ip7DKQ06KEt2OWiK7lhV0H
         8GvQ==
X-Gm-Message-State: AFq9FYL8FwoxtEaOnwC1/Byrnu9+UiDy4dLXotRfcCFvjdjS6n/6cpNJ
	N1KUjr1dZbgsblpIHecp1c6zh6N+42t6CeYdgfss9bxKlgIOWwd9qlYh4rdazl79C6wS+jd84gY
	5v+qsKtDmx7dAyKlzvbKe1HQSsmqYeVftoEUNzCmue5t5JmE/q6Dv4+E2nuKXR2FR
X-Gm-Gg: AYBFou3qMGMJZyvqTUrJOqPxCQN8l++L6rU4Z5rusPsnD61rGBn70MO2HIA7No5N/ep
	ZXpXxSj+yfC4bLkydC8cAo/LqDYZDe4H2jLjXrky3BMuew8Vxgp5nD/tVVciDBEFTEGV3TokBHf
	fQyj5qpkTUA10TfMaUsp1Px518e9UfEqzArtqWe89KivK7lLj+PUNuThKKokQGANi4YE5/OtOd5
	zy/FyHpD6emsoTEMwOOHF/XM8V1Ck0MuXLyy9P+OxLOYUjEZxJZJ+Q5GrCaj2+6T999axhsu/yF
	8+vRo36o13NTD6DDtIxyAtRKtWb4Vuy1RjWWA6Hx4YFJsPA2v2MyEU2Dm7E2S+bq9p9CTP9YaYx
	iVVlWN7IG7rfNegL+sLxrKWFu8zlcXnOUFybJlCXtUGGCprmy5CbTR8uj5fQTfhAzVyNmGhIvlU
	azCUP2+g==
X-Received: by 2002:a17:90b:4c52:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3ae89176b89mr2080933a91.0.1793370664635;
        Fri, 30 Oct 2026 07:31:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4c52:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3ae89176b89mr2080911a91.0.1793370664069;
        Fri, 30 Oct 2026 07:31:04 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84580a0esm4345472a91.8.2026.10.30.07.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:31:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 20:00:58 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <auSqIra143IynR6t@hu-anantiwa-hyd.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
 <20261030-lyra-display-upstream-post-v2-1-906302159392@oss.qualcomm.com>
 <sashiko-outbox-190777@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-190777@kernel.org>
X-Proofpoint-GUID: 5SHOokpYmeQrUxbSGJgug8p7Lzuw37I8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfX8LPR7zKJH9iR
 a7l8mCI7DfD4r3HDkXZyZ8A7dB/cMdehztD/Q006MwuP31Pubrc7M3HGo7nfrDr1X11/5VDeFUz
 vbzo5zhYmKCPAwysTTy0KtqMgVn+80Fg7imCLv+/jlAboq8u/ByJ1fXS4FRgtT1qjqTcP7kDm+V
 K9Y8i7SPcpVny2YKlquXtj2+NBVMYq8zpxM0MpqBjSGLpEpLju7hW52bO0jRuo1CN3U7iqEuGiU
 hpd64OOcCcXFW2KUWzkdJJ+vYksuZeithAejvXYqkUgHwmD6BZtvvkOvSurYo4ROVcK6wAsRZEE
 QW3KwlpXy5ed5AOn8ywvkBrcbfCTOpGWhO9Pg41Co8nnD66wx44oIfIXobdP2ZmJbXk6VZFsOb9
 mcfHNrbTVyEBrn9mpy0gAMfODnRjnUfZeVdsfv7edFL4G1/LS+W5UG3YtGNltwmXwZl3vR8m2C4
 duJmoITnRPxJ0kQbcaQ==
X-Proofpoint-ORIG-GUID: 5SHOokpYmeQrUxbSGJgug8p7Lzuw37I8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfXxAjKDMHl7yYg
 Qy+HIfR8Siq8EfT6t1vW+FGql79g7UopkNSuUMtG2S1hG6GNKe+V3NNf2fs7ZyXJkUjTb5gdGpF
 NFs+11qcFtcpAYNwjPRIglgD5pJaxjk=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae4aa29 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=DfhYv1hxhrLySWN8tNYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300057

On Fri, Oct 30, 2026 at 09:49:28AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] arm64: dts: qcom: talos-lyra-evk: swapped DSI supplies and invalid vdds-supply
> - [Low] arm64: dts: qcom: talos-lyra-evk: duplicate tlmm node and unused header
> --
> 
> commit 22e8de3b84d3ac4983c9f5f3821155bfe2321465
> Author: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support
> 
> This commit adds device tree support for the Lontium LT9611UXD DSI-to-HDMI
> bridge on the Talos Lyra EVK carrier board, connected via I2C2 and MDSS
> DSI0.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> > index d4468e6099112..eeb8e903b03b1 100644
> > --- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> > @@ -4,6 +4,8 @@
> >   */
> >  /dts-v1/;
> >  
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >  #include "talos-lyra-evk-som.dtsi"
> 
> [ ... ]
> 
> > @@ -74,6 +139,23 @@ &mdss_dp0_out {
> >  	remote-endpoint = <&dp0_connector_in>;
> >  };
> >  
> > +&mdss_dsi0 {
> > +	vdda-supply = <&vreg_l5a>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dsi0_out {
> > +	remote-endpoint = <&hdmi_bridge_in>;
> > +	data-lanes = <0 1 2 3>;
> > +};
> > +
> > +&mdss_dsi0_phy {
> > +	vdds-supply = <&vreg_l11a>;
> > +
> > +	status = "okay";
> > +};
> 
> [Severity: Medium]
> Are the regulator supplies for mdss_dsi0 and mdss_dsi0_phy swapped here, and
> should mdss_dsi0_phy use vcca-supply instead of vdds-supply?
> 
> In arch/arm64/boot/dts/qcom/talos.dtsi, mdss_dsi0_phy uses compatible
> qcom,sm6150-dsi-phy-14nm. The schema in
> Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml sets
> unevaluatedProperties: false and only defines vcca-supply, not vdds-supply:
> 
>   vcca-supply:
>     description: Phandle to vcca regulator device node.
> 
> In drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c, the 14nm PHY driver never
> requests vdds, so devm_regulator_bulk_get_const() in dsi_phy_driver_probe()
> ignores vdds-supply and falls back to a dummy regulator, leaving vreg_l11a
> with no consumers.
> 
> Furthermore, in arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi, vreg_l5a
> is the 0.88V LDO5 rail and vreg_l11a is the 1.2V LDO11 rail. In
> drivers/gpu/drm/msm/dsi/dsi_cfg.c (dsi_v2_4_regulators), the DSI controller
> expects vdda to be the 1.2V rail, and other QCS615/Talos boards such as
> arch/arm64/boot/dts/qcom/talos-evk-som.dtsi and
> arch/arm64/boot/dts/qcom/qcs615-ride.dts wire these as:
> 
> &mdss_dsi0 {
> 	vdda-supply = <&vreg_l11a>;
> 	status = "okay";
> };
> 
> &mdss_dsi0_phy {
> 	vcca-supply = <&vreg_l5a>;
> 	status = "okay";
> };
> 
We will add this in next patch.
> >  
> >  &pon_pwrkey {
> >  	status = "okay";
> >  };
> > @@ -113,3 +195,26 @@ &usb_2 {
> >  
> >  	status = "okay";
> >  };
> > +
> > +&tlmm {
> > +	lcd_bias_en: lcd-bias-en-state {
> > +		pins = "gpio3";
> > +		function = "gpio";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +	};
> > +
> > +	bridge_irq_pin: bridge-irq-state {
> > +		pins = "gpio60";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +	bridge_rst_pin: bridge-rst-state {
> > +		pins = "gpio61";
> > +		function = "gpio";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +	};
> > +};
> 
> [Severity: Low]
> This isn't a bug, but arch/arm64/boot/dts/qcom/talos-lyra-evk.dts already
> has a &tlmm node ordered alphabetically between &spi6 and &usb_1:
> 
> &tlmm {
> 	dp_hot_plug_det: dp-hot-plug-det-state {
> 		pins = "gpio104";
> 		function = "dp_hot";
> 		bias-disable;
> 	};
> };
> 
> Could lcd_bias_en, bridge_irq_pin, and bridge_rst_pin be merged into the
> existing &tlmm node rather than adding a second &tlmm block at the end of
> the file?
> 
> Also, the newly added dt-bindings/pinctrl/qcom,pmic-gpio.h include at the
> top of the file appears to be unused (and dt-bindings/gpio/gpio.h is already
> included via talos-lyra-evk-som.dtsi). Could the unused header be dropped?
>
It will be in same tlmm we will handle this in next patch. 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com?part=1
