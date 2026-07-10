Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B623DB328
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674302; cv=none; b=LEjp5gbOYVOHDI4wwqpUnulnLKG1kfF5WXB6NQWH9Xb67eEUcTb3dCK+cu7xlMWmBEGTiWV7vUOFT8Gospc4Po9XxYx6mR2N60GGU5WWx0LKWeePzYq/DDGhItGn4FdTaQHdbleHV7DMJCFv3Lio167KYQB6FPFLro6KSE8G9To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674302; c=relaxed/simple;
	bh=QBbw+M6NM/7xN/mb/n4EhswLHY92P8G06BHphqlIqXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZAt4Bqi2WisJR5s4PppAb6YqGvHK8VR5LBRIPdwzvf2oTkTGlovy75mLDJtMreHYQAgA+p9uRqE1kSuroXfVbaski+kA6lmibT9p14Kd1N46bmRRszs2b6jevwX2UESJo6lorp1fNXq1PKK+LWwZVfBFY1Y0jZ9SZkBuvczubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irvF8Mfa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVBgYIOG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irvF8Mfa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVBgYIOG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dap0140878
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9beixJbeJJsoRWLUTkdRDRxoNyd2rNMiM72fJceYNRM=; b=irvF8MfaPyLrVmL6
	M+CIBFXO5yeirklARUCZDXTEV6g6ouCgEvsMrvecDmv2fuHYF87HhvhWG354WAcE
	ggjegVmBklfvX/KO1Dw80cTdXKCy3ITk1+COfVBsNv49dI8UnA5HvIaRMOayOat9
	9zXpJ9Ngj/aQVo/oUdU3Jy3mCsEMwxOIntmq//yI/qGYhN2d7MQ95PVxMa72caYH
	k8uC4wsfUOEtTsrvHf7WpNN4m+aRvTOVh26MXbdiRnuoIVkg2xjN34Sqj/jZOzSS
	gN88zk48iHQchDsngOTdLgn54H8Wy+CAaBLgdC7I9xKXKdApXeFcL+kJnvhkYDYS
	7ljBqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpm8ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:04:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c12e43b98so8195041cf.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674298; x=1784279098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9beixJbeJJsoRWLUTkdRDRxoNyd2rNMiM72fJceYNRM=;
        b=bVBgYIOG321ZEjaVPvSyq62iCy7sc4GLVP6A1/3zUq7k8gVEFn01mKPVdpx2bwv5u3
         7wkuujmxc4hdarqnBm33lRI2U3YiIpqjPNbPhFOLL8mRO16kQ7QrpkensCsJcoYVU6Z7
         5Q/b6fauXiRgvs21bxKf0n+0l+QsXDOQk/dFJqlo2PDr0RQNIZt5o5nv+Bl/0PbgawmJ
         OkEQfnQ2vMNfgiHaI5DV2EaqV1qAZ8RQqcuDvFd4RDPP3oGjc3LnwArS9s4KImkZWr6S
         b/eGg6YCRAAFDGINdlqXzEtyOcURDk3C92dIqigVgUwqLHEP09ltqAvkd0zJ3KYFRWuZ
         9z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674298; x=1784279098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9beixJbeJJsoRWLUTkdRDRxoNyd2rNMiM72fJceYNRM=;
        b=mGjYej0PmbpjW/LVNA8UV27VQVlxmE87fALAl/VE6FlIjg/N6iPjsLjENZasOrTZ8V
         5fNyt23qsdQ40TjxVqLhZE1DiCi0daS89WejFpvCIOvGMtLyrbkt0+boHKpNlgXROU8B
         DyckRhShCdYw0vxczSn8SNbNkMQThrOwe6M9yDPhyij9COqwrbK4WQSAexdvAZzYDjQG
         3ZWel4AHtJRf9c8fely+qwBWxiMY3E3YsZqRXAoe31G2kihkmR0c5pVfWzZgT4lF2T5g
         6w23/enzgl3V+5/bocBExoWdp664acmXkYNiNUy/tSRx6wTqSa4TGiOshf9ez2brs50E
         PIPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGl9Ox44A9QWzvVc13ApuLpTkWFF+AHv7Mq/+F0zoGrvEyVflkaT3aWNeAquo/L2TVrshzVu2qlBt3@vger.kernel.org
X-Gm-Message-State: AOJu0YweZ5pGPcnXJCSavtpJfZyy5lFmWxynpf7NyFq4/iTP7VfD2t8z
	joeV0Eda6sZx8nK/53/62d0zxP9NQJRNooFRbJ1Hwdd0XVTQAP+RZ8yXwelo63lwZpS/AzuBZlM
	AgC5XEhHrbkgjhCpQZWwJS0PveD5qFd6JueI3SQ3S8xEtfQeXKynukw5Vnjr17+wVNv9RPSaHTP
	s=
