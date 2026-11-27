Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781963;
	b=Od/zr/4A+M3lJ2msFblEiO2imTHpRLkDfwOpd/7+PRL5Qy8FDMcoMvD8k4BJXgRAj5L0
	 c0HXdDfSJgCni4EUW4iEyBjfXxbHpd8ft/vZGQ/N6KJLza55j+vfjPOwwPxtBMnNEE2qM
	 dj56sCa/11jAOTL+m0tXsBAwkhKzCjmS6M2JjF7N6kOeX0FKLY8f/75lHZ5oWmPDLpXfK
	 X4e4vOegOSIf/AK2vDHfdJygCvVQtAvfNFB365C4wduaCUDC8rR95Uul067JBEZpu6fnq
	 NilWn/fEuFJxY/KlpyqtZcgc/+Wy7X2uN96VmfvVUNvn4Fy41TDKzN+igLHJ8TIO9Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=;
	b=XqyDm66ErKG96iCXO9ZmaOECThfIETjnSwPuRGCCCmigFO1frCzT5CIX0Jrvam8lxLjV
	 lFlwG56gwgpJl0fbWePBXjKxY2vWXzx3rF/PSPq7A9Lt4dySk+oyaSw+uGDsrlbnULRv+
	 itqTJHIXqO47B6tJmt/Jd4ZKIoDCn/F19GL6iW2RR99wmdx9uGZEuFDGtnNlVUGd04Ygg
	 kWBV+4tsyXTc6pmRfwXWCJkbRHJcnY0Nl9ouIbbTkkztOiPAS4i8QaIcO3Vn+X/KzBDWC
	 nwI9rVVcbEnUdUY6vHBZbDtEp+//jeCYBZqdU/szS1f9nXFB6Lq5SBbQAgYoXF/g7Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Dbs8B15w;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4FD606C6C8
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE4FD606C6C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Dbs8B15w
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso62355655e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781961; x=1796386761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=;
        b=Dbs8B15wDQXL/Q+K8BykZJHcbFbvg3b30M+fsU/e9aYvv1qvCjPAJVtcmwcgsUBmkt
         UOBZmmcytY+/yY31YseBCFY33BhBHE2iFQ0NR5Q8q5wkk9O8ToDSFTdPz0yS353J0Xss
         qYGzL25GQ6NC76NdGdbi4clxc3n9t4HQR4Nsj37K/frX/pBRn3TBfTUlwMq5oO8w7AfG
         fwz2ny+xEoAgkO9IVsc43XvF63xyBSbEy5+4iTWHG42c87k71Mnd1artF/HyCdOPsiNf
         rzuukal00S+xnXTK06V2gWj6i6lo+iF0bnJmCnWq1kV+hEOiGuUP/0eA8NQQ/dz9OUEv
         rs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781961; x=1796386761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=;
        b=H4G+468+ScUfidAHuKdAYZcNauBuFwEjexA2qfE+acvEe+gM3jpV42GdFmyms0K/Bx
         cvfbCMWxIwVAC/hLL39vbtuiVBuseM0ddT8F1ahmGI+Mu3e0MH/52UWjbFZUYp4GvU94
         yIHRzsJhS/NUHQe4nPK06mX4+Iy/B7/IrOVPG6F+Mew7mw/g2de7Z+0mGQH/BHfjlR6c
         UOPpaxL1/WsBrz5cJ/EhteYIPu/Z5lVPTEaJYge9qQtfbIb3v2+H/6wJnD23qqAkgwWN
         wbyv4WNFOWbb8MJL7XwF2a8pRMXi1bucStMHSshfMoLS2zWu8RtqU0QaWDfHlYmBrBUx
         Z6Xg==
X-Forwarded-Encrypted: i=1; AL+hErGPBhZaKQKp6TRmQZfIGMKGS2l2pT9GMu/ZAAcQ9ibBLfJKLZSV3g+YhXEQKVNHPOub3yep5nbj0hDJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+ti3Ip/+RNsnrX2ITZbQLZ/p8nGrZJ+dS2pr78oczPtiEmPTlK
	j+6+Bl56aN93o99HDss3olU/Oh7rNj0WcjYil3I9Jk+SpmOifN2ZgU7TSXlvHoPHOFk=
X-Gm-Gg: AZFdTZcjlpwvRECVE6+uWmAa8immfpinalFcvH8kJoCPvG+lFOPcSaXaPhgtKKh7aIu
	OBl3b4tgVh0aO3VoU0kwd5Uu8jDTbVxD8n5uWIGgo1TPqID76WAGIUaGemefg0l9dcXwyf+R3qx
	LW6Ut6oIRFNPg+YI9zqc1MtMTSz9VFuuwkSoOTj/uU0nnvpu+rkONszKi1ML3ki5TBIQQ6y7SGB
	zZ0ihkvb2pxhuX5Jp0MBiNsJrUipZ0cuQN+XLEbgx29MZHspN12Tgm3/DpUT8IQ5OMvCFSw+VxJ
	wgaayh1k0gfWHz28RN0kOQQZ6rL6yP3EVmnQ4kZxM99LZZ+oXEJqcAO3XibdAqLD4xLlCyB6z1t
	FP9MajshuYKzT2pKmDtEbmjJES90S0ZU+ngoM5zqHBi/rEtXbUVDrhNT74kIZGFAOi2mpm9Tv4S
	/f/AL9YnH0MWVsvjgYzvflQgM/XfKH/F5UbgQfEsp3mBs2Ls7dtgAZFlZPOTVXeYBDYXdczg8tT
	Je2gwVdOf1lxxVwqI8PeKqvdlotoEVTqXF4AoCzcdhW0sEoXhmEEsL1cmzNZSTltB6wPy31CJJE
	p/tS3VyzZ5Qj5xzL+iMM7daEs8vkF4rkSsYg9aGjEQnqlNntUQ==
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3b3 with SMTP id 5b1f17b1804b1-4bb8881eea5mr489175485e9.27.1795781961245;
        Fri, 27 Nov 2026 04:19:21 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm451150685e9.1.2026.11.27.04.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:20 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 27/28] ARM: dts: broadcom: Set the DMA flags of the HDMI audio channel on BCM283x
Date: Fri, 27 Nov 2026 13:22:17 +0100
Message-ID: <20261127122236.4976-28-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

The upper bits of the DMA specifier of the BCM2835 DMA controller carry
per-channel flags, which nothing uses in the upstream device trees so
far.

Request wide (128-bit) source reads and skip waiting for the AXI write
responses on the HDMI audio channel of BCM283x, as done for years by the
downstream Raspberry Pi device trees. This reduces the bus traffic
needed to feed the MAI FIFO.

BCM2711 is left alone: the downstream device trees route its HDMI audio
through the 40-bit channels, so there is no established set of flags for
its legacy channels.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 39eea8ce1058..77c7c13014d2 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -4,6 +4,8 @@
  * bcm2835, bcm2836 and bcm2837 implementations.
  */
 
+#include <dt-bindings/dma/brcm,bcm2835-dma.h>
+
 / {
 	interrupt-parent = <&intc>;
 
@@ -130,7 +132,8 @@ hdmi: hdmi@7e902000 {
 			clocks = <&clocks BCM2835_PLLH_PIX>,
 				 <&clocks BCM2835_CLOCK_HSM>;
 			clock-names = "pixel", "hdmi";
-			dmas = <&dma 17>;
+			dmas = <&dma (17 | BCM2835_DMA_FLAG_NO_WAIT_RESP |
+				      BCM2835_DMA_FLAG_WIDE_SOURCE)>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
-- 
2.51.0

