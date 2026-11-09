Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233569;
	b=2KlquoXypXHuBYO4maKDam0JEYhzsqLQ0pDMvtUcse5RCesnbwxlSafJ5rEvwbMDqejN
	 /wpJfeDK/U7PH+cUlcmet4mPfQ5kdsqcJDsTfhZ1jNXplvZO8jZexBQg4U0Hxk3KMQxmQ
	 Vf3shKesrLHEdLD0Rti157Bz+C/UpP5o2y9sSKDpsiLCMjdAByZoh2SYFy0o1Kx3Tqajc
	 1Q8FQActrCR4hvyx+hRQdOyLOTF6VFZbR3PbZc1q9nBFiZYMXpTRKO9W2FkLDbtKAf5zU
	 LJqR+0Wd/HGUj+1wxkZPcaNjH2KC2any75jCmmYKPJhIOZC4/U+1uF+nLCK8CgwhUZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZuOsQOHsiS8QPwDnFYQbHYafUjBRSGU2wZy1UicFmfk=;
	b=YFX4Gp4pTV0Z2xZPedHPGAGOSTDPZ+eKbq8/VsClpKW6XqudenEVz9cELF+G4Ts1yb0E
	 9B4yksCGq0NRPxIjK0fqAaZY5EkUYBjmicZhS46cbGjFNkhaYyKEouAnP+QMHkEdySzxn
	 eK6vl4vCqFYjg6n4C1KmxGen6L6xKZ3qEo0m/38uLqsJTA38wrGdgK8o+8OWaQoZI8KVi
	 rer8tM2DN0WxnIrFnX+QC7vZ8Jj4i+y/9sisMX0v5sERdEDdQ+tdgBFuzvVCMpIJNd62k
	 24/CDyH8SHSjly9XdyM6rmbSUSqrvFYoCu0NddNfOhUDyAytB8dL0GUFZB6syXHDBmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UrTax12F;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AC9606A33C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70AC9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UrTax12F
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37071c0f42aso1749778eec.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233568; x=1794838368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuOsQOHsiS8QPwDnFYQbHYafUjBRSGU2wZy1UicFmfk=;
        b=UrTax12F7nYR43q8/+ySuoT3Ibvsjz380CU9T0IyHnc0HH1YhiA23rmdNLdVnSuzYk
         a8dHF7X6Q1dpw9Yagh6DR7DrIpZd5G72JFz0BgCaoyrvXbt4C3+vVrToZ6zaSkDNqAi5
         nyTz4JeW/IkBqdpZaFfG+L+YZsOfRo9uo/8Rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233568; x=1794838368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuOsQOHsiS8QPwDnFYQbHYafUjBRSGU2wZy1UicFmfk=;
        b=NcmOkVOj83IcvnW01LdlIvVH2k2F349+KeAk95irI1yYu6yoaP5OE4zoyOxpHcJ2PF
         ZWeJ50UXeFm5t1u0hpp06OI1V2UMz9ZjViri4C2Jpb8dVos/5zeKBq7NVG+JryTmrxj+
         WSCwL/6DRAioZCrz+uk9mLpdYszwSWSd5hhLm0lE8p4Bd6WuXpAjlkBNnY6k7IklRngd
         P21ZSu4L6f6wLvWvM3nlC6dBhCpNHFRvcgIar2TqTBdQJpFV2C3Kw7ZFU6b2Z4Izy//P
         zaq898nn5FOrGBqmduak9DQ+Hv0I5ZnQ2xOn5fvedPpYmWgLJa2n7S1cvdJDQGzJwYDz
         hvsQ==
X-Forwarded-Encrypted: i=1; AL+hErGR/V0n/2yFXoxpvHuHPENKJEj0pOWlarzRT2/RtQpYswasgXCOnX1TReXj8EvntVRNzgk4L2fJCLjj@vger.kernel.org
X-Gm-Message-State: APuU4Z/oVclEdJxkeFXtrH29k8RAurl9RYbyjvbibszkWL3NgzqdgHJV
	7UrBgYJ3QG02wINc5QIX5BSdHoSvjutsrKkGZ3kWiLqlhYnzI2i57zXlfNVJjpi30Q==
