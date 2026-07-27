Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF0530568D
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161515; cv=none; b=WEvn6VLOBCdsB7CSy6jfL8j60aushL978N3jpqx2+pIb/cN0cZUYr4evHc7RF1C9ETnj2j25HHweTX/8bi1VdkoTDYWlMcp7xXzjmOyVT4369xmfM41B0/RvkAUrs5d92AboF+q1Pv4f0CdJ2fIha+MSGHRt9v0/sfv17FbRdFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161515; c=relaxed/simple;
	bh=J3/FslZeXvF1hQA687dDy7g7sg3gktD5SIW96+lNrLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sryTw6+2nYeXUw2XVVf/BntlDSVUagIzXEbEeCHZ1aa2pKRZWsaIPlkhjtncCHBSciNgdakcfEJcjeyY0seBR2Iez8aihXqAoyR6J4AEQpdiZxhgHyQ4/W8+FypIJipbjSht9lzhbbm0sRyUHJllvo7lpuExH5/m596ihGaKgx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IyINozOI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/9KcqTc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IyINozOI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/9KcqTc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlXor855701
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Axk35BRvKnxYf82KyO60grXp2umHgw5Lx1L6tsjMvH4=; b=IyINozOIfGtXDcsG
	F6C7fKcMX2qkT6saFoazNMtjbo3CnpQGCHYQAq8ogzwyhZ8IgDzknCl08JcxoXid
	3eqKHTgdxt2NMaIF6ovFyK7rNhLvGVt1N0Nh0QvD5yjo4W51BPNIS4C2FvVzYPtX
	tOD+Qyl69BcRjvLe2rrm3Pgc1BK/wH3f3lP64ZNiL1HkDffQZXgJnLaA//3tD5PC
	cBgdfgosLLVNumkOGubJn8vP4fQnUSwX/KJdweGFPRWCujKLdLYcua+tC3j0rVXw
	xlVIeDLb3f4G1Q7PP/x/TeuMFVYUBk1DCGA1mz5onG+TnsgZypogxnnX7HT8s0ar
	zzTuZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wjajs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:11:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc86a9ef97so54406795ad.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161512; x=1785766312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Axk35BRvKnxYf82KyO60grXp2umHgw5Lx1L6tsjMvH4=;
        b=j/9KcqTcEoBn3b/xI7TEh0assiQg2RS9rE1QuVxolz2Ay7RcKrbcEr++aKaYjqOq5a
         DgFmg+6O5e+B2Romc8M3PcCcRRbi5CH9Umq7FsLwygqAupjInPqOj8NZyEbspSk21Arn
         o2tXih+joHZYmjXbD6HC/Z89kto8yAAFG2ZROqkKuj7TQf2KfvVCn0022I3WMOe0gnhx
         4FAHGmk70R4QcxnXTC7Wvd0C7UVN+YOvnZeXjdr/SyG6UCWYEnMKYxzJcXbfJ8ElDWsb
         AYQmImrhM5eoo7iaXOB2kPiqC7szKnhUwW7eCj+Wixs7I6U3yrl7R/B5UVen0z96rZAo
         uwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161512; x=1785766312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Axk35BRvKnxYf82KyO60grXp2umHgw5Lx1L6tsjMvH4=;
        b=DkZ0N3jcN/6BYV7bDctoY6wHtTi1eOPARtExqBJNNEH0vomFeFpoFWlU2som8SdiXw
         7bC+xJoNNafMQRKtRW9Ar+r9A5Wsvz7nGXjj2P8kdLfeaggnqbDS44hoOABZXv5Koxfs
         1wSlslaQhTBKWIqr7VB5kTz4TzsdrlfoeN8CW9Gzze7ZP0Po9t2WEOd33a+n8YgBILxe
         PcmoO5cIWo54s5dCi3/m9OJIBRfou3bwzt8n6W0dQSWPraZBS5VPYZIp1tgjtZduQYPi
         7XbFTTpLwSHetXz9v/Xqu9MX1h69Os2NrMbBbNYWzJ6cDtSaQqrhmioR2seqdlJ1szk5
         C+Mg==
X-Forwarded-Encrypted: i=1; AHgh+RqwOVDpbLvfd0dMqlYgoekVt19fkfnaSucphCXPORjK6JPE3w0doa6JS9CNN4osBX3eJamJOBmqqsFV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1AWZXa7IvqclpGSbbRMAQr98knCmSAYhQpTJV4JC+dULKET4r
	6vyfezEYUqoHJVlT4L/JuGS/iO73UuYF8uZK/DCXpSUG4Fo12TMZUM6Ae6Jd+wUuI9Sql9547dT
	xMHdeaNq67CxE4Nu+15u3C85SyI0AM7XXG7oIuYKfcCLlI9FlD+/6qxZ5FFG92Kn3
