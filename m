Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF5644C674
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429330; cv=none; b=U+wFjGz3ri2O432rAnaUkykYy+/cS0x0UXLNmLuNfg7CXWO73OKoCuW65YjxRqWGD4+0OT2eiSdGFyGruwsyzE0tfVXIn+M8MbXb1QfMxGGsR/t1AuvRvg6WwABb0FcG/SrrrRuIHAqYYFMy+ztWSwboA9tDBTH+4TFOpO2dLc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429330; c=relaxed/simple;
	bh=8yZPGfKuz/cimxOrEnowvfRBLrOfYWWMq5XiuETxLs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4QelnsS7IXXE6ga7PbBrnVbrS+fkGacZe4tPkeAKN+hlOCWPlqiA8xEiHtdIFnRmUFPDK8riUsQXGs/gbflw9CtVJ/4w1t29TCEA/iMH3CdKClTNEcKGlMOqwFthkqxsGeps58lvHVnMdUHoVKl6xAIvAoFYc4NVUaSKE//bpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvhTPryt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvhTPryt"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47640541585so1764388f8f.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429327; x=1786034127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUMfJpXpxaZ+31yr2qH5Wu7mIRrK2wr6B+Y3FcFImbE=;
        b=QvhTPrytozXU+SSGw0Fm/6qHmUdy12VY+4rYKc2L29iruzIdjjSa14YljM52Du9F0u
         Fm+Sn/F5ddESbzIQUMdzE+9HyjidJ8Ae8nL9RN356NFr+a4LMgoDwsDyzlBuVry6XMSB
         NqY7wRoAZKV9scyEmq4whEBoJzm/wtuS532NBmhpaD5Isv4S9z3lOp8ocLM2aP8dhcOv
         k9p8FpWmxpRTAulsWukbuTzUJfPt3VsaJNpsXVCL2ubxmkcNnT2kSuoR6ZbXUt0RfY0k
         iIasOkUC0hclgO1n0GuTyoIQC+O1+L6pKHbJ58da4MEWh/L5mfbQSigDTQzKPQ81hXzB
         0Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429327; x=1786034127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yUMfJpXpxaZ+31yr2qH5Wu7mIRrK2wr6B+Y3FcFImbE=;
        b=HccKWGlRAV7VrYE9eIGAm58y7GDinf3EJd/cmIK+6vg1gQZf76x3SzmQdkKaE5keBL
         F72BXtaVjVzIkultGYqit8s0WyVqLQ17h46evjrNRkAzgs5CU/QC+WzhEF3QKK5MN2qk
         SAMYErqjJr4RbI+K0eNdEp88W2z3c+/+0E/1aqEMrcC7bsI7QFbiU1GVza0yBzkcnOIr
         MpOSYvXaO52GSvQ05IsKSjfnG9VqB8R2/t9uhKG+D5jtqeC0MaiuAa81TXU4rM2J4jLK
         bYdQaC5jVfUx4zcf54cpp03dMRWJ8PSQT6e5khK31NzItcFaUXWZ3WwHZFzLOFaz8Cqb
         Ca8w==
X-Forwarded-Encrypted: i=1; AHgh+RoPYribvx6Cad0pgpW+ClkQ4/dfDlGjOHuPfe9R3puF5tSo7rAkDk/axWladPfChr4o8Dh1dtYMkdDO@vger.kernel.org
X-Gm-Message-State: AOJu0YxN7M/hcGhOuB3Vw73d9QwzJF2zg7y3knZIHv/WB1N1j7qAHjR/
	tNa4FeWbHz6fXUYlh0Rb9d4UOcbVI/SzxDvrLyep/UJuOE6BCLKARVQl
X-Gm-Gg: AR+sD12PPZqCfE5xloHJPpffYAOyx35G8NqWU7JpZt7I6b4uq0yMugd5JPy2NvJVQCD
	NLHSLMu894Dyn9DtcdG2QLqlduyeMAgEht2nl5whEBKMDDx5hm0UkfkijEY1Nxs7YyX4YIikTts
	oLpTGrGQAsnmc1FMkXYeDfMr3scRLVwgXDNFmlTpV0Nktcsw22UKiciqKcbB8ZEB1BlbdVbh0XA
	TndjJpHbkRxJ0hJFIJYyDzWOIj9wjHwTwzNy+42CY4tI3Y6VYDB8v+MjRRPJJGJ17yrKsSIViPM
	tbciN5IiN2/6MC8xLv7ML5YQ951h9C6hDzUT6Z3htYkkzmh0KHxKFdskseZ0ZkaoO2JqJhkXkqg
	276vSnjRQf0FSc1Y/8Tf0EIedLjDPGwMvRBi0Z2wqv1A4Sgem96KArcUEixOjhMpgBGCj75FJqq
	cYPeccVy67RexfjdYnqYA8mocEZOMtrgRtZ4UWFpQOnBcq+F+jGEV5HwuwPuG/OT9+2lh1cXQoI
	NhJnWpTdN/ZuQ==
X-Received: by 2002:a05:6000:250d:b0:472:3090:d878 with SMTP id ffacd0b85a97d-47fc81ed0efmr4793087f8f.4.1785429326919;
        Thu, 30 Jul 2026 09:35:26 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:26 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
Date: Thu, 30 Jul 2026 09:34:11 -0700
Message-ID: <20260730163412.1145-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Remove some of the remoteproc reserved memory regions, which are currently
not being used for anything. These will be added in the DT overlay
enabling remoteproc support for this board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..f9b0e266754d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -188,16 +188,6 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: memory@88000000 {
-			reg = <0 0x88000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: memory@88008000 {
-			reg = <0 0x88008000 0 0x8000>;
-			no-map;
-		};
-
 		vdev1vring0: memory@88010000 {
 			reg = <0 0x88010000 0 0x8000>;
 			no-map;
@@ -208,17 +198,6 @@ vdev1vring1: memory@88018000 {
 			no-map;
 		};
 
-		vdevbuffer: memory@88020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x88020000 0 0x100000>;
-			no-map;
-		};
-
-		rsc_table: memory@88220000 {
-			reg = <0 0x88220000 0 0x1000>;
-			no-map;
-		};
-
 		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
-- 
2.53.0

