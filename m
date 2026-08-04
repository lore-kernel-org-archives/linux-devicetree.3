Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0788745FFD3
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850366; cv=none; b=ph85MHbcA8l98IlK8skQtKJPGo1PYQJTCL+Zb3X2qquLQMrX5fgVxTY2Ab00/AD27pLb5Kz17fIr4WTfw5ACUK6mQPWsXpFDiPzjrMfz3beN6jqmaQFPlSkOr5RbGnjySRqUrWeB7jVv2N4Ki+EjgCYwCxNUhhuyQ75eY0XPvxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850366; c=relaxed/simple;
	bh=eRx+GT39DKzuTQx/btp7YCRJPxu30ptis70hz6RLU1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i4lvUZCIx8OFbAiG9wH0qyHHAvfCq+sw8XQbaP21bsjGgkk8gxUWgiL1PUYqQ3gFobVEZR0aeQ6qcSjXV5Mmj4vvWoRogS8ac2i/AG/lOg0ekay3nsAX6CG9LUcMq5IeVoTOhLfsjC5zlTK9H9dg5C+XigqjfwOk1rjsShomdLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HV1yDPc/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HV1yDPc/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so5633885e9.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785850363; x=1786455163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wq3ZNEzsGi/HzQvZ33ozF9Jd/aqNpP8g9VbFrSJ0TQo=;
        b=HV1yDPc/U41fyCDVU08i1OXZdPwBZ/EYVTBIMh0rc5dRqnwZD1altBZBypp1jvGXRu
         HNYQXVVTB2FkZHiMeHANeq0xu7nIuFry+xT0o5/tPDMlQWf37a32EN0GMDFZcMPtqrYs
         2at0C0Hb4t04ML9TubF+Z9V2WswLG9Xwg2wb7ur5Wt9utkDufhxDnCft3XD0qYVL1D5w
         MbNW8HKFP5sWTdcidJrkG99Qoau7XagzMqRUz+of2YOm/IxvLojSGVYBe1a446x6vpJm
         wLzCl1UH5YZMA8Zc1viIFGh2ihKT8+K21K+lnWUHNBYvUiFE9fh2xTtKGu4L4mX8ywRS
         pbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850363; x=1786455163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wq3ZNEzsGi/HzQvZ33ozF9Jd/aqNpP8g9VbFrSJ0TQo=;
        b=dTAcfh6DZ+K/k+uf45aWvJ721tlK8KYupZdO1D9k3EP49rx3+jcTcSW2eSno0XbGTc
         W3kBwe3iuNEEaZ+4MARsehEJiIhCrjfbYnSjw8hx9UTr29F9f75oNWZPrEscXIOxFow3
         9p5LjEz75+y2tTBA7AlIEdZ0/eBInhHLVXyaflxOOyusYEyOwQEDWrJ10fxBbZocb8Zx
         C6CKj6Tf9TKyUjvd+Uum1Vx9BM+HI/1XFS7TSI7+GTLjeNApF7NuMLizhGXQrQJ5B94d
         b93+FLc4C/jV7uGM+swkNvwJCU629zEzbA6TpnwWURWTsy/VkyLrj02dAT0X+AT7lpdC
         ABIA==
X-Forwarded-Encrypted: i=1; AHgh+RrBRDV02la/4vW6zXQIZS3VivLwYQNHvZcAuDDF7CnAJOEo8RtwI1Sd3NXst48rT1l3spcvZOoQqb9q@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9CNJeh1gpT10namCUoNwIMihiRFZPLn9ZgjPKwIth476i0Ws
	iwk4qYvte16x4DYYReWk9hRch+gKx7tuJzxeTZsGjXvRRYPByPXAvnml
X-Gm-Gg: AR+sD1241fe80U3Rbzk4FNhdsneYK+m0hfx7EMvsuy4KulmAi+t/OXZZmAAAQOujE2u
	+RBT+7NOZbnhLsalr99m82oLtcyaphykor9hfhouAICSwi10TMv8s32TsAFOgDrRgk6NMIRMN3b
	uuqpzJr7MYEJUYdpJgP4Z+LwGs2FloMwgkS9NSzMF6SdIRCTVUZ3wP7oq6Pw+AEZ09wx8GRY0b9
	9nchTg4Mw8OmrEFS4yMUNEebFrCtF80eRinvKbhJpiTkiW2gBqEbQqvlgSiMa0iOFaoDide77eL
	lcYnQYlx8i3C960kb4du3euqIoDYYxS7aFlrIbbWbEALxkJ20Epl3cfTy9gtsGYIIVhJ3ligkIr
	vEH/1mlLalL4DYaoK+8faMNV0xeEtoUeQgPiP/cNDHILme8300FKJPZStLh/vovIXST7q9SzHjn
	VC8Dj7gAtTWmR8lOeuOrTm4aVmiUge2kOPf2KJfflJTrbaX+JNc//zbFgztxOxOXn9yV3KG4sFN
	mfeAIRHwiywbLR3PZBO81lmO172hoI=
X-Received: by 2002:a05:600c:4f86:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-4994a0fc5f1mr77242865e9.6.1785850362982;
        Tue, 04 Aug 2026 06:32:42 -0700 (PDT)
Received: from mamamia.internal (a89-182-139-70.net-htp.de. [89.182.139.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm88037735e9.11.2026.08.04.06.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:32:42 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Jonatan Hazell <jonatanh@hotmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: dts: spacemit: orangepi-r2s: Add cpu scaling for K1 SoC
Date: Tue,  4 Aug 2026 15:32:34 +0200
Message-ID: <20260804133236.205668-4-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133236.205668-1-a.heider@gmail.com>
References: <20260804133236.205668-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonatan Hazell <jonatanh@hotmail.com>

Enable CPU DVFS on OrangePi R2S by including the shared K1 OPP tables
and wiring the CPU cores to the P1 PMIC's buck1 rail.

This mirrors the existing cpu-scaling support for the Banana Pi BPI-F3
and OrangePi RV2. Tested on the R2S hardware.

Signed-off-by: Jonatan Hazell <jonatanh@hotmail.com>
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 2d1ba34cb00e..6ebd4334410e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "k1.dtsi"
+#include "k1-opp.dtsi"
 #include "k1-pinctrl.dtsi"
 
 / {
@@ -50,6 +51,38 @@ vcc5v0_usb: regulator-vcc5v0-usb {
 	};
 };
 
+&cpu_0 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_1 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_2 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_3 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_4 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_5 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_6 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_7 {
+	cpu-supply = <&buck1_0v9>;
+};
+
 &combo_phy {
 	status = "okay";
 };
@@ -132,7 +165,7 @@ pmic@41 {
 		dldoin2-supply = <&buck5>;
 
 		regulators {
-			buck1 {
+			buck1_0v9: buck1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0

