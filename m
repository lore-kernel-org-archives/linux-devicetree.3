Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894398;
	b=FCQnug47v4kP7cRP7BtqhRygwgV9IuW7rwNs2tYW/Dd0AWnlCIBK8rVnc/7zWFesitLW
	 EYNH3RL6NYaTp9pkVyhtyDRavaKJcH7E8/gzuzitCGCx4UMhhykRzxh6Gd8BjuoYHcrZ7
	 HOggBj2FCsAEWf8u+7NtV8b5pi8z8EC8pVFosiBN/XcanmYHaXo+vFZpqqQJVOFBCmoKx
	 MARTPYSM591a6Hpxi+yanKTHjhb/eG7nvh1ztchfpxbz8M2qhCd0REorCUN5ofY5I/7eU
	 +EnMxcZaRRyGD+LAJdylUvtZ1bJ9E1e1EfGH7c6/Q2xjwdTlK+QxKiihVlQlfUGtecA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894398;
	h=DMARC-Filter:DKIM-Signature:Received:Cc:Message-Id:Date:
	 X-Original-From:To:From:Content-Transfer-Encoding:Subject:
	 Mime-Version:In-Reply-To:X-Mailer:Content-Type:References:
	 X-Lms-Return-Path;
	bh=SelY6loGjDsjq7wsSeapANHBoNBqYepjvmOSjN5Go4A=;
	b=UzBpMBoeEITrSxyRT8r6B7q0b6mAxvvwiPZmWEMpys5G2qOEK4/cyIB8EJEA1Q8fuf74
	 glXihUV7mGd3/PU1jdN+LE+qMeu+xVDGpw8q2j9OxyrB9YuhR3s0WVpGJj7zhtKwyzwSC
	 /nbXh0f+wdXAqWfS4leexthumBKJXisOgPD1YaiQyZNjXYQQJvh+pjRGcUIDasah3L2KY
	 23FQt1Bx2H3ggmB3PF4gkkpOB63WEIyThwhCGylS64jQqOw+tqjmgOOFmj+IckZJQN/h9
	 JH/a9aHqHCmdO9n0bgHQAhnVF7wM6JZoqUpb4I7mvjEMhqbM7lzw/G4rgqACjVxbNIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=uDg9Lnpi;
	arc=none smtp.remote-ip=209.127.231.26
Received: from va-2-26.ptr.blmpb.com (va-2-26.ptr.blmpb.com [209.127.231.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0651606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0651606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=uDg9Lnpi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794894393;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=SelY6loGjDsjq7wsSeapANHBoNBqYepjvmOSjN5Go4A=;
 b=uDg9LnpiFwfrOwLppREomLJu++FN/ku190g3AyQgBNk8kBzqWlCcpa5LXAtGFOYwXVUhps
 oOfsch14OD8H1juRAOTpM6d4s9v2P6GO05odec65y3ggjhE9KxYGUlIA3T0A/TfA2S0xTv
 M/1sfsQUz1M1M64KbSGnwP6og/HVo+8Rrj6pGVbEA2fhbdf6Q6QYY28gT5FjqOfcsx2if/
 qxXYKGxUjiyR6fhUw4IZ5Cp5SNLMADPn7r1CTskANvt82lxSLqczdXuF3U35C3eqeCMj60
 PhuSaBd8AbVVIqp3NsQmL7JcpGhcIc0eme7TH6ROtT9WSZFG+gKJoleXgUltGQ==
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 13:46:30 +0800
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20261117054615.1048836-1-sandie.cao@deepcomputing.io>
Date: Tue, 17 Nov 2026 13:46:15 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Subject: [PATCH v5 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
References: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26afbea37+b34657+vger.kernel.org+sandie.cao@deepcomputing.io>

Add the device tree node SDHCI-0 controller for onboard Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../dts/spacemit/k3-deepcomputing-fml13v05.dts  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index bcd533484a73..a80d32fe6f7f 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -177,6 +177,23 @@ &combophy {
 	status = "okay";
 };
 
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	broken-cd;
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
