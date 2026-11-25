Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591745;
	b=Hcl3h9o+9m+kZA8iCAQh5OfJdDgFIrU1NGfJe/uvT8U7kkdWi4jj64Jbdmk4AwiuGZW0
	 bTeBDWd4e9vmDdVOT5An9O813yyKODWFBPSRo6zgiRtWGIVSLj5yeGPYXxY3byCUjEoxZ
	 KsdffeL4b5tZJaWW2h/ZdK9j9lWLwOhvDJHT5oeIRQXajNLTxX1AX45gyXrrULjGtK0XI
	 SXPkwLc5EuGg98+XN9YhFoWDGHx4rUm/zQpJqi5Q2YXBLQptmh4xmItvC7AIx4vu+h8zg
	 VNdO4exqDKWdC5G1ft8LnUAO/FhJ0+ay3JLYZV81VkozMD70w0BDc76wwJhCw2yFMmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591745;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Virus-Scanned;
	bh=9jyaKZ/VFJwAh6HZS6RG4g1jhkDFJz3AhtVW7deBSqw=;
	b=hwjX10I3bu6/6hWDf3OAFshtMcY9vepeGZWtz01EiHQCYz0yIlXyYbzk4h3r3O/XzK8a
	 4ts3MZ5oEaJWMXh/NtH1/Ly/hm9UtBLvZuhW4R2Vv6oawk6Byvvoa5mxxDXZ6LpHwmsKT
	 6qIt7GW2b/+O5zA+fF5nUN2cuj5u6VaFE14eSTuoS9RHyIEa4MvqNS1va3C0NUyGdFEAB
	 XfKErMXHhVUx+KrJ8YK4hfjABFm0mcC0ZxJ7MV5zXxcC+C1/D+rl1xvtklGq7EECzYMnw
	 DUTiH2fZqbuM4UKEJ9Fy0eFCqMDto1NbQbDDVb+InVQ1k0PjlsILkm0Ha57XBZ3ASpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=EIMUFJMz;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69539606A330;
	Wed, 25 Nov 2026 07:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69539606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=EIMUFJMz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9jyaKZ/VFJwAh6HZS6RG4g1jhkDFJz3AhtVW7deBSqw=; b=EIMUFJMzu67KcrPValoiIaRwIg
	0qx/LSevFk84LShXpJ9b9Gv0+P+a2UO7wSLNFyrzuvjs4kMPiI1JigxKx/99AIferkTs6mbrxddT+
	Io6uaMFM1VGPe5K3R200h/7Yc5IDdvdT/AV8prBcromu5rXbIPs4uq6txY4CrWhHwPGQ9VwEK+Aqw
	07cJ/LfErvKXe1Mrzvd/dMGb5gXakmw1zdaNzdzlbiMX9hB55gneRnODNZFMplm4a3DwF4GdSg6+0
	dGK1VTz8AHbu93H2prgLLZ5mnFt7gsyIVL3SgctkUqJDZv3xEBDy4RUI/Rb7NGzfUPUw7q0segrmB
	xJwcD1hw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R3-000Fhk-2O;
	Wed, 25 Nov 2026 08:28:57 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R3-0007YA-2a;
	Wed, 25 Nov 2026 08:28:57 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] arm64: dts: fsl-lx2160a-tqmlx2160a: add aliases for all 18 DPMAC instances
Date: Wed, 25 Nov 2026 08:28:46 +0100
Message-ID: <20261125072851.3379079-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
References: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)

From: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Each TQMX2160A comes with a block of 18 MAC addresses. Define aliases
to allow firmware to statically assign these addresses to the Ethernet
interfaces.

In addition, udev can use these aliases for predicable interface names.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
index aac0ae0ad40c7..c0c5b8e22d61f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
@@ -8,6 +8,27 @@
 #include "fsl-lx2160a-rev1.dtsi"
 
 / {
+	aliases {
+		ethernet0 = &dpmac1;
+		ethernet1 = &dpmac2;
+		ethernet2 = &dpmac3;
+		ethernet3 = &dpmac4;
+		ethernet4 = &dpmac5;
+		ethernet5 = &dpmac6;
+		ethernet6 = &dpmac7;
+		ethernet7 = &dpmac8;
+		ethernet8 = &dpmac9;
+		ethernet9 = &dpmac10;
+		ethernet10 = &dpmac11;
+		ethernet11 = &dpmac12;
+		ethernet12 = &dpmac13;
+		ethernet13 = &dpmac14;
+		ethernet14 = &dpmac15;
+		ethernet15 = &dpmac16;
+		ethernet16 = &dpmac17;
+		ethernet17 = &dpmac18;
+	};
+
 	reg_vcc3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC3V3";
-- 
2.55.0

