Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD938B7B4
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215668; cv=none; b=c+uOSTM7k7k2EHgRccKBasXdhjLTlpO4p9YHGW0ZXfMCQBRwOdep7xOxwz2T0T4Nrm7WF+nnKRQagX3SWMGBx9JFAp1iAM4v9MeG8bmZto1MXrfly67IahkbEv3gz0i0NtEyGR2N7JxAQVDhA723wAF3HnPB3UaRngemAxhHypQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215668; c=relaxed/simple;
	bh=5ZKt2RSjapJGUOO3d4vZSG9DTmpONEpsSL+hn9zyaLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAZrwXZXkyZuppmVuMVh63Sn5fPVxNPx2OjJDakMbGlotyZfRcSXS1CuWGmWfVZzt7ymYCQRQDSNkMOWRSTx0YcpS79ZUvxZdTSDnKAU6GfciT+d9nQCCCaeoTzychgjLJ4ZTSguD/HB6JQs4Vn3F6ZXJl7HwoZ7P1P2+aZ9ZEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXkTBHXL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXkTBHXL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82418b0178cso893459b3a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775215655; x=1775820455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFdHi2+kpz8pfg7CkbtM24aApOcYkAvDhf1e0BZOdSc=;
        b=eXkTBHXLLc8zTNNMGLFaQRgGYVlYn1G4L3RrDlMLEyhD8eVHUYAPVTTkdUf2x+jQnA
         oZXBR1Y2RHcDqMm9trK+RlV3dijPUH1wlbS0EfGDTpMLtP2pz3Dx2feZjIHN9YktPvBR
         fXW9NgHtavrE8+06skcyKDCHzXrW5s0EI8AZlTs52EgfpuoJAzETkSB3YzP9l7pvWSwS
         2IhUkfQg2L+XUxinEScR+VHgG0j3CSTAWBKUYRbrfv9vT8cvYJia029jsLs98AAVIlJh
         zkoklv0vo43D11UQENsRL2L/fia7SA0YdBD1uRu897TzvivhHKnELLDzcYSbQY8nsMp3
         S6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775215655; x=1775820455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFdHi2+kpz8pfg7CkbtM24aApOcYkAvDhf1e0BZOdSc=;
        b=qM5c+NsztE/RXygZNRXFXEmRnbFpMEkW5ZKj15rZbr0KT5d0EXGHoYy/zWFLeW1OCS
         9F60n4Z0iSXDMOFPajotdGIlryOn5HVQ8ej2rB+Xq9DLVJzb0waf5NVHVB+AO3QyQOMc
         EzeT1GLDjU5ShG7wCkf3xJzhg0ILfYNYP+NzYavKFajoSlmSRqWEirG6Q0/cZA5pFHG3
         dWyMzepF28ncC3aAnvDj8y18U+gZcH+oQ7R/9aEVNmG2cGtRhiGMWB3XV3Xa362nE2J+
         1lqsXIuhsCgCenUhBdhnIjAfOksttiA8o0SAniLo9+ELUJ4Zemm0evCZeUfR6sxmVpzr
         +O+A==
X-Forwarded-Encrypted: i=1; AJvYcCXKxcyyN2ZMbw65BSOaAyGYJCEKLkYMflt60aYJ7+ylqmJSCC6wRL5B/bdK2xKiWsHF/cxxBVTz73Vk@vger.kernel.org
X-Gm-Message-State: AOJu0YwMu4c7gl60SnYJ5O33Sr4kyH/DeofPQ/QUdtA6sB04steyE8f9
	QNB/bUOqi52HbEl6Kc02CIGpk/e9k5cQKrYz6aQAV7nJcf3OUfQheOcM
X-Gm-Gg: AeBDieuFDnPzj3rvZVQApFKHgfvnwwNf4Udqn4oAabZEORK3h69ZW+b61/QFz1MEzDz
	4NOjLbK9Nyu42/HAiwIwlA+FbgsWYFSi4bpa94CaG0sIhnUYRhD09SNovH5DjmGgMupxsG3mRZs
	LET57XkJgJoaHAZ0lWdBVIbyCP969K+wQKBxt/efQ26k5a9UbEJSocwZXreyQ9kB+BU284G+UwX
	oOsXGXmih3cEkdu0nkEeetZqVbXU6AXexfSRgOJy2yhKSZ2Tm/rYf6xIIOxTvL3POzIshRtNqCq
	2oEGPrbyCBmo+JoIgazLsR4/Hot1auWfDSh8yQqV7dQTvptdBcplrpR08c2jK6xpIZjR4MPCcyV
	5E8f9yewSqeEwP4QCBDN5+7OxfH4wfOnqclefu1Edd4803fZUJQ4+NJhw5RdKmNMkH5HO/Ewfx7
	lzsGRCixqWMafvMma1HML831NN4DazS7j+ft36tPyPYLeiIp6WvLFAY797Ew==
X-Received: by 2002:a05:6a00:2e1e:b0:82a:5ef0:20fb with SMTP id d2e1a72fcca58-82d0db53702mr2721652b3a.26.1775215655355;
        Fri, 03 Apr 2026 04:27:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5202251b3a.23.2026.04.03.04.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:27:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] arm: dts: renesas: r8a7740-armadillo800eva: Add spu clock to FSI
Date: Fri,  3 Apr 2026 18:26:54 +0700
Message-ID: <20260403112655.167593-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403112655.167593-1-phucduc.bui@gmail.com>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU clock to be enabled
before accessing its registers.
Without this clock, register access may lead to a system
hang.
Describe the "spu" clock in the FSI node.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..9cae87a1979c 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -393,7 +393,8 @@ sh_fsi2: sound@fe1f0000 {
 		compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
 		reg = <0xfe1f0000 0x400>;
 		interrupts = <GIC_SPI 9 0x4>;
-		clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+		clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>;
+		clock-names = "fsi", "spu";
 		power-domains = <&pd_a4mp>;
 		status = "disabled";
 	};
-- 
2.43.0

