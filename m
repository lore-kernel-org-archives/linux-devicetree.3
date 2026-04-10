Received: from mail-sc.amlogic.com (unknown [64.106.246.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787EC382374;
	Fri, 10 Apr 2026 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.106.246.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815731; cv=none; b=XnYTJ5VQ/7d5czoHKuxJ/TFmRZW1i8ru7GVGr2UeKg2FRZQz7wtPjMctAV+yCpKhotID4MUqyMjdsgo36h9I3vM6NgFewCTPkIXdCWHZpyWGEVj3EpRcPqYt43RmfixDa1190vmK/NRbYpzx10GSQcmV7YQ24ePzGGX/tye+TAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815731; c=relaxed/simple;
	bh=oT5or1uiPhmj1PqAnho9JOD2Vk+vuruTAkGlXnkC44g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GzcnB25Z0mDJwiXFMjJhxRaRoR131QRLYvjrGQahZyukgjrlnzPT+Eldsq/z+mRtx0ndhQtkL3CORGqbKeDmNLuUAkH9Ef5X6PlZw48QwZoo5U88hadmKqkp1gi4bPdygQ/vjL2usmVKaPKz7ADgNrGH+WY6nq91g/Pwu2xmrNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=64.106.246.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 10 Apr
 2026 03:02:42 -0700
From: Jian Hu <jian.hu@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, robh+dt <robh+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/4] dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
Date: Fri, 10 Apr 2026 18:03:26 +0800
Message-ID: <20260410100329.3167482-2-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260410100329.3167482-1-jian.hu@amlogic.com>
References: <20260410100329.3167482-1-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)

Add the Amlogic A1 and T7 compatible for the clk-measurer IP.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 39d4637c2d08..b1200e6940ac 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -24,6 +24,8 @@ properties:
       - amlogic,meson-sm1-clk-measure
       - amlogic,c3-clk-measure
       - amlogic,s4-clk-measure
+      - amlogic,a1-clk-measure
+      - amlogic,t7-clk-measure
 
   reg:
     maxItems: 1
-- 
2.47.1

