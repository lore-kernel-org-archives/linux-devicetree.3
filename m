Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600301;
	b=pqFPYdfqgE2YtwylcVUMLb6HivBxO4GNVXlt8WKYuVxOot9g5GvKBV/jKcMtRfPWMYG7
	 w4dqWyu4lw54FBG1SjSEqd1XXH0aDnJavFEeeO/6U1A2PZ+1NLfbJf1OW++JXiDhW2a5N
	 8KDA0GccJcV32bnzhSqWFtYp5CHNoNS1T9KvXLybiDXrifNXgAwo2uENHc5HAJTf/DmX8
	 8BVf/vxMEcMXRz3a8qM4RRVEKVV6++k7nlJjKyQBfL5u8LY+PXPlGtb0iCRWvn+YBVTSz
	 HxrD/9bDYrxKwAQIOfz6t85iVN2I2W19h6/UvCIvE/metH6QrDNG/jChGTQvkTKDuxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zdEZtuUjS8y1Tb3uKWqUvcb4x2mh1O+qRQPxC8ckET8=;
	b=VuJWaeQtk1Ps9CcgTQdJapvuc9aOjRoyuDtkO/ri3lsL10slm1ibaP0+w3Nf1LAO/dbS
	 0kyYjMCahmG+CmXT4M3UbNLeJOGvCG+rjELtZBuF5Mj6ONdVdTNhbIgJQwupYn5Xlily1
	 6Ss9rsPWper/CfaFNwVfUquIFoXYnoj04VRd53L8wFlJXJ7nlT0Kk/dB297jmfzzLj56x
	 CBfHRVRqB1HYx0S8j3EWtMN00HE+Z1OdNDPtHGGBKahzXXMa/R7ZqsV8946PCUVC/g5Vj
	 O8XkxPzi9towpyHxfELDzNhgRCdgXrEllX9j0k18mB+wcDlEoCoSJry242ShXDn8Ehw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PgQNqmsf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g+Eo4twy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDB8606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 06:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBDB8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PgQNqmsf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g+Eo4twy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vUR62192524
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 06:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zdEZtuUjS8y1Tb3uKWqUvcb4x2mh1O+qRQPxC8ckET8=; b=PgQNqmsfPonVZmec
	n80aPct4TSGXGn28OH/qivlPXGnNMZF0baYme5WPQ4IZFswJ2l4tJlfHA1figs2B
	FPUXEM91nnVMBi5ICHrLnYRCuicttZOLPKwicBHAA/l2spK+t3ykjfjcdjYCh1dX
	FGnHLXr8PaJaf2FPzpTzErD/fKWlN64i4RPo53kONk6xBPal7vQqr0DQu2g7FB7g
	i16HTQBeLuu4IF3+IGYimPLpbuM5NKKRopKczY7wZJIAXHAHrgrmWGz/JVrGZRUm
	+wUeaQKro3zcao8VY7DGqq8fKL9b0TbwF+xxfAIUciMZm2Rkx6JiShnBaiybLw9e
	RjAXPA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93en9gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:18:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e987ec84afso22951925ad.3
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 22:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793600299; x=1794205099; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdEZtuUjS8y1Tb3uKWqUvcb4x2mh1O+qRQPxC8ckET8=;
        b=g+Eo4twyYUXALWDkEOdEYgjhac1uiMoBQLCjfWcTl1DcbIjzJuApXu9ZiH2wLDhXV5
         5kz5QTplIe/+RjM4JnHIuv59wtd8MZURafqK2B1zsz+q48kaoMlqhe5k16BOwkzYQ6mT
         JxEo7rjF4kZ62exVNxNSQduhODP3vohJkgrM8bz+4gs6JWopBbtiiDmhKR8M+kmfxmqm
         /rytTEbd6G9bk8k814E97aFeN51qfqxUqqppRwYQxcKHAN+c5+4c8S4UWg6FpYGIL8c2
         xzV3kDL3pWhe6c3AT5/wzVbeHkPcIja5tKKXuaT6SsaIOXeFKs+0BflWU5bdAIRagHsv
         bSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600299; x=1794205099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zdEZtuUjS8y1Tb3uKWqUvcb4x2mh1O+qRQPxC8ckET8=;
        b=BMSimjQlQu3tKc5TKTPsUderou0bGjQoNS9lxffZF+3zEBmLXJwFvcs1B3zviIb1eu
         tmVjxmsyCNVcWpupGM8AEr3EkZfO1YpsPZjLbYspZbvMDpu0GvSyMgdhxL+SWOAgvx1V
         ySVGU65cacGATEc5RMjf7AcScGUaLh5bTdIBwI664vvA2+OpJ6+R5apshqrHsWBzeM1l
         7PuSM3XsbYOGYKN6vE6MfpW87nPkPCQjEkFs+aRSkUbQ/cCId8Sc+oxoTCIbw09IrBD9
         PklLz6TrKgrj1N29z6+55btSlnTeVPJd6CsPaV39lH093+YyfKC/E5uJ/rQS/qRqyOTU
         OLwA==
