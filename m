Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060279;
	b=1rwWLFlo6FpU65bcvMHftg+bWhbYAWcb2eiWtMGqbi1JtBrIk0ZHMUQcN0ltFeZ6zCXG
	 YE6gvZRCqv/ICBghVonrbmBviD/zKxkXi7txoQuR7nXGaVsG7Pmx2g3E2XtLZn+XTUzxp
	 j7UUwbZP2lOsOXB2cIfM+qxY44NfF9v7PnJSQ3sXEgCnm4ezpIiPi/Dh5hb6BuQtwDFiH
	 GA2TgZowSXG1/Za/UAY/HaAW22mNpKv1wsRGvb9bS7R3TKKp3qpz3s3YC0pBP32wGL/VQ
	 vFcBQHInigN6Rtg/huVsqfXoB0X+PnohhGhMaoSKnIdrG3GEUHsyff1AReRSQJx+4rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y7DHeu4nEWkVzcf2sVY8OIlNAFB3fB9C0wQws70L76k=;
	b=FMV99baxuKJj6UDH4etYQoKzaB0Slsn1/D1ij2vbOm1ph8D31JEVsJLH2OVGrZrPMu/b
	 Xv6xn9XMM8ox9gcMkxhbcLRLzPdxCTjpF3b9VC6vK8hjUTbp9rMdG61vTX4eJDnTMl01/
	 2xNx8YWwfc22EKEAvtkfZONP4sWTrhNNbdLMYf9IjpMnGKcWNr+I38kUYCetj/9h02Cmz
	 zmQNg0hN3lCUro+ePZ5mZ8o40Ro+4RXUa57Gikb6RT7KlWA5KxzH7JSjNi48m4kTquYeL
	 n06CJvoJD8bx7T2nWbSJVniwfWVUTyGzDEEYvvpHoP7WK+R+jJ2iR0tTY57N5KSsz8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=asK1udly;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607CB606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 03:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 607CB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=asK1udly
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3ada81853so2052277c88.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 19:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795060278; x=1795665078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7DHeu4nEWkVzcf2sVY8OIlNAFB3fB9C0wQws70L76k=;
        b=asK1udlyHnjd4Ll6AZ4zKzTW/eiqYP+AfV5bMWEIYTPjfnVvc8kYt655lAOmadsADp
         rPDaKkf1JrewE2hvwMtOqi08kIGn7VTtFP9IHl5uWt9lSJn4z1OvdxwjhjwXd7HjoHQ/
         P4Pba4CkFmBRN02Hq/+5KeVSSkM0efROaOO6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060278; x=1795665078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7DHeu4nEWkVzcf2sVY8OIlNAFB3fB9C0wQws70L76k=;
        b=juFURWNO52OVXfT31zxtgLZ8uFbiDs8FanIamavtDonff4rs4SSPE7z3jW8xW0pAj+
         5h6ZWSu4DQrl7G8/VRtH4qkU+SbUZ6JVjj+GvMF2HQ0/KVi40dNvMWz2Fk1sfqLzuo0X
         5b4vPfAjzupir/hXs/a5sfHZS9+hqYKlT4jcC4rmwzpI4Q8jQMahRLLxc6ccz6eYl0ng
         YojUb7YdCEjAH+CNg4H8HpWfOcC5eicohvY8H/NFND9JwtI+UHQBmM7GjQSHerzmYgCm
         VeJ4Ga8m+yOXN+AdVRpOnhDXVQYmF56lansMnznqLlTWGCgkkYkDtZPPAfY9b2AGmoja
         66XA==
X-Forwarded-Encrypted: i=1; AL+hErGIaxmAs+/GvC/r2LbxFn5Tf06/7owiciePBDmGbynUu5/uYbgI+7HExS/MKqtYnI09BBQx9Nm5eqAL@vger.kernel.org
X-Gm-Message-State: APuU4Z9AcTRuo+BVAzlmhKZoXdp+yCl8IDnNe2zYfPlWordMPRi9PYFc
	kBedbkmvweoN/G834rY2xDumYFV2ZnCSzVVX/MksE5atJlyAEl+eZuFxY8h/Z8YzYg==
X-Gm-Gg: AYBFou1HEJNM6AU5KChT79JwRCLbS0bj/p9vlOH4zOCuTNUf2ps7IJjqatTAco+o9Lx
	4d4XDV2lFd1Jwwa8DhbeZHC5bp0ga+xBxUbv/F3Fdba/tJsBJSXCegX96mif5V7VxAckS7ctKvV
	fI628ZQO5pEOT6qAAuEmVDJ8Q3Y9IoRuGNfDvpmu684oJxwdOuznkIBEYglr86yXLyu8JF94tq3
	hyN4v9zIwnhy3UOs2JJyI2VZ+q5/pl5kJVokNfcNBTeMp3xvYxT0TdjZKR/x7XaCW/EqSZZ+2mX
	HxYmAUCnOr+/Qxv0rdye4Dvpec7J1cKk4+bXoXFREjSqzBiRkzqqEpitEUyyOKGSGnRy6mmZCvL
	TKx6ezTmVxU02E0T2eTMX8NQtDa3w0yf7hbQAV9PernEL9w9Een7IEGkr+IY5+EVBbjmjmz7nFB
	N0UrTM89ExRKLCvp8flMfC0d6pw0/OqtAdvIqu+vzvqf0EGk6uk/Ei5TnFwN7pm2upUkZiIJ2NA
	WoY+q4wUk9L4tU6SXBjmiH/pFmCLbBpo/GvF7sFQofmn7ItVOYM3p1n2eHz70dWqg2OAul9ReWU
	JiRfpDLTtqdl/9f2rqiSKx/FWB4ruxMBsWaDHMUfcEpPa5IPkecz5UxvKwB+3Q==
X-Received: by 2002:a05:7022:ea8d:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b543d0cb92mr4257326c88.38.1795060278321;
        Wed, 18 Nov 2026 19:51:18 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:5ec1:f878:4926:ab53])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b5447c5b02sm10392500c88.6.2026.11.18.19.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:51:17 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: mediatek: mt8173-elm: Clean up unused MT6397 regulators
Date: Thu, 19 Nov 2026 11:51:12 +0800
Message-ID: <20261119035113.4046607-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Rebased (so "arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad
  supply as always-on" is not applied)

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 ++++++--------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 1b8f1b6fd788..ac5e9e387294 100644
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
@@ -1101,11 +1094,8 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-always-on;
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
2.56.1.708.g77570a6a1d-goog

