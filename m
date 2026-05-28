Received: from mail.mdapi.ch (mail.mdapi.ch [31.3.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CC938D007;
	Thu, 28 May 2026 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.3.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779960656; cv=none; b=Ih9FrXFOk5rO3EUFMgH3JGr/xow88+nG/+mbcjVyXgl2a8dHDAGRfyQqMfkcL2tad7so2T7D/eHYIWYucqFGdw6hBjVMJdIR203FHdbwq5FcZVWrGCUtyFQiCd89obOx0PrcYcOk5JMc5uJL+u3kn0XwZFi2EGe6Kk18a/SbiDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779960656; c=relaxed/simple;
	bh=wYMjckmH14TiFJCINblFvyJpPS/lOHSs9L1EOp5+U6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W4SGk7eWHgR6fw+/QDLidU+IypGe8ESPUEYCLFiCVZLl01ejiDCBq0T+sR/zML/R5A7fH6NVz36IYdbP5XHBiElaO9aOR0JAlvvJDtPZDZRMb48iUEl5ra7NFoTgaYN55LR3lwsMA5TWkNlRPotJa1p2s9LXIxdzYHv5JQ8YGj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch; spf=pass smtp.mailfrom=tillo.ch; dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b=T9zY7Nxn; arc=none smtp.client-ip=31.3.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tillo.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b="T9zY7Nxn"
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1779960647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hUXazZYkDyhdjiv+bN79OJcCKaYJV/N7hpLsUqRQUIA=;
	b=T9zY7Nxniq8Bcglfp9Uib7EYGmBkAbg2EGy7g44w7F7A3+WDk3M0bb1PAka8lMcWxuZwbd
	OLxFzTkNr5KFb+ZdjL9tcDLKTiF3NXrWbij2/QMx+RYxM/frEplj69NA8m1qWof4iuO/0z
	5SyJGOnpZnpRhvSH1GDznMz/oqxy3GzNAFJ3Yq9x4JVf/++z3/yXRdmhnNMnXmSz4dsuF+
	/n6xuSU4hg/Q7RbSOGEkqP5fOIffTrHVa99WXkKyfreA7okzfwQgtigjtj+0m8qA+Y8EzU
	moAM5lndFPPa7ZUZ/UV81T9fLCuX9h/StE++r8fMbKzIN5qEo1gph6fUXlE5Iw==
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martino Dell'Ambrogio <tillo@tillo.ch>
Subject: [PATCH] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
Date: Thu, 28 May 2026 11:30:38 +0200
Message-ID: <20260528093038.1945245-1-tillo@tillo.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reserve 64 KiB of RAM just below the ARM Trusted Firmware secmon region
(0x42ff0000-0x43000000) for persistent kernel log storage via pstore/ramoops,
allowing post-panic console output and oops dumps to be recovered after a
warm reset. Without it, kernel crash logs on this board are lost when the
SoC reboots.

The carve-out is divided into 8 KiB kmsg records, a 32 KiB rolling console,
8 KiB ftrace, and 8 KiB pmsg, leaving the remainder for the per-record
Reed-Solomon ECC parity (ecc-size=16) which significantly improves dump
readability when the panic path truncates writes mid-record.

The region sits immediately below the ATF block already declared at
0x43000000 in mt7986a.dtsi, so no other reserved-memory child is moved or
resized. BPI-R3 ships with 2 GiB of DRAM starting at 0x40000000, well above
0x43000000, so the region is always within installed memory.

For the carve-out to actually preserve content across a reset, the boot
loader must avoid touching this region on warm reset; on standard BPI-R3
boards with the stock OpenWrt U-Boot fork this already holds.

Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
---
 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 19f538d..31ee189 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -140,6 +140,18 @@ sfp2: sfp-2 {
 	};
 };
 
+&{/reserved-memory} {
+	ramoops@42ff0000 {
+		compatible = "ramoops";
+		reg = <0 0x42ff0000 0 0x10000>;
+		record-size = <0x2000>;
+		console-size = <0x8000>;
+		ftrace-size = <0x2000>;
+		pmsg-size = <0x2000>;
+		ecc-size = <16>;
+	};
+};
+
 &cpu_thermal {
 	cooling-maps {
 		map-cpu-active-high {
-- 
2.47.3

