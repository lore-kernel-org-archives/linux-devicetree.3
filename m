Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609703DB625;
	Tue,  7 Jul 2026 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417866; cv=none; b=UYpRW+gtI9vjJqrZtEsZhJ6vDafNyZAMqdSH1HbaPV8E3qdnd6vTut0kePqb5Ngr01hc/RVJY4f6TUGR9JtNrPOsHGD7GcLGyWe7/syh/4LiAmsmI7sp+XJ2Ojrdjww37yM8drzPkEKj+G9Ctz8Tq6pMU9l17wA7Bz2U/BMg1e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417866; c=relaxed/simple;
	bh=cywkccQe1XAEOD1tASdnN5MWjkCOHGSde/ZkkaLEFrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tb7Z6hRn6lEWbBhImOrLqEJ63ZUvvMpDcrN7y2KioHqNvzPF7uA8/fkHEwBwGRbECOTcgC14B+CjoXeaNWRmr5e6eKYwIjh0byz59oiNNWFKTfaWM+eN78Myd//+YKie0mWeyOSfTobSqgHwgCaYNr75VfEylyhE6whYqYgjv6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=D7rApP3B; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="D7rApP3B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZIbqy13pLdQp9hThVjpx/QgDX/Sny7F5ndXxNwOzYTM=; b=D7rApP3BpK6FlX+DrOI5XdkSuj
	LiZt9CZEYbGzZ//UM9Br7YKajA1dDdBOnuyAo+AMT6QPEW8eXByrRxF+paWNDvewdlCWo6lmGEdkU
	hqHG+HYk96HP08CRKSlPUakpWsR3cotAM0zyy64cydil3tUKyGxdcf+4C2Kn1YXEyJwYwvCxhRdzB
	xurTq/99x/3qQlyrMvoW5BEV9o1IEbBusFrR/OMCJqJLIWnPT8pF21JrYyoaiKkQs+UZoPoziXDZn
	eWQht6moFG/7rkSBj56NDH7Uv7VwXoD0CWZWvb8bPk8iA+M+q3URpF2XAe6Vi2Q5LlErDjlfMj0YO
	it5PUm3g==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SF-000PX2-2C;
	Tue, 07 Jul 2026 11:51:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SF-000Ck1-0C;
	Tue, 07 Jul 2026 11:51:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 8/8] arm64: dts: fsl-lx2160a: Add vcc-supply for SPI-NOR flashes
Date: Tue,  7 Jul 2026 11:50:55 +0200
Message-ID: <20260707095057.1745867-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
References: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)

Both NOR flashes are powered by 1V8 power rail.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
index d64879ee5e54a..b1fa9de0011fc 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
@@ -29,6 +29,14 @@ aliases {
 		ethernet17 = &dpmac18;
 	};
 
+	reg_vcc1v8: regulator-vcc1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "OVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	reg_vcc3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC3V3";
@@ -65,6 +73,7 @@ flash0: flash@0 {
 		spi-max-frequency = <10000000>;
 		spi-rx-bus-width = <1>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&reg_vcc1v8>;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -81,6 +90,7 @@ flash1: flash@1 {
 		spi-max-frequency = <10000000>;
 		spi-rx-bus-width = <1>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&reg_vcc1v8>;
 	};
 };
 
-- 
2.54.0

