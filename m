Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143940;
	b=mgV4cVBJDkNATVtiTNBHeGMB1xtEGE4s+SWm39jtkDXxzoUEbmMkFUSvkWDIiuaynbBL
	 Uu8enDLMRvaFZZ//N9Uh+nKWDmUp2h791xaDs1iglyD2iXmij8UadhwrgnzYTzVYfL2Ta
	 dK/3w3qHxKwIqs0o3xUDeQjZfEDEiLgUX6OEnhgXQfhVmO1hOiR7LRRP9irupJ3032/et
	 W6zFYK7+kW37wVoSDBhr8Koewm/NUnKZ8D0hsiTI41SNj/IVOKi+9op+E3Ysze70Jh5Cn
	 PBK0/3xFczYRfDbXepHrAwjZWNRKdiLfMRkahptdw4J+ZnnW+lUbLTQc2qxFBqFrWdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6QZynjGzDK0fYuTyTKqBhN+8z5UbqSMLFMQXW2juMJ0=;
	b=japwJcAxK8wscb6mb5VzsMbfSBSrMizYIl30qR1c3XhBnCXdSRJaFuPaZ2QjA6jfC3vn
	 NtZsmsc/+Yrlxigd7pFkRlX8oDrC1OIa61TCxjGe2A6h0G0nwXD293rJ6YLHzazCCu6Fw
	 bBDf40l/E7TCjtySdS2DTDplG39/6vi/dAHqpFTjlyRUh88wS+GB3voBfnnbvqeCgVO8l
	 qluQS9lVEuqSRtPOPD/vVnHKgHojFQ8A3xkTicMJcZcynPvwxecZCQRpA8bY5HjmtdvbZ
	 URDIIwdhhJgexiM7C0NBh+XWum4+V+JUXQpwbw3zXlJSz2bZyenrTbKV7F8l2atQ8rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U8htx6YP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvtI0VpA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDD1606A336
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 13:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CDD1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U8htx6YP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvtI0VpA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Afl9g2282899
	for <devicetree@vger.kernel.org>; Sun, 8 Nov 2026 13:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QZynjGzDK0fYuTyTKqBhN+8z5UbqSMLFMQXW2juMJ0=; b=U8htx6YPMdj5G71B
	w/Dm4ob/l4B9hpIB9NZtqjgsMxBQJhtImlbdnAu7KeYg4rFdnxKAUFKGyOOG+XqB
	60S4OIDH3pM2lo/FC5rkQctWOyhID3RGDkzq7JJBIdQAF1aVS/Nt32FuTQ/pVJ+x
	/NXRDCvn4aprEicycIRIt0t6yJ1OGVQ5fgV+LYlJTc8E0Sdn3lES246XlD0GJ4/O
	14kLvQ4uXC6PQRcKdVe97LzmXfo1/ZphkM4Bl4So2s9sNkPU9d9wrtqctFA/lVWv
	Sge7Fcg595nBpRlulco3Ai59UzvH8uEszLlgR4jtkdZJxEZ/Dm6I0eQxYQhaMqEW
	WJEK1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsb3wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:18:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so205184eec.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 05:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143939; x=1794748739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QZynjGzDK0fYuTyTKqBhN+8z5UbqSMLFMQXW2juMJ0=;
        b=AvtI0VpAkNM5C3B5vDM3OMJylPcBuVT3HZR92f9LAGMtMqdgi6YcSIr94IIGPhhk8d
         l+bZKD1YCSWMFsGNIHVX/idCBSWKqkDgMicJyLFEgDL67dM8Wy02KlvC2avflcvau4nF
         4UFmpLSVuY8aWAicN4+fXom/GIQIYEMKEedaVLZXxFEB3JSFYlHyWoXmJ7hxcZ6kOz2g
         B7Zb1mYpG516INo4EmebUq1I81GeiUlaumnIEygiZIdDcSMxSlcub0mlpMn8QJ9zkNip
         VZb4opvnxrutL6DdPO5yG34HWJWloxi0w6tTKUlgLhKOhX209YdM+TAka4ODni91cpzC
         4dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143939; x=1794748739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QZynjGzDK0fYuTyTKqBhN+8z5UbqSMLFMQXW2juMJ0=;
        b=owMH1oHVW/6h9uzYYOz8SazUnjzBXso3sJ9ctAX28xET1+0c3AroA5T0MgmDz7h1OK
         ZoIBl+mmgiemmtKxnp9N9TkhAJ26XkvQkTot1nS88YnIBxiTMT/coyB5mjZIPj13DYiz
         jyYfTuDHCP5LsEdXgAyyZplttF6ehDxENOE4J9BBh2ZmvUqM3hmSyrEtgm+zjph8Ns13
         0gob6edP9w03URklXL+YvTULFJRWw8f+bOvCMTEhb30ALrV4PfPY6t659Wj/sh1Gi3jd
         8BY2bdDy9agybmOi4RyjlWLpBpSvINouY7cygu9lBD42kzRN8DNpSB14K1gCedVpj6me
         mSXQ==
