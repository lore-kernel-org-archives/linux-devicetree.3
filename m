Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792753588;
	b=jobDjKJlM3F4fnQ2SAQvJq15zWRb7Wnnr7Vt2xMCi0VmbIPSGcd1UHYO2QFUCe6TK8WX
	 rh3YRDr1FtJk3B3nMWM7ahzOz74pMVyv9p/xqTPYVyIxPSZDKSMUxfvDsaqtZKCDWXf+u
	 oar+4Krikxj3GZ4ubJ2EpyG0idHgVFsHPPD31eX7C+uRZhVRpOq/SWvhsUJKa6su/8uPT
	 p+TX8ic4ts6wbAj6/jlNxo8L3kR0iraRrAO1F7FaSlhsYdxIjxW0Zc7DVUdS8rUqLr3++
	 dWyXNc+kE4LkIcexrGP0ie36oEkf+jGTPGyDPVla6UXY7/aURNsBwy3WCvjLpSd2QOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792753588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=94KUf73knvkRCbtnNXTEaPx18IfDH7sxhTJZxwp/k1g=;
	b=N62p9rQNkrlP3FJDhh/ePuYgElZoNoCIQGAmi1ZR9mhZ/7grkrJmWH9Xwb6qo9Fb3oIE
	 Ouhak1zftCZand6wQdDSbwBC6+Zyu55vjqs+Id+mjcHMseivI8aU5kX3qQWyWucAkzDKS
	 2UWP7Z2mqODrYSBstFQX/dBx/ojxjyViDdLUX7zPjWw3vYhX9KNuKlQWEU/Jpq8ULomij
	 ShLhe79GGBBC4jEteB1f/B7cD9gKGNCeMmU5vS4igyQe06fHkvcJVh6B/9IySXJ6X98sz
	 oRbLrfW8O9Q1D4VTOmxqkVl363U77aocDaNvF0pkIXYPBTpscl6V0ewG7egR2tGM6hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WeLOOn5G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlcfEY5i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB69606A32E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 11:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB69606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WeLOOn5G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlcfEY5i
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZcE3045393
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 11:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94KUf73knvkRCbtnNXTEaPx18IfDH7sxhTJZxwp/k1g=; b=WeLOOn5GHHdy28pJ
	5ED9l3bG9FJ1xyYKh5wYhYq08bJWUNS3zADofouXVRh8ZOYu2bctvY/MQ4c/DrS4
	WZ8gZVBiPhTutDL9rpD/hpHv79TDBCSNHFbLyKwXOpIGiW/ZMWtojpbdQL6MZ+HQ
	zoAPyJwomPcBjjqkK4M0GR3VhvEVJa37GUJLhQ3ScaU6I6mx7UdOebG1pwWT2za5
	m8bJvN41qeLdrsgJeOsMLeOOceB5hoQ6j+9N0LlwM7qaLsRXLhbxnAcpJQit0Fja
	IaQxgQzWbfKPiAUmW8nxCTkMnO2DRZaz4MbqPGslv+ag4ei/TWyStNmH2qcbzt06
	jBU+Hw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjbdut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 11:06:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e60770381cso7652225ad.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 04:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792753585; x=1793358385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94KUf73knvkRCbtnNXTEaPx18IfDH7sxhTJZxwp/k1g=;
        b=jlcfEY5iC31K/U0SKyAEV1s5oXL+b0/yCnRZDNlew0tG10HyVaunZ87UCjnardOCSU
         myHAdYqtAXjpOlL8nIDrgDGySsyShEqYCykrffUZHUvwHog02RoJaB1QwF2iI0F+dkbm
         WnYPuk1y9C2rzNKU02zwvBSkNB9McbeVr5yaxJ5Y27b28tV3XEVrWOal4e8EHMkxizu8
         rNrmOEad1MZ1Uqko1jzKjscs8/m54LE1V1c3d4IrDL2k0TV/cyGkO8wR9BzYRmUIKric
         GLoJDMAINhxDz1nCh+uPQSnt0jEDD+70FyxFD2lZZYJbe+v96ELcXDiZORcg5AvVUhKi
         tVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792753585; x=1793358385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94KUf73knvkRCbtnNXTEaPx18IfDH7sxhTJZxwp/k1g=;
        b=qeNFq3nFlJmWdniVhbYrQhNKuc54LnwMVqmT3hZUXvn9XcxuGqtHC8/4XWH5Nn4gGv
         9tXYMLd4kOb9r9+4xsz5kt1rr7uY0DE6DvQroQshbUY1LLZ4HYfudR2JRV3Za8duHVcE
         e83yWEIRzVqjqBtw4HPeILz3dn+SauJowlTL74b9s1AwLlRJS/oidlWb41DsddQgQ3lo
         zmXBI5Uv9wx2ugU3bvS+tabX5jiXd90vGKE9kL+c120S0ppnPKh8+3A6TGX4ZnOAtoPs
         sqtg792ZmVKoYYeJTeIy5SgPvKFEDOoU588FGqmWIe/a94K/BCBBa/iipICXcSHbYuLS
         ycYA==
