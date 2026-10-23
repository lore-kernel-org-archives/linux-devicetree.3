Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739783;
	b=w3tCWjAf8poe0V3dlaSlLzYtKXF/A2V2C4q9eAztKJQqp+653+pljJIldOzysbEHf2LG
	 jRnLLTnlaR84zO+Fvvuou5VaouyPOPZobPx2P6BA0x1M7Rdx411fNjF28GTvm0AGB+yXP
	 Bye64LWNBIMjqRK+QJpycbuh686WSNB41bmsvA6C46ix0NRjHs/TfaBJIkTGAUkil9Ni6
	 lAsG6PdM/l9zJiWoFSkuDU57SbLpjezJPYwS6fDO0QW/BYjgf75kRWKkIFHwWzGOzEK+y
	 mO11PCTdqpdMcaK4crTKMOIt9cXJLt0I2Om7N7cY6soPPbG3S6UVnLen4JIrbOxb2MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739783;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s1VFXOjcBW1JC1Jk+DpwnlnF5IjL6XkaTgCWHMd/YBo=;
	b=ojGXmQz2i7Ak/lUYe8GZdl5Pdo4PRErgX+aiicY8ZqVHK38g+8lKozl+CwO5wAegsoLS
	 tBDFWg2SgO29dl1eJ7Bkc3vw5jLvpjOg+AKxPIK03l8qRxIifVXuu/IbHtJJb7D7kn4YY
	 u5MMlUroMr7ueS2xyc0sESYZdzeeErWgXOV9NJw8BeSEXYwbS93/jdQZcwRcnp/Fu7rQs
	 NO6NWK8zyCeBrvjaBExTEu5XP+Qlmr9Rt8KF4CiMWH3b6ue8hE6S0Ps+DfawxizlduTGu
	 qL0VSEf3XcoxwaI4kXMMuzFNGd8I/X1JttbzFl1PvaJg0bT3yIyJOXzlaysgHI4KyUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hF3NcJlN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mk3tDiME;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E6606A324
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47E6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hF3NcJlN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mk3tDiME
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FTK32650388
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s1VFXOjcBW1JC1Jk+DpwnlnF5IjL6XkaTgCWHMd/YBo=; b=hF3NcJlNDqUthbL5
	ZW/1kDZOUaJZmhocQARRnqq2OuNB8ImFH5IikM7iMes/OhGbFeuTK93i+f1KpRGN
	zTZQFoIaEqDhthC7d+IovQdq61y+5qHq0ZkdOWnpewPuxFvwjDv2UrcCbrcRalyn
	uOtUQ3JM5LE7Npy0hN11+mF/hafWZQXBoKFDQZOgOoTqcTUnY/k0KlUvjOYTwahW
	Pzz+GwX8xznBFbZ/wrucrsXzw1K/1kpIxAjZ2line9u3QWvB3tvSPxDohFMTGq8S
	44AMBIc9Qik7xhBs0kUeMl+ZHJX3ecfokGy7PMvoW1/fo2hu51QqNs1GYW0Rk+N2
	KKRzqA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjafar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:16:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac8116f6ffso155811a91.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792739780; x=1793344580; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s1VFXOjcBW1JC1Jk+DpwnlnF5IjL6XkaTgCWHMd/YBo=;
        b=Mk3tDiME1NkVL2Lfsm1PbdIjFJC8FM7+xtaBCLnF1QWli5/mCa3cA64DyFVcHJKJUc
         bDhXsqAgkd6L7fQVyzvU0mPQWo0JVridqCEiEJ+qkJTo6FSc8801yE/Xn5oOEckRIkat
         0FwWm5BWxgUIdqXdJ7MNPuHyzej30l/2VXHxk8qHaB2jSC/pljD7l0yJEUmfVmMowgN1
         9i56GpU3zuWM49297ZFKsqEbzCBrxrjyaztEDlCgl9rrDUytCTgZ+1hUmTNaTiVzh4VE
         TDAlxQb2U0Bxcm6kAGbJsCXjdKmZYVKayyWDtFUArPDWCdO1RiMO9Y70X0/jXPkftaqD
         00hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739780; x=1793344580;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s1VFXOjcBW1JC1Jk+DpwnlnF5IjL6XkaTgCWHMd/YBo=;
        b=1o0xY9I/SD7EeTQwSM18SgwhtBdz3+i0pd7Pp7b5kbH4JD62PizRfImNTERv3pHSr4
         N1Ys34944pYHuzZ1FL61QZE2w7ABLH/YWPMzbaLxI5JDhihjLw0bFMAf0abPfO0v1kh6
         L4EEdkZy3L/yPcScETh5aPKyySocBK4jBrxLyZyuggs/cOpL4Bvyz0yIYHzcz2DEerZ+
         9XQHHc02hi+IwEOabQF92Kw3b8SwEQq22uy2u22kfRUJ1kuagNeCAlQE/UyJ3ceWREWr
         t08rtNQm61QYZWwlJIRsLyhpKqcNUSgxNaUqjvBZx/4YvqsAiQXjaQwD7IvJoXlYETrl
         dr3g==
