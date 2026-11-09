Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195218;
	b=B89rbYxF5lTTkqRQiv8pG0vOljEAnSqkGKahWKkqvlObcLqKA0dD48vGpeuRY9Uf42mF
	 hN4DsLoyZFjIc2iXhSiM2YCCOkLPrbEBjdNGjxtMQTAf2EzkqEZxpQLY3BQD2wPl0QsqJ
	 NAB4yCFqnuL+FEz6JrVDGfnzlBV7pF8DEjctAccHbY6agoOuqojZlOjP6sO66tSJAsWR9
	 Yos4/1SNISpjJD0HFHrlgN76r6kLW68IcUWy1QR6e+dMQWy5filtXktQmAwyC34CsfxoH
	 dUfpmiikvsjrdTs7ZSd5hX2Ij4rirlDkdtCmCIfDNEiAJFwGcDrPxB5QDDA8HkVusiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195218;
	h=DMARC-Filter:DKIM-Signature:Date:Content-Type:Message-Id:
	 Mime-Version:Received:Content-Transfer-Encoding:Cc:From:Subject:
	 X-Mailer:X-Lms-Return-Path:To:In-Reply-To:X-Original-From:References;
	bh=VBxjSeMIQblJqurQ7NVd7kOa1gruW2oug+/iX2zAqdk=;
	b=o057zElA7x8CZwJIkffEg2MUHpmKAZc+i9dSJV4RTYjKeuHoVlxKGHRVBNzVbXq73tGp
	 KHwY/t4k7pfkeG+QJ9x2RM+Idir0sy2tV+rFCAh2o4VVqHoOxpJuEdi1wlhcDMmmx43WX
	 y2627HqQD4b/+Q7NceBhMXg1Stx5X/jbbexti1FXQrsH4OFKFP7pcOMB9hlyvMaFPgwJD
	 TxgHZc0o+imXhC3SAV2R+JGiBdGJ2yMyxjO5+UgcfzEhkeYdn66mteR2/tPi9Mp8IOSpU
	 H5BffnokmCkso80j9P5qHuMDTX8JO/mDWa6txfotQMg3P5PqC3yzd9ZN30NStCQuhwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=HnRVv5EA;
	arc=none smtp.remote-ip=209.127.231.39
Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC4A606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 03:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC4A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=HnRVv5EA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794195215;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=VBxjSeMIQblJqurQ7NVd7kOa1gruW2oug+/iX2zAqdk=;
 b=HnRVv5EAfHTtUtUWqqniKmE6iCWXjTtEMYtt00z+c+gaHSBex+wBK6dbHf7L58Ui9QoEbq
 gU8lGq8iCt4rqQTXUAtl7+Imei+euBCjI8dWW/BqVYXjcOip9CS18xgKa1sLfH+RtIvL6S
 ZYIideJAU9dIMKcXSlBh92cOx28BDKm2fItbbVF+1J6FXWocpN8hQlrq/eEtTom+lmjnwc
 gyfk+WJFp56WLWC8RMm6V2tg+DGieDWpCMwgdvsJVn0se1JAuiu9OLeqQW9vAFP2okPxK+
 Q/qHfGlQGbRhFNlAtCqwqTXsb0OP/PV39Oq3HTWWGWFB/ZCYdWIPlkfTCjgI4g==
Date: Mon,  9 Nov 2026 11:33:10 +0800
Content-Type: text/plain; charset=UTF-8
Message-Id: <20261109033310.361435-1-sandie.cao@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 11:33:22 +0800
Content-Transfer-Encoding: 7bit
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v4 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26af13f03+6d3b75+vger.kernel.org+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
In-Reply-To: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>

Add USB device node (b, c, d) to DeepComputing FML13V05 board.
USB A works on otg mode, it isn't configured currently.
- 4 USB-C Ports
     - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
     - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
     - Port 3 & 4: USB 3.2 Gen 1

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index e061233c15a3..bcd533484a73 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -172,8 +172,58 @@ dldo7: dldo7 {
 	};
 };
 
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x17>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
 	status = "okay";
 };
+
+&usb2_host {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub@1 {
+		compatible = "usb5e3,608";
+		reg = <1>;
+	};
+};
+
+&usb2_phy {
+	status = "okay";
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
+&usb3b {
+	phys = <&usb3b_u2phy>, <&combophy 2 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
+
+&usb3c_u2phy {
+	status = "okay";
+};
+
+&usb3c {
+	phys = <&usb3c_u2phy>, <&combophy 3 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
+
+&usb3d_u2phy {
+	status = "okay";
+};
+
+&usb3d {
+	phys = <&usb3d_u2phy>, <&combophy 4 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
-- 
2.43.0