X-Gm-Message-State: APuU4Z9mLq3EYPMHHJhCs5h+rNXyOvpguN/SgnFvWgC8UDk+Raxfx4Ig
	IPXjfcFuxMV/OEW2afkM15DBKCun7SJs3TMUOUuqav+t4BPSEoFguR6iPbYNDkaWu9yAsex1SpB
	wWccV5rqsLM7snezbvrjYv9Cg9hnVMLrc+BAweJlvt1cPxLEL8UTHeqtAprleCELz
X-Gm-Gg: AYBFou2D5/7kREYt9mK0LQhVuOUlDAScCmgrBBj3H8XVl6tqdW5wnWs5HL3bnIg4djE
	J4wanysjtqMJ9cItUP36LfQqiIF+mzZe4r2v8PbQD74wTbsgj4GM584+tggVr+6TpM2Ffsx5IFS
	EbvpAeyIzhKpjQlRYNz3wRtyAXHuIFSQTQasWqWgZMA2qqoeJtqb3wZF8bvGeE+c8XYHMGtQ75t
	hwUXWakY3c4OX5v2ehaPy1eqeumJi12hRH4V2nPR6JwOrU+UXjjCz3737zwc2f7NP+Q/3Zmlkb7
	v2nsOmzc8eZARo/hDpbVX/cZV61Wc5nx8dmq7XQRC+jFDwuFble4NavWBGdk1X+6RP+TwzfPjf/
	QhfP1cGA+gqVhErcJIfkB7Uy8TPtwwONrXjYcEwGeT8hXxEJXWT7EP6wsqMe6KcLYiJ9L7KM7s/
	PuX3NJ
X-Received: by 2002:a17:903:2a87:b0:2e9:8535:5141 with SMTP id d9443c01a7336-2eb3647fd42mr89867605ad.50.1793600298968;
        Sun, 01 Nov 2026 22:18:18 -0800 (PST)
X-Received: by 2002:a17:903:2a87:b0:2e9:8535:5141 with SMTP id d9443c01a7336-2eb3647fd42mr89867365ad.50.1793600298326;
        Sun, 01 Nov 2026 22:18:18 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39230bbfsm22535525ad.19.2026.11.01.22.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:18:18 -0800 (PST)
Date: Mon, 2 Nov 2026 11:48:14 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <augrJqAg0jwM/Yuy@hu-anantiwa-hyd.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfX8Gsei+Fwap29
 UxanOYaMsYA1PK/YW7e9e6SHcJ9eO3PmT8oso3X/rOK4F1dsZ1RIFbCo1Jz/Ao7c1M+ZNzHVR4J
 JNx6ELvWIUKL9dG4BEtGSVb8MFZpvcFwBB7GMsU/X4yp5B8ErV/vRL3kGK0mQp3536aJqiNYRxb
 pDcVD1BVlkOwe35bbzvr2WGgxcUPzbnwk5AQ6Kxd47nP+Bxttlf87ZJBp2n7ykDonyP9v3NY93c
 XeFF475DKN+mbU2OuQhEcKW1vCcjjMw9Ghu48CtdDslnza9mlMwTEe1md8H4PG7rM84gIE42Fmy
 0jDH9tGX7GiV0sOBDddhysYJyJolbJm7gX5zpk8uUkcqe0l5RY38xs6V4t8B6xZq/7FHObpgm9o
 UQHcewK/46K+FY6/a7LJcnyuv38qe4UT7O1gSDZf9CcfsPd4xhI0Iw32BVzK2vzJd2N6At3Y6zE
 NEP4c7BZQv12VtdSIWg==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae82b2b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=DfhYv1hxhrLySWN8tNYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: ZYu_94Ns2uzSQoBRFVFxhbvuIhwmpvfO
X-Proofpoint-GUID: ZYu_94Ns2uzSQoBRFVFxhbvuIhwmpvfO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfX8Yu3YjQ4WesG
 8r8XuPoHuUgDyT4+oseIXt5w+7XnC6HwfJVbcTHorKkHMLpatFe6vZmbBkZ67SSSnDcaq3+NSEI
 uOssCtjsXo20W+AHv/9UV0WaarJOlAY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020024

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
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com?part=1
We will handle this.
