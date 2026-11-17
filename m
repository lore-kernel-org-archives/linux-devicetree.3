Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794945345;
	b=qY4zdm59VJaPACbkZNdgj+UzXycZciTRtPcs6J393YJHClMgxvYzBoiwnMHzHIZ6s5W6
	 DyhVQJdh+3qrQvrl+YS8V98L4Al2FImd3FTqkhOOQEd4ZRsBPA0wl1E7nNQReq41T/WCg
	 KLe95sS/Z+ugbyuekS7D9uLGMjoZY9DIrGlXxGoeQ0It+d7SjMDoOnTZhKcqLAomHBUBN
	 gBFJRnCo7SHOC39m63k25381xpL46f7Ztk3YiCnCl8MASB1leta1G9OiP/MhEIF7jmI+m
	 KuXn9DBPCskHVBdfIg/wUFvVcA5O3o85WpV+gc8DEhp2pyP1+s9ysrsA1ac8eAoQRuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945345;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hUhYh4Z/PDezI8cONEqRZjSHAQnYq8Uu/Su5P7ciz7g=;
	b=OVxVZ1GYPshpTGcdm74nWCka3dUz2CdzQZrCGuA0T8uKraStpg7anLF56DMNDJzQMZTc
	 Ma5vNX/H3ORlJg5X4vMXbOx3YUCAel0nHJfR9VSQ5wbD0Oxusc/nICwYhj6b2XHjX3lui
	 cjelIM+tFzgFo8uxJtPtkyJY/e2Sb0GWmD9rSm0dyzRqNat6xlfT+ImOz3yZVpKmfARqd
	 GdGKMI4LTRP/zcp5gPbik1enfVo79y5vv0e1DgvOOO5P2WZiTirvuq1XYskjmLMCoWy4Z
	 9P6EIBINvhsImKA6bp4uEJYoCLeRfe5nfw5G508stb2ddiNyp8l4jFACBk+RzwZAbgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I5iLUPhu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB85606A333;
	Tue, 17 Nov 2026 19:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I5iLUPhu
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794945345;
	b=XWwp0Vn3gnGhipSiOd2S5q3R6I0qULDTWJD8m/lqg65YtqZrwMjlMGcfUpFr9b1wySrP
	 kctIRKXEJ4kUmlJAzCeRAD2hxZv0XC18aSkVPJC68truXoJ58mJvjciLmI0Coq6RVP9ld
	 2/YWiW6KdtOde8GMHCKQOoXsysYKUYVMIITxTKKprjIgP0xScrMGxVXne0IPNdsT1JUqs
	 V8OX0VfN4nXMppqy8RyaYGcUZCpeJ7ZZWLYL/cO6PAnwH0wz5DAS3/mcKpJTp3HYrXvK/
	 4zMXXVy7Zsu2tNs4FvSWJq2q/cJ8D+GwF24Tx6yVz0iIdAeLBo1fkzunmYiQI5JJjyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794945345;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hUhYh4Z/PDezI8cONEqRZjSHAQnYq8Uu/Su5P7ciz7g=;
	b=xFstLGEsLNHUWX1fcZYWPf+UXw+9REwFkRKAvoHBJY8WTb/gEOk8XcbU+GbQ7nLsl7d1
	 ePw0FRpjfCWKXYTBo+oyBvF9O/qSM7UCBNrGntJHKeZ3tGgVOqVD2E4RmMiDxesFyb8FQ
	 IfLolasZdNVGW0ZSALiXrzO0tSxhOwUSbMMBqEecjhA8uQVpSZmY86vJHE4W9EwNv5fRo
	 Vg2S4C8soTu2+Q9uiHg/bZ9IKpSs6+pElEvqq4WAIvkW8Nij6RSeGHhC/ITD4yxYqm8QW
	 iGu0xPIRGr8Trcni+aFej+ip+v0lYWyqeV2M2YIMW0g6mEPz7f31RKxtCCeX51KlI8g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9486E1F000C7;
	Tue, 17 Nov 2026 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945345;
	bh=hUhYh4Z/PDezI8cONEqRZjSHAQnYq8Uu/Su5P7ciz7g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=I5iLUPhu3NwUjaP7SwP77r4Rd5x4pRXQ3IQvfDNQTF/MNameMZJIMnxPMPqL8q8aj
	 OPAp9S9moOydHlPxixy0zKbFMX2gtwCnTq9Q2Xm7SNgTRYEraySHJXOpKNRvBLgUkG
	 vpYxIzz8VZEMCCvL1fM5hTjWE33tDhxm5htC2l7/nx/FORXER1n4s7+3yweBdBXooF
	 oWyQemsz3oswrlqGojTwwhfG8uAWf8/bGAbx/4jgtKtF20XIHBbcI4idktFHiM3THu
	 5uq6QdEdg8RcXQoU3isv+tSVf8a8RUHQKQTAC6+i3bjSTUy5s7FFAyO4aj03bf87AN
	 Slv+TmtKWzWKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1D5224AAAE;
	Tue, 17 Nov 2026 19:55:44 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Wed, 18 Nov 2026 03:55:32 +0800
Subject: [PATCH 2/2] riscv: dts: eswin: Add Milk-V Megrez board
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-eic7700-megrez-v1-2-af8334b88336@iscas.ac.cn>
References: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
In-Reply-To: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
To: Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794945342; l=1608;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=5UoIVWI3E0hRT2YTxV7p/RQ7wPueg9djF6ac68d/O7I=;
 b=eOiA75gawpPq6IKE0fE092dhk/5ohmTbM2e6yYWxs8B5o12sKpTdTytekzbghUGprexUcXV2/
 kYp9Q3p8HGUCjJyWfM4grO9eA14GhpgsbMN+/u0c2ajp2Fc+MspDRCW
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

The Milk-V Megrez is a Mini-ITX board based on the ESWIN EIC7700X SoC.

Add a minimal device tree that enables UART0, which is connected to the
USB-C debug port through a CH340 USB-to-UART bridge, and use it as the
serial console.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/eswin/Makefile                 |  1 +
 arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts | 25 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/Makefile b/arch/riscv/boot/dts/eswin/Makefile
index 224101ae471e8d89996f7cbfc616425f704af37e..5daade822e15eda43eee111cbf89bc386bb06f32 100644
--- a/arch/riscv/boot/dts/eswin/Makefile
+++ b/arch/riscv/boot/dts/eswin/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ESWIN) += eic7700-hifive-premier-p550.dtb
+dtb-$(CONFIG_ARCH_ESWIN) += eic7700-milkv-megrez.dtb
diff --git a/arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts b/arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts
new file mode 100644
index 0000000000000000000000000000000000000000..2ca6d36c5edca271381b677ab14e9a459fdaafce
--- /dev/null
+++ b/arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 Han Gao
+ */
+
+/dts-v1/;
+
+#include "eic7700.dtsi"
+
+/ {
+	compatible = "milkv,megrez", "eswin,eic7700";
+	model = "Milk-V Megrez";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.47.3


