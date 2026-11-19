Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104071;
	b=DIrUljjLjtjU+vNq5JGEvA25Sq+yuo1QwG38//q1k834cnKzJ9wOaSS4NoXNlo47NkS6
	 ym/O8vmwacxgOiwHWTVS7ZFSYavfR9QdokPtpmNHbAWx0d7oeZcBCjtBLmiIi7ua1k+nm
	 xDTDq+HzuoPr+YTJ2zpFA/ek/YluxDYZ2a1mBFFIoFhdanPn1aeUYGVi2q/3YtEKz8BZg
	 5PcI1GekbiAWy7dfJfyeSg88sSUGAhUSl3Carmfk43To87GF+ckYvMKJlauJWl2dcSyHg
	 xJeclpqYLanI5LJnsuIbtZS69TAUwlztoOhLD9kwF8BaaGq3f7IRMVKu5nX49WEkjTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rxJXN0Nt7oYy+tJJbFLjVXtftovgM21mUjgHjNU5vMA=;
	b=hH7mwQUG6a5nPV5e200gMcuglWR61GvkRbWfrDPmfTzxGjmB3pe9Z+njKJWu94tW0SiT
	 eRhcvvlXUIJzYJpWHdp8oSGTVBJd58G9gGLkHWdOt+2WmwjFLhamxaVioW/IXIgIdMxQp
	 RFoPTgTi2mIGW6xdKsAOdGd9cuo/Y7nwWztcAwg5Q9i6e1UiR1vmL0O+ySwTSfBjTo9Aw
	 WLNZVjKBB2j7o7s5q9xIfiHTTdllYKZOss4DKTSuHHJ48CwFmRtX8mMSTIROJ6P7qJ9dG
	 DDwM7s4s9tLr1NWGFOwSCPCYCTgvGyAPk+5szcMCGasOAOiH29EwhH8BNWDsUY07SgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItrzpJFM;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219C960A260E
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219C960A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItrzpJFM
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4aa5833c263so648594f8f.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104068; x=1795708868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxJXN0Nt7oYy+tJJbFLjVXtftovgM21mUjgHjNU5vMA=;
        b=ItrzpJFMER7TegNHmJwzpdFBFDSX066KTQfL0A0PwVi9Q0A5xOJndjwsqfLqwHV9MY
         Hrgl6sYP7tzmgX2FUkaw7oxQub18bMq+07YI18C7tiicy8sWSzLaE4CXSNod1ck1vdwx
         b5AJAchkIZw6Kka7su0YWddezeh7lbUCq8ra5qwXnM3hbIGtZQ/yeSw6x18s+CVLCa/s
         +YozvfS5aeqDfoUBNEqZmGRp78e3+Kyn/RcvnXBK/lXj6Tm/71XRSpnK5OwXZb3HAMG4
         t/P3V4VB8A2oIUHd2o8kEbsiHDyNQdDXzLYtTbm23jvQTYHPHuMxCt89xUfJMEc2KWCD
         kyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104068; x=1795708868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxJXN0Nt7oYy+tJJbFLjVXtftovgM21mUjgHjNU5vMA=;
        b=uzIxrlIznt00RS1PPkM7hpHnwAbr/XT5+md90GD3ED0Nf7o3fUTALnwqd9ra/JNYFz
         LadsEGbsCRrkoQbqrLXdgM2R/jmH3SvhM0UzJoJVU3jv6+A3vJB64K7x9f1V2pmlBkDM
         1bFWJBi/daqSx2JKEvjAnslL9rDrXxzdiT0CZ3QZjteipbLXZIDFOn31U9tfAPuwZy0T
         6LsUZUvbihPUkBS3jLhCMPVPrzyvwwGzI22gK8zaur1Qp1XnQAqBiDydiEjHz6dC0JV+
         JAo5luhKSt4AnudCHqqIVhB9Be4+wNtFAkfpfv/icggsA9J+85meeCaBg5JjcOecsy0+
         xLtA==
