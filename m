Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369773D3CF7
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541837; cv=none; b=Pphsuwl8Sr1uMK6jP+kazOLxIxblDFIvlXtifsDM6ojHhb6uj0hETH/KHPOJpJjoU/7/2QdOMJ0GSBmnm03dRspz/W+G7mdY/KgZ0bpC4DJSwaY5o2p65FYbUYNe92zzpQ4JqzU7saLspJ3h0VGSvqMTB7BnfMS8V2gHTyVMgZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541837; c=relaxed/simple;
	bh=yHDhlavl9vHp0NqPh9jIiLQu4IZ5LAW/yrrGE6EGg+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ivGGiajIYuwwY2EJmw7KEpHLS4vJpWdGSRbUCJnYGBkVf83Zgh3naYGU9EMJ6MX9fTLBnHdmUvGSd+P5/AK6x5p4KAfdNZ/T/n1+CBzFQBHWbhru0LIAy73avsVxJ/M2bB+R5yz30oufEmmqRSuIp/XNexQCtZiMK6dzfqG42Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=NIhCOY5X; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="NIhCOY5X"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b966dd74so41436255e9.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784541834; x=1785146634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Uqg9pdeMYpDqmcMIc9g/0AdIWRM6TR7uMO47bmc1pw=;
        b=NIhCOY5XVFEI8eOdfjCzW/FVChJaLyFg1PZsKGhYRF9HCgSW88k3tVY3Dy68cJRgcv
         rQ1jK3xYzGL2NHM3Lkb1M5dU00dhm4CWXExTzA0XoAm67tylNUspHnoTHkROoD3cuEjq
         yLz5dFAn6y1GDzqCU35Ln7hcJpKKe1yqWyXgk+U/g0vdxsx+nkgm9REZSIFcJB64rlr4
         BASpkeVFzPXdyDKw/SYNOIfakyLYwl/i4aNNl6ky1eOacYS+3fGjZ/rC54roFunuU+rM
         exXza3AXxoo+aOrV3HSYplfEIf3aRlUHhlq6hcD72BLyXx5a8z7P3URzqItTMjTJjgic
         XeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541834; x=1785146634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Uqg9pdeMYpDqmcMIc9g/0AdIWRM6TR7uMO47bmc1pw=;
        b=ceOKsaAKS74A6xTP8maIOvebdiDGpyXrpPqh1a7XcvzblB56miVOZt8fbLbd12P6Pp
         K1KSbzGpjl9razAZ5g0EGLqc0+pLd3NGzW42E5LNUzqU7k+MnFqzzxaxDJ6gAurYO0E+
         KzbWiZhS7yTxMppDCSjfw/UzYXHC/smly4OgZS6Y77SEEjI6frGtQt6SBHR/OdM5Pbak
         2WgDiS7b5z8mwd5fj9EusSphWVNLyMzHqSKehyyrbvua1sGZzCXROg0RSNbz5u8dvAL9
         q834RTZJDX4Qx6US9CbysYjQmAQg2RLtVJCbtDK6xrHmpu5925tVqWgs4UUlYGspA7u7
         UbDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlvSRVFd1L0KwptrBxnMjR4bjr9wwGNdtkZuIEgVEb7CRs4sqAglDCqM6jXdceZFh1qJ8Bo9lTzCdM@vger.kernel.org
X-Gm-Message-State: AOJu0YzA0mk2hHKuyrRzscPmNnzxvBvAE8M2hTdjP12XIvvLlOWUdZEs
	MPomkUVLhbYGCYlXKdDaN8K/1OMbdg3Smtbg5xAoSvCBi1vxufcre60GZI3XisZ63ko=
X-Gm-Gg: AfdE7cn6u1kyNEkc7ucJGuba5ADRYvKzPta4ShOmUWeFP8KjF7TKyeeFzzCQO/9xde7
	KA6xZhEyDv94pfA1KFTZ48mbTnqhhrA9F5lJ4VKnQCOXZ3H/Fd45EIWC1t7f5X7DBxQcHSDIfNR
	DbRmmsIcqZm4s3KfJMnAAkTu4XWQ2Yfd0sc5nBQ4cH07unIPkNQ7enZ4MJ9iutxcmV3XxhUP0Y4
	BX+G0OjnvGKeYQatc8lOtqpTdHmAo2XIJzTb/wZ4hpTZIcg7FktHCP9FvIriJShCGkuRg2tS+Dp
	FIkEC+LHDmiqm9Zs3p0zwpLk+sD1ZUJ+0Po6jTjD3gU0wgIG5vneX275Oo0yF2zQXOQdGrGYLhI
	Urk3rC1eU9zFbfcIa1jLpSlZSVUcl1pca3+xJ/NzHwOfcspEXyVIG4fLFmeOD9GHDAw++ppNp1m
	JD6hMBBUV4e4466h9qiGkyZP8a8lBrqfS3zchizsfGQiU9vjGiMXEG7aDPuk+7nQ==
X-Received: by 2002:a05:600c:4746:b0:495:4d07:4fcb with SMTP id 5b1f17b1804b1-4954d0784c6mr129461865e9.36.1784541834289;
        Mon, 20 Jul 2026 03:03:54 -0700 (PDT)
Received: from vkrawiec.arturia.team (226.142.197.77.rev.sfr.net. [77.197.142.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495516c68fasm191854485e9.1.2026.07.20.03.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:03:53 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH v2 2/4] arm64: dts: rk3399-rock-4c-plus: Use device tree bindings constants for SYR828 regulator initial mode
Date: Mon, 20 Jul 2026 12:03:34 +0200
Message-ID: <20260720100336.62004-3-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720100336.62004-1-victor.krawiec@arturia.com>
References: <20260720100336.62004-1-victor.krawiec@arturia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefer using a device tree bindings constant over a hardcoded value

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
index d9ff777b4913..0387172cb470 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/fcs,fan53555-regulator.h>
 #include "rk3399-t.dtsi"
 
 / {
@@ -448,7 +449,7 @@ vdd_gpu: regulator@41 {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&vcc5v0_sys>;
-		regulator-initial-mode = <1>; /* 1:force PWM 2:auto */
+		regulator-initial-mode = <FAN53555_REGULATOR_MODE_FORCE_PWM>;
 		regulator-state-mem {
 			regulator-off-in-suspend;
 		};
-- 
2.43.0

