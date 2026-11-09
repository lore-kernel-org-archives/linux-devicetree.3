Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233566;
	b=vOJQwZwv0bHCJSpkbYTnRCM34+hDQelIlXQr1o+u7EJMVa0e6E5w3MlltR8bFhBd0jWq
	 lX2Jyd2NwwARmO7VCI0FQCYN93SsIfVPAlm+EMv3ryG4mxTESg86x8/S5LzsUpOvRRDdJ
	 u7k3eq0fQPTe4fafxkJJHAQ5hBgvIBP/1pYoqyfdV3K2EgBB6Q91debPewPL05TvLLViP
	 EzxBsWfeVdBvI0WwyRJQTlcKXw6RfAv5MLeCLzxGBuMBg3JAIwfwRpEsrGZGG9FBVdeKI
	 dwm78813i6nxVFOUa1n8QW7QmwxnsVOlzaoiohAsmO/QXelAkAbHEjvdk2rncV9NJfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P6VJcdeGPLmQQkKLnT/yRNbiCAJPKjitwFw5ODXVfxM=;
	b=ds4Hzwm8aKsRxxhy8mvtmAlvZag0KDC2oNJfo11G+8s+HHdsoSlBOJauah63/NDx6eER
	 BBOXC4wJIZeNdH+LcruGMP/GbWdr3ZphS1ZQwHzNdOUN0fsk3NP90lJY/Bj93/SM4GQ7Z
	 BXUAd3WV3SMsSnQulpch4TqwHQH4PvQ9D37n6VYCP29r69Cut3WLZoVSOmrouJoar9c01
	 23ewPUlmitqz0VBTM2CZUb2COwJGerk5blo/Yu0hlsOfhNWl+HwIEcsT+2+cs2GwA5CX6
	 lRPw5cTFRbBtZ7k7IiBMOqW55c2Qa8gnBY1ZfAMa9XjCQfvzJoxWbX0g57vnvw0xG2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dRlC0QAJ;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6009B606A334
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6009B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dRlC0QAJ
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1aefd1bf74aso774844c88.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233565; x=1794838365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6VJcdeGPLmQQkKLnT/yRNbiCAJPKjitwFw5ODXVfxM=;
        b=dRlC0QAJCckylUWs3qDlJ6ej7WYZqMmz6DcTOZc6bi/YTVSu++odn0H3baflO+O8kr
         nwYw6CN5XHqGNFRM1XOWegeKAfQWrUeVIlFA5PpRCpuUkzr0cXlMEUzIPXE+4/LLRqQw
         a58qgJJaQjVM1nIrPj7QlWcNQVJGuQw36vbLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233565; x=1794838365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6VJcdeGPLmQQkKLnT/yRNbiCAJPKjitwFw5ODXVfxM=;
        b=wnCXMRQdpmYBK0wcFtd2Y6ktq6at2SNqTq08fZA6mXq4hdm0LTRbREKQiwFvQxodPH
         OQjaX2QUmQJOOueIhFD1UVFW2Mn6y7JD0nkO1KMs4LHFWlbep6BICIwW34wYd4kuzgxt
         WwyrICr+BpKBkmTVxeKbag3/3Ja+KrMrvrH8d1uRaUHUFy9Bpd9yOlziXtqcb3gTwcfj
         9ZNbAgQUjhsKDwPPDRm1x1FTRvm8Xkw/YoJPwdUu3y3zMVcXyF0oKJYKI2+MnhlFR0Cx
         Y34kPbNTifOOxgwYLC4dCQZfJDTrPWLM15nQzLOL+Wknmsxe7qhkVIdWCr5L4ExBQH3M
         7qDA==
X-Forwarded-Encrypted: i=1; AL+hErHs+zsDv7AxQ2IBcXRUsUxCh4xVDoDGCEfy1Cj/vZBNXx+k432y5mufKiTs6eFWLETdQ8mXhNw6rTxk@vger.kernel.org
X-Gm-Message-State: APuU4Z9vGLzy+v49ScyyZLBmd+kxwsXl5d+k0aBoV0TsuQssw1utREmb
	udnmyj/PO+XLQA3Ht5S4pW4JdbC0bdH6vOge0qxthHsHap4V09ZnUm06I9CavzJ1fQ==
