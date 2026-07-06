Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FE03DDB0F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343481; cv=none; b=AskREtNW8vPnGFwGaxf+3Sd6ILbs9tNRRxpkRycUw5yQ02sz3MYUCM6Nt/TOuVER43SehAmdV5qqgRMmW0R0MsngLPzpx9l/DVJu4Qd/5fZr+HehhdL16W6MhTqkgkuAySXQGfZNCzeLNLUSk6zAnF5MijMEASE+o4L8aCw+xNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343481; c=relaxed/simple;
	bh=Jzjlbu26cJSPnFR74xBMg4xl5I0VMwG/k88kE50vD1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpRtQkWXV06cCHwc5eUcMSB92RtoMIsyu8IJN6k+/hG44Ru8lbuW2Mng91UfoFu/KSA+rPtnEPKpGPGt8YzbGxVtgYJNLsP6+VFBa+I3PSV9dxDBYOv3Zshnly7LCRv31a9RdiRZ31WCM51E+kBABvQk8yefHBqbYzCawqytKh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDmiKLZK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LnLIJDIW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDmiKLZK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LnLIJDIW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLm2402098
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j21uOnLF7TkiT/E4hqJKxP79
	sEoMoJywprTScPsnTTM=; b=iDmiKLZKJ3WCO5eLwx/Q11x+qyFvqr1HbiP+fki7
	zWiAHM7nYPw33XHMqY7B2hPVwzpKV6CDfbIl6L26+A52lUiK0WHsGYiqmBn0CJwo
	kwzL+S+/plPUI0hwPrxQobuayxikF7CvuYswiziQI09m/UH9s7++atAqdOa58ZfL
	u+9RSGhkC35A2N2yhPJRXl49mhhl1Co5i6a56RoIpk01F4LrD8yn0eC+2E10PZim
	6FIXtAVrBgXLFUX6Yi+SSxEVanWbjGg/z+h02ezq3sbBULGdT0kYpKsNQZlu8TSf
	ZjyHrO0Lip1X5+FrKiDBa93JkuIDEGaD6J6ldmvaHrRfaQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grquq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:11:18 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59ec1fcd5aaso4080611e0c.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343477; x=1783948277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j21uOnLF7TkiT/E4hqJKxP79sEoMoJywprTScPsnTTM=;
        b=LnLIJDIWtzdNlVGE5XcugliPIBSPgM5KQnjlq3oC5e9x4sTDoEXosBrc7QfNkquIKK
         Kwc1M6r7VxtdivMvobEO4oQEQn7ZY+Wu2sKCH4Jc3My1FGLYOpuxGIOELmMMdzYjjAtT
         waU4MDpX6lTfZgoGrx201jw4qMvTw2UcIagvIwJm6iTttUqMSq8T6W2f3YdGmlRA0OZr
         IQRMuohKPXMKRkJpLq8i3K/hAr2aUwUVtWBr0jZ0RudjSNkQl0NURyMNY0aqF93A3R44
         42/ZwaPtQZXiLTPVNsRmxtJ18fxcOiGE5LVMidmpTUdoP+n0ft1pcpEsVaUokisVedKh
         fNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343477; x=1783948277;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j21uOnLF7TkiT/E4hqJKxP79sEoMoJywprTScPsnTTM=;
        b=AFtDKwgL9a3wBcLJY2liZd8785T6hlxcHjK/RMRJ7MI5A1Mp64wOIDWFJfM3xkpnLB
         Joyj9mhBUHzqf0Hnu+WqyMQMCf4u4cFdkSa/QcS118FQpsPrKn4yAtuJevZ0UEPGtcF/
         y/4tVMMyresZwcMEnMsBoCnlXyZt30muvHQB676WbmDSv8c/asRZEln6+XfAXeyZq0O/
         m0A+1ALTn/PM11zDJr57AdMYQS6fe2k9ETe3I3hXSnjxaaKPEQoc5DI4mWSzrl+qEiBX
         KQfUPFWgEg5leWd98EEweXMuI3txTq0Ni+faIQGCO/2ckEM0sewb6VXo3CGl3MILOE2q
         GT7g==
