Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056A537E301
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256370; cv=none; b=FqSujKcUrKHkfIIHLviHlx6LTW6M7N+ct+2mhorG5t7FiAiAdETao/yNW6bo5zPpBYOvWoY6K6yZUodHf9UhDwdar4GOK7m2YkwWnKfz+7aqTV77NjjFad/M2U2zXPoC8TSOTdVww+N8K1ZDCEJoHYNeG9UQ0rDR8mwovZZlVTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256370; c=relaxed/simple;
	bh=I3Z0NYX6XDBZkxlAm3drfNsOlkrf/TDMZOXvVbZv+aU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0wGKPgo0znJ2dn1FRh0FjzuF6AN5DLlQHB/o1/Wo+xnWz4VAVJS6sTci0xkjSLSw7B23AJOykYDCeMuCDt5m4EeZLatugsef0AwjTpCagVIY5LCRhYuoXUd1vGG854yURB2vY7svD3ubhNeWUFM7ko+BjhHI0JqhIRGW5W+AC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0/EKFiG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFTglExS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0/EKFiG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFTglExS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39Y3S2411555
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1eIf0xp5hZBEBNH7WRO9eVs/5PtTegLcmrXxMejWeX4=; b=Z0/EKFiG7dxFxpNJ
	DKGG2WUqH9YjYwDMKDEpndJhwLHWSeZZzThRCBVFrlIv+2aXG/rFa2fadpX+fyZ7
	8IFO/zi2N2266GfDC5VmbxsUO9zyVXhDG8se8D25bN5wuJR9dg94DWmLUhxcAewT
	eR+ycG9W0/PxxUGV6jiJC1Qw5pJaUUiTndpI0SX8y08JKaxlkINNLIhm6LScY3QM
	C6/xgNqFzJbrndKufSkY7KAXKv1S6oDrd7lAm6EKorvREFkVauuKrRcBa22/KKvQ
	GQKh0p/BdTqWQtOBJfUiOoMcg3DizH1+CxoAEqzxES0FptvYacgIEPrj1Dvnf3fs
	15NhZA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165awdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c33d75153dso286443137.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256364; x=1781861164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eIf0xp5hZBEBNH7WRO9eVs/5PtTegLcmrXxMejWeX4=;
        b=dFTglExS8HxkTJwpg8T8ZaLM1Nw/HTFxx+OHOvi2rZ4KdkP+A2EgVDX3jpLS4mu1nY
         KyjF1c1VhGIkF6z4AU8f3z+WpQAAn2c6mp0WCiPpyJpZ6AR98RqZ/8BneVfexlnlGu20
         hiMckHgmWuLSHBz/WHWToY19FCuihwzQJl53R4hlAqNajTOOftLxMsnCwQWcqMbN3qYB
         J1TnW9dJVkm485BZJvQT+c6lwTrQgwXhbUI9GJv2ww26WoCdwVrsbeANcDckL+zzt+0q
         BsPJY+vp7IcdadwGy8qIya+GmWrVjiSZQsJI7vSyoNsf9oKh7QeZWxvQUmHUgazGSlai
         wbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256364; x=1781861164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1eIf0xp5hZBEBNH7WRO9eVs/5PtTegLcmrXxMejWeX4=;
        b=QN5XoQVPc4ayI1g0ZuydsP2Z0I4mADyJu/QSEukd/cEqn9tACyX/pbD8eycxg/LRd7
         tZ0XMZpDVaPwcSDHW+IyFy8yUGB5tciOmP4/I7vlZMfxNlxfPxxL3tNytrSjrpRGCoHc
         cZMZ0tTwlqLeZxXqQuHq7uM02v46yhdkNkMbWLz9W5O1dsQ4zBmrWcWeTIAcOzk/fOOl
         s3Z2tGrLFU+z8fGNk3iVeBGlmnaAWqpoZ1fn87MWdX0EI6WYhJsdw+/l48NFiUrFKHoL
         POW2ebeLzGsjBfHwd8vB4bOYaXWyeMQ6docOU6oVZFbZu1E8T+jHrPFTiQNAvRto+5Br
         fW5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+//uL+yaFsChOuGjBaf0rj6tf0leMPKXlCUU6O1x/P/fBZN+IQ/z+j89j9FoMm70u1sM4TPe5r25Yo@vger.kernel.org
