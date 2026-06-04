Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC13279DC8
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 01:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536818; cv=none; b=BIBzRrZWOXqhhof/FaSFfZ6qvDGCy95/Sq833LL4DO71IrhQftqdRXTSTnqrclykgksnnaK7eUyT9N49GuOkoQjOlSuoiMYZkbmcAKOSxlsGENTTJP9lnCHSRowqG6YYo624k0v8595LCVz8jz+wIxgzZgkZlPu6hgqw9FCqKaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536818; c=relaxed/simple;
	bh=8Pt1Iry46S+aeKxOUquDig1kaHN7zoPCKWm77OKh1o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hG0jsJVhS9Xuj3QyBID/eSM1/ZhLY87UQvbNvCAnSwv/XvJfJOm+i1C8rHZUduOaGYpm/N4QeHR3T1LHJP7CYwirVExRqPEAXf4HMiwMrq3kAGItkgH90p9qQNdJHvJg0lNPVwCdrJnZhTp7zn3s6+YermCW6cVS+umL0/yXKpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E28ReFj5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsKnjB/j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E28ReFj5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsKnjB/j"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653I6YE21993488
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 01:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b2mlViog/YyqHq+jcQTv7WnwnY8MfXhr992hmCBoDqw=; b=E28ReFj5GB++NHXF
	FJbxXkLsvKYcVZKiQ6SAW57C7NUrFmlwQt7WXGchTn4qA7g+YGec4JlLmJpoxBid
	UU3De9veeSXK9OoTdCDGrwdFmXFW7WEDz5MEuv1oJzl8iVI/Itzx6imPxA7gj+Jx
	A+JEM7sxovu3T49L094ZAuC1JcSMNQfJeq52Ma78efZfTDyKWfAlvqftFamHGGBc
	g2cKk3skUn6TM1+/Dx8hioRYlZktpfIJPH93IlmvPzhAXOGMF/9Hb08h3vF8MWMp
	Dgv2CdrkfvdrBY8MuZdA+IeYj/ZF8IXEMgbslOs3r+ZeRbLBRQoaiGRw+uNmDUJW
	ISRhbw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8psdpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:33:32 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137dbe27199so749872c88.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 18:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536812; x=1781141612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2mlViog/YyqHq+jcQTv7WnwnY8MfXhr992hmCBoDqw=;
        b=CsKnjB/jIdJdR8Yq5qOypqyYDL+Xy5ypnVDvvKAWLciSoTzyNOn7hOgBDISEmM/meu
         nKyMYtiLlV7rHv+XBEfG9VH32i+RLhZVOwzTgPl6xvtZS+iPAJBg61uZlPvOerMxGWq4
         IFD6ayD5EugRbEiNvEDO9p2qcxyRtg/kECki4GdqFX7Jlx4SolWSIpNhNkJ7PtIbkEyz
         GkeLcFFgMcv1RM7vrAfMWzOd/Q25JWH4TmBelE9gLQVhFnR+gi31354reylwe5guJ3zf
         QCORVDLtfNEsfphjv5rd9bEjG4SxvyMvAc/iY1+lIwB8bRtr/riQOuv/gZsA4WzIQbha
         Vhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536812; x=1781141612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b2mlViog/YyqHq+jcQTv7WnwnY8MfXhr992hmCBoDqw=;
        b=sW/X82SAbiBgdqow1lyL35xZ8smLKdnRdzVnWH1ff3ILq637HsFb30Kytz665w+26C
         akwUi9i7dLlZr6vpocFRwpD15nmja9kuPxDLE6/ICkvEy/qsIxybkDQEcCsVmH2Oa0Q7
         H1ykrsaT2mS8VwSsr0I9CDgz7C/eugCD5k6E5bfJAw7zH/+wiRyGiOTjYYdriT2XGuuW
         49IyJ7Z/SPijvvfNb2wxcLGEexzuWpc/j+cT4i/Y5azmGzahc/IkLDj7kmBwHvDMOpAG
         bcTBTE9QAmaHeBnkX7WjE410uySvHNyzgCZyJ4NUr+eY5J4mOB4jgsvJYqK2ubPgQ6jO
         YzMA==
X-Forwarded-Encrypted: i=1; AFNElJ+PbFgk7yVMWZ6kvQxJFHXzso98ykJeuuIhTTOE5ttQQsHCdeczhH3WwF4loibzZ0ijC1qzlmVxRX9V@vger.kernel.org
X-Gm-Message-State: AOJu0YwVrZg4eyChIM4NX+pfFS6H/LFU+qgFGsXoWmT+zEOf6duru1pa
	BPuIXgq/1uyZyUPI0KqABVnUZukNwyPqo1z/0M0bU7LfTr/Wk486qTLanQuSkv8+40clGB6aI8V
	nH1rKkCZtYdhzEItRrB9yd/RwF8fwMLM/vrl1FsuIJYMSdj5PF2SitLNxqvTnEds0
