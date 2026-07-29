Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8F347A871
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325834; cv=none; b=claEDQ0XcKGu8XQXdBAiguIU42848FMQgYEE3f9LQEcJlu8+us6cUcOhu+hUCgTLnzzVOA4IiX6BHl4iC6/XRIoJJNnoAZ8ihuGzzY3Oj8A1iCfWBIkwUgiFszP1CtD4LRAxZxyoy9LBKeh/y9ytI2y5rSEsyLFxJz1cTGuNykA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325834; c=relaxed/simple;
	bh=TuSa+LW+vJgJwcOgdlw8edueTCih4Udcya601u33E6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CyaIG5sfjuIJHORHnU2puPLdivsyg2qKuuE9UwI2HO+xmQLnK+aucL0/ZXn5FV7Yn4WdqVGgGVBKuYcH8t+zt19GENyQIvAaM5YG5kIaIZZkM4SjHXURU4YIGs/pSQfL+fjzV5Mq10R9+jPBGD7E9Yk7TC08i4eWXilJ3CTC2fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cl9OOyyj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cl9OOyyj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956869750eso6143605e9.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325830; x=1785930630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvETHTy/c+xg48mfhdZIbcQoJJ41K2xfS24xxpSFG5s=;
        b=cl9OOyyjjjwDsAr+a7mDwlsvfeWyS4/7uKN8JllTXRCnNqXjpjJbVA7nCHDg4i5Lk5
         WUQTDLEk2nkVGHE3OQIxCMW2saO8SP+/om0ednp5iaS9zWiABPc6c05TMZk74JdBDvEd
         g63/UB+ChGEBT3TTSKtAmoHZktaCPcJcaZQ+hu3Hx3VEDOe0aT5ILsi++TlbDCo+EWLn
         MLaUEAYMREf8e9yrjiC++bzCrCotHw/WG0CeG/pu1Zq9z+3EZRzvS9Y3DT9OZq76KYAY
         +KGViEaknWRK6+h2UTx8PSycrCdP920YXnT4i8ydKpq1yJlNmuhhRUm5nPzeMdlKNglF
         2FJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325830; x=1785930630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvETHTy/c+xg48mfhdZIbcQoJJ41K2xfS24xxpSFG5s=;
        b=DL8CuP5+S9ILMhmUWxuk9/ZTJbxq7xjgOTykE8WLVSp68/QhBiaHLNKgdXmdWLA69+
         Ud+HJXMtaghnoCxYhg0jKrAyMhA/qygH685hIPjWxlxcJ0IvwjBl7/Zf9RfaAS/6GMnN
         FJSdmZvnoAhJtVFiu86RsG3ijuruiWHWqnpVgduoIBDIXbAse3MNFtPZr5d8kUrvSiMt
         XPx9GErOodphtWmuJQTTnsTCbIGyLq0HBV8D9gtevoLNv1CKSqKxLLBRCzfhNAIkXW0Z
         dGNcL+l/vSAsYEMPMfywj/9w8/rU7js5Iq37pN4KDVXUBPYwKdiJTWEBeS4M7LnPbmoC
         THjw==
X-Forwarded-Encrypted: i=1; AHgh+RqtaB8Sv8TFotYnnOxPmaxpZdq7DOtVa6CQ8lGqkiMr1IMjDHTi1jpdmPwDgdj8ZkJZ+1AbMiHWb0x/@vger.kernel.org
X-Gm-Message-State: AOJu0YxQRe1hwp0s0nW44oRQyq6XWd8tTQrml6oi/bJv2ZFMETjAb0Sk
	cK/oQp2dvqBSS4E4+MHo2zJJ/sjNUr7x18+7hBouM1t4SppWyFDukme3
X-Gm-Gg: AR+sD139KIman6B1t4m+ps2c1fEGIaPjPLxQRWz6gSllm450SXyiaQLHMdI4oE0usZv
	qDYS45bkWd931QV+HEHrlRq34Jl8OQ+R1387aPzO21e0P+ht2Lb8Fytu0750OXD7k223V+JR6Wc
	b2CPMD99aEHCNafn7q8g+Rc9LG9+G7vcXIIlWhmUVx5lYcwQ5LF5tHWhtw4po6PGoFSkg+BR6pK
	QzGtk/4ERByfwqd37V2rSv8P9SRcNkoo7t6Cg49P4fljIJ1w44JqnzkvGgUBpRsekdQO2onwjW2
	8G6Ttbn2tbfBE/KQ0OklOHN0ZPKTQ8jr+FPPPeIqDoFBTb+eMD9XYVPkpKzUnsPxBu76aCXQLfL
	+6CDZwAIDzVNoC1C64dKNd87xKd17EK2HeuF1PU4i4l6aUHRrYArRQK7i1D7gpsF+G/zu8LAdAq
	UsetoPt0ldDwAn1jk2mIQ4lvCekW6ofusMqRv8/UHwf9lAIP/B27E6evoi3YE97KBRfG0vIzY6R
	8k9Ze59IjEFwg==
X-Received: by 2002:a05:600c:4744:b0:493:f6f0:d66b with SMTP id 5b1f17b1804b1-496c6414fd8mr67790835e9.1.1785325829559;
        Wed, 29 Jul 2026 04:50:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:29 -0700 (PDT)
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
Subject: [PATCH v5 5/9] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
Date: Wed, 29 Jul 2026 12:50:13 +0100
Message-ID: <20260729115022.222340-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
References: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
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