X-Forwarded-Encrypted: i=1; AL+hErF8t6ltLqg+mHz2HYrJbuXKZtdQbD8sNNtj+XZXVWd6YnVKFrSofgHNKZAwtzxp7r5JTxbwYAbReT/Q@vger.kernel.org
X-Gm-Message-State: APuU4Z8L98RGXcDh8tUGpJ/8DcRZyrBKU8LG9EcjyZ5uAb89uxZ7j8wb
	q79jeCOukDdE/2AFPxaR6bqbmrVeeQXf5hGVPPasqmNNkanuz4MwwuQGPvQPAHDH1JuJwCEQEFY
	guHqoTIIAEWCAhFH9RanudB1/w8eXPOg59AbT3OmTZHRQY6rJGwo0RElMBKP4xYmx
X-Gm-Gg: AYBFou1d1cNIVsbT8FMI3xtuEHQl7G2lcecTmAgc/xbiLuCeq0d3jrYKbZ1CFcJhM8Y
	JePup/v9u1+SipuwD55ANsVz1BWuP2wMc6MUi1mIFZVDkuPVBaRYT7zFLLoCjFrvYTAMqtAGyfd
	r6YmV7LSmPN6gM98/XKJtkXjI+ryioG7ZA6jiUvJaKLzqHpYPu26B5v/+GJZIJQuyblwFRBp6o+
	brWx7hWheSY1xgY0naUnPHvr1QVCyeos4mYAAz/E1ceV3ArP+V3C06yltpM+PbSl53EiDlD/cLS
	xN3w80LhH/J5/ARBJ3Jd/hMvlteR36OBLKITA5OlsTUjRZzigsVz+VR5W6J4fu6oA7oENytkEAJ
	Unn7yso4op7P/DxUy1ohlZpx5qmeuz6cNk9b5b4C5k+5sjR4ZRL3W0kiaTaIRNIY/G4sDSiYEFH
	osNUc=
X-Received: by 2002:a05:7023:884:b0:196:bf5f:8bb with SMTP id a92af1059eb24-1b39fecb7a4mr2270157c88.45.1794143938358;
        Sun, 08 Nov 2026 05:18:58 -0800 (PST)
X-Received: by 2002:a05:7023:884:b0:196:bf5f:8bb with SMTP id a92af1059eb24-1b39fecb7a4mr2270108c88.45.1794143937726;
        Sun, 08 Nov 2026 05:18:57 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:18:57 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:25 +0530
Subject: [PATCH v2 04/10] ptp: qcom: Add PTP driver for the Qualcomm TSC
 hardware
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-tscss-v2-4-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 7GplSCn1-zn1w3lnSeGPBrtGIMzq4F-z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX4qCemXWwNoGI
 TGc/V6J4UR7tb0f7BY28kGIpKx169v79SC2/E/uXEbzgiLfGtIyk6cZXRDVzdqkz7AhmFIv1rQC
 1Zdb1RAufM/Dp8XiiRU/I3W/6+hw3G0=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af076c3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Rr85-x1JmVOi0_aJw3EA:9 a=2EmZvc4mTCMxENTJ:21
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfXzLPO4PEfrNrs
 XS7yPVNON/ST2w8SxHwd0mR4Yn0UJ4fNVmPnocWzo8bAzEfZvGqdUendm2JrYuSTHBNhAArFZdC
 0Pjfbc1ghmFSDJpy3C99USOJ6cCygVtJC/QwC9kRN/g9ZL5VHYaHOE9/6hnf32JyiEiy7T+CUXs
 YHNh8xrC7zCUV8ylKeeTzsgj9/C7xF1osTsfv1dGfy6f8sMohne0oykbEQqI6CHoYkje4pNAfZD
 Ljr9Bb0OgSd3peHLsbG3OoH73Wq6Qm2NEM8L4Ximr1U2booUQ83hsoWs/j7K6wUPtLEblVo4oqG
 7Ao4EOwTj43uKJSm846kkSpROwunju2Vk6elCNE5yTU3gW9hD2PChCaSaXZ3BvV6qJucp0zKmBJ
 xkPE+0TMIViGJaRFotBix9U142pM8hH8he8GjOG+aV5SK+tTKSkNXMVG5nE8ZEzAMisTc55SoUr
 eSLsD5w/KSwY3dko0Mw==