X-Gm-Message-State: AOJu0YwCW8wzjPoL6HmpqvveHy4bIghwA/MviukefCCsqfdmzwlC+1z9
	uHPYJYjJTOcfuNPEYkjFJaBjQ1obW6OD9gBuHc+8HsNwsP1U+KG196YDNcTk/nlGM7B2LdGLrrX
	7RQ0/+x9AZeJ9aF2XYJSKGF8WXgfIu1d7zc9eNUuqBONHeikSAI1CjMiUyoZn81R/
X-Gm-Gg: Acq92OGXdyN4OuckX0UI/B0tJ4RwTJIJhc5oCTBXlbc3kXOCwPLzJ/CWQaFyCabTKHr
	wLLHdQc4tYH8b9ysuS4sqqUKKnOstkfTZpY4LKtOmjkzEpbo49euA8Wwj8nvPUE1c1/tcYuPdAE
	8pGPwHMrKAem/wwnzEkwtu776GbqsheiTdQL/iTTwtWnaUHUczZ17+B1OWdL1NN071ZJIubm2UR
	SntQ3PyGoe5O+MsAnipRD/bMeHMxrXF36jCqWw4T/EgtpO8izlfAWJG873GNe/ab0X6P1HgDQHA
	LLNXPAEa8hWYy6MHi6nTUDfKoqdc22pIkQB1TMcsgZR959fm3/CCd4obpEC4LOKBCQHBEjrHrub
	WwJkEiyXPMOa5YcRbW2JhDVHUrtU0HAaE0nXNTUHCXvRCeCNER4vdHw4j0cW3NHRYHypu9f69w1
	pNytghBHvDEaWIk5ms892zTvVOyRaRUSETBuI=
X-Received: by 2002:a05:6102:41ac:b0:631:81d6:e15c with SMTP id ada2fe7eead31-71e88ac3b40mr713861137.4.1781256364082;
        Fri, 12 Jun 2026 02:26:04 -0700 (PDT)
X-Received: by 2002:a05:6102:41ac:b0:631:81d6:e15c with SMTP id ada2fe7eead31-71e88ac3b40mr713847137.4.1781256363589;
        Fri, 12 Jun 2026 02:26:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:41 +0300
Subject: [PATCH v4 09/16] media: iris: Add framework support for AR50_LITE
 video core
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-9-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8118;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9DQMCHqkqZR4kYnFSm/8VmYUprdVpc9QpDcgMlyKNYs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CQupY9yh4YharMq5EC4OLtbjyDaTe8H0oDb
 oVVu0bF9faJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkAAKCRCLPIo+Aiko
 1V9MB/wMffLpSbLfZ3/uGyEvhyXO86pEtPgyw8se9UuoKk3+3dl1SgqeO5fWoKAitujoOQhXHZI
 z+VZpKraQyz7Ek3R0SZ7yvnOcwgZef0vjbFVWTCJybvc2OfiwTpFu0Fk2CzxrmxTBQL6CgKCwTO
 lAiFGaKh0qikqV2I+wpI5N9Yf8NG5zXaX9kZeJcm0Hu8luMpG+XhtQntV5h5CpPejBXwV26xYqP
 yTbRh77KIHLJmf0IkvQHHn0AQ9QSaou7ixc4+Ta6vCrw7wYFCsUynBwAhe02WWEvSQfwvPDwIe2
 WZvwExOyWxtLB/Qs2fZeLJ5WXZ4RWOzasS2tEzcy5ORoykpE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX+KQf8CrfD2MX
 FR4q6f2K0ibI4ElSaz1WmuGaxqZszfxoRGEdtYip7fHyd8gNX9JflChjeqsILxn9v/yEBN2mt/y
 LlwVXNwJJ3KD/EcO5t3PvkbDjrLeERVr/Mt/4z9p9M0kjXwc5aZP1A5qTJk7+qlRwhI/98w5Mkq
 PQ6X70XFhuuM5e/uXSub15rIAox6smawE9a27fHUkS8lfh5Lz1kCZIxOlDIlq/hO1bCKODkIq07
 SAdv0j+csRAxYn0Fy+jFZQLAtG7SGPNG9TNX8rFLpTcRm1aCXwIIiHAz1EbV+qCbULG0WUBhbzi
 hrCSeB5Xfhz98YwBGyNfm8m+cgfEZ8j4fRSgnLSIKwdAcqop+1sdiaoNW87SKjzfYREaZbJ0DdV
 RXMOFn2nLwjY2nYzCMFpwMGgg0vZiH7TAmUh4qRSD42aO+cKg0EPeOGdzHkR5n0XTh3Mx6J9djO
 TkREz1FegzYyCrVrwuQ==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2bd0ad cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=x0nZcyIE9sK-8O7Lov0A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: oC4pPYFe9L2OnqhmBnFW0LLfb-eEHelk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX0dYwLGgZmN7r
 nI9+bcvcaJ9uHhr6HLwnelKQwA1rGaQuXTTCGQGrVk4sdQglmVv4MbHJU4PvXcjlnF0ygT2e/dZ
 TZULwgSZCyw+Rm4ZrZFBXTzVza3eyxs=