X-Gm-Gg: AfdE7clMnkK93Kgtj7qFURBFfJ5rWIbsjsMxwnQZXb1ohHVGNg7/3eRrR/tW7G696tl
	Udkex+VYRlx9OMhVEJuoTmvsKTtsRBRiMzWq7Qkze9/iivmn1OP47eAIYpfWGUnVPv1U73HUK+m
	v3bHWIix8bMTF+8wIlKpHZdfaadCwzna22uibzCpOZ08eVt3QdjGltJAi7TjBpWta0nNCMU+Gww
	TF9geY/qhWfXi6EkdV2+OVeHNN/yZvJnMZRie0TkN5BivZ0PvluJfKPz8ckPWq0rVzmkl07Qkh1
	zvj95c8rrjLN79et1AIfNOOcZMLuD2uuly6QiFOkR4O8UI9UKD4B/+NJaA6Gv2RmgOnckG3u+1N
	3t7+JUPR7oEjZo/2rFy/TCOJPn/aWUpEWkMuFui2ksOp0fp3LT5eCCxBCgufXgW59vVZCGsXvNI
	eEzBX7CAdAga2hQCrBfuhLK/DY86v/JI2biuTYH221zJa6K0yfxdjE3Je11qBMdg==
X-Received: by 2002:ac8:7d85:0:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-51c8b438a5cmr111756911cf.78.1783674298048;
        Fri, 10 Jul 2026 02:04:58 -0700 (PDT)
X-Received: by 2002:ac8:7d85:0:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-51c8b438a5cmr111756501cf.78.1783674297528;
        Fri, 10 Jul 2026 02:04:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:04:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:04:48 +0200
Subject: [PATCH v4 2/7] media: qcom: camss: Add camss-params helper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-camss-isp-ope-v4-2-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
In-Reply-To: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX4rllvhd+5Qs/
 3Fkti+9SAbVvFhewiyS82qNc86xpRDvJ5oh1Zw0EjCiwIqKru4NILwCnfsdMfCJUs0IhUg6TYiY
 VpYa1QzJ335fNfc2grTXtQK1t/UkCGXoLo0R4E6eFaw17YaM9V7QKEiHEmkAKtCUHZMN+CVs4iq
 4EyYpnQP/4zZfC6VulEHQ4AvXJQnFymAGkA8c7TRFVPs51AKmN37+o+81Xkbul7Ah7NUAcV7oZ2
 wKyi7dgfIuzjEXkkvVhAtHjqiQHi1olP2N2juWb+gb2u1qch7gLi36xqEumK9OFV6B3y2vp1HfK
 nK4qe96IC1WG70cYeb6+TkSKrIkNcYUn6fJ/vq8iehVM+K/84JulXzEGzRuGTXvKjinmvz43Ia1
 1kV4AAGx6hltst/1Qifjm+TNi3oPLHBIDCIoE80aszkercGoRdbgkIcocyCaJXC/MH7Pf+7MKyE
 utDPrDDUtZ41uSY/Wnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX3D8Tpime6ipy
 LOL28CblY3qgM3SheAj35jTZ4qtCOcd0bidUWZ6wIhH0hbWZrqRUWx4HzvG9AIknnYnBlFYh9jf
 K+xeQzNtW5Dy+aXwpM4Qz9Jc/HyIZY8=
X-Proofpoint-GUID: Z9JFami0CJvKgX57HgzrF_DctwOKEvoH
X-Proofpoint-ORIG-GUID: Z9JFami0CJvKgX57HgzrF_DctwOKEvoH
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a50b5ba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ELVW7ba-Z2avb-AJsJIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100088

Add V4L2 ISP parameter buffer validation helpers for CAMSS ISP drivers.
Provides buffer size validation and per-block type validation for the
extensible V4L2 ISP parameters buffer format.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile       |  1 +
 drivers/media/platform/qcom/camss/camss-params.c | 67 ++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-params.h | 62 ++++++++++++++++++++++
 3 files changed, 130 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 0d133ddc08be088678994820c0ac64e761884611..5678621efb6780b67a043ec8a2e914cce02d9b98 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -28,5 +28,6 @@ qcom-camss-objs += \
 		camss-video.o \
 		camss-format.o \
 		camss-pipeline.o \
