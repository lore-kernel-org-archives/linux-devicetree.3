Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369341;
	b=5U01wVaIcYenxRlo57t1FnQBvHEoSpdqTY7AHXdrZJBHaaifflIkNV7OdAK/rQxf2/v1
	 sw2bYoCar5Lwqb4e0sDviruRWLdwqCfQnTQZN1+aMbt6E5Pfy4XvABoxV5skosOSvJ7HK
	 tDJHYO83b4rz4IzmvnlsEkT5DF9ZAuwGhH7aznGli0v6upBMQex253Tm1Bvh0bmkuzvQk
	 W56gIiSfJegEWx6FvZKd06g/K1ziXPxORMYYEhjeqAFfuxm8fi9ZmkojORXsn2lBdabjm
	 9jFMcCFDIJPtP8moNERG3TcxOVq6aAXuI/jE2KHVsP3lhASFiRgxJlBuaxh+pydbzyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WjVxx/921lt4hza8TI06z56jcaiHMvhRxqwg7tmh3rA=;
	b=TxjLO264IhiG/9suXj0HFSxyAxkvNxd0aRwDQqcfpeUtv0ok7NL8n+TtDRqMgH/khJXz
	 CVeySOWkNLCrqx5i7uV6yv88DBi54SfBziCD5RWKXUW6eRnX8Ka+i+hgzJRA/c3xaOpAg
	 oLQmlnVgAP0/WERIu1cfby6YtSjT/1CLl1Pqb8US+1YiwjgI0XMElalPLpy3OaBuZqTVJ
	 S1rEwmLJuW1S7kRUnfU3tI4f77LIdWs/9B6S/JKKyHRfJU/PipLUtP38EggJXwkV41Sgw
	 mEUp+u3Jx8PMdicFTT9zwRlSFbhH7xkDcfMlBaELNC29zaxcuqpF9r2x5/MLEAxAfzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LcsitUX1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QvY9FQII;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A788C606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A788C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LcsitUX1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QvY9FQII
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnZ0h1869076
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WjVxx/921lt4hza8TI06z56jcaiHMvhRxqwg7tmh3rA=; b=LcsitUX1hyv8NOPL
	Q8VjbeHtm0DxfEXWx3GQZthgTkQR+bR3uGQye15mefYe+7TktjEgFgK2kJ8RuK9E
	EjZbuo41QO70LWgwshQes/qJeKTtuHwkL+QvbpY6OP0Aja3VOohdGsm+kOLoq4yV
	Ib+AWfZSG5EmNDiC3Reut59iZVRv5rQ205OlHHdo6FQEqHUlthgg9d1SqWEvIk8S
	2/y7++n7HBjJRIl31GYSjx9eLiEhU7hzDFhsNgegofgBgYb0b9JQy8CYnevzUncJ
	klTH9aASMHHs0/lslVBnpvFycjevOl/9yb+yGBPLKEbn9anF0HVRvH4C7lawccFW
	ePzcOA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pkdkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:08:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aca98f01c1so765057a91.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793369339; x=1793974139; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WjVxx/921lt4hza8TI06z56jcaiHMvhRxqwg7tmh3rA=;
        b=QvY9FQIIhEu3lvwyJkY2LwbKbPX7K48V39M7znxKRm+7bs8R1nR8s6otOq+j9XkptV
         RVnJYctc0KjZvNLNdTAotscmznfZGurCM8sB+eZisZ0ozIsBQHonhl8v7NmiBQilmcjT
         MTuKA055b5i757rQpHidsSGA2Z4LaAFOgCfA0F5PJz9uBnw5ZWIUsSvyvufyGDhqH8mh
         yhac3cxs4yTAsOq01eclGta78BPByTR7qruCd5ZD5bBPgEeb8tgF9XY/yHvP3UAivk3t
         ruFXIojrxa5jbpKHUy/jjEyzrmn2cKPHH3iKVMoGV8nearysiQWufzpNdOwtE+kVQNzl
         cPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369339; x=1793974139;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WjVxx/921lt4hza8TI06z56jcaiHMvhRxqwg7tmh3rA=;
        b=kcd80lUsH1FyHJlsxxjEtAwwb8oSf6xe6g+2Zwi+jgtDmjDmLilqaN42uCVao9r8LT
         q3tVHA8kKUp1sTaaY6ZdtJOi3ERaVqZ+G3sOVkPA0gzpZuCiQLHWniA6NWjka1NbxwId
         3mUigV/GLmPF4y38bWiXIjU1tZ/vsVVtWulvsX0+MBCDAxlFxzZmz1HsUuG9+Iahj+G4
         kTNTk+YU07/pBCUiD4Hz7qt0zYjG0xok11nqz4IvDNzQYOjgf+21+OlPVgNfCGSOMHhY
         KudrkcDeWSnKdXSe8NPOREGoMcKsQUgwubOn5298A4gDXD9ueu40oG8xlWDkhMi0Piq7
         6B3g==
