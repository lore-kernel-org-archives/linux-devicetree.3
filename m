Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E80537C903
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 17:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750937; cv=none; b=NvqTABFsDffzLvFsrfEUjHebYMKT2pa0KEbdizRDewEu6qCi64yszshjsMTm+jXKHiTeaU28sNlca8o+sLmxmstFXFgd8Xjan8E7DCdL+zr/3mw5h5Kk/RAiQeMKAXWoYmUpCcYQGt8ByZVS7zoiD9kx2N4icS94DSQYudCkpdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750937; c=relaxed/simple;
	bh=4tAwetJGeVwXh1vpQhoyUvbrrvbbDUYd5u7DlPU+cSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXMi22s8yBGF5KuwIaCQww4GxpmxcmFeiA8lnvabMvsnK/Rrn1/0nL0TdZqdVpHIUB5PiGMDQkGIYAoJsxQe5FadWBFyjI7y3NdWIsLLvjOEpwSBzzruLPZGXhSBfumcASNDs4WdDgmYKAS5NFc6QlxmPVCC4O/yB2Ba7WTsn80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKHcsJ2M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6Zq3cGC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKHcsJ2M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6Zq3cGC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IGoFfR1666293
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 17:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	efCUevAYLaZ4ZDzzEysSD+04eRBZY0LMiTuiDFcScG8=; b=cKHcsJ2M2ElX/rOJ
	wv3OxkE/sFi/nM3P5Nu8d1j1Xr88b26S/ivWMjU8x9amXGkLZYYh4+xXifMeZLXV
	dbWrTGNRy+1+Xi8CaGQMB/tfytlwXZ6m32bYnTgm/d/K/rYPZAbe99y7Sc2UG3qn
	ZgPkDJCyIhN9taP+Etdk/dXRr7kbMlAl8CNhHurZviPYrZ+5HQ2tGnFl9IW7JFE1
	eThZ+keT3nygax9m6AhqR1UGLEo6bHGVJhVFF3Wm3ezBOGEKzJJP1P6RaVsuPnSE
	SGV5YglLmIQfTfk/87r99BLFADBo/GDqSigerMfSoYRxa/wxNpEtsNgLUXpH3m4W
	PwuUbg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2tx63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 17:02:12 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806535f8ffso1607251241.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789750932; x=1790355732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efCUevAYLaZ4ZDzzEysSD+04eRBZY0LMiTuiDFcScG8=;
        b=F6Zq3cGCnttV0Pz1JEOThBgWV86HX8WYarJuJfuBtY1h2h3H7yg/a8gQCAf75fU8qE
         vLt3mokaZlE8eTlkSRt1i4EJ5G+FnHfmgyeygUho7/Oz+p5b6+OL+dIqqAF8MQWRdvCt
         WNHiGctss9uPRH88xH+df+BIf2rAWAyaU4NvoJ07lBX99sIYPKkvJWSXku0dSIZdiyVt
         YC7hBeLmyzR8fNAEfodmUDoUyBtDhC8+bA0UyHIcPTBS6DJ3NxnmjIlGZj/VVlxraoDl
         IU687YJ0ThMfxMmyN53fHiwAUMY8qyZ3od+1whJHFhEztPr0hQwpATkARVmcVBacV/dF
         LxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750932; x=1790355732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efCUevAYLaZ4ZDzzEysSD+04eRBZY0LMiTuiDFcScG8=;
        b=vdfj+BHYPYRUHFxxt/WQqVQ/RQ0bDiVaEBFDpIsoqtEfchIjU8xjqVa8eba+o3Jpgo
         hcv7C7AdP1O/Oyreq3yLDWwHgTdX318GFNw+KKDLxwvA7ShPcU06j+Pn6XaClcZbh82M
         hjDf46NF34QJMxyv0DiwTkDWjdrfs0tFX2WsYYb1rJyT6tJGBbsl+m83Y32cPAS5rOLr
         g78jWoPDlbUF8E2CTmfuke2vO/ZsWYeb63QSm1Cz2fwJpVqw2Vs1wdYhVnsf8PMiXfOc
         k3tPy+tbp+L9ipY52IgCR8672tgHaAFTmeBVJlsXkIHGll6Sc2hCwWPya2zWj5SUMmk1
         9z7A==