X-Gm-Gg: AYBFou0/HQPi7aKHpHKwGRfXxpj/U+pUCrxVnyohO/nprVyQafANDSqJtiWG7ryCmcH
	f0l9wgcsM65XPj5FVXXTuVzbCQ2St25XggD45BzE8lU/qL4v0LNkBVlT7hK6r8pT+YMj9cvuYD7
	x6O3v87Q6pIWwY8NXDnhyYJOEwLccZzIXDhCiyXqcV/AbxL/xTXbQQmyrh4ZmJZOb3e7r185gRb
	/xoNTv00ttkBBs/VgKd37sjDSq/OjzkYnBicjINsHgcCDMRYtpls/z8pPFeFMEZyMEq8i41dzsn
	Oa+h3X5BEp2fmOnrFy07FDFWH9eDNIypFaoy19Ix1V/6/H6tN+cKeBnz5WBjnOs66iUnJjiJQE0
	2MPSuiDBUHGBs22uddyUKWvzULzlvNvDa4vBkaKwUTAze7u3+D1CelPyXgeQxyUg/RHgiOKjt/9
	pdTk6GbQHJN5Rz1TwDOjwIUd3+ybR0Sl65mOukR8p//eY1r1RTOQYvWqX9xTuHzy2yZNigk9Ci8
	rEh2kQcv4cyCs9QE1/k/fQ5UFrkjWHsLMFg5znxMDH29uJ3Ferm2x/FD3TpF5x8SFnM6z3nLq6X
	ioDP05XDdfzK7igta+7Mt/B4OTPyMA6FtLvYigoLk+Dqpn2ByBDV0zf8I6tE
X-Received: by 2002:a05:693c:41c7:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37336acea27mr4873781eec.10.1794233568342;
        Mon, 09 Nov 2026 06:12:48 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-372631df629sm13253988eec.1.2026.11.09.06.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:48 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: mediatek: mt8173-elm: Fix DA9212 compatible, node names and labels
Date: Mon,  9 Nov 2026 22:12:29 +0800
Message-ID: <20261109141233.983830-3-wenst@chromium.org>
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

The CPU and GPU regulator on Elm and Hana is a DA9212, not a DA9211,
according to the schematics. The DA9212 has two dual-phase bucks,
which is what the device tree describes with BUCKA and BUCKB, while
the DA9211 has a single four-phase buck.

Change "da9211" to "da9212" in the compatible string, node names and
labels to match the actual part. Drop the unused label on the PMIC
node. While at it, change the PMIC node name to be more generic.

The mismatch against the schematics was flagged by an agent. Manually
tested on a Hana (Telesu) device.

Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index dd0373b45b56..be6e6fd7cd36 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -171,7 +171,7 @@ &watchdog {
 };
 
 &mfg_async {
-	domain-supply = <&da9211_vgpu_reg>;
+	domain-supply = <&da9212_vgpu_reg>;
 };
 
 &cec {
@@ -187,12 +187,12 @@ &cpu1 {
 };
 
 &cpu2 {
-	proc-supply = <&da9211_vcpu_reg>;
+	proc-supply = <&da9212_vcpu_reg>;
 	sram-supply = <&mt6397_vsramca7_reg>;
 };
 
 &cpu3 {
-	proc-supply = <&da9211_vcpu_reg>;
+	proc-supply = <&da9212_vcpu_reg>;
 	sram-supply = <&mt6397_vsramca7_reg>;
 };
 
@@ -307,13 +307,13 @@ &i2c1 {
 	clock-frequency = <1500000>;
 	status = "okay";
 
-	da9211: da9211@68 {
-		compatible = "dlg,da9211";
+	regulator@68 {
+		compatible = "dlg,da9212";
 		reg = <0x68>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
-			da9211_vcpu_reg: BUCKA {
+			da9212_vcpu_reg: BUCKA {
 				regulator-name = "VBUCKA";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1310000>;
@@ -325,7 +325,7 @@ da9211_vcpu_reg: BUCKA {
 							   DA9211_BUCK_MODE_AUTO>;
 			};
 
-			da9211_vgpu_reg: BUCKB {
+			da9212_vgpu_reg: BUCKB {
 				regulator-name = "VBUCKB";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1310000>;
@@ -658,7 +658,7 @@ pins-mux {
 	};
 
 	i2c1_pins_a: i2c1-pins {
-		pins-da9211 {
+		pins-da9212 {
 			pinmux = <MT8173_PIN_15_EINT15__FUNC_GPIO15>;
 			bias-pull-up;
 		};
-- 
2.56.0.455.g6c5a503b38-goog