X-Forwarded-Encrypted: i=1; AKwUvBw406qW0o1+eB1Ll/5XSr5sLv1Lx0Gv4hg8jDowfSxdqjBuojcUMFhxVi3Ee8Ml4PJ3CyctpLKGUQlX@vger.kernel.org
X-Gm-Message-State: AFq9FYLOOGEB+F164nt574f2npzpzIvein1+3Xxri2B4XLhI44sQrwBf
	9r2C1K/loOGAOrBio66Chzqsi3kwTKchZY3JfkVuNXxdCQD3DzaRXZ7zPCHYH6YJcPVPgmdX1WP
	gWVyydPlOkGjw4lAJDMQWJbl+KwrcDCt27TSGeyPPsNGTDTTZ5Hs3IRoT/cpzqQmu
X-Gm-Gg: AYBFou2MPn74Pi2bvL3YGB4ZeVxx7u4yxFPyfSCSL02p4yFgAETHpihRg8TjnENCoWE
	7jTeRHcljEbthwzZVV2lhLgglW+7izvGTUDbzcqLfd4MpFbU25Hf7Im80WTxqF6or14j9WmB6wd
	PnsHs8rmX1XVb+9fuZFh+TKGn1a0y+Z1gI8XuLprkllU8bAOOg3KtCLYCT1BM7quhQL6EyZw3mr
	7RWZ8yZI0y3n5GOmoTIo6W8cBb+eNSsGV8YvURMGQPz3A1nbx3cuUTW3ICzMLT6CcXRmO3veYTX
	x2XparFDlmwvRXW0X1Pok4/PuEdhX3WENuwhvqy/bUfChxLAe6mGlrCFyD2aFtqei/YzCZieqd1
	LmNcCFXLtpIihqzqhR5kuNRKAgOteMvsKlHll8Wdn4hF1H9AWmhc4pyIiO4O1
X-Received: by 2002:a17:903:120f:b0:2e9:8e0a:cc4d with SMTP id d9443c01a7336-2ea7c181d40mr20451845ad.41.1792753585021;
        Fri, 23 Oct 2026 04:06:25 -0700 (PDT)
X-Received: by 2002:a17:903:120f:b0:2e9:8e0a:cc4d with SMTP id d9443c01a7336-2ea7c181d40mr20451405ad.41.1792753584385;
        Fri, 23 Oct 2026 04:06:24 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3b5744sm8729635ad.42.2026.10.23.04.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 04:06:23 -0700 (PDT)
Message-ID: <6adc7028-241c-47f0-9063-f8f3d0c1059a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 19:06:17 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 08/14] media: qcom: camss: csid: Add support for CSID
 1080
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-8-04fd28d815c6@oss.qualcomm.com>
 <b920a52f-2a81-45ac-b025-f2df8f98aa79@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <b920a52f-2a81-45ac-b025-f2df8f98aa79@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mcjiQsHEzWaquosTgv9FJu_05Je4s4cv
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb3fb2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8H2rM04zqQRs751kQuIA:9
 a=4Q4zU7iZy6iiv8wZ:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MyBTYWx0ZWRfX0lGgoxtVN7Ht
 lb/7epFdiXcsoxzJYzPOYSbRU3SXstbzj1fLLQ4USoNFpUz241xSiI9bJq6QRds2mk8zNFGNr30
 Q8r33gT+uQ23FnUvHE/O2x+5W6UXeTg=
