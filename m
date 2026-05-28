Received: from mail.mdapi.ch (mail.mdapi.ch [31.3.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0242FD7D3;
	Thu, 28 May 2026 09:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.3.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961056; cv=none; b=LOD8z6t5M1+SzoN5vtPPFyI004+DImIwd0g2vSXervjRXbVFCEgKkk0ez/NbApR2NGEmLnzXjgFVwIZoORNw5k3pHwdPDsmsGSqrcEiZwkwqS5cNOY/5vsw/iZqtjy554t/+4X8xzTTsMam9ifXNzt54gtTiqJGvuyY50CP9W9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961056; c=relaxed/simple;
	bh=nqIyhVLUd+i9C/9fgjYlPR4kbUC+9INMd1R/PPtTpwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R7AHdwE0/jwGxzDGGROseFP/aduSCEmheB5qpdGSZsyKTfJjS6OGNSZl/QaHmVAA0K1AWmrMcdwHEDqFL0Qko8ppC5Y99MuTpc7JlPl5ZdhKn5AuMXoQClgx6eNMzaNrH/6kPkstdO8HoW8Cia1FDDsB67H9U3ETu5AVVF5a8Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch; spf=pass smtp.mailfrom=tillo.ch; dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b=DVKDwUoc; arc=none smtp.client-ip=31.3.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tillo.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b="DVKDwUoc"
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1779960544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RBWMq60AwDT71lXHyf/bfDDbjfiWdp2HdqQcnoI9g+Y=;
	b=DVKDwUocZsY6DVhSdwB4+1tZrA5DhMQjw2FZ4v28MoYEf6DUk94N7Yi+DFHdsbkrHDNv2g
	p8b6dCOeGhVpMgxWmhwdknvwCxnUX3Lr++DQFSdKuruevu6hSH6mp8rngFO9sSs0BxpYAv
	OUB62kO4EbOLngcXnBTbTqexJgSKRoDK9d6xlv8WztYHovWhwE27GCu8umJskJFEaDCYy8
	tlBMmKoo4cOEsQWwNI0CNcwjGsRVvNBSn+9AzPbemdRqst5Mqgs1CWBUExuFz/heRKbAjV
	FmxJAD8Z0DB9UaYAR8ZZv7nv/jhtUcIWtxjeXWygQYlXwLvIGxH5i+MZqKvD7g==
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
Subject: [PATCH] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region
Date: Thu, 28 May 2026 11:28:07 +0200
Message-ID: <20260528092807.1936177-1-tillo@tillo.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reserve 1 MiB of RAM just below the ARM Trusted Firmware secmon region
(0x42f00000-0x43000000) for persistent kernel log storage via pstore/ramoops,
allowing post-panic console output and oops dumps to be recovered after a
reboot. Without it, kernel crash logs on this board are lost when the SoC
warm-resets and the on-chip console buffer is reinitialised.

The record sizes (128 KiB kmsg records, 256 KiB rolling console, 64 KiB
ftrace, 64 KiB pmsg) sum to 512 KiB; the remainder of the 1 MiB carve-out
is used for the ECC parity blocks (ecc-size=16, one Reed-Solomon block per
record) which significantly improves dump readability when the panic path
truncates writes mid-record.

The carve-out sits immediately below the ATF region already declared at
0x43000000 in mt7988a.dtsi, so no other reserved-memory child is moved or
resized. BPI-R4 ships with at least 4 GiB of DRAM starting at 0x40000000,
so the region is well within installed memory on every variant.

For the carve-out to actually preserve content across a reset, the boot
loader must also avoid touching this region on warm reset; on standard
BPI-R4 boards with the stock OpenWrt U-Boot fork this already holds.

Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
---
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 0ff69da..f7d4944 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -80,6 +80,18 @@ sfp1: sfp1 {
 	};
 };
 
+&{/reserved-memory} {
+	ramoops@42f00000 {
+		compatible = "ramoops";
+		reg = <0 0x42f00000 0 0x100000>;
+		record-size = <0x20000>;
+		console-size = <0x40000>;
+		ftrace-size = <0x10000>;
+		pmsg-size = <0x10000>;
+		ecc-size = <16>;
+	};
+};
+
 &cci {
 	proc-supply = <&rt5190_buck3>;
 };
-- 
2.47.3