X-Forwarded-Encrypted: i=1; AHgh+RqQYKL32gssZ8Miga6sAV0lTHySwe+ebvXawIIk8vwAesmRkuHbU1C7SuYIqsujddjP6jEJH8muIGBt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+HyB3kil1zq8IRBXJRZ3wqP7/GXo0q2UbI94wFAQGP1xY67m5
	073m3Ou4JPllKyERGd308tjx6tRjaqCAPM9g0ZMeX9WKf+ZfF4Ix6SS145JfS5SDwcpZNE+kRR1
	f7MPytXcvOXTJ1qJcxIonEjsZ2ZHtekdwmXga96G5W5u0ieGqXVB+GmSUpDWpkyQX1YZAdLNW
X-Gm-Gg: AfdE7cmPYpzhG2n369y/PmJXf5b2qhonyjzv+JdFkc23NAfbqVjjwLjBcTK6mdBGgpU
	JH+dI45yTFoiId3niEAImLF8Q14sDVvCXHIRYEIC1YJlch24oNp3d4VtOdfEvv0Je3u85dMaeF5
	ZVAxrNnt5nGCRKW8lM4zgSFfAsa0jdg0O6pHJs+z8rpt6yVKFkQz/HY/aQY3+rDam6E+rQblAjw
	l0iLXwdCnIdM2djAqq+Gxk1aW8M5ElcpMqvqJG/ulvh1KGG1WH5bqezwLKZ/nWBzqBny7n4lzHy
	Irs/bF8KUNlfYy4DsumWH9c8JWHmGRWDV6K5fiz13MzSDoBWu5b7Yrsdz+QW97prMMC0nvah2do
	j5xKpZawVwlfaWUjgnr3oRyI6gcRkdG+oERAnerkW+V67BdygtdrbLfA2mJelmjZ3qcyhpiGsT6
	PnCuGQx4S/p/WdWeiGpEMH7oIY
X-Received: by 2002:a05:6122:1d8d:b0:5a5:4166:67c5 with SMTP id 71dfb90a1353d-5be8974bfb7mr242333e0c.3.1783343477035;
        Mon, 06 Jul 2026 06:11:17 -0700 (PDT)
X-Received: by 2002:a05:6122:1d8d:b0:5a5:4166:67c5 with SMTP id 71dfb90a1353d-5be8974bfb7mr242272e0c.3.1783343476408;
        Mon, 06 Jul 2026 06:11:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377052sm2864610e87.21.2026.07.06.06.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:11:15 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:11:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <gri2pdgawm2ymbmebzzxfel5kx5nmyqzrdg6oikfhv5bgt7xem@uld56b6csqhi>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-GUID: Etj0K4K43-hAiYiAsJmofOta6_kjX6wZ
X-Proofpoint-ORIG-GUID: Etj0K4K43-hAiYiAsJmofOta6_kjX6wZ
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4ba976 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=SSmOFEACAAAA:8
 a=nmMTCcMeLSeVR9BiHlsA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNCBTYWx0ZWRfXwMSnZvhZ/vTf
 LpLjnAwPlBJ4EB/jkjpbOqMqR7kIlj42EKnr9Pv+NcNrgaK6BPXPi8yne39aFMEE8d0mv1zztQO
 FKM2LzuExLj1MihDoVS4njeWEtthluRx8Xu5y6MG4rnA8kqgGOu3NzdL2Oc6uoF2sYMK9LDq24C
 QOhB1krTd0zxAkAvPDAdAQ+XdjkACGhFgVetP2mjHPY5GsOPPZreHrB8M+FNS3hxDJ6/zoyqusK
 ch8Gkj5VEEMLGQLCyoVs9zCcDLPYu2rxykvhz0+UYvx/+5M8w66HGcPKnKPSEi0Uvnm7WSP3DUn
 ScDQ1gRWg9FJ2nVsOZCCeBdTzkDY003lwGVp94JQrmBhJ1dytb5LvhsWZb2yDud80eX+bZNS2nn
 g1PMNFZvhHVx6sN2yuyAwD9MFMhXiudmu1j3zX9aBMTfiCzel2SvjFMT3ahRzPUe8ShuCnn4b4n
 R4MaOsokz6jenuUWo+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNCBTYWx0ZWRfX+nuQpOpxfkbi
 SfG/C4QNVcIRCfFmpLCJL0c42H2VdR6ZzkefC+lyHB5BSbKi6e14AKB9Qs4qHN5N9PViEwTrdRd
 dBkT9tL4qyHYatMPKp3FMKCy4BPM3Vc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060134

