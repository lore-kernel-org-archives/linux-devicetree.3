Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C183B1035
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108767; cv=none; b=RgzEbyFX4r2QLWjDynFdIvi+zgIIYy/zzXbDFAjT/5njllU49Jqn8o6FUZy6dFbkxpGSLRrdHna60xqH3NtfoRR6Sr6cNReWEv8qIqIZxUlQMqfz5DAIVQXUn5L580QBKWTDETfXgf+mTZgeFzj2GB4Wl6WE0By/AtfeVODp+6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108767; c=relaxed/simple;
	bh=N30ql1CGm+ccNkC77iZPDzsGhYzy47Anv6iw4X4OkKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ueIk9HnMNMgvq69AFeRowdrh7ENEi8dr8Nhd3oVDBM0QKUv/KPGLFjJ5MwgQOOS0l5KeHpK+kahJIp5rDiiZJgZDnbl0uXE9uhSQ4bgjjZttc3NAGiPNvn+n1sM5qhlDdt3NZ17Rl4lgCv7Ppo/AkvjiyktW7Pd+YFWfqt8qAdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=coYq3TXj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EEqaZKyH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="coYq3TXj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EEqaZKyH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI72311153693
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0TuA+c4Zv64r9WkUq7tKxzf0rVkTnrTTJFn59aPv+Sk=; b=coYq3TXjRQ9aK7F+
	wTRCrbpcZFvMr7L6vo0GHj4jMo6pZSIs9ZHWATLffDLV6YY5AntUz75hPs4qv1wT
	McNaaosNwsZAVYzHMXWmOv3NzSGzCcIRAoLhZwulO36/06yv7gQoByI47QfEawL4
	YRRq3nvJlRggs16udBzsiRmc4S1yoEV5JDIOiJmrU42k7sOYovWZ8yk1TZDwr6hh
	6eaLU5Y6GfE3oB2oXPmR95l0e02YwNQSgDic3GyULFrfMAbelkNFXNVkq8+O0Kbu
	v01+cKOni8WiKi0NPDdH8pGREBsf3eauEjhsu0Dy3Npvkjyb8W9eAuxkVCHhDJaW
	6apcCw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7hd2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:25:51 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4e9fe8b17so484659a34.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108751; x=1790713551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0TuA+c4Zv64r9WkUq7tKxzf0rVkTnrTTJFn59aPv+Sk=;
        b=EEqaZKyHy8l2ypvjnPAkTuTWqs37Sn/Xq/k8qbeNkvuLqNAB/uKjB1OskufgW7onv9
         R8QSQU3hYXReJiHnuHKzv9/XrCdoxuz67i8PJRYabO76x+58m/Q0+G0jbwpNVSPhullE
         U3+eAEhAc9ZkHG77FOghw37Dj5IWIA4vXi1WDnIxiuQXrXg9Er2IYmceatFuuHqn/wTJ
         2xxg/JqpoINQACETuW0+Yrqqrk1EWXE5VtdxnW/YEikfk5ZN/aGxfQKYWCPGqLz3jF29
         hPyE22a+kvgy1hspfzS1xWE/gCGu15C7FhpplZsTt5Rn8jb7pPVyytaRCrPjXP7kSuKp
         TWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108751; x=1790713551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TuA+c4Zv64r9WkUq7tKxzf0rVkTnrTTJFn59aPv+Sk=;
        b=aOC55SHBunJp0BRbTWh43mjQW0MkGCzOSUA5uOZn7JgczcfjkWDKVtvn+B9csgewDv
         C7NGjWC8yQcIsqxN68IE3CJ/NHcj8nHjNV+LI/B66L5vbjozq65tMcnSe1/hAmEOBuH+
         UJUW7AoIwO6KTmkxDT/E1Ez4fHdP111p3vlX9CJZvykzQGR5pTIKuE8TxrfB54FV8FsU
         zm32ua/1BfDh/92HcpZlJiGEo0XB87sNGjmxoRn/rIcrZAdM8zBR85w1KMz8C+7Utij8
         R+yZvl0T0QQl/5F3ZuwdP2aN+PHaeIq0hnQWO/SyvhzxjkKDnXVCxK4AX0zy9DXp6PWt
         kIYQ==
