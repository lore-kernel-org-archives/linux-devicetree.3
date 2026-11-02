Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600237;
	b=IWCG5MTFMqVGQ4A0lxvktKvg29NXtcSRfYHNeQx9wof9eh9veFN5V3NPf18vwIUisNAM
	 nq8CGd1royRWEcVFHHzwARKIAXzMUsrcoSjCn567RVRjPwn2NyJtwaiW9Q2sKMs2Z6woD
	 x1LfmRsOJeGuSGCB41ZXwG3OxqZ0StB5kFANjqqr1U6niKGNdztcQijREEpSCpreMBsQu
	 5VbhTKrL4alaxAZRxoD7uPOZl6Po4iyIGMTlHIINeSKZLuqBmPKf8qZXQKJynm9fmTdEU
	 aBIDc55l8P0rE6/TvMo7UzLQJrYVFjNBrdsAmI8EEirIS7WtS2UbUQY30cOBqjARgiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600237;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=95RVMgAnEQsz6u2Zau/H7ip8VDUUfRIOwf1zoFXTm1o=;
	b=cvx+hIYldVeVB3AYmVnfoYsPqWNxJCDrV+64LiuS1ivk+diBdq65VYauc8iWju+BIFDQ
	 E6NuXy8X56ptG+YjPwnA69qgdIhuxFaTdjAs/9p+LtsExuQZXobAWSzQyx82bnwLlcc2z
	 XnGIDZ+LCki/QmCqurjup0m51r8WiP5rdmxaY5fAtm25x16OMeNHgwG0h6Igezzpr8i9U
	 eELMRRfL/FIqowjTRRwha7o9JAlahy4oXV91eGqlYf1WDJCsFqUyE3fJi/ruoi7ReEyCh
	 /rytuWa9D8oC+DVvaHJACwkpNIkspHcfL5xLVjT6FHJjyM7yoayDaw4QwJtLe3FHSfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YxbHo/6P";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CDG4/mdH";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FADC606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 06:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FADC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YxbHo/6P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CDG4/mdH
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24DHUo2433620
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 06:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	95RVMgAnEQsz6u2Zau/H7ip8VDUUfRIOwf1zoFXTm1o=; b=YxbHo/6PcAeWxhm0
	o4AVSc3jsYWfDY2eeenHh//YjGQsUfUzT9fpeNJmgwMvzip9i1aYIQbi/oK2lsgd
	wZZfRLR21q0tFGDQoTWayvUwwdMOOTzTidy5OgDzEAsCexzJ+kLXVkxPBxGfnxg8
	wIEP88J0icYNMGkimBJi7xgDpYaSmpnqzMSSjBeVyRxF+GqXiAb7WKM792aF0YNS
	iazCASxsJ4cdVF1+kChyGe+AZ4p7Xxf6k3ZcM5FQ1n7vqKHxqH+ozQ1b1vbOPH/2
	1nVtdkuGzSQTGTtVPCyZZmd7sY4CSXYZbBuXtCTEreiLyFSpMzYF/0AiAhPXMdVE
	u3d9yw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka60b44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:17:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so11498889eec.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 22:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793600234; x=1794205034; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=95RVMgAnEQsz6u2Zau/H7ip8VDUUfRIOwf1zoFXTm1o=;
        b=CDG4/mdHQRh7ZchwTb/yDdc9WnfdWUwVzrHaKVR7iCFsIFJntfiNyex+0Y6ZLXZOQL
         jfDXwT/hAkCdJpiKJAqE0I0M9f6Rna1Z3F5ICpOwbNQ2y2Gyq74HQj9eSi8/F1FDYSL6
         Y0aoYW4iKg0VjeFei1C9/SN5cKBNsf08qphd62fBiEfPTh64kMRdbmF8KvLwcMojZr0t
         G2AsZ7Bb/2a9s/WkKTCJt5pzkFIUx7+i0gMbxllKSd3DChe/0/0ic2CEXGeJ5OfYYa7l
         9JVKXZEN7F4OmQKCyqXPWpg/53cyxkH8TEWrhKwdu+PHyzmuf7u4dM9Uwl5Xw3R0Gvwj
         tbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600234; x=1794205034;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=95RVMgAnEQsz6u2Zau/H7ip8VDUUfRIOwf1zoFXTm1o=;
        b=Mqp/O3SRVf2Aertgol5M2MLUACVkyLEiengitOjRdTW71tYQ6LX6SGqCDn5iLxeTvr
         L2VXtZO5cDvRaL35qItJqk9gifaRQBjOXe+vBf2gysNA1Rvo2AY9okNljzG+a1jnDHFB
         uJ34Zl9rhlj8nZr5mOHLUuf8EjjG24LXIUmMd9PS8F57eO0AI1V5a331n/l2M45i375e
         seUXPwAlQV5W9PZuJ7BDo44WXunwuFY9EIKv1+6Xh17lGVhBH2RA1Ywo8gPQIFylAFdO
         2Xn7jdD0FbTru60bspNeu2AAshQx6f0zakBikfgeoKrdms/hEmFgW2bqZf1PgTGB7tJX
         bU7A==
