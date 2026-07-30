Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798A443F091;
	Thu, 30 Jul 2026 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421174; cv=none; b=NsRAYY+48TiBYxB6bgpogpwpRRhD1Tf/ffUvUefDakB8ah6eRlkr5jDyXEeES1IQ1moBiUlCAtCNMOeevzqMXScLjTMtRFEsiv4BXtZcuY24oS/oNH7yI0qaHoJOhxcJH3jWjh/iCx1N2tMgdh3Q79R3VDPQ1/NqWdCfBZnRZo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421174; c=relaxed/simple;
	bh=10diB9velJq/eYcV79bZLMsw0nouVN5ah3ntWjA6nB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u8Nl2C2e3LajEUsmEt+8r3VItn3Ssu0trq5Fr+ccxy+HE3jcnvsYRBS2jEiImHU6KSWxSCcvajQagimEKdreI4zXusuJjFoxJBJG6chN0m1l421TeMKq1pKS8TNT/jousIvMWwe6BRS5nFAe8onf1XJUTtdgeFnU3c1mwm78USo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgSCsCQY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgSCsCQY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8309C1F000E9;
	Thu, 30 Jul 2026 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785421173;
	bh=NmBOIY3EIHbjUW/p06o1gBsIW7Mk59jVWdBhNljKNe4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZgSCsCQYucviN5op8MFJaGl7F98jeQVqNkfzo3w1w1P3jc7TNp3p3RZOUdtTm0xca
	 q0IPR7HXGAJ1QP56gcP8tmpMaI8NTKVslp5hXR+Bi7ZuL7Brk5zFkQNXyi2xhZI92+
	 UmmsvqQd3M/39VTn1MQowS8JX7zxXBcbV7Cu8b2M3GtEia9V64oIr/fR8oyZSITlM/
	 ziBcpgx0usY9KCNUfPizKOC4gHoiQnvX5Uw0nyy/mXG8NwhJw4yMyvspwKUh0EPt46
	 gqldfUgjP82zRn8S3nQGBagq3WeOyBGdVyo2qP6+qYpK0hHYr8a3KucEuroMJIUy21
	 4w1HFXE9B+eaQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 30 Jul 2026 16:19:14 +0200
Subject: [PATCH v3 2/5] phy: core: Define TBT phy_mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-topic-usb4phy-v3-2-ccf0f7ea98b5@oss.qualcomm.com>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
In-Reply-To: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785421158; l=1832;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=6gTlH9zkXDrpxrfoapsub+GQSk7FbD0MtjsdTOkBxn4=;
 b=efLWvez10O0H9Q8KeRsglD0zxv5jCDIi5ZGSoFty7/4+cU0fY9L//e1mR28dgow69HOgwjEm5
 qUITo2zIH4uABNlO9TUyxOVZuCGkEYn3e6hj17adNDy5PdTmVGlGja+
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There exist OS-accessible USB4 and Thunderbolt PHYs that need specific
configuration. Define a new phy_mode for them.

Currently, USB4 and TBT3 are defined as submodes, because they're quite
distinct, most visibly in the electrical/analog aspects (slightly
different frequencies, timings, etc.). This results in a need to make
the PHY aware of the actual mode needed (at least in the Qualcomm
implementation, but I believe that'll be a general need).

Newer versions of TBT are basically supersets of USB4 with higher
host-side requirements, so these are not defined. This can always be
changed as necessary.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 include/linux/phy/phy-tbt.h | 14 ++++++++++++++
 include/linux/phy/phy.h     |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/phy/phy-tbt.h b/include/linux/phy/phy-tbt.h
new file mode 100644
index 000000000000..5f48059814e1
--- /dev/null
+++ b/include/linux/phy/phy-tbt.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __PHY_TBT_H_
+#define __PHY_TBT_H_
+
+enum tbt_phy_submode {
+	PHY_SUBMODE_TBT3,
+	PHY_SUBMODE_USB4,
+};
+
+#endif
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..26a91c070f8c 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -20,6 +20,7 @@
 #include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
+#include <linux/phy/phy-tbt.h>
 
 struct phy;
 
@@ -45,6 +46,7 @@ enum phy_mode {
 	PHY_MODE_LVDS,
 	PHY_MODE_DP,
 	PHY_MODE_HDMI,
+	PHY_MODE_TBT,
 };
 
 enum phy_media {

-- 
2.55.0

