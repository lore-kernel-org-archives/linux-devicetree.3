Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDBD39C657
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557516; cv=none; b=Fra1njq/77p/IbhylxZGm6oWsmtACYAiRI623gcq40nPyDs5WuuXGSRKAOfvlrf0A8gfz4iGPtSoMAc4eG0x+pZLuQ/xh6fVOHI/lB1ogOed1G7wBvpi21VXnZlfD4jminIAklO1ezpCmLdArzxScUroPLyXjH4oSupgwheIbuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557516; c=relaxed/simple;
	bh=nLRufELRkMPwM3rgysQpl9/ztKJ92O6YS1CcjcB1SXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxNBGLklos+o3+rMDtGaiog9rMrXXzkFlX+EhRWnYefw0GuBtXuk6PYAVOl7OxTT2DfxWs2pptrDlNlUMapb9JmAAhSaLHTrP9Fjx/44ANEiUj62EmIALxXoiUGMj1qCiH0aa1gOrv+PbmHzOqoNK2BPFfvdCj8nVa5Z2J3TLR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyQZBhV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=flM1AOa/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyQZBhV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="flM1AOa/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7PvWa2666097
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OBEO2yddjoRYR/362AQj96X4
	fgKk2EJOvMsZjHeZg7w=; b=cyQZBhV+e0F00QCVxVnZRTOKfyCWc8t78J4BWLPL
	NpYO5Q1tpeVJ7VfIZ8as3elNkwZFgApYtx9y9z8fyuEprhnhVgnGBnKJz9C4nu2T
	Ki8ygGUPKTYNSLCdUAr2b47ftMMcHYd2TfUtqwdG4jTPaFfE0VDj2tGQ8gYpay9k
	Qe7Ue33Tmy3WRd82hab0LB58AHgDVZkeMkadNpqpKhjf+0LKcUtGmnvqzGgVPhUK
	L9BBSO4bhNyvzS2euUBVYylDt3eVNjIMfpPnu5Vu5NlY8Acq16rGoEmIpWZqTy1K
	Xmthi3tlfxf7JQGKyM8X+rrlxicoilqNjbJrmp8W/VZzIw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgr2ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:45:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52cd0374265so60351021cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557513; x=1788162313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OBEO2yddjoRYR/362AQj96X4fgKk2EJOvMsZjHeZg7w=;
        b=flM1AOa/MA03QFnmnCnvL8JoWbaz2GL2BLJG5HG9qUc1jUYNsSdayjqy6Gu7CKqPOz
         eE2wO6FPLYeCKMKwNF0BLK5qNB4ZJ104LkTxEkQCBkJEFbutnvWfRe5RLXPS9HZynF7l
         3KIO3xHyL4yp3IguCO8Oo5jmRGVOLfHDo4ZiDRjBSixNlqp7fn4DH/s+YEDgt++1aUVB
         izL6UjCO8QReuPnTAMa1dPcvajd2ULQ/+pAc/k02rfyrWwtdcHu2ljvJYZd9m50y7eGH
         gqMWjelYe6iiFZZOTty4Hb59PL2dQ8+BHr3VCpPoSzUISYoONc4YC6kqQT8M4A5Hh7QM
         mBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557513; x=1788162313;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBEO2yddjoRYR/362AQj96X4fgKk2EJOvMsZjHeZg7w=;
        b=EYtZyzJaux2xHRjvEj8H/MepEKOC6dw6tiFb0PMbfVEiqJArbfRW3JeXJL32rMWSH8
         NeHbHgXPsiaIOalaq3W4ZreuyBAUrjaTB8lijBuGHiYG2xfa5SJzTAOkE6GESyBj8zJk
         0+GK1SElU3I9pMdo6+gep6JSZ/l/7dqHuDyfR5StUvGpAnu6cfOSECIiUwWf1102CvAX
         1NFmF868cN2LGEMZ5TR94JkLC8j8lZtZLZGPaFUhdJMq/Pp4mQXBnCfRZSztAcclIqHb
         B7PWkDKQftOQJXHusnZFJxtuAdJo8QBxN+F3nJyfHmadSj20FWqId6Di98tMONKky4Va
         Lm4Q==
X-Forwarded-Encrypted: i=1; AHgh+RouQCFmvtXXWK9nhmRl1Snt30jcTVro2s4REY8GWqaZzHja+eyYbaJDvRGqKBTBtpjXaqdgL8co86Wh@vger.kernel.org
X-Gm-Message-State: AFuF++kZ8o2bz8LYYapjR1ED/nsETc7RSstLDb2Hc6DXS5GCwc2EMbMo
	0ToYZe7nuRsQcNERg9jXmWfqkrtIJBXacMgLDlJPkXzX6AN1rKpjJFj5AGBNIHcUAEBoiuRrcnd
	55ZbtAmANh89PvBseLQEjST//GS2MPhgCLpex+aipAOZ9hwvs5f6IYGjyVTiCB9PX
