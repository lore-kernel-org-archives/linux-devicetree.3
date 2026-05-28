Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9202E06EF
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 03:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779937435; cv=none; b=eRuBfpFbU5JdAkKjXwACgOT/SpJYuX6cnymHxaT2xnDe/B+WxdtnNqrvoQeQYlN742V566hJBt+JO9W+zjBMmBSuMP0TzHEfJWyPQmie/kqMj6Sg4Uow5oC3k3zfrAqNplMxhK6TVsjJuECbSontGoVCYKyb/YttmkNE4NesJNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779937435; c=relaxed/simple;
	bh=QQ5CbSFxf7TS2HMiLtNCMgYv60bCUVSr0315pX/eoDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6pywAMIa8qmSMEX6lYbCpafxgqUnm3WaOqIsGpa/8JWLnC4CfNH/ykTzGo7JTjbKyK4FRFNLGNN65sb1IRxN7CyZJXM9qV/GTkshRzKGgajJsYmQeC6+Qk9B8ssW8+/n5QrJx8SN3eHWGxxwfFkGwP8W1vRQqMQobxCSj39D80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfwSMM9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TsIOFj5i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfwSMM9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TsIOFj5i"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKlkIX2753823
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 03:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tH65jBUi72poNn77DU0HzxsS63LcoGxhyxyxUXXm8BM=; b=ZfwSMM9xzkI9oVMy
	xUnTS5HAAHXkTFBPB3HAJstWaCuNp4xU3yU8xLM7CPi4+QeBgjb2Xv7gHCqDx703
	oCR/Mno14c5dQWWCXNxDrjjvhOb3SteVn8AgFY1z+oueQCbWehITDu6CRcFYZK/G
	Vi96JtB5xgy6V8lYX4g4+q4lQx0XLUd8vXcoTmCgJGxrkSerUBpkxYoS6ZxU3YoG
	N7+0Sppi7CPcomBHQ5vGVObBki8a0WAsOF9gsTIctp11BNOSiTmzuifgE0xVJTdi
	rs79eTVZrcY6DeaTbU2m5w2V+Cz9dPR2ThuR+CJD6iUYE+SGHOQbWqegUcjnGsdm
	+q6ROQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yc932h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 03:03:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so129883085ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 20:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779937432; x=1780542232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tH65jBUi72poNn77DU0HzxsS63LcoGxhyxyxUXXm8BM=;
        b=TsIOFj5iOXpkP2hfXTYCvyfBGafHZrUw7b9XA4arK6qurs2ekiAuowtS0iGBGiqYuU
         6Eme2WbgYwGyYaw1tEz6W0UYqwK1SoguMcTOZ0P0z+GSobUgyPueEH28HjzVW+7KGUwL
         wnyihEeyV4tL9jvB2Ry0XLmanzCitTxCxddg1aasZu6foyxXIv4a+P2skN5RfWgHFeH9
         6D/Msol4cfYtbNNOrbJGOUExI78UZDt3e4+4jCjzrTD15Do2zWOAhRyZwE+1MH+hb99s
         dCtqbdqZ4C+VUKudU9x2MXLUOdoZ4X3uE0w1vVWyJXfxDSe/MRXI/pduLRktJcSJDG+6
         Iz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779937432; x=1780542232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH65jBUi72poNn77DU0HzxsS63LcoGxhyxyxUXXm8BM=;
        b=qGYK8VwHF0M00YXNuRpjcDISpQMVmB6oCEm37tcfZdKoE110jLYlie0a9fF2UO5J9o
         rrZmZOCFyybMdCgvxtK7dTes0GHWkYzLXQtjTwBEFHZC/XNwxdHVT9V/2SqgSjSUU4Sa
         eUAz3puG5iXMEyHPZUjrbBKQ+PJx09pwhja8p7rowktJa69vCCpwWBEqFt5Wy70+OwC6
         IBZaTcOm7UowLu1VxW08gWBbp70vmQsM5uuJ9WQ/SNjSnpaF80iDdQXikw957+EM86xa
         2XRm7nvKJyiNsX/y/rHj6q/+xnMjPOXRAq5qg5qJpda9+qKlEEZUdBj3svO9DCQd5x45
         zoDw==
