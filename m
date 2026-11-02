Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599317;
	b=YOJjJ/Xyekow6ldYnKOBr9RrSFxe0n5Xd3MY2wj5shTpLxZNUdmm65s+0Kjucpl1m5oQ
	 fxjoiXUYzH7aFBWEsm86mAdUQiBOXpMnTqT3js3VYE1SKItfrmDpuQZDfsvzDYkkBdofO
	 X6yNS+CZmLWs3a23qH4Q2lbfTF+r+tO8xUwv8FUPeBuva8wnTWcFJi8iTrs9FgNZf+7YS
	 kqrVWqvRB+KhSGeayT3tVSc01fVC/Odo4E7QbvaNL2FpES6RgLeSMcyxboMYToqaYV0uP
	 Q/cMCvwMaeEjPA8Cd8ms5bfOAFRYTpDBAWH0ovwk9P5Fubgx76idMXQSWhW2KHgr50Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599317;
	h=DMARC-Filter:DKIM-Signature:Message-Id:Content-Transfer-Encoding:
	 Date:References:X-Lms-Return-Path:To:Received:Mime-Version:From:
	 Subject:X-Mailer:X-Original-From:In-Reply-To:Content-Type:Cc;
	bh=1RdRWFhku22lQfv1esybG7dBMJhACY2UvYQ+lxBr1Ak=;
	b=IWlLaZl4RIRhxXrfhS0UtAGsi7hh9vbw+dTiz7l0XwNgq+lfBKqTllYVbFzKq6W2pPZI
	 UrUtxRp0m09g1ag6xlV7HLxygsErSHhwBkqT6nRqkeuMvE07D/0tUYN/T6rDZQjUMudGW
	 Re67sjdJAYZtZ3TPczCr9ZMk77KmWZO3nYeZvwy3LTY2cj61c0AV0k3j5zbEqoIkCsn1J
	 V+eWW40AFVfVSDbJgvxPyGB6wezRiNIErb5ggszvD0SxgKHEAPSJM4DmbFkBMF8ydVzwT
	 HlG5lAxPQCMBhsbelc8PY+Z5+gf5jPXhOOcEvDEns86Kris9V0ZL+2DXHsXwlxmF2zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rNurpdE4;
	arc=none smtp.remote-ip=209.127.231.27
Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FF8606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 06:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FF8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rNurpdE4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793599313;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=1RdRWFhku22lQfv1esybG7dBMJhACY2UvYQ+lxBr1Ak=;
 b=rNurpdE4hkEfaE4abInhfRTn+GRNl7gGhrrwtxplMhyaQzzm+68DR0nx1GKKe1/qC19Fvs
 rAFJWgR/aY9NT69wABnfRuTds8HPdD8oZ1DSi/DNYM46CsdoakVXB/ptmNRJiOdKx3ddeY
 9qAmQqYAs7rXYXBXTtb5fCTo2KX14jH7jBV3PhhK1JVWCRDcn2R+I4Ve/wGL01EeWfEoOr
 kf0LW4UoDQ8LfBV5c/8R9MlktmPOBiwDaJlMC+7Q1+PWVKP8WYDVcg8R+VZic8modK18ln
 6B2zfaNID54T2tWNer4C/wvKOtIFX7kar3EV19yMdFo0Qu0NpE3wMK72wLagcQ==
Message-Id: <20261102060136.100662-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Date: Mon,  2 Nov 2026 14:01:36 +0800
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26ae82746+ab27af+vger.kernel.org+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([113.80.9.210]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 14:01:41 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v3 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
In-Reply-To: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>

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
index 804abc85602a..84f66dd8f962 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -179,8 +179,58 @@ dldo7: dldo7 {
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
