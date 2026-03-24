Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889D631716F;
	Tue, 24 Mar 2026 07:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774336213; cv=none; b=q7oG6aEHBM4ZUO0hmY9cgB7gGL+u4h825G1TjCIvvFvx81c1nKcdcUpXUV+f5gRh3Kfk3HMn7tGwQ/luDi26Lw+KvSSn+WKU+EA6jmOTLGc7nEPzbANB/sBcTlAc98vwX3RnJitnLMh061+TiZl9g7GJ3IfkfDmH/gs023a7nK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774336213; c=relaxed/simple;
	bh=Tn3pLiKyPA4NVXqBGDmX0bnIDFBEkAJy7bWlHRzOd/g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ydfoc3IuvMWPu8ddHlQ9Gg8w2d3mEquuqBxSm7NLmGXdCyQtN3wiL/K/vcduvxYw7xGro6Z8TRmetUUPfECtNy1dfKqw1UmdTyB5D+kcfKO2mXxP9scK3digqEgT/58CvwGY49XuJTgtmdk3LLveq5tcb2uCuG6sew8qoYw50L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=0LCT7AiM; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0LCT7AiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1774336203; x=1805872203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tn3pLiKyPA4NVXqBGDmX0bnIDFBEkAJy7bWlHRzOd/g=;
  b=0LCT7AiMdiGpX9ZAvAs4wbpeh89447XsibQBRgVRdFvHQlN3muaR7fBy
   FkUYIT7OUsVaGt6nn9QtTQXLA7JdXq70dmoL1xxmMagEscL01EIu51BI3
   ECFYwEJvOeg+C7r+gb1QA/t/5ZpE/JgtBQgRDi2k/c7Z0ANfJ63XSRBUL
   03l53ImWxAP7Qy3X9zqQfEC29ZThquCxRxyIpX4lnkoesDNkekJOpV9jL
   858DHbCNg0okY1MQe4ZVsTn43maCGOvUB+VrM5YGX+y+/pI9uYphz2I55
   jP1AMmnaPhdBEbUJuOuCguqOOFtI0A/AUTxJ7dSJHZBvwv18iDe8TnlQb
   A==;
X-CSE-ConnectionGUID: JHOMLq1tTaWBy+hZwmXKmw==
X-CSE-MsgGUID: 96A9w8gMTHaCi5iuCoBLlQ==
X-IronPort-AV: E=Sophos;i="6.23,138,1770620400"; 
   d="scan'208";a="286479796"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Mar 2026 00:10:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 24 Mar 2026 00:09:41 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 24 Mar 2026 00:09:38 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 1/1] ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node
Date: Tue, 24 Mar 2026 09:09:27 +0200
Message-ID: <20260324070927.1496-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324070927.1496-1-mihai.sain@microchip.com>
References: <20260324070927.1496-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the Performance Monitoring Unit (PMU) node with the appropriate
compatible string and interrupt line so that perf and other
PMU-based tooling can function correctly on this SoC.

[root@SAMA7D65 ~]$ dmesg | grep -i pmu
[    1.487869] hw-perfevents: enabled with armv7_cortex_a7 PMU driver, 5 (8000000f) counters available

[root@SAMA7D65 ~]$ perf list hw
List of pre-defined events (to be used in -e or -M):

branch-instructions OR branches                    [Hardware event]
branch-misses                                      [Hardware event]
bus-cycles                                         [Hardware event]
cache-misses                                       [Hardware event]
cache-references                                   [Hardware event]
cpu-cycles OR cycles                               [Hardware event]
instructions                                       [Hardware event]

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index e21556f46384..ed1ec952531c 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -45,6 +45,11 @@ L2: l2-cache {
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	clocks {
 		main_xtal: clock-mainxtal {
 			compatible = "fixed-clock";
-- 
2.53.0

