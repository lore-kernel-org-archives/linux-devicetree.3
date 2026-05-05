Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F102E42B75B
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984637; cv=none; b=Ktk0IWi3LBRrkGgypyP3WXsHuIlEmNbvkCNBwSH3BZteMFLJCC0C1bi2WTHEUhTJRJ3NXG1kM+yRCN9dyWHdCCzHQZr2f3AaPzUz6EyUZlIRdyVYYt2dmPodJuYGX4pZs02Z6/z2pHe0q9IodLmQ88UeSy3J2qDfnC6774Kk0OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984637; c=relaxed/simple;
	bh=cqIhh+pJ/+gp0DCZ8vKGCHyY5v99YfadIPRRJLJXgiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yu2HN9ORjfVzsJ8vvW25IUROWWIvWzmaAAXFYdGDjp8p6yoH6WtgVCx5P0a/pgsQtE4BHe1aNCfwqA5NSJODoozkVLLNWYNt0BBMiYO1lW2hXjrlQ/Q7Q/SPi7i/t9Ni6sncenwFjFZ/OVnU5vGCN5ZxGyCk/qNxQhWvWh5cxb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oL2YWh/w; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oL2YWh/w"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488d2079582so55579505e9.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984634; x=1778589434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVJwiB5RdL84fSkwUDhj3KruslwKN6j5oRJPekK7gZc=;
        b=oL2YWh/w390Q3P4L3qZtuZtsImblj7KxwOzXv6nbc2ZmSuixUWZuXsXwT0pVOlx0xt
         mX1Ua5Cc5rqh0zeR5CfJ0T16r5HaX9XRrzU9uKhOiy+CSd942olVwup5pfa2lPHD1CmH
         bxRy24y6Q4f7eNG7B/BNxuTdafaBf+glxmZU52yy5aoc62JGy2jhx00FPZ57mBFX0olW
         zIy+vN3PtXKe4E5KBp+O1ajt8zXQjJno0FlPJCrNq32lwgvgtnH90jtdoz2TObTv9O/x
         CXYwMeiAb3KHLQebqobxuF1ewBWF0pl2Rwt8K/R62yxpFnZz+pvGkF0wmbcpazcWda+h
         +v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984634; x=1778589434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CVJwiB5RdL84fSkwUDhj3KruslwKN6j5oRJPekK7gZc=;
        b=QyTfMzamW6MoJ172+70IJo7BNIbAMeRiqAoiFh6P6R5sJGgpHdgdtfMs7Fau4+LnMS
         S+NBUb9JPO4Utz6XjemWeilU6T8yBLup3UUSp/f3Q7GHs9UHRM5F3AMpKO1zhLcKx/XI
         J2sX10shqYtHZC/x+SsnswJCAxHVszv4q4+ckDTPGq+2MPnaCfAnFfmtPDiTPW7+fvOR
         eRfjVKbCkEjSbyd9/KbYc5YSf5U6ilCQ/PDZlaXD/t5LD3OwxHxUesVS92fRByuIzL3M
         rTcSY6SRY4xNKK1R5yoYobA846AMP1p2JEWl1IL36g+Ont58zAH3NC3vLdgUNIfZCy/J
         xssg==
X-Forwarded-Encrypted: i=1; AFNElJ+lGj5QAigVQ+oRrCaW/UhM6ZQyHG2L2YJOknUXe539EMd/HJhX1ug3RKJEpy8MsHJGSzxeT/jiFqLh@vger.kernel.org
X-Gm-Message-State: AOJu0YwpDl5qpNCknfH/UJuDfknh7ULVc6oUr1DzEzToBVkCnqyk5WV7
	cnlRfAvgMezH3HYekgc4nvglSpO7PDXKhZZdsnm7V+H62A2PI6zIIZ/Z
X-Gm-Gg: AeBDietevgVyAk01FUWos/Avfbbqcs8otFS45iaM/Q1xhCG9guqojBAE7Ugx6UaOB3+
	qLtyS6I3ACeRtAnyVc93AdR47yw5QJIUvNT7JG6RbIyRXCMrn/kK9yD0JTaCejripqVumFqqh/u
	+fyx4kjTLHvGhm03NTY4IkQDswlkpJ5rjnYxY6GPStWNcCdXWTklNouaOhXC8BOT434ko9fqfR3
	U61D1lqaQkjA/nVPFfibBgnXnZKnmvQRWTuFmWRj7iHneD5uNVir+giIpi6wZ0455GOKhWtiO6Q
	Jy38/BMWOpcHaN6rrRe0S7e7cNxrw2cUBubG4qnnZVkQ6+0rymDM8go0p7IdsqBG9RNdTuIqSzD
	EhbbeSEPNv57w1+eB4/sHjp+7epjWYf+W1h73QdXBR0M+YKfPc2UYVIyCZLJbfcRCaLKvbhpdbR
	lI+2SyePLMEDNI/MpgCuoE/7hoGXD6bmP5559WN/3BJg8zCtqNXYpt+V9GB7I=
X-Received: by 2002:a05:600c:4ed2:b0:488:a639:b772 with SMTP id 5b1f17b1804b1-48a98639ca9mr241200945e9.7.1777984634366;
        Tue, 05 May 2026 05:37:14 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm4703780f8f.28.2026.05.05.05.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:37:14 -0700 (PDT)
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
Subject: [PATCH 3/5] arm64: dts: renesas: r9a08g046: Add audio clock nodes
Date: Tue,  5 May 2026 13:37:01 +0100
Message-ID: <20260505123708.134069-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add audio_clk1 and audio_clk2 fixed-clock nodes to the RZ/G3L (r9a08g046)
SoC DTSI. These clocks are external to the SoC and their frequencies are
board-dependent, so they are defined with clock-frequency = <0> as
placeholders that must be overridden in board-level DTS files.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 03c0ac707d3a..55cbae6ca8d4 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -14,6 +14,20 @@ / {
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
 
+	audio_clk1: audio-clk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it. */
+		clock-frequency = <0>;
+	};
+
+	audio_clk2: audio-clk2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it. */
+		clock-frequency = <0>;
+	};
+
 	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 
-- 
2.43.0

