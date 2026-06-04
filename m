Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026DB33E35C
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586344; cv=none; b=KvsKcx8VW2rsIMS3CY1uR1ubTadxJwiSr89olMaKhctWRBA4MCsfhVEfDadOI5yyAdKi9TzOTOc2IaTunB8c18HN5lYIDfc9pY7JrfcB7uyKj71h8NzbJrwG5PDB0WSmB66s0oVw1agHZrNPuLEN3PKc/SO1LbE6FUr8hJWKbv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586344; c=relaxed/simple;
	bh=yL2qAKI2jcxosbs/pLkS1PbpJbGzxbxr0FtX8S8lgC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPHz1yOzPeoEXPoaHCmy9koD0HvjoXur434CAA+6oxFV+dc99CJs/rTTOwUQNYfvVAnjnlZ6aB6QEVewxTa6vfp/OsOHi0sJ/v4ymDWgvF1QkPQ5mpzvaDeS257xFoEvfXim34c1D0aAbGsnQs8LA7ADkJ2mO35uLfD9IfrgxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFW47HuH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFW47HuH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so7211195e9.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780586341; x=1781191141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWUcXwhNpagO6TYVN1qjS6SxZrgnvhazVIX5TODrDgE=;
        b=SFW47HuHzzQ7+WwHoHu81QT0srelIUtYheHA53exrwdCVnNhskIczaDqa+pupoSY5g
         ATfv1vpPRxuLtgWoGgbPhyvlPLal+bkGIH5/PT2VZ5rZMLyBc3c/HaCZnj9JLHPlZ0j+
         n1NzrdtHgl5Qn2chCKnaM5imudNypFvHITfaZGKXlNxLw1rlRu6wrRhvU6kG5mM2uFFQ
         DVUrUeSpT4WAY38BibBmpwTuOxP+Ou4cdejPzDBaH/R78UiXUDRT0Wz+pJHIT9DOsrBK
         UI/nf3lZcMIKgNFiRfw71T1oklM3NvBswtUPJty5cQnVwGJ9p0+WsXfVKixlYtUJKwyQ
         RPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586341; x=1781191141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LWUcXwhNpagO6TYVN1qjS6SxZrgnvhazVIX5TODrDgE=;
        b=KsFxrrL/gwlsKhin/eD+4BTIq6KiNF7zUI895H0XGUPWlibBeQmZwdfnzAS9B2cZXy
         0Quu6IxOytJGfPUOG8vtiJS3DaUZiRPJTZvRXgD6VDOnJ9ATVnqmHZtRB8tjDn/6MX3x
         eX+lniY8esJzTwqva3sJaHBMx96+6ib/3nSlBnboQtG9VjBy9X5x1XuRayH4RAKvXtgd
         PHgC4BuuZeS5x62ovOMrkDmph7vP2RuHr3FeHcR7kDouMCz3V1380D02gXIgE3LF3yrg
         t2DBLGHKhUBflAqsE6+aBFKD1a4BejQwUDkI+K4Yfas837kaJhXUJ5HAaOyF0PiIzqVs
         8UZg==
X-Forwarded-Encrypted: i=1; AFNElJ+fqc5aeR42OoOSQMQGI3J0YJrcEMqpDNe2i6VlSTKp88PWJpktS3qUv97iB/wEpbw2/CW9Jq6jQYmo@vger.kernel.org
X-Gm-Message-State: AOJu0YwjPMzhYIOKSXeLdd74NbEipqGVPaKw2PJ9HlVxP1SIErDAr17C
	UwGPFJBAzkXMuYmwGu1oZs5gCAAgSRMUVJnvH+IHny8ydTWaknUpenqQ
X-Gm-Gg: Acq92OEMb8hddLM78Psw19bw5y17ptt9HGWQMLKEr53H+Hm3fCFvQ+/W0gjpYETIfcr
	ODHE6pGG0dkwiM7lEOFu8OWmoKObNI0s1mhRsnTVS4/lKIVprkbD33ayxBgAXEskC9VI1OHJHxZ
	OWZZyXNLvShoz6VXz9wh4ZqgKCjo93GxU5NjcT/HHR7OJACWtO9KeHADLLJzdRJbGkO+9Zr9qzJ
	d62/oiLIcg7o6rTjKOAB5DoLwWGz25HxnzfHjG8s8vxw7VHxwOEqbLPRnyiTWkDqivy7QLKgFnd
	DK9k7HiXdUbBAdeYkUZq4DGlBiQg0oer/jZKndXm2pvWKWIhLae2J/MpqnxgmUADhi6fAmUW09Y
	qB2tmRLHW+yJy2f8cATok1jQVst+N3PlYLP8OHEiCg7+80oul0p1th2jr2+Gb1PlCbbslxBJkeK
	Jrgv7m/UwLWiS5HZdyx+Q6EweWeLGj351jkqZ+Wwse1eu7Nz1vSt3E/+5Q2P8=
X-Received: by 2002:a05:600c:5288:b0:490:b0f1:c27e with SMTP id 5b1f17b1804b1-490b5ee1c64mr140495465e9.24.1780586341284;
        Thu, 04 Jun 2026 08:19:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm82776805e9.1.2026.06.04.08.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:19:01 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable Mali-G31
Date: Thu,  4 Jun 2026 16:18:51 +0100
Message-ID: <20260604151855.307772-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604151855.307772-1-biju.das.jz@bp.renesas.com>
References: <20260604151855.307772-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the Mali-G31 (GPU) node on the RZ/G3L SMARC SoM board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon [1] and [2]
[1] https://lore.kernel.org/all/20260603065731.93243-17-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260603065731.93243-18-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 3d5e6b8489a9..fd2aa064f9a4 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -51,6 +51,15 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
+	reg_1p0v: regulator-1p0v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.0V";
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -119,6 +128,11 @@ &extal_clk {
 	clock-frequency = <24000000>;
 };
 
+&gpu {
+	status = "okay";
+	mali-supply = <&reg_1p0v>;
+};
+
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
-- 
2.43.0

