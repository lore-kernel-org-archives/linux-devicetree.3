Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BBC4CA288
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 18:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031482; cv=none; b=oMSXnAzApj2CUkW4lFVssjJgSGJDxmwhvIg1V1oejnoRVtBrDcvs6olVJfpcr7l67Ilra52ELDS85i5/Ki2zdCTvYKnjYVh0G6UJY6vre25Ov6BC3vDViAdhy1PpMEGeP6mtQX1w9Zd6wO0zC4B1Jg8ZcpHlUfu28Jvvv2dd0bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031482; c=relaxed/simple;
	bh=uNbI68quCVhemPUrUjI6ewPk437iJOJNtQjYHPuptSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jQNtsxIcw6B59eUZGpTyx55iQYGPrEb8oWfqvhPNZbDwpDki02AHAnuq62FirEHVxdvMavnZTIEdrXqvomK8opz+ZutyCVA9aFnKoe8ihAJHDyBGdLx7R+SyC1wdzcRPU85JqWxQRmTRyQaOwxvOQTlK4MC4dEIB6fD6jn7tKRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ccCzFLQQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ccCzFLQQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso42370705e9.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031478; x=1781636278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=;
        b=ccCzFLQQDoVTkdqzn3TNT040nH4Nr9C8Cvx84JIB2mbgO/B2O6/QxV06vGfpLRFVRV
         fiGQ/EU5aEc6a3GhjnV4+zw/PVSY+DFPsDv7Y/Akjf1ThwWYOpLx4vvnvEj9TR0+NiiF
         SzjKjSH+5kueBee7FbyowenIelmXB/+Zu81DfviCOcICrkL1W4jWr1rv6KWWp+kCB2ly
         70vHebGb/qhfW5ZD1YCT6mwsjs5CQXg10lEoK2RS6F5vVGaYqFe7kNO5g+ReWivdyNeG
         AE60WKbn7sorzyyjSABshRLLoUzzUmx3ZDPpbT7OAK3ytLLNqzFjlvXKKROREUer56FI
         ZaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031478; x=1781636278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=;
        b=hUNpXGcF8XlPiIu1IGBzd4oWzRUsi7++cn+23Ctkb0C+51Da5lZTQrcLlSeZc1wbou
         F4ibb0rx2ylH/5bUqb9J9CvlGlxQdQQUxdkRUeWo6i3G/SXtlaL9dhjE8ixsUAuQx3K0
         UUkgwzyrqxfx+HnfwW9yEDemu0xOqv0y7YMKZUEVnylJ4lTfRjuDBloKg7uONQD+VK+/
         qKmJA4mpBB0JNkN1a8Y++D+le8GUdDPQn/BYJ01rlqhm2JF+atnM4zHPKlB1dZegN/dE
         y5pY7MWXHnQjL8+FzlCLiyt8xkVL1nt5BYAPqbTPT4ENru7P4zDQWN4VTqvWiUr3v3tK
         jnkg==
X-Forwarded-Encrypted: i=1; AFNElJ8u5+4zsa5KhVGSP0bihYFN6O8F9pf06SXuefP5TIs6iKGiw1kqaSfGHOUyf2Y2VIOzVOGTkTVXgNyE@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvPYccSVsAqQtDEyMNBIxkr3OGgyFzolhqHWguNFPVe4NccKr
	6ZOuqAc1EcDn37XLEtotSCMk6lbCgeDw+23ypoD8weGIvhVHvOXtjhUxLugO6gN7LoE=
X-Gm-Gg: Acq92OEMpk+tZYvf2dL80/RmOq9zqk2Wh8k1A57GkNzOEvwMFEoXd2Dtimj8NB2+mkG
	otxGH1HAQRgnwXtI2kgcBVzyw+x60UCH9TXZh79OMfNEq6ix0AQ5VOk1Ds8B1Z7L62hoRGuPW/c
	3tAm/ePp2UM6alFg4O1EK3+xD4itc8dNqBjaJGuvGwkg+/uD6XFaPW/sCsgcVKN9ZQTQ1Z4f/99
	QiGLBJ5Xxt0gG9pbHgw+kmF3NeWRKgZMCqavOxfWKfJ5iBx/CpuxVLbUZ4Uee0cC62zQJmjA22/
	WsFeXt5HX/arm6IX3mW6xUEVcd8jp61oh8BPwPDhE1hQYxL4JNktGvVFgZQzx3HXsBl9PsWNfEE
	JfVdNQhz4VR/TVvbuhFrv1FVld95yeV5325Mfr54zRHen8KqAp076WfkAGlG2qEwhvHXAurWq60
	tzQCDzCg12k/11s4Yh9ddoeIPHCU5QgGE=
X-Received: by 2002:a05:600c:4fcb:b0:490:d354:d15b with SMTP id 5b1f17b1804b1-490d354d32amr103004255e9.29.1781031477905;
        Tue, 09 Jun 2026 11:57:57 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm532638485e9.1.2026.06.09.11.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:57 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:21 +0200
Subject: [PATCH v6 09/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split
 r5f memory region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-9-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=msp@baylibre.com;
 h=from:subject:message-id; bh=uNbI68quCVhemPUrUjI6ewPk437iJOJNtQjYHPuptSs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJMFXZ+pacm/OZbQ4f/QOa2PlGzFF428M5098WJgfd
 MGL/41IRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEzkFBvDX/FHq17fXqD568p6
 jwnZT9mV11fnz81kfN0uHt7eN1fusCgjQ4OyUO7TbT6+G+1OiPw6+/y/1Z29arqNErWz/zmmVE+
 UZQYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 682b1c9f3071ddf23044c1fde1e88f2b901ec64c..fe10d3e75ceee35f84d34b892f9925efceb7743a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -36,12 +36,36 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 		no-map;
 	};
 
-	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 		compatible = "shared-dma-pool";
-		reg = <0x00 0x9c900000 0x00 0x01d00000>;
+		reg = <0x00 0x9c900000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca00000 0x00 0x8000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca08000 0x00 0x1000>;
 		no-map;
 		bootph-pre-ram;
 	};
+
+	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca09000 0x00 0x97000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9caa0000 0x00 0x1b60000>;
+		no-map;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -78,8 +102,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	bootph-pre-ram;
 	status = "okay";
 };

-- 
2.53.0

