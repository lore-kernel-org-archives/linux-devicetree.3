Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A20543C047
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022752; cv=none; b=GBR2GUiQvHFVWGne/cWQZjQYLxb4QpzmclwBsXWLdIJ0kqdZMEl24aQ0FwK5BAwW2XUpT+cTL6kCntg5YLqNv+gdx7gFyfQpNFB7gduNhVo2czFpIY91NhUQ9SsQl9pKqyq5jOo8g6eckvc0YuABYG7LGxSf8ixrLOGTc1C9MoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022752; c=relaxed/simple;
	bh=Ejb4wgGXEz+RPjycKOoewScZ1sluhQaUjxE0lbIh2CY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PV1Ky7Q1vn7tgzZy9Zm017X/d3UxHW8X5JQ/xIVdcOL0dd4GSJmXgRXctY4o7Il4qBvzzWqsdNkjy16wEL9SWXGxfah8ayeWC4PLsFqPuknxfABOOmolI/G4HZfJPuvMSHQNck3q6XrERdGGjluYIpuP046BUCYufC1JS9T9G4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/OfcXrB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TmFv8QqR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/OfcXrB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TmFv8QqR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAp5L884993
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2KbbIVO6Xogqcv84ceDGyBz5vrvOh+Tl8EUzE/JW9w=; b=a/OfcXrBAU3hhCJB
	FE8Hd6RAbygLY9Jewl25NX/xipfqSD20rznbBeHVRSOI7z1f8MQSYeR9dgcsPp+0
	0tG2Ho8fEIV2vj4POBKUQKOMiqNqCsBt6CtHqQfGzrpRHVAIOLam2AyiqQnYzRk0
	AoTGrKKwtsop2NaGCElVs28omw9aDLf3dg2OaAM9S4op2exqbz47HuK76M2a77SL
	85hwEbNdpx3IfCOxJhIkKmZhTlgYsIfS1AXsNcyMAQRH63Ihsn5WOwRmuPKStxbo
	yjSlqjLb6velVgLDa45bbGEYdp8/I+wd4UsObJ4Qmf87twIlSFdzMeZCTdxEIZT4
	qxU5Dg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj33fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:32:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc51591102fso4882894a12.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 13:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022748; x=1790627548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M2KbbIVO6Xogqcv84ceDGyBz5vrvOh+Tl8EUzE/JW9w=;
        b=TmFv8QqRyW027wFwuEftMR/3msm9iHcPcgRNbV0yJdOI/zCObGklBNF0e0pXqsiuuW
         DenadmRvPzJNhttLJVQci5InH8Lbp8PpqAWjQtCuCOWtKlf9HrotrGulPgJpc+FzNrQ0
         Jr0JZj6ErpEiSOc6hij1/iPp7jF2Yqh/SsLYpSZmXu0gMltszOGwc3gVjtozOi9NI6XH
         iOw5e7qZLkJ/jY4DLLPlkSQQ0WMXCkBWQH2fsmm8m+scuKPytkCo+BvFW8NBWvKRVykW
         5GU3FJOACnmPOPfUaOw5SHpKIqAgAD1uYIWYVSvze9i/JldoH8SGB+17K+id6gZv8/cU
         IVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022748; x=1790627548;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2KbbIVO6Xogqcv84ceDGyBz5vrvOh+Tl8EUzE/JW9w=;
        b=efLvQrN/pNNq4CkIqrPRa3Ipj6Ls8f7zfUDIjSyXVHSIVZYBVDAJUQgO+ZR3uRZNIP
         OXaxRzwHFJJJaulUYLMFptyZARPAiwGfsSZNtpdIClXAQb+R/xMNt8l1++w5Z9N4mjMo
         y3kDI5EqsHhI8eX+EFIHgnf0E1IcaAwZwUtrW+bF9s67ODu51+PW6SDNnqnpjZLcMm78
         +Qg120oMbOuwpFq1HwURgSXWbjBufORGD3+G2O0PlCZxAjiPeW8aX9qQzQUZDWn3doJf
         KngREveWkyLn5qkR54KPdJxaNCbWK1iII4oUVVzQhKMQCKSu/Fne0hx2+T2tn4OUnbdR
         aoUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvY+4DA2fZf4E5Ei2fLsfp9GaCIUMYrwGjzPCcpBN7bMhvxFQ/QvXA79yVUPEpw7d2m3DL9OLWOcq4@vger.kernel.org
