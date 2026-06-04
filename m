Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FFD2701CB
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 01:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536819; cv=none; b=P15UFt5ZuuYU/7iCfHfsCb6IbgLi7Z1BnCweRU2ptvsiyKXHeSSblJy2XQVikSOulK+xqjcOEli2ujOZ/wGjkaVO9r7HeigK1SxZ1dZYMXEJg9o0wx0ldPbvn35Y1ImTO75g2vbL7akHh0kdp+lcDScENNtd2jORFZNAaMp4Xx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536819; c=relaxed/simple;
	bh=2ILPtmC6htJwupXVcqBNOJFTUtBdC7zGearGnbGCWow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTcQv3ijLHVQPLpStVeNpGg80SJxh5JywtlAG6Q0F10NyzJUQcEjTlJR98j6g/xaxfLhgFyFROIIHIDJnGsI7LhS6+bl8yleONYaMI030czCmUXiFyZoQalSWRtV2TpjpfN2MJyfI8R8PXqMox3kiuLblQAAQLqvwl/nlxRax3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlsFzu5u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfeh5nYz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlsFzu5u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfeh5nYz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653I6ihF1993971
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 01:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2jDYFyWFwiBr8ROyqOwhRj8gSALzKVWOWbM241VcAk=; b=UlsFzu5uCmmAOuY5
	n+UNODU7rmR2+lk0CFS+M5gtZMOnvhOxMh+4eZbfPwGN3UmVTTwwAdb1oN+Jvppu
	2lNxn4PDrTRWl0IJVTtHSel8cuTZ3pX3RbH5EVqNo1h7gbNILkK7plRHOcfTLkgH
	kvC9Sj9KNQp22M4opri/thq0UvrcmffZruOA0oTmzh4TpjVWVMx9iy31Asre/Qk4
	zjuvjWjZxZeKuMWTScFCxmVuTdTtzaqWMzsErWFBCzr5UFJSSxihlIXRsqEjbshB
	lGpu8+qDIdNLh+iHjayzL7YKHud+0t3pUizmsCmrPxn7wUQCLk9kVkeDRuYklc+e
	hqQ0gA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8psdpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:33:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3074797dfa9so192540eec.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 18:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536815; x=1781141615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2jDYFyWFwiBr8ROyqOwhRj8gSALzKVWOWbM241VcAk=;
        b=jfeh5nYzu073Mm2aMGtl4E0ZlPc0N16M+f1rpON5oDGIdDZVv+0f35XU2bOp2dAmOl
         QYC6RmHNZGWdRt3KSgXFf+13y/uSNoEwuCM5Z/xtWicMgEtH5w/xidjlv1UOJOnh18xD
         RhM3VI3tANXtb3YbuVsITCoEg+8eLPvIdii2ZfnAw5NRKQR+zvuT8Y3wDNE0WynGwVcv
         ZqvRXksBAe+kf+bewf0A7ZghN2gg99dXV1uwOFkQyFVvIoW4QnyqlcqmJNvygO/Y8BEk
         B3t+XL53S8If8lV00PRf73BqbnWPvy6Rp0Lvc0NAG5+FPk7OMqMUwORhdTk/s3M1+hBG
         0+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536815; x=1781141615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z2jDYFyWFwiBr8ROyqOwhRj8gSALzKVWOWbM241VcAk=;
        b=U0TSh72pEmPjf0pwMM8o0t2KcPAD5bANOoOjoDF7ea5KejXtWmUXDTcZIVarnVuS5Q
         v2HYokIrFj6DwssE3sfFR/FQzUWXJdsLNyXVmY9Ssz+Vy02lIL3mHr556/dj28l55Uvi
         bjrEzZTpEM9cSwd5h4xHu5ooBAtcFbklNQFBbXQKFVk5J0sgSmyh6l+dZnIl89DFbxug
         MYVys6w1XiBldO6Y4KZrqwO6BtPzI43C0dakVSoUFVPOM3s7xcIsfwprGlyfOe6w57Ei
         rqAD3XDadmd1wzMa7dbXAniZjC4kVrW2s50h9Dxbgtz+U1QDypNw5cUHLjoMK7PdKCb4
         3u8w==
X-Forwarded-Encrypted: i=1; AFNElJ8sbqc+6mvQpjPVImKyXp81qUjIcFQNWSu8yB0UxfKKqXTh72Mo1der2gyL0diHU73uMZ/N7wprW7NJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxIGiRRlWh98O2arR6hUadQtZuDvEKfeFERcZ4dD8DVM8t9Qg/i
	Ce06LpSUyyjZD0JIsHIV8yTMTuZWEdVn7kfCff1N2FlXl73jGQ7RIhX90ZMmM6ZXmmwwZwPIhot
	t2RqAY9jQ9uV1feC/nBFVc5lx96YX9iYnMUPGK5LTzpCN26EQYTKLCfyjDcRfkR8f
