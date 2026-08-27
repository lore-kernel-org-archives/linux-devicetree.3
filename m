Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF12735C6A1
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849201; cv=none; b=BO5rpHfb5OFrj+KSPXUty7o9bqfU9QIzN8c6GSwH6myin+YCG598IZh6Z3K5fMwu6y62FvEYm+6t1dEXGKTk64VHqDyjkJNZX4U/B0m4GIht4COIKdmJrX5O8lKeACxlmVCni7vv+yWGmjllhkBNSpEOQMaZ8MENuAWuMl12vHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849201; c=relaxed/simple;
	bh=GiSP6QV6mc0s3OiNVyzEWFjgk8ZwlgGcOGH1LCRfE/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eb/JOgtT1Ah/NN1thr7Neifo3N+QWpNto+cgHTCFTxt/DUhf3RmWA/MeW5mVntJ0MxfIoGnzqo8ypfgi0p5v6qUcvq8639gHghNEMhguDpGGemlHWJIybb3RHcKkJ1c9ZMio2z82UfotpVrU+Q+y8NxD5UGkdYjmgY3kSHrB1BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0glBXuy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bp9JEI4E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0glBXuy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bp9JEI4E"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbf6E3829412
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	04ZKMcnXgGkCw54cQeUZ197WIreRiI4WJLmXW900/HI=; b=h0glBXuyQUQRYemm
	DfEe5CHlzurV6Ac3tsRZaFGaqEJpGD5PldYYJ0ygayjFBm0ZRPi3PRQ6yk+WTpkY
	3zzVN1vhXEeXFyL53bker2bbEITkgZCrBR2c5gPkHX1hZVdjt6+RBzjsaifoS/jB
	4MyJmG2O/RhiD0zb/6C/9FCkKM8cVB2ZQic+spJXtg6Y4TSoSmu72trDf4yhHwx4
	ySW0ZFkVdyWT8sOI0w6TV76RL5GPavheA7YfIBYPf0sZECVeknbQ28ybpQZ7LWdt
	67VyS9dUjvFMdPZpsDO6sflvWpTs9t0y/pH7fkXuEL4XWYfR9RWBhiQVhve+hAHu
	aphPXw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7sa7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:46:39 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9e741693bso152125a34.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849198; x=1788453998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04ZKMcnXgGkCw54cQeUZ197WIreRiI4WJLmXW900/HI=;
        b=bp9JEI4EiuV5kB64KB/bpnqmCyLRs2CJWf7PEOeMVFz9JQ+xr48FPlUsNlDNMV+jD0
         Se3n2FEtadCPzLn/LGqCfgBl0vFbgenTKlEMd37k4bLcOObnYrLuSfmeuiUgZsB0z+FG
         4nwRuro9RavGJqoiItVA4OOJ8AGwx3auOb3L0J4wP69kJFvd5ukjDTUzcCENQzMHcq+4
         IcVjwrU4J5FscTR4GeD12ojOREPIph81LxVVzGs4tdfOOKjmVvzulPv8LLY3MMGPMl2/
         4LX7lZOgdi4QDfAzFGKOsN4ZHV3ejM/2GwQ1r/U7Ost22SrrYPtaMUAeA93BMo99hCqD
         pR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849198; x=1788453998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04ZKMcnXgGkCw54cQeUZ197WIreRiI4WJLmXW900/HI=;
        b=MaJv2Ye4rWO5GZf8FqUCUjryMzNUHi37BlInOzkjgD0XhmaRkE4HefH/KUAosxOKxL
         pAxJcvjXJP6obVX6ci35gaDuevx/IuldZUJSrKTm8j/e6DRvwcx4AsakKOvG0iO7Zvu+
         6HOz3IMvJb1YPyR8QinB7u+SDO++j70Giw/TI+MLeRCAfB2BXEe2im6AqBnjYC0Yy2Ul
         dRaN4E7IgJob2H0thSx9l/JO8XCrHf5N/IdtCas79elguM2uR+iOQv0LDzQuO1LDFFxF
         g6s/G866ZzakHLNtf4Yp25JBuGJXtErK4MS5mWPvwxxXK7E2YEwQHKTECaEgYMWqz7qc
         8XVA==
X-Forwarded-Encrypted: i=1; AHgh+RpKIaS4nDFpsO0Av6p+3NiqvayvGqnAVU6Fy2x0iQPFml3mJPbegbi9UaGWL5MKSRzmss6rdm7YopUP@vger.kernel.org
X-Gm-Message-State: AFuF++mmQfim+NYxJ3gUT+jP0CRd2NGDuv7Yykf8XgpA7IRNoiD8IRxG
	Ocno35ssjkU2B2Yd45N2KPp9NPd8D3ZJFFo5ETvXAGfixehEotpgNcCD3EDHBu0EmNfcw2wGrIq
	ioxXTHUxmLkjw6kfwIgdpao8Z5QquJ+ntg0qJEfOydmECtJS3q8l7fylr166WdmS/
