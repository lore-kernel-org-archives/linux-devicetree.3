Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600701;
	b=nO0Sykodhy+iVr78EH1EJ0WTFIViBJ7fXPyYUklXjDGKE92Az38XJ0kB0LaAW+7OkJly
	 3TOmDEg0815YgX6b5e+ZF6NZewNOhuVjoJUXGguY4h9RBE+TrKPBglPBeZUugNRzmWpAG
	 sYon+8WMK2t8YV3p7Mej3IGT/13ypq27Q50nmGf4cdeQZ7hpMLahz8JpUokmrZ2h/DKoJ
	 wFg4IyERjWdgLLkbDLxrS7C0A8m/phus4TL4jit/andkMJNIeaiWLzdeaEqDJjgmt4r7P
	 vSGXMrVVkEpA0Cb/ZFkIaqonjJifbsZMIscVKalreJ2nra/FYIrT7hjcC4wMtn5x6cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600701;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sgyVdXWHLy/VaK6Nz1G82ifQVYoUNMdhodHec1iy7m4=;
	b=XBrD6+dqO1EQEtPj0X4XcZYWx4OpO3FBzmhUYo93QpGcK+Hh+/4fEihEVHeDA9OlHJkZ
	 qBbnFKR95yVgR+4CtDwm7O8fnLFzaFsRD6POAIHShYi/aTaSwoMEJm86GH7lHeqUmLCLf
	 fy6/JAfAy7YWtkoIma/M3bVm+0YzbVCUYUUlwUhlGmHfcYgHcOcjQvfD5ezShOlnvH1FN
	 Z/TQux6II5/2f5/2gAsTOsZ5+FxRzlseb7khLfWn7WZYIr2Ai/a6Iyqdxf+M7++gv6q4e
	 BKiJSk6Ox1xXLaAaMlIprILy66Wswz6S7161q6ty+HYrcKPvApzSkcUfyIznUJHXJwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e5RYolC3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCfVKBXo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8222E606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8222E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e5RYolC3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCfVKBXo
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mhrV3642160
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgyVdXWHLy/VaK6Nz1G82ifQVYoUNMdhodHec1iy7m4=; b=e5RYolC3pB6Usbq2
	NArehm3NoaeHNknyv789flqC/pn1zW7gD3S1kSBxJHoznDVry8z4SARtLqwzVAVC
	wR1MpIKm9AC/K+ZHQRq24HPMmct7MKfVBptr0zlXEJfJKw29IY74VEIVpINBVj4u
	U82T+B8N7zt5q8/mD1rKYNimTYNJW7/63kvH1DcgKUOIVetTE4trte/VLkEiJwuA
	NQCVu5doHt+ksFn62bQ3uevaPjg0Ee5qxQZ0srkXAXpLicjeOUmiu92BuwO5T0Ir
	d4hUcCOnq4BAs9lz4prQ/2hn4SXvyJo00VvkHROBfObgPHjf0WwzAK+4NapNoyms
	QHufrw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2a7uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:58:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e876e33e6cso7357295ad.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 01:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600698; x=1796205498; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sgyVdXWHLy/VaK6Nz1G82ifQVYoUNMdhodHec1iy7m4=;
        b=WCfVKBXohb8J9htiyrxqhaMYe4K7PKgq3puquOVL4miEAlE13b00JSRYc7TQY3zI4p
         fC4d4n6+fW0UdtQMNtv/Sz6s+0oCzuFCTrfx4KvK5MJx2U41E0QOop3WZJmG14H05RWm
         vil2ZXq6tKlq+wfIK0sgOaPIA39XVtRTYfLMYEk0x5FjwBL7rhm8NkwE5KHz2FvA6RvH
         yH2zP/AeNzWTwfHK/L2S61xnMkzJQF5YYQfmx119TvsdNGF7RgaOtDOKPvP+dCtJ744B
         xo2eE0yQO6LL+JweEVSG62/M/5Ry091t5FtE1zR5kk6Cz5fjP+PHmHBAnpSlh1fLqxn8
         jAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600698; x=1796205498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sgyVdXWHLy/VaK6Nz1G82ifQVYoUNMdhodHec1iy7m4=;
        b=Ul06ipL3FQJBwYsE4GN8qQli/NPv/YDWPaWHnhX2e6kxrUF+SMPS2RMWjxpKaYEwew
         qprPakBdViG5WqnpaekcLlreEATVEVA3LBIAJw3vtQG5HaxvFyhOnc3RKv2CLWNvXZxM
         T2u+3frPiv4K7PBRVMmqy0LmQg3v+Jt0L/eslil8Dgy2iLzwppyQRzxmsw6BLKP1qurE
         FZaukHTXRhtroyo1g8ium0UiOY2S1XllCtk6SoZpMNk8QUY2bZfjgBofVp4MFkSBtzX1
         EWRnb4UY5b/AV2VkoCpT4KMRQAExufhmjL5TVDgqAqihhmEClEC1bBvBWx5Nwho/bZK7
         6nlg==