X-Gm-Gg: Acq92OEoypaDEFtcfSU0mU5dtzz3jXHW3f+O+/BxNV6MB6CkwGVzpWvFdAR0ka3njh9
	U4AeKOdXF00PZ/d0WwJEU88DTotMo+hkDqewemUlqSBJHti/peK8AbzzOeKhpFEUdl0jZogFr5H
	WviZYXLd2AYvrHt9mSdLDQNSszJMLRseVTSYcbjkjF9uEW6rW55PuKPrkZ3/F3fSyffkXsoAgco
	sOMc3CfuhpTXgxdyR6Fajbg58wyMrlPkwOnaj+RcvMYByJ5WIKrKzDXkwYszcWlOGBSxPvc7mvH
	bhtM26RffZQHL8EYoV9FHpkuRTDWYtzGJbRMtbev4x8FizGvEql8+hKjZPfj2wS2eHnSz4tITjz
	AufzbEllOQRGCA6YFWUiEYNnO0vv6194wREo9C4xEf6LY2fHsHM5DYxJPtH49cx1kC8htaQ==
X-Received: by 2002:a05:7022:f314:b0:11a:fb3c:568b with SMTP id a92af1059eb24-137f6ba38e5mr1296345c88.17.1780536815458;
        Wed, 03 Jun 2026 18:33:35 -0700 (PDT)
X-Received: by 2002:a05:7022:f314:b0:11a:fb3c:568b with SMTP id a92af1059eb24-137f6ba38e5mr1296336c88.17.1780536814946;
        Wed, 03 Jun 2026 18:33:34 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:33 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:33:02 +0000
Subject: [PATCH v2 08/10] phy: qcom-qmp: pcs: Add v10.60 register offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-8-be908d3560db@oss.qualcomm.com>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
In-Reply-To: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=1895;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=2ILPtmC6htJwupXVcqBNOJFTUtBdC7zGearGnbGCWow=;
 b=HjtEuYdgPwNBjfNk6Dz/PB9TbjV1eeA6SMtz2P80BbJnR9dKxGj8QiYoQAnQOND8Sn3IEmqH+
 74KD9+/rK2vADK0eZv78mn8nfpzQd6PhC1fRtO5fB9KYTwHNbS6z+L4
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-ORIG-GUID: gHEvg_RZjo8V2E6k4SSWYm_MpPqqbnMi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfXxqFqpWZqCKBA
 M4EKPULZejh4N64DJCVdYYEx6EKHXzkzXyaK2x3w2yi5pLJNeuJqtIsv8zE1gE4x1hvWKUAqZBZ
 LgbtBisdsf+OILirO8leIxNl5TjH8hXidMmiXq4yJvGQUXQsTo3wq8jXP5kQ+NWG30FAj8BWyMQ
 l/1DPkfkF9Ey0jMRc3KU6uIjwSZf0QUya2EynYLrQmCnW4w26+pXTm/klggODPVa3MdZJV02OP1
 fIZd3b+fUSIn1NNQzRVf0UUK1rdnp4Khd7t0b5Breo4qTTxNa+JZGwR0N6k7VqUW8yFlqNKCSrD
 Yy/G688858IVfZGUEa0lR7yBaBvZ5etlk6KS+FZTGeq6FaZyAf1AMbK4f5yz2VNd0+CO59BeoN3
 wAja5tXM1VAMQ7k4iUfM8bupKeQzUhI0SMB+qC72nsJAZsSdrJClcfMyKClDkH79lGcRegMrASG
 sQ5GHuvz7phwGb/fzYg==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a20d5f0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pc03IfIZ1lXN1Xjd0rsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: gHEvg_RZjo8V2E6k4SSWYm_MpPqqbnMi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040012

Hawi SoC bumps up the HW version of QMP phy to v10.60 for PCIe Gen4 x1.
Add the new PCS offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h | 23 +++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h            |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h
new file mode 100644
index 000000000000..fe0279ac4e4d
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V10_60_H_
+#define QCOM_PHY_QMP_PCS_V10_60_H_
+
+/* Only for QMP V10_60 PHY - USB/PCIe PCS registers */
+#define QPHY_V10_60_PCS_SW_RESET			0x000
+#define QPHY_V10_60_PCS_PCS_STATUS1			0x014
+#define QPHY_V10_60_PCS_POWER_DOWN_CONTROL		0x040
+#define QPHY_V10_60_PCS_START_CONTROL			0x044
+#define QPHY_V10_60_PCS_G12S1_TXDEEMPH_M6DB		0x170
+#define QPHY_V10_60_PCS_G3S2_PRE_GAIN			0x178
+#define QPHY_V10_60_PCS_RX_SIGDET_LVL			0x190
+#define QPHY_V10_60_PCS_ELECIDLE_DLY_SEL		0x1b8
+#define QPHY_V10_60_PCS_PCS_TX_RX_CONFIG1		0x1dc
+#define QPHY_V10_60_PCS_PCS_TX_RX_CONFIG2		0x1e0
+#define QPHY_V10_60_PCS_EQ_CONFIG4			0x1f8
+#define QPHY_V10_60_PCS_EQ_CONFIG5			0x1fc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index e461a000da48..3a4a0a9a9e4d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -73,6 +73,8 @@
 
 #include "phy-qcom-qmp-pcs-v10.h"
 
+#include "phy-qcom-qmp-pcs-v10_60.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */

-- 
2.34.1

