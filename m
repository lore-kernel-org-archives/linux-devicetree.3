Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738444;
	b=YqC/HUer8V20GTMcZVt7QDNXJQ/mKv1mbOTJZShdvKaxM/aB9f1isdrh1RFmfQ+avolU
	 DtT7iuXu96/VUrqJVNvMJt7KAC8Wg0FvlDFyMFpBeiQtRZQ8jfJo4MM7C9Rr47KLwvOCI
	 xa/b5Zg/cs3p3RbcTRTw9jByHUck8JGIY8HBJxJ5mw0nejlw+FEORoFK+ovKu05Fx0TEr
	 3TvZ1xd4/4k5WGcX9kB21qet6l9YkskZ2/ELklpBOaUO1SGw3W10eMTOQAwusjaFB/7VJ
	 n3v/SVflfVt2PuNGrZUDbB1NPjuZ8Eq82mJO91mthoGpG7rAbQ6EHF7v5NO9Z2TtOKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3Q2dtfzQyTjGkp8598J/kIBhAU4uYfQdL/HvTo54IlA=;
	b=bjkwyMSetEB/fB/FF/SdWihM9MZ0JnC0Hh5VV2hewmym8WgOUOxWhyh7jmihqR0KE92M
	 FjSCgkoSWsj2vXjsylJUsEFG/1zbaqc1rjM1KD/HECSzffjxys4IuuR6PGaFPNYdYWHLR
	 UKS9UdeJHQtsQL0EzJooWj9w4K5XKDT4ln/m/wKbnmlTteyKl/3LDyrMeUFXi67fOVKQf
	 Qb2rY1HxDIvu6yIxI7FizGzOmtLvaEvN3g7NloOGcMnuV5yaJAOa75OKl4ftUZM2jhwyB
	 Fxop2xNTM6Unp/oIJTqz8514wPGResKsP61X8UZLLkLdAkpiVraILYZq2APHY+GgRRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2HaWnm+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aqhrQIu0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66E6606A321
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E66E6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2HaWnm+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aqhrQIu0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FAeK988714
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Q2dtfzQyTjGkp8598J/kIBhAU4uYfQdL/HvTo54IlA=; b=f2HaWnm+6OV8lVzx
	flukcxKDHVfz+kwCv2rNkT1mhVsKv/X+UBccQqFKC0UPH5ZRDidI5FG2yVaLUOKY
	ije9f6NoN6KGwfp9XB3m4M5VJvKTu37jPt6tgwG3kTcW7cR29quR7teBLThygOAI
	qmTXNNZHeQz5bQT14WlsFTInkMFgYPFkfP5ycNYIGn/bQZ/0COoWbgQyOTlV8o0u
	umCqh/l9oP5Z84btCWw1ZPU3M11bhl8zvxnLQKv+S7EsLBIbbV/RdLGTiPS9qjL+
	paC1P5Wtc+hpZpCDg7E7Np3LHQf+Z/lT90EmYvU66BpeC5c9w8+uY9sVIbyTLMOf
	Z+LZwg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahtrqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:54:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e83d5e518aso702985ad.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 23:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738441; x=1793343241; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Q2dtfzQyTjGkp8598J/kIBhAU4uYfQdL/HvTo54IlA=;
        b=aqhrQIu0arlDz5ps9Ro9xYyEzUY4m6Wg1S+r32OPx8LrwGiniimRYk0oh9rmWfgl1s
         RWrwIOjY7Bhu68+GtEfgQ83mhJH1p2zkNcV4pLMGo1r+BSskFly3eGaede6Jhqa1Rn41
         XogH7HeY4THhS3K26vDtSPSMu4317n+ItYkOKagEZjesWjnfbJoSZHd6gVxRGX27+bWT
         n7k+mnQdX6rkx4mgtAYUh4dYIl4hfgrK9Cz+8oQBbQ8M4blIv6OA82FRhd1rGn2l7g72
         ZozAskqPRO7IHV6CkTlAt/mHxPqPJrtBolSYKRrXsFhzPOItDGheQdJiSI8BvgirS7+u
         9VQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738441; x=1793343241;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Q2dtfzQyTjGkp8598J/kIBhAU4uYfQdL/HvTo54IlA=;
        b=AyFSHH8FFl4i8YtYoO8PNeZnxB+3/pVjpsuuoWNxWnixBpLQPC+GtgJlIsrCdoPHMi
         gfve76reVDxmZpo7rtBCTICols7+zq8RzGAiKhT0pSvwOvyzhGTHhUY+O7E6FyBHl914
         AokMsU46ozUUK5igsZ32rYzX3iQZ3sudPP/l6wGkcDzjIIPFxWMfDErtUcRIYNZkIEu6
         8ggvDXX5/YSYhZFN/Jg5AQUpu6a9fE+2nDV4+mZQiYucdBaNb17oUYt+lj663UF+7DMr
         Qa/ti38izgObuBbRM+raSpzFXJbl8e/02vI8mkJFWW0FKXRyggwr/VPUEklZ52yUVaY2
         MEeA==
