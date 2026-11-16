Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819568;
	b=STz79nmohsN3M8k+CwARkMJV5oqMZ7dNJk74MfnXkfLKtlVFRQQ4+T9tHTOEHKLU5RDX
	 ZcpYw7urcLleg4C5CDTJqOPrFV4SHBknJV+gAGogd7ZWU8fqUlL/58F8kJ4bniKBu4yUM
	 WQb3bOyG/HR7+S9W3Brd1cIRlFcEwhDGXN+b4x68hgj7+jZPFCOyxe4NYWaPRiGwooQpD
	 gMpaQHfEXujz7tTkQhFWXQaHYFxDGQHmNVqpKvgfoTA7WI0YJMjjHB3ILrJ1NrRcITZJK
	 /ctpH5oT+nzFPObIlhXir/HkJbu7M4bjIt0CrFAaFuYS1jOPSUIx322cD7s9S9HFtSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819568;
	h=DMARC-Filter:DKIM-Signature:Date:X-Lms-Return-Path:In-Reply-To:
	 Content-Transfer-Encoding:Message-Id:Received:X-Mailer:Content-Type:
	 To:From:X-Original-From:References:Cc:Subject:Mime-Version;
	bh=p4DpLO4bTnuVUXS4e/jXglOT3Dz6s8obdebqkuUomVs=;
	b=NISKH56XlNXLKAJbAotEuwnl5tnVI9yRxEneijf9zfQmNE960hsKaTM5MZlyZVYNQnL9
	 tPQ1PNDAbofAP2sEmUg+mm1SUE31xQey0vLfe0T9lFeI9hKh7jSnQ7eR+PqpxrmCImvEG
	 Kfp60OeGmdXjrGPP5pIRtgsf+BTy+f8NsgUoCZsjPEseIQjiJ4kfeW+ApoNX0Z+YSqXQx
	 bt3Y+8MAeY0HbMSGJlMwPJV5XKCw6gsfgXAYjaMMtrZPuGsauYT3rRy8p9Zi/S5NLvJat
	 7JDO1MXgjYIw6FBQFCrSr7xGAb6OK5NxuBhBHGE2qR1UFd0a3pptF6od4nFzom4ecEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b="u/cUB8I7";
	arc=none smtp.remote-ip=209.127.231.35
Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD6A606A33F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD6A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=u/cUB8I7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819557;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=p4DpLO4bTnuVUXS4e/jXglOT3Dz6s8obdebqkuUomVs=;
 b=u/cUB8I7mzDUwxdT9I7fZkxRYOpvKAknSNNGYYcJtHfgObsGbfCmE/noz+m8C5G9Re3B+t
 OhmU7GYvMdE1nG0UcHz10zZWANJsOcNPYqi1vOiHWXJ4TmUJP2Ab/pGa2V55BC0FUtzVf9
 AvKNyxA8PJ+KhKZyRVf6JNWKwr7gEebWGPBCZ1i0jiJ88VG8ScPRDXtByVud5bWeHfel6f
 cPQEACsYOBUjCuUzXsagmagnZC+P/pBWjwmCuHHTk83Rbih4GTN+q41Y2L32Sr1LCc/f4q
 gCUPVMFYgunU+vZimZIFu126+7KgQ0WIfCoQ759NCFPg31ky2beFaQeLnOF5RQ==
Date: Mon, 16 Nov 2026 16:59:06 +0800
X-Lms-Return-Path: <lba+26afac5e4+182f27+vger.kernel.org+sandie.cao@deepcomputing.io>
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Message-Id: <20261116085906.951287-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:59:15 +0800
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 2/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for WLAN
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

Expose the WLAN enable signal of the FML13V05 as an rfkill-gpio
device so the WLAN driver or userspace can toggle it, following the
K3 Pico-ITX board.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 804a9e64cf6e..f84225cda1e9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -30,6 +30,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
+
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio K3_GPIO(35) GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c8 {
-- 
2.43.0