X-Forwarded-Encrypted: i=1; AL+hErE3KtVRBPQnzFQyARIy4dqx7Y2B1KK+5GeOJxmnlpmiJaPXlsarZTFtlo4FEfoKtIVuikEzILAh96cE@vger.kernel.org
X-Gm-Message-State: APuU4Z/5XCJatez9wgoZ2h5n2pRhKddTL7dezo7WpNBQ0FpeHqr8QAym
	xawAcX0CIZ1B6JiWtAWGj+Gc2zraB7H9eyJ8OafJd5yZLu9kcJzdPaYup+SaTQ==
X-Gm-Gg: AZFdTZdArEAkhoby5KCB4Y+fz+5fFenXQL8pxX1R5A8hvgDMlS9SjkpOXtQw9DIsvrZ
	TILu6R5zeWm19YE3RAICp2FWX/gq19pzpKGhPsCYSkKrspxs8DUeiBvA5kmmEo2D1C/I3SRAjnD
	bA29rsHWWcapoLFPgn52prHF0oBk0v0R4wRCd7FS4XtJwSglc+Lun0Ez5jNUGRdw34vbqIEqiWr
	D/ScvYvLOQuI+0E8illbmbnSQ1fomGQvbjnJogdr5Ge4tu6I1Gt2AX7mpOTnQjDcHDRQSi1iLHB
	VZhn1PvhI0poPeK6I5gmOS3Fyx724Iu4ZavFnSohQq5DqcmwkQNC0XuzCu1BnAZmdtEjLlwWIFH
	oWHPvm2VhKU5thTk8zBFttjtUf0nDIK+1vo3YU1FL7Es3ap13a5TmI44bwglZo1uKxSmlh/y0zy
	LRBiQTvWfPDECrBBp+J2aDPwDzqElDl0lDW8poK7XWoGzRZw3hY4HML67VlfO5umVrh3g4kQc49
	eMrlHHPp9liuKeW13C55AQlIcUzpsfS/5LHe0HzcIilrka7A/bBmRVEkqyuKaAXUtD8dsRGWMTE
	Sf4QbPvHcTd/bnLj62DgrYnWMosWYb3gLW4NeQVOI9hlKgnUB/PumAYpvCxIbVsNrc2hOGVRed0
	hOZrDUstrezxgo2Yxj9o7ZbWSetFCz8bG+1Rkl5PBQqn82mz0/HaquHg=
X-Received: by 2002:a05:6000:2403:b0:4a6:dfe3:fd93 with SMTP id ffacd0b85a97d-4a6dfe3fecemr11577697f8f.40.1795104068125;
        Thu, 19 Nov 2026 08:01:08 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm323784f8f.44.2026.11.19.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:07 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 1/2] arm64: dts: freescale: imx93-var: Extract common Cortex-M33 configuration
Date: Thu, 19 Nov 2026 17:00:53 +0100
Message-ID: <deeb0fa8588673f063b14c34a7aa59efb1521b39.1795103362.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795103362.git.stefano.r@variscite.com>
References: <cover.1795103362.git.stefano.r@variscite.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Move the DART-MX93 remoteproc and MU1 configuration into a common include
so it can be reused by the Variscite Cortex-M33 overlays.

Keep the common file included from imx93-var-dart.dtsi to preserve the
existing configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v3:
- Split the common configuration extraction into a separate patch,
  preserving the existing DART-MX93 configuration.

 .../dts/freescale/imx93-var-common-m33.dtsi   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 15 +------------
 2 files changed, 23 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
new file mode 100644
index 000000000000..de0e56f322a2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M33 configuration for Variscite i.MX93 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/* Use the reserved memory and resource table address from the carrier DTS. */
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1
+		  &mu1 1 1
+		  &mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 69495bb7fc9f..4ee4d74cadea 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -12,6 +12,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
+#include "imx93-var-common-m33.dtsi"
 
 / {
 	model = "Variscite DART-MX93 Module";
@@ -54,16 +55,6 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
-&cm33 {
-	mbox-names = "tx", "rx", "rxdb";
-	mboxes = <&mu1 0 1>,
-		 <&mu1 1 1>,
-		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
-	status = "okay";
-};
-
 &eqos {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -221,10 +212,6 @@ bluetooth {
 	};
 };
 
-&mu1 {
-	status = "okay";
-};
-
 &mu2 {
 	status = "okay";
 };
-- 
2.47.3

