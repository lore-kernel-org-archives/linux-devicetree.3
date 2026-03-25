Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B73C3793AF
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216217; cv=none; b=Za4H9RI4G9V7e5QOEqxZEa0WdpNr3efireCNOh9blZ/22Tb7qMdLhVRJGp0iGekU9NqAOg/a2kAUXPBEQPJIX5eaDegjaUmOMYcfxjaGojlrxv8onU4xSQmv57/6Dostk1V1sWShsqeB5Q5m3kKH+3cQOw9Fok19v+++MIPzhck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216217; c=relaxed/simple;
	bh=VbEcjens4Q0c1VlnAoEQ4VJqjoYem7jVG3Exo3UuO84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4l7GaneMQUrEBbU8lLCulgf57XVk1hhbZwXZxkIeu18DI7cfzhcmsE7uFS80y9KkXPqjYNxk69dUOdK+MHKmnHIOrnVt2WVM+t06ap/ZiBAx73XZ8Wt98Nh6756lqMTHGQjeH4puzzhw1ZyjlPbyPGWi2J+g7Uwww7gflCWyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVTdKbOB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVTdKbOB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35c2fe0d90fso1070478a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216214; x=1775821014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSgprDobMmJNRlvBzxseyBmhNbTM0nryCqDbJlCu82A=;
        b=DVTdKbOBaqMW0FrKNWrcH9RCY0bvgsWB6y48FmoXpHkjFmUabzaXGt6Dp+IMitk2bw
         l//dTQrqznvYZqp0ylu5JlSElDEuSv6/CR2FOKBDNH1qaN+ZHFH8TeoHgqXL/we1UTmI
         7Cks5ptd6LnEbDBLKuwNVBEF/3bqLMm0GUK1fgSlWGqWZLBj0QgQ0D3KZNmwBgczk8i8
         W2L608e0s/OMCkal/N5qLD9eTfwZGSP2/o1j6LYFzGyxIBKR5jMukew7SbYByoy7jLae
         yinZuJ/PKWeqAVC936LxHVUdTnDZF3uX18oyiBDBVVuo/H9XmLWuoRYhbF3FG3QtCkSl
         77Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216214; x=1775821014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LSgprDobMmJNRlvBzxseyBmhNbTM0nryCqDbJlCu82A=;
        b=IjK7ePovJTUjkKh6EsHvttwJDIvx6lP+enyMFy/OiYVVKPRlIvih+KINE8g8q8LAL1
         6W+jbbz3+39+n6wwmsbKFWYLOk3iSUeERbXOLZmA9cjEqI92VTTtlXtp3j97eNQsVX3m
         xi5LioPMKU2kBhsiybAXo2bWCI3hx7RyVZsqXhSJvnocd1D85HOTF4MWtVUUkiSh+FM9
         6ktjpg7sKzKeG1FK0aNqQwgGxRPnYdjplSZOs2Ww37NRYnoPn6foQq05niG3xVpwfbfm
         mAL9nV2n5Q92JVa2xOTMmUl/+8ICHV93hM3EiG8rJyVokOP1o0SdhyZ71wDWCInpTLkc
         ix3g==
X-Forwarded-Encrypted: i=1; AJvYcCW1BzQ7kaCKI2VGG4J0evtcNIW/0SHif77zudB/1SLG9y8QMTg2S2y2tCfe9mi6EAlZHPA9U4/wsmhH@vger.kernel.org
X-Gm-Message-State: AOJu0YycQA7/oMecO1+2VsWTzjC6RDUWS80zaxQ3BDXq+6lFQefdIjgT
	toHJVrjEGgqXCZRKu+r2QzZxYvhdMgqkAdF5vS3kB4ZpM7O3AQ8/ht4F
X-Gm-Gg: AeBDieu7ynkrEe9sCEJd3ZChvUlxoOdg245Uz95TTdr7X5Nsgp3p9Z0ZbxCrwdYY++H
	ilKnmQRiNVToMULiNVS844GF3/fVx+dmFNdyP27HQ3pnBlvgHjJqK9ujKP9BS4tpQgaJR29Lr3P
	nQBvAMTbRTkBGnzr7uaDAfoF7oO4dluHVRq7Gu190TJYYRe2UxRolflFnTb+/EeIAQvz+lcwz5E
	ca+8G6YO+YcebGgNQsvorSp+9hYP0bvJdDi87I64JGzY3hbJjku621G9vlTVu9RfFhaumhc6rs8
	UaZuaGkERx1LdKdR7qgv+e3uDEeNT9LULpZEAqUSsJFXfkXdx8++GFIAs7l6OfHWf3s/e4+EQbz
	2AFvGugzbI34IH3N96l0u/9cksl0Axh2j49E4QryBOFmCWNWno8cnVnLZyVboUK8ciBjVwvnEXj
	VhYCHOxPIbSykqpiPR7xk=
X-Received: by 2002:a17:90b:3b8a:b0:35d:8e4d:23a8 with SMTP id 98e67ed59e1d1-35de68f8b42mr2363418a91.15.1775216214567;
        Fri, 03 Apr 2026 04:36:54 -0700 (PDT)
Received: from archriscv ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm957599a91.6.2026.04.03.04.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:36:53 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH linux-next v1 1/3] riscv: dts: spacemit: k1-bananapi-f3: Add vcc5v0_sys regulator for Banana Pi F3
Date: Wed, 25 Mar 2026 13:46:08 +0530
Message-ID: <20260325081700.1502-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325081700.1502-1-linux.amoon@gmail.com>
References: <20260325081700.1502-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
DC input. As per the schematics, vcc5v0_sys is the input power source
for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
to correctly reference vcc5v0_sys as their parent (vin-supply).

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93d..9727ecdd9f6b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
 		regulator-always-on;
 	};
 
+	reg_vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	reg_vcc_4v: regulator-vcc-4v {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_4v";
@@ -66,6 +76,7 @@ regulator-usb3-vbus-5v {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
+		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
@@ -75,6 +86,7 @@ usb3_hub_5v: regulator-usb3-hub-5v {
 		regulator-name = "USB30_HUB";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
-- 
2.53.0

