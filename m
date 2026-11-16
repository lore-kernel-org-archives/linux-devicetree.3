Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819682;
	b=qObW9H4rMUg9NFo8wlijycZFXlix1dQMWzQtaDdQYpttZZanf0SXoKzma9mnkLYERYyB
	 pgz6x4qtaAhUEYg+hWJftJilqTJFjif8lvB3pfQ9fLQfhiSiP82i/pulUJUSdQvlAQ5fj
	 /J6/yCm1D7EuiwYl8129cnkQYz7HJaIlEkX64UaD9/KCE+GKHjtGz+aU/da+vfODwF3BK
	 mt1naWq1U2EtvOCyONOjxKm861AlUiM3KPq/CwC6NJ7YJVoGKbjzFeL9XmelEkpNXpR7i
	 6N3A8+js6H2exTviXNSkyw11Nk76kdKgvlBhQG8u536LkUHlgRnvRaQLITbzDGE9XHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819682;
	h=DMARC-Filter:DKIM-Signature:Subject:Mime-Version:
	 Content-Transfer-Encoding:In-Reply-To:Content-Type:From:
	 X-Original-From:Received:Date:Message-Id:References:To:X-Mailer:
	 X-Lms-Return-Path:Cc;
	bh=K+SHc+Dz2bu6gR+hGPRdpnsUFNLQ0kuFmQnGIRcMA1w=;
	b=x+y/x5znfy3X5MYU8yrTIUKazckY0cO0CRjpw5+Y6hIaSlp5QRtBJ269zTFRkBc4BbQW
	 ya9R3egcshCoTR3AQLzuBE2eeZ21X7OiASZfZJE8c9L0YE331DbsLwqX3tuvxOiU3KGQY
	 h6yLq2JsFT3SSlJo7xH7zMlGkPxiZAufPpfmvt3I1sSzV8m5xF+Egh8CuMroqfrNM8OBu
	 5skYf89HDzaWG8qjAAjiLU2IzXm0ZVXdyWrLL56iaXJjMvabu5xWlq/OH8dk3bL/rvWMk
	 j3AZxCPSDIBXYSY3PmnhYu+SBaPZkxGBie1XWrurGdzEhrEr4G/gOJoKFyBC6bmY4nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=BcBHb0JU;
	arc=none smtp.remote-ip=209.127.231.35
Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A51606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 09:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A51606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=BcBHb0JU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819671;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=K+SHc+Dz2bu6gR+hGPRdpnsUFNLQ0kuFmQnGIRcMA1w=;
 b=BcBHb0JUCiRWRQR2XiUd366egCc5OrLzts95nuu7WbwyIXj1I+zkLeoCG67OoRJeHdpalx
 qQy9mqkylv0z2dzh72xBNlpZnr8jYeEdeWzPDVNT2HNgffnCa+moOM1y9o+4JgkdWchFNu
 iwVkNaM+8uqUalRrVKIxOwT4YBKKjvPdKSY2uDSyWOR1Mkg0N/RBpmSAe8X0syqSvkgCNO
 dLfc7RHYb8LgdcIvDTh0RlBRg7PTfGoTGLpqLOlSeceBI1mV/6MrsJGjgsCo36NnQ36GSR
 QHgT/9Li+kR8/2xMmME75vZWKAmNpZjKnEH0Ey1OpiRvicwudDkZcKsqpfZTEg==
Subject: [PATCH 5/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: enable PCIe
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 17:00:59 +0800
Date: Mon, 16 Nov 2026 17:00:44 +0800
Message-Id: <20261116090044.951354-1-sandie.cao@deepcomputing.io>
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26afac64d+e6fd04+vger.kernel.org+sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>

The FML13V05 has two PCIe root complexes: pcie0 with four lanes on
combophy channels 0/1 for SSD and pcie4 with one lane on combophy
channel 5 for Wi-Fi. Add the 3.3V auxiliary regulator that powers
the PCIe slots and enable both controllers.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 2e1ad0929ee5..ea37981a86aa 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -23,6 +23,14 @@ memory@100000000 {
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
 
+	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_aux_vcc5v: regulator-aux-vcc5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AUX_VCC5V";
@@ -202,6 +210,31 @@ &combophy {
 	status = "okay";
 };
 
+&pcie0_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_0_cfg>;
+	num-lanes = <4>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 0 PHY_TYPE_PCIE>,
+		       <&combophy 1 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie4_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie4_0_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 5 PHY_TYPE_PCIE>;
+	};
+};
+
 /*
  * Onboard SD card slot:
  * Please insert or remove the SD card while the device is powered off.
-- 
2.43.0