On Mon, Jul 06, 2026 at 10:11:13AM +0300, Atanas Filipov wrote:
> Add a Qualcomm JPEG encoder driver implemented on top of the
> V4L2 mem2mem framework.
> 
> The driver wires vb2 queue handling, format negotiation, JPEG header
> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> integration for the standalone JPEG encode hardware block.
> 
> This series targets SM8250 (Kona) platforms.
> 
> The jpeg-encoder node is described as a child node of the CAMSS block
> and is probed automatically via of_platform_populate() in camss_probe().
> 
> Usage examples:
> 
> - Check of related video node: v4l2-ctl --list-devices
>   The expected result:
>    qcom-jpeg-enc (platform:qcom-jpeg-enc):
>         /dev/videoX
> 
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> index e4c16388ef07..53e83ebe4699 100644
> --- a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -72,80 +72,75 @@ examples:
>      #include <dt-bindings/interconnect/qcom,sm8250.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> -    jpeg-encoder@ac53000 {
> -        compatible = "qcom,sm8250-jenc";
> -        reg = <0xac53000 0x1000>;

What is going on here? And why?

> -
> -        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> -
> -        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> -                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> -                 <&camcc CAM_CC_CORE_AHB_CLK>,
> -                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> -                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> -                 <&camcc CAM_CC_JPEG_CLK>;
> -        clock-names = "hf_axi",
> -                      "sf_axi",
> -                      "core_ahb",
> -                      "cpas_ahb",
> -                      "cnoc_axi",
> -                      "jpeg";
> -
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
> new file mode 100644
> index 000000000000..2ab29bfb9b88
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_DEFS_H
> +#define QCOM_JENC_DEFS_H
> +
> +#include <linux/types.h>
> +#include <uapi/linux/v4l2-controls.h>

There includes are not necessary for this header.

> +
> +/* Offline JPEG encoder constraints */
> +#define QCOM_JPEG_HW_MAX_WIDTH	8192
> +#define QCOM_JPEG_HW_MAX_HEIGHT	8192
> +#define QCOM_JPEG_HW_MIN_WIDTH	256
> +#define QCOM_JPEG_HW_MIN_HEIGHT	256
> +
> +#define QCOM_JPEG_HW_DEF_HSTEP	16
> +#define QCOM_JPEG_HW_DEF_VSTEP	16
> +
> +#define QCOM_JPEG_HW_DEF_WIDTH	1920
> +#define QCOM_JPEG_HW_DEF_HEIGHT	1088
> +
> +#define QCOM_JPEG_MAX_PLANES	3
> +
> +#define QCOM_JPEG_QUALITY_MIN	1
> +#define QCOM_JPEG_QUALITY_DEF	98
> +#define QCOM_JPEG_QUALITY_MAX	100
> +#define QCOM_JPEG_QUALITY_MID	(QCOM_JPEG_QUALITY_MAX / 2)
> +#define QCOM_JPEG_QUALITY_UNT	1
> +
> +#define QCOM_JPEG_FPS_MIN	1
> +#define QCOM_JPEG_FPS_MAX	240
> +#define QCOM_JPEG_FPS_DEF	30
> +#define QCOM_JPEG_FPS_UNT	1

