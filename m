Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4544446F493
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766556; cv=none; b=GvOxDxQSAefZw+P4hmAATzg6nLFLlWapybrV7KFChmJB7z1G3GnNt22eS83IojarUSWiVI/0JjeRf7eC5sGBqrPqIacuxQnvChYOkD+wox/QPKHQpXkL25lJrKuFYW8ebHDMMFne55ONtJphwPV9rQok51Chbh4arwE1psDS2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766556; c=relaxed/simple;
	bh=ywTK2DeK7x/fgkvo5FtlN8KM8nTduWZcKwVxsajGRbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W28HZU9Fnr9dvwLoiXj1mD/yDYXpEJkbG+dglISp37j88uS+8Wih4of/PU59a+rzUpBwvLjLvG1sF2tfwN3ebRdHXbOKBNpC41GrDzDZ7hmO25De+UPx5BW1H159ODwaFvJsB05LwMmNQhnBlMccanUctr2o39p1iJY2KdaOPKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg+1r55x; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg+1r55x"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c253358b121so50447666b.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766546; x=1788371346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+p8g90ua/VmPeeYb2h2bDZ1FPwrIxPT5htOXu5iw3A=;
        b=Yg+1r55x5+gexqA2HILICtrF/8Z6OJ6lgunOVRzIByPj3xm7NKYnmzCAHD4eUx1z/H
         ZKB0zBdny++JvR0zo4Gcj/oARNGBiFFBrN8wwFjYP46gcIlGVO7GOwDJF4mcAryLLPiZ
         Bd4HDa3WGNS+A4VYCf0Zv3jReNzbTLj3K837uBe5goirw4uxxeOavFsEg9FDMIBBu39I
         P4UhKiTXjmX4Ez+lWD8YWGU9SI0YDBk6infGBNCU9pHq17ZjaPTVJQ/49miT4YdWP3D3
         JOgs+4Wyi++UJWeHrb703x2x/2BHXsOrx9Idl03bpDM3hIoYhgBouduJ+IBmm965CBQE
         V96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766546; x=1788371346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+p8g90ua/VmPeeYb2h2bDZ1FPwrIxPT5htOXu5iw3A=;
        b=la4ntLRJCbxOyAg3WraVbOJ8zPROU0t65jwoOSBOrgyd4eRk53+H1iGVLY5Zn86KK3
         dhDI6uudAAOKtcjahayKJSr8dkTIsrdEkGayQ4zmJDo7jz8k9DBZtREezmgksqdHIcTh
         9piF4BP62+eidZwz+657sRVTmM+lwsQljI8z6SKrV+U/Q85K4YyB0fXj7x3eMfdd+k3N
         HDBVOSC5DahCcCFLmKj78qt2x01RRIjzBC4aQO4IjQe3zRQwpFWyMu7RY7Efe8YuOWQl
         eN5oTxLOqfkhnwi1pnopP2HNkiarXr3p+vGES+ygpvFo9cvd4ihXasq0iAv07jaa5KvS
         twZg==
X-Forwarded-Encrypted: i=1; AHgh+RoSONVrpbFUNv9n3JT1KDi0Uy8wHXnZ2w1CJijIZBzT6aKdY4NsP4VSzsRltWK3c2Z2kA/YoyzxS/6T@vger.kernel.org
X-Gm-Message-State: AFuF++lRwdOa0SixHmJWaVa+pYi/5aMkv6RCdwuVBXdwVLPXTiJpngM6
	eYI2Ckhl0hL2t3tsCjnuTan7ax2SdItu4CARcTI/PXmuOsKfko0eU/AB
X-Gm-Gg: AR+sD122evLJBvi94cUvOJA0Vfe0gg0qAiLdQax9J+yCjuSwUv37lAwBbOYBQArU7N1
	3gNbESdUuuURPS/phCV9EjJlb4Tx1xlUUtdGhM2B554lq/JqXc8ySPFfDRG1ABRW/iyGPKpYukf
	zqClYFrDd14XlbDyoNPRq+qZY4k34UD5UNGnhstj6nX4JSmpPddeac1S4J2hJUkZZRAHv7si2AG
	FzEaDnES8HUE+2xBrREc6noltPLvWvHmLV66YWe89x5IXxjfowS6+LVMpTqYa+kNJO+PcIhaGxA
	qxmj8nleSNz5Q/6mngjxMqdwesP7UcdoxiLtufdzYbeT7UiQGhqI6WpAkrW965yaYyb48gUewTC
	pcG/TCf0CvvOMaiRw7Jn/kevpXPbwkgQpUH8GLLJu1b4zUv4H1QR4pWYy5oN+9D1iQyagHq01fk
	AUR2XWMqy7jJhhNylQN301m0qV14xnsudh0aXRNKB1yOX7qpvvHLoohPd8cLtjeu7TivbQBtyU8
	50RDEHQb08H+cCbjy7HuCSj
X-Received: by 2002:a17:907:948a:b0:c20:f95c:907a with SMTP id a640c23a62f3a-c250c318b25mr986184366b.17.1787766546005;
        Wed, 26 Aug 2026 10:49:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:05 -0700 (PDT)
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
Subject: [PATCH v3 08/13] arm64: dts: renesas: r9a08g046: Add fcpvd node
Date: Wed, 26 Aug 2026 18:48:42 +0100
Message-ID: <20260826174854.199139-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add fcpvd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 9f5ea62efc2c..ad38aee2efb3 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,17 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		fcpvd: fcp@10880000 {
+			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
+			reg = <0 0x10880000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+		};
+
 		gpu: gpu@108b0000 {
 			compatible = "renesas,r9a08g046-mali",
 				     "arm,mali-bifrost";
-- 
2.43.0