X-Gm-Gg: AR+sD131xTDdMjC6EzleDtAtD8iMl8V+Ng0B4TyV000MwDBFOUr9nKTAT7InsdLoXM/
	n+XJ23IGtKqItd+mwQ+I/8v6As6jkUfqB5MMCen8/kzXdt60k8FpGo9gWZAvq4spXJyOlZPl7eB
	nDvQtxBx2ha5b4NtxAX7LZy2w1yC/qi2IHeysevoe0sCAdjLGVFwhkcAQAPW1okv2duJmuiI3OM
	B0CSknObvG3/nRzTKst1agVo7yHyyRlcjBi9oT+7lKCCi1q7RUrvH7EswahGk/eZ87GHKwhpnnm
	dmHv30OawTPHpWoSExzfhJS7Aug3MtCl8KLbHvL0ZFb+aOlki80EvSQrc9S/8DTsZto1qEn01ND
	ng7L/Y0yLLAAIo8A=
X-Received: by 2002:ac8:7e95:0:b0:52d:9a3f:85bc with SMTP id d75a77b69052e-52e09bea1efmr168583321cf.18.1787557512930;
        Mon, 24 Aug 2026 00:45:12 -0700 (PDT)
X-Received: by 2002:ac8:7e95:0:b0:52d:9a3f:85bc with SMTP id d75a77b69052e-52e09bea1efmr168582861cf.18.1787557512434;
        Mon, 24 Aug 2026 00:45:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b59fsm1270001566b.12.2026.08.24.00.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:45:11 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:45:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 15/15] ARM: dts: qcom: Add initial device tree for
 Kuno SoC
Message-ID: <2gvwwqbqknmxweztazdyex7wsbzyr7pxta65st7hvaohuq4xmf@3aqohho2dl6t>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-15-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-15-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX46fV7EgeVQ6e
 GdwfIk9nfHdQVDKRvfjf7v32Vh3CMs6C25spUKSEOxpMGmkQflXOEBG3qoI3ua3vNTQ1cz2bnbN
 dH+UhQIh+RK1FwK524aSD646N6vo8Qo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX6aTeb60Hua90
 70lFg1JuXVrPC/vq+CVq/b9pEYl9urGxzcKQn4xspQNNwDMSWekmTfF2GQGnNHAUu95RdUgwS68
 SahArRUAaKfgUKnACJj7gA7VzMkw3NJY36vpulI6EGEKdwFhCixiYUMFcTMZgTEzFrdj8vXXIlv
 iEd8HRFuLh7hVNL2SIUS0ltD5UzSC5xEgcHMIaUoYKaVwdKlKCPqYMLPg8hoJeA3gnk8H9SBfZY
 +b7D2oWhY5ifc8GN1vJ8iW3uC43cKyn77Ua+Dir7duj8dEilt3M2JoGiaM1ts3ziEJhCN3L8SJR
 TM+anTIxifYUNHUeMBfqFTGmH9zj3D4UPCJOxtbKUOoVJ6a8/akUczNJ8J736v5KWT92+6Q6goM
 eiD/SJPkPkLp+wQ0QhIRZhAdS8ieVZoLcBOzpYEQs/cRDPPqtJRyhyJtMKdCPD3ngf6pRU6P+hn
 6qOIlkSsA6g24BkVp8Q==
X-Proofpoint-ORIG-GUID: VPDfe6bcqzuu6cMXi5yqka4Oome4xZsE
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8bf689 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=0woZI7LFW-Y1d3ldtK0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: VPDfe6bcqzuu6cMXi5yqka4Oome4xZsE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240067

On 26-08-21 21:39:08, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/Makefile          |   1 +
>  arch/arm/boot/dts/qcom/qcom-kuno-idp.dts |  25 ++
>  arch/arm/boot/dts/qcom/qcom-kuno.dtsi    | 422 +++++++++++++++++++++++++++++++
>  3 files changed, 448 insertions(+)
> 

[...]

> diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
> new file mode 100644
> index 000000000000..d430e65e08bf
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
> @@ -0,0 +1,422 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/clock/qcom,kuno-gcc.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&intc>;
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;

Nit: we usually put these on separate lines.

The rest looks good, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
