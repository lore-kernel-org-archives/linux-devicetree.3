Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB5C52123A
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870069; cv=none; b=e5vQFQtt3CvpMttUn1Zn3pZBL4jz/JBp4QNALr8BpD88UOPyzyn7csfxh+qKezexviBUghI4kUr1vw+TW7RbHTlnr9BDhVwgyIOdQlFT1kb9DcSOfleD3cgKHyTiwbqgUgCMIKV6H8Q0cm2xSLVXgSSHnPQTuE0X2f6QnAy6bbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870069; c=relaxed/simple;
	bh=CSaJsaAhehHpcrg1vb5EWLRi8QDNWbVA/UD7yN9V9Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tOD/GJfXDZlQEiv7t6KfsZNdWAoA3WO0HRgI2uVzvjQfSrIEDCzNu0amadBFvrHWAALm8w6Y8QTaUozNRva1VqXeFHNpP4V3D/wC5vEiwR8qXrvt6ZuuVMY1uOzPYkACbKyOwWby0XmeLSzvxBQvRNY6pd3sUQfGG+G+VQ7PY4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFQGVmMn; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFQGVmMn"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so2466838f8f.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870065; x=1791474865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgvDf4RLDng0uvipLWv31zDG7gco8OVe3xdb0OyCHis=;
        b=eFQGVmMnwnCbHwxMhNxjFWBnxpKGu80Y0lNEwJKGcCZHb7bI7RAKrC5IFEGsfpLYjI
         6HS5PEMCWidqiF5/xTyTptjNcVJeTlmknjtMlvnuP/82NCj/sR2xOu30HLOZ3HCYTfZY
         rGwEVs57nESsdtS3RrRya0HzyJfw8xGnXjXD9AZXTS37YcBiuggaKeGnplO67YMBwH3q
         OKH7fpgdYprFMo3SNyJ5E8hRcE8eNFhgPMa56VV6G8qWypwCbEdsXMjiDMIdmxknO29U
         qu9k5hnrUYELmAY9CHOs8YYX4e8fLBi56jR58xTE87yxHHQINYxNL34HPDl0DtKf/jQC
         YhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870065; x=1791474865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgvDf4RLDng0uvipLWv31zDG7gco8OVe3xdb0OyCHis=;
        b=vwyRzTZmamwZZO9gFSF18wQM3KQjLCUYZv4LAWf7lF62B2YRyYPBIKRJW+IEAH4LV+
         +irBy0DAs8GmO6BBh8H8xkHeXjQxfqhI2lI1GL3QRhdxKIQoHxA/c+FdXUfrL87n8NiD
         W0X7PNlXK5xHRs1cImgIMCQohKsnhWo6PvjR+FNy65+TqFToJRJak6xjCNnk8xhUkZP1
         9j3HKYhY1kv4uTRV7Il0l24mlaYJ4q3y0HSga+Z63lVlnYhKT1FlEkTjSZChgEwT+ITy
         3fe266WHb3RkskP3X+0WVvJ1t0pVTO2rB0KxjjzGZnSgVu2rnCKE1KijhelXqdr2zCJi
         nhRA==
X-Gm-Message-State: AFq9FYIegVtf80Ph2muSyu3essw2jzITIoZmCK3Ckq3fpr8MaTDs3dXi
	TxLeeCZBlE4yvgTuRD+X9qVeqtlRwcyiC9zqzFAPih+455Chn1P7cDK1
X-Gm-Gg: AYBFou2toGQM0QUaTCHrvD6q9q3D/uarCeEZalPV/cnYyJzXJZ8PClKXDWszjUtanFv
	lhj+ejNB0WvYey9v44pL1w+Uz6HRHx1s/ZjlHHQHTOBZSZeApOJykFA5S8i8SxZ7xz2wBEM6iyn
	ri/pq0BqGhKxmf4p9jgYCjY3oMNr/4hiaE0KxmbLeDWrnq3B9rlzZKBqNVo7JdQuuNENGDHtfpU
	h+B9PQaFx961jSvPmuPOGOEn/n8oIn0MZzTmgrEBsKQQ1hj1eUJt6ANaxrp3rkavUjQoBY2Os7J
	oOMmJzsJ54W2HlJ7kI9e3Yyy7moIYDfLXxQe6myKhYmq5AXrEPoKikgghIafKONBAHudGyi4R63
	raWyZ76A3p+NPrebhNn4eHzKutTp3wHCdplxIdKdj4/mKLnZbq+I1N5FXfqNAgVcbKHZm5CbMGZ
	cHSd+dUTC0JVI8SqW8tO9g2f5FA4GcrkDtwVvFnLgxZ0ymxZeNhTiGoCgjmnlLKSGXg43B61Yu1
	ys2/ckN9TjDctOE+vGqI0GTQ3PBtaVTxX0K8BytcBBWQoDnquLBEBDABxy/b7NSroFbuzEhe1Gg
X-Received: by 2002:a05:6000:469a:b0:48a:fd90:f254 with SMTP id ffacd0b85a97d-48b1272a07amr24159f8f.28.1790870065261;
        Thu, 01 Oct 2026 08:54:25 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:24 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] ARM: dts: imx6q-apalis: Add HDMI Overlay
Date: Thu,  1 Oct 2026 12:52:51 -0300
Message-ID: <20261001155412.3177428-2-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the HDMI output on the Apalis iMX6.

The overlay is also combined with the various versions of the Ixora and
Evaluation Board carrier board device trees to provide ready-to-use
DTBs.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 51 +++++++++++++++++++
 .../boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso   | 13 +++++
 2 files changed, 64 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10c..32d77a59c4358 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -59,6 +59,46 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6q-apalis-eval-hdmi-dtbs := \
+	imx6q-apalis-eval.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-ixora-hdmi-dtbs := \
+	imx6q-apalis-ixora.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.1.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.2.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -183,15 +223,26 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-yapp4-phoenix.dtb \
 	imx6dl-yapp4-ursa.dtb \
 	imx6q-apalis-eval.dtb \
+	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-hdmi.dtbo \
 	imx6q-apalis-ixora.dtb \
+	imx6q-apalis-ixora-hdmi.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
+	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
+	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
+	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso
new file mode 100644
index 0000000000000..592bd366d94e4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable the HDMI interface on the Apalis iMX6.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&hdmi {
+	status = "okay";
+};