X-Proofpoint-GUID: oC4pPYFe9L2OnqhmBnFW0LLfb-eEHelk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Add power sequence for ar5lt core.
Add register handling for ar50lt by hooking up vpu op with ar50lt
specific implemtation or resue from earlier generation wherever
feasible.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 156 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   3 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 5 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..f1b204b95694 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,6 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu4x.o \
+             iris_vpu_ar50lt.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index accc1627defd..6a189489369f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -74,6 +74,7 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_THROTTLE_CLK,
 };
 
 struct platform_clk_data {
@@ -315,6 +316,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	bool no_rpmh;
 	u32 wd_intr_mask;
 	u32 icc_ib_multiplier;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
new file mode 100644
index 000000000000..1af20b067c03
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+
+#include "iris_vpu_register_defines.h"
+
+#define WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT BIT(3)
+
+#define WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT		0xb0080
+
+#define CPU_CS_VCICMD					0xa0020
+#define CPU_CS_VCICMD_ARP_OFF			0x1
+
+static void iris_vpu_ar50lt_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT);
+}
+
+static void iris_vpu_ar50lt_interrupt_init(struct iris_core *core)
+{
+	writel(WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT, core->reg_base + WRAPPER_INTR_MASK);
+}
+
+static void iris_vpu_ar50lt_disable_arp(struct iris_core *core)
+{
+	writel(CPU_CS_VCICMD_ARP_OFF, core->reg_base + CPU_CS_VCICMD);
+}
+
+static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
+{
+	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return 0;
+}
+
+static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
+{
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+}
+
+static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_ctrl_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
+	if (ret)
+		goto err_disable_axi_clock;
+
+	return 0;
+
+err_disable_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+err_disable_ctrl_clock:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
+	if (ret)
+		goto err_disable_hw_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_THROTTLE_CLK);
+	if (ret)
+		goto err_disable_hw_ahb_clock;
+
+	return 0;
+
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static u64 iris_vpu_ar50lt_calc_freq(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 mbs_per_second, mbpf, height, width;
+	unsigned long vpp_freq, vsp_freq;
+	u32 fps = DEFAULT_FPS;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
+
+	/* 21 / 20 is overhead factor */
+	vpp_freq += vpp_freq / 20;
+	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
+
+	/* 10 / 7 is overhead factor */
+	vsp_freq += ((fps * data_size * 8) * 10) / 7;
+
+	return max(vpp_freq, vsp_freq);
+}
+
+const struct vpu_ops iris_vpu_ar50lt_ops = {
+	.power_off_hw = iris_vpu_ar50lt_power_off_hw,
+	.power_on_hw = iris_vpu_ar50lt_power_on_hw,
+	.power_off_controller = iris_vpu_ar50lt_power_off_controller,
+	.power_on_controller = iris_vpu_ar50lt_power_on_controller,
+	.calc_freq = iris_vpu_ar50lt_calc_freq,
+	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_ar50lt_set_preset_registers,
+	.interrupt_init = iris_vpu_ar50lt_interrupt_init,
+	.disable_arp = iris_vpu_ar50lt_disable_arp,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 41498f94480e..75dc051cc6cb 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -97,7 +97,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	}
 
 	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
-	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
+	if (!core->iris_platform_data->no_rpmh)
+		writel(0x0, core->reg_base + CPU_CS_X2RPMH);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 71d96921ed37..f00e2de5fa53 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
+extern const struct vpu_ops iris_vpu_ar50lt_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);

-- 
2.47.3