X-Gm-Message-State: AFuF++k9mM4uuGbuz6HtrvRi9U98dvGjGGUh6cSiLciFY7LZrX35/PiK
	hac11G/E3kfW1O9HVuxjzfQy4xQydxrnXXkcT4Hwofj0fgT3glQQdoAlPc3BT4L/Zyb+psFxv+n
	71ESRg1b3daTb850zQEK6fy4g4Lr7G4tJKxkppmKVPEyYAPv9E1i4CHxE/VidxXUm
X-Gm-Gg: AYBFou0KcIJ7NuFhdBxuRsJ3BilId6Wro9Je1RsMlXC8OzaK1B5jvqG0x1MHhXTjwIn
	xTnKdGLBCMAkXcA5qZMipRfFXB3+VfEV3h19yN0VuYodT9jW0UQEH3WKD69zV5nCSk6VJWzdetf
	48N9F+BPSRyCuhDB6k8+pi1nZC67ttrzzeQJs8G9Xk1D46RW+BqIdgLcDr7R4l1OuAFEMBIZrfT
	pdYrRpIIgWJEIIieI8aeA1iuUXmpNXJuhMiP/ykF9WtNe2ksJQt5R99+X6T7SHutDBvbssnQBtP
	dMMCbFSqMPlg5gxFV1Xm7wvBcDS7qNZqfpe65UyMppUdGKGmtrIi8u2aEhbURHKVqTAw0oXenpE
	zWNUicN9roPSOmAP04MTggm1U7N6zekDzZQ==
X-Received: by 2002:a05:6a20:7f81:b0:3da:e7dd:45d5 with SMTP id adf61e73a8af0-3dde3e3ff50mr143548637.20.1790022747916;
        Mon, 21 Sep 2026 13:32:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f81:b0:3da:e7dd:45d5 with SMTP id adf61e73a8af0-3dde3e3ff50mr143515637.20.1790022747227;
        Mon, 21 Sep 2026 13:32:27 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ebc658esm465806eec.12.2026.09.21.13.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:32:26 -0700 (PDT)
Message-ID: <c54106ce-91ba-4284-ad67-6939c2595056@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 02:02:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/3] i3c: master: Add Qualcomm I3C controller driver
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, alexandre.belloni@bootlin.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Frank.Li@nxp.com,
        wsa+renesas@sang-engineering.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
 <050100ed-724b-4b23-ba96-2ac4f0da08e0@oracle.com>
Content-Language: en-US
In-Reply-To: <050100ed-724b-4b23-ba96-2ac4f0da08e0@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMwMCBTYWx0ZWRfX+UbD8R+m281S
 hgm9i4qwBET/SdXgBcy3GIfJqDT658HERwZSqtMVLXSGVaigVQx4V8Ebic1cPmb1H3dVfd/FIC2
 rUmR41S3lUoQ1sMXXNPqE89/Zq0WYEQ=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab1945d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fXiU_6376HtLeTDUhFQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: QBBKyaUbYgf5KOj-doeGnVsv6Sd4XShm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMwMCBTYWx0ZWRfX8bDOBAC+NwT7
 i5MQjX/odiUELGjNsrwYElQnsfahI+SEn0pz4te9NN0czrWjM4NwpW99vMUm2uB/xdJUcR8pV6O
 ZO7JWnNMJ39S7LvSHzmfOwEXbh4Me+xgBTJjPZD/U1teQKQk9WHGWpARwDAdb6diuVDmsKaLiGv
 MIhggltz7HhdCpROtEdvClCtCUH/y8fPLWyyH+mUrW92oZbPvHNYj3lpxTsp0ifbTsHgZkM13y7
 TaxChUqjXna7PtKTt2OFVa1/mYmcOF4LiJo0Ud00TRtIN+iZlBEHF+fA+PVrXGFe4a+zGNjEtwo
 49YfGDGb9dAvWTMkLFDxtnxQisLCJ4JTnhr2ETrGZXOMk758yOsFbmCIzlX0K6yBDflINqqgjxB
 xwcL8AgnjYmMokRbvEHqVwEYl/M7uf9l1qah0W32/zIT8kAc+cAn6arIMEIIUoKZdSOkBegyqpT
 oncaXD88ZVjpjP73cIQ==
