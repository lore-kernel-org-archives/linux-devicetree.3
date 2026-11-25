Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612708;
	b=Nm0DHCzg9LJ/e25J0/4bYSS7KV84C7XmVrU4kqcYNfmBqtHB5dWROUhp0kjqYQiS8x28
	 4MCbk+0Oy/WO5ZWUcC1kyIRLUTretDxj3hjeQvihtCBpZnSHiNVRpZ/BFAtaqa/ij7LGu
	 CyOSUcAfxrH8ZzRygmr3Vt2PfRVAsxdV1C+fSGBJBEcsnyg8wohdtid9IqFuqenPA7rIj
	 P0N+EL1bNaYCznH/w4Uzvo1UQgxLPv23NaBvbsXYzits1HQ7OT3zohXWnkOvdkAKiMvwc
	 Ces61XFo9LYOuei+S3MsC40bm4NwcMTTzG2G8m34y1MCoPbQP0KVEWT35VDNiRuLURA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XujrcBPg8iCP0lS9nyAmpKLbRw0s1l2SwZW5Nbs3TbQ=;
	b=sLlr0Ubsd7pAM1FqybYhd5itBj8BZc17ajuZ1dbfYlkPQV1YQ6ymG5BuBVBhgR/UQcQD
	 nchqI+TBpDdVZ1lO52475yLJeg2EGxvgLlDxtF/LF+/I631xWYp7lEQk/K7SVoV8D6m5I
	 WK/JKWkeLR8R4boNphfyqEs6r1JMX0oDXhw+UtuXymwZrC3z8l8EGVL3YfZd0LLjXJ2y0
	 /53sTCVUT1fgEIB17TWllZcPqkKEGCHdxgRfSTHBsnM6c5tqwN9iUiTk5ryOJ17m/yCWY
	 zvbZTGHxh6k0atJDYEMYp3b5lErQ3fW1pnmoDd9JQzEVaprJjmp1i14mCioXZV2sEKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JS7F1R3f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ps6Kphzj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2504D606A697
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2504D606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JS7F1R3f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ps6Kphzj
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mBwl2121024
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XujrcBPg8iC
	P0lS9nyAmpKLbRw0s1l2SwZW5Nbs3TbQ=; b=JS7F1R3f3EewGY/+YloX8zmz8Sq
	7st1MXrHLahQ9nEASKnHih+b0ITNN9CJuqWlJOlYYbyxm695dQz5eAouFHsjvpGs
	V0iVn7uNsISnZQKgqfZ/IMAmqKubJ69SCwQZKDZ4BE96uqh/iudADJEKzFrICfKv
	cXM+Fq2to9z+hJnpKvtpKA0DlhwsQyURqLyxZmYHVWpWA83uR6O3+dMDzSZ/ksdL
	8djpSMmyZET+lqi4VPz53pF/hXxEEQinllSm1bGRcWbvtQ0K8DN/eTWOGKslTk0T
	mmxwbHBaYY+bh8vUFs+IjPDwl5KI4p9KqkxsK0VF52U6a8bWt1plOatLQHQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuks001-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ece45cb25bso1463813e0c.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612704; x=1796217504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XujrcBPg8iCP0lS9nyAmpKLbRw0s1l2SwZW5Nbs3TbQ=;
        b=Ps6KphzjfuJIiK+HqpWFCy2gbnCitEwODxO8Dq2QHPUxrZ/d1+IlJww9I2yrS8dKJi
         4JtMRNyXgb7O/r5ifBgEE7ezlgO+IXNpJr0/UEOARSC3Rk3Wq1BvWT4P1RTSX7XQQT4y
         m4JUqxdcTZ4sTO5Lrf5ZWGHZa+2G7aNeY3v8lE3W9qZaL3VIlHsdBntASWPWprtm8VdL
         2skP7OG0q+oha0bZtI2T3Kas+6IDABIJdGVayvYhjSropyOzimG248Xi7SEm0qZhSFMJ
         Z8JAn/gBIHea/Sq9NDAVR4QasGbqEecOYEIjo1jnnadz0MEIzdCVQEv67m8G4lQ/FU0Q
         NMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612704; x=1796217504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XujrcBPg8iCP0lS9nyAmpKLbRw0s1l2SwZW5Nbs3TbQ=;
        b=S0wztLNG+tSxK5yYhhoHRQqLVAAu2bUjNcV02cfttNl3I6Zh9OdAwhH3HSgQEYz1V/
         BM7qlDRGUHC0IxXtZgPknfZQ60/SlFIny1RktO5rTJq64AdmwmBdOk8NIRTUxA/sWGw1
         42HWHjo/ixet6pFIQCzah1bn7jojKT7ijIE9ItOGteO3Q0CuoPs4r4xC90pT+m/lfDwQ
         XuVU9HDFs1L0aDOves8JRETGotUQP36Af8Ps4cG8nQT1LkTDYq2a+9u4yoc3grOKWEWu
         atUtAfba/7BNpkZd9KW5Rs76dJ4Olkob7U0nJT7E1Utram3VvtV5lXPVl4kb7vsqYDXc
         qBtA==
