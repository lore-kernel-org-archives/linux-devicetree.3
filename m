Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35464657DA;
	Tue, 16 Jun 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625821; cv=none; b=F4A+M8Uns0Im2CKVh2J5Yb6ipILCCQhMwCgdD2I4F4RuXGtJTxsme9Cp0wutyPwg2qDnf46iViFngcxTJHLfdK4RFNX3IDIPoUOPA/Bl3lNwyVQaP6AX7UOT7m2Q7eINtPovkYB8O4NoKh0nOVfjBvtPjtEfGWp9zfjsBdK/rmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625821; c=relaxed/simple;
	bh=YSQJCU6UP8xSjWxbVovXreGZS/Xd6/2Gt8PJB5MgUBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEtcgIR7Z2YKoYJZJ82hkGdqFMiqCHi5VdZXTqqmwbjI6QX4CJbKxu7QbF9DQWE1xYG+49ygyd4dU+XdHU2c4nTVwED42Bj4s2HJ4XJuWB5DHik2FPbT4lQFT1/niRycJqQ9B0tT5Ysdc9fGj6/AsWVlZ85B7B3JnARoG3PUFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igb3NArz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igb3NArz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBDD4C4AF13;
	Tue, 16 Jun 2026 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781625820;
	bh=YSQJCU6UP8xSjWxbVovXreGZS/Xd6/2Gt8PJB5MgUBM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=igb3NArz2SNq99p6/eGKfm+ZwpU8vcYSeyM0Y29KmZS4J1lWke91AmPGozsGg10u6
	 CU6siMFziuQiK/41VA6MboxtdanZaEl4SmbG37fvGsdfNBBJ7avkDad1M6PCj7x30T
	 cpSoad3lf7dLw0EGvqk5Daq+YG/y+V80dg7/xM4k0un0JDu64vAPqr9S0snSBAPfnT
	 pNrpqWUYXbmsprHeMdPtVvzYjgJyrcHdJ5oZso8Oys0KiRhmKW4DN5ujdMCnRBzoPI
	 u5bkrt67ZIFVgiZijDgfQ+VQgZAdXxhSWricaqS7Ydlws4Fmw5vCBooSlmeF9TSpjt
	 8wgYnn1eQYNhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A692DCD98E4;
	Tue, 16 Jun 2026 16:03:40 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 16 Jun 2026 18:03:38 +0200
Subject: [PATCH v9 2/3] riscv: clocksource: Add readq options to
 clocksource mmio
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-riscv-time-mmio-v9-2-03af7bc8f2d8@htecgroup.com>
References: <20260616-riscv-time-mmio-v9-0-03af7bc8f2d8@htecgroup.com>
In-Reply-To: <20260616-riscv-time-mmio-v9-0-03af7bc8f2d8@htecgroup.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Chao-ying Fu <cfu@mips.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781625819; l=1938;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=xJr18GUgwDimiDlbxKI0yWHxvsNJAqXLsf1ztMWXw7U=;
 b=By06W4XK0v5RRGKaBEE57X5AIAtQGToFihzCgmHqkNKkwU+nNA/KnKJmMbbpzH+UjvOaAqS3R
 xbe3ySTGRkXAsxhX9+Q6nB1NohkgOMtPtAr2JRaclgTb6qi86f27crI
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add read functions for 64-bit register size to the generic
mmio clocksource, covering both up and down counters.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 drivers/clocksource/mmio.c  | 14 ++++++++++++++
 include/linux/clocksource.h |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/clocksource/mmio.c b/drivers/clocksource/mmio.c
index 9de75153183124cc8997c6ab61d0c01d9b2637bc..f3b6f7e93ffbf0ed68e56c58c3d9f711d2193caa 100644
--- a/drivers/clocksource/mmio.c
+++ b/drivers/clocksource/mmio.c
@@ -17,6 +17,20 @@ static inline struct clocksource_mmio *to_mmio_clksrc(struct clocksource *c)
 	return container_of(c, struct clocksource_mmio, clksrc);
 }
 
+#if defined(CONFIG_64BIT) && defined(readq_relaxed)
+
+u64 clocksource_mmio_readq_up(struct clocksource *c)
+{
+	return (u64)readq_relaxed(to_mmio_clksrc(c)->reg);
+}
+
+u64 clocksource_mmio_readq_down(struct clocksource *c)
+{
+	return ~(u64)readq_relaxed(to_mmio_clksrc(c)->reg) & c->mask;
+}
+
+#endif
+
 u64 clocksource_mmio_readl_up(struct clocksource *c)
 {
 	return (u64)readl_relaxed(to_mmio_clksrc(c)->reg);
diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 65b7c41471c390463770c2da13694e58e83b84ea..39e0df5a0ab52cbb7016b53a4d7500f2697e2797 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -276,6 +276,10 @@ static inline void clocksource_arch_init(struct clocksource *cs) { }
 
 extern int timekeeping_notify(struct clocksource *clock);
 
+#if defined(CONFIG_64BIT) && defined(readq_relaxed)
+extern u64 clocksource_mmio_readq_up(struct clocksource *c);
+extern u64 clocksource_mmio_readq_down(struct clocksource *c);
+#endif
 extern u64 clocksource_mmio_readl_up(struct clocksource *);
 extern u64 clocksource_mmio_readl_down(struct clocksource *);
 extern u64 clocksource_mmio_readw_up(struct clocksource *);

-- 
2.43.0


