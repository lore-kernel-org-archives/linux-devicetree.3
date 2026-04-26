Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E884B1FC7FB
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 01:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777166968; cv=none; b=F+B5VCZeWuaSiTAIPZ65G0mcPHQD4J/ofDmf6e+RoFOOkuL1vV8pk1MaB3F8sX4G8jGNEMv5y0Zny84ufkcnqahC2+x40LbW6J1QD1wgFjF5FomKz1vqFpt+CR4C1/TY4sLbyYa835Huhpu1hazcr5DWqrMnHxsa+uA1Nhrgtro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777166968; c=relaxed/simple;
	bh=XCk0LOLR9EjU/m3LRK/NWe6BYRHRmRJ7ESoLykZ1VdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xi3EU/FP1QASV2wBIgZripP+IZKOTbX+AOqSDKlBLVse1+ctC3a/S9zFaTZXZiqHkkdeIMJ70w5jIpSN9/M5dTrNeH8UtKAXiDQrQO33WqLGnRYr22AK3vSkTNQQn/kP2gQOuZn/WWSLeZ5OKxARf2UJ0UHM/LpN1dQxvRYdo/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGY0kHX/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGY0kHX/"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f8bf96b46so4378012b3a.2
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777166966; x=1777771766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJGLD2afkf4vXSL7zjJVSaxtWx0uvNk68f2WZ5vGOk4=;
        b=hGY0kHX/rgJpm4qlI+WCRdn8x/LzxIVSuUpQ07pwlQTU1x5wAxokNmt/aNSe3KdUr3
         m+CznV6+T88ecPnBi7FGmPX4JrcByEi404DG7P9o97nDEUxa2T4A3I4aL4VHssDsDUp8
         pm5dFE5FiTwBsQw35SulXyp6oUAE3qTSxIzEIlcYrl1yAkxdIw2EyJ5b9g7E5R+gnoCh
         CPOGd+5FGNMVylOsCcT2n4g8Rh+yikULvjCvtuBgCbx/RwcPnVkAff85/1M/zDjUj/LD
         eKku6NMAI1brV6QphJiQVKh80ZgAPZ9JmM3h3qgli8dWtjQaED3PlyLcuHtRpbwpAlyF
         6qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777166966; x=1777771766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJGLD2afkf4vXSL7zjJVSaxtWx0uvNk68f2WZ5vGOk4=;
        b=SDEuvLsKuWi3NAo4ctNeBzmLbELWB0NK5v/N6YaVLGZtds014dVx4J5xgFszjoj5z1
         +tA05I70Tno6GkNBxFFqk3zZLSXwYdvIYz3HoHFcdTGM135gZt9xEb5okU2DHciFw8w0
         jldyL+7RRHlDML3Ur5kuVY0pX+cNa07UF8LVZFSxZuJKBpCZsuCj1/CIBJQ7R0I1ot87
         0I+wn44x7nZUS8k7NjYZcl/PwMBziSCeABG+scNpP2WGxcA2fZqlmJu+lt1nbkF1pNZe
         H8r647EyodVs8FSOg6MxaXvB4nPp04Feo0C5xHyz0zit8Mp8GWRvcvRum6duhyWXpMvC
         ChCA==
X-Gm-Message-State: AOJu0Yw2AtiTPgQ8goFzYyu5A9tRCtElOMXiLj2Fy6E/cbfS2QEPvsKj
	K/7/HaCBEvw4s0iFpa1v7qy0CIG2Ant2cayLrnC09KTivHr///fqox4Z
X-Gm-Gg: AeBDieu9D3m95q2AAe0mIU5FBmr8qu8Ckz+DBtyIZKo+fUmM47thlKEdTEc0Y/2aoYe
	vSPCq2Y2SpcmdlO33eGsVeYcagSu74fdnJyM9m6+meX5x6PiO2/rnVitv3+7W9wQlyMvgHPs+qS
	uCxef9PY7Svd4En5BGnOJlcWFByg37rbCy4aXaRjPicTckInQRmlWPBNIIsCxMsuv9mqarxCs4w
	zGJcucuf2dywRi+mmEkP+y/xE5LfAWDToHwChBzxSGoyn01k6TLJEYeHnmeLMPXSEEEXcyr/Fid
	l+l8KOOWHySiOW8IFzzwesiUkkJBlYVyH1ilseSExkCWJsaH4sKYxy0p1VC/Oi8X4hh5tUM0U2G
	mUgkVcX7JQv1MoHH0/Tj/lUPsABkdY330ukTelHSxn0/hmQ3nV3yce74hmomoVjekxbvytV71NT
	pLg2Hhi1vioK5DO0vasP/IsDiX1xxPaOHenQ==
X-Received: by 2002:a05:6a00:e08:b0:82f:28da:ec7 with SMTP id d2e1a72fcca58-82f8c8befddmr36874800b3a.27.1777166966192;
        Sat, 25 Apr 2026 18:29:26 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm31048541b3a.47.2026.04.25.18.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 18:29:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v5] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Sun, 26 Apr 2026 09:29:20 +0800
Message-ID: <20260426012921.673953-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
which supports setting DMA channel number in DMA phandle args.

This dts introduces an ABI break that changes the compatiable without
adding a fallback. However, this change make no change as the previous
compatiable provides broken DMA chain for other devices, which make
the DMA function unavailable. And apply this patch without adding the
driver does not change the fact of broken DMA function.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>
---

Change from v4:
- https://lore.kernel.org/all/20260225104042.1138901-1-inochiama@gmail.com/
1. drop patch 1 and patch 2 as they are merged
2. Add ABI break statement and clarification for this patch.

Change from v3:
- https://lore.kernel.org/all/20260120013706.436742-1-inochiama@gmail.com/
1. rebase to v7.0-rc1
2. patch 1: Apply Conor's tag
3. patch 2: Apply Frank's tag

Change from v2:
- https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
1. patch 2: rename "AXI_DMA_FLAG_HANDSHAKE_AS_CHAN" to "ARG0_AS_CHAN"

Change from v1:
- https://lore.kernel.org/all/20251212020504.915616-1-inochiama@gmail.com/
1. rebase to v6.19-rc1
2. patch 1: remove a comment placed in wrong place.
3. patch 2: fix typo in comments.
4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.

---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..8446b4dfe1a1 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
 		};

 		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "sophgo,cv1800b-axi-dma";
 			reg = <0x04330000 0x1000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
--
2.54.0