X-Gm-Message-State: AFq9FYJV/1yAm7eAjO9wYDk82esufjRe6dDLdfA/biD1wf7/M0tlH1q0
	Oy87UnDB/xpS08LJXD1PQAuuQpYe1sUuvu01ppTC/Pe5Mw6pSFDdIyoMJYoh3rYB5kfaaqQS4vx
	zPSOoAsC/eJKNZRHvZvXPYgxf4GE0rOo8hU13SGUwrAMWPi2Vr6gEE11UcRH9v5jH2qgmne6H
X-Gm-Gg: AYBFou0EGPbsGXibgXCzqrFwagS5X31R/i8NNNC8QcJyOyskjw63fFe0lmtXeWVoWrt
	buBZ9n6csbOoIxIbNtKguvki1zQ8/JrVJxTHRRvrHEwQck/43ooO1UBqyXDUIbRukP2K7AinVsX
	3WcgDsp1L9mtu2jxE0vGpxcvmEF8XGixktQ/9wgGLIcbNlmLrESx/2hyMlApfJ3e1qxprKBZD1Y
	NSSbKAwCkq5oVL5KCTXfjyDVyoljVSTTop28DISRsJTJ7xRoU5ZQMmaNZd4gF66gK34K3GLvhWi
	CaUKk/vFjOyVyjIHQ2c/ITnLfSV0eebmh3FrJQEoIZRu5nk89XUmy9/iYfuzOpu9ENp3Uc9wwyL
	x+lM3EEBCjR6x1WGhPGWw//obrlOp4HKJeEZNuKdIG9Z0DvYuKvOdh6L6qQo0RhWL/1lvk+Itfu
	AkuN4AlXI2iVnqn5eweKeN+nRqWjVB4oHyZo5/FDcUaG+/wjlqn68=
X-Received: by 2002:a17:90b:2649:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3adce45eb95mr1975199a91.2.1792739780157;
        Fri, 23 Oct 2026 00:16:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2649:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3adce45eb95mr1975148a91.2.1792739779579;
        Fri, 23 Oct 2026 00:16:19 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add2416e61sm525826a91.0.2026.10.23.00.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:16:19 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:46:14 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: shikra-iqs-evk: Add Waveshare
 8-inch DSI panel overlay
Message-ID: <atsJvlFjvunSZKiQ@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-7-adaea735999f@oss.qualcomm.com>
 <sashiko-outbox-180386@kernel.org>
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
In-Reply-To: <sashiko-outbox-180386@kernel.org>
X-Proofpoint-GUID: oLbGRSWTItrB2vn9Qh1PvExp9bLAYWgQ
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb09c5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ExTeXEdhDUnX6soCXD0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfXzdP95PfG7Uae
 RrO9pQeCM2kmI+Ft4VnZsp9rDHwbnHWkU8jG8a/zPENiVHySg6hIfDWoYOfQqDK/VLASRwR6HNG
 wrgFhi3YwNYYRoeqbCY6BiczAfRnDZU=
X-Proofpoint-ORIG-GUID: oLbGRSWTItrB2vn9Qh1PvExp9bLAYWgQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfXxFzGPbEZNTga
 Td8BTikx46aZVV+/OrBKKj1643ffSyqD/CBGdmugQOjdat/R3TbuS3ODV49VztbUpWta774Iduo
 KLi7NeWC6oxeASn9/uq4boLNNnb7GwKWGCDrm0T74/5Iqaba7om60TnNkTkVLiVbiFrWfg+z/pH
 qzYl3CVtQfIPN2m3tVuPe5cwWr+8rXuDYUhoO2mgXmKwB1yLMA5l9SZbLATpyJumD4atWEAumy8
 xY3/cTufTAEtDPgiYUjNqxu3wFFYctRAPaDhYJJwLT3+kD9MUiYHyBxTbt4PZvc8jhwZ4u1C4oS
 Gxj9qac6BKl7P+wdsm2WrVgn3GdJxoVyRct2YT5z6IP81kkIqS2EMjFrmoBtgOfYhXO+hLaGqxW
 8DP9dCTSj4OaKEpFftME4/9ip/Lkjh8eiQEai3MAfjB7weJTPhWAyMbT7pvjLQixnHw9wK8hQDD
 keCjf21WFoYyguw327g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230028