X-Forwarded-Encrypted: i=1; AKwUvByJdkLgYuVUC/Uhj33R0dXWuZrsS3TfejpDTwlDhcBircXhn88+Q6InG38T0n9AC6zfxmLvC53A6rtw@vger.kernel.org
X-Gm-Message-State: AFuF++lIoNdVdUCSaHyDxffjK3xfZB7kj9AP3H0wsFcJN0tdnlbAIQHF
	Op0NGyPqzI8uYiwtw892/kuGT2+PX8a2+JexIFf9Y/TuUurWcXeVOIE6TloaU0TwMqmpNno1Tt/
	HbyqA6/D+Lrn82XkWMVGob84erWNrhGm4nmyqaw1MKHTD3utoCFCwzybn0c+VvhFjTNX87jnS
X-Gm-Gg: AYBFou3VgL+gv1nwbDeENr+jepax3sGnrVKl+lEzhir/9qWaRVX6eRH+EAvPWTZkUcR
	SOAQmz6wGpqkbY0UOmQHuvoYuSMd+F7cCI0VStUAO985MjTvcJsfBqpMpaCQSwC58ObjM+7T/+j
	iozSpzOKM8G7E21w6rHReIZAo6HBAsiBpnNhy3/pJ4xOB3Q3lBqX2fWKd/sWmI3qsF/XewWdHyz
	TgTLCWFq6kGnmL6oguyBTehLNCfoR6PnvHyswOo7GXvTs/9oec3lQndC0Om6ZEqRmdk/6PGQb3y
	lwfZVY+XIFZOBOfv+PG5uOYTipD3aJUVziPynGgyeIy1rNxiwvuIGz3XNTmdmgvzjY+Jj3R4N4e
	24EIhkpo/paQPy6Ug1Yo9Q+iZ5ftmdHP3rz9dK/zbe+8/Txy8t0SwnxYC4H7z
X-Received: by 2002:a05:6102:20c1:b0:7a5:673f:9a37 with SMTP id ada2fe7eead31-7a5673fa378mr650713137.15.1789750932177;
        Fri, 18 Sep 2026 10:02:12 -0700 (PDT)
X-Received: by 2002:a05:6102:20c1:b0:7a5:673f:9a37 with SMTP id ada2fe7eead31-7a5673fa378mr650663137.15.1789750931657;
        Fri, 18 Sep 2026 10:02:11 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:bb0:6e51:d247:d411? ([2a05:6e02:1041:c10:bb0:6e51:d247:d411])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1026f4sm5901365e9.8.2026.09.18.10.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:02:10 -0700 (PDT)
Message-ID: <94eef31a-59e0-4a7b-8032-49ff8ae3d141@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:02:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] thermal/drivers/loongson2: Add support for
 Loongson-2K0300
To: Binbin Zhou <zhoubinbin@loongson.cn>,
        Binbin Zhou
 <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
        zhanghongchen <zhanghongchen@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <cover.1789546118.git.zhoubinbin@loongson.cn>
 <6985dce54bb5b87bb232c714d236b7cb82eeb58c.1789546118.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <6985dce54bb5b87bb232c714d236b7cb82eeb58c.1789546118.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI0MyBTYWx0ZWRfXwv7X3EfwHOOg
 kQNAC31b0VoJkq73nv4Gee2vGW5FDODEPwp+TF3tb4TPyQIoik/TCez0IAlAgOJd5ipm+AY3biu
 5M/z7YXhJ4bx7vjeCRblCf80t/+l+DA=
