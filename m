Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B6C2D7DCE
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 05:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777699188; cv=none; b=EGu4UymLV8GiWxtzSEV+oToJ3ru5c5b6BwFvoK3M94yBLU8t3l2q1V/nbv/pcalsz5gQeFPKaJFwBpHYogIusrmE78lXMS2164LGBMplQBHWZKrx3zLZKBuCTljqvv2Uby3b0PlVyDKijBYnyCv86tpEmtkWMo8MXU93T7upfxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777699188; c=relaxed/simple;
	bh=yfZLqzjYntGSVbi4DA8iLQYeqr6WqJadGNo5LG3i+Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXUnsK3iPOzHB3tniXMiO+aYKaawN4CwqtQbbJo87Oy8XerW28heG2tylrr4O4QhzGPeCiL6S5bnwlvZwHK3saAuD+SNKvI2RoF255XCQ39EM5+IP7WhPheWl+UvffW3KFIcz/AoO6N45i0NAXBq2aiH1gYcGRVI6uNiOFe4ub8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rO4+hzcW; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rO4+hzcW"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f4a53ae20so1773129b3a.3
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 22:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699186; x=1778303986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdApWjaHRT3KmgOlTPslnfl4o6cjdKhl3SDC6pKKciY=;
        b=rO4+hzcWZ5yjaNX3hDaEViHco95ECxHV+Ff15DM0L5mUvhbTVVCujYW+UV/jl/VECE
         RDwlTSGHGxh2GW2m1WsJvUCsTfb9R14Yc9xNWGjtvZWAyWpB6zAxRZwNHTn+YCoNGoVM
         8tXnXQGhXERjURFOKIir1Ol44jNPpDopS0RRcT6KlNQ4gH2AiFc8nJn8EZ8h1dii12Vj
         LT7QznRHhZ8Ao7xWiQk6DzSkM33MbBjwBa2CrV4hH/EBv7do8MvjOzt0C7EpqPfj2a5u
         HyWOyKZuCiSUuH2RRl5un+E65N1tq2eQ52GdX732cfRgg+H7Et1GcWuTRg6gQ9fkPRCE
         kW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699186; x=1778303986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bdApWjaHRT3KmgOlTPslnfl4o6cjdKhl3SDC6pKKciY=;
        b=F3Wnpk15nID5jB9R8Ft0BN8dhxGNJ2kxui9ESQ0kqFaOlgP3eqNMe92C4Yl6TOk+jC
         NB2glcE+/A05sP7XBf9odUb4G6gAE4CqkxTa4oStEsZ09rhStKZFFdT6XEwMnnR78WJp
         vDE1+Q+9JVahBcaG2UUQ8rgMbma8b83vQdp9Xp0G4THdELbivQErgkeyiRWF94FGo7Vl
         fCpmH9TdSbQhXSZfmx1roUPVu8AGVtbvp8xFFHmqIpz8OFIWv6jvaHANhLdFQqEyZ8Rh
         PLZd6Qu779zVVEpCD8ahUaDN/lk0Xku7KrX9DiQ/xlhaeyqES8jCdz5c3Tz4/1LM7m6b
         Y39A==
X-Forwarded-Encrypted: i=1; AFNElJ8OzoBWMHaRHC8wTBkDSK/0LJJyMqZLxIAHKAluIsnR9g/IBsUpGnFbl5IoweQ2NKaWvgLTr0yzgpZu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb4kvMWXH0Mw+x+dh0XuYMr+AEmVZeO1PN4G0MtIhDwCkkY1rO
	UFadrW7Kr9Q5YlBO3ecpq2y3rKRkiiGTRHA+aARt60kU9JcmfCQmFRI8
X-Gm-Gg: AeBDiesHNjgo72FZNKkxrko3lZ2Nr9053mVmdRC+toAs1CtxV/mbM5xMlO15oRKB05t
	R/iBJ1icdyl9n8Lpp5mhP6OpdiuTLz83RRaboXkMQNvxg6RPXsqursTliora74Nx85EzceEYYIQ
	yAf76wQg1cljiXg8DKmrKGVFAeJuBChc45+skmjdUuqyz4dYZIQXJHCtDzn+6gw9HB+V4hG8yTG
	v3UEgY2BZMz/+8BSaHavfX4I8a6ejMS/lSl9zsR41iUpPMyVF1hD/ye6yxVSlDs2Npix37/so1X
	jkgdhJkUhJnZx/K4coehP8nFgKnCYP6rPvpcsDcv1rZN7J4dnXZ4ce6fXc/I4vV1hsdpd6aoP1U
	tt3cYwW8ZluSPsuZ0AYCi+Yt8ZxtpK5/OSNGltPPaFEL0EtQafMBt0l63ELzEi4HYA/m3xuy4Kr
	ICOejOu49Ig7qfVaFKU4GfFR/HvywVQ6yJY14n1dcy
X-Received: by 2002:a05:6a00:2d8c:b0:82c:7335:4f71 with SMTP id d2e1a72fcca58-8352d22cc38mr1915843b3a.36.1777699186327;
        Fri, 01 May 2026 22:19:46 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:45 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 4/4] riscv: dts: spacemit: k1-bananapi-f3: Add vin-supply for PCIe 3.3V regulator
Date: Sat,  2 May 2026 10:48:57 +0530
Message-ID: <20260502051906.8160-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260502051906.8160-1-linux.amoon@gmail.com>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe 3.3V fixed regulator node (pcie_vcc_3v3) lacked a parent
supply reference. Wire it to the 5V system rail (reg_vcc5v0_sys)
via the vin-supply property to reflect the actual board power tree.
This ensures correct regulator hierarchy in DTS and allows drivers
to resolve supply dependencies cleanly during probe.

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: new patch in this series.
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 3dbdf53b6d8e..6c06480ba100 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -39,6 +39,7 @@ pcie_vcc_3v3: regulator-pcie-vcc3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		vin-supply = <&reg_vcc5v0_sys>;
 	};
 
 	reg_dc_in: regulator-dc-in-12v {
-- 
2.50.1