X-Gm-Gg: AR+sD13OT1esCFYu+LqI8XdK2d/Wgh8R80xE+XXDU5TekHwBsbtO5Ye8gwg7FCt4kEY
	em7HTojn+QTACCguP7XbbTM+047BUam8Hmoi7kSNkrwpjC0QlhSBw7ruGUQ0wop6tIJ/Kwm6t+q
	jwQ8S9lOREsANJpq8DGQo534RTMC5NIdDzSbQKSOr1xyknd1j9mEPEWxMit7VoP2Zlyb/+v5OZh
	a/IJ7NxPacOf+Se7Ig0EvJ0DjnleNdF6FdTCIElSBgOgxcgrDERa7Fx8R6KV9IA0nE72goe0vu9
	rIFwr/RMZSWcI+6NYr14TtNWO5je/04L9n8PnssZIpBkC0dTQm83KxN9aVLCk44Af7qc8A+LyLk
	Wzpj0u8Vs2EqB0/l7Tsnl+wxRL7lVC8U=
X-Received: by 2002:a05:6830:4494:b0:7f4:d8e0:c392 with SMTP id 46e09a7af769-7f4f21ca005mr792628a34.2.1787849198163;
        Thu, 27 Aug 2026 09:46:38 -0700 (PDT)
X-Received: by 2002:a05:6830:4494:b0:7f4:d8e0:c392 with SMTP id 46e09a7af769-7f4f21ca005mr792519a34.2.1787849197577;
        Thu, 27 Aug 2026 09:46:37 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4c81c3cf2sm4497199a34.9.2026.08.27.09.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:46:37 -0700 (PDT)
Message-ID: <789f0ace-585b-40a0-b1ef-2fa0bbbe0ac2@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:16:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-9-196e2b306368@oss.qualcomm.com>
 <7ywfd3hfzngejfprv5zkn65kci52q5tgiq5h3sccpz35ov5eq4@ow4edd5epaws>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <7ywfd3hfzngejfprv5zkn65kci52q5tgiq5h3sccpz35ov5eq4@ow4edd5epaws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX7/eKh62PJxeM
 YhdNzVQWcGqoxjoW5zRcr4NTgXrsoZZ4Cj2NMKsUCArXt5izaQqZFnv+flEp+1NYLflPdkQ8eiZ
 Peidwxpk35E+EzuFzt16X6j6K9jqkRcnkNfANl/aegSXA9q+4whSc9FGou/xBDZNbTMRtBTVca5
 EUlD7Xv6LajU43s5pmjnoF9mAf0HA5SOR+ctZftRT1+bY1mcz2IT6A09GusGuBbpcRyJZaB0Apb
 RuiUEwFWoCfBGkELJ95rbXDKG69qxgbikResVaoc5l+wYCJ5BK19rGUWRhbXzXDd6wRQTnYLB2D
 +vI3/wx5Tpo8lTdUxnX34Cir7ipTQh433wp2iWJGWZzWaX0uFaunaJbz8VXosrVoteaAZ4KkA5g
 Kau2WuO0GEZySU5KgJBnYw48UlZfUslOK2Dmuh4Tr62hn2OMRwLoow3j3zdrtOHElfi5f9QkkzM
 CVgZ2MDw42md6uf8n6Q==
X-Proofpoint-GUID: prllfPrtLPKuHxh2pXONpovSINR1VL0D
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a9069ef cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=isv1MMe3HlJYIrOEQaEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: prllfPrtLPKuHxh2pXONpovSINR1VL0D
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX5BWe1JNpbeZ0
 2IlKfnQ6EOk6Pzw08yVvIZpQcHnyL1YM+hLUsSJ1oUTd1yAom7DeugbZWWzMj42NUCnhTkviVS9
 LRoOVLCaN//HkdMixilzQkI/UTKBqKA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270141