X-Gm-Gg: Acq92OEZyzwcoiOVT2sq+cu/1k6DcMv5wuzDkU8PUCL9zWU3CR280cfb9EcpCiSWvQW
	DQTOwnvcils0zGY0KuvKj3OgUEPFdnRnUVGTEStrjqJUyEvdP1+wfBGe3vHT0/sZnklipo5yhLu
	MCQyxWYHVKGMiVPmyWG84YJR7gWgJvS6dtGM2TJAxq3N610FB4tVg33G3kB5wllET1XXkRy1AfY
	uwC7P1XLos2C/IkW1YUhl13sKJGuvDRop2IWcH+y4lP4NUZrI5pDmlgFqdYZKqj5oKtdNXMncqg
	7t7HHAgHQyo1JAWaYr01jnjqt/I9uNiP3c9u/odcZbmDgH3RNSMH26T6lL+P//ArtQJBPcUruOJ
	debWyYlGEPUB0FS6vBqLCT9cJpZ2ZlNflTo7mRVW/xUFoZ1s8928NAnMwyPYmJX5EsUjTTA==
X-Received: by 2002:a05:7022:fb04:b0:128:bae0:e03c with SMTP id a92af1059eb24-137f6bd9131mr2680547c88.30.1780536811561;
        Wed, 03 Jun 2026 18:33:31 -0700 (PDT)
X-Received: by 2002:a05:7022:fb04:b0:128:bae0:e03c with SMTP id a92af1059eb24-137f6bd9131mr2680527c88.30.1780536811047;
        Wed, 03 Jun 2026 18:33:31 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:30 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:32:59 +0000
Subject: [PATCH v2 05/10] phy: qcom-qmp: pcs-pcie: Add v10 register offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-5-be908d3560db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=1757;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=8Pt1Iry46S+aeKxOUquDig1kaHN7zoPCKWm77OKh1o0=;
 b=5g+laxlLXY1H2s128u8V7xGg8hyIWr/D5b/yY/GQ3MFsIkfv/m+5wFzfth1ukGv+sM761EUTU
 TDq170rYxDRChHfESgc721HP3SrOGba05rIN6T/hmBe90AfN1RGkZsg
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-ORIG-GUID: wSds5C0afEW0lC07BcASwnk-XrighDet
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX2teB/DXqt+06
 7GB0JZOGIu9zojSDh7h+YkPQ2fh9I3Gze3C8YQ4YQjpNEqLvDacd7bQ58/4UuA6DfZubgsrcT8q
 ImYc8pGi/mFpjMGly2zsQ2rNAe9mx2rV0UTBbt9qjvYFlOYxwBGbd1py5aoA6mh+Oy7LC53QhBH
 f7HSMkVSGAbSfsFcC34UEJdL+zpQm5a8r1lUi6AW5CCJVFOzArY3CIGNDhLrnpL9mjIpYKGie5t
 m+/DAzWRjUTspEY5nvoj6tyhy0/N9enrnhN4kavcRtQdXA7Hzl7+CX3UCtWk3izj2xgI7GKGYym
 X6tK1/1c9ERYJ0t5c47mrP2gP5qc5VLKCrQlBtS6SxBEUIqhd/be3Kxej220CvugnaGScmPDI2J
 TJBZxoCimwo5FOBJHiSiS0QJnTzCuhaAK3+9b1+KabLp0WPCGtqMibwL8Q+Xt5tVVuyOqOZl/O6
 I/T7964eNttJc4xcvbw==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a20d5ec cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=a_mrqaUjlmxG8iE0lbgA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: wSds5C0afEW0lC07BcASwnk-XrighDet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040012

Hawi SoC uses QMP phy with version v10 for PCIe Gen3 x2. Add the new PCS
PCIe specific offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fed2fc9bb311..ba17e53d000f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -40,6 +40,7 @@
 #include "phy-qcom-qmp-qserdes-com-v8.h"
 #include "phy-qcom-qmp-pcs-pcie-v8.h"
 #include "phy-qcom-qmp-qserdes-txrx-pcie-v8.h"
+#include "phy-qcom-qmp-pcs-pcie-v10.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h
new file mode 100644
index 000000000000..2cdcc211bd93
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_PCIE_V10_H_
+#define QCOM_PHY_QMP_PCS_PCIE_V10_H_
+
+/* Only for QMP V10 PHY - PCIE PCS registers */
+#define QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG2		0x00c
+#define QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG4		0x014
+#define QPHY_PCIE_V10_PCS_ENDPOINT_REFCLK_DRIVE		0x020
+#define QPHY_PCIE_V10_PCS_OSC_DTCT_ACTIONS		0x094
+#define QPHY_PCIE_V10_PCS_EQ_CONFIG1			0x0a4
+#define QPHY_PCIE_V10_PCS_RXEQEVAL_TIME			0x0f4
+#define QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG6		0x0f8
+
+#endif

-- 
2.34.1

