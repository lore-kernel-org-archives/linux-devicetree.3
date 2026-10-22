Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678187;
	b=Xk7o/KUvgcFag2BQU9KCJ0NtGvuN7DaQD9orTX0THRt3Tr5QK1tQtpGY0JpPG9ilVi1k
	 v1V3jUAKGF6piXuP6QR0GWsXiRVkv4ujWMBd+C3yCEjzGURvYK17mOps/4ccIsC6qE6Sn
	 j9BxRAVMFzsazR/ZQleZgQ3T9xoSmCcpe8+naD47HiDMj3QaDVuDqq56ryTowVodAz4hc
	 rGnqsmU0Gur5uKxIvudkDNt4W1So3rlX2p/5c+yvZ15pqMkDHA3RW3Lvucv4Ebn4Zu0Uc
	 FFP100uMd81QR9gXIoN7adLaIIP+ui1tpJbVlXEuaKmuT95CPbj9ES/xBLljRsGvLlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=r+j0RfWA0Q1IHyR7Tx9qo6ls3aMcfhBj57nHBiaWQZc=;
	b=JqzlS4Up7TrKLTUVjOPW1+p/M+5K3gtoxAb6uuhkSLO42q2PvPpqzZJn+68+3zEweVnf
	 yyQxpcExw5BphF3ZUenrrBZexmMbQmjxO1SPt+7T85jD0JPK5k6XeAXTNuowIwaHOYmbX
	 I+TLZ638KaJLj6tMcRVrBo45DtlSvA3qDYDo+TOrHBT6eZuswMWgAK69q7X4KcoTgGuJC
	 LLY+sR+DrqGa8JJ08kgTRxp74G7/5wG5zZA5wwtiQtjNAtS/voml7ngtti/UKYHNp/aD9
	 YOgSGw1hw/kj50AyRwSJxWuxbpJKDEgfvHytsexPfTxoeya6vyGcYE8RoQwlWmHY9IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EDS4aJcD;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7163B60A263C
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7163B60A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EDS4aJcD
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1228382f8f.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678186; x=1793282986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+j0RfWA0Q1IHyR7Tx9qo6ls3aMcfhBj57nHBiaWQZc=;
        b=EDS4aJcD3WiN66YWFmgPoy9hK0vnQVgM4+r2VpsRsALkG8ac3lWgRuehUinE+BzZLo
         61EOC4tCe0kA49OFMH4WBg+k2eDfZ8yPkdwNq//Hi2HQCx3BAvXEeDdD/upzzlG45/zD
         ihh/VW6L2oZqX5/WKMVfytcmdGNanogXDhENXZo6CzquFxeg0D1WTaySQK+Vn5ddj1vQ
         i+hZh9I6XzeRIMoFVsLFE2o9eKVwRoHq49LMphlnnr/Q42JH1ObODKPCVI147Qnc4ER7
         Ehlx9az3k81dpKnA2GRRrNtgsoOR0NJ/99Dca6Ml8PbudZTNSI16RA9nvfUOQnOCTjwY
         zb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678186; x=1793282986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+j0RfWA0Q1IHyR7Tx9qo6ls3aMcfhBj57nHBiaWQZc=;
        b=WI5TIgzhpwyB8CaNI8N+xZU9kdK/gsL4yiJX6j9DiqWlUZJeZ3YYQZ0HGUm6L7XUmt
         f+GVBDFTP8FtjSQrFmDhdQQQkg0kRZN1JTi1H647sP+b1IBeP+jVf9mKLcLL3e5PEaE5
         fkY3jfjPk6qUMV246Q/ycLFaUknSfaMMytTMH4FeuLo2SRwDb8jwA7cVqL2droCEqHgl
         5IwLcZlar2agTRu/wzxPfOV1Fhdq1HjRUC5lKwbnCOwS29roOPee0OXv0ALsLnbRi0VA
         jNxxaZSryqObDseNNHqLpc6605wYGesZCOrk2xSxDxoeNmz+yZDwiGQ/vq/8qP/6t5kJ
         eovw==
X-Forwarded-Encrypted: i=1; AKwUvBxb6VGtuIqWvAdaUwX/LBFQRJnTaoB0qfJCKqqYRDoK203R1iURIwCc8err0nhGF+sppZdvGWEtVGPF@vger.kernel.org
X-Gm-Message-State: AFq9FYIiYxwztRWUcmgyHHHVAd07cl6BelyXpKOA1V+gQVyL8Ippczao
	L4GGVtt5wiFVoANGU2sB9C//wyIlPJP3tC38LqaIrn+YX9RXxc1HBY8Hv7MJT9Mh
X-Gm-Gg: AYBFou2DegP5tfBjygdHjLLc9MAtho9azkjxDmjH7H3NAbYazqPhlvxz/MSZbkXoAno
	YmXJufFaRkq2yKMDzLT6IXQqquzsbxE3Vb8I/oWZGHTmgw92rRgaKxrAn3HZpdMjnLvHPhqIDj5
	QP3xeypmSaKs1plHNz/mPScUSVCOfenBnsMBnpS7LerPZgjS4kl3Gxb/KixOfSCHaBhX+YExdt9
	8QmDmuzfTyF5JcHA7PDx+AawqDe1H5cGM5QGGhFKbcg0oD2/v5sBq46lygZbA/bz2yDV46LIhB5
	Gbs66ig3vd6VbtBwDMghUs64gZ/jKqa9q3rTn++MtTZgyp9Zrq5OYn7YE7tWvi8wE13sje+z4vK
	DPeyv8mPedUQN8HdGuEjGU45W3n9jdE2j3H967R/8pr9JmQj9jUYdnJb5rl8bYzkpMB2czMzDdW
	fX/aSlhCBh8kgeXCzGRk3b4wfboWhA5v+Et9G6bmYkV+HtyM67g6czWe64IXgsdzlEojNdpDR7z
	iTdmZNTujuOz2OjJUr4WrBlG5tigIK/GLzn2rw8X8HD04uG5dkKZuRQm2tWmFxOPII52A80BLaH
	QQGLBVP4MKbh+YYQzaa6ND2DU9+gM6ybxY2VDf4svcy5lpHf6PodBcqfIxJZX6wRXvFZMbbM1Gw
	d
X-Received: by 2002:a5d:5e88:0:b0:48e:f14:61bd with SMTP id ffacd0b85a97d-48e2649d869mr10539606f8f.14.1792678185088;
        Thu, 22 Oct 2026 07:09:45 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:44 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:37 +0200
Subject: [PATCH v2 5/5] arm64: dts: freescale: imx95-toradex-smarc: Add
 Cortex-M7 SER0 overlay
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-imx95-overlays-v2-5-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

SMARC SER0 can be assigned to Cortex-M7 firmware. Label it uart_mcu so
the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Toradex SMARC iMX95 Development Board device tree to
provide a ready-to-use DTB. On the Development Board this removes the
Linux RS485 port on SER0, while the console on SER1 (LPUART1) remains
available. Firmware must configure the UART and its pads for the
intended MCU application.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 | 2 ++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 12786932858a..68db39369e45 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -972,6 +972,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-osm-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev-ser0-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
@@ -991,6 +992,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
 imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx-tdx-uart-mcu.dtbo
+imx95-toradex-smarc-dev-ser0-mcu-dtbs := imx95-toradex-smarc-dev.dtb imx-tdx-uart-mcu.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 641573c9943e..f3504b40ebb2 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -619,7 +619,7 @@ &lpuart1 {
 };
 
 /* SMARC SER0 */
-&lpuart2 {
+uart_mcu: &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 	uart-has-rtscts;

-- 
2.43.0