X-Proofpoint-ORIG-GUID: QBBKyaUbYgf5KOj-doeGnVsv6Sd4XShm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210300

Thanks Alok for reviewing the patch !

Apologies for the delayed response. I was waiting to verify the changes 
and ensure all the suggested updates were properly incorporated. The 
effort was further delayed due to some slave-side setup issues.

I have now addressed and validated all the suggested changes except one, 
which I have responded to separately below. I shall upload V7 soon.

On 7/1/2025 2:18 PM, ALOK TIWARI wrote:
> 
> 
> On 7/1/2025 12:48 PM, Mukesh Kumar Savaliya wrote:
>> Add support for the Qualcomm I3C controller driver, which implements
>> I3C master functionality as defined in the MIPI Alliance Specification
>> for I3C, Version 1.0.
>>
>> This driver supports master role in SDR mode.
>>
>> Unlike some other I3C master controllers, this implementation
>> does not support In-Band Interrupts (IBI) and Hot-join requests.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> ---
>>   drivers/i3c/master/Kconfig         |   12 +
>>   drivers/i3c/master/Makefile        |    1 +
>>   drivers/i3c/master/i3c-qcom-geni.c | 1158 ++++++++++++++++++++++++++++
>>   3 files changed, 1171 insertions(+)
>>   create mode 100644 drivers/i3c/master/i3c-qcom-geni.c
>>
>> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
>> index 7b30db3253af..3e062d4b8f85 100644
>> --- a/drivers/i3c/master/Kconfig
>> +++ b/drivers/i3c/master/Kconfig
>> @@ -41,6 +41,18 @@ config SVC_I3C_MASTER
>>       help
>>         Support for Silvaco I3C Dual-Role Master Controller.
>> +config I3C_QCOM_GENI
>> +    tristate "Qualcomm Technologies Inc.'s I3C controller driver"
>> +    depends on QCOM_GENI_SE
>> +    help
>> +      This driver supports QUPV3 GENI based I3C controller in master
>> +      mode on the Qualcomm Technologies Inc.s SoCs. If you say yes to
>> +      this option, support will be included for the built-in I3C 
>> interface
>> +      on the Qualcomm Technologies Inc.s SoCs.
> 
> is this .s have any meaning
> 
It's supposed to be "Inc.'s", have corrected. Thanks !
>> +
>> +      This driver can also be built as a module.  If so, the module
>> +      will be called i3c-qcom-geni.
>> +
>>   config MIPI_I3C_HCI
>>       tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
>>       depends on HAS_IOMEM
>> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
>> index 3e97960160bc..0e3ad9d96424 100644
>> --- a/drivers/i3c/master/Makefile
>> +++ b/drivers/i3c/master/Makefile
>> @@ -1,5 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   obj-$(CONFIG_CDNS_I3C_MASTER)        += i3c-master-cdns.o
>> +obj-$(CONFIG_I3C_QCOM_GENI)        += i3c-qcom-geni.o
>>   obj-$(CONFIG_DW_I3C_MASTER)        += dw-i3c-master.o
>>   obj-$(CONFIG_AST2600_I3C_MASTER)    += ast2600-i3c-master.o
>>   obj-$(CONFIG_SVC_I3C_MASTER)        += svc-i3c-master.o
>> diff --git a/drivers/i3c/master/i3c-qcom-geni.c b/drivers/i3c/master/ 
>> i3c-qcom-geni.c
>> new file mode 100644
>> index 000000000000..c8bb40cdaaf4
>> --- /dev/null
>> +++ b/drivers/i3c/master/i3c-qcom-geni.c
>> @@ -0,0 +1,1158 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + *
>> + * Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/clk.h>
>> +#include <linux/err.h>
>> +#include <linux/i3c/master.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/slab.h>
>> +#include <linux/soc/qcom/geni-se.h>
>> +#include <linux/units.h>
>> +
>> +#define SE_I3C_SCL_HIGH                 0x268
>> +#define SE_I3C_TX_TRANS_LEN             0x26c
>> +#define SE_I3C_RX_TRANS_LEN             0x270
>> +#define SE_I3C_DELAY_COUNTER            0x274
>> +#define SE_I2C_SCL_COUNTERS             0x278
>> +#define SE_I3C_SCL_CYCLE                0x27c
>> +#define SE_GENI_HW_IRQ_EN               0x920
>> +#define SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE 0x924
>> +#define SE_GENI_HW_IRQ_CMD_PARAM_0      0x930
>> +
>> +/* HW I3C IBI interrupt enable */
>> +#define M_IBI_IRQ_EN            BIT(0)
>> +
>> +/* M_IBI_IRQ_IGNORE */
>> +#define M_IBI_IRQ_IGNORE        BIT(0)
>> +
>> +/* SE_GENI_M_CLK_CFG field shifts */
>> +#define    CLK_DIV_VALUE_MASK        GENMASK(23, 4)
>> +#define SER_CLK_EN            BIT(0)
>> +
>> +/* SE_GENI_HW_IRQ_CMD_PARAM_0 field bits */
>> +#define M_IBI_IRQ_PARAM_7E        BIT(0)
>> +#define M_IBI_IRQ_PARAM_STOP_STALL    BIT(1)
>> +
>> +/* SE_I2C_SCL_COUNTERS field shifts */
>> +#define I2C_SCL_HIGH_COUNTER_MASK    GENMASK(29, 20)
>> +#define I2C_SCL_LOW_COUNTER_MASK    GENMASK(19, 10)
>> +#define I2C_SCL_CYCLE_COUNTER_MASK    GENMASK(9, 0)
>> +
>> +#define SE_I3C_ERR  (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | 
>> M_CMD_FAILURE_EN |\
>> +    M_CMD_ABORT_EN | M_GP_IRQ_0_EN | M_GP_IRQ_1_EN | M_GP_IRQ_2_EN | \
>> +    M_GP_IRQ_3_EN | M_GP_IRQ_4_EN)
>> +
>> +/* M_CMD OP codes for I2C/I3C */
>> +#define I3C_READ_IBI_HW          0
>> +#define I2C_WRITE                1
>> +#define I2C_READ                 2
>> +#define I2C_WRITE_READ           3
>> +#define I2C_ADDR_ONLY            4
>> +#define I3C_INBAND_RESET         5
>> +#define I2C_BUS_CLEAR            6
>> +#define I2C_STOP_ON_BUS          7
>> +#define I3C_HDR_DDR_EXIT         8
>> +#define I3C_PRIVATE_WRITE        9
>> +#define I3C_PRIVATE_READ         10
>> +#define I3C_HDR_DDR_WRITE        11
>> +#define I3C_HDR_DDR_READ         12
>> +#define I3C_DIRECT_CCC_ADDR_ONLY 13
>> +#define I3C_BCAST_CCC_ADDR_ONLY  14
>> +#define I3C_READ_IBI             15
>> +#define I3C_BCAST_CCC_WRITE      16
>> +#define I3C_DIRECT_CCC_WRITE     17
>> +#define I3C_DIRECT_CCC_READ      18
>> +
>> +/* M_CMD params for I3C */
>> +#define PRE_CMD_DELAY        BIT(0)
>> +#define TIMESTAMP_BEFORE    BIT(1)
>> +#define STOP_STRETCH        BIT(2)
>> +#define TIMESTAMP_AFTER        BIT(3)
>> +#define POST_COMMAND_DELAY    BIT(4)
>> +#define IGNORE_ADD_NACK        BIT(6)
>> +#define READ_FINISHED_WITH_ACK    BIT(7)
>> +#define CONTINUOUS_MODE_DAA    BIT(8)
>> +
>> +#define SLAVE_ADDR_MASK        GENMASK(15, 9)
>> +
>> +#define CCC_HDR_CMD_MSK        GENMASK(23, 16)
>> +#define IBI_NACK_TBL_CTRL    BIT(24)
>> +#define USE_7E            BIT(25)
>> +#define BYPASS_ADDR_PHASE    BIT(26)
>> +
>> +/* GSI callback error fields - DMA_TX_IRQ_STAT */
>> +#define GP_IRQ0            BIT(5)
>> +#define GP_IRQ1            BIT(6)
>> +#define GP_IRQ2            BIT(7)
>> +#define GP_IRQ3            BIT(8)
>> +#define GP_IRQ4            BIT(9)
>> +#define GP_IRQ5            BIT(10)
>> +#define DM_I3C_CB_ERR        GENMASK(10, 5)
>> +
>> +#define I3C_AUTO_SUSPEND_DELAY    250
>> +#define PACKING_BYTES_PER_WORD    4
>> +#define XFER_TIMEOUT        250
>> +#define DFS_INDEX_MAX        7
>> +
>> +#define I3C_ADDR_MASK        I2C_MAX_ADDR
>> +
> [clip]
>> +
>> +static int geni_i3c_master_i2c_xfers(struct i2c_dev_desc *dev, struct 
>> i2c_msg *msgs, int num)
>> +{
>> +    struct i3c_master_controller *m = i2c_dev_get_master(dev);
>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>> +    int i, ret;
>> +
>> +    ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>> +    if (ret)
>> +        return ret;
>> +
>> +    qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
>> +
>> +    for (i = 0; i < num; i++) {
>> +        struct geni_i3c_xfer_params xfer;
>> +
>> +        xfer.m_cmd    = (msgs[i].flags & I2C_M_RD) ? I2C_READ : 
>> I2C_WRITE;
>> +        xfer.m_param  = (i < (num - 1)) ? STOP_STRETCH : 0;
>> +        xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, msgs[i].addr);
>> +        xfer.mode     = msgs[i].len > 32 ? GENI_SE_DMA : GENI_SE_FIFO;
> 
> is this 32 assumptions ,can tx_depth decide this?
> 
It's half of the FIFO size and it's exactly tx_depth. so yes,
we can decide from tx_depth.
Have stored it and kept half of the tx_depth as deciding value.

>> +        if (msgs[i].flags & I2C_M_RD)
>> +            ret = i3c_geni_execute_read_command(gi3c, &xfer, 
>> msgs[i].buf, msgs[i].len);
>> +        else
>> +            ret = i3c_geni_execute_write_command(gi3c, &xfer, 
>> msgs[i].buf, msgs[i].len);
>> +        if (ret)
>> +            break;
>> +    }
>> +
>> +    dev_dbg(gi3c->se.dev, "i2c: txn ret:%d\n", ret);
>> +    i3c_geni_runtime_put_mutex_unlock(gi3c);
>> +
>> +    return ret;
>> +}
>> +
> [clip]
>> +static int geni_i3c_master_bus_init(struct i3c_master_controller *m)
>> +{
>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>> +    struct i3c_bus *bus = i3c_master_get_bus(m);
>> +    struct i3c_device_info info = { };
>> +    int ret;
>> +
>> +    /* Get an address for the master. */
>> +    ret = i3c_master_get_free_addr(m, 0);
>> +    if (ret < 0)
>> +        dev_err(gi3c->se.dev, "%s: error No free addr:%d\n", 
>> __func__, ret);
>> +
>> +    info.dyn_addr = ret;
>> +    info.dcr = I3C_DCR_GENERIC_DEVICE;
>> +    info.bcr = I3C_BCR_I3C_MASTER | I3C_BCR_HDR_CAP;
>> +    info.pid = 0;
>> +
>> +    ret = geni_i3c_clk_map_idx(gi3c);
>> +    if (ret) {
>> +        dev_err(gi3c->se.dev,
>> +            "Invalid clk frequency %d Hz src for %ld Hz bus: %d\n",
>> +            gi3c->clk_src_freq, bus->scl_rate.i3c, ret);
>> +        return ret; //This was missed in upstream : TBD
> 
> why this TBD
> 
Sorry, kept with comment to not miss to add in the final patch upload, 
but missed to remove this comment, i shall remove this for the next 
patch.>> +    }
>> +
>> +    ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>> +    if (ret)
>> +        return ret;
>> +
>> +    qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
>> +
>> +    ret = i3c_master_set_info(&gi3c->ctrlr, &info);
>> +    i3c_geni_runtime_put_mutex_unlock(gi3c);
>> +
>> +    return ret;
>> +}
> 
> Thanks,
> Alok