X-Gm-Message-State: APuU4Z/i5Pt+C/zGRmTwqZXuDLp4kgwcwccVGdwKG/mAfUfSZBmqBnFW
	QOzWGnnl8EYzTSluPGjh0ktdyDRdf9GdpPspACcfaX68WRJ8waUnHkghvUc/PgtYueh60eQbnj9
	5BlUI5/cvFELz26zA1nl04na/QRd4caXuANLRNAfklGLScNbZpgfdHA02tVGnYlzY
X-Gm-Gg: AZFdTZflvy5e+1TfZrVENvu+3DTrvwT2mEGQEpPKXsbEAWQVAFhGFEfh8Ewr284k5tG
	6Hk5tXY+DAxHnjdwFAi0DiTgZk99YQN6x02ES0IOWNumZk962P0bF2qlGi9uFW1QxgTCF8S6ica
	HWu5yv4/xnyDTwhZ44kc2NLnsXDwZyWK4cEr7Wd6yKD6ifwrKjDdGmlALe9k4i7tKgPcdXpGLo+
	IP0aw/CLv0zaazMuxHWEmzVwZlrBoivsNDIWbQc74SkM37TPO5TztdjAjMXOe+fBl/VBsMre6zN
	8HiN9d9sGOiO5C1nJD+79f81aP2tmY9O5DDf9GuUy4C3SV/60d1TXiJaYs7/Yku2MwYYKQZS6Eu
	19AdrZyMUkqrsrixZHwwcOyAIulYndnCjLPaspZJsImft2HL5ivkxOiTOw1QIcM8fxs7tjJrOsW
	nHy/jbSnm225BXIiCzp9e2pBBoe82pvqqOg72tenrpWHs25RIyoiatq0MQmJNfUHC+ETTMs3Imo
	rvCdiRdfY2OWsWD78nq2HS2djqP
X-Received: by 2002:a17:90b:3903:b0:3b5:a3:4435 with SMTP id 98e67ed59e1d1-3b500a3466cmr548243a91.6.1795600698347;
        Wed, 25 Nov 2026 01:58:18 -0800 (PST)
X-Received: by 2002:a17:90b:3903:b0:3b5:a3:4435 with SMTP id 98e67ed59e1d1-3b500a3466cmr548218a91.6.1795600697845;
        Wed, 25 Nov 2026 01:58:17 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm29689157a91.17.2026.11.25.01.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:58:17 -0800 (PST)
Date: Wed, 25 Nov 2026 15:28:13 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add Waveshare 8"
 DSI touch overlay
Message-ID: <awaxNbLxXBjaJWyc@hu-vishsain-blr.qualcomm.com>
References: <20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com>
 <sashiko-outbox-213671@kernel.org>
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
In-Reply-To: <sashiko-outbox-213671@kernel.org>
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06b13b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5ZI3I9StS4G_EHnV4-kA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 7EFxHtr-y9H4cWqqvjJ91sYwlHyr3R1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX1hWzr9Y431KN
 yT4HK62n/r2raF46RmzySDKljLeE9OPzN4FkVlg/+khrsKN40w/PvByjeR8ZrE6JayLyv4N+MOq
 j4daF561wMiAIGrYop5Z8+Fyp+EqPJSyX7ms3Nz0SkA/2YOcjcDVZMcID7aD43GRrbTYvbV7IXC
 0D0cGMeftOAljKliLl3Vui/mKf74i7R6eafjJ4Kj9RUG8cr3inFZTXLuA96ngB3SPeMmJi6Uihc
 3UPiBZa3/2ARAInih0jH164JsGGgBORwbOMyrmv2Xom3jwEyoBuuWOpbiYnEzIl4PlVVTBnlGhD
 F1murpCR1fMuDAouDyTc4k8Is0QG/FUAaR8rD2vSqLMKClC5r8VcbUfeZgNv8FfvpvK13laotbb
 q/aCmLb1CbVvB/0lmUf69u3DUncHP4kq5q8IWXnbU284fb/umTlLYYq+jSh/Y6n2vWu+BeBaTKL
 R2NfzgY9DX8SnB7JCIQ==
