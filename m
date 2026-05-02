Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A933C2D3220
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777708193; cv=none; b=RHeLA5YMlE6bvfKoW01Nvy/tjpaAh+o6PfEFUvX5Aj0RT5820WdtouCPCCWcLEQO6QiJPICYfPcURpXDeVfyAKuAkRksU9BZ4Ch31PlfrW2xt2e0L0x6pX/M3jpt8oFl91L+Wkj/uMJX2YTR91l61e/QlcQmzrLf5APy3rzvpa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777708193; c=relaxed/simple;
	bh=RqPgRU1MNYczYD9Dtu93nE1gf1619BlOwGsH7J3mUmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FhsQNqKoXRfESc92GHhtEuPUOEAaaDTA54Z6z9ag3uoH5A/qfJr2G0cJMOzdLq8CwXVcPL4+7sHit9WQvSxD2tb8yWKdhZxjEzVKYUu2PFEE7DL+fNxvSOJNxrU4XHHN3WOqBig/lUbZCwEh96taL8nKQaZbru8oITGZXpYkYXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pcc.me.uk; spf=pass smtp.mailfrom=pcc.me.uk; dkim=pass (2048-bit key) header.d=pcc-me-uk.20251104.gappssmtp.com header.i=@pcc-me-uk.20251104.gappssmtp.com header.b=g5+o48UM; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pcc.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pcc.me.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pcc-me-uk.20251104.gappssmtp.com header.i=@pcc-me-uk.20251104.gappssmtp.com header.b="g5+o48UM"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so6796134eec.0
        for <devicetree@vger.kernel.org>; Sat, 02 May 2026 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20251104.gappssmtp.com; s=20251104; t=1777708192; x=1778312992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m+ZeSxbLTHdUprUeLJ8FV3dNcTYT+WtrO6078xK0XsY=;
        b=g5+o48UMBSd59Rebj6InUmGyWQZxxyw35yU9U2a60rXHgrqJsY2T84xmTRTc5bhK5y
         RHNzjF6P3e1wgoUOiW3mabQR+1S4Ih/ijKwqV6c07a934pnKyGMgzm/sRYW7JKROZFHx
         VOZiqhm0x9oKRGApsg6puqWI3Jd+xrlQ9ODrSoB//B8/kVC8uvZCHQYPUTskqSEErRHi
         aBQXC8j/ShBDP96JQAQDTkTJlcJ3ZCaPYDYTw+PL24HSDtXjWI4YleXxZs5ro35hGRnz
         GLoaapkIz28BqRZ3NCoK9DE201Mpuuh09XHZPx5RLkav1xSuams3TJPUrQVlWOszH2NG
         GzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777708192; x=1778312992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+ZeSxbLTHdUprUeLJ8FV3dNcTYT+WtrO6078xK0XsY=;
        b=R9JevqjHHY07aGLrnroCnjE5jtcLPL/QYTSbzfT7djo71ieqaJP56VfYafKHiwN2Pa
         meITAnrqo4RE1xXNul63ECCMdvwu7bl3hsqt18h+y8d+bPSPLOmlbBP+ugUbsrjs/7Hj
         tKaqaIU6aycjE5W66kz2NqQmE7aHZG0151x4cyQUA1kPIsg9vYZyZAU/3RefMJ4G080U
         Xu/YY55CWTUXkLG/HJb5yW1hCN0rlPWrhM3O4XFq75l4160emlZ2m1HBMNBmimMIc0wy
         hGd+H6LfPC7trHOJ6iSJZ1GGopZPh0vSwKfGaJllj9cq29vfEmUEvjxXXmkHlbGRCXWf
         aFOA==
X-Forwarded-Encrypted: i=1; AFNElJ9SiUuc1n8YOgFKQ3uI1uaIxb7XOeuKupgDFAaTVbp+2iyRzaM3cQs/521D58eeaJ+uwHYkRBMVJcVM@vger.kernel.org
X-Gm-Message-State: AOJu0YxOdQQXbHSkKy1oohx0Cd3HFWv/Vp9pTe59/N4hgukTesC7PM3w
	xLTtmSYhqt5bVnI4EK0c4Y23G/hHsfKI1vHBWmWrqP6WkFgoH4GDMOhAuL04gaFvqAc=
X-Gm-Gg: AeBDiesLFsF/mFuqe/4+24l2FUuBfcpI/iv0pZJDwtj71PP6dg97liCPf88lleKqkxR
	PCGEnAskt/N/YQDQ+RpCGkwV3wToL8GO+meVI6egDSB7zHOGC493mNaXaihu3MkoQr9+71Z1H1l
	aSZFt/r3XQtDEOv43aRmf19hzoeJdIhq1vzBYnEblQMFaebydWojMIU5mvoufstRfTOkijHhcqQ
	iikj3zn6n+z6phwltUrxd/3PZ1o8+3IM/DWClLjWtN2sdUxCcUxVGygmmROBaGnm4eV7r3rNkJE
	1Py4/lsjnu5Fodyt4pMfAGJZAsg1ZJ6qS+9ySpCAgwM7mOpaanA3zas2daQZXsKN0GIRaF5te6C
	vPimGQEBU1Q/jrBsc1qPkDM9MBeKv4p0o5jyL0+lObtv2AVvJGVzv0zcka9E0QcF7wUo+isQl1Z
	7QdodvsKTeAq8aGbsWItDHIfJI2Rkf1pNq0VG6EcORWgwcMEjmPcsyjAseWN4NAAw+Xg==
X-Received: by 2002:a05:7301:6706:b0:2ef:1d11:18ae with SMTP id 5a478bee46e88-2efbb29039bmr1022967eec.28.1777708191723;
        Sat, 02 May 2026 00:49:51 -0700 (PDT)
Received: from localhost (c-67-180-161-137.hsd1.ca.comcast.net. [67.180.161.137])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ee3bb63c5fsm7422380eec.25.2026.05.02.00.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 00:49:51 -0700 (PDT)
From: Peter Collingbourne <peter@pcc.me.uk>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Peter Collingbourne <peter@pcc.me.uk>
Subject: [PATCH] arm64: dts: mediatek: mt7981b: Add PMU
Date: Sat,  2 May 2026 00:49:12 -0700
Message-ID: <20260502074912.12193-1-peter@pcc.me.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt number was taken from a downstream DTS of the similar MT7987
[1] and verified on my OpenWrt One.

Signed-off-by: Peter Collingbourne <peter@pcc.me.uk>
Link: [1] https://github.com/openwrt/openwrt/blob/e4b3d5c799aef3be20b7f6079e8e5a14b215c116/target/linux/mediatek/dts/mt7987.dtsi#L246
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 4084f4dfa3e5..3c6fbb6c5333 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -38,6 +38,12 @@ oscillator-40m {
 		#clock-cells = <0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.54.0