X-Proofpoint-GUID: 2w03fxNMt4GZi1GsVYtlamwyiRNc0bTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI0MyBTYWx0ZWRfX9LXoRXHEBwCZ
 9XJiOwGA16cRC2t0V2HHSvz0ErdefsA+tITOJZiczJYdam1lJUNKNjlWHSs6PD+8XI8AcP6wFiY
 0mt4HYf1c05sRd2LPKYmxIbLG9ctFqST83UTI98+EoWkbySkYusNCV6bYx2MYocA9g6O8YcpU1X
 QDHHyae3oh7PbmA3RHk5ALrf6UZzS43o56ViIORK+ARElnluVXgM/BLgGDzdTetnVKRqsb0BIy/
 2Uc+qtVqamEdXEsM6ct2GqRdvyiTYPYJWElnvS1s97dLYFtJ+20MP6scUHwUzfU1++z7GbrtZU3
 dgiwEBaPqvm/lheWy8e2cyOqULSYcKyI/AbtLOtbS2HVIY+sLlKNLzQoNUHqBztCbBWO9fHoRpS
 1PVzRQAzOBhfvmj1EcbqH1kOPwT2ni3BUgM2sxGTnZskAdfE6GZW2qDi8iRY/2AuzWWoH77YtOH
 X1E4SCyS7p4oX2/lk8Q==
X-Proofpoint-ORIG-GUID: 2w03fxNMt4GZi1GsVYtlamwyiRNc0bTT
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aad6e94 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=xWeNXaD_ud2RrK6SvpQA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180243


Hi Binbin,


On 9/17/26 13:15, Binbin Zhou wrote:
> The Loongson-2K0300 thermal sensor uses a 10-bit ADC and requires

The commit message says this is a 10-bit ADC, while the code uses bits 
[10:0]. The 2K0300 user manual also describes Thsens_val[10:0], i.e. an 
11-bit value. Should this say 11-bit instead?