X-Forwarded-Encrypted: i=1; AL+hErHDtxBvTB2Aqc4oGU4dLtwMbTjrfvWXfCZc4qpfc0EREJgfL3x6ADPCGI16AO7Wx2lUIxKAgNLMXn4s@vger.kernel.org
X-Gm-Message-State: APuU4Z/GESiwmz8gLeQmMjs5eTT0Q33UHW1CFf0ze5ZuvzIRbFuMakUb
	uD4BkAM11QdTBc1EkBJAySZ+/yororlPhvCoTvAvxdUtyf+1Qb7iFmNWeSzYEcexLiWUQ+5eUQv
	bbcruddrgLs5CzFYkugvk88TeIg8Fx4OlqwBbl/iD6UGN9OXq7L1HfKyUNymEsoJe
X-Gm-Gg: AZFdTZcylbKicNKeIO5KFZKWHkObq1+B4tgsEBInsZ4HWI2TvfgzyXJBrzEws/2yxPn
	Yztb6VLsTLTHzSia3a+eoJ2pop1M3y2Z599wZ+UBmqKHZKlyaQ32tsAAoMHXIy/J+EMp+vshbY5
	nHNqyMiRG8mn7f3T+XVj72dDcxTs5seLyozBm+zBDE9HGaS2xLwWur74rQ6G5Z5u/aE9z1MXkuU
	O36Az8bvhLS9RreH234s1Nmejj9ZfgZB657tnsCCup+NHk3uWf0QM8eK90Vf/O0rjmmprY+IgB1
	NcfmsjwjkfGBj0hU5TetvAcuGPxCnqm8B5ZlcBLH3RAL5VHqxEov3eHOBHLYQH7Rc5NzNcQQ4dh
	LGqjoGiTj4gDVENIBGgqfFuXmmv3mnMWWsrxKVZ4fRCo3MgP0KvAffxlsGUoosf/0
X-Received: by 2002:a05:6122:4d0e:b0:5c9:a60d:3279 with SMTP id 71dfb90a1353d-5ee8aeefaf5mr9415455e0c.13.1795612704196;
        Wed, 25 Nov 2026 05:18:24 -0800 (PST)
X-Received: by 2002:a05:6122:4d0e:b0:5c9:a60d:3279 with SMTP id 71dfb90a1353d-5ee8aeefaf5mr9415391e0c.13.1795612703509;
        Wed, 25 Nov 2026 05:18:23 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 3/4] clk: qcom: Add lpass audio clock controller driver for Glymur
Date: Wed, 25 Nov 2026 13:17:56 +0000
Message-ID: <20261125131757.1163466-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06e021 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7GdS1con5BCYmhUutoQA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: u8Xt9reNbfZBwas-K25YuvLNwFfi28wY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX91TdpGgwym2s
 8sWLzYksMDxgvfP+q55KLjLs4xqqoq2pHMEOBHQoukxjmZg3yVHhLaMsI6G+Vfh7IclbvG9lZtY
 snWcqWrUkfHGuPkb1YWknDFhy1kF0EQ=
