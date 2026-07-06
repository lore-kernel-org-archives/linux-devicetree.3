Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4C339AD51;
	Mon,  6 Jul 2026 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349089; cv=none; b=vCtjqT/vHVD6JDSqdfs8rXLldO4UH2X13ZR1iWlhFK62OCPtnID30D7wxYuGB2EZf45qIMqfkdzXJtQonX9h3iSwuVHwxnUBO6u3y3ArCgIHMNZULEfcb5ifyjIO441gG973eNhsjpRsiQITZaQ2A/yhr9n6HK4ayr7EKTt7NFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349089; c=relaxed/simple;
	bh=VU0/KvhS6qx25U7WVJHZgWIIO2IyQ49C5NinZqa5wDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BKjM/xobpzyM0UpQVhUEs63f3OlJXpRN2+ScQNF/qYd3SR/hWhVR357ara61xI7UYUggqqchNkHvwOJksH4NNeFX9XB2VriTb3sd9gQJYRhyWbImCJBvPJx46LbKQpNEvmt6KfMFXr8wrOCokrmF/q3QSwUPf6v3GmMlX8SFs/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=og3D7/CY; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="og3D7/CY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=T0YdnKT7KteZeJoh6QnuAYHusK3x4bTj+tOcDqFBpH0=; b=og3D7/CYJX8UEjk2kx94vwZGcI
	AP1R3eFY1UjLGBnYLHkGEvwRsJCiTKvwMySnPlJAscDo+pmW+rbKvUwRwamilRimtm5Y5alAShuTP
	dCDQdn65aUrUNob9k4MLo5/DkJ3XAqqEgR4K1OwrPYmJRCpT/b1R/ZeSdFG7XKMZGTuatqW/eMQgk
	OfnRAWKuRNw567zLKx2JPCd8Mbe5UsaJVhGdjflarwgqGx7aXxFvru6HOdkws5X7lzqzfvixdHluF
	6rOMvINJ9kE0VJM9DAkRyZCNkeLNlJ8TfCwwAsQJqLhtaHdPdp9n+yNw81g5wTbzXUsfem/uby3At
	Ay1/IVzg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wgkYu-000K6p-1W;
	Mon, 06 Jul 2026 16:44:44 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wgkYu-0006Gb-0P;
	Mon, 06 Jul 2026 16:44:44 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 1/2] arm64: dts: ti: k3-am642-tqma64xxl: add ospi0 vcc-supply
Date: Mon,  6 Jul 2026 16:43:58 +0200
Message-ID: <aaec2ddf7cecb58ca0af37d4f03afec571804757.1783348781.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28052/Mon Jul  6 08:24:35 2026)

From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>

Add missing vcc-supply to ospi0 flash.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2: no changes

 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
index dde19d0784e31..fe4cb49934bef 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
@@ -106,6 +106,7 @@ flash@0 {
 		spi-tx-bus-width = <8>;
 		spi-rx-bus-width = <8>;
 		spi-max-frequency = <84000000>;
+		vcc-supply = <&reg_1v8>;
 		bootph-all;
 		cdns,tshsl-ns = <60>;
 		cdns,tsd2d-ns = <60>;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