On 8/24/2026 1:20 PM, Abel Vesa wrote:
> On 26-08-21 21:39:02, Hardeep Sharma wrote:
>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>> interface through the common pinctrl-msm driver.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig.msm    |  11 +
>>   drivers/pinctrl/qcom/Makefile       |   1 +
>>   drivers/pinctrl/qcom/pinctrl-kuno.c | 801 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 813 insertions(+)
>>
> [...]
>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-kuno.c b/drivers/pinctrl/qcom/pinctrl-kuno.c
>> new file mode 100644
>> index 000000000000..f3f8ec3e09de
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-kuno.c
>> @@ -0,0 +1,801 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "pinctrl-msm.h"
> [...]
>
>> +
>> +static const struct pinfunction kuno_functions[] = {
>> +	MSM_GPIO_PIN_FUNCTION(gpio),
>> +	MSM_PIN_FUNCTION(audio_ref_clk),
>> +	MSM_PIN_FUNCTION(coex_uart),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_a),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_cs),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_reset),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_te),
>> +	MSM_PIN_FUNCTION(emac_mdc),
>> +	MSM_PIN_FUNCTION(emac_mdio),
>> +	MSM_PIN_FUNCTION(emac_pps_in),
>> +	MSM_PIN_FUNCTION(emac_ptp_aux),
>> +	MSM_PIN_FUNCTION(emac_ptp_pps),
>> +	MSM_PIN_FUNCTION(gcc_gp1_clk),
>> +	MSM_PIN_FUNCTION(gcc_gp2_clk),
>> +	MSM_PIN_FUNCTION(gcc_gp3_clk),
>> +	MSM_PIN_FUNCTION(mi2s0_data0),
>> +	MSM_PIN_FUNCTION(mi2s0_data1),
>> +	MSM_PIN_FUNCTION(mi2s0_sck),
>> +	MSM_PIN_FUNCTION(mi2s0_ws),
>> +	MSM_PIN_FUNCTION(mi2s1_data0),
>> +	MSM_PIN_FUNCTION(mi2s1_data1),
>> +	MSM_PIN_FUNCTION(mi2s1_sck),
>> +	MSM_PIN_FUNCTION(mi2s1_ws),
>> +	MSM_PIN_FUNCTION(mi2s_mclk),
>> +	MSM_PIN_FUNCTION(nav_gpio),
>> +	MSM_PIN_FUNCTION(pci_e_rst),
>> +	MSM_PIN_FUNCTION(pcie_clkreq_n),
>> +	MSM_PIN_FUNCTION(pll_bist_sync),
>> +	MSM_PIN_FUNCTION(pll_clk_aux),
>> +	MSM_PIN_FUNCTION(qdss_cti_trig0),
>> +	MSM_PIN_FUNCTION(qdss_cti_trig1),
>> +	MSM_PIN_FUNCTION(qdss_cti_trig1_mire),
>> +	MSM_PIN_FUNCTION(qdss_gpio_traceclk),
>> +	MSM_PIN_FUNCTION(qdss_gpio_tracectl),
>> +	MSM_PIN_FUNCTION(qup0_se0),
>> +	MSM_PIN_FUNCTION(qup0_se1),
>> +	MSM_PIN_FUNCTION(qup0_se2),
>> +	MSM_PIN_FUNCTION(qup0_se3_mira),
>> +	MSM_PIN_FUNCTION(qup0_se3_mirb),
>> +	MSM_PIN_FUNCTION(qup0_se4),
>> +	MSM_PIN_FUNCTION(sdc4_clk),
>> +	MSM_PIN_FUNCTION(sdc4_cmd),
>> +	MSM_PIN_FUNCTION(sdc4_data),
>> +	MSM_PIN_FUNCTION(sdc4_tb_trig),
>> +	MSM_PIN_FUNCTION(sgmii_phy_intr),
>> +	MSM_PIN_FUNCTION(spmi_coex_clk),
>> +	MSM_PIN_FUNCTION(spmi_coex_data),
>> +	MSM_PIN_FUNCTION(spmi_vgi_hwevent),
>> +	MSM_PIN_FUNCTION(uim1_clk),
>> +	MSM_PIN_FUNCTION(uim1_data),
>> +	MSM_PIN_FUNCTION(uim1_present),
>> +	MSM_PIN_FUNCTION(uim1_reset),
>> +	MSM_PIN_FUNCTION(usb2phy_ac_en),
>> +};
>> +
>> +/* Every pin is maintained as a single group, and missing or non-existing pin
>> + * would be maintained as dummy group to synchronize pin group index with
>> + * pin descriptor registered with pinctrl core.
>> + * Clients would not be able to request these dummy pin groups.
>> + */
>> +static const struct msm_pingroup kuno_groups[] = {
>> +	[0] = PINGROUP(0, uim1_data, NA, NA, NA, NA, NA, NA, NA, NA),
> We use underscores instead of NA here.
>
> Please compare to the older SoCs in upstream.

Thanks for review.

Corrected in v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