X-Gm-Message-State: AFq9FYIaHeR1TD3yQXTKFSMWN6qZkE4bjrwmvdlox4u8tr+yOdQxHRjL
	p4pqym+XJEP7+zIlZY2Any2uBZbqrImzkYdfdEM2HHiHKh5UGlmK7nc8/E6XNN4PiFA7swPf9AJ
	7JHQCnbWuMJcfwJEe4FBhl7JzQJZ2IuuCz4YYCtEoQwrgq4DSyGj6tpHEB84rUaTO
X-Gm-Gg: AYBFou1bxivZ5t1yOJ1xVtNx78C6DvPn/bwHKKiqa41zcx2Sn6GaLAQLn65DanLQY+t
	dCYp32JNTErhSEbwDJnUo82JI2VR3PEkXF5pipgtsVg/klAQe1hxgB5x5hFZYonqRCEg0JB1xMD
	n+GHLIapml6enxi+lRqSJEDdTJuqywTLBB4YJvtk3sEOYmP/kRPirUnTzMWg9KyOMn5Xqr1dvp/
	Cz7rxCfZ9WT/KAVKdJiP1XhVrx+UIrXfx3dugSYtIFTIneImz3B1Inludp6ZvQv7AccYQlhg2XV
	ouM7r/EKUWfLM6/NWoUwsENx4pDEEg5kI0Os5YyrMtMcznHJaQa617feew7KA5xIT4AX2nHOO4W
	loYiBfbQJ8qTnFX3UrjgwNiV/fTq13qvLEHOug5vZHiye0tOA4Al87V48Kte1x4DIy7sT1HW74a
	8qkBQIi9z1VhBype8cbtND5CArSRFzRzK0yM16zpsF7aNVlBtNcdUm
X-Received: by 2002:a17:903:b48:b0:2e9:5714:607a with SMTP id d9443c01a7336-2ea7cf5c25bmr25816525ad.2.1792738440632;
        Thu, 22 Oct 2026 23:54:00 -0700 (PDT)
X-Received: by 2002:a17:903:b48:b0:2e9:5714:607a with SMTP id d9443c01a7336-2ea7cf5c25bmr25816165ad.2.1792738440093;
        Thu, 22 Oct 2026 23:54:00 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b345e74sm6228205ad.24.2026.10.22.23.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:53:59 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:23:55 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01
 LVDS panel overlay
Message-ID: <atsEg7t9SqAdMSZi@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-3-adaea735999f@oss.qualcomm.com>
 <sashiko-outbox-180380@kernel.org>
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
In-Reply-To: <sashiko-outbox-180380@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX34LjUwJcKWSV
 qm3HXyMPhyo12Wm7k+H/MIMXoRg0UIczETL+yEm60ytjdoj7srTa5A3tW0EhiiuAvfqVyh8jCy4
 j6BdGt1BTb49Vz2sGWBD2KkdHsdXb6g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXwXeN2RzTFZ/2
 lQI+BNP6TEAMGCfIETQ3CSXlfq0mAQkyyb/3qg6TfBjGLbQmiwc4qgabrt2svNWQhZbA3L6z7iD
 DfkRoRXRRM7SUktvx174E4nfmm/K8apzBR/XhkRYsXCunZ0EZxtYMEod0XpvmN2bE50hBLzA3+9
 mv/cQ+9Y6Z//xP9NJj+tFKEBUZyXiaEa/s3qvgUprka9E86Ff1ypK8yuD6i6F5QVy16q8XELb1l
 OzUQtsMQbI5igm2Qdyc87hgju0puFROboL12idZDdpeIJBE8K2B+H/Msgzwlw4E7PXdE0QR5Jck
 R7+dRWh7aMHQE1NTHFLEu+jse7+gzyxeZVvh0lyxwnXMn2r22fO1hfGoB065ZmeHvSeG+AsPGsj
 CfZxK0806PcG9bB2Gt8/cHFTNkr2sn/u9ZN5ZxAJC7hXZ5bI1tjKzEMTFXAgxbblxQ/4yMeqr3h
 V93U+kbmg1OEgAwiEsQ==
