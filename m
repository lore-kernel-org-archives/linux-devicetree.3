Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B59422424C
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779164347; cv=none; b=WeDUzKunJh1EL9GFi5i324XIZU3MyW9QA8J5jDrCZKAvOqaDF1/D8BsSe9ChBLh7pNDUr3LN/TLYuQfFwf0yRswqvCrRNQnlA75+Sc+uFKx/y8ipYCHuiIZ9DQZ9MaoeLZ2sV+5ExgDswlYrFWHwLXD6YTv80cNYYNW1IArLxiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779164347; c=relaxed/simple;
	bh=9CBVlFoOVTDsC5voXsZV5abYikkBO1yB1bpa9e9ZJmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7Q6HNBvfDpaLoK46eYDUn2rsZaUkzBQg15xsrTD0khxzWH8/BrvxiuTx7KZ0rUoEYQLzAty2g+ZkS1qnbpzZSYghh0pm98vv0/P/wC8lExtdcMlc3VLdTSQpuPK/s8d7+l/JbR1OawULOQe4VS2T5p6BJk5IeBn0IcWezPSjfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCAyNbSB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIhcVank; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCAyNbSB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIhcVank"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IK6dmB1890446
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lnM4NJyGEIyR+vmEiNA7vs8BcA5GFUvADg3Wqm9gRYI=; b=KCAyNbSBfZReNYVF
	vz7sxf76vtCmhc79euqJAitj8vWj9XRlzkl5jFBkpAY5zZhKlW5J0TA+BFzFVsFo
	25Heq5Zqrlt3qrLRfuccpthdG2zY5l/Okp9OZzgHF7sNXXCuKZKHxpTluKIsMUGT
	F/U7v+F3ZzcZVyxhUz1ZOQoeREF3+DmO9TZokfjFppiS+nb2BTH1jJv7ZQRWZL7W
	ZW7S0czYnBcAgYURq+h/nThQeCxjn+dcRyNmKR5Bkm6oWe5uNB8k0a1Px6ID/edw
	0ZhdGB52Ft0C/DM35ofvbCYXquopxhOD8bWFBWf1UMZqz1/yA4k3ad1p7U7K8038
	GlZn0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82pw33rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:19:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so2847502a91.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 21:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779164344; x=1779769144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lnM4NJyGEIyR+vmEiNA7vs8BcA5GFUvADg3Wqm9gRYI=;
        b=JIhcVankG5gmbCNIvja/XKcoj9+vqPtgW0sBMfOldHG8+QZdjuqJpLeNPofrhY6iUg
         r6W3WmH8K0q0g2yHzyw39ysNUioqQInOZ1PXwLYMCizPnQPogCQJ/y2Q4wfpt1Z5eWhG
         17KWzNT3dYLQluzSYLQDKg+3Whimx1OmT5YAINPsh2x/1QSVC16iixQweF1/JbmDVNdp
         ZlrXAobeaCtdsZJ+3s/xIsMnRmg4zClt7NP3DXa+M1h5WfEJc467fjHUfOoGARLV2JoG
         H2qEtJwOBEfEBkOhehqGEB/kvtKWO5022TjZpXCmI1msRlUx35tQ4PzXM2uV1jjgqux2
         XoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779164344; x=1779769144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnM4NJyGEIyR+vmEiNA7vs8BcA5GFUvADg3Wqm9gRYI=;
        b=et0dO3roY6exzaqGJ7uAmQmIqYNkrvYDsA4HLCMDvvuAaLFaktVrCqb9TjvYcHoM8t
         9Rquq+M+eAuCyBYDU4M2DBmE0TdvUwyGd1g/GbK87FL8M2Lt7sSZBZzTKI4B1Mg325wK
         gn9NZuCSg/I4P0OTZhnuqdufD0R7qNjHojN/0BP7CcsM5zGW321m61FXx/JkeDG+WR/t
         jhKHm8Yb/6vUV5wjtjYrX/kO4L1CD4ubiXo/c4YkVKQfMkvbwZE/j/I851mCMErbd0ih
         r/+HrpaQYUHt6rGW1B6Xd0FBcwdnltnvM8BPfUKa0wYqtgv10pXNx2AoPMJbddEoQniE
         LAsg==