On Wed, Oct 21, 2026 at 02:37:07PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] arm64: dts: qcom: missing panel_vcc regulator on wsgpio 8 in Waveshare overlay
> --
> 
> commit 8859b55c691118c8af80fdf98b5e594862815afd
> Author: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> arm64: dts: qcom: shikra-iqs-evk: Add Waveshare 8-inch DSI panel overlay
> 
> This commit adds a devicetree overlay for the Waveshare 8-inch DSI panel on
> the Shikra IQS EVK carrier board, configuring the jadard,jd9365da-h3 panel,
> the waveshare,dsi-touch-gpio expander, and the goodix,gt9271 touchscreen
> while disabling the default hdmi output.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso
> > new file mode 100644
> > index 0000000000000..d0aa115681ffd
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso
> > @@ -0,0 +1,77 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +&{/} {
> > +	model = "Qualcomm Technologies, Inc. Shikra IQS EVK Waveshare 8inch DSI Panel";
> > +
> > +	panel_avdd: regulator-panel-avdd {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "panel-avdd";
> > +		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +
> > +	panel_iovcc: regulator-panel-iovcc {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "panel-iovcc";
> > +		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +};
> > +
> > +&hdmi_bridge {
> > +	status = "disabled";
> > +};
> > +
> > +&hdmi_connector {
> > +	status = "disabled";
> > +};
> > +
> > +&i2c4 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	wsgpio: gpio@45 {
> > +		compatible = "waveshare,dsi-touch-gpio";
> > +		reg = <0x45>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +	};
> > +
> > +	touchscreen@5d {
> > +		compatible = "goodix,gt9271";
> > +		reg = <0x5d>;
> > +		reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
> > +	};
> > +};
> 
> [Severity: High]
> Does this leave the Waveshare vcc rail unpowered?
> 
> In drivers/gpio/gpio-waveshare-dsi.c, the expander maps offset 8 to the vcc
> rail and offset 9 to touchscreen reset:
> 
> enum {
> 	GPIO_AVDD = 0,
> 	GPIO_PANEL_RESET = 1,
> 	GPIO_BL_ENABLE = 2,
> 	GPIO_IOVCC = 4,
> 	GPIO_VCC = 8,
> 	GPIO_TS_RESET = 9,
> };
> 
> During waveshare_gpio_probe()->waveshare_gpio_set(), state->poweron_state
> starts at 0 and asserting offset 9 writes the upper byte of
> state->poweron_state to the touch register:
> 
> 	last_val = state->poweron_state;
> 	if (value)
> 		last_val |= BIT(offset);
> 	else
> 		last_val &= ~BIT(offset);
> 
> 	state->poweron_state = last_val;
> 
> 	err = regmap_write(state->regmap, REG_TP, last_val >> 8);
> 	if (!err)
> 		err = regmap_write(state->regmap, REG_LCD, last_val & 0xff);
> 
> Because the overlay only defines panel_avdd (offset 0) and panel_iovcc
> (offset 4) under &{/} and does not configure a regulator for wsgpio
> offset 8, bit 0 of the touch register is driven low on every
> waveshare_gpio_set() call and never enabled before goodix_ts_probe()
> accesses touchscreen@5d.
> 
> Should &{/} also define a panel_vcc regulator for wsgpio offset 8 (as in
> Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml, or
> wired to touchscreen@5d) so the vcc rail is enabled?

The panel was functional during my testing, touch and backlight control verified,
without explicitly configuring GPIO offset 8, so I did not notice the missing VCC regulator.

However, the Waveshare GPIO binding defines the VCC rail using offset 8 as an always-on fixed regulator.
I will add the panel_vcc regulator to ensure the VCC rail is explicitly enabled.

    panel_vcc: regulator-panel-vcc {
        compatible = "regulator-fixed";
        regulator-name = "panel-vcc";
        gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
        enable-active-high;
        regulator-always-on;
    };
 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com?part=7