+		camss-params.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
diff --git a/drivers/media/platform/qcom/camss/camss-params.c b/drivers/media/platform/qcom/camss/camss-params.c
new file mode 100644
index 0000000000000000000000000000000000000000..ebb75a191d37551b4616a048ed39408f219d7daa
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-params.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-params.c
+ *
+ * CAMSS ISP parameter buffer parser.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <media/videobuf2-core.h>
+#include <media/v4l2-isp.h>
+
+#include "camss-params.h"
+
+int camss_isp_params_apply(struct device *dev,
+			   struct vb2_buffer *vb,
+			   const struct v4l2_isp_params_block_type_info *type_info,
+			   const camss_isp_params_handler_fn *handlers,
+			   unsigned int num_handlers,
+			   void *priv)
+{
+	const struct v4l2_isp_params_buffer *buf;
+	unsigned int remaining;
+	unsigned int offset = 0;
+	int ret;
+
+	ret = v4l2_isp_params_validate_buffer_size(dev, vb,
+					v4l2_isp_params_buffer_size(CAMSS_PARAMS_MAX_PAYLOAD));
+	if (ret)
+		return ret;
+
+	buf = vb2_plane_vaddr(vb, 0);
+
+	ret = v4l2_isp_params_validate_buffer(dev, vb, buf, type_info, num_handlers);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "params: version=%u data_size=%u\n", buf->version, buf->data_size);
+
+	remaining = buf->data_size;
+
+	while (remaining >= sizeof(struct v4l2_isp_params_block_header)) {
+		const union camss_isp_params_block *block =
+			(const union camss_isp_params_block *)&buf->data[offset];
+		u16 type  = block->header.type;
+		u32 bsize = block->header.size;
+
+		if (type < num_handlers && handlers[type])
+			handlers[type](priv, block);
+		else
+			dev_dbg(dev, "params: no handler for block type %u\n", type);
+
+		offset += bsize;
+		remaining -= bsize;
+	}
+
+	dev_dbg(dev, "params: buffer parsed successfully\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(camss_isp_params_apply);
+
+MODULE_DESCRIPTION("CAMSS ISP parameter buffer parser");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/camss/camss-params.h b/drivers/media/platform/qcom/camss/camss-params.h
new file mode 100644
index 0000000000000000000000000000000000000000..058e3f158b42d39512301d412a983fb2f34dab21
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-params.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-params.h
+ *
+ * CAMSS ISP parameter buffer parser.
+ *
+ * Wraps the upstream v4l2_isp_params_validate_buffer() validation and adds
+ * a dispatch layer: after validation each block is forwarded to a
+ * driver-supplied handler.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef CAMSS_PARAMS_H
+#define CAMSS_PARAMS_H
+
+#include <linux/types.h>
+#include <media/v4l2-isp.h>
+#include <uapi/linux/camss-config.h>
+
+#define CAMSS_ISP_PARAMS_FMT_INIT \
+	{ .fourcc = V4L2_META_FMT_QCOM_ISP_PARAMS, .depth = 8, .align = 0, .num_planes = 1 }
+
+#define CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY   (1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
+
+struct device;
+struct vb2_buffer;
+struct camss_isp_fmt;
+
+union camss_isp_params_block {
+	struct v4l2_isp_params_block_header header;
+	struct camss_params_wb_gain         wb_gain;
+	struct camss_params_chroma_enhan   chroma_enhan;
+	struct camss_params_color_correct  color_correct;
+};
+
+typedef void (*camss_isp_params_handler_fn)(void *priv, const union camss_isp_params_block *block);
+
+/**
+ * camss_isp_params_apply - validate and dispatch a params buffer
+ *
+ * @dev:          device for error logging
+ * @vb:           the vb2 buffer (used for size validation)
+ * @type_info:    per-block-type validation info, indexed by block type
+ * @handlers:     per-block-type handlers, indexed by block type
+ * @num_handlers: number of entries in @type_info and @handlers
+ * @priv:         opaque pointer forwarded to each handler
+ *
+ * Calls v4l2_isp_params_validate_buffer_size(), then
+ * v4l2_isp_params_validate_buffer(), then walks the validated block stream
+ * dispatching each block to its handler.
+ *
+ * Returns 0 on success, negative errno on validation failure.
+ */
+int camss_isp_params_apply(struct device *dev,
+			   struct vb2_buffer *vb,
+			   const struct v4l2_isp_params_block_type_info *type_info,
+			   const camss_isp_params_handler_fn *handlers,
+			   unsigned int num_handlers,
+			   void *priv);
+
+#endif /* CAMSS_PARAMS_H */

-- 
2.34.1