X-Gm-Gg: AYBFou3j9gP1JpLL7GOUIz/mjnyqMIWASB8an+wX1FxbWf5xYTLuXjFY1LNSsLWMJaW
	YDazEAvIt6AeMaD1lp5/nsbE0aIPbtuLLgZBGg26alrZwlZhD/jzyMREuvzbOoZBsOq9lfSSutI
	W9MwF/HILxvzujQea/ywQz36fRMI3XxoWJ+hxti4rBBY2YNULuSOv8tVAD3vs0GTEfeLg852+pw
	PxOdhATPqpiumoT8LGnlvNjFd4Nmd9jSMMIlQa4sEaNsaGb8Mgo1KgtN21a7xfM4LuUlo2twZvY
	2rSiXC05fkVY4TaVRdKDbj+EgHm3FZwSi2e3qcxK1Or9ExbAtN7W5BaOnmHbVb+UOMK6hjt6tBX
	EfpLmUGFPHDAq4VBhib9GPyssMsze9mwpEtW74x7J+NORQXPq/Cf5tn41fVdwCR6dY8v3cjuqkE
	Z0R8MwRMsGjjZZ3BDA2OU4o7P9K3cEY06Uuuy47d/4u6tv4pdGF6LNxMh1zL+Yv50/hOz4SJGRj
	n9spR2pgqRtu6N7EFWR1WIzIpTOg3zv+Ri5RxGgqHuMA7xw130q6famOgbcykvuk5BTtTdnIalj
	csbgAkoZexQ8/B9Ek3+aXcBvjmuXRoy3CFYi0HOXH04Bm3tvaiOQsO2bCyl0
X-Received: by 2002:a05:701b:428a:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b269b0c10fmr10662445c88.14.1794233565388;
        Mon, 09 Nov 2026 06:12:45 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-372660f444csm21084768eec.19.2026.11.09.06.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:44 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: mediatek: mt8173-elm: Clean up unused MT6397 regulators
Date: Mon,  9 Nov 2026 22:12:28 +0800
Message-ID: <20261109141233.983830-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
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

Several MT6397 (MT6391) PMIC regulator nodes in mt8173-elm.dtsi are
not actually used on either Elm or Hana according to the board
schematics. They may have been copied from the EVB dts.

- buck_vgpu: Output pins are unconnected; GPU power is supplied by an
  external DA9212 buck regulator instead.
- ldo_va28: Only connected to a decoupling capacitor for the PMIC's
  internal audio codec and fuel gauge ADC blocks, both of which are
  unused as both boards use an external ALC5650 codec and EC-managed
  smart battery.
- ldo_vgp4: Only routed to a test point on Elm and an unpopulated
  resistor on Hana.
- ldo_vibr: Output pins are unconnected.

Keep these regulator nodes in place so that the regulator core still
considers them constrained and can disable any unused rails left on at
power-up (such as ldo_va28), but drop all their properties and unused
labels. This is meant to preserve prior behavior.

Checking the regulator nodes against the schematics, drafting the change
and reviewing it were done by an agent. Manually tested on a Hana
(Telesu) device.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 ++++++--------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 2c6ec714e117..dd0373b45b56 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -988,12 +988,8 @@ mt6397_vcore_reg: buck_vcore {
 				regulator-always-on;
 			};
 
-			mt6397_vgpu_reg: buck_vgpu {
-				regulator-name = "vgpu";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <115>;
+			buck_vgpu {
+				/* unused */
 			};
 
 			mt6397_vdrm_reg: buck_vdrm {
@@ -1017,8 +1013,8 @@ mt6397_vtcxo_reg: ldo_vtcxo {
 				regulator-always-on;
 			};
 
-			mt6397_va28_reg: ldo_va28 {
-				regulator-name = "va28";
+			ldo_va28 {
+				/* unused */
 			};
 
 			mt6397_vcama_reg: ldo_vcama {
@@ -1079,11 +1075,8 @@ mt6397_vgp3_reg: ldo_vgp3 {
 				regulator-enable-ramp-delay = <218>;
 			};
 
-			mt6397_vgp4_reg: ldo_vgp4 {
-				regulator-name = "vgp4";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
+			ldo_vgp4 {
+				/* unused */
 			};
 
 			mt6397_vgp5_reg: ldo_vgp5 {
@@ -1100,11 +1093,8 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-enable-ramp-delay = <218>;
 			};
 
-			mt6397_vibr_reg: ldo_vibr {
-				regulator-name = "vibr";
-				regulator-min-microvolt = <1300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
+			ldo_vibr {
+				/* unused */
 			};
 		};
 
-- 
2.56.0.455.g6c5a503b38-goog