X-Proofpoint-GUID: 895WDDjcG8amnaUfW6apFQY4zjZu2jWd
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb0489 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=iikEsoYwSVwlKyaL4B8A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 895WDDjcG8amnaUfW6apFQY4zjZu2jWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

On Wed, Oct 21, 2026 at 02:33:23PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] arm64: dts: qcom: missing status okay on i2c3 node in lvds overlay
> - [Medium] arm64: dts: qcom: missing backlight property in panel-lvds node
> --
> 
> commit b4b78d829d507a91f08f278892b57ecc12f421d2
> Author: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> 
> arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01 LVDS panel overlay
> 
> This commit adds a device tree overlay for shikra-iqs-evk to support the
> auo,g133han01 panel connected through a ti,sn65dsi84 bridge on i2c3, while
> disabling the default hdmi bridge and connector.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
> > new file mode 100644
> > index 0000000000000..80b9dcc920612
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
> > @@ -0,0 +1,127 @@
> 
> [ ... ]
> 
> > +&{/} {
> > +	backlight {
> > +		compatible = "gpio-backlight";
> > +		gpios = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
> > +		default-on;
> > +		pinctrl-0 = <&backlight_pwm>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	panel-lvds {
> > +		compatible = "auo,g133han01";
> > +		power-supply = <&vreg_lvds_3p3>;
> 
> [Severity: Medium]
> In arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso, the
> backlight node is defined without a phandle label, and panel-lvds does not
> have a backlight property referencing it.
> 
> When panel_simple_probe() in drivers/gpu/drm/panel/panel-simple.c probes
> auo,g133han01, it looks up the panel backlight via drm_panel_of_backlight():
> 
> 	err = drm_panel_of_backlight(&panel->base);
> 	if (err) {
> 		dev_err_probe(dev, err, "Could not find backlight\n");
> 		goto disable_pm_runtime;
> 	}
> 
> Because the backlight property is missing on panel-lvds,
> panel->base.backlight remains unset, so drm_panel_enable() and
> drm_panel_disable() will not control the gpio-backlight device during
> display blanking or system suspend and resume.
> 
> Should the backlight node be given a label and referenced from panel-lvds
> with backlight = <&backlight>;?
Yes, the panel is functional without the backlight reference because the gpio-backlight device is enabled independently.
I will add the label and backlight property so that it follows DRM panel enable/disable lifecycle. 
> [ ... ]
> 
> > +&i2c3 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	bridge@2c {
> > +		compatible = "ti,sn65dsi84";
> > +		reg = <0x2c>;
> 
> [Severity: High]
> In arch/arm64/boot/dts/qcom/shikra.dtsi, i2c3 is disabled by default:
> 
> 	i2c3: i2c@4a8c000 {
> 		compatible = "qcom,geni-i2c";
> 		...
> 		status = "disabled";
> 	};
> 
> Neither shikra-iqs-som.dtsi, shikra-evk.dtsi, nor shikra-iqs-evk.dts
> enables i2c3. In
> arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso, &i2c3
> populates the bridge@2c child node and &mdss_dsi0_out is redirected to
> &sn65dsi84_in, but &i2c3 does not set status = "okay";.
> 
> When this overlay is applied, i2c3 stays disabled, the ti,sn65dsi84 bridge
> at bridge@2c is never instantiated, and
> msm_dsi_modeset_init() -> drm_of_find_panel_or_bridge() defers probe
> indefinitely waiting for sn65dsi84_in.
> 
> Does &i2c3 need status = "okay"; here so that the parent controller and
> bridge@2c can probe?

audio-codec is using same i2c in shikra-iqs-evk.dts
 
> [ ... ]
> 
> > +&mdss_dsi0_out {
> > +	remote-endpoint = <&sn65dsi84_in>;
> > +};
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com?part=3