X-Gm-Message-State: AFq9FYKERRsbN6Q+CTCqf5phg/hZvKR4QJU3iOqtS2jT1tYpnjfS8CU7
	qr7ynTQI46O7AjputIKOIWA0jVVowVmkLcaHUo7tDVjO3RRYWXiW/ij84VxiGrRgLglQ6vYyKZV
	kjt5SuFw5r9rUzZNIIktee+t/TSjIDma9u8AUSamYrv8hPLWPJsFNq6pKoEG2k2QE
X-Gm-Gg: AYBFou042ag7rpO0hBmeQETLdv+tYNdD21bZxXaXyQOVrW6vYWhTEHM/7RTQYa1y9KY
	n9hMMFpzM8YhtGbufVBq7vj2qBqZrN6KHZ2WpyjWTt3Og2dcX0306PvFGzRoOPtr0DKPA/nsYkS
	U5LGGTS+BaDUS9Ora9VtpFyy7ggzwWbcDfzGqZ4egIbRKnQn59FKjFDawTZCmcL6S6VL6xJUDMC
	LCOZuIQ6KbSC3gtLxakOJurqxgzjaABLMgcA1IrAo8o5daZ/KqppMAapRwwpQag4i4V9+i+jFcF
	85NSv+G7VTJYfhEuM9x4xhbLftGisnTSBJMiq9ICzFsWt1/Tdbh5e0gbq2/Pr0+Sq8jMRRW/Y+Z
	krb6Yi7ZXOZdzMs+KkTyRHqj5GYVI5s5E05xKb92RiKVxMrUhKHomnwwZeryI3+aaOI4YDzeShF
	K31XQ=
X-Received: by 2002:a05:693c:8803:20b0:369:f0de:259f with SMTP id 5a478bee46e88-36a424085bemr15785055eec.35.1793600234146;
        Sun, 01 Nov 2026 22:17:14 -0800 (PST)
X-Received: by 2002:a05:693c:8803:20b0:369:f0de:259f with SMTP id 5a478bee46e88-36a424085bemr15785006eec.35.1793600233404;
        Sun, 01 Nov 2026 22:17:13 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm39030238eec.11.2026.11.01.22.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:17:13 -0800 (PST)
Date: Mon, 2 Nov 2026 11:47:08 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO
 G133HAN01 LVDS panel overlay
Message-ID: <augq5KKjnUcSPCf7@hu-anantiwa-hyd.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
 <20261030-lyra-display-upstream-post-v2-6-906302159392@oss.qualcomm.com>
 <sashiko-outbox-190778@kernel.org>
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
In-Reply-To: <sashiko-outbox-190778@kernel.org>
X-Proofpoint-ORIG-GUID: 8qXjU_VnHh-kL6uBm1KU0CBcbR7CIhNk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfX44VcJ3MQvF9t
 Aj6PqMkr4RRaLPuOLgruEk0ke5BMY8NWhk6aj9KkxWmHZq+K42rVhAZuiO5BqhNLcYo+4ac8cxa
 Yaz1ansXV7ke2hZ8wB7NzEFDFFhRiqE=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae82aeb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Idjim9wqd_vywzO8aGYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfXzThdKncXyPTY
 xCi4bFgPYYB+3G/vuGipPn5OgwqAGxwyjGOZcIvUsAEV6DN98B3s2HB+zUpQzd85z0asop8lEvw
 kOAqyniVaZ09X+95cjeLP6GIAHZ3LUTWsjstInzm3vRHmUjjTw8YTRYOSk62GKxCDIlT14QGL7A
 2TlXN/nb6ktmbj3Pxhei2jPVsZIg1mh2+aHrtjBPNtVR2xc7bVTl04aiODuq9RrSXQSdWurZ5q8
 uM7n6fQAJlad+VaEXicgIux92NJkeF/tYbjc/MAq4F6IaMUEvAHxhOFm4DsHQkumDBAolWhCqZM
 MF55X9zRVT7BgYkOtWD7w6eFzaxArK5wBao3gTU5DSEN6IReLrlQLEJxOD5ObkQaKWZD8igW3lo
 LlfKM5826VsXOlIk3Xm/XN9GvXoxE+PxC0o47sNw88mdYxfKL+4kstnkQToOC2k0e5HmRTXWoCj
 nDnLX7ozFfFV9lWpSGA==
