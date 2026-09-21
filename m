Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF90496D2C
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003362; cv=none; b=TVS3IM/A3MTPSTcGsBz/L1yAWBkN12SP860d3K/1kCk6AFfu0e1xeEjAA8kJbwOQ6ZhY8yOhfIbTU5u+sHl/r8H8ToFSZScv9LyQ+VxbV0kX5Ua6BxxWvzWCU35H684ffQyj0QjS/+yO3llm2eCPuJ0a9/GNoLeo3QwTaMSTqDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003362; c=relaxed/simple;
	bh=2hLVo973TL+IdDgfOfnl6vgwTnq6FuS1dy3gn60sYLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HcjM4AXbDQhbEfySLLNEbibjgAbnyDvjDqLqMbfTP0jjHz8fS43EdNLd7fZR/U8WyjzUAHTvG7HkXpu9BYGkoXD6f9KNMHNRAlSBQUiO65O0XSl3wW2EFNVcngdz1epR9Or+N3bw90xo8L8NRRtKCOKTxv4ZPp7A8/u91Ec7MF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YH72MC95; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YH72MC95"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so21508665e9.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003358; x=1790608158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tma9B921bFIX7nBVsJuVx65bgAYnceU5Vt0UE9WRrLE=;
        b=YH72MC956xs4c6UPt+L1dZzoYftqbb4MBD6D7u/v31+xQA9evaUUjKsQ25q5h+xv1n
         TRIi/GC1b/7/Ous6NWjF/Pn5wqlxwLv3CnUUwnNfdiegSBiqiadDMEUPeD+Bm1gP57I6
         I/oFARha+Q17I4+pLlmUl+pqyPirg9vQ2V0Vcmm68D3Yw/lZZ37aFeaTaKKBHeFsJfy8
         K7lE09S38Y0fG9r8rReFuboEYaWDSOObj2Ti4A4GhYX5cqoLa4lev2QdqV7L7yNYPvTj
         MNebcEhU/mLRQzaLtCiET9oNi0VxBmpd1YicKTCKq/Xv2iezSXRmJAyqP++BzZBbHBuk
         016A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003358; x=1790608158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tma9B921bFIX7nBVsJuVx65bgAYnceU5Vt0UE9WRrLE=;
        b=pvwxJlIkvegOA1qzAh4e00TqgDTUU+wMkLRt3v7fn2ytkTVnYr20x0bw5ShOWa3f+K
         d2FjBmaI/clTOlQ+ajCInylkgNLNDKFIqBs37SFILr3/T1LAXgKUXsvl7Bx5MYEyrPAI
         YNNHJTMX+3y6uVUrb3OLCQEImDm5wrrUtEe34A0wHdCebMLb9OdRQadsJkRUMWdEWbpP
         X3vV5gLX8b/8uKttc7p0knGjjGdsPECTTyWl+6ixMGykojWf4iE1beXOzClayI+jRdps
         kSyDODi45AJx9GyUFydOMOtKwnEVerdTRYSysXA9kzc1xlLvUhCtYpsijfYYFj02pygV
         Ly1g==
X-Gm-Message-State: AFuF++mcPiNxmFYiOuu+2kSHW6Q1S0q/+2IVo49789vV2tep7PXxviE7
	QwbwvBAnblD7eN/bOpr1542RMCiu2azPBi4wCa/CMwd8lfX9HzdwzI65
X-Gm-Gg: AYBFou052bI1hp+K7vUBEGU6lBkeE88VeXzp1XXlH9CWGRlQe3v+shxhr3wg1UmMMoj
	/vp4LzZyqpmdnlDi/S4UYQUIlErMzRpgTGeR2I8kyonjcQ3KemJ0nPyO+AGxtlXQ6RilijD8+Vc
	uydJuiYy1GbEYsnjf45t04ur6AVE2dUNM+XWeKOahOc2yEnyxHSIOOpi+sgjXyUdVRJpdr416i8
	lY7RglIRms3VrR4nzneQxaP/DkCTJ89OKgudEmLGy5+lVOCkH1dyv+/lAIVnkHC0jqgHCxDkjCI
	mQlRCI5fP3w/k8yv5B/kG4CoW1CTXG99KzrJ20K6G2xFWO13tZRn36Ir/azVAjkQlBorsCfxR70
	NBVHkIY1EfR7gRUsskLHleX38zN03iz/wvKx9Q4SWHSzc86iSbwjgpRgDA7BHO0KR7C8PhSch2n
	LWd5YoJECwsmtCinFWCqNeB6Ysw2xRPhOqdxD58kAI4qSq2Vi2DUu9CWStGZh9UBlcuQ0cmxEp2
	KGJPMl4DSnXxYOqDNO92k1nRZxrANVAgo7o560JziYQH1y9G5Rjjnfpv2g9hx9ZhHWsh0sKkYWY
	ztQQIFJMzWsA3a+Q
X-Received: by 2002:a05:600c:3b04:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49fc56aab52mr150433145e9.9.1790003358551;
        Mon, 21 Sep 2026 08:09:18 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm255659435e9.1.2026.09.21.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:09:18 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Date: Mon, 21 Sep 2026 17:09:00 +0200
Subject: [PATCH 2/2] riscv: dts: sophgo: sg2002-milkv-duo256m: drop
 reserved memory node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-sophgo-remove-coprocessor-node-v1-2-ace29446b327@gmail.com>
References: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
In-Reply-To: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andrei Lalaev <andrey.lalaev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790003355; l=930;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=2hLVo973TL+IdDgfOfnl6vgwTnq6FuS1dy3gn60sYLo=;
 b=8vQxbbljLHi5ctbjXGnvpx0s7hUcmZwoEqChv9f7UFEt2WHJsgauYQxdmsMj3k2QtvPq4Px1E
 aqvlQO9Z73xCWko1NMLNcKEsCu4lGQsSo65J/OH2o+UPbItGZHFeTDN
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=

The current FSBL can load firmware to any address and can also
disable the coprocessor. Therefore, FSBL should modify the device
tree at runtime. Remove the node accordingly.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
index a2797c0bd767..d4e86c15664e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -36,17 +36,6 @@ led-0 {
 			linux,default-trigger = "heartbeat";
 		};
 	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		coprocessor_rtos: region@8fe00000 {
-			reg = <0x8fe00000 0x200000>;
-			no-map;
-		};
-	};
 };
 
 &osc {

-- 
2.55.0

