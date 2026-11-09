Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195243;
	b=lL2TnZgwcCVcVeq4F0+vhu7e1MAPV90VsTgOX3RHnKtIBazINQbTQdMU5iRSwwsPJv2k
	 2p4Q5qTEKyDX/HFEQxjaL+gwIeQXjyQkDXp9Nc8LhsVSav0mrPUNtOD2lT+tpeDWFrD4b
	 07/PPSvmN5dK5zc8f1zw+LEUU81SoaUJ9vaQaJzU3X4Sxw3Jy7dFUn+PUt4vkwkavPf2K
	 j4fIGoKrCIKHkwPQ75LbdERIDuN5g8IFJzaK4LMlJCnPUKuORMEy1O85b6SiWmhRrho+X
	 g+X2Ftno+s1pK1DORjfH2LrP9lhBFfNoE0RdurV0XsQ5sFbbr/iRujkqKQt1v0K9C4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195243;
	h=DMARC-Filter:DKIM-Signature:Cc:From:References:X-Lms-Return-Path:
	 Content-Type:Subject:Message-Id:X-Mailer:Date:Mime-Version:
	 Content-Transfer-Encoding:X-Original-From:In-Reply-To:To:Received;
	bh=DSfjtHSZUsSyQaOs06LHZoC4jG8cLJJQqat7HHI0wIg=;
	b=GoVf11ZT94lTaW1udEeRohZh9/aBYfapH88rE51DaBYvMrEo3aHF6oFm4oygcxFqed+B
	 UfGL3P/yTfDl+HsAzpPcl7+dpMiI7x3puh66URwIAejcTK5zhSAcNWLV3/2nGen2o2HUa
	 r6bG8Niaf0ZYxc3kRUfxld6b+z1FgMzuEOzOgfnYPO2E5qEM+0vZTtk6N/w2djm179Qo9
	 edfHlFBQ4KxIT1iCitmagW5PQ7z+Z5bL572Xoth+5Yljfwy9j1aqdp0gYm7JE7Kl3VPz7
	 cv7wBzVyZ8RG1Fu99mkvb1oYQV+a1cHTX3poJCHNa2TqMvUMdo1Riig46MzWlOIgtOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=23VbAndK;
	arc=none smtp.remote-ip=209.127.231.39
Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C28E606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 03:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C28E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=23VbAndK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794195237;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=DSfjtHSZUsSyQaOs06LHZoC4jG8cLJJQqat7HHI0wIg=;
 b=23VbAndKn2vzgoyV8Rt3mY6dm38eeUzPdCuGHqwWHrcezmWVtX4TtaAG+0S8ll59IZa0V0
 6wD8KQUI30OFafQNqWDANEt6BX9DTSbQbZ6qresxEpC9H6DOVmjRIELJTaI2y8ajXvcYRO
 2gCA6fyQE7WObssu2ho/KuQvAFuQksEf+2YeresvP//ke/HmDrZsrG7Z6IBg8onOQL8oub
 vDFiLkJH3bxsrZ7M0ihQdcHiiITFsNLCHMIqqD+YKiZhxVAKgToszzI8WQKgUOoK5AgBKL
 YNqR891AkbClFc0Z6oWutu7TeoX1rQc0NUhihwMw3SjDhGNdpM68jAlDRYFJKQ==
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26af13f23+84d9be+vger.kernel.org+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
Message-Id: <20261109033348.361452-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Date: Mon,  9 Nov 2026 11:33:48 +0800
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
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
In-Reply-To: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 11:33:54 +0800

Add the device tree node SDHCI-0 controller for onboard Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index bcd533484a73..051046fe90b2 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -177,6 +177,28 @@ &combophy {
 	status = "okay";
 };
 
+/*
+ * Onboard SD card slot:
+ * Please insert or remove the SD card while the device is powered off.
+ * It works as a boot media. so set it to non-removable.
+ */
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
