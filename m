Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BBB3F0A95;
	Thu, 28 May 2026 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779972858; cv=none; b=gnG0buMa/nmkGxvL+6ANXqdKxdyimssEBgAg4v/g4bzcNXni03wr2TlyVU6YiZTEIUOxQdkC3bN6r8SoLqS4Eursni9Et/tvHNuv3NkYIrr2z5Fh20cATVMrERw51kLeAYKTcVT3QceuPoI6emVik5D92dmQf1L3bGLPgfp8kcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779972858; c=relaxed/simple;
	bh=KHvUizxv+fBGrkbW5KiV7JhkpjD6vu4PMZ6dowiSQD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kpOzfaCrCXc8AYfQyg0kAWXT58rbdXhBXDyxrLGxDxDJSW04ag+Z4Sm6G+bHQtfTJkl5T+m6jlUZ5GVZUJntsr4TzsdMdRqJMAgsqbWJzhhMOr38HLnMx+YrhwPwce2nybJqroVmwJa2VLxXxRMp0S0fbwM+hHGaBWUI1/5T6/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OxHZZ23M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OxHZZ23M"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DC498FA;
	Thu, 28 May 2026 14:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779972835;
	bh=KHvUizxv+fBGrkbW5KiV7JhkpjD6vu4PMZ6dowiSQD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OxHZZ23M+SvKO63RONIlhB1bgzdaq9lPVDhunjmIurNLAglwC/kWwm1Jpe3+ZulN3
	 QY/YLedpn3LuatKLql9RxDJ3GhE6vDXMgbsVs2RFYwPXJ6GN3rcgXCpbcSgRQ+9VxZ
	 bIoYN9xjTi8dE1sIfQcgHYrmGEO0OKfT2gTjIOB0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 28 May 2026 15:53:44 +0300
Subject: [PATCH 3/6] arm64: dts: ti: k3-am62-main: Rename
 'oldi-io-controller' to 'dss-oldi-io-ctrl'
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-ti-main-conf-v1-3-a54ac5c8d081@ideasonboard.com>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
In-Reply-To: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, 
 Swamil Jain <s-jain1@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=940;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=KHvUizxv+fBGrkbW5KiV7JhkpjD6vu4PMZ6dowiSQD4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGDrxmc7Y3gpZbi8j7z4j73LZ7+3h9uBy5cw0u
 0LL8CBkvliJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahg68QAKCRD6PaqMvJYe
 9YqlD/43cQmYfbBQpG4jL1RTyDN+DaDw/LTL0xcKQC5vvTOf4h0qr2p9X+CvCeGV98l1iHXvV1Q
 6cirPsFt6GmeBBQSjqWYqcrpf9nCpa3zEqdS2G2JiuPo5CkqyTXwEWRpi7EzmdGcuxtZqQJSOR3
 iClnOGqkaKy0sUHNReAcL9l1OHbG5M7L/3vqk90m1QKhnjHdrF6/u4vx7k02aK/+B26ahDGBw//
 F8bXNXi7yuh6g5UYYNhnZK6c+KOzlyhoquIgubtN5Vt7CU/cm2hw+3pmh77S1Mmm5QV2/xCZCB+
 4BaPKlWxcbmki/Qji+q8fC5Ov1M5hOcJEHX6bWHv8YWQ7I1SwklNR7EW/dETbTWFuYYQtwmEX4c
 15Q9nGYQTzBIgD0N8409ogZ/+znWgtHIx3/NVnaLwpxApVhuwHK6TAIkpm4HfGsSwLIPU0OxLsO
 qhvlOewhR3hrymvWPO3Jtmq3mSoaNqQ06muvvR26MTCUPhKdGqwSPi1cXN1gIkl9Tm1eg4k9hW0
 aEXWO2kYuDjzQ7NaKFB7qQJxA5PboM8AA71oMD3Bx6J9XXfaDisPBDP29qKZTn9H33tsExYnc+i
 zi6ncfr/kVpNaeV5Orbuoks0fLmIIvIXknq2VpW2qqOJb1FBiTqQj8zyv7jFKJ2Hra8KqRiM9Il
 hitYEScVbMwrDqg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

In k3-am62-main.dtsi the OLDI IO controller node is named
'oldi-io-controller' but every other dtsi file has it as
'dss-oldi-io-ctrl'. Rename it to 'dss-oldi-io-ctrl' so we can more
easily use a common system controller binding in a future patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 228f8c3e8bf6..ffc71ab623e0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -77,7 +77,7 @@ audio_refclk1: clock@82e4 {
 			#clock-cells = <0>;
 		};
 
-		dss_oldi_io_ctrl: oldi-io-controller@8600 {
+		dss_oldi_io_ctrl: dss-oldi-io-ctrl@8600 {
 			compatible = "ti,am625-dss-oldi-io-ctrl", "syscon";
 			reg = <0x8600 0x200>;
 		};

-- 
2.43.0

