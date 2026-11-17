Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794945614;
	b=1x3A+1RqQLZsVWl9bqlggFfuBWbXd4PVA7w0W9rfJmQFn0bmuGBfgdGMsNjuaV8PV9aP
	 zRuTLyxmueO6AH0v/QhRvtqmEvInRd0hooXIOrONQGn53bdS8DAfY3LCxqeoPFZqnVI5I
	 2ZsvJjA/g0DzhkmRIbBBJN2fY2tECEsE3D3QS5tOwM0Nw0GeUHMwjH6vKZPAQZ6g+ePtr
	 fHFJakt1Qklx6ma9q9grA9RY9pDRF8X8LMGFfAkOE3MkTxEHdoOIe+iNTYvQ5fYd1FB+D
	 BMQo+OG2aniDwoB44fGhVTq+DSPzctri1HTqI66zxj97O4AI5cHNF8F85aklB9KPs3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945614;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CfThdO8f/o1dN6kXq8y+xiket6A8mwn5DpRMwQpz1IM=;
	b=Xw6MYLzFj73TvC4fQSnK/GVomXmkeikEMKDPGPJ1F0Aoigqx771BmAo9khqiA8dnOlOf
	 84yVV4MGg/PiXP4rgA0TbjktXBFGb2RuhFXnr7tHs4x7NQxrHfJMhNAFjjpabEpVYpNPl
	 Uv9bbd/UBy+9d3XKHyXkYASStidCxTUp5lrQcaOoYJrH0XXuI5k/M5W76oJF/VyV9LLfe
	 LmIvUT9PEgkorckO5naVArlzCANRCatifHJ2xkXuP3LeHDgeTuk2D3AVea9Dgsn/9IvvC
	 zaXBoSHeUnP6bgfGMtqmgj5iF+HypJD4JkuYA4Hc25dIF/Ev49J0MnjBD9675Kq4NLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SERwcjTU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233AF606A33A;
	Tue, 17 Nov 2026 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SERwcjTU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794945614;
	b=pgsZvkyc56bAVem7A7mTlB7udNZXtN2CLKMEILXBJ/jNgDJ3B5DrU+/zDXvs+O2uKKg0
	 tEmJGJDa4iN8eSq+7ePHwqhiTj67InyF2dYE7+Dc8FdWj0mzn17fjeMCfwNNYUPZfwtyI
	 rZIPtRHG+pLQDvVEDKZHL6YSXxga2WCzlT7SODlH4X+FFfZ1ydRa5rDQCbqUMlxVw7S8J
	 55WnrONzaKnhAiUmQVlBeaXC/C2WPKU6C1LoePt4bV+P7xXYSsmBv8lzHlIRdb9j6udkO
	 sxrLpVlG19BRYbtsOXK5cpS4jRhNJSNcDxsrOo7qs4fTvvoRo0b7FR50HFLQVaAPedg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794945614;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CfThdO8f/o1dN6kXq8y+xiket6A8mwn5DpRMwQpz1IM=;
	b=chx92n9g8wfDTOVGkqBSwGyx7p72QwO4fDsAv49Fl2ZDDrp7U8YgTvD1IOvpicYwru1f
	 jAM6M/PdkJyZzMlfoWjZaWxEAZtPnl0IPxRDYMncFa8KH+X9nMAMEwZ3xaWGd2fGmKlY+
	 FW0vb3wdGbAyEb0Nb30sFkd5Xd8cjQ8rIxZVoPXjts1mNxjEbux7xNyhs32V/x4n2uVam
	 qc8qGCPfn1iVUwL6W7GAsohcHxCKjHpVSPpNbfKRmsgiaDGrbO9CCyF85wWGBYeJYFUuC
	 M9k9E7s9Q2Lh8VxtF2Uhy3fK6AjAjDarHIbvAXGByRqCcKOIPoQzQI0OpD1unZqjxPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D226F1F000C7;
	Tue, 17 Nov 2026 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945613;
	bh=CfThdO8f/o1dN6kXq8y+xiket6A8mwn5DpRMwQpz1IM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SERwcjTUAax6Oi2NqUswhIBR0wMKqjgchMTu3pIHk1VMCeyQnArW5YrC1c6Io3zVL
	 M2IGYtZkZVdubdrdhjCVN23+keW+1aOGi0G+8iskZDZ7R8JvJk42hDmtPtVAqk/9rN
	 aLEEF+83XVxYE1ors+1lHrtd9txXrHlHhErSdjdTOv01m+UxPhYwg+iwH3nSbVJNBU
	 oY9puOtDmiWtg+g9N1HT0ehrx9hymjRzB+O33ZR49/AoWCcBfH3Ux3lhEo08pjsXW1
	 Xb/Arq860o0Y0kwbL0wtgJSOPtClNJmZYn/VNS+7n4vxmIFrDcAmTYKlx5zSGb+FRu
	 75Z8KuWmrLWXw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5A12D4AAB9;
	Tue, 17 Nov 2026 20:00:12 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Wed, 18 Nov 2026 04:00:06 +0800
Subject: [PATCH v2 2/2] riscv: dts: eswin: Add Milk-V Megrez board
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
Message-Id: <20261118-eic7700-megrez-v2-2-0113ebc5b670@iscas.ac.cn>
References: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
In-Reply-To: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794945611; l=1629;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=QUGwPSZ5IJZOF55+jsHoXOrYxzxrVAnohOX9v3SFw5c=;
 b=8S3rk5VvyppR1x4KTay2bz5XR7TwdRtLNW9udJPa5eB/bNsqOYAZs8ZxYA48p3Snbe9prV8XH
 CuS4PbE2qHGBniA+nu0eQHITSdgiZm9UWsZq7XDDZAQkxy5gmKVtuFX
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
index 0000000000000000000000000000000000000000..a57cb61171087b20a39eb962f9c45d9c8ded3925
--- /dev/null
+++ b/arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 Han Gao <gaohan@iscas.ac.cn>
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


