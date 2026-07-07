Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A333742CAEE
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435014; cv=none; b=NqV63gITbre9DcUsnoUHmdAQFEOzUe0aFLWiTxxm1KU0m4v9LaIwWdirhDWWQpiuqnf+nsAwKQcwFQDupzQMeWOH3J0aOwvN1S31FmIiiT4IKA5Rl0r7q23nM2bqjyajCK5R1XOe6CBYjkJs62iDjfKSgsc1Ok5AdNPH/yDjAAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435014; c=relaxed/simple;
	bh=bgc4PIqSQZxUe1yo6mMLg2775bSa/NICAsyxdbxA+dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OSJyrCcPHjoF0wSTdY4EfB/LTQLUxkQfwPsB52HJ/h1Y2mKXeXPjlhMhV+NdsrfmCdLsca3D+SIpfcUAHX5ATjASMbC+DPN1n5eWZaXWSAZd6FLFpgvPklLTcHUr+1Fr4LibrneM+YBk8YlyyiP3ro0iJSSfcb0sIwSw2UvClLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXXB3krc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXXB3krc"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1981932f8f.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435011; x=1784039811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cr4ORC5iEzVJ8CZQXiF8gWDp6d51C+uYuHd+oA5It4Q=;
        b=GXXB3krcq9gDJeG5ctUb0VvNIOzyzQE1LaVcSXJJU9KhVVgCUp0lemQjy/rBsusV+S
         TjT884asz/W8rTx9n4sGyFMtdtgzdt2fZrUJjX1MrG7Yu8sPUEiAvMYcIkyxh/mQZxjQ
         aTRymFUY5uaC2Di5+olinOL3XdfMl7bbaTkD0J4Qye7OivkhykI2Fix8uxzCcGd2bFCP
         8bT9FpfR92zmFQX1Iu3BRNly58VB1Qxvt/VAK1lW+1oSlYM2UU3hz6/wOwmVEEtObnXU
         Y5GRd0Uun3vlmn0ntaNhqOj9O4hBpIte7SnEePZTegcDI7Ymhc4WewnoAjJRBt5A7JBM
         bTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435011; x=1784039811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cr4ORC5iEzVJ8CZQXiF8gWDp6d51C+uYuHd+oA5It4Q=;
        b=rhXwP2JBXXdJz09AeCrQHljRVOjvmFMoUiSftdjFQo406KrxSQJiYKbvrFjwm1jFT5
         FiV7xMMYwLLlUemSv/hp5RWLCvdtrMzhsOYhvDOnUA4Unutffhn8Ki4Jgs7UgkQ/dq2y
         mjF1XKBKmJW9vFK2Jw7s2N6itfU6hqtacPNB7AoJ2NAQ6AGtLDGZawq5p7FLl2GcHwem
         vMHcQgwFfMSaEYSHpXf9pUzZYEJaOwQS6Vk2CfSD0lNI2twVbUEBwc+tt4DeJKG0GPyN
         EtMHuEhyLuKPf4exTr/Tddx9sy49/5bhYZaVeVAnd7sCki/jnPeC8KuZMaQbyRmwNLDi
         0KPA==
X-Forwarded-Encrypted: i=1; AHgh+RqFhj9IcuDurCKKPG+wd7RKeivSlu4TXwPxxR6G2i8TJ6U5/RlnuL+Lrni4Kzg16sbt3Btt8VXeB8J8@vger.kernel.org
X-Gm-Message-State: AOJu0YxYcopcvOb10vN95SxGSrbdvuKzQveEZn2/QZox8WQCt5EmU6Oe
	ta7xhVEtukZEvIdRFIfVZ8ATkd9VV99/lW5DRLXZuO00/9OwDaUHJrR6
X-Gm-Gg: AfdE7cmYJAN+/Lmn69qZ5IYrBS/QbGKiqa/fK4giIUIwVts/Y9ajrUp3xJ/4xZSPCWu
	6HxlPl3nFRgzIDjwUisUaHvFjBXHlxPDxWzaTUydJSSoBvKREt0H/9LmR1tj9yV4tfuQ59hbibE
	EDMq4kSfDFm1VjhUQppZlo/VYEbZRR5wciZJJJiMJDZaH3cDj268F5hhknbBnaGxpc3XLFO3cxs
	csRq7rnFFfKyHM7GQiJwZJnuZwjVD5qiCchDChNZBW1snZZOlVGUiHji/4N2ERkkombaPiIJzJE
	vY1d4xq9Wj6R43uW/XZ/htkw/AAPPHK1sqeU5EklDDlOmxqgMyjz+86pUJL+s224kOIWuoyZsEt
	NAdTQwwIQ4fJfd+bxlqrZxoStiWLb25Qu1xVCgNufZqr7x8Jj3xoKD7cebRgCJscVS+z7VjMIfz
	wcUKHIlDP1M/i/qrynWGYWqudqkW1GJhaJW0Gn6w==
X-Received: by 2002:a5d:648a:0:b0:46f:7d90:8127 with SMTP id ffacd0b85a97d-47de66cf83dmr5043918f8f.13.1783435010951;
        Tue, 07 Jul 2026 07:36:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:50 -0700 (PDT)
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
Subject: [PATCH v3 2/9] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
Date: Tue,  7 Jul 2026 15:36:34 +0100
Message-ID: <20260707143646.245177-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
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

