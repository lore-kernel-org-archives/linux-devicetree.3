Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C07F39E19C
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842369; cv=none; b=tpCGSjIucskDNkIY70U9eawxNJa01bsU4LbJ9BwridK9JABk92qmFhJAnq3RX7tbe8JTgGFefljyF6/WzOxepQDVazfdSRY10VjWR8KRQPUfBJDK5n4qtz0Fg2cgPiMEb4aW8SbZWk3YZzTvurXH2iaRKNYAG9JmpiEiHeZUU1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842369; c=relaxed/simple;
	bh=4po1al0mZT37bH2Nh35vDIJf2Uf46NkUcysFb8b2y20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhKjbwTY4Ew+JWBynqwrHMzKmQl9j+hgUQiHWYs53gDKKgaBPHGwsKxxYkwjjO/YlMQ9V9+gUV7kKgHDZOTBuPFsBcm+nRM9UFr4/Qd+PvQTZDGU02AKmtGFYXtp3C3tyqpnmfaiGxnFCK16EsE1+5tORpcgYsoyj9O9nAj6PKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBo38plj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBp+HRaP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBo38plj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBp+HRaP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748wvc02726226
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 11:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6TtrHinqHZfvkw7qOv/wAGxZVN7KJ246fFw4yNRBHc=; b=NBo38pljtt6C0fT/
	V1kfIoVb4fM6TRnnpQ3XyHPQegoYG7epHZWiGNrA/o/iXtaNUel33yuy2j9MM6wp
	PLkPmm7EwaLGO5gp60mTfiEHWO1V3p6Wcx8qAzg1McMXdPcIdrGVAZwXtRU0YSiQ
	0OYOz8FhStDQyLYC1hQ4MGlMr3HN7tUFIq46WMQV1zfAFSOCCBKxBfK0htQ+tbGQ
	ZaeujykRXcWWGQgrlcGxz7tyeCEv9BJhNbECQLxoTy5Z3TWWCJtvo7QpvmNqe4YJ
	CvL6OYTZB6SeXcj7MflxET9/xkd03voB8vxBv+Ps4jH2ptdZTgn/YdybjILajeve
	YheKfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud23gh3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 11:19:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2caf4173b1cso92863135ad.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 04:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785842365; x=1786447165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6TtrHinqHZfvkw7qOv/wAGxZVN7KJ246fFw4yNRBHc=;
        b=aBp+HRaPfJ7MICdrv+7iLIwa9XulPNpNqr2JK4hHC6EAaPDjIVAOa+WzubzoCvUdk4
         Jrdmnrb6bfeK+An7+VtsenPur8uiyqrEcybw1kM9HlpzSseUrm68HtqXZig9/Tibvlqd
         W0QUizdm+3MmhKr1eOVx7YaPqWle/rAKFD1YUFRRrVCuur5JeGiqnWnoaffNe0ilGo1U
         08MXFIG6qoxHNRfC+GlpU/h7wPJ3uc6fnh0CY4uqN6fosbSBCHYjrwGYh7v8BWP9xGgf
         YnHPvI0Fu7qAYWHBbTrMVwgpxzwDpJby2qRS3uQDoJhStg4qFnqvanNbOVFYiU1Qfmfk
         4Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842365; x=1786447165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6TtrHinqHZfvkw7qOv/wAGxZVN7KJ246fFw4yNRBHc=;
        b=HN0XUeePQP+1WIVn4W178YK+zjiZ4jBaEHIfbl4titcFsr+yAkNgxXKlFB5tTIWZbu
         Zqj8GhvLSdT2hzWUL8+cSMpuos04orqflcC6nmv3PhgC6mLJiCZfG6ilZAhwthzO+/+g
         f9HRs08AjpC336XGU8s8JJcHQNrkttvF8mqacJV3KK+2lQ03PyKbGaST+ko5S7bGIH4k
         HQmCD6gBAIFSIriSzsrRhJM4KTPaBLPvTmC1GTYNVdWBqvxxVLlFXVn8SllyeptykV2c
         RtTlkKlZbxddPr5hfCzwyuG7ancRzB/xGdebjj0m9oTmRYkVQUSwoNGG3W99c6pg5Jzd
         HndA==
X-Forwarded-Encrypted: i=1; AHgh+RqCgGw+Ke1HDU4QvuydBYCdwZMBffVY3R+re2cTJH31RlvNwAa350PiYjp8tLOq3uIN7uH/GclqTjRJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa9nkj26ZAEtJSLnIQcDKb9lcQ9hZ+OIO07CLabQzsbJPX9k6z
	ZUlVwrwq+3tGGPGQz6Fcwkz7ZkHE2fx1NMKg0kAgZlhkcWQTN9zQdFPMyzv3q0k4QVw4di9/wyC
	p1xgSTm0Tmq0q1CH4smzX0yDB2qtCv35OtgDrSTz79CKnqC0fIIoXSSptY21WLFLP