X-Gm-Message-State: AFuF++npDsSB3dBwG63fFU+JTuvUtK3t8lnQ4uViWwLBlBZcN5UldbOo
	N2hApfOxpHPEGwXc3lX/Z5i/RNCl3QDnVzA6lWT1IZsh45UllH6m6m/C9J+eV03f8MUe8u5hW9g
	p70lqDDEZa+5O8XtG62EdlCmqxLoCNCFjmO0+U8dl/WYJsai+sRTPjCpL+227+aoEHf1tVe4m
X-Gm-Gg: AYBFou2yJiUYPZQdx8QhLw2dLFn/1rtAhFz0WK9JZrTDtuRb+2q5J+Kgm6vdjQjBUy6
	WUjanMfHoZkV0hgiQzF94HOkIp1yAbVxOzsLANi6e1+9uYmKxm61R+73OEm4iSMgGm9qORoS6Po
	GdOD8RuRfK3OKHfvoLS7dvjYcz0gMM9DenAROuNSUM7hebXeajwcE8oApJ+TaCWC8kTh/y52GtM
	iSfAOvaAj9oLFS8wWnaE/ZcVc3sjHQZeGILXfpAUqi4OHtMolRliAbRpz5rMIcTDFsjKDd3vK1q
	/+zStR46pXHphMKCrwCKEWKi/ZrYnuuI9+/Bz3mqxJSftcCh0TwwvyfnQB+ptp38L2SDL29vbVd
	6oyO6SKWohdrec5zKP8A+gwqbyXyLnPra6E8+
X-Received: by 2002:a05:6820:60a:b0:6cd:3ffc:ad04 with SMTP id 006d021491bc7-6d2d3807370mr498666eaf.84.1790108751212;
        Tue, 22 Sep 2026 13:25:51 -0700 (PDT)
X-Received: by 2002:a05:7022:1a86:b0:143:26eb:18e9 with SMTP id a92af1059eb24-144f915483emr769997c88.28.1790108345626;
        Tue, 22 Sep 2026 13:19:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm1101142c88.6.2026.09.22.13.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:19:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 01:48:36 +0530
Subject: [PATCH 2/4] arm64: dts: qcom: hawi: Add header file for IPCC
 physical client IDs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-dt-post-v1-2-e41473b6298b@oss.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790108331; l=2279;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=N30ql1CGm+ccNkC77iZPDzsGhYzy47Anv6iw4X4OkKY=;
 b=rPcymbyMOz/UdGH07hqFHovIn2jIq2rE961+D20tyWyoG2atc806D+jtUcTsJoULZ5xYg/14d
 TMZMwCRS2+CD3tjLC99XUGvqtMIm9p+YyynluN6mt/MZz5hSmODj8Ua
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfXxsH2VwQcV0Rc
 SvmkhtCnwHMisKCOqB5q9ZpGK0M+CLPA8a46pvkf4NSTvdoCW6NAmZBZCjl0q5GipgaagcxBbuN
 TWM0GL535OSZLyWdO386Ijvl9m9PqGM=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab2e44f cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Fdsq5qC3Yt23JGXt4TsA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: Nlz7Zev8_6nVy7nfqAV2q653xYrLK0oR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfXwggrM6Cv2BT9
 7228bbBpnE/BNgo8UgY8M6B9f423fmyw3wI0F7i36GcmQ7Ce5Bi0u0YtORriWE1f6Qs+7MXNcTi
 cdJV2qVTW7zYN+vV0qfUvGF5PTRYddfSs79THF2bBGNs/e6gLWsD/6oruIU1vdSIcKExhYlvv3Z
 nlI70nzgobpgSzzU/B9CvTmoSTyo7X2Ypom63jRkmmtWPezmw/yAg/cmwRacRQWqONwiBb0DL2I
 RwTs1CU+DsKafhC3uwZhQzl9WewfEA1J2zxTVbSSYEqHHBuHpw2b2liH+w7OkoTCHTbRHWtmRIN
 puGirfPqh0pVR4I7hckUTNRtmY722TcnJfKztSr/4zgOzuNRdWTvKlwVaUWiV0bnDdgSeOYA58x
 T6oy7fXuhAcDNNwAqt2ShICBFIdWTqKBZxh+etyc2RlEeXTloSIyJwyrkXRQasEgmSTSKCJeR5n
 sPZNoq9dQm56QlJmb9w==
