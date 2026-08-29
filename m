Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2A834A791
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 09:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996886; cv=none; b=Sf9Vau2X+CJnyLY6+KR2blJBbWEF4kvhWq7JgcTsY9qB812DmX7V9kh9IWehBABrpko70smzsXdy03RcWet2lMc02fO9taMnn7ek7crgQGfsaDSrCbYzcoo4+YGzTsztdM4b9y01gR9JwgR42+9UolpZQng8iLVpqWfm77az6tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996886; c=relaxed/simple;
	bh=uRkFH0DF+K2gkCSbCc3So4UXlflNMUCL+wxSJBWvLro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OREVK5MecIE3rQ7zo//2aQoUgcIYqsZs4ktwVdVF64BW3P1ZkfOM5yLNuUC/MDt7KUS7CaFezLZHJeLAdZjt2bWRFBJxA/u66UqYPm1yLatfQ5RdU0U72M7nLvndXjxfiihh3pGtePQl7tJcDsCkX7nmtrQPBrZQOZU8PvI8JqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fd66a094eso695782f8f.3
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 02:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996883; x=1788601683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w58IcK8ZE/FUFrG95ZGCGEBUQTz0E4TGMIPiEQMb1Vg=;
        b=dXnDQguW1GNgJANZupDiXdSt3uXX1VKBoG0iLhI6LqL4A959aqLwdxFi+OM2tVFIUs
         e67eE0lS6y9yQGlecmhQwebbarTPXVfk2y67I+57Tr1rlvobWiMhIuIETUBL0AymPUe1
         Z5wto12o3dEjfXtINuFchwtRcwPe32MaL2X8bczv96G75cz1FC0MDlCTwDeFx/B5RmCd
         CZngs1O4eECkCnbsGXeC+ZUmBCffRYyCXevOwxLs+HqaSptjdBAXyxDwZwkVfgDbvGtE
         b4pXGPWjYQmSzZy2vu33evaiARR0WfK5yukbI7cECA6gciFH4200n+dfLnhPaK11c4o8
         5ZIA==
X-Forwarded-Encrypted: i=1; AHgh+RrWiGhQLWImW0cwjNxm1nPiemEZ7CbHQ/AErcBF+dA0E8NiRBahVYpeRjAGgwnyL6BEyuc1ODYSocFO@vger.kernel.org
X-Gm-Message-State: AFuF++mh8sCI+2tk2E0+f4LFCJxBRyvKvnw3zX8U0xN8y2RvH+Y4jcqo
	Es7BVetww7SQToBZAD3dceFWEihm5PzeS8wiq/8gyIodx6kkpvSLxrp1
X-Gm-Gg: AR+sD13w/OlLCofK7DRajzu64t7Q+bAMTQm5CLzb+LkDQ7OAG/AFpiViL5LkKe8BpeH
	UA3JvwTsYo0dqC9n+F0pDN/X6wNjsbFmbS8GnFCBhPKtLnOcahB7y1ozSiwKjKTX5UzK9WPxWyM
	2xVNSOfiYDWvWEDs704OSt3jcCjA5rcWTjWySfKm5kwoGc31FnYbrfe3+fmtieTz9QkUsug+dBt
	OepObEzTDnGJR8FJYG1Y5bKKabAYgJi6r1TAOM5qnz8745Z40pvvawpm1gX5a4AOSBb56ngvE4D
	R7EkLFUNjpyVNmze9VyYYolDKcDzTlhO4/KPh+HC274+uHi5UdNI/MNztOIU+YScFozTxI9RJcg
	ShWnY/pJcuiHfpaB7V45z4v0MU2iTt33DXPatK7J8hEqQHMYonjboPsq3nPJ2Tbi/fmDas4h27s
	M5dco1Cyy9SMRmGSSYzjSZIpZ8Vg0ImUSNxcJixVVxUWhtnAZoP/kw6zVi0Pf3u6L3WT4G72i1e
	ASoSu1kTH+sVrBBAYfAJ6nImf6oWR0/Nxxg0A==
X-Received: by 2002:a05:600c:8587:b0:499:dbae:43d3 with SMTP id 5b1f17b1804b1-49b91c489bbmr177775515e9.9.1787996883483;
        Sat, 29 Aug 2026 02:48:03 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
Date: Sat, 29 Aug 2026 10:47:58 +0100
Message-ID: <20260829094758.23248-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vsync PWM output can appear on either of two pins, but the
description named a single group that does not exist, so anything using
it would refuse to start.

Name the real groups instead, one entry per pin. No board describes this
output yet, so nothing changes today.

Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 8c4bd683cce0..719e111bc3dd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -546,9 +546,17 @@ mux {
 					};
 				};
 
-				pwm_vs_pins: pwm-vs {
+				pwm_vs_y_pins: pwm-vs-y {
 					mux {
-						groups = "pwm_vs";
+						groups = "pwm_vs_y";
+						function = "pwm_vs";
+						bias-disable;
+					};
+				};
+
+				pwm_vs_h_pins: pwm-vs-h {
+					mux {
+						groups = "pwm_vs_h";
 						function = "pwm_vs";
 						bias-disable;
 					};
-- 
2.55.0