X-Proofpoint-ORIG-GUID: mcjiQsHEzWaquosTgv9FJu_05Je4s4cv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MyBTYWx0ZWRfX1ckdAFdrSzb0
 QHxTaYTIfxacSBALvlmbQM3rrKtKXWRghP459bWmp9MrfdJDPcYusM1Ww/We4Pqjk343UIFXSHM
 4/SPLvd895Omw0wPPbv/1GmbjPJBhFn7iPmks/gJkEi2ayq12OiXOTYJJm8lLYatKHEaG18B8ko
 0oh1jXNU9HFfjEhErZ9mU6BzPyjH16NiKRrZYfmKytLP/o/h1/MLRaHTNmFX68tXTlw9kDGBfw6
 yOBBce3ZGKmJJvXes4+y7CkLYSGfZz+O2GuyJQKzrIpWd1eOErPISwm2Z8A7tyVwJeU2Sc+hHGR
 mJuRUnrLW6sO1sa5NNCs8l6K4JLnimcsKLns1pFak/nJQNtR60VwiaO41krxVwS0VH22SHhTts0
 xTEZMfDR3j7S/zwUpn7iWyakJbwNH/0Vlb1qSp/4Izu3NvvzYBDBWK4z7jiF3fvg17Jv7000SNr
 rvQbuQDxHuR03CAU9kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230043