X-Proofpoint-GUID: 7GplSCn1-zn1w3lnSeGPBrtGIMzq4F-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add a PTP Hardware Clock driver for the Qualcomm Timestamp Counter (TSC)
hardware found on Qualcomm SA8775P, QDU1000 and Nord SoCs. The TSC is a
free running hardware counter used for time synchronization, clocked by
an AHB configuration clock and a global counter clock, with the counter
resolution varying across SoCs.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/ptp/Kconfig        |  11 +
 drivers/ptp/Makefile       |   1 +
 drivers/ptp/ptp_qcom_tsc.c | 598 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 610 insertions(+)

diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index feb50f8cc406..91bc347b2c50 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -264,4 +264,15 @@ config PTP_NETC_V4_TIMER
 	  synchronization. It also supports periodic output signal (e.g. PPS)
 	  and external trigger timestamping.
 
+config PTP_QCOM_TSC
+	tristate "Qualcomm TSC as PTP clock"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on COMMON_CLK && PTP_1588_CLOCK
+	help
+	  This driver adds support for using the Qualcomm Timestamp Counter
+	  Subsystem (TSCSS) as a PTP clock.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called ptp_qcom_tsc.
+
 endmenu
diff --git a/drivers/ptp/Makefile b/drivers/ptp/Makefile
index bdc47e284f14..ff029323e98f 100644
--- a/drivers/ptp/Makefile
+++ b/drivers/ptp/Makefile
@@ -22,3 +22,4 @@ obj-$(CONFIG_PTP_1588_CLOCK_OCP)	+= ptp_ocp.o
 obj-$(CONFIG_PTP_DFL_TOD)		+= ptp_dfl_tod.o
 obj-$(CONFIG_PTP_S390)			+= ptp_s390.o
 obj-$(CONFIG_PTP_NETC_V4_TIMER)		+= ptp_netc.o
