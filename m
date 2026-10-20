Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484448;
	b=ctNaRNbnhB0XiU21H2KxMLSTmQjyWwciK4jjBfhvRx2i1a/6p7UYsYgjLXjZ2t+s8Zzs
	 QT6HWOyQoocCdvltwjB99Cr9Xl4Lg23mE/tTrrwAmduZKrAtT9+cn0c6ykP1FGm0bC404
	 J8OC4zVQ2Df3+15++lm2/5CX/dfU0MTt8R7agHDCGVtb/SImP1GO24XcPDVgUSoBx0Wzt
	 VwaF3//qhz4OKC5LFVduzuc4aA+dQIuYoNEncO7ezyDIRUM+KP94BUTfrKQt2PvIAu1Xb
	 2FbciKH9XRT66BI7CxY1cia6ZayWV24iwELn4I8dOkEYCZ/vZQC2QLx0NPtZBFHe7zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484448;
	h=DMARC-Filter:DKIM-Signature:Content-Type:Date:X-Mailer:In-Reply-To:
	 Message-Id:Content-Transfer-Encoding:X-Lms-Return-Path:Subject:
	 X-Original-From:References:Mime-Version:Received:To:Cc:From;
	bh=Br+RwhEUUjij+LQeVh8KN+b6c87vkCnWluLTXLQF6m4=;
	b=xsu3drGZDacClVPLYJgAcXncdw+YzhwuIurO9NieESKWq1dnoc8hrADcSSvM1jrGjBge
	 kHWLLChuKP/mkLPs1A9FnGatgKYg5z0zgXg1SL8EWIgwF0uHLJbjO2VcQ51uEVk2Tu6Kn
	 hZwF6w9aDDl4bVZ32Y8Egq15+m1hhwD1WnVOfTe5diJ8exGMbFST0/m0KB6g70ndM4LJo
	 Hv0zlJPbEtgyjMcorZ2Wl9sDKXqPLuOyhcnKgGRjjtFz4o0zEQf7hyIx/r9jVlxKfHSb3
	 EBddLgjBa6Hiy29RNwl7b5IkLV044ZQH4o0WUrUmdG/kkUq0KI8Na7lHBBB5JVsbFqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=w4Y4kjo9;
	arc=none smtp.remote-ip=209.127.231.26
Received: from va-2-26.ptr.blmpb.com (va-2-26.ptr.blmpb.com [209.127.231.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33635606A321
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33635606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=w4Y4kjo9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1792484437;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Br+RwhEUUjij+LQeVh8KN+b6c87vkCnWluLTXLQF6m4=;
 b=w4Y4kjo9R9evDZzjuKM13vSvVSPv6tNy9R9p82g0GvtZITTnyNtLyR9USU6vCJp+Dq/RmX
 A8MNAe8NFAbAUqE8bYcQ+HXm0rNCCPMYWihtCjzW+lIS92WgbpeCsHpFlC0RrweoUhgceW
 VGe4OnVOzGhBygTw2gQhWsDyk61mzB/MjA1nIBX1S/Gs9L4ycMLqOp8+BWjd1qN4285HB3
 VTMtMxBAgGRS6G1usmDtg9LOl++MI8yk4zePj9xr/ReRLHCpwZcPj0jBqju3nmRaymb80q
 ZB9dBbRZnd77CahnZYwPLrCjbjfw0nbUeD7mcJQaXNGsh9EdajlQbbVvGdDzEQ==
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 16:20:15 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
Message-Id: <20261020082015.3673761-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26ad72453+1586e8+vger.kernel.org+sandie.cao@deepcomputing.io>
Subject: [PATCH v2 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
References: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([14.155.180.235]) by smtp.feishu.cn with ESMTPS; Tue, 20 Oct 2026 16:20:34 +0800
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>

Add the device tree node SDHCI-0 controller for Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../dts/spacemit/k3-deepcomputing-fml13v05.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 84f66dd8f962..09e3d46a2ea3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2026 DeepComputing (HK) Limited
  */
+#include <dt-bindings/gpio/gpio.h>
 
 #include "k3.dtsi"
 #include "k3-pinctrl.dtsi"
@@ -184,6 +185,23 @@ &combophy {
 	status = "okay";
 };
 
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	non-removable;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
-- 
2.43.0
