Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581F54BB810
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061396; cv=none; b=PWwPWat4kBebBstrClSR6BtXQo8yz2xt3v64uTf53vzwXRvTEFSV/2tlN3c8BVuHBZeoLfDHgg+dDmlnO+fleRDU7HgVHp7erI+PSHEhSYL3pEjSTMG70I5fJOtz4HnDK+AvtQqKqyZsv7bsd8kzq7T4i/lSHrw5FTkx67f3jMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061396; c=relaxed/simple;
	bh=nEBAEcr1DpggMNA7XbubOTPWUzXKTrOJxdCh4sDtEpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzCr/f1JNzygRy1DJR5M1yyWTO8pmalILS1KKNz4I1Lvq+mCrH6wG/DWkdhkzdnGUPkdLMIRIeIo8dR1NbKxDD059qI1e/gY17dGnJ0IOGY+TLueH2aumUyKwEnkDoDXFYJgWv4gpAn/XJexYSZpyBpn6u37v7OctLwsQlHyYcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uf8ATGlq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uf8ATGlq"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso776158366b.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792061391; x=1792666191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/Zy7Y5eanQKJCoQxPls43jtvnUNLhviTL0wISl0Q1Y=;
        b=Uf8ATGlqD2E7E71plUlHZjRo7gPgEIFE2QDGWsQgVD4gp1E299msUBLJoEVMtZOjr6
         xFkeO93OjRoW8f/uYQGq094vD0uiYQoLxtqp3qHSIng69LRTpt+Zwc8hqRbuH64xJuVk
         WS0fTkVSkIssVOmNfempPGqJ3Z71xRtoQytZvdqOvt5GZ9P57fR61aYE8Pk7Rn394Cdj
         aG+7OyrKhLzrP1X+g5dOaBvjVOGod5GKTj+QsUCVbHp99fnEWFQ3i7TLcteorsz6SYOC
         UoRfjzrfExiQt61k1xQGlPILzas7C3WTaAALRLPfSRAcNsnhleXmP0WQTD5wdM9e1iRt
         MklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061391; x=1792666191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/Zy7Y5eanQKJCoQxPls43jtvnUNLhviTL0wISl0Q1Y=;
        b=ZviSMEw/DS4kaeSmzUm0W1vTuYTvCnXhGHCvw4aBSP9p4EOiAFdhu4B0jtYjQIN0dt
         LFsok4fqdrQkZWVQgL/Rfp71PsiEnq8nnVjttqPsVwBTB0cf+64edm84o1XowL5FYUXP
         0CFNm2cQ3ACmC71enwrNOi89YmvdFsCjPklUP1knLnuvV6UeSPik+yCzIBx0XNrYyYGN
         eWGRPcoj17TuHPVyqPOHuAmgwcn1NN7FQgfRfUSx75j+8gGdf4xDttEGs6b0QEVuTiX4
         rSohyFhauIrG+ov9enSj+BzlkSlzoLB/oqirb5q0Fj+WTsZlu0Lnco2aXKeVjCGNbzY8
         KZWw==
X-Forwarded-Encrypted: i=1; AKwUvBzH5bwPgS6Y+JG0m/Hy7yteJmg10iQhFfstaSpmvFzWf4uANqSSjB5mqitj9YKbhPoOZURy5Qx926r3@vger.kernel.org
X-Gm-Message-State: AFq9FYI35YRSs/dQ7KVpMa86m5dPHPepzvCMAISC3WKYbR4ezrzTwkc2
	UjGmIU1bOPiKhA/Xv0CIZMrBvXLbErfCzXzPBa8k+Wdc4/UcU2uWbFFs
X-Gm-Gg: AYBFou0e14vsneryI+qsItRb6HhJylkt/e2ATbjtn8TAPLAWI7ekGGdNElmkpLvGBf7
	HTqh2YHqjvDSYNyCLE2Pvh1eIuePJErkj5UUE3+FWQz4apWU3VkmHrybH4U/+TJ3+LyzCfN9glR
	V3YmRwcNlAG2jBWS1Q5juQziHuozYIJHEeBkkrGStcHnUytIo1SAx4iQN+V94tPNMFgC52CLSFs
	oi8/uN7fBQ08FANfFbZo9d3wKEX+o9GKV9Q2U6alm5ACqyONdKB5OBiKnnSgYPE5Mt0Iwi1Iddf
	4SgootcKJVJ2dQUrL1oj1b++BVFfwjz+5geCTfJi7HxFQ7V5nUXNuDtl4KH8TF8CilCcrReJpCU
	UhlJud4uQFFfAA7dHGoQQwNFl6SDuqPeoXBMY+zuaFSs4qwnjrJkq7EoJWU2FS6cnz35nJWc9ha
	9F2D0K5vy1QFr51YVDDOhtxY1CyoEzrTLd4bflolxuiGRXaBKpxJitrTI0+w7iztabbZrBQHABT
	B5NvuP7PxD3ss/if+5tC8LBu0I1yvF8H1HpZtz+PpgUhY6siI8Z/284VOgKDaIFsSYkG41DlhYY
	4MSkuLH1APkIwhPvJedRIk8+vK8=
X-Received: by 2002:a17:907:9801:b0:c2d:be57:f73a with SMTP id a640c23a62f3a-c31a9fcedffmr1919031566b.13.1792061391328;
        Thu, 15 Oct 2026 03:49:51 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3af45sm107890066b.33.2026.10.15.03.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:49:50 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add ZillTek Technology
Date: Thu, 15 Oct 2026 13:49:41 +0300
Message-ID: <20261015104945.2687162-2-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
References: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZillTek Technology Corp. (Hsinchu, Taiwan) makes MEMS microphones and
barometric pressure sensors such as the ZTS8032.

Link: https://www.zilltek.com/
Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..255dc56edc36 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1977,6 +1977,8 @@ patternProperties:
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":
     description: Zodiac Inflight Innovations
+  "^zilltek,.*":
+    description: ZillTek Technology Corp.
   "^zinitix,.*":
     description: Zinitix Co., Ltd
   "^zkmagic,.*":
-- 
2.55.0

