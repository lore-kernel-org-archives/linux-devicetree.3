Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B9243E07B
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850363; cv=none; b=AGs1+0yND9ukVEpq16aqGemN/Ge2ybU72PLQToCtE8P+NwS8/+0yhSa9gTwcEBggqWfeMYCULIp6JGpqWk1V4yV8OHwpElP5wcviG0sYdtRQkuJ36WZ6HGyvojbgN1cbfKD+9fDqsppc2x8kyU9ObBN1G6HancF42bX3EZw0nJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850363; c=relaxed/simple;
	bh=uQjpvvh5tM6LSZCB3GgPu4orRfOX4CYcABKTac76MX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZTaWJdJZ0Qjcj5DwzExdthgCK17yKkHIPomkhjS6hHhzRKc7gcL/wPSyvoCEc04EPBxLGCWrvD0Hps6LPVTzsiTXHMeYslyTuVf1CLs4PAyTXFaFUaxQuMQx9H6L0nKBxp4XVDoX10YXSIVB0QtFoUYh/U26ri2/bSM3LWdcfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJAhVgif; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJAhVgif"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso15851525e9.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785850360; x=1786455160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGdbltKWpfHXSCdQSqEjll17z2tSjmzRYfJiMwHBwqQ=;
        b=sJAhVgifhuVoMxAwZZNKsZCpFz3PMdJHxccEyaz7xI5XkhsdIQUHs9xfHxp4QJvabc
         h+SD/OT2YK90lIU/iBcZxtPXwWGkUhWzns0b54Go4Evduf7vu98Y7A1JhFZnXqrJsmOJ
         i99DQWkJuZgw4bfVZXIgbn8GoB2wzH3FmgSJgWTF8lwxap1pN1l29HreX2KlBrcwHQ+x
         WeYLZ+nV1f+HVNvB58j1P+f6RXoSRKprUQYDZQ+efj49l3GWf6szzu4jcWGxORUcL6ne
         WCFU9JirsFw25AZ/To6ch7L5Xbrq7Uiv4RpAaJ8JyC4xLYWzTjzBH+ZtC4QsttCLfuti
         fDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850360; x=1786455160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGdbltKWpfHXSCdQSqEjll17z2tSjmzRYfJiMwHBwqQ=;
        b=JbvdwCIt+Zaa8td3EAdud2Ke7NGT/eO8Pf9HFDS0K/avhEOM42rWR6By347uOXehDN
         5nD4jptknGnz2Vr42Qb9bVCi4BRfVVCdnHtGX0uqW5ZsMbS31HlqSNjzDKw4awRJxEnk
         MHvlgPyjQwi8bhMQuqHd+xvrhsJJxN4ZeqOK5/d2WeGmB3f1G811l7mI4FcqxjT8yQWg
         Y6p/dwRp9dmde5vIvQkLSUmIlPfTc1JRm10bHQLz/f17NCG9lVIllg15yvAe3OpLj+lc
         DlvzZ+qWDxl0sSl/ookje2J5oG5aSF2deOQhsNREbNw9GYUQVKyM9SMquNk57SbqWeNS
         s+ag==
X-Gm-Message-State: AOJu0YwSc5FIVD2rRw9XbO5mQelL6o3vj+BdGlVF2M2F4eQQJB1wg/x6
	gQZNXR5t+ZCjEZDNVseJY9uP/32HsJF2MvAPMUJu9/gyvNmIbs7exEwi
X-Gm-Gg: AR+sD13tBmMjK4jKePNfJCM3EY1F3fAIMcck8RTEaDXEjtfmVOAbVOGPhOxefuV8Oc2
	p0Zkkgjgdr493BKrJ6wlrxBS2+TDjk7Z8Hi8P5a+svu1kyfo8ZXUo2qIHc6aMYOfAg3iR4ox0k6
	5ObW49SecbxNC+WW/eliLNY68WOPhVBUq7WYEvZRiXpA2CMTT1duaKXA3HAdDxGUjkmMtlt+63D
	8tsn3CI0LcMnZ7F9nJ5bke2hz0o5V/gohHAGySuBdmHu+oLrZbTl0X9wUuc+XxqBXuwi9iyQHUp
	fTWNHBoCFUnnHre4qgElCO+QZaI4wLWmjsfIb8ILXEyXeT45RWhtml9KQoUNf1G2UAXuVivy8YV
	dpSl/SIWAFzM+yridiR6n3ekskUHdcjfnrGeNAAwzg6tVdfaUT1WdQcVz64sC7XeV5iV9bo42pl
	cVpM23JfWY4uOV/FWkoXNHuc5vR2XcTWy2yNHP5obTowHc5OjijiNInm1g+lpug22qN5OmVQUBz
	BYwFuj+BkSVYUR4VUKuovlzU1RY7QI=
X-Received: by 2002:a05:600c:154c:b0:499:4d4b:be2b with SMTP id 5b1f17b1804b1-4994d4bbe5bmr27679215e9.16.1785850359884;
        Tue, 04 Aug 2026 06:32:39 -0700 (PDT)
Received: from mamamia.internal (a89-182-139-70.net-htp.de. [89.182.139.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm88037735e9.11.2026.08.04.06.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:32:39 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] riscv: dts: spacemit: k1-musepi-pro: add cpu scaling
Date: Tue,  4 Aug 2026 15:32:32 +0200
Message-ID: <20260804133236.205668-2-a.heider@gmail.com>
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

Enable CPU DVFS by including the OPP table and wiring the CPU nodes to the
CPU regulator supply.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 246f8f2ab62b..23f32a8a3d45 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "k1.dtsi"
+#include "k1-opp.dtsi"
 #include "k1-pinctrl.dtsi"
 
 / {
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
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0

