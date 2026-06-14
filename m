Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7792EC0A2
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781440098; cv=none; b=dBYyI21OBld87UGLkJ0skzQihciCLU2W5zeQ/4D0QZ5fxrSo3dP0NZW71L8M8zYIA8xABb3LS7v8JgF6rWbmLXjT2ByiIOIAtjc72dOrekbUayusQFG8tl2V1hwO9yunMnr/iI+pfBX+eRfiO9BWbIfxMkbZJ60OkAuDSJJ5jaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781440098; c=relaxed/simple;
	bh=eGTslznVqbSVlni5BnPYmJs7RZwRp/MxKLSM0euwsC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXE/yOcH6bh0TekX1VeGzOEKBi4UlZdRT3WCBKoblN0gTlB72F+8twt6DFNt95/rdn/taNjjLNsTO5ip2tu+Qq7AMpHa+G3w7F9tdVTRcYbyXGm8YABVsycCkDRbhZP6w009VMBqG0IZFhVFzRhsTqI59tjNBMtcDISpcoKKkt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UABDU/9r; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UABDU/9r"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45efb698ef2so1163067f8f.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 05:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781440095; x=1782044895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXbCcd0NTps7SDVoolImrKKnLGgAu77CT/EkLadupyI=;
        b=UABDU/9rZ1xf/HSw5lfofRw+pEbK0MEuWd9MmjlobwZAW+3oENKUUKeveuoWt1SYbr
         FlyUAr3AxeAUxo13GwV67UJhTe43Q2ImBkT2s66VJxaqqtxSXxBUX8vHdExKu4W3OTt5
         5Ninr7AqZCWVpYs83R+vMic4ys4H6WLzH7ISN/WKVYP+ZdORHkBwJScUb93f4228zVpm
         MiXM9SoxErklflO0X18SaUdq/8xQUuLF0R+14GBXU5q5dXekSlcCvDtfsm3r2BxjihDX
         51iVi8kMIwewXq6cS3AXt2ffUiF7XbivfdcURl/a7rG6cnAkgI3jC1nwaeauPIcfQ/R+
         3MZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781440095; x=1782044895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UXbCcd0NTps7SDVoolImrKKnLGgAu77CT/EkLadupyI=;
        b=Zdp4Bh5vRz8ZzHWnYegollEVhgFAzaAHim8yuHupqaXTE6VkUBOhKtxnecC3mJDKvL
         VZNpS+irDJYMbnRwWAhr+ZKgOfBvj0Fdg+5f5uPg/wlTkGFL0FfZeI/4BrNgBzXBSNcH
         iQNepYB3Djfltq9MbfXJGro766plcOn2r+HLuLBW0YHTaCxW6sFgEoZEns+2uOIxHyzM
         PepNGf6rpFFMNP0+x9hbEpgf0Lg0Kw78u6Kd4gKxOJywH39HqHHDKLa21oQXKp/A9JOh
         XpyK9pz5eOlz+EhXEh0tBHVi/zECn8g1N9u04TC3BItTV0Az3XyZ8KnNfoEqrCw94c+7
         H3ZQ==
X-Gm-Message-State: AOJu0YyVjJVs7F7dAVhagWm25EzJG/c96ouEJ0D9kl84CKvXa0/GHfdr
	EHQdnJ8FeeZgl2ZU1xHZt1eDPoHE1jwZtFHNc5PQYwrtmGGFIByFUk8T
X-Gm-Gg: Acq92OFS4yklw2gDQB/X/LgTlOdfLT8hSUeIPVYMr730H0gLbWBeRPnKs8QYNz+mfHj
	RetuwDKg1MhXKATJ67y8pEWUlVXUmUMLxvmBssj+IzPF+Dx5itjg7R9H360hZVjQLPhmNGSS+T6
	npGyXDL4LK7/Gb6L8Zf6usxM/nAI7VQsupOvmKnVuHnNfpzLBCo45zCeo1U2aaYdijM2q29nl6K
	1mwj93f2iat1AQssx/YAbqHIx53t032z+3kzH7jum9XtAHQUpTPVcjhYYbVys544b87i8LdQpf/
	kmUB2QqVxwCx3QDLrnXxkG9LfV6KniwAN/V3kEmEc5oDojS8qLXKN5K4eUUCQ0PI/Y6V+tomV5C
	BwL3e4jgzfik6Xz3rwgL/hIDTj1wSr2WQ8+tSkYYArpMoSL+8uWr+FtAfZkQpCr6zJHFGyT4ZQG
	aIOLfMz7Qkrjcu4SEbJdwaa7yklvsIj8LE9o24KrfEj0fLGNDI/CYc9Dh8DPPhKP2+B+YH
X-Received: by 2002:a05:6000:4b04:b0:460:138d:c9b3 with SMTP id ffacd0b85a97d-46074a528b0mr7750359f8f.2.1781440095104;
        Sun, 14 Jun 2026 05:28:15 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-114.net-htp.de. [89.182.129.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263923sm24756097f8f.2.2026.06.14.05.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:28:14 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: spacemit: k1-musepi-pro: add cpu scaling
Date: Sun, 14 Jun 2026 14:28:11 +0200
Message-ID: <20260614122812.2287506-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CPU DVFS by including the OPP table and wiring the CPU nodes to the
CPU regulator supply.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 0d809e4ad3b1..1b425011f123 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -9,6 +9,7 @@
 
 #include "k1.dtsi"
 #include "k1-pinctrl.dtsi"
+#include "k1-opp.dtsi"
 
 / {
 	model = "SpacemiT MusePi Pro";
@@ -99,6 +100,38 @@ &combo_phy {
 	status = "okay";
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
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -178,7 +211,7 @@ pmic@41 {
 		dldoin2-supply = <&buck5>;
 
 		regulators {
-			buck1 {
+			buck1_0v9: buck1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0