X-Gm-Gg: AR+sD135NM5qQSstCUNZmki9jLL/resZ+3h/VAxe/uLYn82UL9cxqf0whmbtT+XAjhg
	lcQpIbplp2iXnldfE2ADrjoCN6XhJDSpfU0euGKxBmT2hYmMDlWrmXOZpEfye198cLjpLHXf3JI
	Wb0+/dvqkfTJiSugnVCVAXwDEib+ctoST6uC09C9VMCsJLgF/GMjDicqavNM7/ctqN5ecfFD15h
	/d+/OqJsZh951/Hb5JAOF2Q37kHKA43iV89FqPLOP9c+Vd3qiz4aud1wljZJYrlpnoZZp9ji8wY
	dMkq0VrwotYADvi9ZLi6a6GnGfmfvs/mkHtrVZ+O5q8sXL9lkzGknezwrJNfjFsxV42Stv5o4zW
	8Hjr+soS/lh7SP82P0NU43MUGFYs87QOfhoCvoQ==
X-Received: by 2002:a17:903:3d05:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2d0521d44damr133780625ad.14.1785842364803;
        Tue, 04 Aug 2026 04:19:24 -0700 (PDT)
X-Received: by 2002:a17:903:3d05:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2d0521d44damr133780195ad.14.1785842364225;
        Tue, 04 Aug 2026 04:19:24 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f9078csm5384765ad.14.2026.08.04.04.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 04:19:23 -0700 (PDT)
Message-ID: <de961a11-71ab-4642-9ced-5b97f47d7110@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 16:49:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/9] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-3-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803124442.krqtw6si4ujsnuul@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260803124442.krqtw6si4ujsnuul@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kI7OAzEvc723gJJXpnKzP1nx4QjkyAZ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5MCBTYWx0ZWRfX93FDrVQbbtb7
 N2WcKDVN93rDFoLAyV5/PUxGTgOLrRhTWHR18z9Hezs4Hj9tdRbKnshzLU41ujhTFJDWKl6U+d8
 pgsYK7HeTCtK8q9S25jU/LVlTxaEr9g=
X-Authority-Analysis: v=2.4 cv=XIkAjwhE c=1 sm=1 tr=0 ts=6a71cabd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=-UeJRP6P44Y6NUiPy_UA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: kI7OAzEvc723gJJXpnKzP1nx4QjkyAZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5MCBTYWx0ZWRfXxatxjxJuwy5T
 J/d2GTY4mzvvpp4bdT6iGYN7jEZGcKBjOOW6BT1WAn33kRpuCgkBOA7K9YCKaz0PbanfW/TRW7l
 NMQp1VRMJZkCWkuzNwjmgP7N0tfsyPf/5jzArvUoS3LRQzf2khoUBCn6yoQRk6GgHIx5Mus5xSF
 SQii+FJWzM4jC2H4wTD5/kIqqleGJ4Wy1mrfVvHUlvBwF+0Bxg9BRD2YZldjbe+wmHpSWs3MkQz
 GFWZvABEPLUpD19LsMWch13Lsp6ZiUqdDBSDnJFuXZY/t8+3+mUNVrHjCPgZ6jD4/81TLJocRA8
 y+KhupVqeHmNBeBgObC5gS4P4HkySaR6HO7YMvSR45maEuO0//7h0IkyUTtDi/ONIexMIkarlaq
 gFvhTN/NwTXiysD94ZyOmzFHMTHlG2BHc1AkBbR5Lb7mrfdi/nwvVL2FaJerpxjQGiAwc6oIKFy
 LJPay6M/2GZ4st1r3TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040090



On 8/3/2026 6:14 PM, Mukesh Ojha wrote:
> On Mon, Aug 03, 2026 at 04:16:09PM +0530, Varadarajan Narayanan wrote:
>> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>
>> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
>> SoCs support secure Peripheral Image Loading (PIL).
>>
>> Secure PIL image is signed firmware image which only trusted software such
>> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
>> Peripheral Authentication Service (PAS) request to TZ to authenticate and
>> load the PIL images.
>>
>> In order to avoid overloading the existing WCSS driver or PAS driver, we
>> came up with this new PAS based IPQ WCSS driver.
> 
> Can you tell why you need another driver if you are using the same PAS
> method and it is using more of everything what PAS already
> supports ?
> 