+obj-$(CONFIG_PTP_QCOM_TSC)		+= ptp_qcom_tsc.o
diff --git a/drivers/ptp/ptp_qcom_tsc.c b/drivers/ptp/ptp_qcom_tsc.c
new file mode 100644
index 000000000000..82ddbdd63389
--- /dev/null
+++ b/drivers/ptp/ptp_qcom_tsc.c
@@ -0,0 +1,598 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/iopoll.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/ptp_clock_kernel.h>
+#include <linux/platform_device.h>
+
+#define ROLLOVER_VAL				999999999
+#define NSEC_SHIFT				32
+#define PULSE_WIDTH_MASK			GENMASK(7, 6)
+#define DRIFT_MAX_RES				0x1FFFF
+#define DRIFT_JUMP_SWALLOW			BIT(31)
+#define DRIFT_PERIOD_MASK			GENMASK(28, 12)
+#define DRIFT_SUBPERIOD_MASK			GENMASK(11, 0)
+#define DRIFT_INTERVAL_US			10
+#define DRIFT_MIN_TIMEOUT_US			5000
+
+#define DRIFT_TIMEOUT_US(period, subperiod, cntr_res)			\
+	max_t(u64, div_u64((u64)(period) * (subperiod) * (cntr_res), NSEC_PER_USEC), \
+	      DRIFT_MIN_TIMEOUT_US)
+
+/* Dynamic (continuous) drift correction, used on Nord/Shikra */
+#define DRIFT_STATUS				BIT(1)
+#define DRIFT_DYNAMIC_EN			BIT(2)
+#define DYNAMIC_DRIFT_SUBPERIOD_MASK		GENMASK(27, 0)
+#define DYNAMIC_DRIFT_MIN_SUBPERIOD		6
+#define DYNAMIC_DRIFT_INCR_VAL			8
+#define DYNAMIC_DRIFT_POLL_US			10
+#define DYNAMIC_DRIFT_DISABLE_TIMEOUT_US	1000
+
+struct qcom_tsc_regs {
+	u32 control_cntcr;
+	u32 control_cntcv_lo;
+	u32 control_cntcv_hi;
+	u32 drift_correct_incr_val;
+	u32 drift_correct_duration;
+	u32 drift_correct_cmd;
+	u32 drift_correct_duration_2;
+	u32 drift_correct_cmd_2;
+	u32 rollover_val;
+	u32 offset_lo;
+	u32 offset_hi;
+	u32 read_cntcv_lo;
+	u32 read_cntcv_hi;
+};
+
+/**
+ * struct qcom_tsc_soc_data - SoC specific TSC hardware capabilities
+ *
+ * @rollover: indicates the counter uses sec/nsec split
+ * @offset_correction: hardware supports one-shot offset correction
+ * @dynamic_drift_correction: hardware supports continuous drift correction,
+ *                            instead of a one-shot jump/swallow correction
+ * @pulse_width: valid pulse width in cycles for drift correction
+ * @cntr_res: TSC counter resolution in nsec
+ * @reg_layout: register layout for this SoC/version
+ */
+struct qcom_tsc_soc_data {
+	bool rollover;
+	bool offset_correction;
+	bool dynamic_drift_correction;
+	int pulse_width;
+	int cntr_res;
+	const struct qcom_tsc_regs *reg_layout;
+};
+
+struct qcom_tsc {
+	struct device *dev;
+	void __iomem *base;
+	const struct qcom_tsc_soc_data *soc;
+	struct clk *ahb_clk;
+	struct clk *cntr_clk;
+	bool clocks_enabled;
+	struct ptp_clock *ptp;
+	struct ptp_clock_info ptp_info;
+	/* Mutex to protect operations from being interrupted */
+	struct mutex lock;
+};
+
+static bool qcom_tsc_is_enabled(struct qcom_tsc *tsc)
+{
+	const struct qcom_tsc_regs *regs = tsc->soc->reg_layout;
+
+	return readl_relaxed(tsc->base + regs->control_cntcr) & BIT(0);
+}
+
+static int qcom_tsc_read_time(struct qcom_tsc *tsc, struct timespec64 *ts)
+{
+	const struct qcom_tsc_regs *regs = tsc->soc->reg_layout;
+	u32 hi, lo;
+
+	if (!qcom_tsc_is_enabled(tsc))
+		return -EINVAL;
+
+	hi = readl_relaxed(tsc->base + regs->read_cntcv_hi);
+	lo = readl_relaxed(tsc->base + regs->read_cntcv_lo);
+
+	if (tsc->soc->rollover) {
+		ts->tv_sec = hi;
+		ts->tv_nsec = lo;
+	} else {
+		u64 ns = ((u64)hi << NSEC_SHIFT) | lo;
+
+		*ts = ns_to_timespec64(ns);
+	}
+
+	return 0;
+}
+
+static int qcom_tsc_gettime(struct ptp_clock_info *ptp, struct timespec64 *ts)
+{
+	struct qcom_tsc *tsc = container_of(ptp, struct qcom_tsc, ptp_info);
+	int ret;
+
+	mutex_lock(&tsc->lock);
+
+	if (!tsc->clocks_enabled) {
+		mutex_unlock(&tsc->lock);
+		return -EINVAL;
+	}
+
+	ret = qcom_tsc_read_time(tsc, ts);
+	mutex_unlock(&tsc->lock);
+
+	return ret;
+}
+
+static void qcom_tsc_split_ts(struct qcom_tsc *tsc, struct timespec64 ts, u32 *hi, u32 *lo)
+{
+	if (tsc->soc->rollover) {
+		*hi = ts.tv_sec;
+		*lo = ts.tv_nsec;
+	} else {
+		u64 ns = timespec64_to_ns(&ts);
+
+		*lo = lower_32_bits(ns);
+		*hi = upper_32_bits(ns);
+	}
+}
+
+static void qcom_tsc_clk_disable(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
+static int qcom_tsc_enable_clocks(struct qcom_tsc *tsc)
+{
+	int ret;
+
+	if (tsc->clocks_enabled)
+		return 0;
+
+	ret = clk_prepare_enable(tsc->ahb_clk);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(tsc->dev, qcom_tsc_clk_disable, tsc->ahb_clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(tsc->cntr_clk);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(tsc->dev, qcom_tsc_clk_disable, tsc->cntr_clk);
+	if (ret)
+		return ret;
+
+	tsc->clocks_enabled = true;
+
+	return 0;
+}
+
+static int qcom_tsc_update_counter(struct qcom_tsc *tsc, struct timespec64 ts)
+{
+	const struct qcom_tsc_regs *regs = tsc->soc->reg_layout;
+	u32 regval, hi, lo;
+
+	qcom_tsc_split_ts(tsc, ts, &hi, &lo);
+
+	writel_relaxed(lo, tsc->base + regs->control_cntcv_lo);
+	writel_relaxed(hi, tsc->base + regs->control_cntcv_hi);
+
+	regval = readl_relaxed(tsc->base + regs->control_cntcr);
+	regval |= BIT(0);
+	writel_relaxed(regval, tsc->base + regs->control_cntcr);
+
+	return 0;
+}
+
+static int qcom_tsc_update_offset(struct qcom_tsc *tsc, const struct timespec64 ts)
+{
+	const struct qcom_tsc_regs *regs = tsc->soc->reg_layout;
+	struct timespec64 tod;
+	u32 regval, hi, lo;
+	int ret;
+
+	if (tsc->soc->offset_correction) {
+		qcom_tsc_split_ts(tsc, ts, &hi, &lo);
+
+		writel_relaxed(lo, tsc->base + regs->offset_lo);
+		writel_relaxed(hi, tsc->base + regs->offset_hi);
+
+		return 0;
+	}
+
+	/*
+	 * No hardware offset correction support: disable and reload the
+	 * counter with the corrected time, as recommended by the hardware
+	 * design team.
+	 */
+	ret = qcom_tsc_read_time(tsc, &tod);
+	if (ret)
+		return ret;
+
+	regval = readl_relaxed(tsc->base + regs->control_cntcr);
+	regval &= ~BIT(0);
+	writel_relaxed(regval, tsc->base + regs->control_cntcr);
+
+	return qcom_tsc_update_counter(tsc, timespec64_add(tod, ts));
+}
+
+static int qcom_tsc_settime(struct ptp_clock_info *ptp, const struct timespec64 *ts)
+{
+	struct qcom_tsc *tsc = container_of(ptp, struct qcom_tsc, ptp_info);
+	const struct qcom_tsc_regs *regs = tsc->soc->reg_layout;
+	struct timespec64 tod;
+	u32 regval;
+	int ret;
+
+	mutex_lock(&tsc->lock);
+
+	ret = qcom_tsc_enable_clocks(tsc);
+	if (ret) {
+		mutex_unlock(&tsc->lock);
+		return ret;
+	}
+
+	if (qcom_tsc_is_enabled(tsc)) {
+		qcom_tsc_read_time(tsc, &tod);
+		ret = qcom_tsc_update_offset(tsc, timespec64_sub(*ts, tod));
+		mutex_unlock(&tsc->lock);
+		return ret;
+	}
+
+	/* Configure and enable the TSC counter */
+	regval = readl_relaxed(tsc->base + regs->control_cntcr);
+	regval &= ~PULSE_WIDTH_MASK;
+	regval |= FIELD_PREP(PULSE_WIDTH_MASK, tsc->soc->pulse_width);
+	writel_relaxed(regval, tsc->base + regs->control_cntcr);
+
+	if (tsc->soc->rollover)
+		writel_relaxed(ROLLOVER_VAL, tsc->base + regs->rollover_val);
+
+	ret = qcom_tsc_update_counter(tsc, *ts);
+	mutex_unlock(&tsc->lock);
+
+	return ret;
+}
+
+static int qcom_tsc_adjtime(struct ptp_clock_info *ptp, s64 delta)
+{
+	struct qcom_tsc *tsc = container_of(ptp, struct qcom_tsc, ptp_info);
+	int ret;
+
+	mutex_lock(&tsc->lock);
+
+	if (!tsc->clocks_enabled) {
+		mutex_unlock(&tsc->lock);
+		return -EINVAL;
+	}
+
+	ret = qcom_tsc_update_offset(tsc, ns_to_timespec64(delta));
+	mutex_unlock(&tsc->lock);
+
+	return ret;
+}
+
+static int qcom_tsc_drift_correction(struct qcom_tsc *tsc, long scaled_ppm)
+{
+	const struct qcom_tsc_soc_data *soc = tsc->soc;
+	const struct qcom_tsc_regs *regs = soc->reg_layout;
+	long ppb = scaled_ppm_to_ppb(scaled_ppm);
+	u64 period, incval = 0;
+	u32 regval = 0, subperiod;
+
+	if (ppb == 0)
+		return 0;
+
+	if (ppb < 0) {
+		ppb = -ppb;
+		regval &= ~DRIFT_JUMP_SWALLOW;
+
+		period = div_u64(ppb, soc->cntr_res);
+		if (period >= DRIFT_MAX_RES)
+			period = DRIFT_MAX_RES;
+	} else {
+		regval |= DRIFT_JUMP_SWALLOW;
+
+		period = div_u64(ppb, soc->cntr_res);
+		if (period >= DRIFT_MAX_RES) {
+			period = DRIFT_MAX_RES;
+			incval = soc->cntr_res * 2;
+		} else if (ppb < soc->cntr_res) {
+			incval = soc->cntr_res + ppb;
+			period = 1;
+		} else {
+			incval = soc->cntr_res * 2;
+		}
+	}
+
+	subperiod = soc->pulse_width * 2;
+	regval |= FIELD_PREP(DRIFT_SUBPERIOD_MASK, subperiod);
+	regval |= FIELD_PREP(DRIFT_PERIOD_MASK, period);
+
+	/* Update jump/swallow, period, subperiod */
+	writel_relaxed(regval, tsc->base + regs->drift_correct_duration);
+
+	writel_relaxed(incval, tsc->base + regs->drift_correct_incr_val);
+
+	/* Trigger the drift correction */
+	regval = readl_relaxed(tsc->base + regs->drift_correct_cmd);
+	regval |= BIT(0);
+	writel_relaxed(regval, tsc->base + regs->drift_correct_cmd);
+
+	return readl_poll_timeout(tsc->base + regs->drift_correct_cmd, regval,
+				  !(regval & BIT(1)), DRIFT_INTERVAL_US,
+				  DRIFT_TIMEOUT_US(period, subperiod, soc->cntr_res));
+}
+
+static bool qcom_tsc_dynamic_drift_type_matches(u32 duration, bool neg_adj)
+{
+	return !(duration & DRIFT_JUMP_SWALLOW) == neg_adj;
+}
+
+static void qcom_tsc_set_dynamic_drift_enable(struct qcom_tsc *tsc, u32 cmd, bool enable)
+{
+	const struct qcom_tsc_regs *regs = tsc->soc->reg_layout;
+
+	if (enable)
+		cmd |= DRIFT_DYNAMIC_EN;
+	else
+		cmd &= ~DRIFT_DYNAMIC_EN;
+
+	writel_relaxed(cmd, tsc->base + regs->drift_correct_cmd);
+}
+
+static int qcom_tsc_disable_dynamic_drift(struct qcom_tsc *tsc, u32 cmd)
+{
+	const struct qcom_tsc_regs *regs = tsc->soc->reg_layout;
+
+	qcom_tsc_set_dynamic_drift_enable(tsc, cmd, false);
+
+	return readl_poll_timeout(tsc->base + regs->drift_correct_cmd, cmd,
+				  !(cmd & DRIFT_STATUS), DYNAMIC_DRIFT_POLL_US,
+				  DYNAMIC_DRIFT_DISABLE_TIMEOUT_US);
+}
+
+static void qcom_tsc_program_dynamic_drift(struct qcom_tsc *tsc, u32 duration,
+					   bool neg_adj, u32 subperiod)
+{
+	const struct qcom_tsc_regs *regs = tsc->soc->reg_layout;
+
+	if (neg_adj)
+		duration &= ~DRIFT_JUMP_SWALLOW;
+	else
+		duration |= DRIFT_JUMP_SWALLOW;
+
+	writel_relaxed(duration, tsc->base + regs->drift_correct_duration);
+	writel_relaxed(DYNAMIC_DRIFT_INCR_VAL, tsc->base + regs->drift_correct_incr_val);
+	writel_relaxed(FIELD_PREP(DYNAMIC_DRIFT_SUBPERIOD_MASK, subperiod),
+		       tsc->base + regs->drift_correct_duration_2);
+}
+
+/*
+ * Unlike qcom_tsc_drift_correction()'s one-shot jump/swallow correction,
+ * hardware supporting dynamic drift correction keeps the correction
+ * continuously active across adjfine() calls. The subperiod can be updated
+ * in place while active, as long as the correction direction (jump vs
+ * swallow) is unchanged; otherwise the correction must be disabled and
+ * reprogrammed before being re-enabled.
+ */
+static int qcom_tsc_dynamic_drift_correction(struct qcom_tsc *tsc, long scaled_ppm)
+{
+	const struct qcom_tsc_regs *regs = tsc->soc->reg_layout;
+	long ppb = scaled_ppm_to_ppb(scaled_ppm);
+	bool neg_adj = ppb < 0;
+	u32 duration, cmd, subperiod;
+	int ret;
+
+	if (neg_adj)
+		ppb = -ppb;
+
+	cmd = readl_relaxed(tsc->base + regs->drift_correct_cmd);
+
+	if (ppb == 0) {
+		if (cmd & DRIFT_STATUS)
+			return qcom_tsc_disable_dynamic_drift(tsc, cmd);
+
+		return 0;
+	}
+
+	subperiod = NSEC_PER_SEC / ppb;
+	subperiod = clamp_val(subperiod, DYNAMIC_DRIFT_MIN_SUBPERIOD, DYNAMIC_DRIFT_SUBPERIOD_MASK);
+
+	duration = readl_relaxed(tsc->base + regs->drift_correct_duration);
+
+	if ((cmd & DRIFT_STATUS) && qcom_tsc_dynamic_drift_type_matches(duration, neg_adj)) {
+		writel_relaxed(FIELD_PREP(DYNAMIC_DRIFT_SUBPERIOD_MASK, subperiod),
+			       tsc->base + regs->drift_correct_duration_2);
+		return 0;
+	}
+
+	if (cmd & DRIFT_STATUS) {
+		ret = qcom_tsc_disable_dynamic_drift(tsc, cmd);
+		if (ret)
+			return ret;
+
+		cmd = readl_relaxed(tsc->base + regs->drift_correct_cmd);
+	}
+
+	qcom_tsc_program_dynamic_drift(tsc, duration, neg_adj, subperiod);
+	qcom_tsc_set_dynamic_drift_enable(tsc, cmd, true);
+
+	return 0;
+}
+
+static int qcom_tsc_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
+{
+	struct qcom_tsc *tsc = container_of(ptp, struct qcom_tsc, ptp_info);
+	int ret;
+
+	mutex_lock(&tsc->lock);
+
+	if (!tsc->clocks_enabled) {
+		mutex_unlock(&tsc->lock);
+		return -EINVAL;
+	}
+
+	if (tsc->soc->dynamic_drift_correction)
+		ret = qcom_tsc_dynamic_drift_correction(tsc, scaled_ppm);
+	else
+		ret = qcom_tsc_drift_correction(tsc, scaled_ppm);
+	mutex_unlock(&tsc->lock);
+
+	return ret;
+}
+
+static struct ptp_clock_info qcom_ptp_info = {
+	.owner		= THIS_MODULE,
+	.name		= "PTP_QCOM_TSC",
+	.max_adj	= 9999999,
+	.adjfine	= qcom_tsc_adjfine,
+	.adjtime	= qcom_tsc_adjtime,
+	.gettime64      = qcom_tsc_gettime,
+	.settime64      = qcom_tsc_settime,
+};
+
+static const struct qcom_tsc_regs qcom_tsc_layout = {
+	.control_cntcr            = 0x0,
+	.control_cntcv_lo         = 0x8,
+	.control_cntcv_hi         = 0xc,
+	.drift_correct_incr_val   = 0x2c,
+	.drift_correct_duration   = 0x30,
+	.drift_correct_cmd        = 0x34,
+	.rollover_val             = 0x3c,
+	.offset_lo                = 0x50,
+	.offset_hi                = 0x54,
+	.read_cntcv_lo            = 0x1000,
+	.read_cntcv_hi            = 0x1004,
+};
+
+static const struct qcom_tsc_regs qcom_tsc_layout_v2 = {
+	.control_cntcr            = 0x0,
+	.control_cntcv_lo         = 0x8,
+	.control_cntcv_hi         = 0xc,
+	.drift_correct_incr_val   = 0x2c,
+	.drift_correct_duration   = 0x30,
+	.drift_correct_duration_2 = 0x34,
+	.drift_correct_cmd        = 0x38,
+	.drift_correct_cmd_2      = 0x3c,
+	.rollover_val             = 0x44,
+	.offset_lo                = 0x50,
+	.offset_hi                = 0x54,
+	.read_cntcv_lo            = 0x1000,
+	.read_cntcv_hi            = 0x1004,
+};
+
+static const struct qcom_tsc_soc_data qcom_tsc_sa8775p = {
+	.reg_layout		= &qcom_tsc_layout,
+	.rollover		= false,
+	.offset_correction	= false,
+	.pulse_width		= 2,
+	.cntr_res		= 64,
+};
+
+static const struct qcom_tsc_soc_data qcom_tsc_qdu1000 = {
+	.reg_layout		= &qcom_tsc_layout,
+	.rollover		= true,
+	.offset_correction	= true,
+	.pulse_width		= 3,
+	.cntr_res		= 2,
+};
+
+static const struct qcom_tsc_soc_data qcom_tsc_nord = {
+	.reg_layout		= &qcom_tsc_layout_v2,
+	.rollover		= false,
+	.offset_correction	= true,
+	.dynamic_drift_correction = true,
+	.pulse_width		= 3,
+	.cntr_res		= 4,
+};
+
+static const struct of_device_id qcom_tsc_of_match[] = {
+	{ .compatible = "qcom,sa8775p-tscss", .data = &qcom_tsc_sa8775p },
+	{ .compatible = "qcom,qdu1000-tscss", .data = &qcom_tsc_qdu1000 },
+	{ .compatible = "qcom,nord-tscss", .data = &qcom_tsc_nord },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_tsc_of_match);
+
+static int qcom_ptp_tsc_probe(struct platform_device *pdev)
+{
+	const struct qcom_tsc_soc_data *soc;
+	struct qcom_tsc *tsc;
+	int ret;
+
+	soc = of_device_get_match_data(&pdev->dev);
+	if (!soc)
+		return -ENODEV;
+
+	tsc = devm_kzalloc(&pdev->dev, sizeof(*tsc), GFP_KERNEL);
+	if (!tsc)
+		return -ENOMEM;
+
+	tsc->dev = &pdev->dev;
+	tsc->soc = soc;
+
+	ret = devm_mutex_init(&pdev->dev, &tsc->lock);
+	if (ret)
+		return ret;
+
+	tsc->base = devm_platform_ioremap_resource_byname(pdev, "tsc");
+	if (IS_ERR(tsc->base))
+		return PTR_ERR(tsc->base);
+
+	/* Both clocks are enabled on first use, when the counter is set */
+	tsc->ahb_clk = devm_clk_get(&pdev->dev, "ahb");
+	if (IS_ERR(tsc->ahb_clk))
+		return PTR_ERR(tsc->ahb_clk);
+
+	tsc->cntr_clk = devm_clk_get(&pdev->dev, "cntr");
+	if (IS_ERR(tsc->cntr_clk))
+		return PTR_ERR(tsc->cntr_clk);
+
+	tsc->ptp_info = qcom_ptp_info;
+
+	tsc->ptp = ptp_clock_register(&tsc->ptp_info, &pdev->dev);
+	if (IS_ERR(tsc->ptp))
+		return dev_err_probe(&pdev->dev, PTR_ERR(tsc->ptp),
+				      "Failed to register ptp clock\n");
+
+	platform_set_drvdata(pdev, tsc);
+
+	return 0;
+}
+
+static void qcom_ptp_tsc_remove(struct platform_device *pdev)
+{
+	struct qcom_tsc *tsc = platform_get_drvdata(pdev);
+
+	if (tsc && tsc->ptp) {
+		ptp_clock_unregister(tsc->ptp);
+		tsc->ptp = NULL;
+	}
+}
+
+static struct platform_driver qcom_ptp_tsc_driver = {
+	.probe  = qcom_ptp_tsc_probe,
+	.remove = qcom_ptp_tsc_remove,
+	.driver = {
+		.name = "qcom_ptp_tsc",
+		.of_match_table = qcom_tsc_of_match,
+	},
+};
+module_platform_driver(qcom_ptp_tsc_driver);
+
+MODULE_DESCRIPTION("PTP QCOM TSC driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

