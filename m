Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265E341E6BA;
	Tue, 28 Jul 2026 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233437; cv=none; b=Qvq0k7FzTwcm4v0F/B22sZfGPSgBeswESNG4m5IJvN73xvidda4FmVc4FnsHtULbkVUbuQV30xRS/c/cE6ESOZq1LsK/NI5xSk6Edwgu/ENd0mqzmClLxtzP7xRpcRxL8SLWmIwFunuQLL++sY76I9DZXCaIKbSDL02AXhOBoo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233437; c=relaxed/simple;
	bh=10diB9velJq/eYcV79bZLMsw0nouVN5ah3ntWjA6nB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gh2PAkKrN7qR7NDR0GVXr1MvGSO+/J+R9MIy4oI6ShN4brsviflLZRtiGY/iPwd1xDzSyn1/Af0GYi2hx/W+bT4XFyk4rfrRSI2HX7wH2p69ZJI3XmdfHEn/XCq+Mqj8TsVGk5bUnSekUPVVhxg+VAfqB7agsy0KuuI7F/remxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqPyPN0s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqPyPN0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCD01F000E9;
	Tue, 28 Jul 2026 10:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785233435;
	bh=NmBOIY3EIHbjUW/p06o1gBsIW7Mk59jVWdBhNljKNe4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aqPyPN0s+426m2ZVl9iqZVy5vT5F8eLsB2hZkMWDOuUUWOKLokxqePUv/jxe2KoaL
	 jxj7qjNqBMpbjnfw2ql06y43kFTAt4Z/vab/duUHeot6MVldpkl3EfMa/UTUYFOIlc
	 qTEA2L/Uy9u8BeoddlAE4MOGfpndgkx0ACNfjPYdoI0W4JRS0eEt0CydP9Euz2QFtq
	 jFnynpMMysv+Qb64Ruj+R/JmK7woWAcuGq9PSRveOgBAjGgqfBjUnClwdMa08r3GKx
	 qwrNkO/lRU2RJ0Z0RhCcsGCTjSSDK7l1yp67RCqPOmgUUtHFJkvKJzQS0NSUn074q0
	 Nc0hbK9Lq6yyw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 28 Jul 2026 12:10:13 +0200
Subject: [PATCH v2 2/5] phy: core: Define TBT phy_mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-usb4phy-v2-2-5d9dd5149ec7@oss.qualcomm.com>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
In-Reply-To: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785233420; l=1832;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=6gTlH9zkXDrpxrfoapsub+GQSk7FbD0MtjsdTOkBxn4=;
 b=1XGDlHZt+iYW9uQqpU5jVTU8yy0xHW0DUNsodMy1brE3gO1BuA+Heq17MUcJJ2EDzczkH75HI
 fUAeEOjKpNcCYnrJ2NPp+UN2j8mealDFBueQtGY1ZP8wWPwcnw7S3z0
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

