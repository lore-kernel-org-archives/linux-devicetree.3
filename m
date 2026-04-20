Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8344C3A453D
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691365; cv=none; b=UAU4UQghUK9Oj2SxH0cZJpCSV1R8WSF8wZrj0IMA7qOvWLqo9GA98S1eFNELF+4NqrFcR+1f3oYfSyERDakw33qTvY1p3/4WI1TbmaPDk8XyC6wopcIFtHL3CtRjHuVaX+H7WFRVTMQxn1dbsrEvH9IpYnvEhkv2BvpCke2LviI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691365; c=relaxed/simple;
	bh=0CNF4S8Q+dlcJKS4ltoyHAUJrLjYZPUjMR4pqXA8TvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xd7L1q2ZRa9Cct+rDaDL31Wp2BPbuo2StiV+ausf3PuK9U3zv5fnGqx+TAbszAuoY9UsAEyvm9C1ZFo46L1gipRmmqe1m9MlsOjZbMOzRuNc4ap4hyfOYMugN0Ex4SK0jDPJeW90Ni9tSFiVWbDygRdKhs4YkpbDqmXBG5kx58s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZ6xHivM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZ6xHivM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d73352cf2so2632422f8f.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776691362; x=1777296162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wU7KfU1h9bpFsbZofDzyf3qe1yX0F0cyyFkzQzmr9a4=;
        b=OZ6xHivM9WI9RtEuMfLNtk+ZnxCo7n90MVGz7F5ubHohsAxaXA0gWjhMQdRaolYFrG
         nQNYS7KK4fBQRDiNu73g6Ov7/aYwkz9yp2322bDZMOm/hx442MV7P4OJpNxQvNreoavC
         ILGu2QjZ/36K65nVlbF2eqsmRG8eRqMefFo3S37rbXYWD55uIA8QLEvNyT4rk/vQPtbU
         Sge1VoL+cbmuNqw7OklPpuzxDq2iDOj/r/WVDb2icjsL8GsQmFsB7po/IezZFWBSx+GB
         0FCqzNXkto5mwEbu8PaO/OJOiDQLSGC8gmY/tqs8j2fgKP5Ux8QJ3FTglGAk/T5nVzmC
         zayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776691362; x=1777296162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wU7KfU1h9bpFsbZofDzyf3qe1yX0F0cyyFkzQzmr9a4=;
        b=OuCtQzEC+RKQ8cQOYJHXcC2fmX+KYClndnItRdFvreJjZ5ewsEUdduqz0MUSQ/7Ayd
         DzQlJWsAHRscp6d6gcCnV8fUAeiUB1vdME7Dxxj0yejxBXNsaHAFs2czkMGC04afgFZi
         vTuc4Z2JDpw1w29qsdzb7gvyRtDSHAf1+Dwu5SCNs8bXlWUc8qpv5gwvNlBo5mVSyugE
         QKqWHG0itGnasVUjblwLT/oZaRoHbCT1zfbMjXf9PuPaQ7Tp+7TSWXdMWldphssd9Pfi
         uK9rL0KflJxufE9tJjgGjJqUNrjXaPG5d3jXoq+3HYWdgvSN8NyenrgROjGzmbnbfAeR
         ISAw==
X-Forwarded-Encrypted: i=1; AFNElJ8A1IDuGl4+u34fPRLnEXd3J8hkmnhKofbnqxeki+8AAkZJdbCEP0G35vXifszYHCTaEA6AQYyH1lS1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+e2mCUtBSwmdKa4I77l8u7nxRQD6xsuBc++c4bXERIANWfka6
	5wh3Hq1mF7ipaUjrNf3zFeyTdZvifrqLG1oa7+/G/+fAQcjAlKQkTeh5
X-Gm-Gg: AeBDiespf+FyAjs1NM70sGa9gnFxx7KjUffliU3ceSHTiOeYVK2Mnli4YZJ0XIuvz/W
	4xtB3na55nxLvz5fGEqkobkQw0mUxpZT+sIH2tLfUOrMzwycGqydkrG4sr7kckEnTGTqRP8Z50J
	fJFlTm6Vcq9PrLWEXATgdHEPxnuP16X5MSK7j5hmJGasIYV94JQXnXVCQSTMyex7cfXhO5GST7B
	Ezv1WTAOaD+W8WzQr4i4pLoAxb8t52/9VjuBBDinYZbVKgduG3kDBrB7r9UPmGTN7Sm1YadU8pD
	mrIOLl/9dyT3gpOmWZFepuRbWG7EOmITlIG6p5K/aq4WBRJJdt54C21ohtQFnJR7h6SV2FUoNWl
	mCoEOTfNPGpilGWUSbHkBo8yXXwIfwP7tllvHq0WMQnPCPzScJIBpXjm2qWlyRh/DX2rqxBkAQg
	/TWBqCCqmX2JzlcyeWwI6Wc/4qSR+0Ddg6ZHMfvV4Zz1uhBj3KBQXHUx02duoP8K9C1Pn1wHfMo
	08rBPhifm/mLnLI7/qOt3Nk6uaJxJgrHsCOU7YX2KYeXiq6
X-Received: by 2002:a05:6000:26cf:b0:43d:77e1:6a69 with SMTP id ffacd0b85a97d-43fe3e14384mr21547096f8f.38.1776691361611;
        Mon, 20 Apr 2026 06:22:41 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4dc1:ae2c:7f06:f671])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb13a0sm29331630f8f.8.2026.04.20.06.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:22:41 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: renesas: rz-smarc-du-adv7513: Simplify DU port configuration
Date: Mon, 20 Apr 2026 14:22:11 +0100
Message-ID: <20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The SoC dtsi already defines the du node with its ports hierarchy,
including the du_out_rgb endpoint node under port@0. There is no need
to redefine the entire ports/port@0 structure in the board-level dtsi.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/rz-smarc-du-adv7513.dtsi     | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
index f5412578ee65..dbe16908b260 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
@@ -24,19 +24,10 @@ &du {
 	pinctrl-names = "default";
 
 	status = "okay";
+};
 
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			du_out_rgb: endpoint {
-				remote-endpoint = <&adv7513_in>;
-			};
-		};
-	};
+&du_out_rgb {
+	remote-endpoint = <&adv7513_in>;
 };
 
 &ADV7513_PARENT_I2C {
-- 
2.53.0