> per-chip calibration. The calibration offset is stored in the CHIP ID
> registers, which are accessed via syscon. The driver reads this offset
> and applies it when converting the raw ADC value to millicelsius.
> 
> To handle old fuse versions that cannot be calibrated correctly, the
> driver includes a fallback formula and a validity check. Once invalid
> data is detected, the driver falls back to the old formula for future
> reads and warns the user.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   drivers/thermal/loongson2_thermal.c | 94 ++++++++++++++++++++++++++++-
>   1 file changed, 92 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
> index fb4793a9bc55..8930a8a75da7 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
> @@ -2,9 +2,11 @@
>   /*
>    * Author: zhanghongchen <zhanghongchen@loongson.cn>
>    *         Yinbo Zhu <zhuyinbo@loongson.cn>
> + *         Binbin Zhou <zhoubinbin@loongson.cn>
>    * Copyright (C) 2022-2023 Loongson Technology Corporation Limited
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/minmax.h>
> @@ -13,6 +15,9 @@
>   #include <linux/property.h>
>   #include <linux/thermal.h>
>   #include <linux/units.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/syscore_ops.h>

Is it enabled ?

>   
>   #include "thermal_hwmon.h"
>   
> @@ -22,18 +27,34 @@
>   #define LOONGSON2_THSENS_CTRL_LOW_REG	0x8
>   #define LOONGSON2_THSENS_STATUS_REG	0x10
>   #define LOONGSON2_THSENS_OUT_REG	0x14
> +#define LOONGSON2_THSENS_CFG_REG	0x18
>   
>   #define LOONGSON2_THSENS_INT_LO		BIT(0)
>   #define LOONGSON2_THSENS_INT_HIGH	BIT(1)
>   #define LOONGSON2_THSENS_INT_EN		(LOONGSON2_THSENS_INT_LO | \
>   					 LOONGSON2_THSENS_INT_HIGH)
> -#define LOONGSON2_THSENS_OUT_MASK	0xFF
> +#define LOONGSON2_THSENS_OUT_8B_MASK	0xFF
> +#define LOONGSON2_THSENS_OUT_11B_MASK	GENMASK(10, 0)
> +
> +#define LS2K0300_CHIP_ID0		0x10
> +#define LS2K0300_CHIP_ID1		0x14
> +#define LS2K0300_EXTERN_ID		BIT(4)
> +#define LS2K0300_ID0_VAL_MASK		GENMASK(31, 20)
> +#define LS2K0300_ID1_VAL_MASK		GENMASK(15, 0)
> +
> +#define LS2K0300_COMP_VAL_MASK		GENMASK(14, 0)
> +#define LS2K0300_COMP_SIGN_BIT		BIT(15)
> +
> +#define LS2K0300_LOWEST_VALID_TEMP	(-55000)
> +#define LS2K0300_HIGHEST_VALID_TEMP	(125000)
>   
>   /*
>    * This flag is used to indicate the temperature reading
>    * method of the Loongson-2K2000
>    */
>   #define LS2K2000_THSENS_OUT_FLAG	BIT(0)
> +#define LS2K0300_CHIP_ID_FLAG		BIT(1)
> +#define LS2K0300_OLD_FUSE_FLAG		BIT(2)
>   
>   struct loongson2_thermal_chip_data {
>   	unsigned int thermal_sensor_sel;
> @@ -42,8 +63,11 @@ struct loongson2_thermal_chip_data {
>   };
>   
>   struct loongson2_thermal_data {
> +	struct device *dev;
>   	void __iomem *ctrl_reg;
>   	void __iomem *temp_reg;
> +	struct regmap *regmap_cfg;
> +	u32 flags;
>   	const struct loongson2_thermal_chip_data *chip_data;
>   };
>   
> @@ -71,13 +95,54 @@ static int loongson2_thermal_set(struct loongson2_thermal_data *data,
>   	return 0;
>   }
>   
> +static int loongson2_2k0300_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct loongson2_thermal_data *tdata = thermal_zone_device_priv(tz);
> +	int calib_data, calib_offset, temp_mc, raw_adc;
> +	u32 chip_id0 = 0, chip_id1 = 0;
> +
> +	writel(0xff03, tdata->ctrl_reg + LOONGSON2_THSENS_CFG_REG);

Please no litterals or magic values in the code. Add a define with a 
self-explanatory names and a comment if it makes sense (there are other 
places in the code to be checked).

> +	raw_adc = FIELD_GET(LOONGSON2_THSENS_OUT_11B_MASK,
> +			    readl(tdata->ctrl_reg + LOONGSON2_THSENS_OUT_REG));

Why is it done at every read and not at probe time ?

> +
> +	if (tdata->flags & LS2K0300_OLD_FUSE_FLAG) {
> +		*temp = raw_adc * 569 - 394700;

				no litterals ...

and don't repeat the formula, write a function for it

> +		return 0;
> +	}
> +
> +	regmap_read(tdata->regmap_cfg, LS2K0300_CHIP_ID0, &chip_id0);
> +	regmap_read(tdata->regmap_cfg, LS2K0300_CHIP_ID1, &chip_id1);

The return values of regmap_read() are ignored here. If accessing the 
CHIP ID registers fails, the driver will silently use zero or partially 
initialized calibration data and may report a plausible but incorrect 
temperature. Could you propagate the error instead?
> +	if (chip_id0 & LS2K0300_EXTERN_ID) {
> +		calib_data = FIELD_GET(LS2K0300_ID1_VAL_MASK, chip_id1);
> +		calib_offset = FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);
> +		if (calib_data & LS2K0300_COMP_SIGN_BIT)
> +			calib_offset = -calib_offset;
> +	} else {
> +		calib_data = FIELD_GET(LS2K0300_ID0_VAL_MASK, chip_id0);
> +		calib_offset = FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);
> +	}
> +
> +	temp_mc = (raw_adc + calib_offset) * 570 - 394700;

				no litterals + formula ...