X-Forwarded-Encrypted: i=1; AFNElJ+Ekv5tUD9ew1b/nhccCukSQSJmBEQzaO9ID4XRFdIpRNhI8e9SE2KiPSyczx7gQ4aDW8AMxKEWZ4Hm@vger.kernel.org
X-Gm-Message-State: AOJu0YwdDcH76EIhHWJ+TG2Q+zbJz3X2A5LF0hxqT3BltmN3rTb9EogP
	7izJYhaEvvAjoJ0ptUVdVVB9XJwKmJOiTNOrJar2wrY4h3A0sQ+u85xy29sljBvUc/abnHWLJax
	14D0rnY+VYmE+4CoqjodzAXtNkS/7cmjmUcDOHL6h/yMbaZiGDXZaZ2yGeQJLPBbc
X-Gm-Gg: Acq92OHUQQs7fujq6M16DxStAfJsJmRPP1Ee5W0psMKAso4jXEvO3pLPKyhJmAiMWBf
	1niesbq9NO2e/oreFfYHtPGZ36tCsjdyN6qTvH4lbFLPRNVb0rzIDceRskPl3xX+sxb+sYOIIl2
	O8a40S8KDFlMG17ZVN7eb08xiRlmuuzWlti7Z/zL3wKvM93kjA88CvfyxJHtFgoF2Bz517yMO50
	Z46WaypSAl+qdDulKXnXUEs8dJAP0fyNOlwblpFz9YndwTvxu8iNw2Ahfs4XzQWf3r9Iibk9QmQ
	6j0dzntGZOUjGMj84F6+GA8a0nVdahz4o/RSTdcc3Dsf5EHQmt+s2T9Q+zHSeFyXJLuNEdA2f+h
	zggijvkRcNLBX3hp/jQH5xjSsqzcglXiwJGRRcpQxj+kotlcrgA==
X-Received: by 2002:a17:90b:5284:b0:367:bc89:546e with SMTP id 98e67ed59e1d1-369519e5346mr17091070a91.12.1779164344095;
        Mon, 18 May 2026 21:19:04 -0700 (PDT)
X-Received: by 2002:a17:90b:5284:b0:367:bc89:546e with SMTP id 98e67ed59e1d1-369519e5346mr17091050a91.12.1779164343568;
        Mon, 18 May 2026 21:19:03 -0700 (PDT)
Received: from [10.92.181.2] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951437316sm12725222a91.11.2026.05.18.21.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 21:19:03 -0700 (PDT)
Message-ID: <f12b1bd8-4cc7-493b-b1d1-262212bc3e44@oss.qualcomm.com>
Date: Tue, 19 May 2026 09:48:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        andersson@kernel.org, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20260518165346.1732548-1-palash.kambar@oss.qualcomm.com>
 <20260518165346.1732548-4-palash.kambar@oss.qualcomm.com>
 <c6hlbz44belq5l3ko23ijny22hxzei5fexk47hwselgn7onsbz@o7uwxlkvgtwt>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <c6hlbz44belq5l3ko23ijny22hxzei5fexk47hwselgn7onsbz@o7uwxlkvgtwt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a6AAM0SF c=1 sm=1 tr=0 ts=6a0be4b8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=B5rOy3ph_a5vLh5NyVAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAzOCBTYWx0ZWRfX0LbVlAE+OjQO
 I0hq/J19S3x9tb9JrVqrrFGgS4UAyaeTaoOzjeCq2uua4uleHYhGpTmTPkvSFPQFyngSYG8GRHM
 Vmg58c8YARrCQooo+A4xT9HlZvmzVd3gRMbZuLGlOjNLiXMWDgOe8D24TW7UHI2VkO3S0yUG+BD
 rvUVu3tIyNrHLcSke+v9V65sfmGfZRvp4eVARu0agtktSE8xYqsk5SAbtKY+lWn5CUJWFW+B382
 IPt4nMabEb2xA69QWgwZ7YoQYJz4BL/J7PaexLk1XV4jSc6eNk9F9fhmw/D+clLXPboLQ8Qi2SQ
 3qG7EwLeV/AwhpRLU3C6+MedLbQAwP/hXORWKxoFvLvvPl53lTmD40m6bzrlHIovzioNq167Uxk
 ZA26c0W2w9VoCp1EVevIxCNtYcwv47KICmYdO4jv2OaTFkX+l+w9gZ+SKQv/96gOwdaXJ/yM2+J
 aBI/YxG1HrXfPm1K8Lw==
