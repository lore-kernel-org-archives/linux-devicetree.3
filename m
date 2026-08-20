Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FC0476CC0;
	Thu, 20 Aug 2026 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235872; cv=none; b=cvxQjGwXGM7dJYPROtbk7YraXFY33oytAqYYTYwuEKfsmQJKV7UtVm/YUryXsY2L6zAm011GTBAnhwXQwCzNm4iF3m2Epx8uXXxyXr8L4TMGmkWCHdPYsz7ObaK6iqJ8uEOUnUZh9Hd9WRvPGLHxG567tivMy54gauFJ0QaTBEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235872; c=relaxed/simple;
	bh=MTnzSawRiO7pVYBSwuC8busFqPG5rCphwOckVh+Kjrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CjeHYXP9I3TB9zHvfIk7/erTNvnFyJIVjhIVPQxpRGwxnlLlZkHaQZxK3DDHm9YVBMiMATGLWUGb05/vLd0CFl+hO02Hd9olyAx/zwzQLlOOLqYR7evs9h3ktyUc71nUAq0XYIK6Szlp83Cu+7PvVflrfHmIZIFiLPxwR+CeLsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9hHG35v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9hHG35v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34371F000E9;
	Thu, 20 Aug 2026 14:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787235871;
	bh=Dj1r/wWB/aOZdgGoUdJw65LeZetntGEUGM/wi7bHYTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=J9hHG35vG5WC49HR7pSe9aEKjIxS6X9QEtH6wuwyqspHCnVQ6MYjAY6lzIiTVsmUC
	 TInEIv082U/t+1N5gQVs7w5zwE29qdOZSGjxpps2Gb/Vj3r7N24fd4aU38dSXGQPY4
	 aHmE5rProDNTZhZN0g0EaGVCYpAWv+JWq47FFHffMTACOeK6ixBNwWYnBz0GqIPfAc
	 eLwbMgem++wOEnD+l13duPhqAbAjv6TczdxPg8uDaw1rWf2q7DlokBr0lZxwA+Y0V5
	 vn0I6XspxI7bxCxoh3er2CSv/+vzeQ8dG9Ls/UU0zcZFkWt686ryo6g7JuK9TyOaN8
	 X/0nf7aQqEowQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 20 Aug 2026 16:24:11 +0200
Subject: [PATCH v4 2/5] phy: core: Define TBT phy_mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-topic-usb4phy-v4-2-aec9d2cb31f6@oss.qualcomm.com>
References: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
In-Reply-To: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787235854; l=1880;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=yWJCXvkxQGVASlmRT/ShbWiojv2uvFf9iNjzF84+L7k=;
 b=+CRDiHMP9fTgIfTxD7aVLbZ+7YmvEMmfozVp/PghXDxEX/IEjqiW5F4pbvppIpMMBDtWyRRNs
 ZIkZNUV7l9LDh4OFeni0mlrVY6Qvqz6FU3bciaK77xprW22h/aS4jEc
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
 include/linux/phy/phy-thunderbolt.h | 14 ++++++++++++++
 include/linux/phy/phy.h             |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/phy/phy-thunderbolt.h b/include/linux/phy/phy-thunderbolt.h
new file mode 100644
index 000000000000..5f48059814e1
--- /dev/null
+++ b/include/linux/phy/phy-thunderbolt.h
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
index ea47975e288a..3a2ace2cadff 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -20,6 +20,7 @@
 #include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
+#include <linux/phy/phy-thunderbolt.h>
 
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

