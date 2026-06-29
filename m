Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5721F3F86E6;
	Mon, 29 Jun 2026 08:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723391; cv=none; b=Uij/vjzD0MmJSokpXwtCEzyPn0V8uXhilMawlr4+1hPmGF5sfHLmnaju0Tu8BnNIW5Q7v37sm8I0t7/mAPdhwMoOsLxUhS2KFfu/DK9saR9zyJ7uYMUxC93+wcIxcTvngiHoSmZh+/QtU5UArmBLL+iBwhE6tPCv+n17ZH0KuiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723391; c=relaxed/simple;
	bh=0yTRbjxySal/heahLX70Gmz85+gYWePyla9OA2N5Dsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gmT0cDIUvyNLpQ4mNVFCi2mtosZac98s0Yl++5DDITO4i9mKCu1sgOs31f6b9eza+WG9In2FJnIG6PRIE+ccciEuzthAuaSX3uN0nkt7d22sasTklEJf2ImGsjE7cJvOIZOlIDWwq/4Y/9ju/PqH7hCC5gRUmTzlIHCSyWNv1wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=flWvWT2R; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="flWvWT2R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=c6g7nbO2M1qqUr0/Bx4CqlMPDTHAgE252nPWP6AfYUQ=; b=flWvWT2RH9I4fVnnWs47isveqD
	GJQaSVchmfdboyk6+Fe78wCuKbF8JXDZfWf6iNtv2QduU1uZqmiZlDIB22n0cizqmbLXkn/asfBZC
	KKHwni3xOxNuilVCZoOlaLU/LXL/BcKzZuxi+ZUC6D7UC1eaxExIRVYTFAtkyZqDtECi8eFUG5op5
	ahpXOIFdT7wxlje+q91575PmxL9pB0Ug+WuVbsDj0sWzlNx/e5RZj7LlPBRrUjND1miuTJJZPggq9
	JWryA2DBjqEa+AKVi/5nPhV9rkYL4yGiuT3swLT3FareS+OlwXRKL8FSX7Tmv+CSxlY7lVaS5SICe
	XhDFTORg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1we7mz-000FcP-2t;
	Mon, 29 Jun 2026 10:56:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1we7mz-000K3w-1E;
	Mon, 29 Jun 2026 10:56:25 +0200
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
Subject: [PATCH 1/2] arm64: dts: ti: k3-am642-tqma64xxl: add ospi0 vcc-supply
Date: Mon, 29 Jun 2026 10:55:50 +0200
Message-ID: <eea90f48c139901397d65487a87b64bf1744587b.1782723206.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28046/Mon Jun 29 08:27:20 2026)

From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>

Add missing vcc-supply to ospi0 flash.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
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

