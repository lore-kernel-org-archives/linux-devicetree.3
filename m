Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C444D8DAF
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659490; cv=none; b=c/b23uMkIK/VTtespELbpxlmbI2Ur98W4zeDKI3bCdJMYE1QwQtuNWEh7oFUSjvbyRIAJE6yMNSbLlbbwQQAjKY45lH0TqB3bezplfBUhNtOKYNYdrEGcc9Nav4mExEBElwCnmvf6yC+gH2/CBlSlhOFHVyRh3o9Dx6vlAwa3XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659490; c=relaxed/simple;
	bh=+Z1AS70xH1g3nSzkBrXOCRlYByo0ZRJRM5L3O1Uetbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmE1qoZjI9EWqWkRnC1z8CIh8uDLSTtigW8mLlPN9V/vCqk0BmdKjh61yR23qt4IES3WsNCYeLkCPS6BLrRj61GdNbexTEN55kjN9I265LWy9ogVpp5AmtyPJqa5dBFTkBn2+3cUhOFaXs50sn230nldE8hTMKYeNcUpfVobf9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MC8vsyJI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MC8vsyJI"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef372c58aso1076544f8f.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 04:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659487; x=1781264287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/bPH9nJO/zmP9XNA7k/eJKg93awmo1tL5WymrDFCak=;
        b=MC8vsyJIXiengRbrk9JXU8f1ik06fzaHPO0JHhaIBvVRIQb6nUDC/la6jzm462ugOQ
         IQUxmVU7vemQKtuGIXmh4Ap/fK1msGZW1/WCocJ0SPQn3p3uxjpIw57HldxcrYNk+16k
         leTkQp6QSue8RiqvgB2I72HdhTJQ2JDa+TAq/iD2wECvuWUGXAkMwGNz30BUA7uhwmh5
         tXNAC1/zXM3u1/60GNfD4xbhQPL6dIN9SAKbi8kg5YqoIeAUWvJVnt6N43ZLiBALRcn+
         x8jLzoMLGA/UMaO5WtLMHThASlG8C9TYMXI2dKIKcfr0FyRDyUwhZGaM2s33Sk093Bkl
         HHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659487; x=1781264287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/bPH9nJO/zmP9XNA7k/eJKg93awmo1tL5WymrDFCak=;
        b=prBpPhatP5rUOaEo7dc9woi8Ed5goZdDIYmoWLWEhnneZ7zmV0+7m6e7oB26RFmSLb
         oyR4CIYajxDhfdHB0dwB5jexzth1cb4QxFMCo7aCycZKJTv3fxl2ymU+bFtCY2IZ70fw
         fLLW3NRRagV1+6yJbUFmE7DJjZglfbEzRsWnecKz5Is+RxAUjglm45DtDa6Lz7CYs0xA
         qatrHAk+C2zUUr0hWjygGPJoxd1MXBDgB9zZvj71/o9sw/oxTnU1XzS1onKm85ki0tAM
         iDreucsbQI0fi5Mvu6YREyi8MnlxHJ5JY97GRbq0wGDXgQcmDpbP7nnFBAdm1YXYEINw
         gIWw==
X-Forwarded-Encrypted: i=1; AFNElJ8NyjEUOFo/h/0tXfBv4Rxpfl2VhqyH7XCfyjPqWPtwr2kE04DWdN1f2KjdyRisvO8ZFOM92KKacDIs@vger.kernel.org
X-Gm-Message-State: AOJu0YzRZHvD2oztp38n0zCzaiBnN5aN9ojMVxcBEH+/f/A7e772fKM2
	+54MgX+X1Xl8bpIB12pn955ZU8Wfw2W4JFHjokGVr4fMAmlHqekS+G4u
X-Gm-Gg: Acq92OEBY3ofPQAB5W3nkaBL8j29d/wUh0gvzA/dOekPskzBfbAYEiFAB4q10p/2P+T
	AIaUEMFgWvPP8JuNBgPaYLVMr3kR4H+hEkA+Y71dvZadHA6zfv1rNo7C8Na9YzlZj7goc+pR7WD
	uB7URvMXDSOVOUs0ERZzB5Jl/VGd6NgXn1LCJdJ+ptr/PNwsJG34+tUdoULwg5WI33wF2z1ZGTh
	WTIbjF5QDplaANzpPWNL1E4BYAIzSWwrjyC4vSr9FMHwzw1LnHTghmBwN2u0KrTtaFGA4r6aHkw
	yxrXWinRGM/qR0/boLD3gCDH67iJRyuMlh5PKnbRjA8U/odV0EhjBbRR5KeJMD6Z0SgSJLNWV4b
	WzBFOAjhgrmRkr2bMOGSZOEH5TQMu7iKuwhjkWrrsrKiAVygT6Szhtnncm374GzU9gqjst3E+1G
	KCy+CPN3AooKgtxSZbE1Z58jm1aAT5UC0EZktB8fHChTrT9QHgoZz86qtUFP70
X-Received: by 2002:a05:6000:2081:b0:455:fbb:28bb with SMTP id ffacd0b85a97d-4603075f442mr5402974f8f.35.1780659486770;
        Fri, 05 Jun 2026 04:38:06 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:38:06 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
Date: Fri,  5 Jun 2026 04:36:21 -0700
Message-ID: <20260605113621.1479-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
to be used with the mx95evkrpmsg system manager configuration for
remoteproc and audio over rpmsg-usecases.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 03988f0eae30..dba191a2f790 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -637,6 +637,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
@@ -658,6 +659,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
new file mode 100644
index 000000000000..bc02864c6f88
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ *
+ * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
+ * configuration for remoteproc and audio over rpmsg.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
+		mbox-names = "tx", "rx", "rxdb";
+		memory-region = <&vdev0buffer>, <&vdev0vring0>,
+				<&vdev0vring1>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0",
+				      "vdev0vring1", "rsc-table";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	sound-micfil {
+		status = "disabled";
+	};
+};
+
+&edma1 {
+	/* reserved for M7 */
+	dma-channel-mask = <0x40>;
+};
+
+&edma2 {
+	/* reserved for M7 and V2X */
+	dma-channel-mask = <0xf>;
+};
+
+&micfil {
+	/* reserved for M7 */
+	status = "reserved";
+};
-- 
2.43.0

