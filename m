Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB321ABD7
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777945059; cv=none; b=P87BqarREoLoBXqX5DM1iX+pUYRqUgyINU+eQOepT+zXjs5MqYdgsBAfNRyD7UppfmVG5aTFg7FJthLZ4mz0MKAvihxqD1T0PSJwwJQ5SBxLL1LlPyV64X0xxidkR4zHI4v7u+omX9FEic3RyG3RnyJut8np0jk7EQwbSMT3K38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777945059; c=relaxed/simple;
	bh=IwG2wo6BkstFh+qMX/W8nOYuTZdNYDK51l8RlSVJlIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RX81fRDLzK0MdKnFiqRW+2e3ZzAiMco/18yr3+BgbQqgj/4HFXSXHzD9GjsV7rs0v4gyzscwaB/WRbHa/KgtjzO3jEHJoMx9/6FrkpNDulnMynC0xQOk8QXBc+aA7idOyxaAKiuDygXsB5ohkn2exqMmuGCI0wzW+18GTP+jWDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRT8qmTZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRT8qmTZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso21230645ad.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 18:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777945058; x=1778549858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z84dwc2PsPdYxwH32qOj6+DQ+b4iRKtcB2f35wW4+cg=;
        b=SRT8qmTZ0Baq0wUSP8YhHhsKGciGRjk1zGFwpmwjvZw0uaC0kVZmzVr7q/61hn+tw4
         I/yHsQgsmLFeT3Mb60hxds+WOnwjElMZj3zppegK47Jg9NJ/M5KpLbUW6LdVj1sFB3kI
         lrHEhU77WrStrF+CJ4jeJ7nbDfpMSyHUd3xtMlLpLwBXtq8bsRjL0xp4No3S56wGYN/B
         mh9cX7YnDuvo8iQzw403zJ/f+PKKuXdiaLV17C9SHlAMxes/OWXwgvulu/CqoR0d3J3M
         bw45DMGBcCBgZGFA42MVqEzq7OwFKkIZU/Ezt0uL1WRy7bt0HYxwNBojZoGJGnKra2bH
         eelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777945058; x=1778549858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z84dwc2PsPdYxwH32qOj6+DQ+b4iRKtcB2f35wW4+cg=;
        b=h53AXJzLM1B+Pz3hj1J+ExQ+YEcnh5L9tGdbovL9HcEprfsZx03vkkhK9I5DcTruko
         TFcfhKcwrRbJi81W72Dffa32M8aJvHyx433bukJqgl9tAJFtuepQ1YQTAqVDqaZW7qLK
         ZJIUqJwPr9iMjo76Ki5P/IK7gSgfVxbvRpY5Q1Iofm6Qtkp1u7AWNfl2ONbwbyC2QiMD
         JaVIu/cFYM7YtLNU5Y+NdFIhz9uPK9RAsm5ptURGBr8K7yY4IykCr/Y9quB/y0TEM6ka
         UivayjW8sLihBlWqwUFaT8d7ZQKieJkOrh1ubU0809wc+5gMXriwTIUnLEsp1cm/hM5x
         xggQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7pe5uv6z3bdZhAtqI9rfNeiu7ZKkb4KXeJZPA0t93MyQ4vlm86VZqDvdfl8A40K15sdTpWn+/HEz3@vger.kernel.org
X-Gm-Message-State: AOJu0YwuLwotSlFYsVcAQT56d4QOGikPVDU19pC0Nd6c78//tcsenEV2
	kFmKRMeoxigfBvE32Pygy8WbBR+q8VcOqOU24WWxJwtY+c/WwyolbxhG
X-Gm-Gg: AeBDieveeTHY/Ytv/AwcelYzyKOz00sYyTQ3fyoXARovaTWC/6KeKUn1B6Sa8aLIFcr
	l0UsZEJM1RHqv0cqB5yHBLVtsKCeDlgErFvHsU3hBC+dJKAVv01VvIo1DjZpOftSjM9XTlMAJb/
	xOy1CDT3jtE9mvGHoQGpTZRJHM4Xnit/711iVSiqhBLOKZRnikvpbhLnRDrxZZPdhHutDA62VLd
	SnNk3g1jzz9UA8LhGjZTAm2Ix6VuSRPyn0ihYjZPO/aXm9rnklUUQYngdGXx9Fi14lZhWHJa9CA
	P++zJbC+hC3ci4ZvhQQl97SefENnSWfCd+T0AKT//3GnsjpX8uljV/nVpwgQpb0QY4qp3xOzpw4
	wIUF+x4e4v74bZUZfGe98SqQzNynYY5d46zFwBX8nNt9pw/XWjZp4jUsD+1zC3d5dvhN5odQum1
	oRVEmg/vR7YIsWLDodDESKygTWwk3ZOgaawCF6tFdn9v82vsG2bz4QX/kY
X-Received: by 2002:a17:902:7c04:b0:2b2:42f8:1a45 with SMTP id d9443c01a7336-2b9f283eaa0mr77894575ad.39.1777945057416;
        Mon, 04 May 2026 18:37:37 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae59f62sm114565335ad.70.2026.05.04.18.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 18:37:37 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id C3E5C4163B79;
	Tue,  5 May 2026 09:37:34 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v10 1/3] dt-bindings: mtd: nand: Add nand-randomizer property
Date: Tue,  5 May 2026 09:34:51 +0800
Message-Id: <20260505013453.980249-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260505013453.980249-1-linchengming884@gmail.com>
References: <20260505013453.980249-1-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Add the 'nand-randomizer' property to control the data randomizer
feature. This is used to improve data reliability by reducing
cell-to-cell interference.

Depending on the hardware architecture, this property is designed to be
generic and can apply to either the NAND chip's internal randomizer
or the hardware randomizer engine embedded in the NAND host controller.

This property is defined as a uint32 enum (0 or 1) instead of a simple
boolean. This design choice explicitly supports the "not present" case.
If the property is omitted, the driver will not interfere and will leave
the randomizer in its current state (e.g., as already configured by the
bootloader or hardware default).

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 Documentation/devicetree/bindings/mtd/nand-chip.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
index 8800d1d07..effdc4f99 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -23,6 +23,15 @@ properties:
     description:
       Contains the chip-select IDs.
 
+  nand-randomizer:
+    description: |
+      Control the data randomizer feature.
+      0: Disable randomizer.
+      1: Enable randomizer.
+      If absent, the current hardware state is left unchanged.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
 required:
   - reg
 
-- 
2.25.1

