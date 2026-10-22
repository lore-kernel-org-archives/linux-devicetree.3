Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678186;
	b=UPJ2t1J0MBuoJgG82fGfJFReP0m1PMCcryQTieDQl6vjv1Uy4ww+Rf50TvlofKAWRl0z
	 hA8bhz05HkApryp6s6eBG5/ib7teOsHq9nnNkcOKAdNXAEJgCMmvohOsjItnzwSUxE9ZU
	 HxBPFJIlzY+592l1KvdoPcpdmGE1g7oXyKUJbOO35iEaNgjgs5hOKFaGU6e5v9zWERd9D
	 +lvZzeNG9X6Bh7xq3w/CoMJ4tdkKyhgP4PjBDISVo+SRYxW/qRZtQp+XcwAvQ+FnC4Mhc
	 VKd12rAxIjjZWMPXQLw3E35SCZ3AXFvLji3lMXiF6Cd4bsHFtXdGZpkkxja/7GZeWEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WZHUSThoPU0ne8Qirrakt2mvv8fxh4b57S/T0d1mLFU=;
	b=fmCx7fCQOmr1GcBrdinE7LU+/E1NHtyS3ALR7qTy9LRWXqR5Aggck1toBa5wat7guWYs
	 DCIj+3gbP94N51OJxwAFr/FgRIODqAGTF3MpT6jxEcrjPbf4tY6ZMcPjNE9tUBTMJvFnq
	 24IuD3b03mbBwozfOChX25ykD6TnlbQK9akkPyLKtFiqUxQtnEyGMwUZucxmgHNX0DrdA
	 wQDGEFl2urOzroiw+isa4JRpGhryTnpnUu8eDxs1xSkUdV/4t6GGARvl4vb5gchkFa12U
	 aoW8Y4W/slP9i/x8Gy/vaVBQH1AL5yclqj93CrOAqEBFIrRkX9f8FL5k+eBbwmkKoSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NKjmwar3;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A0E60A262E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A0E60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NKjmwar3
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1379019f8f.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678184; x=1793282984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZHUSThoPU0ne8Qirrakt2mvv8fxh4b57S/T0d1mLFU=;
        b=NKjmwar3nMYqLNb+mXC0AIhL9GT8xwwwHPCI/XqMyS3iTobOmCLGq2Sx2OPgenhN9j
         twpAj0rcnEfmJ+RK61T//29znb/QlKZVqWO7GRhW4h76aWS7Dhjy0OaE3FjVdfQ1Z2P+
         mp3p06n9dvMNC2OoZEnY5Us3DZnc/P5gxfT3xhmOdJm6jRVdl/92bdCmby2Hi8DxhaJm
         idBHvRAeT/DdbGCdj8X5h8hmV86nfnd+66sd6146a41g91c+/y5jN2uxwolWEuIcMFyX
         3uJqwMjraBhLIwrDZ7znnfGpk1uswvr9VK1905EqDAzJQjy7nvcWTSJ/lOvmUDUuylWU
         2oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678184; x=1793282984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZHUSThoPU0ne8Qirrakt2mvv8fxh4b57S/T0d1mLFU=;
        b=oW7r/VFybZTdR/CaCWTk6x6FHezIo/cy7ppaEekcRg7nPgHigYItBnFdtMsNMhy+du
         i13abVszd7YN4acfCr7jFSotFHMwvGXrkFOx+nQtk6DuEKRc4mzmozcpCF9nCMIK0YYx
         /Of2dM+OVEiH5jRNqKU+yR4GXznQDOarNcU+28J6CeWy3g5enDDApiTFeWmFbnbJHiHC
         7payszpFuDpcCR3CK7p/3Hk3jCgafTOiFevqsxylhm3hOZPSFimb9LKkRSPkyk/m7Ahw
         SJl9cha7Hi/6q8DuEunWRU1q9KrB01N4/KamTuNC7+BX6G5Q9pPj8KCoPdBOkj4c7Hmv
         Q+Xg==
X-Forwarded-Encrypted: i=1; AKwUvBwHWvmpXaD6j6/WjNdgDlR+Ht3RlkF9Wj7U1HASJed08I7re6F7m6MtpL1gKa4IPGLgCwFa+JxDcB1/@vger.kernel.org
X-Gm-Message-State: AFq9FYKdE4S05DQoMuVVJCBZAwMG5PSOKUXsz1FWi/hAVE0CEC5XhKVl
	y25XpCWBkDWE6GCkaYvZ4KKik/Np0bQops46YV9whYAKYHkrOKhtWDKU
X-Gm-Gg: AYBFou2uoITx8iX+ut+n9qbQXM6ZVaY6VNIcsrMirv/g4sMOb3j1Bhv3iNyPK6QBELv
	pKJFTyRfHpqFy/DkV5GLU+bu/dll4Jx3mP7X05pczrJtwfVN7i/gmrtOTZWWBAQtcNfsSeS683A
	+LCuA1wuBNhMVBG7WR8zrOAUSEeY1V/AD1U0g3GuUa7xUC+Io71dQzPPCaB32aIKbvuSxZKfsop
	jWRupbu7R/jOD7BdyhLiVc2fXfSZ1gObeX7VcJcLSBaOvJp6/91FrD2+5c79zQNscLca0OH/5Yz
	C+I+21n1uEgHdzY0zmflKFG8O55VbTnVX+aFZZymdnS5IlFraNq0wYPjFFbN++jYP6rP/c+d/pW
	auGOytPvBL1pxGeoxPnVqNiBl7uGH2ab+iKFx3pKQrM672Ldw1GsGOck4pd06mv1o9Vpj3X1UbH
	mqNLKkBjcQZjeEHrQYpR18KQDFgqlNeWHMpLYyL93H9IbLRrU20KFqhxDN90JCgJR/GTbJEpVwK
	SQpLtTBBxjz2667beZvISKGteQBsMf+Qm7d6UwMARnOjIP8BaqV8Gq9gAwgXRnKEvlX12q/nsVD
	UiA1tW0G2vL9ASxk6FGvCOSlqXStxfkBIu6P+KOA6G/Qa7pEf4fYA/c+i7aqnOiONcGvABOmpxN
	0
X-Received: by 2002:a05:6000:60e:b0:48e:2b82:e833 with SMTP id ffacd0b85a97d-48e2b82e8b5mr7621910f8f.21.1792678184030;
        Thu, 22 Oct 2026 07:09:44 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:43 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:36 +0200
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx95-aquila: Add Cortex-M7
 UART_4 overlay
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
Message-Id: <20261022-v1-imx95-overlays-v2-4-c769d6eb54fd@toradex.com>
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

Aquila UART_4 can be assigned to Cortex-M7 firmware. Label it uart_mcu
so the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Aquila iMX95 Development Board device tree to provide
a ready-to-use DTB. Firmware must configure the UART and its pads for
the intended MCU application.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile          | 2 ++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f957797d90a6..12786932858a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -968,6 +968,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-osm-dev.dtb
@@ -989,6 +990,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx-tdx-uart-mcu.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index c5f4cf0541f2..d4e8768f382c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -553,7 +553,7 @@ &lpuart1 {
 };
 
 /* Aquila UART_4 */
-&lpuart2 {
+uart_mcu: &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 };

-- 
2.43.0