Hi Mukesh,

We just use pas_auth_and_reset and pas_shutdown APIs and do not need
the entire framework provided by the PAS driver for IPQ WCSS.

Also, feedback from Bjorn in [1] was to have separate driver
instead of overloading existing WCSS driver.

[1] https://lore.kernel.org/all/YFK1VpP74rQH2Z72@builder.lan/

>>
>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> [ Dropped ipq5424 support ]
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> 
> 
> Author and tested looks weird..here..

Will drop Tested-by here.

Thanks,
Vignesh
> 
> 
>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/Kconfig              |  20 ++
>>  drivers/remoteproc/Makefile             |   1 +
>>  drivers/remoteproc/qcom_q6v5_wcss_sec.c | 337 ++++++++++++++++++++++++++++++++
>>  include/linux/remoteproc.h              |   2 +
>>  4 files changed, 360 insertions(+)
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index 5b56b2dcc725..3feea5bda129 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -267,6 +267,26 @@ config QCOM_Q6V5_WCSS
>>  	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
>>  	  a non-TrustZone wireless subsystem.
>>  
>> +config QCOM_Q6V5_WCSS_SEC
>> +	tristate "Qualcomm Hexagon based WCSS Secure Peripheral Image Loader"
>> +	depends on OF && ARCH_QCOM
>> +	depends on QCOM_SMEM
>> +	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>> +	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
>> +	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
>> +	select QCOM_MDT_LOADER
>> +	select QCOM_PIL_INFO
>> +	select QCOM_Q6V5_COMMON
>> +	select QCOM_RPROC_COMMON
>> +	select QCOM_SCM
>> +	help
>> +	  Say y here to support the Qualcomm Secure Peripheral Image Loader
>> +	  for the Hexagon based remote processors on e.g. IPQ5332.
>> +
>> +	  This is TrustZone wireless subsystem. The firmware is
>> +	  verified and booted with the help of the Peripheral Authentication
>> +	  System (PAS) in TrustZone.
>> +
>>  config QCOM_SYSMON
>>  	tristate "Qualcomm sysmon driver"
>>  	depends on RPMSG
>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>> index 689686de0d41..f74519ea6502 100644
>> --- a/drivers/remoteproc/Makefile
>> +++ b/drivers/remoteproc/Makefile
>> @@ -29,6 +29,7 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
>>  obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
>>  obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
>>  obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
>> +obj-$(CONFIG_QCOM_Q6V5_WCSS_SEC)	+= qcom_q6v5_wcss_sec.o
>>  obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
>>  obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>>  qcom_wcnss_pil-y			+= qcom_wcnss.o
>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
>> new file mode 100644
>> index 000000000000..4837825d1717
>> --- /dev/null
>> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
>> @@ -0,0 +1,337 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#include <linux/clk.h>
>> +#include <linux/firmware/qcom/qcom_pas.h>
>> +#include <linux/io.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/of_reserved_mem.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/soc/qcom/mdt_loader.h>
>> +
>> +#include "qcom_common.h"
>> +#include "qcom_q6v5.h"
>> +#include "qcom_pil_info.h"
>> +
>> +#define WCSS_CRASH_REASON		421
>> +
>> +#define WCSS_PAS_ID			0x6
>> +#define MPD_WCSS_PAS_ID			0xd
>> +
>> +#define Q6_WAIT_TIMEOUT			(5 * HZ)
>> +
>> +struct wcss_sec {
>> +	struct device *dev;
>> +	struct qcom_rproc_glink glink_subdev;
>> +	struct qcom_rproc_ssr ssr_subdev;
>> +	struct qcom_q6v5 q6;
>> +	phys_addr_t mem_phys;
>> +	phys_addr_t mem_reloc;
>> +	void *mem_region;
>> +	size_t mem_size;
>> +	const struct wcss_data *desc;
>> +};
>> +
>> +struct wcss_data {
>> +	u32 pasid;
>> +	const char *ss_name;
>> +	bool auto_boot;
>> +};
>> +
>> +static int wcss_sec_start(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	int ret;
>> +
>> +	ret = qcom_q6v5_prepare(&wcss->q6);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = qcom_pas_auth_and_reset(wcss->desc->pasid);
>> +	if (ret) {
>> +		dev_err(dev, "wcss_reset failed\n");
>> +		goto unprepare;
>> +	}
>> +
>> +	ret = qcom_q6v5_wait_for_start(&wcss->q6, msecs_to_jiffies(Q6_WAIT_TIMEOUT));
>> +
>> +	if (ret == -ETIMEDOUT) {
>> +		dev_err(dev, "start timed out\n");
>> +		qcom_pas_shutdown(wcss->desc->pasid);
>> +		goto unprepare;
>> +	}
>> +
>> +	return 0;
>> +
>> +unprepare:
>> +	qcom_q6v5_unprepare(&wcss->q6);
>> +
>> +	return ret;
>> +}
>> +
>> +static int wcss_sec_stop(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	int ret;
>> +
>> +	ret = qcom_q6v5_request_stop(&wcss->q6, NULL);
>> +	if (ret == -ETIMEDOUT)
>> +		dev_err(dev, "timed out on wait\n");
>> +
>> +	ret = qcom_pas_shutdown(wcss->desc->pasid);
>> +	if (ret)
>> +		dev_err(dev, "Failed to shutdown %d\n", ret);
>> +
>> +	qcom_q6v5_unprepare(&wcss->q6);
>> +
>> +	return ret;
>> +}
>> +
>> +static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
>> +			       bool *is_iomem)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	int offset;
>> +
>> +	offset = da - wcss->mem_reloc;
>> +	if (offset < 0 || offset + len > wcss->mem_size)
>> +		return NULL;
>> +
>> +	if (is_iomem)
>> +		*is_iomem = true;
>> +
>> +	return wcss->mem_region + offset;
>> +}
>> +
>> +static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	int ret;
>> +
>> +	ret = qcom_mdt_load(dev, fw, rproc->firmware, wcss->desc->pasid, wcss->mem_region,
>> +			    wcss->mem_phys, wcss->mem_size, &wcss->mem_reloc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	qcom_pil_info_store("wcss", wcss->mem_phys, wcss->mem_size);
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned long wcss_sec_panic(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +
>> +	return qcom_q6v5_panic(&wcss->q6);
>> +}
>> +
>> +static void wcss_sec_copy_segment(struct rproc *rproc,
>> +				  struct rproc_dump_segment *segment,
>> +				  void *dest, size_t offset, size_t size)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +
>> +	if (!segment->io_ptr)
>> +		segment->io_ptr = ioremap_wc(segment->da, segment->size);
>> +
>> +	if (!segment->io_ptr) {
>> +		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
>> +			&segment->da, segment->size);
>> +		return;
>> +	}
>> +
>> +	if (offset + size <= segment->size) {
>> +		memcpy_fromio(dest, segment->io_ptr + offset, size);
>> +	} else {
>> +		iounmap(segment->io_ptr);
>> +		segment->io_ptr = NULL;
>> +	}
>> +}
>> +
>> +static int wcss_sec_dump_segments(struct rproc *rproc,
>> +				  const struct firmware *fw)
>> +{
>> +	struct device *dev = rproc->dev.parent;
>> +	struct reserved_mem *rmem = NULL;
>> +	struct device_node *node;
>> +	int num_segs, index;
>> +	int ret;
>> +
>> +	/*
>> +	 * Parse through additional reserved memory regions for the rproc
>> +	 * and add them to the coredump segments
>> +	 */
>> +	num_segs = of_count_phandle_with_args(dev->of_node,
>> +					      "memory-region", NULL);
>> +	for (index = 0; index < num_segs; index++) {
>> +		node = of_parse_phandle(dev->of_node,
>> +					"memory-region", index);
>> +		if (!node)
>> +			return -EINVAL;
>> +
>> +		rmem = of_reserved_mem_lookup(node);
>> +		of_node_put(node);
>> +		if (!rmem) {
>> +			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
>> +				index, num_segs);
>> +			return -EINVAL;
>> +		}
>> +
>> +		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
>> +			&rmem->base, &rmem->size);
>> +		ret = rproc_coredump_add_custom_segment(rproc,
>> +							rmem->base,
>> +							rmem->size,
>> +							wcss_sec_copy_segment,
>> +							NULL);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct rproc_ops wcss_sec_ops = {
>> +	.start = wcss_sec_start,
>> +	.stop = wcss_sec_stop,
>> +	.da_to_va = wcss_sec_da_to_va,
>> +	.load = wcss_sec_load,
>> +	.get_boot_addr = rproc_elf_get_boot_addr,
>> +	.panic = wcss_sec_panic,
>> +	.parse_fw = wcss_sec_dump_segments,
>> +};
>> +
>> +static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
>> +{
>> +	struct device *dev = wcss->dev;
>> +	struct resource res;
>> +	int ret;
>> +
>> +	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>> +	if (ret) {
>> +		dev_err(dev, "unable to acquire memory-region resource\n");
>> +		return ret;
>> +	}
>> +
>> +	wcss->mem_phys = res.start;
>> +	wcss->mem_reloc = res.start;
>> +	wcss->mem_size = resource_size(&res);
>> +	wcss->mem_region = devm_ioremap_resource_wc(dev, &res);
>> +	if (IS_ERR(wcss->mem_region)) {
>> +		dev_err(dev, "unable to map memory region: %pR\n", &res);
>> +		return PTR_ERR(wcss->mem_region);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int wcss_sec_probe(struct platform_device *pdev)
>> +{
>> +	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
>> +	const char *fw_name = NULL;
>> +	struct wcss_sec *wcss;
>> +	struct clk *sleep_clk;
>> +	struct clk *int_clk;
>> +	struct rproc *rproc;
>> +	int ret;
>> +
>> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
>> +				      &fw_name);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	rproc = devm_rproc_alloc(&pdev->dev, desc->ss_name, &wcss_sec_ops,
>> +				 fw_name, sizeof(*wcss));
>> +	if (!rproc) {
>> +		dev_err(&pdev->dev, "failed to allocate rproc\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	wcss = rproc->priv;
>> +	wcss->dev = &pdev->dev;
>> +	wcss->desc = desc;
>> +
>> +	ret = wcss_sec_alloc_memory_region(wcss);
>> +	if (ret)
>> +		return ret;
>> +
>> +	sleep_clk = devm_clk_get_optional_enabled(&pdev->dev, "sleep");
>> +	if (IS_ERR(sleep_clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(sleep_clk),
>> +				     "Failed to get sleep clock\n");
>> +
>> +	int_clk = devm_clk_get_optional_enabled(&pdev->dev, "interconnect");
>> +	if (IS_ERR(int_clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(int_clk),
>> +				     "Failed to get interconnect clock\n");
>> +
>> +	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
>> +			     WCSS_CRASH_REASON, NULL, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, desc->ss_name);
>> +	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, desc->ss_name);
>> +
>> +	rproc->auto_boot = desc->auto_boot;
>> +	rproc->dump_conf = RPROC_COREDUMP_INLINE;
>> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>> +
>> +	ret = devm_rproc_add(&pdev->dev, rproc);
>> +	if (ret) {
>> +		qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
>> +		qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
>> +		qcom_q6v5_deinit(&wcss->q6);
>> +		return ret;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, rproc);
>> +
>> +	return 0;
>> +}
>> +
>> +static void wcss_sec_remove(struct platform_device *pdev)
>> +{
>> +	struct rproc *rproc = platform_get_drvdata(pdev);
>> +	struct wcss_sec *wcss = rproc->priv;
>> +
>> +	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
>> +	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
>> +	qcom_q6v5_deinit(&wcss->q6);
>> +}
>> +
>> +static const struct wcss_data wcss_sec_ipq5332_res_init = {
>> +	.pasid = MPD_WCSS_PAS_ID,
>> +	.ss_name = "q6wcss",
>> +};
>> +
>> +static const struct wcss_data wcss_sec_ipq9574_res_init = {
>> +	.pasid = WCSS_PAS_ID,
>> +	.ss_name = "q6wcss",
>> +};
>> +
>> +static const struct of_device_id wcss_sec_of_match[] = {
>> +	{ .compatible = "qcom,ipq5018-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
>> +	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
>> +	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
>> +
>> +static struct platform_driver wcss_sec_driver = {
>> +	.probe = wcss_sec_probe,
>> +	.remove = wcss_sec_remove,
>> +	.driver = {
>> +		.name = "qcom-wcss-secure-pil",
>> +		.of_match_table = wcss_sec_of_match,
>> +	},
>> +};
>> +module_platform_driver(wcss_sec_driver);
>> +
>> +MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index ef711a5b1a7f..cf06b9846309 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -204,6 +204,7 @@ enum rproc_dump_mechanism {
>>   * @node:	list node related to the rproc segment list
>>   * @da:		device address of the segment
>>   * @size:	size of the segment
>> + * @io_ptr:	ptr to store the ioremapped dump segment
>>   * @priv:	private data associated with the dump_segment
>>   * @dump:	custom dump function to fill device memory segment associated
>>   *		with coredump
>> @@ -215,6 +216,7 @@ struct rproc_dump_segment {
>>  	dma_addr_t da;
>>  	size_t size;
>>  
>> +	void __iomem *io_ptr;
>>  	void *priv;
>>  	void (*dump)(struct rproc *rproc, struct rproc_dump_segment *segment,
>>  		     void *dest, size_t offset, size_t size);
>>
>> -- 
>> 2.34.1
>>
> 

