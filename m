Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5084F4582CC
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766565; cv=none; b=T7iEXSqY4mOpEsfCcrK6p+npN08d0+ieEfyoeMWy+67V7VdrUfsXuB8B6AsGuB5z5xC03BH2JyZJD86F5eb2AzHPMf9lqPjUgC6KQUCbbEswuX13RM2y4T1eO4i6FNQGGv/D/V/2hJgNj8rHbEE/ffghATvZlZ0vnANeEcp5Pvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766565; c=relaxed/simple;
	bh=lO/H9vG52tHh4g/YvK/DqO7kXiMl0LxMerQhc0b8EGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+Fkt9F8mWio8UkYuU8zqFre/33DjQ+dOIJUPcD/GHFEldmyVTQPv5/BHbTfgmUTRhKDgtGO9tA3mDAu02lcXcwVaCoSgVdekCDHYiVBig34SsRmFgutPUYQ/P2olC7PLb6qAnt6O1IsyTHQcNb2EK5+t84yODFg/E87sklmikE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAqR/An/; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAqR/An/"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c250f28f1cdso202347766b.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766547; x=1788371347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAyR7Cy/EycHtCJ5inXhtOKXSOAgSgTPYmNAjAm8Uio=;
        b=BAqR/An/YXb8c/92pr4qotVmL5qCBIOhHGvRiVUIItBOBDghFbbJmtvBHwc5T33XGL
         FOCqVqt0uTTZmdwQ/fl8Mb0O2kq6FhJPXZQ5zvaw9R7CfcmVFlp/l8o11oGe5nyoaJwX
         r9NyYTBO/j/zvSy/B2dt7cESTA88OP5LU0DsHsrZDl8nKEM0GG6UjVZ1GxUMgl0mBUXE
         YYRjtXyKCNIBpvFTw5JJdcvW20ttj30wpB/iDgxIsV4xlecapuuTw+49/yh7lbiz/iof
         LcmP40el8QFjFervwd0e9hTtG/hJpGcLc0Tl9d8NaflZ/qZuRhP984WyGoXsTSQoQm72
         0qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766547; x=1788371347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EAyR7Cy/EycHtCJ5inXhtOKXSOAgSgTPYmNAjAm8Uio=;
        b=LmeXhhixDAcbWNKcnPCPcSnsY3KDLeDqLfUFfWQUN4MFVi1OfSGirAa4d9rhVysn38
         BfyMgQ2VsqTw10Fkn5Cjx3pMYLEjOauAwZ5WwF+vApLBI1Vq3gshz4UX5qPm7pyd55Qp
         NngWTEFxG77lvvg2R64fGKHcJE4gROiVgf3MOGXo9xajRel4DHP0MW5HZn/dTk5qCq0f
         NcPvE6t+8TSJWFvfgJIFpC/9g8wByoCXPwup9c4LCzjQB2mD+2tlpQcvOANSSTyF8mLC
         YsElbwyOYxnZJhXOYQeTo1YE0plTctUL6HSRSmzYjz2AgA6MmfrBbOdeRxOk6TCBWZNf
         SAXg==
X-Forwarded-Encrypted: i=1; AHgh+RptpD1Ck6xjmzE2fT2DGkfN5qNoSPF4fdvrgukZMGe5V6TSAyL7jTW6BLu3djad37KVZqKgdnE2yEFx@vger.kernel.org
X-Gm-Message-State: AFuF++maxLueUeo1uG4klKNcH4XayV+/FGGDY540IgpchQiD7x/6rKUC
	HGWYWdjep/Gzr5mq3RvYIvDe43Tgq1WuBssV0pIZdirlUaCScmfONWKR
X-Gm-Gg: AR+sD10zA78K9zWt1wk+F9NrkfBtGTDo85msoHchMZlT1zG6aoFR7zvORq2elY8Tv27
	/HmIXCHR0i6vTUjh0W8cFoq2W1lA6BVq24PqYLe4cefktlmB0xTVjLTwpgfACkp3J9zUa20oBr5
	fLP8o7XDWjoQ0GwX8i+CKtb0CD1zriCYQIMKQ9cWTllEme6VZC3jyAkd9wcRF/kk19q8w0LlutK
	xELgez2SLT9IX/FAcW5LgEdGlehTdYoZwn6vies3CDutsU9DvT02dr+f8GgkXGbhnyBjUfaXz6M
	/bGyWvuOytbP4TtLnaXGpjIcy44m/UNOB5qpOUVAnsf3ZSqQB3CgqZGwOsyl6TYWEAHlMdn0lDZ
	a3QMfokqUnEUrndkPowXmrkCSQ0cjrnO/cJwmFhUH4KkjC30t5SMW9B4knmjcWgOkhWGhEaauuY
	DEMJnmn2v9DjLnOr+JjdBzSzTAXxgzeKbX/KBDJgBdyF0zQNK8ZPsmoWLh/8kgEFFg6xXsWYlfd
	F0tpDiek1dgqs5M8qgxxsTI
X-Received: by 2002:a17:907:c8c6:b0:c24:6985:d7a1 with SMTP id a640c23a62f3a-c250bbcdcb2mr1121271166b.7.1787766546793;
        Wed, 26 Aug 2026 10:49:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:06 -0700 (PDT)
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
Subject: [PATCH v3 09/13] arm64: dts: renesas: r9a08g046: Add vspd node
Date: Wed, 26 Aug 2026 18:48:43 +0100
Message-ID: <20260826174854.199139-10-biju.das.jz@bp.renesas.com>
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

Add vspd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index ad38aee2efb3..6ff145dc81fa 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,20 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		vspd: vsp@10870000 {
+			compatible = "renesas,r9a08g046-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x10870000 0 0x10000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
+
 		fcpvd: fcp@10880000 {
 			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
 			reg = <0 0x10880000 0 0x10000>;
-- 
2.43.0

