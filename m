Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF14349CDF
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783531747; cv=none; b=mc++d6bBrBTV4VnWAOqIWUgDt5IK0/wgUHUpPlF0iAq4slMApSNrcRXeCwVdBecN17Q6ld+swfMcjOWSmlDbcPNzW+w7uTZmFMRtEOkPQs2sW2fO6dGYMlfiBPHC+tb6ZcNBIQW3+AHZXSEW2ZCsX/5V9hmN4lg7Otc/YDXH/yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783531747; c=relaxed/simple;
	bh=8dh/7MHJJgG3a7K8/uIPvyij77LIaEGZs8vfLdY1BLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBWOz5Z8FqQuCDoA8KCC2HIV3fFYVJy50AZRx9YgYhdYhhSVs4rY4/2a0GWS+QPEBwPjI8v10Gw8EusWvmgSDnLwfIxedMjnoo0y1FGbLI5v5/PkkXYKEw3LedTjujwYGEl9OEcL/0Fc5Pnp3wwEh5Chbm4HlhX2vtpHO/04Agw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtviE5h5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtviE5h5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so824725f8f.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 10:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783531744; x=1784136544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izWahf3T4MrAAlg85meIlcHuAYy8AohYcumEZV7w9VA=;
        b=CtviE5h5MCCzIMiPU+HrlNggbKCmUq8WjyfU6X+NGlGzaOlRdQ5nFHmGae324uqhGr
         R3oBbXWqw2+O9nrhbbjDKPRHZcEBFd80g8FxVE+m21SL8rTS351oS4ZCtKCCL3wD2DDS
         TMDakor8J27iTdIJefUBY9h7KykAvYWrUipVFrtQXqSv8XWMP9pa0sTIAHg3WONz6aTj
         taUz/hqN45ZDwKA18pln6Lqz8Wx3+nU46gy4Xm0riyKv9MDJz9+f6dqdJdbX5D064WgI
         UvOK7PHXfqzvKUZ41alL6ZE4Dsv8tOb7rVFe6Yu/OZ++Hr8sNw7dxPl+y26xue+QGEku
         vaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783531744; x=1784136544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=izWahf3T4MrAAlg85meIlcHuAYy8AohYcumEZV7w9VA=;
        b=oLnbc7ootf96CuqzsHlvcncLqhopjcJ10y4P+I+cCIxJK8UWO8S8V1FxsJ+AHffdWX
         QOloA9QH5ae6hmt5ipHNnwKx7zki5ro/P768+xzhQNIeJDII+8+QGC4S8TqaMTfS9AFC
         ehNRbK55h85mWr1NQLRpHD+MOsvKv7hRKIJf9cIVkNL4EWdsE78s1mYNTj8VOskKWLtl
         oAQiKsw6cQ/Lfk7mdqS5gu3JeSBQa/HOupZkQnPbuxYqrzPU/kEdbRHxxYF0nruZ4KrX
         Qrh3qS5rt2e9eYtUX19D2xqmsdXOw6B63ZGeE2iOvEZ+bkbGVvVm0IJgb87CjIDbuyYi
         pBGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+e4bKd0sF08qsHAkSAxPYrgOqfEuwuK6PvwPwQEdPaO5ueS7HOTQhS7MpanWF8by82zGebtJcPza2@vger.kernel.org
X-Gm-Message-State: AOJu0YwaPakfp/wc+sW6vyN2DR2ocMVkvdm+++Ui945RjD/by/dPfFyp
	MCRVhQlCsE9I5qKneVZ5vVopuXkzNfs428ERxJUJ05DfOu4o7eaKBii0cEGDeLPvFOg=
X-Gm-Gg: AfdE7clE9emcjtkGS3Q64LsXRjdo3FGjN29A9KGvthZ6t06axxYnI3XEdDFoiTBLhOn
	QI61Pgdvpock4n4ZuKg0xyknlPC5Gcx6bPXLBfsUZohzN53TD371iMpkQkF566eyQ2SzjG3cVm1
	r7Jo3zpU0EVpqMStN7OVhWC1dzqzZCCFnXhELjyRBkUmpMQjJRipkpN4tNuy6L2Lo2rlsbKT3eG
	fld1mt/GLQp3/pSxDn6CzyWdIaF4/96DC6cNmDi/aKk3XGh9vltunpPAc8mUt0nUpXyzKBF5yTW
	PFLDTGk/rZ6vbnCqxqHRSzadOZXgWscLQMLcN2pG1lfk+1J8JGu9sRhvSmpu6qTjHsd17+MSlAP
	3wcpbXKWGhEmol7Yr87dxWod3Yy12COmYJyEmgB/2fjYZpOJzgCaWxpEdpFTgai1nx6MnQ5ECLQ
	WhKjLGzyM35jiT08iZOxG2n8VyAtoVkQSL/kaMa10thGK0CzDnnyDHy9FST0Q+92ZTkEnog966n
	IWKqjHrUQOPAn9FODdA7mnavVM=
X-Received: by 2002:a05:6000:98a:b0:475:3a97:8e2c with SMTP id ffacd0b85a97d-47df074886dmr3844176f8f.16.1783531743668;
        Wed, 08 Jul 2026 10:29:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca98:2759:6fb2:4aa7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm46588469f8f.2.2026.07.08.10.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:29:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Fix PCIe dma-ranges memory space code
Date: Wed,  8 Jul 2026 18:28:48 +0100
Message-ID: <20260708172849.227915-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2N SoC supports up to 8 GiB of memory. Update the PCIe dma-ranges
property to use the 64-bit prefetchable memory space code.

Fixes: 4c443296ff17 ("arm64: dts: renesas: r9a09g056: Add PCIe node")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 3a308dbf733c..76fa34ff3d07 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -1065,7 +1065,7 @@ pcie: pcie@13400000 {
 			reg = <0 0x13400000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>,
 				 <0x43000000 4 0x40000000 4 0x40000000 6 0x00000000>;
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 2 0x00000000>;
+			dma-ranges = <0x43000000 0 0x40000000 0 0x40000000 2 0x00000000>;
 			bus-range = <0x0 0xff>;
 			interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.54.0

