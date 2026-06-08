Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9AA3EE1E6
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931712; cv=none; b=BAo+AEcVq1qWWrq0ReKbKaZlmIi3rfMe9d8Tr62qWMtZwDTCHutpg7Vln5rWTsmX7az376EhZRmV+sTK2NrEG7pqRoLY1/1VzmwP03bp3cyc+nn2Ft+zr9Ig1Xp3InXEwt0W37Hj3+3MhrRfL4Fm9krjBs2ZlWIFrSyz8OwYjFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931712; c=relaxed/simple;
	bh=lCy2O728tiykXRpHKLBGPusERFEYzvNyfMN+9DKAZrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IsqR6tcU9rRCNYWX2EBTtVvGUHBwN9tgoxHrsLJc0n9UIYnj90nlId1tWbJXmEmKmivbPoHrpNYE31rhRDKYyQ+09T71nhDIOo/BR7aLOTqY3NF4dvhaL8AEsDYZ42gXv54EdNa8sAatJPq3Bk10jBiV87JfC7daGV4Zd90DW/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrEJSE2y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ns2wQgex; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrEJSE2y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ns2wQgex"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658F0W7O3490918
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 15:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TtFfy8w/08jsZMbkH24MlC+rsE9bha84s4+WFRq7Npo=; b=NrEJSE2yfqRqa9kU
	U2Me1IBJ2wKmsbZaZYRTts4w6/3gl2VcuFiyaWfcmWjUBttvzkJAROK+MqnuDiHj
	rdFe2MYWksrZY1ixmfnkl0IBSaybAxzpOKNM32ETphWzHlfbYqHXROfOg8e6NswY
	UWzyHGQn42IqCzNCoICfijIO0u8szE4gW2xHb6mj7fFnv+dDMHaUMbCFTbHEU/Aa
	JHN6lRYAR7t4425rb8lt8WEVde/CVIi8WIXFsrO/6DpGu5ISB3/vOarjnGzF9RW3
	e0A2lMwHitl6dle0MzyzI79vtk2iofCVtzzpHCUJTkASGIWblG+FVsDCX40ujKXM
	1FcZ3g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrksq3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 15:15:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b9106b0fbso3760865a91.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 08:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780931710; x=1781536510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TtFfy8w/08jsZMbkH24MlC+rsE9bha84s4+WFRq7Npo=;
        b=Ns2wQgexaozEwZN77MkKFe2h/e2YGZ/JESHdyfna1O8r7EPNgMJ+y8qW6VJrCQwvaI
         0jXdMgPBIywtmDhDOt6pBgxRuyqxiM6A6MicEniUNYfmQAY9BrFhO3dx9BMdgEHKCr1/
         t0aiXSbkLvljONEZzESmj1edLCrGHTMvN/Ky9CfuWjesgWCbHoki0F76vWm7WgqI+b4h
         mXKy04NQS/uhjM6GvLD5x7tuP9o+OWhqW3H4YD8dEbDZw7tqcc+QLmSSVogzsVIIbwBf
         2K50TvlElxwCS9Mn2uGtScGkrkEG48ulr9RJynjcGHSY6IdqrU8VdTd2O1BiYgXs3m+d
         WCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780931710; x=1781536510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtFfy8w/08jsZMbkH24MlC+rsE9bha84s4+WFRq7Npo=;
        b=MB8NHeYAYGi/kuJVlCevAVglski1jbdmaOynEU9w4Fz7YP0CHEXuZjtDMoGGPv9I0f
         9+wtzvAR4aCWm0Rlq/lgFhUaa5HiSAk3V1jZ2JMoaHBhEMJUnlifL0afMOiriRLAeO2B
         MnTtYCfrNPEPtePl4otrtTbM5ufRTCnwyqd/53YulkQP3vstFdSz+27K8iQdPuOypldB
         ntY9LwzR1aZDA7SxX8XYN2u7Bsug7tC9HPUVhHAR5yVFBRyt6kkrC6B8JY7L1r7TBRlT
         1rIXBt8pLpPPl4OtLo2XTBqo/hmSm9Dn/qUeZ010QpS6Nlok5culwiFD7xx29MaHg991
         hTLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kO2ppPURO6xnaAgsaa4+LK6A7e9a1RGHYS44UtO0+c0Ejv6UdyFfgFysJBKqH5UGcZCmDIu1skP87@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+il1PQDdMf/F5KMj3VLyp3oOYnrZurn0+DDjbClhGMMGIwNSY
	sbYM5SmUHjXO7FIeVzTt3rKqzZOXaJQhTwuf7NGxQo/sYHVYo6zr0ZhDRPT8olgvKPPnfPkX9hy
	FhucOeGFMxTw4ZUtJ7R3DvE+rmUUTnUOnZFN6tcGMx05xQbQ80NGAzixHbCIdll2L
