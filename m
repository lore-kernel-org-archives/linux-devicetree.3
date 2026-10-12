Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48171FE44A
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776408; cv=none; b=A360RxrotTYTd39y5xvaLXoa044X+RfGjqdiWA/I1SeEsBEJG+iz3H2jIav2e4001pCe76nXSOZw9a5EBT+3PSbxFV59wnZynSdooO41i5wAcOdjAoVzPIzLj0+uqmBPd5qDznzjRISeOH0vGvyuETNflyqKM4VR8DESP+kXM9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776408; c=relaxed/simple;
	bh=/ZKEoaWpilfkxOPSBGuefTVaDVJKjuhHsn734+6tnCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EYWK/oi2YNwNs6Fq5n0d2XeyY1tOi7Z+NG6gCus9XGKl1m6vWtIaR2d5972UdnQt2E0qax6WosfXbZqY6q1xi4eWrSTjNB1Io1HrNVTPHCeiARiVGG9/kVB4raL0LgYU/4jmjkqtLNR9G5kNXWFcjubkcdnWKWWKf9oDWHTdH1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=ed3uv2Ia; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="ed3uv2Ia"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so707929a12.2
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 20:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1791776405; x=1792381205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQmudqxHZgmYHMAF8++0CQtKWTMZopP9Oa5fgsHurz8=;
        b=ed3uv2IaRwS9rxnXfrAXKMrGSBS/hDtC5HHk6WoNbviRHeSm4RZ/Rz+bvuB785z6x7
         +sqikvW37PsmclmD5/lvC0XJXXMpVUvnORwZeEoWjMaBP+O+fWQTSEJ+HfMKObHTRPCK
         SDIIlpab5jIEeROoa7ouE0MR3lrCYD6hsRDWDVFiVxBbH8kBvk980mndadK+Hte6Q9Q3
         BwHhJY5SjpPQRRMeSLkSj0QU9W8VlF7/MEbNZ9IiS5yPeXQMqjfmAT7Shzu+y0L9Wcpk
         4PbRURyzMLs9mLB4BBgdABtSFrN2R43fxjkJLFDiKq73Fe093sdRlrh6asbx8bcarRHj
         dpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791776405; x=1792381205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQmudqxHZgmYHMAF8++0CQtKWTMZopP9Oa5fgsHurz8=;
        b=l6+ui2zncdXqm+IVcHUGvfa0bJbOA0llOoJ5tCrppdLCKuPF6yEOoSaZS0dZPBA0We
         sxrj6IcZvf8CQYs2sX5hjUbn9NLK3bsQurPeGFfNeNwZ2MF/DY8lZ03OLC2MsltlogQQ
         I3tbWQeuXPxcrUH86BCEPnfABUryTxFR5YzSLCKcZ+vSQrB/DWLU7N/+F/aNCBtYEsTZ
         RDC1KZCF5JFZuYdT5vX2A94nXpswFRnyv0jfK1qnokLO4SSsr5Wk5KTGWmzj0wImmHNP
         Yng1IVr+aBCT5jPYDYBs/WZZtM6wIbkLkvOKPylQk6ucT6G80+3a6mBE2ZZjN3LLutrb
         6pmA==
X-Forwarded-Encrypted: i=1; AKwUvByN/DXCK9CrZx6v1OYZH6QUvLuStIwagoSTTPjq2N10orrULNNh5KWsVIZ4yMc7FV38ooHm5HPBdUfj@vger.kernel.org
X-Gm-Message-State: AFq9FYJUqBOS/5LNqYNrFZGEWblqZ69E+qPpEXUC+GtkSvRrIy3zbtvf
	R39o9hB+WAZ1/zXV25rrOJt56NoHlcQyeJ5drhKIEsOb0SiSq8s1yi1CcfNfTY2JgdbpowGSZ+v
	aYmmCnWpZD9EVX0KvTd3IdgFcJawU+A76JUTg