X-Gm-Gg: AR+sD13OWFBVBcTTH3CZpg8FelPjWQ9ntle2M1NxbRNypGa+baFSi7VIeIPmE7troC6
	2LQAeDm074q+uAeNdxyBhlfTrrtbIEthrYvhGUCINIGHHvJ12zn3HXNkei/kDgdSHgznzzZ0SOy
	sz47kfIDspSRKM9qke1pMWoRFMiYq94J7uJH1xV62VxSWv9adjdlTx1xwTOvjlM5jIusXH3g9oR
	jJgQiMr2TvMLCGKksrsd0aQ6hjsWaEO8KXDqvZZO45pJYXeF+3TaLnhV4VONDaPpY/Qqw9q9F1F
	BxSDtNzomFQxGtCZUHMJgFq2EC2dhU6RDo+GNqq/NcUx7yUc3e24/cJylAB9vI3QgzhixZXEyDT
	6tQujVjPv0RtdwakFspf7TH7s+GsBors=
X-Received: by 2002:a17:90b:3912:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38f60486a1fmr901812a91.6.1785161511644;
        Mon, 27 Jul 2026 07:11:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3912:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38f60486a1fmr901792a91.6.1785161511114;
        Mon, 27 Jul 2026 07:11:51 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm53438677eec.13.2026.07.27.07.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:11:50 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:40:59 +0530
Subject: [PATCH 3/6] ptp: qcom: Add PTP driver for the Qualcomm TSC
 hardware
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-tscss-v1-3-beed14e72510@oss.qualcomm.com>
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
In-Reply-To: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX8xf270dMIvhF
 y2w8IUvEWbFHz/iKHT2ajLm8qDK2PYaTITyudNHSfG+Gi7jL2nfCfDanEN+SNc5b/5Ul0tWew6L
 DNyIzGVWXXUDkC9Na5Vi+OoAWPFZ3z2lqqhstcbLJN31Trbk4V4Y/4x6La4yuKPKg6hScqbk+jp
 wFq+Iw1uDmtpMhUzUbDk2XdxlkPYSwBXskUNDd0WFe+BdtGiWa3ZEl3VhNG/D3bMUiwBawpK72c
 7vpR+z0rYzSaRQ52Xn6dxKHMGllR5BPpZhmsGIo/WU8nHodVq4Ri5XAKbRWqbyt/b9x2ApsxWZ7
 vzmPkh5/7lEPAZWBlMW/cF9UjzlnYitD6EGNzVhtbztWGlUrZd8dEVXU1GT8BT5wtYwymc2PdjY
 11FK0KFqzxbOuiFeIU+sPfztvyLoFwwO1TTQnEq1nDSdSDVaaRTmBLDErVL3/g+mtTyhZ737mkn
 hb7ZmKqhGq19syqUY7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX0PMy8rY/XoV/
 Lp/XggVyHZQnVPZUT7OTEvNi5iV44WhF8FDBcZfFW9o1xIcORbJhDL1zUrfSGGMaY0VcTml/BgC
 BDm5C/k2PbuQws3TpRCaegijLbOOyYk=
X-Proofpoint-ORIG-GUID: m24At2M_tvfNITRCdYwVB3JZmZEDfwMv
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a676728 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=s8D5YFcVUybaX_pMzJwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: m24At2M_tvfNITRCdYwVB3JZmZEDfwMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270135

Add a PTP Hardware Clock driver for the Qualcomm Timestamp Counter (TSC)
hardware found on Qualcomm Lemans and QDU1000 SoCs. The TSC is a free
running hardware counter used for time synchronization, clocked by an AHB
configuration clock and a global counter clock, with the counter resolution
varying across SoCs.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/ptp/Kconfig        |  10 ++
 drivers/ptp/Makefile       |   1 +
 drivers/ptp/ptp_qcom_tsc.c | 413 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 424 insertions(+)

diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index b93640ca08b7286fd4298519a17d1daf19056498..d3ceb1ee01a505cdd0bd056649d245308fc9f140 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -263,4 +263,14 @@ config PTP_NETC_V4_TIMER
 	  synchronization. It also supports periodic output signal (e.g. PPS)
 	  and external trigger timestamping.
 
