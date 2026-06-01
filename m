Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB712F290A
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 16:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330930; cv=none; b=rqFze5GcN8MqPZ946FGL+eHuIW2S3jcpu9ygaPq/FAKA/TNJO3E5iDaAcQONAf+f/4egkVU/A6FheKb2+e2BONrEm9xYc+S+KkentrSitpJI2PWWiEDIWKKa6fQ5ronmI8V5Tp0IxuFG34lemlHvNcD4E6BQBAzWv0+dGF61Z/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330930; c=relaxed/simple;
	bh=PPWvaKyXHBKw3dRbdQICjaYQ5ch3ydY/WU7J8dzT2PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7rd+E2GezeiRcXWmNMQ4PP6jVnkdMiUrtJFrYNtL3kUREbcfmyoe+USJaTtvzsSX3XxjWE5/xXIhz/acykuvyT4nYIasf0glTdeXFx1XNmJDmhXDc2xPBOj5lOit9NJxgztJx22MRHTE07yjxx+jJ55z6073c9SIsMDp4Sd4wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F89rBvZW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F89rBvZW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so10838625ad.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780330928; x=1780935728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=F89rBvZWXwHTVMPWuUbWj422CeVsX7rK+i8wR++Y7lod9FDRVxyWPubwPUro/sy7JX
         VKksdxww6r7nwOCQ4MHKjts45SYYO85Ggn0hM9e+RBjZLbcmhzlLdCFtrkGXA4fOjInD
         HAjiLBJRbpFfBe80s3L1r782GyAPBKG4HlrnpwmSwzCPGKu7dUOytmVHbpmAQAre/avx
         XKimuhZ2Q7jPjECczVm9nrYYxUOE5uAh33u58/SQ/Kd0qQwa896BH2pcU86Kxd5RSPSW
         GQAYBXjzXQaST/zHnpFh0vXUlWUWNW9+VGb1eDoGTEQn0wfyLPBHlIzNeKFjmvgShDPd
         +f/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330928; x=1780935728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=AOF5Ke6kd0SAPFrNrNHaJPLHzZiLx2v8EiKhq/gJIzBp9YKFmhKIS23ytNt0mp2f4l
         Ma683J5gyZXRq3aFQBQMC9vEHJ97aZDmTALgdkSJ3lVpU0Sle7nkh3HQfGMQowAQCsS9
         ueUZgTbrCR1A8aXkdXr37z5hGpnpJXVa6TidMIGzdlCPLv25WOWyoClykeKwuoZm4uQI
         YYxA84vm3czRRk7M8+EzpLoTBOauee8VH2vIKhLJE6fnTer14B0gbiqXBlHNzhSqsesm
         GPedkZeCk7/gzmDlcT3mhXq0RLpLpXQ66nT8jQWk6UxH4vquFEFQPdbVoUDenEBXBbGe
         k3zQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hLF/Qzc59P8EobmsyqpaUlIWCfBEZ+NRadZoSKgiTAwfxxhwoqJoOkMKy9x/qDchXh7ZB0Yh7sH9y@vger.kernel.org
X-Gm-Message-State: AOJu0YwcQuOprkPNtcruGk3Stfrz3aRPkwFBzWGNcwXdgJd2uZoBWV1B
	aPPn+4eNkMjxmRihG5etktQREADzYZVpCbuTcpkZFlHtnCTKKtiwf3YG
X-Gm-Gg: Acq92OF+vvDqU2fs925PHEuu44LmJmQqlx5ivgZ9qUqHsUYDHC6G1vDdpa38E0ot/fe
	jyZFc1CjW10DhVN+6JITY7qU0wwFiFPvwynzSx20UaMdbARdZ+A3GUL3nUD5g4lfST62CSNLnZs
	NNEdqEBYdJ1pgsoczLmyn3xvWLV3LguHslnAuOZGpd2ML84X+6rCCUR6Tkw1qK0AYoNUE8pCyfd
	mUsfqv0oDUkoUpArekw+j126CwBRIhUdRtUJ240t3lkMEheTZ35gES+qxB0P2nkIUXQ2n6WP/Iq
	kcytZjSOqwyqNme/vo7g4mf1lAJ9IHQ8YLlTGnEB2syPvFgziMQGYbslaEzmgqQc5zpCLHWNpXP
	0frtsPUJavHgXbYlYkzGFkWdBr8vlyoEqi4j+u5tKkzjFewAIQP1GwMLPD/1xZ4Sd1kJ2mJ3HOc
	nFVHqPRIWYtXaifEsFZW2pKJXyRYC0Mmr1TqOvmnPP
X-Received: by 2002:a17:903:2344:b0:2c0:aef8:23dd with SMTP id d9443c01a7336-2c0aef82687mr112227805ad.22.1780330928509;
        Mon, 01 Jun 2026 09:22:08 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e5d83sm116647455ad.8.2026.06.01.09.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:22:07 -0700 (PDT)
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
Subject: [PATCH v6 2/3] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon,  1 Jun 2026 21:51:41 +0530
Message-ID: <20260601162143.170030-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601162143.170030-1-hrushirajg23@gmail.com>
References: <20260601162143.170030-1-hrushirajg23@gmail.com>
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