X-Gm-Gg: AYBFou03fvVVotoTV3vntQYLIZoJlW50ruOpRZW5jE+3PCKGsgOVT+WSff1+yKfS+yi
	Nx89KYHou2lJTRPRecfhcP8DgifTuHnXyaafBH25kdnv7i5p8nr20GmWAL3cYB+xDvWC/bHHxVZ
	aUcCHiGsXUb4oziXsyJr1c2sYqYpfJ+knPPupQD9lJx/qfDdYlcGgl/a/fZKtZscoEQHCNXF5HZ
	ykCfol3utssKzCXROS9q3fSRC/u9u2n8mxOGhIUDGcFoPJX8aCo6PkyKHoqga8u58gDhz0rdVEm
	AxC0FJUlRWnniqYkKT7U4CYw4ya1GUs+wDZr3suwoyWvOpe9BcLWiS8Qu96qR0f9A90EIA5b2OK
	R9PMuIFtCujS5gCT6zb1qABk=
X-Received: by 2002:a17:90b:5887:b0:3a4:a383:f9cf with SMTP id 98e67ed59e1d1-3ab3a9a78f8mr7994493a91.38.1791776405106;
        Sun, 11 Oct 2026 20:40:05 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3abdd5d09d2sm1506297a91.8.2026.10.11.20.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 20:40:05 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] arm64: dts: rockchip: Fix adc-keys wiring for Orange Pi 5 family
Date: Sun, 11 Oct 2026 22:39:29 -0500
Message-ID: <20261012033929.2317231-1-dennis@ausil.us>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When working on u-boot for the Orange Pi 5 Pro it was called out that
the Pro does not have a recovery button and was missing the definition
for the maskrom button.

The shared rk3588s-orangepi-5.dtsi describes a "Recovery" adc-keys
button on SARADC channel 1. This is correct for the Orange Pi 5 and
5B, but the Orange Pi 5 Pro schematic shows channel 1 is pulled up
with no button ever wired to it, so the key can never be pressed.
Each board's schematic also shows SARADC channel 0 is connected to
a real, populated Maskrom button, but no board described it.

Fix this by moving the common hardware (Maskrom on channel 0) into
the shared base used by all three boards, and keeping the
board-specific hardware (Recovery on channel 1) only in the dtsi
shared by the Orange Pi 5 and 5B, which the Pro does not include:

 - rk3588s-orangepi-5.dtsi (OPi5, OPi5B, OPi5 Pro): adc-keys-0,
   button-maskrom on &saradc 0.
 - rk3588s-orangepi-5-5b.dtsi (OPi5, OPi5B only): adc-keys-1,
   button-recovery on &saradc 1.

Verified against the Orange Pi 5, 5B and 5 Pro v1.2 schematics:
the Maskrom button is wired identically on all three (button -> 22R
-> SARADC_IN0_BOOT, AW15, pulled up to VCCA_1V8_S0), while the
Recovery button only exists as a populated pull-up with no button
attached on the Pro (the board's "RESET"-silkscreened pushbutton
is wired to PMIC_RESET_L, not to the SARADC).

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi  | 15 +++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi     | 12 ++++++------
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
index 6e081bc06cfe..d73f671b8f5f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -4,10 +4,25 @@
  * but not the Orange Pi 5 Pro.
  */
 
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/usb/pd.h>
 #include "rk3588s-orangepi-5.dtsi"
 
 / {
+	adc-keys-1 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-recovery {
+			label = "Recovery";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <1800>;
+		};
+	};
+
 	aliases {
 		ethernet0 = &gmac1;
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index fd0efa8d1bfb..709efa709b7a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -14,17 +14,17 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
-	adc-keys {
+	adc-keys-0 {
 		compatible = "adc-keys";
-		io-channels = <&saradc 1>;
+		io-channels = <&saradc 0>;
 		io-channel-names = "buttons";
 		keyup-threshold-microvolt = <1800000>;
 		poll-interval = <100>;
 
-		button-recovery {
-			label = "Recovery";
-			linux,code = <KEY_VENDOR>;
-			press-threshold-microvolt = <1800>;
+		button-maskrom {
+			label = "Mask Rom";
+			linux,code = <KEY_SETUP>;
+			press-threshold-microvolt = <2000>;
 		};
 	};
 
-- 
2.56.0

