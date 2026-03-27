Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6233FBEBE
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633375; cv=none; b=b0MDyfDDN1iI22DGivB6NuwLdVkvXnHazA4dpbSHPjeiKVUi3DYqINh5rYSIPtIgGu/PygoL0jI5OIVD50k9E46LltkISFphS+ws/sR0/BaeYfwWrAEMzy30k4Y8kdA1uT3/A3LI+nJcowZJxQjqREwcB5jdmyr+MpHSwoCAwKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633375; c=relaxed/simple;
	bh=t4SSfXHIac8jCT5bDwrO5IN+FDjym5opOhoaI0NA79E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjNfqo0ip9dPRu4OygxMVf1XYYnkmhS3Eh0mFWmicVvcohqvjunIygItrRwM7r8lPxz4x4aHFfPrcAbWNiUTRkbZ4Vl/7p8elA/9R5QFhnCcePUOLMx93vdk+i9BtT5Z1DDDwBccyyC9lIHD1u7bDaJVTq4PO57pcsVtoTOZyYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgm7UYpM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgm7UYpM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fb112c09so24263555e9.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633371; x=1775238171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90Ymw5BXIdj4erWp17W/x/NFuWNsVOK/0ZIwzA/B/wI=;
        b=hgm7UYpM3Lr3OHlGDFV0Nzbv9iCdjypfeK1yE8VtgICwuCn9gPYtvENpISWS8vnC+4
         rgoZE1WCCaMOyQahyD9H97l22LkjKig05wi5sxbYaq4NKQytg/J2qRplZnQ4NGquBHn5
         AsG+53O3JIJifs47eEFJc5r7LrFA+jvQ4dWLiZRb+ImPZMw8M92IsFC35/sfO8GdUOQJ
         kylDAlsWembYcrXQifaqAZD18b8U6A5UGSDTvlqXeLbEihDo5D6e48G4LAVZ0QIJog75
         itB5sCEb3VJAUO86ORJ+3GpxKUEwzISuJGj79VWxNVl85J7/X6yz7L/x+pUER6OQwd5G
         vvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633371; x=1775238171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=90Ymw5BXIdj4erWp17W/x/NFuWNsVOK/0ZIwzA/B/wI=;
        b=oat1QQXHCN9XmCKJT667AsWv+lso59bqRE083aa5VwEvU+X9fh8gRPtdkzrd8xJTtO
         /yUX6sj2IYEEfsdHzM0Kwmbahvk1fAXg7bXeWv9J9I86ostQkDF9YAojMFRA9csQHEtJ
         vJ6+sqFCFSzerWBzHodqKx4xUNbNMjzibO/Ka3zNOoa0vgYsLj0N9rT/jU5HxYeiFTBG
         gzNUafys0crOLIXv01sgYgXt8Qm0Xp+iHpg8XzNSbZXCFphGlJcLfn8cUxw+2QaQltGF
         W/oeYoYvLoOs9kr6XzbBu/FpkuAGsu2UvM7EXayE80fChEsOcyU8jHY0AR19cscpUCzW
         bXCA==
X-Forwarded-Encrypted: i=1; AJvYcCWqBO822+nLq22PYcI5Ode0D16fAUQZjga3PsqkXCu+BFBxUOoqBrtZJ8lN1yylg3gFdHtAi+mS9VXi@vger.kernel.org
X-Gm-Message-State: AOJu0YwUoQfRNr9qSPUhdYkwHCgjpP5Is8CHrMe6nOC7j9lW22Hax7w4
	mqDA1JKHzcfIvDbBoN+bRugQKsUEogBA0Vi1h7agbMGRpn+PQspUZjqj