X-Forwarded-Encrypted: i=1; AFNElJ9nJFW65cJaAczCq/l8dLUGVIZXNL35/jtSQXCZ+u1LdfCMKlDzbZWUNhiaW1Pov7L+7IVLc0FWC2Am@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1MQF/ycafujSeDjzNylNB2gmlbkdogxkhfrhMJm6C64Hb7uWa
	D4U95iqupvbAJuVSWGSuNRj3uMojuUH9FBIv3ZVAVLAahFSIV2eNdqFX5FTgPTQNOWpYHr6LZAk
	AZt+AMuTFpKWH9mdx+TVhVM8haU/q+5rQCnY4nC2qiDmNIof1+jz+o1NCb5sR44f9
X-Gm-Gg: Acq92OEgW6vyH8fljKPYKAqz9g7O1pBiH/nuomhjbw8qioHwXhvO9zheaE6nawodJXE
	Fs/i38gaUSk694ASk+DkVQ5A+HrXZWYeCIUXj2wDragbI3KUjODdvg67huYNNLT6fkKpc83sVMT
	Mw3kxeyAupJJ6d4CL8eua6xqaM4g0UedULdiVPr5xgdvoL+0Z486ipHQEshJxm1Y8e+0yOQPBeS
	Mh7ay3JQu9dph4eMcb3ovMRZgQOHEmbXiVrN6jhSp3T9A2rlVSYA34OnY3sukvhGHY4vFp6G3hH
	CJkklk/AdKF6zlDdP1KxRMTQR8C9xwcl6dJeRX5fhAsrXg+uvx9pMBYwLY4lUQbwGNpOzLgL2n5
	5AIc/6Js2vkarfucwXHcO1dq86so4/CiUEAREqwZKOUF62ygNWzZ1ekccorYRlbbIo2s5XM+67K
	FJzlLNN2KeLUSTNBuH2/3+yA==
X-Received: by 2002:a17:903:2348:b0:2bd:a403:1d82 with SMTP id d9443c01a7336-2beb074fa6amr285372285ad.21.1779937431515;
        Wed, 27 May 2026 20:03:51 -0700 (PDT)
X-Received: by 2002:a17:903:2348:b0:2bd:a403:1d82 with SMTP id d9443c01a7336-2beb074fa6amr285371955ad.21.1779937430978;
        Wed, 27 May 2026 20:03:50 -0700 (PDT)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2d47sm203898135ad.45.2026.05.27.20.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 20:03:50 -0700 (PDT)
Message-ID: <332c5b1e-8b70-4902-99f3-536dfe8e32bf@oss.qualcomm.com>
Date: Thu, 28 May 2026 11:03:45 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VOntWdPX c=1 sm=1 tr=0 ts=6a17b098 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Vq0jQWeKcoOPcsz1E3gA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 2Po-VgpeIaR54uVv9C2cAeepI9jHslXZ
X-Proofpoint-ORIG-GUID: 2Po-VgpeIaR54uVv9C2cAeepI9jHslXZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyNyBTYWx0ZWRfX9ljDf/mvvzzq
 u7LnBS7ueKU8Z53q8SoFJzRYSWFVPg3gTFfmzIZ72kbVRsPJvSnnByqGbQTI+sZ68zwoovgmBd1
 dyYf4HiSxVd6jaZtY/lYrmpUOP1iQjFxs3sUA4FRHeYmlzZu8v4wrzU14vjjSW8QwsB23IFrl5N
 HpveiZ6nQJSYLpW/4eriYc95V1KFQPkGp7YdIGXgb1JQw/xwEjZpffOYUyNxRiyBXObiay8JQLf
 3fhXmjyxv3SfR2sxekTTlSCw9SxOYPLxcngEpv1YuLSeJO/LwdozBOlVrBIVvCYWuwmCer5bUGC
 b7GRQogoyZWGLROEzwdzKDoVKL+bm+q3Vog8C9Rb/Ftc4l2RpobqJwAl89/VnHXHZMs6SP15+WX
 0yFDMyObbwozUql0lboK9K6Jo5wh1+mVdz2lt7xi1NP1BSEBO+u1x2yPEnqsnv7ycfFyu+BS9IR
 CyEXaPA6u5hKGwqnxqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280027