This is a collection of random defines, which are mostly used once.
Please move them to the corresponding source file.

> +
> +#endif /* QCOM_JENC_DEFS_H */
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> new file mode 100644
> index 000000000000..ddfa84838b6b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> @@ -0,0 +1,314 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "qcom_jenc_dev.h"
> +#include "qcom_jenc_ops.h"
> +#include "qcom_jenc_res.h"
> +#include "qcom_jenc_v4l2.h"
> +
> +enum jpeg_opp_clks_id {
> +	JPEG_OPP_CNOC_IDX = 0,
> +	JPEG_OPP_CORE_IDX
> +};
> +
> +static const char * const opp_clk_names[] = {
> +	[JPEG_OPP_CNOC_IDX] = "cnoc_axi",

This way your driver will force its own frequency on the CNOC_AXI clock.
There are other clients of the clock, so there should be some kind of
voting on it. Either use icc-clk or add CAMSS API to sum the votes on
the CNOC_AXI.

> +	[JPEG_OPP_CORE_IDX] = "jpeg",
> +	NULL,
> +};
> +
> +static struct dev_pm_opp_config opp_config = {
> +	.clk_names = opp_clk_names,
> +	.config_clks = dev_pm_opp_config_clks_simple,
> +};
> +
> +static int qcom_jpeg_opp_init(struct qcom_jenc_dev *jenc)
> +{
> +	struct dev_pm_opp *opp;
> +	int rc;
> +
> +	rc = devm_pm_opp_set_config(jenc->dev, &opp_config);
> +	if (rc)
> +		return rc;
> +
> +	rc = devm_pm_opp_of_add_table(jenc->dev);
> +	if (rc && rc != -ENODEV)
> +		return rc;
> +
> +	/* initialize the maximum available frequency for the JPEG core */
> +	jenc->max_freq = ULONG_MAX;
> +	opp = dev_pm_opp_find_freq_floor_indexed(jenc->dev, &jenc->max_freq, JPEG_OPP_CORE_IDX);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	dev_pm_opp_put(opp);
> +
> +	/* initialize the default optimized frequency for the JPEG core */
> +	jenc->opt_freq = jenc->max_freq;
> +
> +	dev_dbg(jenc->dev, "JPEG max clocks is: %lu\n", jenc->max_freq);
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_clk_init(struct qcom_jenc_dev *jenc)
> +{
> +	jenc->num_clks = devm_clk_bulk_get_all(jenc->dev, &jenc->clks);
> +	if (jenc->num_clks < 0)
> +		return jenc->num_clks;
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_clk_on(struct qcom_jenc_dev *jenc)
> +{
> +	struct dev_pm_opp *opp;
> +	int rc;
> +
> +	rc = clk_bulk_prepare_enable(jenc->num_clks, jenc->clks);
> +	if (rc)
> +		return rc;
> +
> +	/* setup the OPP according to the calculated optimal frequency */
> +	opp = dev_pm_opp_find_freq_ceil_indexed(jenc->dev, &jenc->opt_freq, JPEG_OPP_CORE_IDX);
> +	if (IS_ERR(opp)) {
> +		rc = PTR_ERR(opp);
> +		goto err_clk_disable;
> +	}
> +
> +	rc = dev_pm_opp_set_opp(jenc->dev, opp);
> +	if (rc)
> +		goto err_dev_pm_opp;
> +
> +	dev_dbg(jenc->dev, "selected OPP clocks cnoc=%lu, core=%lu\n",
> +		dev_pm_opp_get_freq_indexed(opp, JPEG_OPP_CNOC_IDX),
> +		dev_pm_opp_get_freq_indexed(opp, JPEG_OPP_CORE_IDX));

Drop extra debugging, you can enable debugging for OPP via
CONFIG_DEBUG_DRIVER.

> +
> +	dev_pm_opp_put(opp);
> +
> +	return 0;
> +
> +err_dev_pm_opp:
> +	dev_pm_opp_put(opp);

Once you drop excessive debugging code, the dev_pm_opp_put() will find
its natural place right after dev_pm_opp_set_opp(), before checking the
rc.

> +err_clk_disable:
> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
> +
> +	return rc;
> +}
> +
> +static void qcom_jpeg_clk_off(struct qcom_jenc_dev *jenc)
> +{
> +	dev_pm_opp_set_opp(jenc->dev, NULL);
> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
> +	jenc->opt_freq = jenc->max_freq;
> +}
> +
> +/* qcom_jpeg_camss_get - resume the parent CAMSS device */
> +static int qcom_jpeg_camss_get(struct qcom_jenc_dev *jenc)
> +{
> +	return pm_runtime_resume_and_get(jenc->camss_dev);

Use devlinks instead.

> +}
> +
> +/* qcom_jpeg_camss_put - release the parent CAMSS device */
> +static void qcom_jpeg_camss_put(struct qcom_jenc_dev *jenc)
> +{
> +	pm_runtime_put_sync(jenc->camss_dev);
> +}
> +
> +static int qcom_jpeg_pm_suspend(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +
> +	qcom_jpeg_clk_off(jenc);
> +	qcom_jpeg_camss_put(jenc);
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_pm_resume(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc = qcom_jpeg_camss_get(jenc);
> +	if (rc)
> +		return rc;
> +
> +	rc = qcom_jpeg_clk_on(jenc);
> +	if (rc) {
> +		qcom_jpeg_camss_put(jenc);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_pm_system_suspend(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +	int rc;
> +
> +	v4l2_m2m_suspend(jenc->m2m_dev);
> +
> +	rc = pm_runtime_force_suspend(dev);
> +	if (rc)
> +		v4l2_m2m_resume(jenc->m2m_dev);
> +
> +	return rc;
> +}
> +
> +static int qcom_jpeg_pm_system_resume(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc = pm_runtime_force_resume(dev);
> +	if (rc)
> +		return rc;
> +
> +	v4l2_m2m_resume(jenc->m2m_dev);
> +
> +	return 0;
> +}
> +
> +static _DEFINE_DEV_PM_OPS(qcom_jpeg_pm_ops,
> +			  qcom_jpeg_pm_system_suspend, qcom_jpeg_pm_system_resume,
> +			  qcom_jpeg_pm_suspend, qcom_jpeg_pm_resume, NULL);
> +
> +static int qcom_jpeg_probe(struct platform_device *pdev)
> +{
> +	const struct qcom_dev_resources *res;
> +	struct qcom_jenc_dev *jenc;
> +	int rc;
> +
> +	jenc = devm_kzalloc(&pdev->dev, sizeof(*jenc), GFP_KERNEL);
> +	if (!jenc)
> +		return -ENOMEM;
> +
> +	jenc->dev = &pdev->dev;
> +	jenc->camss_dev = pdev->dev.parent;
> +	platform_set_drvdata(pdev, jenc);
> +	rc = devm_mutex_init(&pdev->dev, &jenc->dev_mutex);
> +	if (rc)
> +		goto err_free_jenc;
> +	spin_lock_init(&jenc->hw_lock);
> +	init_completion(&jenc->reset_complete);
> +	init_completion(&jenc->stop_complete);
> +
> +	res = device_get_match_data(jenc->dev);
> +	if (!res) {
> +		rc = dev_err_probe(jenc->dev, -ENODEV, "unsupported SoC\n");
> +		goto err_free_jenc;

drop the gotos, it's an empty label now.

> +	}
> +	jenc->res = res;
> +
> +	if (!jenc->res->hw_ops) {
> +		rc = dev_err_probe(jenc->dev, -EINVAL, "missing hw resources\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = dma_set_mask_and_coherent(jenc->dev, DMA_BIT_MASK(32));
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to set DMA mask\n");
> +		goto err_free_jenc;
> +	}
> +
> +	jenc->jpeg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(jenc->jpeg_base)) {
> +		rc = dev_err_probe(jenc->dev, PTR_ERR(jenc->jpeg_base),
> +				   "failed to map JPEG resource\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = qcom_jpeg_opp_init(jenc);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to init OPP\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = qcom_jpeg_clk_init(jenc);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to init clocks\n");
> +		goto err_free_jenc;
> +	}
> +
> +	jenc->irq = platform_get_irq(pdev, 0);
> +	if (jenc->irq < 0) {
> +		rc = dev_err_probe(jenc->dev, jenc->irq, "failed to get IRQ\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = devm_request_threaded_irq(jenc->dev, jenc->irq,
> +				       jenc->res->hw_ops->hw_irq_top,
> +				       jenc->res->hw_ops->hw_irq_bot,
> +				       IRQF_ONESHOT | IRQF_NO_AUTOEN, dev_name(jenc->dev), jenc);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to request IRQ\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = v4l2_device_register(jenc->dev, &jenc->v4l2_dev);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to register V4L2 device\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = devm_add_action_or_reset(jenc->dev,
> +				      (void (*)(void *))v4l2_device_unregister,
> +				      &jenc->v4l2_dev);
> +	if (rc)
> +		goto err_free_jenc;
> +
> +	rc = devm_pm_runtime_enable(jenc->dev);
> +	if (rc)
> +		goto err_free_jenc;
> +
> +	rc = qcom_jpeg_v4l2_register(jenc);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to register video device\n");
> +		goto err_free_jenc;
> +	}
> +
> +	dev_dbg(jenc->dev, "Qualcomm JPEG encoder registered\n");
> +
> +	return 0;
> +
> +err_free_jenc:
> +	return rc;
> +}
> +

[...]

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
> new file mode 100644
> index 000000000000..c9959518c64d
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/string.h>
> +
> +#include <media/jpeg.h>
> +#include <media/v4l2-jpeg.h>
> +
> +#include "qcom_jenc_dev.h"
> +#include "qcom_jenc_hdr.h"
> +
> +/*
> + * The elements defined in this header are specified
> + * in the ITU-T T.81 / JPEG specification.
> + *
> + * https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> + */
> +
> +#define JFIF_HEADER_WIDTH_OFFS		0x07
> +#define JFIF_HEADER_HEIGHT_OFFS		0x05

This is offset_of(), no need to define those.

I think, you already got a review from me. Move all standard-related
defines and code to the generic v4l2 code, unless you get an explicit
blessing from one of V4L2 maintainers not to do so.

> +#define JFIF_APP0_LENGTH_HI		0x00
> +#define JFIF_APP0_LENGTH_LO		0x10
> +#define JFIF_IDENT_TERM		0x00
> +#define JFIF_VERSION_MAJOR		0x01
> +#define JFIF_VERSION_MINOR		0x01
> +#define JFIF_DENSITY_HI			0x00
> +#define JFIF_DENSITY_LO			0x01
> +#define JFIF_THUMBNAIL_SIZE		0x00
> +
> +#define JPEG_SEG_LEN_HI			0x00
> +#define JPEG_LEN_DQT_LUMA_LO		0x43
> +#define JPEG_LEN_DQT_CHROMA_LO		0x43
> +#define JPEG_LEN_SOF0_MONO_LO		0x0b
> +#define JPEG_LEN_SOF0_COLOR_LO		0x11
> +#define JPEG_LEN_DHT_MONO_LO		0xd2
> +#define JPEG_LEN_DHT_COLOR_HI		0x01
> +#define JPEG_LEN_DHT_COLOR_LO		0xa2
> +#define JPEG_LEN_SOS_MONO_LO		0x08
> +#define JPEG_LEN_SOS_COLOR_LO		0x0c
> +
> +struct jpeg_header_buf {
> +	u8  *ptr;
> +	u32 size;
> +	u32 pos;
> +};
> +

-- 
With best wishes
Dmitry
