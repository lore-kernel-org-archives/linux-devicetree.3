Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819613;
	b=TYhscbQah/TQDyeNNW2Jcl07wKcesQ/nQomPzc/2+kjPWAfdpEvW9tMlD0lvJMqk1Z4Q
	 VZvQd71ns4ZNIv2W/K7urhmWDLr/nLg6RVcgUUIk8IOHAAJGcnt26PxZJ2mEwamzVc1jQ
	 QMhnLEkiIocscUoOOKrobiadYhzVwvnbVAPgCa39dkOG1JcbXyp5aJQC0jOAnexSsN0Jt
	 v8u4LCAQuomBVpCLGrw9SX75m4C4LzWQgiJdQAbTLwb4+bffu8GuTEKIs9arBys9m+X1P
	 hURXBiGR2itU5MFWnos4bAx2Rffq/WlFIAS3Qn3xpEeAQvRi1w4gK+qsdKdf+TSAIPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819613;
	h=DMARC-Filter:DKIM-Signature:From:Message-Id:X-Original-From:Received:
	 Cc:Mime-Version:References:Content-Type:To:Date:In-Reply-To:X-Mailer:
	 X-Lms-Return-Path:Content-Transfer-Encoding:Subject;
	bh=70z/WI0McbinqpG+yd/C6iK+RigsJ/gp7vM2rkwjXR8=;
	b=jYFmQ8O44QjoHJCu4ED/giqdOUdVHwJ1/YB0XXrl7CTe/hetqS5ETEhgE8Ug+6Qqoht0
	 D2YaqG7Z/LkD5THdEKTEdZDex+7JyY8BK/ogX4DCNsLg0ld1TK2gYEOBEPZbOz0nunbLp
	 smVPNInbT5zViALuPbXgSSYdcGP4cJa3kh7YHl5uxmuG1hZzSq7eNl2LFNKWwtBi+S///
	 IzDjs1MDWSXvz9vX4A9vCs6ioKB1une3yCM5rjc8h356W+AUwPy4OE1R41DolxKS7QN8/
	 ecqjp+7OBcIEvCXq8tTMI6irpBR79vqMQIGGZUmo0WpgMePKZDAEFbIQJ8qm7vgp18Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FSqZ+UAd;
	arc=none smtp.remote-ip=209.127.231.27
Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47AE606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 09:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FSqZ+UAd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819602;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=70z/WI0McbinqpG+yd/C6iK+RigsJ/gp7vM2rkwjXR8=;
 b=FSqZ+UAdMtrYBd8YAom/an2rtDRtOjJyQ1rLAW2iRUOX0mWbEeYYkIMHoIBEleSCOgbHqD
 EdGjlaEI4BKXxvBigTnHnLNkcC9iMvkg2gxBwpnY99Pj6C3+NM1A+huRp2gPnH3qQSxoFc
 awLnLvsK0erLl4v2Bvhp8ubctAzwwh5spGw54ZaE6tBaFe0bYYDGF5Iq/QWhQ1gXD+XzEr
 XixWqlNDO9zNvCEMsAjZ/UqHhWWGbqj3fIMIsT5igYrKBECBCbsx3OVFK3J+Zb6pTVtMF3
 /gwnGWmScBt35zyMJMdNnuGmxetYJQe9ljiLX0lFMrrJ7+dtBbDXhefEGA956Q==
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20261116085952.951331-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:59:58 +0800
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Date: Mon, 16 Nov 2026 16:59:52 +0800
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26afac610+cc6d9c+vger.kernel.org+sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Subject: [PATCH 4/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add WLAN power regulator

The WLAN module on the FML13V05 is powered from a 3.3V rail gated by
GPIO41 (WLAN_PWREN). Model the rail as a fixed regulator.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../boot/dts/spacemit/k3-deepcomputing-fml13v05.dts   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 8c12fd01227b..2e1ad0929ee5 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -31,6 +31,17 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-always-on;
 	};
 
+	reg_wlan_3v3: regulator-wlan-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio K3_GPIO(41) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	rfkill-pcie-wlan {
 		compatible = "rfkill-gpio";
 		label = "rfkill-pcie-wlan";
-- 
2.43.0