X-Proofpoint-ORIG-GUID: 7EFxHtr-y9H4cWqqvjJ91sYwlHyr3R1q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXxj5WwBFEb3x3
 0PKhN7ymzMWRc7DW9z7/Q6mDqqoTKqeEduRjs0IvMbVfLUxY/4hiI48h4eZ09dTkfwRft2u5/h3
 ObOphNFq4y7H3IFCfasyBOwkS+mltx8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250038

On Fri, Nov 13, 2026 at 08:42:10PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] arm64: dts: qcom: monaco-arduino-monza-waveshare: wrong
>   mdss_dsi0 vdda-supply
> - [High] arm64: dts: qcom: Makefile: monaco-el2.dtbo applied to non-EL2
>   Waveshare DTB
> --
> 
> commit b8a3c8f8c7e536ea10afaadd72a3ac9f01d55e3c
> Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco-arduino-monza: Add Waveshare 8" DSI touch overlay
> 
> This commit adds a device tree overlay for the Waveshare 8" DSI TOUCH-A
> panel and touch controller on the Arduino Monza board, disabling the
> shared DSI0 HDMI bridge path when applied.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 8329c06b60a3f..faa0e0f7b867f 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -83,6 +83,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
> >  monaco-arduino-monza-el2-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo
> >  
> >  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
> > +
> > +monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo monaco-arduino-monza-waveshare-8-dsi-touch-a.dtbo
> 
> [Severity: High]
> Should monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs omit
> monaco-el2.dtbo?  Including monaco-el2.dtbo in the non-EL2 target disables
> gpu_zap_shader and iris, and attaches EL2-only apps_smmu IOMMU mappings to
> remoteproc_adsp, remoteproc_cdsp, and remoteproc_gpdsp when booting in the
> default EL1 mode under Gunyah.
No, this is not a problem monaco-el2.dtbo is also a default configuration, Panel is verified without monaco-el2.dtbo  as well. 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
> > new file mode 100644
> > index 0000000000000..003c5bcea4973
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
> 
> [ ... ]
> 
> > +&mdss_dsi0 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	vdda-supply = <&vreg_l1c>;
> > +
> > +	panel@0 {
> > +		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
> > +		reg = <0>;
> > +		backlight = <&wsgpio>;
> > +		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
> > +		vccio-supply = <&panel_iovcc>;
> > +		vdd-supply = <&panel_avdd>;
> > +
> > +		port {
> > +			panel_in: endpoint {
> > +				remote-endpoint = <&mdss_dsi0_out>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&mdss_dsi0_out {
> > +	data-lanes = <0 1 2 3>;
> > +	remote-endpoint = <&panel_in>;
> > +};
> > +
> > +&mdss_dsi0_phy {
> > +	vdds-supply = <&vreg_l4a>;
> > +};
> 
> [Severity: High]
> Does setting vdda-supply = <&vreg_l1c> on mdss_dsi0 overwrite the SoM's
> 1.2V DSI supply with the LPDDR VDDQ regulator?
> 
> In arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi, mdss_dsi0 already uses
> vreg_l5a (1.2V), while vreg_l1c is the 0.3V-0.512V LPDDR VDDQ rail:
> 
> arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi:
> 		vreg_l1c: ldo1 { /* LPDDR VDDQ */
> 			regulator-name = "vreg_l1c";
> 			regulator-min-microvolt = <300000>;
> 			regulator-max-microvolt = <512000>;
>     ...
> &mdss_dsi0 {
> 	vdda-supply = <&vreg_l5a>;
> };
> 
> &mdss_dsi0_phy {
> 	vdds-supply = <&vreg_l4a>;
> };
> 
> Overriding vdda-supply with vreg_l1c leaves vreg_l5a unvoted and causes
> the DSI driver to disable the LPDDR VDDQ regulator on display suspend or
> probe unwind.  Both vdda-supply on mdss_dsi0 and the redundant
> mdss_dsi0_phy node can be dropped from the overlay since
> monaco-monza-som.dtsi already configures them.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com?part=1
