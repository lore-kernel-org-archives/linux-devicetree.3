Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599330;
	b=b5HebQ0RfRV4IEKNRPAn65CgaQlCH60GiDiovrt/WT8unOkAIhh7kdAPnYl6R9ptnl7E
	 hwzNfwqor9WOD5MvyMKjAhVzlvLHtzLBDMBWeeKtalI0dDc5u+B+vRKbWG+k5kwggirh+
	 pqxxbSDO/b53112GUSxbSge+seZvt+Y+TXl8FJAjI6CE8QY6rqk12/SzGLmu11fTXNC9c
	 uUNaaTdrRYlit8gJi45K0ZYPzFVrVE6tV9h1sCgpZJKnIU7vj78mfTul24xwUyrk2czYt
	 Im4+p46ejx+IC5GOhgQ3lEGtnoL9YitQ0ei4FfjKTE4zZDELK5xbs6hz+lIdNa9jbHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599330;
	h=DMARC-Filter:DKIM-Signature:Cc:Received:X-Lms-Return-Path:To:
	 X-Original-From:Mime-Version:Subject:Date:Message-Id:
	 Content-Transfer-Encoding:References:From:In-Reply-To:Content-Type:
	 X-Mailer;
	bh=quTJ/XxVKV0teBm3OuTXvbxjmUOvYB55/JlNClrvCTY=;
	b=sS4RI29vFRaeumqDirS9GI8LL3R7UrlDiZJeV8S/NBX12MHFpNEWNiqV0ihWkOdJI/RC
	 ODQelik+ohVIt8+Ri9EjLdTPTsqeBFHPhTJdfQrVhjwJ6ry8GmtGcNQ+nt5nin36JR/gb
	 QF2myWSNmN2l2wBNQQf1BI/58hSmCz1QDBx6UUJSFE47z1i0R4IELXwqQejPdVuoZzznf
	 r+xP+hrj2qbcfOEMBkWB3qg5u2yI+p47vbPcm/3qJbGBooP8HWn7H0urjCUiwholKtAxE
	 W7j9/w4lgCcBEoW0e2LcmfNWTVJ16RYHlfmjcZ64pGTfwXlgZJ/PpgOYy7E/Tr6BTog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=VdQqk5Np;
	arc=none smtp.remote-ip=209.127.231.27
Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A6A606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 06:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43A6A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=VdQqk5Np
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793599324;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=quTJ/XxVKV0teBm3OuTXvbxjmUOvYB55/JlNClrvCTY=;
 b=VdQqk5NpP+hMW+NVY/qJxCGrBcAIJqMGJSiGU2FYyU841PWHPy6IqYwur4ZCKXqJV7HauP
 LmVgqBTDsmy8YhOBF4RX8pLxfiRKNgFqm5GNJ3zV0CCfYfst5GgzWBj+TCp6XNAxcqJMVr
 2Es+9kkj1cnwKJhHnFB5E697nMX0fOdt4TENXjE07DcSEFb233oR9uVJLGnxCqiL6uQ+jT
 dGTNm5TxiyAXDS9p3Ais3YDwvICbhArQ4hPbGm0cWn6ww+m1Ze+IcOr8QSChZ6WGg0V7em
 nO0Kg+Y/47IoHXfjzbffQJfP4BqJKC6odZ9l5pih9EWZ0mIZ3jhW9IGogI9baw==
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([113.80.9.210]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 14:02:01 +0800
X-Lms-Return-Path: <lba+26ae8275a+1c6b87+vger.kernel.org+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: [PATCH v3 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
Date: Mon,  2 Nov 2026 14:01:55 +0800
Message-Id: <20261102060155.100679-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
In-Reply-To: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
X-Mailer: git-send-email 2.43.0

Add the device tree node SDHCI-0 controller for onboard Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 84f66dd8f962..4471338a9774 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -184,6 +184,28 @@ &combophy {
 	status = "okay";
 };
 
+/*
+ * Onboard SD card slot:
+ * Plugin/Plugout the SD card before power-on the board for secure.
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
