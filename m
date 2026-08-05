Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149BF46C836
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932450; cv=none; b=BdJuSSNqZMAzNqRejQ2knzq4z06Wg80atG8Rl+xPg33SDMAL1A0HNGpoFMrxQFsthxCC2zT7HTlZ9cETo1Q1SEcNIgLSYIdbLSS49hMx+JYz40wEK9X3a5JESVC+Qc5xV5i24Y22BB9C0JFyzEH2NgM1A5zY1I/kpzm71YIOzwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932450; c=relaxed/simple;
	bh=dkorfggf36ztPK+fgZCnE3kh62ef0QtYuBdCi01480Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P9VXCAQEcNE3z27ZuLg/lJL64NuLgFn0DwtvK4jgfG0E6Eg08sAgHOnAlIVyYhMvL7iP+VikvEPMuGJHpNhSC2zh5eF0Es9OjxMo/H296cnVFh26ZncHZeSh0mlkknx8kRw5ISoP3NfWYkXfl6EIfiXq25NuXJolLOfjJRPKpJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=eie1iFJn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="eie1iFJn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so10461525e9.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932446; x=1786537246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R478x+VsQssRpU/U+H9eTTLOJEK424oXp8O1P95M0Gk=;
        b=eie1iFJndar/FHwKUDqYFalUT919C4o4i/rIggbJ2s4iBCvjyCDmpTJu/8Z/iM6ATR
         wn5nlQtnIaWgkQeT49X5G0m0CH8V2Bzrt/5JMgXcCn/sIw/ib5/MuNf1vFmT4wH0Pwbv
         3S4nZYkLCPTai0i7tqUauIid7v0BkjPU4mtLBo3LCHy4gdvX76ODdtWa7WuZ9ZkaT0fV
         qRmdoD6LZ0crh2CKXTvmOZNmBjn0ikvAwMBmxzgrZR8SdJ0dd9MS6SJo4kvqHlj7pbik
         lVoIOAZ6GEjETlB0v31r9ALX7HGMWwGaE6hK18wMu2G5FdYDPTGO3LlqoNs65ZRpD2jJ
         Df0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932446; x=1786537246;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R478x+VsQssRpU/U+H9eTTLOJEK424oXp8O1P95M0Gk=;
        b=dmFcZCI/VPmPcLi9KZprW675/nRYKX/ZiY+sXnyhaX77OpS89Uby7oMjMMH1lgomzQ
         4d7QMe/D51dIsslwl2vqWpFUagnYWfmgo7I7u7hQ0nEMvNPfLFX1vb9dV9J4wONyLmqi
         3DIa+uNmjrKmf+iSlh7jVUs4de+M9oRXVY+0/tiRy5FWbW7wehs1U5gBlFd7DzcK54Ep
         Fo8fAwH8llZbAkBtHbMFDGgqPS4f+QFeVBnOkCcTSx28lFVlkk2fIZFjuvcJR7h1VKEG
         ZnQhT29Qzn8PSQQs7ejtnm6QZaamde2FwGnGS5BjizhRDHTCt5UvX/6tjbcuggd+bRi3
         BY8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp2SRl6tRHwu0BTxIA2lDujXoz6/n2W6w9UcWlrQvopcpBnZRbY4UjWyyb91nv97fnYp0Yo/Hz7SBYL@vger.kernel.org
X-Gm-Message-State: AOJu0YzUTaljVXL9HXnzJ0zMu6HL88amZbAxuSu4FArHx/5w17r2KbNl
	bTlApSKSqaZMI9lMsVuKhybIeH1MtMe0duTIO/m+ug5oB5VgRopLoxel2cXZomR/fF4=
X-Gm-Gg: AR+sD11a/1jbDG1v/unCLUb2OmAU3KABtrSimKXjfQK6DpaN70ZjHmTkjxHpfceJu0Y
	sPBGKeLzJoKwSAyMAC6RUOiAhjYu8DHc5/MQO/hDkkv/5bComBaWDZjl/cJNfv4EBtQ7DAsvCbG
	irm3waOBdctBcDXRzEUHScjnsFZIseG6XosUrSZL4fFePU6FL4pKb6Irddp3hKjmjv+j7zNrQk/
	jBx0SHlYxvrYX8XKcKDwwFCZOvGGzDeu+NmIavgWrGmi+Iltc5avY1TQwxC1wooofKlA2Q5nKlX
	VdYRVfxX/oF29d2TDVJmDS7Ys9sCllJpAY/nrUX81XPmHwduHNBwq4gqoHeivftRKd2mGuxPj+o
	QGVF72H3Eo7Kt0aReHmnZo0Xn/RRJrTaRHherxVIMMG0ik8zHbNYSa0tjTzLqMc2G7IuNgh19zk
	JHyyAwyrSIUHGNjYbuLhIYimjkn1fLD5VsLhQri5WYzwCJ6/t1UGEWOIZ43627+wqsy7jDNebDP
	nNBQqHQnxMAfGS5WzlfWt6eah6KLxtonentVL4x09A1QTu9rdY9cijNky1eCwA9Yx0zCFpu4uHL
X-Received: by 2002:a7b:cb95:0:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-4994e7c118fmr56108875e9.11.1785932446337;
        Wed, 05 Aug 2026 05:20:46 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:46 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 5/6] ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
Date: Wed,  5 Aug 2026 14:19:52 +0200
Message-ID: <d54bfe689e6a0f318961588ab6b72fc2b09ebb47.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the ast2600 compatible string.
Make it more precise and enable specific ast2600 properties.
Still use the ast2500 compatible string as a fallback.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..7c02633f2bd6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
 			};
 
 			vuart1: serial@1e787000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
@@ -717,7 +717,7 @@ vuart1: serial@1e787000 {
 			};
 
 			vuart3: serial@1e787800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
@@ -727,7 +727,7 @@ vuart3: serial@1e787800 {
 			};
 
 			vuart2: serial@1e788000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
@@ -737,7 +737,7 @@ vuart2: serial@1e788000 {
 			};
 
 			vuart4: serial@1e788800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.54.0

