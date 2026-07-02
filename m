Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F128D47DD64;
	Thu,  2 Jul 2026 12:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994019; cv=none; b=obqT79RVt38/xEFUDJ2yDZBWB8ppl7PehB28/qt3Jqy+lANX6zBk2QSELORiV8tRO6fgwyUvgSJO3kHYE7XiOQSJjdcnHJCKzXfJTkX/jKqBLLSSXsX6kRWGNpLI7albayLzXWsKtNeLrpuY8lvUtJfDXsH7HRg3gEhrCUodclI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994019; c=relaxed/simple;
	bh=y/nTCCubfQIHxjED5Vxzczov4TsOcbe98Fn/E9FqjtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TTZi2ZxbGO1YChEK0Aq1SlpLbp8rVNnMsjouYW0TJEofOEglmLVGSdBUXva/N0l9IgOKrf8oDLyixhAo+MB/cMp+igMTlFSxUIH8D4L+HAuElObZcHM3A20V8bl10tXandSnlljGJsrY+8W/Qxa2V/RaJo2/cIAGarqH50pqAvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=mikWKQ4m; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="mikWKQ4m"
Received: by chaosmail.tech (Postfix) id 479F51C9B14;
	Thu, 02 Jul 2026 12:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1782994007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rTQPPhDVeTbGbJ1qfR9lTcAhGLsRnezT+O5gDJeLhT4=;
	b=mikWKQ4mL0CHzCRJY9+4Q7zXIimYfNm45RWwfPH+qv3AgZtwFt27ZzjbfQAEv2zy68J3rg
	h9npeNUh/EqYGdgrfg82/6a4m0NIJQ8pjeSH+NBZ1xMrLYU3gWl8J39X1GEoqaNewwqJOa
	HRG40gtuER+/9ne2bloBnwadCV+2/cI=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Thu, 02 Jul 2026 14:06:28 +0200
Subject: [PATCH 3/3] arm64: dts: apple: Add pmgr-misc nodes to t60xx
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-pmgr-misc-v1-3-4f075a3a95c1@chaosmail.tech>
References: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
In-Reply-To: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782994005; l=1610;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=y/nTCCubfQIHxjED5Vxzczov4TsOcbe98Fn/E9FqjtI=;
 b=dwtjnGYdattP+uckewxWWEoavs3g6XrxmfZGA/49zaRK1u0+BG6/ORrHj3lfeQ9LQUUzZWTzp
 uqpP2WPwAD/B/OHGzncQQdWuq8/v48dIFbobFzMDYTWfaGjg0RjGEqG
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Adds the PMGR misc control nodes for M1/2 Pro/Max/Ultra series devices.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 7 +++++++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..3271d234b483 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -24,6 +24,13 @@ aic: interrupt-controller@28e100000 {
 		power-domains = <&ps_aic>;
 	};
 
+	pmgr_misc: power-management@28e20c000 {
+		compatible = "apple,t6000-pmgr-misc";
+		reg = <0x2 0x8e20c000 0 0x400>,
+			<0x2 0x8e20c800 0 0x400>;
+		reg-names = "fabric-ps", "dcs-ps";
+	};
+
 	smc: smc@290400000 {
 		compatible = "apple,t6000-smc", "apple,smc";
 		reg = <0x2 0x90400000 0x0 0x4000>,
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 8622ddea7b44..121f2cf75915 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -23,6 +23,13 @@ aic: interrupt-controller@28e100000 {
 		power-domains = <&ps_aic>;
 	};
 
+	pmgr_misc: power-management@28e20c000 {
+		compatible = "apple,t6020-pmgr-misc";
+		reg = <0x2 0x8e20c000 0 0x400>,
+			<0x2 0x8e20c400 0 0x400>;
+		reg-names = "fabric-ps", "dcs-ps";
+	};
+
 	nub_spmi0: spmi@29e114000 {
 		compatible = "apple,t6020-spmi", "apple,t8103-spmi";
 		reg = <0x2 0x9e114000 0x0 0x100>;

-- 
2.55.0