On 10/23/2026 7:00 PM, Bryan O'Donoghue wrote:
> On 12/10/2026 07:45, Hangxiang Ma wrote:
>> Add support for the CSID 1080 hardware found on Kaanapali SoC.
>>
>> Introduce CSID 1080 hardware resource descriptions and implement the
>> hardware-specific register programming, reset sequence, and BUF_DONE
>> interrupt handling.
>>
>> CSID 1080 splits RUP and AUP updates into separate registers and uses a
>> SET register to commit the updates. Update the CSID interface to support
>> both this scheme and the legacy combined reg_update mechanism.
>>
>> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
>> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>>   .../media/platform/qcom/camss/camss-csid-1080.c    | 384 +++++++++++ 
>> ++++++++++
>>   drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
>>   drivers/media/platform/qcom/camss/camss.c          |  75 ++++
>>   4 files changed, 468 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/ 
>> media/platform/qcom/camss/Makefile
>> index 27898b3cc7d3..218ba3a95939 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -8,6 +8,7 @@ qcom-camss-objs += \
>>           camss-csid-4-7.o \
>>           camss-csid-340.o \
>>           camss-csid-680.o \
>> +        camss-csid-1080.o \
>>           camss-csid-gen2.o \
>>           camss-csid-gen3.o \
>>           camss-csiphy.o \
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/ 
>> drivers/media/platform/qcom/camss/camss-csid-1080.c
>> new file mode 100644
>> index 000000000000..46e443e05195
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
>> @@ -0,0 +1,384 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * camss-csid-1080.c
>> + *
>> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#include <linux/completion.h>
>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/of.h>
>> +
>> +#include "camss.h"
>> +#include "camss-csid.h"
>> +#include "camss-csid-gen3.h"
>> +
>> +/* Reset and Command Registers */
>> +#define CSID_RST_CFG                0x108
>> +#define        RST_MODE                BIT(0)
>> +#define        RST_LOCATION                BIT(4)
>> +
>> +/* Reset and Command Registers */
>> +#define CSID_RST_CMD                0x10C
>> +#define        SELECT_HW_RST                BIT(0)
>> +#define        SELECT_IRQ_RST                BIT(2)
>> +#define CSID_IRQ_CMD                0x110
>> +#define        IRQ_CMD_CLEAR                BIT(0)
>> +
>> +/* Register Update Commands, RUP/AUP */
>> +#define CSID_RUP_CMD                0x114
>> +#define CSID_AUP_CMD                0x118
>> +#define        CSID_RUP_AUP_RDI(rdi)            (BIT(8) << (rdi))
>> +#define CSID_RUP_AUP_CMD            0x11C
>> +#define        RUP_SET                    BIT(0)
>> +#define        MUP                    BIT(4)
>> +
>> +/* Top level interrupt registers */
>> +#define CSID_TOP_IRQ_STATUS            0x180
>> +#define CSID_TOP_IRQ_MASK            0x184
>> +#define CSID_TOP_IRQ_CLEAR            0x188
>> +#define        INFO_RST_DONE                BIT(0)
>> +#define        CSI2_RX_IRQ_STATUS            BIT(2)
>> +#define        BUF_DONE_IRQ_STATUS            BIT(3)
>> +
>> +/* Buffer done interrupt registers */
>> +#define CSID_BUF_DONE_IRQ_STATUS        0x1A0
>> +#define        BUF_DONE_IRQ_STATUS_RDI_OFFSET        16
>> +#define CSID_BUF_DONE_IRQ_MASK            0x1A4
>> +#define CSID_BUF_DONE_IRQ_CLEAR            0x1A8
>> +#define CSID_BUF_DONE_IRQ_SET            0x1AC
>> +
>> +/* CSI2 RX interrupt registers */
>> +#define CSID_CSI2_RX_IRQ_STATUS            0x1B0
>> +#define CSID_CSI2_RX_IRQ_MASK            0x1B4
>> +#define CSID_CSI2_RX_IRQ_CLEAR            0x1B8
>> +#define CSID_CSI2_RX_IRQ_SET            0x1BC
>> +
>> +/* CSI2 RX Configuration */
>> +#define CSID_CSI2_RX_CFG0            0x880
>> +#define        CSI2_RX_CFG0_NUM_ACTIVE_LANES        0
>> +#define        CSI2_RX_CFG0_DL0_INPUT_SEL        4
>> +#define        CSI2_RX_CFG0_PHY_NUM_SEL        20
>> +#define        CSI2_RX_CFG0_PHY_SEL_BASE_IDX        1
>> +#define CSID_CSI2_RX_CFG1            0x884
>> +#define        CSI2_RX_CFG1_ECC_CORRECTION_EN        BIT(0)
>> +#define        CSI2_RX_CFG1_VC_MODE            BIT(2)
>> +
>> +#define MSM_CSID_MAX_SRC_STREAMS_1080        (csid_is_lite(csid) ? 
>> 4 : 5)
>> +
>> +/* RDI Configuration */
>> +#define CSID_RDI_CFG0(rdi)    (csid_is_lite(csid) ?\
>> +                    (0x3080 + 0x200 * (rdi)) :\
>> +                    (0x5480 + 0x200 * (rdi)))
>> +#define        RDI_CFG0_RETIME_BS            BIT(5)
>> +#define        RDI_CFG0_TIMESTAMP_EN            BIT(6)
>> +#define        RDI_CFG0_TIMESTAMP_STB_SEL        BIT(8)
>> +#define        RDI_CFG0_DECODE_FORMAT            12
>> +#define        RDI_CFG0_DT                16
>> +#define        RDI_CFG0_VC                22
>> +#define        RDI_CFG0_EN                BIT(31)
>> +
>> +/* RDI Control and Configuration */
>> +#define CSID_RDI_CTRL(rdi)    (csid_is_lite(csid) ?\
>> +                    (0x3088 + 0x200 * (rdi)) :\
>> +                    (0x5488 + 0x200 * (rdi)))
>> +#define        RDI_CTRL_START_CMD            BIT(0)
>> +
>> +#define CSID_RDI_CFG1(rdi)    (csid_is_lite(csid) ?\
>> +                    (0x3094 + 0x200 * (rdi)) :\
>> +                    (0x5494 + 0x200 * (rdi)))
>> +#define        RDI_CFG1_DROP_H_EN            BIT(5)
>> +#define        RDI_CFG1_DROP_V_EN            BIT(6)
>> +#define        RDI_CFG1_CROP_H_EN            BIT(7)
>> +#define        RDI_CFG1_CROP_V_EN            BIT(8)
>> +#define        RDI_CFG1_PACKING_FORMAT_MIPI        BIT(15)
>> +
>> +/* RDI Pixel Store Configuration */
>> +#define CSID_RDI_PIX_STORE_CFG0(rdi)    (0x5498 + 0x200 * (rdi))
>> +#define        RDI_PIX_STORE_CFG0_EN            BIT(0)
>> +#define        RDI_PIX_STORE_CFG0_MIN_HBI        1
>> +
>> +/* RDI IRQ Status in wrapper */
>> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)    (0x224 + (0x10 * (rdi)))
>> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)    (0x228 + (0x10 * (rdi)))
>> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)    (0x22C + (0x10 * (rdi)))
>> +#define        INFO_RUP_DONE                BIT(23)
>> +
>> +static void __csid_aup_rup_trigger(struct csid_device *csid)
>> +{
>> +    /* trigger SET in combined register */
>> +    writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
>> +}
>> +
>> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
>> +{
>> +    /* Hardware clears the registers upon consuming the settings */
>> +    csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
>> +    csid->rup_update &= ~CSID_RUP_AUP_RDI(port_id);
>> +}
>> +
>> +static void __csid_aup_update(struct csid_device *csid, int port_id)
>> +{
>> +    csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
>> +    writel(csid->aup_update, csid->base + CSID_AUP_CMD);
>> +
>> +    __csid_aup_rup_trigger(csid);
>> +}
>> +
>> +static void __csid_reg_update(struct csid_device *csid, int port_id)
>> +{
>> +    csid->rup_update |= CSID_RUP_AUP_RDI(port_id);
>> +    writel(csid->rup_update, csid->base + CSID_RUP_CMD);
>> +
>> +    __csid_aup_rup_trigger(csid);
>> +}
>> +
>> +static void __csid_configure_rx(struct csid_device *csid,
>> +                struct csid_phy_config *phy)
>> +{
>> +    u8 lane_cnt = phy->lane_cnt;
>> +    int val;
>> +
>> +    if (!lane_cnt)
>> +        lane_cnt = 4;
>> +
>> +    val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>> +    val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>> +    val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
>> +           << CSI2_RX_CFG0_PHY_NUM_SEL;
>> +    writel(val, csid->base + CSID_CSI2_RX_CFG0);
>> +
>> +    val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
>> +    writel(val, csid->base + CSID_CSI2_RX_CFG1);
>> +}
>> +
>> +static void __csid_configure_rx_vc(struct csid_device *csid, int vc)
>> +{
>> +    int val;
>> +
>> +    if (vc > 3) {
>> +        val = readl(csid->base + CSID_CSI2_RX_CFG1);
>> +        val |= CSI2_RX_CFG1_VC_MODE;
>> +        writel(val, csid->base + CSID_CSI2_RX_CFG1);
>> +    }
>> +}
>> +
>> +static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 
>> rdi)
>> +{
>> +    int val = 0;
>> +
>> +    if (enable)
>> +        val = RDI_CTRL_START_CMD;
>> +
>> +    writel(val, csid->base + CSID_RDI_CTRL(rdi));
>> +}
>> +
>> +static void __csid_configure_rdi_pix_store(struct csid_device *csid, 
>> u8 rdi)
>> +{
>> +    u32 val;
>> +
>> +    /*
>> +     * Configure pixel store to allow absorption of hblanking or idle 
>> time.
>> +     * This helps with horizontal crop and prevents line buffer 
>> conflicts.
>> +     * Reset state is 0x8 which has MIN_HBI=4, we keep the default 
>> MIN_HBI
>> +     * and just enable the pixel store functionality.
>> +     */
>> +    val = (4 << RDI_PIX_STORE_CFG0_MIN_HBI) | RDI_PIX_STORE_CFG0_EN;
>> +    writel(val, csid->base + CSID_RDI_PIX_STORE_CFG0(rdi));
>> +}
>> +
>> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 
>> enable, u8 port, u8 vc)
>> +{
>> +    u8 lane_cnt = csid->phy.lane_cnt;
>> +    u32 val;
>> +
>> +    /* Source pads matching RDI channels on hardware.
>> +     * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
>> +     */
>> +    struct v4l2_mbus_framefmt *input_format = &csid- 
>> >fmt[MSM_CSID_PAD_FIRST_SRC + port];
>> +    const struct csid_format_info *format = csid_get_fmt_entry(csid- 
>> >res->formats->formats,
>> +                                   csid->res->formats->nformats,
>> +                                   input_format->code);
>> +
>> +    if (!lane_cnt)
>> +        lane_cnt = 4;
>> +
>> +    val = RDI_CFG0_TIMESTAMP_EN;
>> +    val |= RDI_CFG0_TIMESTAMP_STB_SEL;
>> +    val |= RDI_CFG0_RETIME_BS;
>> +
>> +    /* note: for non-RDI path, this should be format->decode_format */
>> +    val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>> +    val |= vc << RDI_CFG0_VC;
>> +    val |= format->data_type << RDI_CFG0_DT;
>> +    writel(val, csid->base + CSID_RDI_CFG0(port));
>> +
>> +    val = RDI_CFG1_PACKING_FORMAT_MIPI;
>> +    writel(val, csid->base + CSID_RDI_CFG1(port));
>> +
>> +    /* Configure pixel store using dedicated register in 1080 */
>> +    if (!csid_is_lite(csid))
>> +        __csid_configure_rdi_pix_store(csid, port);
>> +
>> +    val = 0;
>> +    writel(val, csid->base + CSID_RDI_CTRL(port));
>> +
>> +    val = readl(csid->base + CSID_RDI_CFG0(port));
>> +
>> +    if (enable)
>> +        val |= RDI_CFG0_EN;
>> +
>> +    writel(val, csid->base + CSID_RDI_CFG0(port));
>> +}
>> +
>> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
>> +{
>> +    u8 i, k;
>> +
>> +    __csid_configure_rx(csid, &csid->phy);
>> +
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            __csid_configure_rdi_stream(csid, enable, i, 0);
>> +            __csid_configure_rx_vc(csid, 0);
>> +
>> +            for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++)
>> +                __csid_aup_update(csid, i);
>> +
>> +            __csid_reg_update(csid, i);
>> +
>> +            __csid_ctrl_rdi(csid, enable, i);
>> +        }
>> +    }
>> +}
>> +
>> +static int csid_configure_testgen_pattern(struct csid_device *csid, 
>> s32 val)
>> +{
>> +    return 0;
>> +}
>> +
>> +static void csid_subdev_reg_update(struct csid_device *csid, int 
>> port_id,
>> +                   bool clear)
>> +{
>> +    if (clear)
>> +        __csid_aup_rup_clear(csid, port_id);
>> +    else
>> +        __csid_aup_update(csid, port_id);
>> +}
>> +
>> +/**
>> + * csid_isr - CSID module interrupt service routine
>> + * @irq: Interrupt line
>> + * @dev: CSID device
>> + *
>> + * Return IRQ_HANDLED on success
>> + */
>> +static irqreturn_t csid_isr(int irq, void *dev)
>> +{
>> +    struct csid_device *csid = dev;
>> +    u32 val, buf_done_val;
>> +    u8 reset_done;
>> +    int i;
>> +
>> +    val = readl(csid->base + CSID_TOP_IRQ_STATUS);
>> +    writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
>> +
>> +    reset_done = val & INFO_RST_DONE;
>> +
>> +    buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
>> +    writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>> +
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>> +            writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
>> +
>> +            if (val & INFO_RUP_DONE)
>> +                csid_subdev_reg_update(csid, i, true);
>> +
>> +            if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
>> +                camss_buf_done(csid->camss, csid->id, i);
>> +        }
>> +    }
>> +
>> +    val = IRQ_CMD_CLEAR;
>> +    writel(val, csid->base + CSID_IRQ_CMD);
>> +
>> +    if (reset_done)
>> +        complete(&csid->reset_complete);
>> +
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +/**
>> + * csid_reset - Trigger reset on CSID module and wait to complete
>> + * @csid: CSID device
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int csid_reset(struct csid_device *csid)
>> +{
>> +    unsigned long time;
>> +    u32 val;
>> +    int i;
>> +
>> +    reinit_completion(&csid->reset_complete);
>> +
>> +    val = INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
>> +    writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
>> +    writel(val, csid->base + CSID_TOP_IRQ_MASK);
>> +
>> +    val = 0;
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            /*
>> +             * Only need to clear buf done IRQ status here,
>> +             * RUP done IRQ status will be cleared once isr
>> +             * strobe generated by CSID_RST_CMD
>> +             */
>> +            val |= BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
>> +        }
>> +    }
>> +    writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>> +    writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
>> +
>> +    /* Clear all IRQ status with CLEAR bits set */
>> +    val = IRQ_CMD_CLEAR;
>> +    writel(val, csid->base + CSID_IRQ_CMD);
>> +
>> +    val = RST_LOCATION | RST_MODE;
>> +    writel(val, csid->base + CSID_RST_CFG);
>> +
>> +    val = SELECT_HW_RST | SELECT_IRQ_RST;
>> +    writel(val, csid->base + CSID_RST_CMD);
>> +
>> +    time = wait_for_completion_timeout(&csid->reset_complete,
>> +                       msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
>> +
>> +    if (!time) {
>> +        dev_err(csid->camss->dev, "CSID reset timeout\n");
>> +        return -EIO;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void csid_subdev_init(struct csid_device *csid)
>> +{
>> +    csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
>> +}
>> +
>> +const struct csid_hw_ops csid_ops_1080 = {
>> +    .configure_stream = csid_configure_stream,
>> +    .configure_testgen_pattern = csid_configure_testgen_pattern,
>> +    .hw_version = csid_hw_version,
>> +    .isr = csid_isr,
>> +    .reset = csid_reset,
>> +    .src_pad_code = csid_src_pad_code,
>> +    .subdev_init = csid_subdev_init,
>> +    .reg_update = csid_subdev_reg_update,
>> +};
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/ 
>> media/platform/qcom/camss/camss-csid.h
>> index 5296b10f6bac..3c2d15a61836 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -154,7 +154,13 @@ struct csid_device {
>>       void __iomem *base;
>>       u32 irq;
>>       char irq_name[30];
>> -    u32 reg_update;
>> +    union {
>> +        u32 reg_update;
>> +        struct {
>> +            u32 rup_update;
>> +            u32 aup_update;
>> +        };
>> +    };
>>       struct camss_clock *clock;
>>       int nclocks;
>>       struct regulator_bulk_data *supplies;
>> @@ -216,6 +222,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
>>   extern const struct csid_hw_ops csid_ops_4_7;
>>   extern const struct csid_hw_ops csid_ops_340;
>>   extern const struct csid_hw_ops csid_ops_680;
>> +extern const struct csid_hw_ops csid_ops_1080;
>>   extern const struct csid_hw_ops csid_ops_gen2;
>>   extern const struct csid_hw_ops csid_ops_gen3;
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index eeceb79c1e86..261e6c837dd4 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -83,6 +83,79 @@ static const struct camss_subdev_resources 
>> csiphy_res_kaanapali[] = {
>>       },
>>   };
>> +static const struct camss_subdev_resources csid_res_kaanapali[] = {
>> +    /* CSID0 */
>> +    {
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid0" },
>> +        .interrupt = { "csid0" },
>> +        .csid = {
>> +            .is_lite = false,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1080,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    },
>> +    /* CSID1 */
>> +    {
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid1" },
>> +        .interrupt = { "csid1" },
>> +        .csid = {
>> +            .is_lite = false,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1080,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    },
>> +    /* CSID2 */
>> +    {
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid2" },
>> +        .interrupt = { "csid2" },
>> +        .csid = {
>> +            .is_lite = false,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1080,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    },
>> +    /* CSID_LITE0 */
>> +    {
>> +        .clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid_lite0" },
>> +        .interrupt = { "csid_lite0" },
>> +        .csid = {
>> +            .is_lite = true,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1080,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    },
>> +    /* CSID_LITE1 */
>> +    {
>> +        .clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid_lite1" },
>> +        .interrupt = { "csid_lite1" },
>> +        .csid = {
>> +            .is_lite = true,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1080,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    }
>> +};
>> +
>>   static const struct resources_icc icc_res_kaanapali[] = {
>>       {
>>           .name = "ahb",
>> @@ -5639,9 +5712,11 @@ static const struct camss_resources 
>> kaanapali_resources = {
>>       .version = CAMSS_KAANAPALI,
>>       .pd_name = "top",
>>       .csiphy_res = csiphy_res_kaanapali,
>> +    .csid_res = csid_res_kaanapali,
>>       .icc_res = icc_res_kaanapali,
>>       .icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>>       .csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
>> +    .csid_num = ARRAY_SIZE(csid_res_kaanapali),
>>   };
>>   static const struct camss_resources msm8916_resources = {
>>
> 
> I'd like to ask for the definition of the SOF enable bits - not 
> necessarily enabling the SOF interrupt _yet_ but the bits.
> 
> =>
> 
> We will shortly start switching on V4L2_EVENT_FRAME_SYNC which will need 
> to trigger off of SOF.
> 
> ---
> bod

Got it. I'll make sure the SOF enable bits take effect and include the 
change in the next revision.

Best Regards,
Hangxiang
