Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCC738B7B4;
	Mon, 13 Apr 2026 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776105200; cv=none; b=gO5WaqxA/8qyj82acUsB/Cr83MO60RNaNI3n1w5weq9ULC1yMf8g4LkEATFcR3IoutNkT02vGvNV+iXFTt9VYS7YeHvhCt8FH5St/gugfKHxcT2PO4lfe91neyN5FuDMZvFBTtUz0Io+cZTh7dWfyoG+zHZ0W2/9UlGJZdqnZNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776105200; c=relaxed/simple;
	bh=MDdimWRgxdCpSBq5R8Dm01Y9mUHm8EwqlaFRTelKIa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFLYhJk1QwabZo/jCT7tck9DO7zuUZEgjOEiU47dkyDZYeGt1/Jx8N5dTgeXOU+F6nP6YqoECuJkc6826rPuOT8QeIQugPJ9a0b/SP3BVJ8yIXGyH6a7QXQ1YV2Dm4TSmLc4QYXVuO23scZE5m1CXXbT17WUQCO7jT5NKl4d67s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=i2vWh+ml; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="i2vWh+ml"
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DHVExd2409792;
	Mon, 13 Apr 2026 18:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=xXA44oQsFEQ9J
	7VmBPmiBuOSaGoyF6XluUzLaeSYqaQ=; b=i2vWh+mlH+SmyPy5lJIwaUQHJLVuN
	AfZWvSrauH1YHu9j+JEJzqIfJnDNzElxmFEn3bGW9MdoqtSSzRzPHj9hxlfqXgqO
	d85CCVNzLCtOTAz2pD3f5bC1L5+pj/aeRkYlKkyG1critEp4ndG5UiEPdXvFz8Hc
	bhOzO05jG0W66rTirYFa3YIhJq23N2yFbzZuHGOURJhp13qbxC/bUi9e/+cWbowJ
	WkJ5HSq7wXA1CfZzThphgTtNOy1idgO9Iu+uTkmtYmzEntVF3Mepy1M51kkAq2eo
	5i2nebAbdnRq84cmIh11iKPrAyCrngOpdaR73ewBjHMNDH216/hcrwZbw==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4dgxrm5jra-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 18:32:57 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 80925882;
	Mon, 13 Apr 2026 18:32:56 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 157D2810AC9;
	Mon, 13 Apr 2026 18:32:56 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v6 2/4] arm64: Kconfig: Add ARCH_HPE platform
Date: Mon, 13 Apr 2026 18:32:45 +0000
Message-ID: <20260413183247.1381172-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413183247.1381172-1-nick.hawkins@hpe.com>
References: <20260413183247.1381172-1-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L84theT8 c=1 sm=1 tr=0 ts=69dd36d9 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=k7r4yCLl9DVLXMiQTbtC:22 a=MvuuwTCpAAAA:8 a=EUspDBNiAAAA:8
 a=XVOEL-q19URcyAXAXPUA:9
X-Proofpoint-ORIG-GUID: 8hl6sD2jf0MWx2s1_H0cBOLFiMX3QXeU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MiBTYWx0ZWRfXymUM4RYFK3AN
 WT6absihtKSbpo2Y9PfFXQlboshC5nud0uZWuiKaznFa2kcEaUUgjOf3+TaKzhh0hKVQAq0N/BC
 ogWSTGMGJKwUpcS9/RapjeT7jeTG+keNkeMIOZF1KdxHWqhTDU6TWInwmoOk9yEGLuL0W49l+NR
 PEumO2VFV2sfHBk5/GtFFkCbUsVwyaDrtwxWB0Jdw+bhpO8shjXtRjFduPhU3/JFIkOYzTzfLKC
 xHe+xOleisPY4PmU0ldmd78tRkpBVoE9ZeHndS8bEEy9PJXcIrF4KsXDqbRuZA9+98cNu6jYsF7
 H0EPobXPlrYi7pc0SCj9ar+jks3UKDjvztcb4lYmOKfTpdfRLwrbdGExDmEcGJ/xTTIfQUsdlhL
 PCD9x2ZeZAqRLPnjeWYq4FpJZYnSXYtB/v5S+MMzv8kKUJLgmJBbfpMuG+XeT42d8OS5Srde5xB
 fdMfIq5QFHg/HrzsjEw==
X-Proofpoint-GUID: 8hl6sD2jf0MWx2s1_H0cBOLFiMX3QXeU
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130182

From: Nick Hawkins <nick.hawkins@hpe.com>

Add the ARCH_HPE config for HPE ARM64 BMC SoCs to Kconfig.platforms.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/Kconfig.platforms | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 54eb1d7fd419..b4217809c774 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -168,6 +168,17 @@ config ARCH_HISI
 	help
 	  This enables support for Hisilicon ARMv8 SoC family
 
+config ARCH_HPE
+	bool "HPE SoC Support"
+	select PINCTRL
+	select GENERIC_IRQ_CHIP
+	select CLKSRC_MMIO
+	help
+	  This enables support for HPE ARM-based SoC chips used
+	  on HPE servers. HPE SoCs serve as the Baseboard
+	  Management Controller (BMC) providing out-of-band server
+	  management.
+
 config ARCH_KEEMBAY
 	bool "Keem Bay SoC"
 	help
-- 
2.34.1