> +
> +	/* For old fuse which can not read right thermal data */
> +	if (temp_mc < LS2K0300_LOWEST_VALID_TEMP || temp_mc > LS2K0300_HIGHEST_VALID_TEMP) {
> +		dev_warn_once(tdata->dev, "It's an old fuse, thermal %d is not right\n", temp_mc);

Improve the message please

> +		tdata->flags |= LS2K0300_OLD_FUSE_FLAG;
> +		temp_mc = raw_adc * 569 - 394700;
> +	}
> +	*temp = temp_mc;
> +
> +	return 0;
> +}
> +
>   static int loongson2_2k1000_get_temp(struct thermal_zone_device *tz, int *temp)
>   {
>   	int val;
>   	struct loongson2_thermal_data *data = thermal_zone_device_priv(tz);
>   
>   	val = readl(data->ctrl_reg + LOONGSON2_THSENS_OUT_REG);
> -	*temp = ((val & LOONGSON2_THSENS_OUT_MASK) - HECTO) * KILO;
> +	*temp = ((val & LOONGSON2_THSENS_OUT_8B_MASK) - HECTO) * KILO;
>   
>   	return 0;
>   }
> @@ -112,6 +177,11 @@ static int loongson2_thermal_set_trips(struct thermal_zone_device *tz, int low,
>   	return loongson2_thermal_set(data, low/MILLI, high/MILLI, true);
>   }
>   
> +static const struct thermal_zone_device_ops loongson2_2k0300_of_thermal_ops = {
> +	.get_temp = loongson2_2k0300_get_temp,
> +	.set_trips = loongson2_thermal_set_trips,
> +};
> +
>   static const struct thermal_zone_device_ops loongson2_2k1000_of_thermal_ops = {
>   	.get_temp = loongson2_2k1000_get_temp,
>   	.set_trips = loongson2_thermal_set_trips,

Can you confirm the set_trips function is the same for 2k1000 and 2k0300 ?

> @@ -134,6 +204,8 @@ static int loongson2_thermal_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	data->chip_data = device_get_match_data(dev);
> +	data->flags = data->chip_data->flags;
> +	data->dev = dev;
>   
>   	data->ctrl_reg = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(data->ctrl_reg))
> @@ -146,6 +218,14 @@ static int loongson2_thermal_probe(struct platform_device *pdev)
>   			return PTR_ERR(data->temp_reg);
>   	}
>   
> +	/* The chip id register is needed for Loongson-2K0300 */
> +	if (data->chip_data->flags & LS2K0300_CHIP_ID_FLAG) {
> +		data->regmap_cfg =
> +			syscon_regmap_lookup_by_phandle(dev->of_node, "loongson,chipid");
> +		if (IS_ERR(data->regmap_cfg))
> +			return PTR_ERR(data->regmap_cfg);
> +	}
> +
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)
>   		return irq;
> @@ -178,6 +258,12 @@ static int loongson2_thermal_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct loongson2_thermal_chip_data loongson2_thermal_ls2k0300_data = {
> +	.thermal_sensor_sel = 0,
> +	.flags = LS2K0300_CHIP_ID_FLAG,
> +	.thermal_ops = &loongson2_2k0300_of_thermal_ops,
> +};
> +
>   static const struct loongson2_thermal_chip_data loongson2_thermal_ls2k1000_data = {
>   	.thermal_sensor_sel = 0,
>   	.flags = 0,
> @@ -191,6 +277,10 @@ static const struct loongson2_thermal_chip_data loongson2_thermal_ls2k2000_data
>   };
>   
>   static const struct of_device_id of_loongson2_thermal_match[] = {
> +	{
> +		.compatible = "loongson,ls2k0300-thermal",
> +		.data = &loongson2_thermal_ls2k0300_data,
> +	},
>   	{
>   		.compatible = "loongson,ls2k1000-thermal",
>   		.data = &loongson2_thermal_ls2k1000_data,