X-Gm-Gg: Acq92OGeu+r+hJpSPn8ax1+9BbIr6K9Ckh+6jSwc8CrmfLEB+rrYBvVm+R25ypHZjv4
	nprzEb8eqmoKBBv3rIn+7mIsaYv0Qe5b2lYnPUZ7EqoUnF3W7XoPBB/wVsv/Y2twZcuhwecsl7r
	H4GffXghZo9nqskYqM7yXkwVzMx+DZCuOZhVdxETrJUWWXhzlhqQ53+M5z47mqB46fapjlcgwZX
	urJXKxm4p3SX7w0h55tIIlPHJq5ozfyhco86sZSE2MD4CfvnJ1SWy+dlyPteJrOHu79qWq1jGvQ
	qRKby70BvtAB5AoMXD0HYElay4sd9BedF7GGWa4/6YWgw94NiK2WCwJlmCjKqjICnLROpjggsSF
	fyVcyf+AKc6O6hBUDXvKgA7wtFT2iGWpDGEDYD5nPeMTBnT626EYepvLjqeCPbG+G
X-Received: by 2002:a17:90b:1b50:b0:36b:a162:a1be with SMTP id 98e67ed59e1d1-3713049177fmr12383968a91.4.1780931709545;
        Mon, 08 Jun 2026 08:15:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1b50:b0:36b:a162:a1be with SMTP id 98e67ed59e1d1-3713049177fmr12383923a91.4.1780931708992;
        Mon, 08 Jun 2026 08:15:08 -0700 (PDT)