X-Gm-Gg: ATEYQzzR+ikWZKDDHeD9NLO0hfNMLfaq3c9W9ecOZBpc89WdrHo7PbQoKIv8GLmf1Mi
	Nm2SZr9EAXGCk26eacywYq/gIDBwtayBwLBG5fONvz2CGrBSxyLV6zEntcqNizy7olAQMH2kPv7
	6ENAuGTTzi3fSxk9L4jINQyiun989kOBFzJlwzJPSXpgvCylSg/y73LqWx4cyv5Q9EAgVNCGu1/
	1+XY0zrJnX3BIb8WXuOHTulgEdtsC7kCGclkp7wKNV87+nqSTK4WzqlT+phDQnjzDxQ1ZzYH6PY
	5A28QAVy7w+AvvjY4COSp+pC0HoDjzsOB2MXfG1cCR8ZXQ/sERQq/dyyNfxepoTEiqryifj6luR
	uuMVrsPQ4cPOjY7sJZCGtkwutbiah8yCCRhIxjibNjVyGe58hhIxt+eATnoCsljhe4yWjeAAZ3G
	GKiEEkHK0O/5Z1jyWy1JVCjFHlxz8I/Q4BILvS2C0Aqzw05//cJ+BDzLfVtaleUqttqN6Ods7tU
	oXL0sONGBiKYxzUglE8Ju2HdYFrkQ+DLby/LL+3ZFst3WE=
X-Received: by 2002:a05:600d:7:b0:485:439b:683f with SMTP id 5b1f17b1804b1-48727f5fe73mr44646895e9.20.1774633371241;
        Fri, 27 Mar 2026 10:42:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:cad3:5596:28d0:27e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e528sm15965933f8f.1.2026.03.27.10.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:42:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] memory: renesas-rpc-if: Add support for RZ/T2H SoC
Date: Fri, 27 Mar 2026 17:42:45 +0000
Message-ID: <20260327174245.3947213-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the xSPI controller found on the Renesas RZ/T2H
(R9A09G077) SoC.

The xSPI IP on RZ/T2H is closely related to the RZ/G3E variant, with
minor differences in some configuration register bits. As these
differences are not currently exercised by the driver, reuse the
existing implementation and regmap configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added xspi_info_r9a09g077 for RZ/T2H with type XSPI_RZ_T2H instead
  of reusing xspi_info_r9a09g047 with type XSPI_RZ_G3E, to allow for
  better differentiation in the future if needed.
---
 drivers/memory/renesas-rpc-if.c | 11 ++++++++++-
 include/memory/renesas-rpc-if.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 3755956ae906..347650698424 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -211,7 +211,9 @@ int rpcif_sw_init(struct rpcif *rpcif, struct device *dev)
 	rpcif->dev = dev;
 	rpcif->dirmap = rpc->dirmap;
 	rpcif->size = rpc->size;
-	rpcif->xspi = rpc->info->type == XSPI_RZ_G3E;
+	rpcif->xspi = (rpc->info->type == XSPI_RZ_G3E ||
+		       rpc->info->type == XSPI_RZ_T2H);
+
 	return 0;
 }
 EXPORT_SYMBOL(rpcif_sw_init);
@@ -1142,9 +1144,16 @@ static const struct rpcif_info xspi_info_r9a09g047 = {
 	.type = XSPI_RZ_G3E,
 };
 
+static const struct rpcif_info xspi_info_r9a09g077 = {
+	.regmap_config = &xspi_regmap_config,
+	.impl = &xspi_impl,
+	.type = XSPI_RZ_T2H,
+};
+
 static const struct of_device_id rpcif_of_match[] = {
 	{ .compatible = "renesas,r8a7796-rpc-if", .data = &rpcif_info_r8a7796 },
 	{ .compatible = "renesas,r9a09g047-xspi", .data = &xspi_info_r9a09g047 },
+	{ .compatible = "renesas,r9a09g077-xspi", .data = &xspi_info_r9a09g077 },
 	{ .compatible = "renesas,rcar-gen3-rpc-if", .data = &rpcif_info_gen3 },
 	{ .compatible = "renesas,rcar-gen4-rpc-if", .data = &rpcif_info_gen4 },
 	{ .compatible = "renesas,rzg2l-rpc-if", .data = &rpcif_info_rz_g2l },
diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
index 53663c4e5ae3..39810d2db095 100644
--- a/include/memory/renesas-rpc-if.h
+++ b/include/memory/renesas-rpc-if.h
@@ -62,6 +62,7 @@ enum rpcif_type {
 	RPCIF_RCAR_GEN4,
 	RPCIF_RZ_G2L,
 	XSPI_RZ_G3E,
+	XSPI_RZ_T2H,
 };
 
 struct rpcif {
-- 
2.53.0