X-Gm-Message-State: AFq9FYL9ihUS/3DpC9y12IDI4zU6YUy5Juxq1WdtVhHd/ceY8pgfSY/q
	vP35POYW7z3nQAjfKFHpBF57XTqnvD6yUWcBwiGg6LfioU85ZUJ4Jj9XKGlWDIRQkFe9FC52a1C
	xGK0xTRCf1QCdCheizpU7MwghTDulkzYxnL17FCnM2aRMOPZ+jQpPiAU2+PkwILSU
X-Gm-Gg: AYBFou13h9KNZoXsS1pmqBiOjezwxc+zpw/WHHaWrPSBJn8zJc+9TrfuAD9Zwa0gdSI
	bJX/8ZZC/FoB37TUFRa1y4tgZXp7sRHwcYpGCIuEXcq7ieSEz66SYcL7WOXObD+CwFeZmaXLhr1
	1d+WmW+EOaoWY89XDIkuJ++zhaKV08AeThJi36qGi3SfKet1KSt6kVb89vetRJqhtbW6FKb84b/
	UEnFT/lBy4x4A6ZuE4UOOj5eU8T7fqYN/TqhXxTyyAxxrp4vG2B1XrS47UzozAnghcTKlp5FPNQ
	/CCTAhK2U2rMlsxIbWaHH65j0OOW2wTvthBjjTlINzDpu0CnQDqt4raeFzs1/u421cnP2I0qfEb
	ljqh0eu9KCzA79e02dAhWZdL9pY8orRH+8l7UL2WJQp762sC7SIpG2GXhAP1fJWTm0daDpz8oVI
	PelRcS
X-Received: by 2002:a17:90b:3b51:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3ae897c8800mr2139328a91.63.1793369339086;
        Fri, 30 Oct 2026 07:08:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3b51:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3ae897c8800mr2139298a91.63.1793369338529;
        Fri, 30 Oct 2026 07:08:58 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845aa27esm4141700a91.11.2026.10.30.07.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:58 -0700 (PDT)
Date: Fri, 30 Oct 2026 19:38:54 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO
 G133HAN01 LVDS panel overlay
Message-ID: <auSk9hYrM8Enqc4r@hu-anantiwa-hyd.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfX5Vsbtze+/YMP
 s51QI6ZbuezHLEqHSeXzGXogCniJyC3NAXyhAKqJOywyyS5bJs0jQDi+zqq8K7+QzXNa6JSqwm+
 fExt1dpPyNim9Yn4uBFGczWhLVSETeoDPL3sU7df+EkgmXBFMeBaF4CyrOQUO0bFSfbg0uzNT+e
 bAiJTWTXEeSsMpiUI/WyAkoL64tp0gqYQ4OWGuq4MDcz/cw1IiAXxIDqQksuPZ288eo3fG9uJIx
 FAY81fpm5zBW/zz7IEF2iRQyo+m6pdLaEkBwi/jZEuTHeXzM6e2iuV3SLdG6FUYob21ZwYNYHfw
 Lu2rIRBES4PAkqBVsiExPyKjKJ1S/ZhcZcR8JpL7gf9JsxG6M7n4c7rAGgosTKyhaXYDZRAtUDd
 ynJMsogm6Q7SirJJhHn39Dp6joJRv5IyhHeWLU+zNHD5fhfm7iPxerlCblROTVmOzJyz3RLWA3h
 qpaOe0g1Mv5s9NaHlqg==
X-Proofpoint-ORIG-GUID: cuKQB55XT_zz8lVOZ3b_BYNLBuWYqJo6
X-Proofpoint-GUID: cuKQB55XT_zz8lVOZ3b_BYNLBuWYqJo6
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4a4fb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=97I3IBaX8FsKqUO26lEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfXw97E9iOYz0yG
 qqtuWq5viWLBLr0+rHPdPfyNOf7otsITVh7E6+ykw0EH69RSdVJYewe3Re5+S9SJC2MIBi/FrIi
 sDyOULCymCnhWpaS6KUSA8rcjEzxaJc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300056

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
Yes correct. This series depends on a separate clk driver fix that adds real 
10kHz/100kHz entries (non-bypass M/N dividers) to ftbl_gcc_gp1_clk_src 
for gcc_gp3_clk_src: https://lore.kernel.org/r/20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com/
 Without it, exactly as you describe: clk_set_rate() rounds up to the
 nearest static (bypass-mode) table entry and clk_rcg2_set_duty_cycle()
 returns -EINVAL. We will add this dependency in next series