On 5/28/2026 10:29 AM, Qiang Yu wrote:
> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> register controls whether refclk is gated through to the PHY side.
> 
> These clkref controls are different from typical GCC branch clocks:
> - only a single enable bit is present, without branch-style config bits
> - regulators must be voted before enable and unvoted after disable
> 
> Model this as a dedicated clk_ref clock type with custom clk_ops instead
> of reusing struct clk_branch semantics.
> 
> Also provide a common registration/probe API so the same clkref model
> can be reused regardless of where clkref_en registers are placed, e.g.
> TCSR on glymur and TLMM on SM8750.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/Makefile  |   1 +
>   drivers/clk/qcom/clk-ref.c | 205 +++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/clk/qcom.h   |  69 +++++++++++++++
>   3 files changed, 275 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index e100cfd6a52d..c5b02360861d 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -8,6 +8,7 @@ clk-qcom-y += clk-pll.o
>   clk-qcom-y += clk-rcg.o
>   clk-qcom-y += clk-rcg2.o
>   clk-qcom-y += clk-branch.o
> +clk-qcom-y += clk-ref.o
>   clk-qcom-y += clk-regmap-divider.o
>   clk-qcom-y += clk-regmap-mux.o
>   clk-qcom-y += clk-regmap-mux-div.o
> diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
> new file mode 100644
> index 000000000000..213c0f58bb36
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-ref.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/clk/qcom.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/export.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +
> +#define QCOM_CLK_REF_EN_MASK BIT(0)
> +
> +struct qcom_clk_ref_provider {
> +	struct qcom_clk_ref *refs;
> +	size_t num_refs;
> +};
> +
> +static inline struct qcom_clk_ref *to_qcom_clk_ref(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct qcom_clk_ref, hw);
> +}
> +
> +static const struct clk_parent_data qcom_clk_ref_parent_data = {
> +	.index = 0,
> +};
> +
> +static int qcom_clk_ref_prepare(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +	int ret;
> +
> +	if (!rclk->desc.num_regulators)
> +		return 0;
> +
> +	ret = regulator_bulk_enable(rclk->desc.num_regulators, rclk->regulators);
> +	if (ret)
> +		pr_err("Failed to enable regulators for %s: %d\n",
> +		       clk_hw_get_name(hw), ret);
> +
> +	return ret;
> +}
> +
> +static void qcom_clk_ref_unprepare(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +
> +	if (rclk->desc.num_regulators)
> +		regulator_bulk_disable(rclk->desc.num_regulators, rclk->regulators);
> +}
> +
> +static int qcom_clk_ref_enable(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +	int ret;
> +
> +	ret = regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK,
> +				 QCOM_CLK_REF_EN_MASK);
> +	if (ret)
> +		return ret;
> +
> +	udelay(10);

try usleep_range instead of udelay for better power consumption.

> +
> +	return 0;
> +}
> +
> +static void qcom_clk_ref_disable(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +
> +	regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK, 0);
> +	udelay(10);
> +}
> +
> +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
> +	if (ret)
> +		return ret;

regmap_read returns a negative error code on failure, but the 
clk_ops.is_enabled() treats the non-zero value as enabled.

Thanks,
Jie