X-Proofpoint-GUID: Nlz7Zev8_6nVy7nfqAV2q653xYrLK0oR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

Physical client IDs are used on Hawi Inter Process Communication
Controller (IPCC), add a corresponding header file.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-ipcc.h | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-ipcc.h b/arch/arm64/boot/dts/qcom/hawi-ipcc.h
new file mode 100644
index 000000000000..67f228e1aa0e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hawi-ipcc.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_HAWI_MAILBOX_IPCC_H
+#define __DTS_HAWI_MAILBOX_IPCC_H
+
+/* Physical client IDs */
+#define IPCC_MPROC_AOP			0
+#define IPCC_MPROC_TZ			1
+#define IPCC_MPROC_MPSS			2
+#define IPCC_MPROC_LPASS		3
+#define IPCC_MPROC_SDC			4
+#define IPCC_MPROC_CDSP			5
+#define IPCC_MPROC_APSS			6
+#define IPCC_MPROC_SPSS			15
+#define IPCC_MPROC_TME			16
+#define IPCC_MPROC_SOCCP		12
+#define IPCC_MPROC_DCP			13
+#define IPCC_MPROC_QECP			14
+
+#define IPCC_COMPUTE_L0_LPASS		1
+#define IPCC_COMPUTE_L0_CDSP		2
+#define IPCC_COMPUTE_L0_APSS		3
+#define IPCC_COMPUTE_L0_GPU		4
+#define IPCC_COMPUTE_L0_CVP		8
+#define IPCC_COMPUTE_L0_CAM		9
+#define IPCC_COMPUTE_L0_VPU		12
+#define IPCC_COMPUTE_L0_SOCCP		16
+#define IPCC_COMPUTE_L0_CAM1		10
+#define IPCC_COMPUTE_L0_DCP		11
+
+#define IPCC_COMPUTE_L1_LPASS		1
+#define IPCC_COMPUTE_L1_CDSP		2
+#define IPCC_COMPUTE_L1_APSS		3
+#define IPCC_COMPUTE_L1_GPU		4
+#define IPCC_COMPUTE_L1_CVP		8
+#define IPCC_COMPUTE_L1_CAM		9
+#define IPCC_COMPUTE_L1_VPU		12
+#define IPCC_COMPUTE_L1_SOCCP		16
+#define IPCC_COMPUTE_L1_CAM1		10
+#define IPCC_COMPUTE_L1_DCP		11
+
+#define IPCC_PERIPH_CDSP		2
+#define IPCC_PERIPH_APSS		3
+#define IPCC_PERIPH_PCIE0		4
+#define IPCC_PERIPH_PCIE1		15
+
+#define IPCC_FENCE_LPASS		1
+#define IPCC_FENCE_CDSP			2
+#define IPCC_FENCE_APSS			3
+#define IPCC_FENCE_GPU			4
+#define IPCC_FENCE_CVP			8
+#define IPCC_FENCE_CAM			9
+#define IPCC_FENCE_VPU			20
+#define IPCC_FENCE_SOCCP		24
+#define IPCC_FENCE_CAM1			10
+#define IPCC_FENCE_DCP			11
+
+#endif

-- 
2.55.0