X-Proofpoint-GUID: u8Xt9reNbfZBwas-K25YuvLNwFfi28wY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX97/oFOLH0c8I
 bCAcrCyZDNvZMS8MzCIA9KK9nWN2ldXoC52gjV/gG0MJw+ujyOuvO5uXKZbIFEbzoKf4HNsDmQ8
 14p422iYvNmBTlAgwf5fVHWEvN2d28khrxOzVr9ZlclX5hraEWMNjKkCpyVfIt7BDVUbk7GrkAK
 zf+kVI9Wkj6hFqBFEqYLU+7+183UMM/+tQtCtfOWkHr02MPVyo5Yp2Qr5neFYMafRPIY/uyWGtD
 zN+Bvkvw5Mgv5XcbDAaN8WdH0BjYihuElbvE+HXOsUL5xUrQuoue3IriOhYtG3T9VRdhScqWVtt
 8VDF5XoQLFlVYod89BFtsckl8cdKqSPTEXUrX6MoiNsqRQmKDJY1b4prefVhMkoSjlLMGyEj1Lf
 4ZwwSQfeOWC3Rx0TJfqq39/wSD8rx17cG53rn1TIP+r4qRoiUyjnB4YeWv1OHIuUMz9WFbhdvS7
 UY3tvFFtoJ5c+POAJ2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

Add support for the lpass audio clock controller found on Glymur based
devices. This would allow lpass peripheral loader drivers to control the
clocks and bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig          | 11 +++++
 drivers/clk/qcom/Makefile         |  1 +
 drivers/clk/qcom/lpasscc-glymur.c | 68 +++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a..89e6a636e497 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1274,6 +1274,17 @@ config SC_LPASSCC_8280XP
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
 	  controller to reset the LPASS subsystem.
 
+config SC_LPASSCC_GLYMUR
+	tristate "GLYMUR Low Power Audio Subsystem (LPASS) Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
+	help
+	  Support for the LPASS clock controller on Glymur devices.
+	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
+	  controller to reset the LPASS subsystem.  Required for the LPASS
+	  audio macros and the SoundWire compute-mode controller to leave
+	  reset on Glymur.
+
 config SC_LPASS_CORECC_7180
 	tristate "SC7180 LPASS Core Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6affb5073f26..0c7a67b9cee3 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -151,6 +151,7 @@ obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
 obj-$(CONFIG_SC_LPASSCC_8280XP) += lpasscc-sc8280xp.o
 obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
 obj-$(CONFIG_SC_LPASS_CORECC_7280) += lpasscorecc-sc7280.o lpassaudiocc-sc7280.o
+obj-$(CONFIG_SC_LPASSCC_GLYMUR) += lpasscc-glymur.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7280) += videocc-sc7280.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
new file mode 100644
index 000000000000..b7fdd76df2f5
--- /dev/null
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+
+#include "common.h"
+#include "reset.h"
+
+static const struct qcom_reset_map lpass_audiocc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xa0, 1 },
+	[LPASS_AUDIO_SWR_WSA1_CGCR] = { 0xb0, 1 },
+	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xd8, 1 },
+	[LPASS_AUDIO_SWR_WSA3_CGCR] = { 0x300c, 1 },
+	[LPASS_AUDIO_SWR_WSA4_CGCR] = { 0x301c, 1 },
+};
+
+static const struct regmap_config lpass_audiocc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-audio-csr",
+	.max_register = 0x3020,
+};
+
+static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
+	.config = &lpass_audiocc_glymur_regmap_config,
+	.resets = lpass_audiocc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
+};
+
+static const struct of_device_id lpasscc_glymur_match_table[] = {
+	{
+		.compatible = "qcom,glymur-lpassaudiocc",
+		.data = &lpass_audiocc_glymur_reset_desc,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpasscc_glymur_match_table);
+
+static int lpasscc_glymur_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc = device_get_match_data(&pdev->dev);
+
+	return qcom_cc_probe_by_index(pdev, 0, desc);
+}
+
+static struct platform_driver lpasscc_glymur_driver = {
+	.probe = lpasscc_glymur_probe,
+	.driver = {
+		.name = "lpasscc-glymur",
+		.of_match_table = lpasscc_glymur_match_table,
+	},
+};
+
+module_platform_driver(lpasscc_glymur_driver);
+
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>");
+MODULE_DESCRIPTION("QTI LPASSCC Glymur Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