+config PTP_QCOM_TSC
+	tristate "Qualcomm TSC as PTP clock"
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
index bdc47e284f14e7e77460ccf4ea30ab20c6df4fe4..ff029323e98f5e7ced55b5000e8555929a6e8e54 100644
--- a/drivers/ptp/Makefile
+++ b/drivers/ptp/Makefile
@@ -22,3 +22,4 @@ obj-$(CONFIG_PTP_1588_CLOCK_OCP)	+= ptp_ocp.o
 obj-$(CONFIG_PTP_DFL_TOD)		+= ptp_dfl_tod.o
 obj-$(CONFIG_PTP_S390)			+= ptp_s390.o
 obj-$(CONFIG_PTP_NETC_V4_TIMER)		+= ptp_netc.o
+obj-$(CONFIG_PTP_QCOM_TSC)		+= ptp_qcom_tsc.o
diff --git a/drivers/ptp/ptp_qcom_tsc.c b/drivers/ptp/ptp_qcom_tsc.c
new file mode 100644
index 0000000000000000000000000000000000000000..b29248150388f32f2c2d211f69c11599dc743d78
--- /dev/null
+++ b/drivers/ptp/ptp_qcom_tsc.c
@@ -0,0 +1,413 @@
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
+struct qcom_tsc_regs {
+	u32 control_cntcr;
+	u32 control_cntcv_lo;
+	u32 control_cntcv_hi;
+	u32 drift_correct_incr_val;
+	u32 drift_correct_duration;
+	u32 drift_correct_cmd;
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
+ * @pulse_width: valid pulse width in cycles for drift correction
+ * @cntr_res: TSC counter resolution in nsec
+ * @reg_layout: register layout for this SoC/version
+ */
+struct qcom_tsc_soc_data {
+	bool rollover;
+	bool offset_correction;
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
+	struct clk *etu_clk;
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
+	ret = qcom_tsc_read_time(tsc, ts);
+	mutex_unlock(&tsc->lock);
+
+	return ret;
+}
+
+static inline void qcom_tsc_split_ts(struct qcom_tsc *tsc, struct timespec64 ts, u32 *hi, u32 *lo)
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
+	if (qcom_tsc_is_enabled(tsc)) {
+		qcom_tsc_read_time(tsc, &tod);
+		ret = qcom_tsc_update_offset(tsc, timespec64_sub(*ts, tod));
+		mutex_unlock(&tsc->lock);
+		return ret;
+	}
+
+	/* Configure and enable the TSC counter */
+	regval = readl_relaxed(tsc->base + regs->control_cntcr);
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
+static int qcom_tsc_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
+{
+	struct qcom_tsc *tsc = container_of(ptp, struct qcom_tsc, ptp_info);
+	int ret;
+
+	if (scaled_ppm == 0)
+		return 0;
+
+	mutex_lock(&tsc->lock);
+	ret = qcom_tsc_drift_correction(tsc, scaled_ppm);
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
+static const struct qcom_tsc_soc_data qcom_tsc_lemans = {
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
+static const struct of_device_id qcom_tsc_of_match[] = {
+	{ .compatible = "qcom,lemans-tscss", .data = &qcom_tsc_lemans },
+	{ .compatible = "qcom,qdu1000-tscss", .data = &qcom_tsc_qdu1000 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_tsc_of_match);
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
+static int qcom_ptp_tsc_probe(struct platform_device *pdev)
+{
+	const struct qcom_tsc_soc_data *soc;
+	struct qcom_tsc *tsc;
+	struct resource *r_mem;
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
+	r_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tsc");
+	if (!r_mem) {
+		dev_err(&pdev->dev, "no IO resource defined\n");
+		return -ENXIO;
+	}
+
+	tsc->base = devm_ioremap_resource(&pdev->dev, r_mem);
+	if (IS_ERR(tsc->base))
+		return PTR_ERR(tsc->base);
+
+	tsc->ahb_clk = devm_clk_get_enabled(&pdev->dev, "ahb");
+	if (IS_ERR(tsc->ahb_clk))
+		return PTR_ERR(tsc->ahb_clk);
+
+	tsc->cntr_clk = devm_clk_get_enabled(&pdev->dev, "cntr");
+	if (IS_ERR(tsc->cntr_clk))
+		return PTR_ERR(tsc->cntr_clk);
+
+	/* ETU clock is optional, only required when the ETU block is used */
+	tsc->etu_clk = devm_clk_get_optional_enabled(&pdev->dev, "etu");
+	if (IS_ERR(tsc->etu_clk))
+		return PTR_ERR(tsc->etu_clk);
+
+	tsc->ptp_info = qcom_ptp_info;
+
+	tsc->ptp = ptp_clock_register(&tsc->ptp_info, &pdev->dev);
+	if (IS_ERR(tsc->ptp)) {
+		ret = PTR_ERR(tsc->ptp);
+		dev_err(&pdev->dev, "Failed to register ptp clock\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, tsc);
+
+	return 0;
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

