Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C3D1B652E
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324261; cv=none; b=cZqPOokcRUZzIKQozYt0X2tgtwUmrwFQytkqXlerij4aPowJTx+7AtNQCnvY/2LykoekwUkATGa1skXfcx/Gn8KG0EfS3yLuSgWDaBc1mhc2Ui4MF3V0EoelpHQLoF7U9cAcuai0i+nBglOOy59QyjuUUImv48SqH33OxRUBdD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324261; c=relaxed/simple;
	bh=PPWvaKyXHBKw3dRbdQICjaYQ5ch3ydY/WU7J8dzT2PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1u1i2nLVo1sWInvx0o6KPsj7heyErn0f9LRn1NFYfntTKgoV3/dOtHmkkQmuqrTRw5Camp0mZqRx1eXQcBQ/CdukpJkR0ETLJLqh9ND60SNLfOCLXYjN5QllAm9J0iZZL/J6VE+BqpZO2WOSLiRNJV7jf925QLzsqImWXnFYDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G29AFgbe; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G29AFgbe"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8422c327755so815050b3a.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780324260; x=1780929060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=G29AFgbeTa1DGrqQPe7tiyZaswU3FZsyJt8CHj1k/GdcvZraJ1+rm/t8gBHM8RH1uU
         qH5AssBh9zdcHLtswRqwBs+r9rSkb2YUoH+m5gRblW0OK7aQ7Jp2j4QHsfZzgp6vCdK6
         /nwjAZgKbljSEKTWCGQUYCVXGHH+3mCOClPt2zEX6EZ5SSazmhQxF1HztQoNHDDYPQf4
         v6z2ewxVB2HLXund+q88wsfKjkW1Gie+R4BNhY+wOX8VqJ3kfcnozVRYgyWPBzsGnEXf
         GcZPhzgDu7DaSihNjUWGU3ybOhJgmd6Httsg2Pwcl8VhTXPKvRQaqNgq6BPfA1SaXgFN
         WIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324260; x=1780929060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=ICu51dZ+fXhy4fb9PuuJpKLTjaSwkirsr2yHwC+7cPnx49QyLDUQaDxJd8vDCezied
         QVC4DNygfP7M+E7JxIQ3t4sNzizzptD+Vf8q3IgaTP4TnCofApVNVr/QoEHUKawRXZzv
         ug0lO8kwBiDtF63oQV7CN03cu1oZ5LtAuKMZGgb/9PvzAYp8RnmUcnBjsxAXdVOYW0Dc
         /WSJv1l/tPsqZ0HMPABTrqN+Xr1qGxxdI56HYG9UnhzeFznfJZ61bbejNWUZCpvD8l8z
         2xmcZgXLbEC1WYxvKvNl330t5llum8WpOKD9s2ScIQ/4ugM7YvztNdXgcVp6AfhMBp+B
         QnlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iu6KxaL3m1XGmbz+WPW5s0d0+rEn0SDpJjhdtMyPNnXSrsHKFbwC+E4U7+JlmNZdjnM2/Qt16u/d6@vger.kernel.org
X-Gm-Message-State: AOJu0YyScOLrBrru3nsOfTzcp4VKfWLJKIRV8DGwvAF0iAJCfpVdTR0C
	hja73Lg7MWOs2romMBrp8xBsT9KPzTw7DiBiLtzJ31n0rdr+BFJUSmU1
X-Gm-Gg: Acq92OEZsjI9l/djLIGaEBatCGvQEAW8XbwBb2oxsNNJkABD/xw4/NWCdjRLuC9nrhv
	MMzup1yLmrBWS8JerW3phK4Iejl9KPsRY1jTAeYii1hHLLr3VBitsjjKgJyJ4MR9JcOg2ImMQDO
	f9r4Z09UfBMFtzIetLXUxfoolpB2ppBf0G/dhb+TD6yqZxcVj+icWVFPpAmQLTsAt6UQ6yXznQk
	79Uk8XZzi06YQQmQ2SQ8tFMvTmf2ppDxF2xTUKg7gP8rB2geE09sQxtaMcqYbMoL6vyaKRc3iFe
	lY+A3id6VxMZivuWoTy/+VnzucKOfLlTYycVopasz8h++avv+Y/gmTW4UGs4fJfMK3pc+guHDv/
	Hm1+HV5gcVRYkSOnn9ZydgHEOxzs6hqgnaqC/Cv2QJtufZuWpDWeZ66DlbFoShVTF8hTIuRBjI4
	ly/jkRA/Hz9rmrnNeE7sam55DOPJ1QO707VMORzDPC
X-Received: by 2002:a05:6a00:3014:b0:82c:d6d3:3190 with SMTP id d2e1a72fcca58-84225595638mr10412294b3a.38.1780324260099;
        Mon, 01 Jun 2026 07:31:00 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842498819e3sm4910786b3a.34.2026.06.01.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:30:59 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon,  1 Jun 2026 20:00:21 +0530
Message-ID: <20260601143022.153941-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601143022.153941-1-hrushirajg23@gmail.com>
References: <20260601143022.153941-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b023d4cc9842 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Axon
+        items:
+          - const: vicharak,axon
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3

