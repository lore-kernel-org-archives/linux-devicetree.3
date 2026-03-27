Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A935719A288;
	Fri, 27 Mar 2026 18:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635363; cv=none; b=qovJDCugoYa5SWt2f223BHYF8rm2enbsNvU5BAnzZAErWCB+I/Ywm1zsLb6DWj+BXIzUcb0s60DvNq0NdJiH7DGqFPbDlLiHC0/4ocORPzkb+AvwfH70+gKe6N0jRcoocG2YM+gd2qyD7iytD54DyXXOW5569+PrJCvgfFM18pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635363; c=relaxed/simple;
	bh=bo5GdBa6G3d63Ox97a8utKJoa06KDNsD2SP0aUfJr+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kbs9luChPfzADrcU89ouBOw7ScAtAgr676rX0Fw9pnrOI36FXtrFy51yvxzcGLTjzY0Pc7pzRZOLVwJ/qmqicTH/UkiFY2bcte4gDSubF/+bg1wxrH/HLfBDzDDydU1UAo4YflYc7iL0sLIIqZsSj9LwkCAhZcm4P/XV6eUxCtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=ieja83Wt; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="ieja83Wt"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCeMJJ1436948;
	Fri, 27 Mar 2026 17:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=QmopYxJuCQEZ8
	zllUw4s6HsivJfzbT5IkcJ5NS0N8js=; b=ieja83Wt3E8FODs/sPSms5XvUBiZL
	aKkr6shxcGp9wXclu3Y9tzLtq09aIZIQIOZozCLWEO3YypSKBhhTYUiWO6WH0QG7
	BDBf/QNb6zWenFxdOSl4O6V/GgAHbA7b5kR8SPL7nCAzWXMq/8+ngqn8hbOK/dtE
	sk7L7PBXLYjXz5bAAqKgp5rNUHlRrEmXhUWCIOE8C/Vm/79zMM9QPe8uMan5sX7h
	v7nS/YOg2cwMp/cwDhVqSH7vu/W6BZN9usxnZ/u/+K7ItP5bXdMQRX1irirDTgYy
	94kZdUuSV+xtNluHogDU8cNAJm9fw0ROOIdiX6f3j3yh/BRK7o2yiJJ+w==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d5t3fkhhc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 17:44:51 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 5C7B881B5B0;
	Fri, 27 Mar 2026 17:44:51 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id AA5E7810ADF;
	Fri, 27 Mar 2026 17:44:50 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nick.hawkins@hpe.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: Kconfig: Add ARCH_HPE platform
Date: Fri, 27 Mar 2026 12:44:44 -0500
Message-Id: <20260327174445.3275835-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327174445.3275835-1-nick.hawkins@hpe.com>
References: <20260327174445.3275835-1-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: k5T4Sv0AGOoivFrw5RtAxpwDNDYxFuF2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyMyBTYWx0ZWRfXxMyu+iM8RSem
 1I1DvlttUCTqRFD9vW+mgTOZ2XG34lydxjpTG6fSK+zIJKV6xl8+++gsK0tuGQyy7LrCBVqv7GU
 CT+YEhpWA14PM2gPoNZNg37UCVzitR0X0zBdUeuN2JGU6vuqhLBg19aya/hlUErlxCbwfRavnzY
 5mgPSw6buOX0+TaBac0cGhzV/rVPN3/SzS/uYzbWpx0qa8Uvg3FM7ErphHCAqznOYUZQNAJdWOL
 LVKb0gmkn+eRqV8NMvb/zxibQSbhGlEdxAOLSTri6vg7zRMu0DPiKa+ZN977l9c4zZxn3A0iteq
 jwaGXjYsYctA6Qe/AYfKAo2hfQaxODcOrRUMfjCo7i2VCqyZq+7Yd+m4JQlrulkrKfo8iA/aRrF
 IX6GgaxA3DMtucCfp2OtYDiiPZFlkuGb0PM8MIk67Kqoy7c3wdu8JiSYdViB/wShoha3AtiRwk3
 1agq4I1swZ4FTeq8uQg==
X-Authority-Analysis: v=2.4 cv=YPySCBGx c=1 sm=1 tr=0 ts=69c6c213 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=RtSn8ETxjE2H05FtM2s8:22 a=MvuuwTCpAAAA:8 a=XVOEL-q19URcyAXAXPUA:9
X-Proofpoint-GUID: k5T4Sv0AGOoivFrw5RtAxpwDNDYxFuF2
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270123

From: Nick Hawkins <nick.hawkins@hpe.com>

Add the ARCH_HPE config for HPE ARM64 BMC SoCs to Kconfig.platforms.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
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

