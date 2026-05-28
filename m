Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32383F39F8;
	Thu, 28 May 2026 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779972864; cv=none; b=K2sXEIW6rfC00lbACYHDVJvHlme1O6SrwLsradwcGoLw7uXRUCi8Re8iHm94VHzZ4zDdn0zMp5ujngW4JNeSfys+syBghOohafnaMLWkqdWhYZB3FkwPV7AUit8FVI/v1ymbInMzqvr1riOqXYB+jQ++K1yt5ZjfcyYjIRBTpu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779972864; c=relaxed/simple;
	bh=cXTxhQvbkhNHIuITv/zqHC1dhGaHaPn+/IP+fceB4pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U225ybfLdx+qPtKc9pRgLoT7OcwS3zR4KedDRAFcSzgaF+YGV/M1EZbS5Q8m6BCgdtYK9mP7NQxwwxKzuohQFzpBmJ0s2niKHd8VlprH9TfOIkHjcgtn90FZEB54R1ZWXRslON3rUsywik3iPqRCo00S/OVZzmS2jarLyUY8aZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mk/IpA6D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mk/IpA6D"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D166A19C5;
	Thu, 28 May 2026 14:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779972837;
	bh=cXTxhQvbkhNHIuITv/zqHC1dhGaHaPn+/IP+fceB4pk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mk/IpA6Daw8ESYdr6AONFalUBmnrqsvVBlWHIcx1t94DF6ra4HgOAMcJYGmKR1VPM
	 FIIatUCPuwDWw47IS0hCUX3Ev1cvMnxgpVDwiNhESQGH64959rQ/hg8pdEDJc5NRGl
	 a3LXGWKj41seQs2PtxsLIKk4/bMmnT+9p6HXTcuA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 28 May 2026 15:53:47 +0300
Subject: [PATCH 6/6] arm64: dts: ti: Use syscon and simple-mfd for the main
 conf region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-ti-main-conf-v1-6-a54ac5c8d081@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4100;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=cXTxhQvbkhNHIuITv/zqHC1dhGaHaPn+/IP+fceB4pk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGDryOjwwVGeZaCSX9groidyKtWqkmUmNWzicj
 NFjsz3exZmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahg68gAKCRD6PaqMvJYe
 9YjWD/9OpX/j5BFmJmjNaV5+xjkyicyuqO2d/itjr3K8PFMtLYy1mq60XiS4yvBTkb0aan+dKT9
 qzyNncpQCk4lx3ljwYk4SyJavbsDzV9eSfWWEiMmr5x65NMEqPxGYjGxs9is861ynfFqxOZ04Vs
 ITHoiB5gmlOoquqjp/ude0UvaYLzDpRivAYN7kEiaHMtLPVq3I22Nsio3Ce7ggsxdoZltd6W1NP
 Uq6Z7+m15SVZJUsOmV8b7jbp6uv244BK1k3VJ8bCCRTqQZQVJW9An+LoxT2lvMqVUTX3Pw17CvE
 mXqIphJZkptt6S9E8lFjIuH4+ostIf0A1UTySsxaO+CB2m0gH0foWSmzMEW/KRXAs2rrnL1AQp5
 x+QNaGl+fAFymQ3RNQbKXly8ybndSHbs7QAPHRw1Xrb8D6zS+74HUudMrW0MF67szeeVWcxV9V1
 Yhng0xM+Ho/DXlbv0toXYBSbzlNEkxE1IO9IYlmxZw5stg7/bMVUhV7gXv4uHd7EAuBb84KEt0J
 eNF+3m8kNsjMWfytGYdnDF4hEovOkez2jejuJf9H7UBqVhnzKDMcl/k51b19DI5jKb1FBXuJoL/
 B9QqP45LcJ8keUSiMVf1p9b1KcTEUaYjA1nwLQYPCPiR12Hai+ZwHcqjoXMUK9M2LgFgdKP/11L
 8h7mww1uA9HtJcQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

We already had a common binding (ti,j721e-system-controller.yaml) for
the Control Module region for multiple TI SoCs. This was not used for
more recent SoCs. These more recent SoCs just have a "simple-bus"
representing the Control Module. In a few cases the
simple-bus node also had "reg" property, which is not correct for a
simple-bus, but we make use of it in this patch.

With the adjustments done in previous commits to the dtsi files and the
bindings, we can now use the TI system-controller bindings in am62,
am62a, am62p-j722s and j784s4-j742s2 dtsi files. This means that the
node for the Control Module (labeled 'main_conf' or 'scm_conf') changes
from "simple-bus" to, e.g., "ti,am62p-system-controller", "syscon",
"simple-mfd".

While, as far as I understand, this is an ABI change, I believe this
does not cause any breakages: the old dtbs with "simple-bus" will
continue booting fine, with the child nodes getting instantiated, and
the new dtbs with "simple-mfd" behave exactly the same way.

With this change, we can use the Control Module as a syscon from the
drivers. E.g. on some SoCs we have a single register in the Control
Module related to DSS DPI output control, surrounded by registers for
totally different subsystems. Instead of having to create a new syscon
child node for this single register the DSS node can now just point to
the register with 'ti,dpi-io-ctrl = <&main_conf 0x8300>'.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                 | 3 ++-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi                | 3 ++-
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi   | 2 +-
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index ffc71ab623e0..3f61f2a9b2bb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -42,7 +42,8 @@ gic_its: msi-controller@1820000 {
 	};
 
 	main_conf: bus@100000 {
-		compatible = "simple-bus";
+		compatible = "ti,am62-system-controller", "syscon", "simple-mfd";
+		reg = <0 0x00100000 0 0x20000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x00 0x00100000 0x20000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 9287d7be7cc8..2a5cadbc11fa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -42,7 +42,8 @@ gic_its: msi-controller@1820000 {
 	};
 
 	main_conf: bus@100000 {
-		compatible = "simple-bus";
+		compatible = "ti,am62a-system-controller", "syscon", "simple-mfd";
+		reg = <0 0x00100000 0 0x20000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00 0x00 0x00100000 0x20000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 7c2f03780885..58805e287496 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -40,7 +40,7 @@ gic_its: msi-controller@1820000 {
 	};
 
 	main_conf: bus@100000 {
-		compatible = "simple-bus";
+		compatible = "ti,am62p-system-controller", "syscon", "simple-mfd";
 		reg = <0x00 0x00100000 0x00 0x20000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 2570723efa4f..cccd90d43446 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -46,7 +46,7 @@ l3cache-sram@200000 {
 	};
 
 	scm_conf: bus@100000 {
-		compatible = "simple-bus";
+		compatible = "ti,j784s4-system-controller", "syscon", "simple-mfd";
 		reg = <0x00 0x00100000 0x00 0x1c000>;
 		#address-cells = <1>;
 		#size-cells = <1>;

-- 
2.43.0

