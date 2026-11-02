Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610454;
	b=YYNivcgKQC1g/LMI+TcVCjBYz7IcLfFbv53Eunk6fjr3tp063PQOfMivy61C8u+XRw7F
	 itRbwfHBgqOmoBzNcrEvyYqVRH0X76H+bSywIuGaj6cMsAs49B+LkJBW49jrseY3Md0/1
	 kt7dGHfGfH7VU2dnUXgpabWE01roW4BG2KuL5OSECeiWZnjtTd3IiUjskUIAI59FGaKbS
	 GOeOap9sKrLFMWFbfAREme3OvITrFQYfhXbgVPgQREmG3bL/bgB5nxTrmW3JxVSRP/9FA
	 Vpvbz5AodOwFx6v2wFgqdTwf2mWsfKC9yjIao96RaXmzH6odQ1oQ8Mqw7kgTbAhDcfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ca0mm6wOincCYsxFkpZ3alJVNygD9weGLU+HWZOKny4=;
	b=DNfXI7S8+lEhAy17OkaRsxembkPV1hD3+XnCcD4zXm5/nFq0rFkpuWrrIrDSTEFL5xc2
	 x3BYysxchV1SpaAW0+w31J7T4fI46S2NtmRXtHts6mT0IBhT3h42dvy0KPWCaZmoAAf1E
	 pbjucxt1jcnMoXguE+HsCwxlgEdG8rOAEyMHEwxFP0IyeHen5rU31jvIQc5Po1uovGBkX
	 44+c60kUUejpBpg0mIEWPCuqtaaImBmPFTPScbv7HwOlX3vCiNzyu7xUU3fixe8HeDu0Z
	 Z+D30Di9FSbfNGEcKAuDzINM3HS1TQFqIBTh6/eDUqOLXs9SOXfU0Ro/9qaGrtLWQZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PwPzx3BJ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32B5606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E32B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PwPzx3BJ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so15811255e9.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610452; x=1794215252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ca0mm6wOincCYsxFkpZ3alJVNygD9weGLU+HWZOKny4=;
        b=PwPzx3BJSz/awoGWU+IZ3UQnFFWPlLmyalf5Y2n1KQbzx9gJl1U6leoC9n0YQvl9Bl
         x0MuDsWZCQeSdGqXgPei4MFi+Ax3C9Av7eLm4GRkp4ThZe2QFIOO7C4sQw+S05sWgiIP
         cmyFfa29Mxb+CslnWdooX7DcqAbRr7Tn5x1l7hXZhI2w1m7FGd5nHk6u9nqEcx+gzHPS
         xJVFie1OMTy0c83K10SJ+8geGpkNd6Y+oPGiOItFLm4XcJ577p+yr/OYxNGUu1zyO+TT
         23ZJ43dTyUJEMKafAv8cYaF/6JV8s/fh2/prewqwjZwum4Xug77DvgMXXG25TG1gDJwZ
         L6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610452; x=1794215252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ca0mm6wOincCYsxFkpZ3alJVNygD9weGLU+HWZOKny4=;
        b=KUFezFbCyXeNvDP37rAzUO4++omAFahGnjXvMzifsRmuZ68lSglVO8JPTmEVNeJK9C
         J8QdbQUPyKxsPw3Ge2drZTXrxki2fY12W1MDXRG4BAYZ6pJBRuspkRjJf6IlMaHacpGi
         GtFxDHFPYckeg/ZXNPlDpLkWhciPvXG5OSgxNnmstnzeanahvIKhnrTekU9AZBbyHeXD
         aiN8riBFVdUXhi5+bB/d8s7pud+jaG8UqX4x9LmT3IaSG0/Px6h1SuNcd+9wiaEE3mug
         YYoWmPIBzDk3sEfpjtEWRanENNXXuTuWQrfGN/+PRURHFeH73CHh1mCalicEaWJAUuKE
         dBHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGlndce0Yd3LGsv55VTA6oFZ96X9s4n/3YSCpmz8cJbmEX4A83Dj57XKUi/I4jROJ/Z//V2DeFKacq@vger.kernel.org