X-Proofpoint-GUID: 8qXjU_VnHh-kL6uBm1KU0CBcbR7CIhNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020024

On Fri, Oct 30, 2026 at 09:50:39AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] arm64: dts: qcom: talos-lyra-evk-lvds: clk-pwm on GCC_GP3 fails with -EINVAL
> --
> 
> commit c54a5c6f3e0408807da76cadc10d556338f09c09
> Author: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> 
> arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay
> 
> This commit adds a DT overlay for the Qualcomm Talos Lyra EVK to support the
> AUO G133HAN01 LVDS panel connected via a TI SN65DSI84 DSI-to-LVDS bridge on
> I2C5, with backlight control using clk-pwm on GCC_GP3.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
> > new file mode 100644
> > index 0000000000000..8c592e6317c30
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
> > @@ -0,0 +1,133 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/clock/qcom,qcs615-gcc.h>
> > +#include <dt-bindings/clock/qcom,rpmh.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +&{/} {
> > +	bklt_pwm: pwm {
> > +		compatible = "clk-pwm";
> > +		#pwm-cells = <2>;
> > +		assigned-clock-parents = <&rpmhcc RPMH_CXO_CLK>;
> > +		assigned-clocks = <&gcc GCC_GP3_CLK_SRC>;
> > +		clocks = <&gcc GCC_GP3_CLK>;
> > +		pinctrl-0 = <&bklt_pwm_default>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	backlight: backlight {
> > +		compatible = "pwm-backlight";
> > +		pwms = <&bklt_pwm 0 100000>;
> > +		power-supply = <&vreg_disp_3p3>;
> > +		enable-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> > +		brightness-levels = <0 255>;
> > +		num-interpolated-steps = <255>;
> > +		default-brightness-level = <128>;
> > +	};
> 
> [Severity: High]
> Will clk-pwm work with GCC_GP3_CLK here, or will pwm_clk_apply() fail with
> -EINVAL?
It will work with GCC_GP3_CLK. I'll Update the dependancy in next patch
> 
> When backlight requests a 100000 ns period (10 kHz),
> pwm_backlight_update_status() -> pwm_apply_might_sleep() -> __pwm_apply() ->
> pwm_clk_apply() runs:
> 
> drivers/pwm/pwm-clk.c:pwm_clk_apply() {
> 	...
> 	rate = DIV64_U64_ROUND_UP(NSEC_PER_SEC, period);
> 	ret = clk_set_rate(pcchip->clk, rate);
> 	if (ret)
> 		return ret;
> 
> 	if (state->polarity == PWM_POLARITY_INVERSED)
> 		duty_cycle = period - duty_cycle;
> 
> 	return clk_set_duty_cycle(pcchip->clk, duty_cycle, period);
> }
> 
> In drivers/clk/qcom/gcc-qcs615.c, gcc_gp3_clk propagates rate changes to
> gcc_gp3_clk_src, which uses clk_rcg2_ops with ftbl_gcc_gp1_clk_src rather
> than clk_rcg2_gp_ops:
> 
> static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
> 	F(25000000, P_GPLL0_OUT_AUX2_DIV, 12, 0, 0),
> 	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
> 	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
> 	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
> 	{ }
> };
> 
> Because all entries in ftbl_gcc_gp1_clk_src have m = 0 and n = 0, calling
> clk_set_rate(pcchip->clk, 10000) rounds 10 kHz up to the 25 MHz entry,
> switches the parent away from RPMH_CXO_CLK to P_GPLL0_OUT_AUX2_DIV, and leaves
> the MND divider in bypass mode (CFG_MODE_MASK == 0).
> 
> Immediately after that, clk_set_duty_cycle() calls clk_rcg2_set_duty_cycle()
> in drivers/clk/qcom/clk-rcg2.c:
> 
> 	/* Duty-cycle cannot be modified if MND divider is in bypass mode. */
> 	if (!(cfg & CFG_MODE_MASK))
> 		return -EINVAL;
> 
> Doesn't this cause every brightness update to fail with -EINVAL while leaving
> an unmodulated 25 MHz clock on gpio59 (and leaking clk_enable() references in
> pwm_clk_apply() when __pwm_apply() fails before setting pwm->state.enabled)?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com?part=6
It will be dependent on below changes
 static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
+	F(10000, P_BI_TCXO, 16, 1, 120),
+	F(100000, P_BI_TCXO, 16, 1, 12),
which is present in patch https://lore.kernel.org/all/20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com/
We will add dependency list next patch.
