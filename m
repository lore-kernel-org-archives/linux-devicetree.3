Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6933A44C640
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134770; cv=none; b=VFXFMqCnyrVMKxbYXC4Lrds3roT+Fp4DVl2qK9zqo/brfotyxTjKxYFWmbc+LLaBzsama38QkjmnoZ38jK2kzryySIBc/91mbCT6+4SOSM9KE/RIhMsyzwsJOhibxySxdH2h3jKngeA/eIRq1bLlIDc2N+55qDUdkJElMTWOQoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134770; c=relaxed/simple;
	bh=lV7cn3wHDLCLp1GZjg2LVjd9oT9jGfOPTNvvw0Vnn64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCpJNTj4jk5UDl3mYycbYYcQEaZzXvaFVIiWiWvyQKpXi9P2JnfYaUHLLOhnsEgtHDXfiFouAcvhQTyZfkh0xwTD5tAO2gQLDodEhUkqivEPa0I6YXRCvlqpSsygQyo69XgZnp4Ce6bH9xoC4IRWCHXre4ua4ogWCf4aRykpH+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC3NOlTN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC3NOlTN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b966dd74so5604865e9.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134767; x=1787739567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnZE7wbRFGJKlrtdBKnnD6qNsCW/P/b4SFhiLIR6sD4=;
        b=BC3NOlTN/NRomvRnd2uMbqLX8Iiij1KQ6L9k8138Wy0XOhupLmGnPYGTKwOILk4qLr
         hOj53xQN+PtAXG2Vwv/H7A76GIKD67M49oyjjENeJRBGHHQgfeNksQmp8NunacgOK2Rs
         6RB6AuPtGJjukzUaAmkd3NsRjq/EHa52UxmYD6nD++AF/7hyMyR/tVkVkdstdpURU2bN
         x9ck7Ld8/1wBO25DHPycyjWqleAf5A1B2DM6b04Kl/Ap56U9SkQ4X2RGEcoRL+bR27nt
         rqTP3cIE4y58DyPjYn448Z9nlwuNh5zQrugnFpuPuV96+GV5b1C7K3Ku00HEXXO9lfzM
         Rlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134767; x=1787739567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnZE7wbRFGJKlrtdBKnnD6qNsCW/P/b4SFhiLIR6sD4=;
        b=c3l8DR5ca0eaAGGqJ3kbLTGao+MKa34vfAKoBdvyPFmdfpZWkKsXUX8d+0D+EyuGCC
         6ZRBrMSIlg26W7YsWhmyMnzUdF0HYrSkfqz4/Rm9ZmwSUV3i4OMfuHXvHb5LILK5n73E
         nEERZQiXIYa5RcSWIB5DRai27QMkTswna2XY5qI6cbzie+T6hMMk1fDt8mie0vcJ7EQk
         OgSt2XegN+j8xAd3zFpNfA5sopCls7558mUT7nxJSAYyK2I0i5v2DZc51tvUGoqd/Bl6
         AvNRBruCVksrNsqvUT4JKlQsn78j2QWXl0XugGK7DI55fCKJVmVFfDGiB0G+aijbTPDY
         WlHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnwiuyeYAbStpfHcaa0/UIT1n51jBjfE337OV/cFZiO5CrtSWxNzKPDpAJMZhJLzRooxbtS9dLMzOd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu5DEsMBPquLZMWujMrY8v4GfSVGMZyaGpKmmlSDDzm0Kl5iPH
	95T7JYVIEydc7lNAQA69+uhs5dOC8QRBvGxXI8XNOSTPxSAGmSfEMXkY
X-Gm-Gg: AR+sD11L1N0iFSgNwY5kn3SbJDXPpnLomJ97D+URzP4KnRQP2Y5BfX1/3ovQdUja/My
	aD3NOzx1OPe/MnTEMQdo2YQ5fDfc9aMvTs6ji9xM90s6VM+EWZS5fTozPY31an3TLArHTIUX6dj
	bJJbSwWLzH6DWlOfSqsP/5FW5J/GNP96ehKO8XFaR6euCrMfP5Fe77KqUJi8VX7VlJIdOpwwpXq
	q0EjGNp/3pvYSern1vvaV6wk5gr/xMiPxHdIOY/rdR82OW0EGEBNwKsRdwI4GsWWDZUoVuku47H
	Qde2Mdz3xntCbEZZgg7q+Hqq1SaM3oyxbebH8F7qPK6VAGykhGNRwAMaNwsIRezX9guTRHIBDf3
	cIdcm5TNHB6U2peqqVzxwhUw9BwOCOKgU+nC6lYF9GC2UoBcbXexsMOZ/VFOMpd0u5ovjIKe3YW
	AF4VT5qls4VqTcRbtoczgonzrl+4WoSqUixTGb4UdOZ7Z5swr0u21Vjjtvue8+wnDI
X-Received: by 2002:a05:600c:1d1a:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-499aa1dde53mr59985075e9.10.1787134766581;
        Wed, 19 Aug 2026 03:19:26 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:26 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 7/7] arm64: dts: mt8167: Properly describe the SoC watchdog and mmsys resets
Date: Wed, 19 Aug 2026 12:16:28 +0200
Message-ID: <20260819101853.44681-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 toprgu is not really compatible with mt6589 (it has 14 sw
resets instead of 12, and the reset IDs are different from mt6589).

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Also add support for mmsys resets by declaring the reset-cells property.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..cccc487086a1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
 #include <dt-bindings/power/mt8167-power.h>
+#include <dt-bindings/reset/mediatek,mt8167-mmsys.h>
+#include <dt-bindings/reset/mediatek,mt8167-wdt.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -95,6 +97,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
@@ -124,6 +133,7 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		larb0: larb@14016000 {
-- 
2.43.0

