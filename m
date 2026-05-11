Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD8B313551
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481530; cv=none; b=b/4CqE/sLgIR35HppDvcW9w5bO2Q1ONg+KeOZBRa63hyECgZcCwyE0/XIph+kQ3dhkaGyMYiha1btZMuUyD92Fq+hzeKeY6XyxP2CM+su1wJ5uDT2mB6fzFIs1KiPcIJ5dO7onk3nxMvfPDh9fFpMHoywahWc0v3lcR7hG5sBdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481530; c=relaxed/simple;
	bh=yXB7EIPk6XevVObOY5j0Sj39ejci5f5ONxRs5/PDOYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taldVQ9unLaUboO57ytDCL3ktl9vgM8/stLvQDXXIkBG3tP/zbyE/uFJBf4OJdQt8LvIqWBagJFaDx8H92QywCJWceiIR8fDMcMHpHM7+8NBGhiJ87imbs71XCGJoqdqus897ZrFHypaRatLmJysfc6YxePKoS+rwC3cGsbLtyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXwqWP0J; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXwqWP0J"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-835386ff122so3563638b3a.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 23:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481528; x=1779086328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfmcfX7gTqR/wtswsezRGGU6Mv16ceub/2XE21DxlUE=;
        b=WXwqWP0J+3Eei9CgSnmCdWgFVjg0n9/742RyA5RBp/NIFtLEmFQ6k0J9Gv9tOy5RFc
         mTtegPGK4ovkw1VcHO7S47rDgM+tNil0xXbB6DPwT4XcYvJFfnMHGs0tCdN8Esw0DMG4
         6rRkEsGlNJHNpFuKsaQzRur5QtfOIJkZaJkQHL7wuBLK3lrYxlHGb+RBcIBb3+5PQpo1
         5ju/THPTAldn8ZkotU2Rg2I2rt9ePhgsDcOaKOS2o3me/GBWS+2M5T09Bn0ydxXJGPZa
         9WnQJOtMg59CUECSw8ehPygHRn6G8PooM0BKUCoBAXYANC0QxEqthn0eGCk0q82nmUgR
         jzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481528; x=1779086328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WfmcfX7gTqR/wtswsezRGGU6Mv16ceub/2XE21DxlUE=;
        b=ls0zclflgqTZ4BhDaZjMyCELqx9AzTW4Jt5SCPQZ4rSJXYB+tbJ3BDPqeEQXWMLX1G
         kXS3t53n6+nUMBIAUBqw2qgDX8WMmNYJQZljzav/+JjrGMCVwjUO+dM6kpjR1zPPE+hg
         H79AulMOwP7m88Z5qFIftBDkZp2rYTnk4WRdBQQ9IR4ARpopIUm0Zdntt2vG+nP/FUd2
         6MKCu+ze3xbG50IdZ3jJqKe1F7gFbFT13YmPYIltN53qa4KzVOKSKzRJpf0a3lc5+2j1
         0taT14b+ZHBOnLBSdLKuIsq1KOp/XncwOK4jeAwhb+LcVzioXpyp02yW57Prv7Kb//N+
         u9xw==
X-Forwarded-Encrypted: i=1; AFNElJ+dPtkeYhLBUzNB5XpSTEfE0ROPMM+yEYWjk0clJ/STu0by7qK5hAgdwgp2rgzrigxwgS0WSJWYQbJX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu0SLtf1WhFaowhCJlW+bahg9RBwBZy4dxmVLmyFyQOo9ojXiW
	0eTHcUOEJ9/bQsJyiTO+yS2VCrg60wZ/oaiJnWgh03WKHgWqIOhl8S8v
X-Gm-Gg: Acq92OH/5Z0mQfFfgjEAigI94BMwpmtLAV9H50LRkFaqYYbO+bZy9t9k8ZSrj7EmJhP
	ra6kpMyx7spD9LCHixMcO2icTe/UYN6qwarMEJAtuah6ZnPWNbO6bH876oqcA09djh3kxH7tesS
	Le/Bh5e5qPuYrx7SJ1QswLbDZBDsLyA+YzhRKuxy9ftBgStx+wbK1Jvx9W1AzfQGkS+dtoHzD3L
	fN8mdhLz4LTQ0pVJg0EWcTfPISXrcBshWfSlobH0qRxJvjwjgmcQ5wtSsVehq0O742OcS9S3FnH
	Gldn1FbQy67QOSNUPz38tiKLj3yA85nuM/LgKiBk2b2A/mNScuygc8jIw6pSa4pe8Ql/fn1vOPr
	XztEzYAOGLOO4wRmT425mq5FjEoRVps4wrHDhZLuhPt0ZDF4vIalGnf3kmjHl+sIJa2jbZ9UpSB
	aNxUe7ro2LPZTMaae+dE9nTMY=
X-Received: by 2002:aa7:9a51:0:b0:83d:446c:498f with SMTP id d2e1a72fcca58-83d446c4c89mr8198132b3a.32.1778481527848;
        Sun, 10 May 2026 23:38:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f381sm23328475b3a.6.2026.05.10.23.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:38:47 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v6 2/2] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Mon, 11 May 2026 14:38:17 +0800
Message-ID: <20260511063818.463877-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511063818.463877-1-inochiama@gmail.com>
References: <20260511063818.463877-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
which supports setting DMA channel number in DMA phandle args.

This dts change does not break backward compatibility as a fallback
compatiable string is added.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..ecafdee79ac8 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
 		};
 
 		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "sophgo,cv1800b-axi-dma", "snps,axi-dma-1.01a";
 			reg = <0x04330000 0x1000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
-- 
2.54.0