X-Proofpoint-GUID: 9KbJiFjdzdDoNSF2NAGSH97cN4GzosMU
X-Proofpoint-ORIG-GUID: 9KbJiFjdzdDoNSF2NAGSH97cN4GzosMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190038



On 5/18/2026 10:39 PM, Dmitry Baryshkov wrote:
> On Mon, May 18, 2026 at 10:23:46PM +0530, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> Add the init sequence tables and config for the UFS QMP phy found in
>> the Hawi SoC.
>>
>> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
>> ---
>>  .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  22 +++
>>  .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
>>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 140 ++++++++++++++++++
>>  3 files changed, 199 insertions(+)
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>> new file mode 100644
>> index 000000000000..bf914c752d22
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2026, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef QCOM_PHY_QMP_PCS_UFS_V7_H_
>> +#define QCOM_PHY_QMP_PCS_UFS_V7_H_
>> +
>> +/* Only for QMP V7 PHY - UFS PCS registers */
>> +
>> +#define QPHY_V7_PCS_UFS_PCS_CTRL1			0x01C
>> +#define QPHY_V7_PCS_UFS_PLL_CNTL			0x028
>> +#define QPHY_V7_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x02C
>> +#define QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY		0x060
>> +#define QPHY_V7_PCS_UFS_RX_HSGEAR_CAPABILITY		0x094
>> +#define QPHY_V7_PCS_UFS_LINECFG_DISABLE			0x140
>> +#define QPHY_V7_PCS_UFS_RX_SIGDET_CTRL2			0x150
>> +#define QPHY_V7_PCS_UFS_READY_STATUS			0x16c
>> +#define QPHY_V7_PCS_UFS_TX_MID_TERM_CTRL1		0x1b8
>> +#define QPHY_V7_PCS_UFS_MULTI_LANE_CTRL1		0x1c0
>> +
>> +#endif
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
>> new file mode 100644
>> index 000000000000..5f923c3e64ec
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2026, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef QCOM_PHY_QMP_QSERDES_TXRX_UFS_V8_H_
>> +#define QCOM_PHY_QMP_QSERDES_TXRX_UFS_V8_H_
>> +
>> +#define QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_TX		(0x34)
>> +#define QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_RX		(0x38)
>> +#define QSERDES_UFS_V8_TX_LANE_MODE_1				(0x80)
>> +#define QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE2			(0x1BC)
>> +#define QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE4			(0x1C4)
>> +#define QSERDES_UFS_V8_RX_UCDR_SO_GAIN_RATE4			(0x1DC)
>> +#define QSERDES_UFS_V8_RX_EQ_OFFSET_ADAPTOR_CNTRL1		(0x2C8)
>> +#define QSERDES_UFS_V8_RX_UCDR_PI_CONTROLS			(0x1E4)
>> +#define QSERDES_UFS_V8_RX_OFFSET_ADAPTOR_CNTRL3			(0x2D0)
>> +#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4	(0x120)
>> +#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_FO_GAIN_RATE4		(0xD4)
>> +#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_SO_GAIN_RATE4		(0xEC)
>> +#define QSERDES_UFS_V8_RX_VGA_CAL_MAN_VAL			(0x288)
>> +#define QSERDES_UFS_V8_RX_EQU_ADAPTOR_CNTRL4			(0x2B0)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE_0_1_B4			(0x324)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SA_B7			(0x3B4)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SA_B9			(0x3BC)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SB_B7			(0x3E0)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SB_B9			(0x3E8)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SA_B7			(0x40C)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SA_B9			(0x414)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SB_B7			(0x438)
>> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SB_B9			(0x440)
>> +#define QSERDES_UFS_V8_RX_UCDR_SO_SATURATION			(0xF4)
>> +#define QSERDES_UFS_V8_RX_TERM_BW_CTRL0				(0x1AC)
>> +#define QSERDES_UFS_V8_RX_DLL0_FTUNE_CTRL			(0x498)
>> +#define QSERDES_UFS_V8_RX_SIGDET_CAL_TRIM			(0x4d0)
>> +
>> +#endif
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> index 771bc7c2ab50..a4801cf4b0fe 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -29,9 +29,11 @@
>>  #include "phy-qcom-qmp-pcs-ufs-v4.h"
>>  #include "phy-qcom-qmp-pcs-ufs-v5.h"
>>  #include "phy-qcom-qmp-pcs-ufs-v6.h"
>> +#include "phy-qcom-qmp-pcs-ufs-v7.h"
>>  
>>  #include "phy-qcom-qmp-qserdes-txrx-ufs-v6.h"
>>  #include "phy-qcom-qmp-qserdes-txrx-ufs-v7.h"
>> +#include "phy-qcom-qmp-qserdes-txrx-ufs-v8.h"
>>  
>>  /* QPHY_PCS_READY_STATUS bit */
>>  #define PCS_READY				BIT(0)
>> @@ -84,6 +86,13 @@ static const unsigned int ufsphy_v6_regs_layout[QPHY_LAYOUT_SIZE] = {
>>  	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_UFS_POWER_DOWN_CONTROL,
>>  };
>>  
>> +static const unsigned int ufsphy_v7_regs_layout[QPHY_LAYOUT_SIZE] = {
>> +	[QPHY_START_CTRL]		= QPHY_V6_PCS_UFS_PHY_START,
>> +	[QPHY_PCS_READY_STATUS]		= QPHY_V7_PCS_UFS_READY_STATUS,
>> +	[QPHY_SW_RESET]			= QPHY_V6_PCS_UFS_SW_RESET,
>> +	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_UFS_POWER_DOWN_CONTROL,
> 
> Don't mix V6 and V7 registers. And why is it v7? The rest of the
> registers point out a v8 PHY.
> 
>> +};
>> +
>>  static const struct qmp_phy_init_tbl milos_ufsphy_serdes[] = {
>>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xd9),
>>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
>> @@ -1844,6 +1868,119 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
>>  
>>  };
>>  
>> +static const struct qmp_phy_init_tbl hawi_ufsphy_serdes[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xd9),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x11),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x01),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x60),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x1f),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO_MODE1, 0x1f),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IETRIM, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IPTRIM, 0x20),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_CTRL, 0x40),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADAPTIVE_ANALOG_CONFIG, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x18),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x14),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_ADAPTIVE_MODE0, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCCTRL_ADAPTIVE_MODE0, 0x18),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_ADAPTIVE_MODE0, 0x14),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x7f),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x92),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x4c),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x18),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x14),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_ADAPTIVE_MODE1, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCCTRL_ADAPTIVE_MODE1, 0x18),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_ADAPTIVE_MODE1, 0x14),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x99),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xbe),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
> 
> Yep... If it is V8, use V8 registers. Even if they are they same.
> 
>> +};
>> +
>> +static const struct qmp_phy_init_tbl hawi_ufsphy_tx[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_LANE_MODE_1, 0x0c),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_TX, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_RX, 0x17),
> 
> And it's V8.
> 

Sure Dmitry, will update. Thanks.


>> +};
>> +
> 

