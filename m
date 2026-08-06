Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3404483A4
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011769; cv=none; b=QPb1PYY+sdWFsSY+cytxegUb2NAIAFu0qwIX8z7ZP4m9Vl74kkmHC0o8EDPkL0aeMXcCly7fLwuNN4QftmjLKGebPfXfCcTEkGETYTw8hyNMrbUw9uM/IuDKuy7ZzPYwgrv0Nzqm84ruUyM9PG2ewn6ROOabMSsTcQzj2t64VFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011769; c=relaxed/simple;
	bh=0AJy8TlyfDRRw+maDVYJCDG/5w/BHVD3ALTmYIt50hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bsr1IMUKQwypWhAYiVRJK6pP6imRAwyMTptXitTmsXPm4qDFYVAbk8pJFC28iWL9bxGT0sCifMTwHGNwm4+QoBbh+UBreoWvPwPUBMgPN44dWrcq/TCBirjfb4oaSx4YFDfMHVme/l6svsDkteS4ggBL0WB2voSXP6VhZFm32mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvXBbzyh; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvXBbzyh"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1262573f8f.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011764; x=1786616564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wE1rP+31RmT4ilzk4EfZDJMKx3C1i7D5wMzh/zw/hTc=;
        b=GvXBbzyhHgb9d6vUFSQYL9W6VUMGa2TT6hsITkNGixPKcnajQ2gn78TtI/iBeLwsut
         v61xhEU2ET2EWqg6OGgQBQLEJZz9L0MxbFyYIsIwe698TU15Yrhu+rRQSueAV0Ilvm54
         wzcGAovGdF4Snll2s1qAkf19UyEzJSRxYJrGuWn1PgE7bk39ftI4+yLoEtwwAVN+YWoR
         cDa60j8yWivGlJR9VHDm9YU1bSZhSSeW20KzcZtt/Hh7ZtzUXo/b9rowt+5FtzdD/OUE
         Ml+LqMn8d6PA8F1gOS2qz3eSCmZefnt4GYlY9h074PydyP+sHZYVreE4sFNZUmIKRNri
         AW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011764; x=1786616564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wE1rP+31RmT4ilzk4EfZDJMKx3C1i7D5wMzh/zw/hTc=;
        b=issjjychvNQDNxTNd6NBagrXXirWDFrjsNAnXI28vwBRGsuGr64JKXkcDSO5GgHKlM
         PoGbMobFVFuiqtjURyz/97cl5/byIi8Ms8KKsCe0Roz507pPawJXviY1lj0LsyeanXWU
         Vvt2F3SiDQZ9pmWuzGShngAWc7jzzR5z9TIIY0go5q6fIaT9GsK1ox4Hfhi2ygcCKiz7
         HISbQpGOS5Q3ClW253X5Uir0e78UppTlgYMGQEqqjtmmKJj233pZOw7dATvkFCPsMlw8
         evw7BlaAHy0Q5B2JpSIykcjW81GjtYfHR+GJDUnhZ/ng13P5+/sZKKNrEH3gnZxtUAgA
         PN/w==
X-Forwarded-Encrypted: i=1; AHgh+RqzBXLP8Za6j5r1V+7SfbII+pN3seL9n+ETOzSIbLQn2FAgyqdOxjeU8jmWq24mZCVzW8JT3cudIhI7@vger.kernel.org
X-Gm-Message-State: AOJu0YxJdX8eKUTjf+S/J9IjH4SfSuox7h7LRAs4kldBa9rgYdyZksfH
	MhqEipZG2gaWzFK791VzUzqoKUPeJYEYsjkOA4+byNemvQ7JWyzzmZjM
X-Gm-Gg: AR+sD1049ob/nWFhDPlm/cMWtBSarX7DlUj7R48PbtiGui/+fGdnpecSLnJBXH/jeXr
	6rvgBhug7UrwH3rPJxWKNgnW7rvyOkkicdiTjv9IVGaSl/VQWJqLtHqGKmXvtgjOkqktmBmLrFb
	ryufuskdR5q11qP1CAV6Rt/zSqsPpv73r1bqmFvfYi4Q59sZa9dlDY+5Bnz4B+58YoUjhxmCGx4
	E2embtMsCUZ1wWBIGbNKrSH/EjOV1yXcYphH6jo3h29JV2FBtfKH1W4Hj7lfq+bTf0sh0byN+Sp
	r43dkacgL93tFz96Pl+GTMphYS/9qQsE22eQI8snTBYiA6/t5TYHX6yFA+z+fiHszKAmUZu5PyJ
	r+bL+oZ0p3Kkq5QEKxNV6Naky5VLiPdufOtLL6ZNKfnhE6l2IDUptUuLi/TyvSWDMgaE/lSPm2H
	i3Rp/fCyrGsmKBD7+IIFrTnypWwP3N/FXjZcwm+HpY6G9Hixa7FeFkI/+zdOSpC1CfFbfb/4yls
	NMUDAmOplD3
X-Received: by 2002:a05:6000:604:b0:47f:7526:598 with SMTP id ffacd0b85a97d-47fec5037eamr21046463f8f.12.1786011764300;
        Thu, 06 Aug 2026 03:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:44 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 06/10] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
Date: Thu,  6 Aug 2026 11:22:25 +0100
Message-ID: <20260806102236.149159-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB2 PHY.
The RZ/G3L USB PHY is almost identical to the RZ/G3S USB PHY, the
difference being 2 OTG blocks on RZ/G3L compared to 1 on RZ/G3S.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change
v4->v5:
 * No change
v3->v4:
 * Moved the patch for easy merging.
v2->v3:
 * No change
v1->v2:
 * Collected tag.
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 9740e5b335f9..d6b9d08ceec6 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - renesas,usb2-phy-r8a77470  # RZ/G1C
               - renesas,usb2-phy-r9a08g045 # RZ/G3S
+              - renesas,usb2-phy-r9a08g046 # RZ/G3L
               - renesas,usb2-phy-r9a09g057 # RZ/V2H(P)
 
       - items:
@@ -132,6 +133,7 @@ allOf:
             enum:
               - renesas,usb2-phy-r9a09g057
               - renesas,usb2-phy-r9a08g045
+              - renesas,usb2-phy-r9a08g046
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0