> +
> +	return !!(val & QCOM_CLK_REF_EN_MASK);
> +}
> +
> +static const struct clk_ops qcom_clk_ref_ops = {
> +	.prepare = qcom_clk_ref_prepare,
> +	.unprepare = qcom_clk_ref_unprepare,
> +	.enable = qcom_clk_ref_enable,
> +	.disable = qcom_clk_ref_disable,
> +	.is_enabled = qcom_clk_ref_is_enabled,
> +};
> +
> +static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
> +				 struct qcom_clk_ref *clk_refs,
> +				 const struct qcom_clk_ref_desc *descs,
> +				 size_t num_clk_refs)
> +{
> +	const struct qcom_clk_ref_desc *desc;
> +	struct qcom_clk_ref *clk_ref;
> +	size_t clk_idx;
> +	unsigned int i;
> +	int ret;
> +
> +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> +		clk_ref = &clk_refs[clk_idx];
> +		desc = &descs[clk_idx];
> +
> +		if (!desc->name)
> +			continue;
> +
> +		clk_ref->regmap = regmap;
> +		clk_ref->desc = *desc;
> +
> +		if (clk_ref->desc.num_regulators) {
> +			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
> +							   sizeof(*clk_ref->regulators),
> +							   GFP_KERNEL);
> +			if (!clk_ref->regulators)
> +				return -ENOMEM;
> +
> +			for (i = 0; i < clk_ref->desc.num_regulators; i++)
> +				clk_ref->regulators[i].supply =
> +					clk_ref->desc.regulator_names[i];
> +
> +			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
> +						      clk_ref->regulators);
> +			if (ret)
> +				return dev_err_probe(dev, ret,
> +						     "Failed to get regulators for %s\n",
> +						     clk_ref->desc.name);
> +		}
> +
> +		clk_ref->init_data.name = clk_ref->desc.name;
> +		clk_ref->init_data.parent_data = &qcom_clk_ref_parent_data;
> +		clk_ref->init_data.num_parents = 1;
> +		clk_ref->init_data.ops = &qcom_clk_ref_ops;
> +		clk_ref->hw.init = &clk_ref->init_data;
> +
> +		ret = devm_clk_hw_register(dev, &clk_ref->hw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct qcom_clk_ref_provider *provider = data;
> +	unsigned int idx = clkspec->args[0];
> +
> +	if (idx >= provider->num_refs)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!provider->refs[idx].regmap)
> +		return ERR_PTR(-ENOENT);
> +
> +	return &provider->refs[idx].hw;
> +}
> +
> +int qcom_clk_ref_probe(struct platform_device *pdev,
> +		       const struct regmap_config *config,
> +		       const struct qcom_clk_ref_desc *descs,
> +		       size_t num_clk_refs)
> +{
> +	struct qcom_clk_ref_provider *provider;
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
> +	if (!provider)
> +		return -ENOMEM;
> +
> +	provider->refs = devm_kcalloc(dev, num_clk_refs, sizeof(*provider->refs),
> +				      GFP_KERNEL);
> +	if (!provider->refs)
> +		return -ENOMEM;
> +
> +	provider->num_refs = num_clk_refs;
> +
> +	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
> +				    provider->num_refs);
> +	if (ret)
> +		return ret;
> +
> +	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
> +}
> +EXPORT_SYMBOL_GPL(qcom_clk_ref_probe);
> diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
> new file mode 100644
> index 000000000000..09e2e3178cfb
> --- /dev/null
> +++ b/include/linux/clk/qcom.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __LINUX_CLK_QCOM_H
> +#define __LINUX_CLK_QCOM_H
> +
> +#include <linux/clk-provider.h>
> +#include <linux/errno.h>
> +#include <linux/kconfig.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +struct device;
> +struct platform_device;
> +struct regulator_bulk_data;
> +
> +/**
> + * struct qcom_clk_ref_desc - descriptor for a clkref_en gate clock
> + * @name: clock name exposed to the common clock framework
> + * @offset: clkref_en register offset from the block base
> + * @regulator_names: optional supply names enabled while preparing the clock
> + * @num_regulators: number of entries in @regulator_names
> + */
> +struct qcom_clk_ref_desc {
> +	const char *name;
> +	u32 offset;
> +	const char * const *regulator_names;
> +	unsigned int num_regulators;
> +};
> +
> +/**
> + * struct qcom_clk_ref - per-clock data for a clkref_en gate clock
> + * @hw: common clock framework hardware clock handle
> + * @init_data: common clock framework registration data
> + * @regmap: register map backing the clkref_en register
> + * @desc: clock descriptor copied at registration time
> + * @regulators: optional bulk regulator handles for @desc.regulator_names
> + */
> +struct qcom_clk_ref {
> +	struct clk_hw hw;
> +	struct clk_init_data init_data;
> +	struct regmap *regmap;
> +	struct qcom_clk_ref_desc desc;
> +	struct regulator_bulk_data *regulators;
> +};
> +
> +#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
> +
> +int qcom_clk_ref_probe(struct platform_device *pdev,
> +		       const struct regmap_config *config,
> +		       const struct qcom_clk_ref_desc *descs,
> +		       size_t num_clk_refs);
> +
> +#else
> +
> +static inline int
> +qcom_clk_ref_probe(struct platform_device *pdev,
> +		   const struct regmap_config *config,
> +		   const struct qcom_clk_ref_desc *descs,
> +		   size_t num_clk_refs)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +#endif
> +
> +#endif
> 