Received: from [192.168.29.82] ([49.37.135.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c675898sm16089111a91.6.2026.06.08.08.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 08:15:08 -0700 (PDT)
Message-ID: <b0195470-8869-47ab-b147-25041f04eec6@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 20:45:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
 <20260526090956.2340262-4-palash.kambar@oss.qualcomm.com>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <20260526090956.2340262-4-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uY_MkynntmDcZRlDlyEivZAgQQOKOLb1
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26dc7e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=7Z7c4tdb9MzgGfDZs5ZuEA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-F0uay8ZczthnL2HEQwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: uY_MkynntmDcZRlDlyEivZAgQQOKOLb1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE0NSBTYWx0ZWRfX1R2T2WbYsvKK
 cHG1nfinFrIBKV8BiFuXahD+g7i5uepJwLdXlB+CV9pFqLD9PrcgHWlAADtzTs6tsG0o0Mgs1Ji
 HVtUkhFKC6mPKVebBihk8IYJkfNRI7xPeOxhicsv9pB0iCInIYIsApeKCLDCwWUyd9fJ5RnEpmZ
 vsKj6AXqsNPo4pSEZc5741oWLjv2KUaPhknf7T96cZfOeKTop5r7BjJo7DNy+EJnPEelXGz4Yez
 x1RiSQcCnnSTvIuC6xoecbfqHASiKT04nmMKDSXlp4BKseSvW/fTqJUs38tf4SuQhadyKloq1z9
 loeRSy5SuKbUyB0aPGaIMuwMWcGShjY/YQu1yuNyTt87LoP8VfgUUsl69/qFKBE4DVkA8fPJTb3
 EoUIfdPLV4kl39p/Bxs+qIVOXfnreSEGokIGspq7ocmazTeCMtzzJh2UHAfv0alDh12TBG+qLyr
 LePbGVt+MXbF8EENC9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080145



On 5/26/2026 2:39 PM, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> Add the init sequence tables and config for the UFS QMP phy found in
> the Hawi SoC.
> 
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
>  .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 139 ++++++++++++++++++
>  3 files changed, 200 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
> new file mode 100644
> index 000000000000..e80d3dd6a190
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef QCOM_PHY_QMP_PCS_UFS_V7_H_
> +#define QCOM_PHY_QMP_PCS_UFS_V7_H_
> +
> +/* Only for QMP V7 PHY - UFS PCS registers */
> +#define QPHY_V7_PCS_UFS_PHY_START			0x000
> +#define QPHY_V7_PCS_UFS_POWER_DOWN_CONTROL		0x004
> +#define QPHY_V7_PCS_UFS_SW_RESET			0x008
> +#define QPHY_V7_PCS_UFS_PCS_CTRL1			0x01C
> +#define QPHY_V7_PCS_UFS_PLL_CNTL			0x028
> +#define QPHY_V7_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x02C
> +#define QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY		0x060
> +#define QPHY_V7_PCS_UFS_RX_HSGEAR_CAPABILITY		0x094
> +#define QPHY_V7_PCS_UFS_LINECFG_DISABLE			0x140
> +#define QPHY_V7_PCS_UFS_RX_SIGDET_CTRL2			0x150
> +#define QPHY_V7_PCS_UFS_READY_STATUS			0x16c
> +#define QPHY_V7_PCS_UFS_TX_MID_TERM_CTRL1		0x1b8
> +#define QPHY_V7_PCS_UFS_MULTI_LANE_CTRL1		0x1c0
> +
> +#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
> new file mode 100644
> index 000000000000..5f923c3e64ec
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef QCOM_PHY_QMP_QSERDES_TXRX_UFS_V8_H_
> +#define QCOM_PHY_QMP_QSERDES_TXRX_UFS_V8_H_
> +
> +#define QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_TX		(0x34)
> +#define QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_RX		(0x38)
> +#define QSERDES_UFS_V8_TX_LANE_MODE_1				(0x80)
> +#define QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE2			(0x1BC)
> +#define QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE4			(0x1C4)
> +#define QSERDES_UFS_V8_RX_UCDR_SO_GAIN_RATE4			(0x1DC)
> +#define QSERDES_UFS_V8_RX_EQ_OFFSET_ADAPTOR_CNTRL1		(0x2C8)
> +#define QSERDES_UFS_V8_RX_UCDR_PI_CONTROLS			(0x1E4)
> +#define QSERDES_UFS_V8_RX_OFFSET_ADAPTOR_CNTRL3			(0x2D0)
> +#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4	(0x120)
> +#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_FO_GAIN_RATE4		(0xD4)
> +#define QSERDES_UFS_V8_RX_UCDR_FASTLOCK_SO_GAIN_RATE4		(0xEC)
> +#define QSERDES_UFS_V8_RX_VGA_CAL_MAN_VAL			(0x288)
> +#define QSERDES_UFS_V8_RX_EQU_ADAPTOR_CNTRL4			(0x2B0)
> +#define QSERDES_UFS_V8_RX_MODE_RATE_0_1_B4			(0x324)
> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SA_B7			(0x3B4)
> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SA_B9			(0x3BC)
> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SB_B7			(0x3E0)
> +#define QSERDES_UFS_V8_RX_MODE_RATE4_SB_B9			(0x3E8)
> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SA_B7			(0x40C)
> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SA_B9			(0x414)
> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SB_B7			(0x438)
> +#define QSERDES_UFS_V8_RX_MODE_RATE5_SB_B9			(0x440)
> +#define QSERDES_UFS_V8_RX_UCDR_SO_SATURATION			(0xF4)
> +#define QSERDES_UFS_V8_RX_TERM_BW_CTRL0				(0x1AC)
> +#define QSERDES_UFS_V8_RX_DLL0_FTUNE_CTRL			(0x498)
> +#define QSERDES_UFS_V8_RX_SIGDET_CAL_TRIM			(0x4d0)
> +
> +#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 771bc7c2ab50..2fac3a7eb820 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -29,9 +29,11 @@
>  #include "phy-qcom-qmp-pcs-ufs-v4.h"
>  #include "phy-qcom-qmp-pcs-ufs-v5.h"
>  #include "phy-qcom-qmp-pcs-ufs-v6.h"
> +#include "phy-qcom-qmp-pcs-ufs-v7.h"
>  
>  #include "phy-qcom-qmp-qserdes-txrx-ufs-v6.h"
>  #include "phy-qcom-qmp-qserdes-txrx-ufs-v7.h"
> +#include "phy-qcom-qmp-qserdes-txrx-ufs-v8.h"
>  
>  /* QPHY_PCS_READY_STATUS bit */
>  #define PCS_READY				BIT(0)
> @@ -84,6 +86,13 @@ static const unsigned int ufsphy_v6_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_UFS_POWER_DOWN_CONTROL,
>  };
>  
> +static const unsigned int ufsphy_v7_regs_layout[QPHY_LAYOUT_SIZE] = {
> +	[QPHY_START_CTRL]		= QPHY_V7_PCS_UFS_PHY_START,
> +	[QPHY_PCS_READY_STATUS]		= QPHY_V7_PCS_UFS_READY_STATUS,
> +	[QPHY_SW_RESET]			= QPHY_V7_PCS_UFS_SW_RESET,
> +	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V7_PCS_UFS_POWER_DOWN_CONTROL,
> +};
> +
>  static const struct qmp_phy_init_tbl milos_ufsphy_serdes[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xd9),
>  	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
> @@ -1306,6 +1315,11 @@ static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
>  	{ .supply = "vdda-pll", .init_load_uA = 18300 },
>  };
>  
> +static const struct regulator_bulk_data hawi_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 324000 },
> +	{ .supply = "vdda-pll", .init_load_uA = 27000 },
> +};
> +
>  static const struct qmp_ufs_offsets qmp_ufs_offsets = {
>  	.serdes		= 0,
>  	.pcs		= 0xc00,
> @@ -1324,6 +1338,15 @@ static const struct qmp_ufs_offsets qmp_ufs_offsets_v6 = {
>  	.rx2		= 0x1a00,
>  };
>  
> +static const struct qmp_ufs_offsets qmp_ufs_offsets_v7 = {
> +	.serdes		= 0,
> +	.pcs		= 0x0400,
> +	.tx		= 0x2000,
> +	.rx		= 0x2000,
> +	.tx2		= 0x3000,
> +	.rx2		= 0x3000,
> +};
> +
>  static const struct qmp_phy_cfg milos_ufsphy_cfg = {
>  	.lanes			= 2,
>  
> @@ -1844,6 +1867,119 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
>  
>  };
>  
> +static const struct qmp_phy_init_tbl hawi_ufsphy_serdes[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SYSCLK_EN_SEL, 0xd9),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_CONFIG_1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_HSCLK_SEL_1, 0x11),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP_EN, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP_CFG, 0x60),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_IVCO, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_IVCO_MODE1, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_IETRIM, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_IPTRIM, 0x20),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE_MAP, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_VCO_TUNE_CTRL, 0x40),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_ADAPTIVE_ANALOG_CONFIG, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MODE0, 0x41),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCTRL_MODE0, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_MODE0, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_ADAPTIVE_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCCTRL_ADAPTIVE_MODE0, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_ADAPTIVE_MODE0, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP1_MODE0, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP2_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x92),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_DEC_START_MODE1, 0x4c),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_MODE1, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCTRL_MODE1, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_MODE1, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_CP_CTRL_ADAPTIVE_MODE1, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_RCCTRL_ADAPTIVE_MODE1, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_CCTRL_ADAPTIVE_MODE1, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP1_MODE1, 0x99),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_LOCK_CMP2_MODE1, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xbe),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
> +};
> +
> +static const struct qmp_phy_init_tbl hawi_ufsphy_tx[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_LANE_MODE_1, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_TX, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_TX_RES_CODE_LANE_OFFSET_RX, 0x17),
> +};
> +
> +static const struct qmp_phy_init_tbl hawi_ufsphy_rx[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE2, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FO_GAIN_RATE4, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_SO_GAIN_RATE4, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_PI_CONTROLS, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_OFFSET_ADAPTOR_CNTRL3, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x1c),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_FASTLOCK_SO_GAIN_RATE4, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_VGA_CAL_MAN_VAL, 0x8e),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_EQU_ADAPTOR_CNTRL4, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE_0_1_B4, 0xb8),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SA_B7, 0x66),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SA_B9, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SB_B7, 0x66),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE4_SB_B9, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SA_B7, 0x66),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SA_B9, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SB_B7, 0x66),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_MODE_RATE5_SB_B9, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_UCDR_SO_SATURATION, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_TERM_BW_CTRL0, 0xfa),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_DLL0_FTUNE_CTRL, 0x30),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V8_RX_SIGDET_CAL_TRIM, 0x77),
> +};
> +
> +static const struct qmp_phy_init_tbl hawi_ufsphy_pcs[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_PCS_CTRL1, 0x42),
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0f),
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_RX_SIGDET_CTRL2, 0x68),
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
> +};
> +
> +static const struct qmp_phy_init_tbl hawi_ufsphy_g5_pcs[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_PLL_CNTL, 0x3b),
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x06),
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x06),
> +};
> +
> +static const struct qmp_phy_cfg hawi_ufsphy_cfg = {
> +	.lanes			= 2,
> +
> +	.offsets		= &qmp_ufs_offsets_v7,
> +	.max_supported_gear	= UFS_HS_G5,
> +
> +	.tbls = {
> +		.serdes		= hawi_ufsphy_serdes,
> +		.serdes_num	= ARRAY_SIZE(hawi_ufsphy_serdes),
> +		.tx		= hawi_ufsphy_tx,
> +		.tx_num		= ARRAY_SIZE(hawi_ufsphy_tx),
> +		.rx		= hawi_ufsphy_rx,
> +		.rx_num		= ARRAY_SIZE(hawi_ufsphy_rx),
> +		.pcs		= hawi_ufsphy_pcs,
> +		.pcs_num	= ARRAY_SIZE(hawi_ufsphy_pcs),
> +	},
> +
> +	.tbls_hs_overlay[0] = {
> +		.pcs		= hawi_ufsphy_g5_pcs,
> +		.pcs_num	= ARRAY_SIZE(hawi_ufsphy_g5_pcs),
> +		.max_gear	= UFS_HS_G5,
> +	},
> +
> +	.vreg_list		= hawi_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(hawi_ufsphy_vreg_l),
> +	.regs			= ufsphy_v7_regs_layout,
> +};
> +
>  static void qmp_ufs_serdes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls *tbls)
>  {
>  	void __iomem *serdes = qmp->serdes;
> @@ -2258,6 +2394,9 @@ static int qmp_ufs_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id qmp_ufs_of_match_table[] = {
>  	{
> +		.compatible = "qcom,hawi-qmp-ufs-phy",
> +		.data = &hawi_ufsphy_cfg,
> +	}, {
>  		.compatible = "qcom,milos-qmp-ufs-phy",
>  		.data = &milos_ufsphy_cfg,
>  	}, {

Hi Dmitry, 
I have addressed your previous review comments, please let me know if there are any other comments from your side.

Thanks.
 