X-Gm-Message-State: AFq9FYKAlpy24NN3SginJkmv4DgkUuq86n0yYPD8Vhg+xb+9Iv1Fj9cI
	tR4oM1c1laRWx72Y4SmO5k/Y5BgYxKjA9X3eubtFl5npCTla7BQve6xM
X-Gm-Gg: AYBFou1jHbd73HNewTVLGKYaJsR4bsxhHWqvAM42pAYBPexW+KtvTKTSLliCgbrHojJ
	JJFyr9Oafj2MubLqQ2SRvp3ItUz4Qp0w2Jd7Jm3DEIy/4yz7nX/4W3jPcGeJsF2ArOsYoRx/Krs
	aTrZS1J9tLf6QOi3WHcrRYUjoDdTPnOCYqEbCX0Sc6TwmCJ0Su/WcJVWwMt+eFjCjQatfIyp8jm
	v+bBMBgnJvR+Oj7jIVNy7rhzlAMRu9DS5PbjoDlj/8KAPox95YQf92SXKuLlOdoDvxH0lQUeerY
	QCuqRpDrOHrsa4tWlaALESUWqvewGOB/fI6mCw/ULKJvtHpY2xtc7kAlZ64FJLbNqoMv5HH2bME
	k6CiLJR1yuiod2HZeEOqGqUurHanaEG24vXKTXK31zd6lmRJbMAn8xytcFf+KWNF9SWyyDgdK8q
	7gW8CRMKowP9ebGSpLeuWnYe+nMNyoT3Y/qqATBOQa7vimlqa3QUU4XlLr2h3cmkTyArBI8iRL5
	nVFZEVHDMWWVSlP3RaOSTO3Og0R3c26NVjxEnCcnd2OXN/3PKvLoMlT59owdHLMwGUKhftqwb29
	STBx43a1H84XJFviJo5wzeQObKUGN6s60iVGkezrZUTN3VBnQGKkbVS+vVG0ceY5WJ7Q1Amw/Y7
	N9N9gnYHrBP4XYzQ4sU9Dng+ukpXdoQP4+Jx6SEiTzgug8j27B6UF2NbHNin/+vXSlJN6gboat1
	TjuB5r2jnF4ZoOurHatE7gm05m/RKB40ZGug==
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr210076365e9.0.1793610452115;
        Mon, 02 Nov 2026 01:07:32 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:31 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 8/9] arm64: dts: broadcom: bcm2712: Add DMA controllers
Date: Mon,  2 Nov 2026 09:06:58 +0000
Message-ID: <20261102090713.896324-9-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
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

Describe the BCM2712 legacy DMA channels (0-5) and the DMA4
channels (6-11) as separate nodes, both disabled for boards
to enable. Node labels follow the Raspberry Pi downstream tree.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index edae2f3584a8d..be4e94c9e7695 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -546,6 +546,46 @@ axi: axi {
 			     <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
 			     <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
 
+		dma32: dma-controller@1000010000 {
+			compatible = "brcm,bcm2712-dma";
+			reg = <0x10 0x00010000 0x0 0x600>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma0",
+					  "dma1",
+					  "dma2",
+					  "dma3",
+					  "dma4",
+					  "dma5";
+			#dma-cells = <1>;
+			brcm,dma-channel-mask = <0x0035>;
+			status = "disabled";
+		};
+
+		dma40: dma-controller@1000010600 {
+			compatible = "brcm,bcm2712-dma";
+			reg = <0x10 0x00010600 0x0 0x600>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>, /* dma4 6 */
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>, /* dma4 7 */
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>, /* dma4 8 */
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>, /* dma4 9 */
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>, /* dma4 10 */
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>; /* dma4 11 */
+			interrupt-names = "dma6",
+					  "dma7",
+					  "dma8",
+					  "dma9",
+					  "dma10",
+					  "dma11";
+			#dma-cells = <1>;
+			brcm,dma-channel-mask = <0x0fc0>;
+			status = "disabled";
+		};
+
 		pcie0: pcie@1000100000 {
 			compatible = "brcm,bcm2712-pcie";
 			reg = <0x10 0x00100000 0x00 0x9310>;
-- 
2.56.0

