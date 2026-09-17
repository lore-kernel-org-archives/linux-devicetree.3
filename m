Received: from mail-wr2-f39.google.com (mail-wr2-f39.google.com [74.125.225.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9374D37BA
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648035; cv=none; b=RNYgor+Gr9BF+Q5NuygToN5KYm1SkOFFo5poF2ys64fOMqRXaM20+NS/2jHdueJtGgRI+wnVletC6DKUN9/qZZM0NjaVO9EXNuro/wgMng95rtXNHcMC1kg1p1TxtXresxqgXUhJW/t+5PbgH+YuAE5HF9cL1Oq+FPgs7y7sZZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648035; c=relaxed/simple;
	bh=MP2FNncNzN5nDMuqa8c2mwv9xwXy0f3dmsWdn8BAIb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IHxFb7YoJXajyVQ6nxIAWQsu9bSI3NbmjYIEdJf4XBpi6sQVIGaPj2f9z2B4k0K7nLkYpnepFxWq80nzo2jBaqDQoUWGMuGfCqOtZvYDVZgbeiyw7v84wLNSuj58SnUlRcsmZN8wDqEdTwtCwAAKG+s87P4pxnFFxlBE48oGHVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0W0ljSc; arc=none smtp.client-ip=74.125.225.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0W0ljSc"
Received: by mail-wr2-f39.google.com with SMTP id ffacd0b85a97d-482f633ece3so590300f8f.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789648029; x=1790252829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhI8SzP7IG6+w349oQAHdsKcMYwgaoAFfY9n0UY/I0M=;
        b=H0W0ljScT/p0ZQlrCpMHadS6P4ijOldNYdJOcOb7FDCpboHp5s7NWqaaCpfN+GNGHN
         SwEBpDLuD9psw4i2GND+lg1Y5o38fX2Lcluw/77Fw2OTFj5qykBTMLLJo1l7KSyxiEdp
         Lfr22du+j6gZ9uhLw4SiNg5IYu6s+w6vDQjWK88MPEBb7N6XD/hsFAeG49tdEZjKLKwB
         9fG2a4wQ/cjd94aT/sYzhxb9lizSnnTkmgRwwV8rduvf1JmVUxKXYtq7y5878KxNfdv9
         OIYEmX8QzrAlEX8GDbXQuf4mzWBKikftOd5r9veZEznEcVj8pOlDhyIvW5Vw/odLO7yp
         TuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648029; x=1790252829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhI8SzP7IG6+w349oQAHdsKcMYwgaoAFfY9n0UY/I0M=;
        b=hwgN8QS63DH+h5z77bwt+cNsGv+WkCnCor9l5NA9wKIvudeXF1429qEh9eqiCD8p5o
         OocSj0j6WJtGysT2T8Y213GC6zMu/0oCnphNZsT38vfd7NkgbYRa5McTAMXpG0WAhijH
         N9kcYnoTSwzB/BG2tNvLLmPDIhPcQSTQNudXozPjHKRJdZJnkn/hja6hVMwYTaWwhVxx
         OCJ/PUxRAq8LJh0+cbfv1F6FsoskYbSXSgOVoApBKfpMd1ABmmEePQVPHh+slYFS5jQb
         HiKRz248U4NdxWYcCOe0MJnHtjJYeG1Me6bdfqSIH5wpQXirmc/QBkO2sFlRq5VVpqDH
         mOSw==
X-Forwarded-Encrypted: i=1; AKwUvBy+wDUbyhSAT1lkayW/u5copxGj433TveH3pSOZm57ct3ydji/AAwmzzq/dks8Ey9otI91hHU2/pb2z@vger.kernel.org
X-Gm-Message-State: AFuF++lyJ9477wYhrHFIBS9IP9/p/24p4iWvP8juuRcdl0XAFwxQHfP1
	FuGetIRhgf5zRoYWTk+eSjbrraI6YCZZ+4HFfw8wDONM63YRnHk+ygPK
X-Gm-Gg: AYBFou2W85J5t6f/Pmf7hofFXI/9qNBAATbAVDJliZOu0A0cSoMyWISQ3PDygZB+f/Z
	un0Bbf07tPrJoGyskbJztpuekBS80u9b3lwd+qSXfh+nEigXJcl/0PvMhYidwi4+25lXeVi2qUT
	7fNO1CcUXCSpbz8ajzArpXF6BsjyVaXEpIZ3aj5HeiAfhiUxn0nOL1hlIwDjs38RHiTQMVm4rW3
	yrrTt5tHfl3p95vrEb9pndQhxEgtaEM1SUatPFzSkDlWE5oVJz43D9CIE3UPCjl8g/J134rN+wU
	XYEcibfoIcWhLg9H+gjQcTva7sDRBd0l0HTvwCNgM5F+BjhgHgZb5MmZp1l9oyHeGsN7qmOpXob
	oQ7fqWSA1w7WJexlkgS6SYRLmIo4DSgRG9xsbHII0wznQ/Zy0R/mUG60a54OqoMhbq1EYvlg7nL
	F+9yuHYkUEITepTVfQ4TuMTZdRL+xCcJ7ybeA6irfFrtcaYUaMUnCz4LAKUR8uDMx4QXZUrgN+M
	mvblAFIqKTHUjwTknBkk22udfKg0oNa0S7Yi9OR8rHsvUeOZzzhuUoPInWQQeMbY58+itlD0uB7
	gHQojVdLYc1VoWUvIiNCj8evDUBa
X-Received: by 2002:a5d:584c:0:b0:487:d79:7cf7 with SMTP id ffacd0b85a97d-4870d797e09mr8077150f8f.52.1789648028528;
        Thu, 17 Sep 2026 05:27:08 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:881:57c7:8b8b:8936])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef766dsm14780947f8f.4.2026.09.17.05.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:27:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Sort nodes alphabetically
Date: Thu, 17 Sep 2026 13:27:01 +0100
Message-ID: <20260917122701.160720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move the sound card node before the vqmmc regulator node to maintain
alphabetical ordering of the nodes under the root node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 14f5834082fa..8094599cc8e7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -77,6 +77,14 @@ aliases {
 		mmc1 = &sdhi1;
 	};
 
+	sound_card: sound {
+		compatible = "audio-graph-card";
+
+		label = "snd-rzg3e";
+
+		dais = <&rsnd_port0>;	/* DA7212 */
+	};
+
 	vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 		compatible = "regulator-gpio";
 		regulator-name = "SD1_PVDD";
@@ -86,14 +94,6 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 		gpios-states = <0>;
 		states = <3300000 0>, <1800000 1>;
 	};
-
-	sound_card: sound {
-		compatible = "audio-graph-card";
-
-		label = "snd-rzg3e";
-
-		dais = <&rsnd_port0>;	/* DA7212 */
-	};
 };
 
 &audio_clkb {
-- 
2.55.0

