Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678184;
	b=GfGMYyd86KfXLgTr1Kk1ztgS8yt+lLnCfdr52QT7VdkHeZDpLLIczQWDRs2aqt3ppJVY
	 i9N+jDRaV1fWMSb2UUkkxuW1lwSuer0MjibZLDoqmnWv0WV7YA+TrbtjGbPAgGnqQJCLy
	 eusJwhDLx+mVpiz1Ksi62kswn0/Kndcaw/R/oEsgM0o6k3rOFcoPIdCjb0oZeEbwWI50h
	 mhqoOtJlUXSAFfrfc1WddG9SwH8R2smLjBfhEpdil2/f5t1Eqkb5MBx+PVhITB8LidLzm
	 jDktjW7IkKd0ASPU1D42LhoRgzi42niV1LPLGy/7zh5eosDADtno7CHSWLJPm2dRecA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ao/tRbZr32qcHB0KVI6iOR1WFXceFhMkLS8qN8SkWO0=;
	b=lfxqD9ClRxZtWRypi6dyfPS8sX9tCAmlNpMXSj1LLOHmmpA3Qb20I6x7Tn7jhHNR2lX1
	 +fivKbKPZKCkuurNaJJr7ZmxThcROKwCWatCtIzfbn1+TcvUJS7lflBQ8T4KDq86C0ro6
	 8ufHD0pz6cwdxmnxIdpUIPjz35/WuuY7Pq6FhlOpF66jSxlw7O0Qh5htJdAIn3luk5hvd
	 ZHLG54/lLCbduXXUjRkc+8u+JNUERtB/hQ0NCljP1o2CTe5S+KzhsAAgZ6IatAR/uU9mG
	 gYdjUCO5qQkrYh2XRsOy8qkaJllUmiVMKWCToSzhX2nlcHT+azMbs7P/U0cSxjtU6zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SmB6T5Uw;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC1860A261C
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC1860A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SmB6T5Uw
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso22177965e9.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678183; x=1793282983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ao/tRbZr32qcHB0KVI6iOR1WFXceFhMkLS8qN8SkWO0=;
        b=SmB6T5UwcIHWvTfoyw0ydYX89rnxNGJ0mffGEByawWO/OADL/jfp3vOT0R+YwpUDWU
         bKv+iFtcO/ALp3WENVb5e20XZLQw0oyLUA/vz5H5QxAgcYWJJEyGBDtKZ7eTgWaKqSNr
         KMuV0R8/LksrmqfTIriSersAy+uIt3ShLocfvdSLJkn3wFSft4t9qKCDdamKqeB6ZCdU
         q2PqRX5XBzLOz5sOPIwA5KVzTymxmg8z7ORUHlXfLLlwu0U2py9WweDxL2tdRgfUk+G8
         q2xyXdRKxA9incJk18jMziUKTTCwfKYUjoxM5Qmqda3Sr6p3ufBhAm5/9pAvnZgnZ0VJ
         pV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678183; x=1793282983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ao/tRbZr32qcHB0KVI6iOR1WFXceFhMkLS8qN8SkWO0=;
        b=CT8ZO4wbampyZzQjxSKOtQ8VnLmLxwkwBl6b7yBCyGe712hLQpvUwhA2F0bKIhrBNY
         AWY25UsVdY4nLbQ2h9nLzQ2Pb961carBFsErGnxHY8m56Do3eK4+G2fWpQBtS89im4/U
         61h4IuZxgJ3WQIv/plZ5uUbwF4WVwgMhu+BodG7oDhUVIgO59XJbLjjLQeKV2TiV6RnB
         9ujVa7RgOBndQgAKiuIf7wvuIDwTXb8vCgsU0hcZc1RyQro99KGQChyyM0B9Bf6ZlRbJ
         +6zdAdnM7e0HvhhxO9ay57rKJ/d0pQUK2srxgvWf6ydDMPa0AnCltsqBXiNo17ihOLcy
         9PUg==
X-Forwarded-Encrypted: i=1; AKwUvByIv+QlTramj10HDVEiTxz/A1M6Ns3kyefxdpOl/6P2sqZYx70Eo+oVj7QfBv7XmSPMxoolruFxy5Ho@vger.kernel.org
X-Gm-Message-State: AFq9FYI3svF485CYbbeTNs9MDjIrIqZWLSVpYeNDHlGIwholZLKyrtf4
	X0RNYPq50gBkOitpNLh+edQrXRn3WflbYR4X2JIebbR9DiIEfbE3kcoO
X-Gm-Gg: AYBFou1v6qE7KYSCVgMtJRvVMXITo6ZMo6aDOHlCwDFLHutA08ipdrWtfSDiKOlZnEg
	kFUWJWE4baWkfesrGeYknZIpsZV1ZiLDg6KmhlkZ6GDP0lpwODl6qNQimstYs8pzjnQMHc8F5he
	SdtFs1DCpl83Pt/T+dWR/BJ3LahRTkLm3uBV5xoKfZN1jCY5Pe2ZQtZt3SbsWIOKeODEXHE0Vf0
	e6XHHaN/N8PQu3mRQ0kqRd7z7cQOZf/rcj4FrHpfUpynnwTqy33AN8SAsikLjF2N40CWyGMnEon
	x9k+ckEv6KSb1RZcLXRKtWYBCXGR61U3HCACKbe7mz5WBBoVdIjXKT21d1HXt5Xkfd9Hvx8w69U
	f6ZeioEoIHv95Nn9tSAK7FlOPWz5j4q07WgdKE9TF6uy63krGW0XMYU0RsopAxiVsuQZFv6DJms
	KDC65Jl7idN6Iu/nc8O5WVr7dN5st6aaxMUVHRpBLu8uiB+SNIIwXrzvwYaeWmeDV/l3pp953UD
	tK4O7p/uu5jsddcb1w8aDxUzTUUgkTd0ZDiqxYiac7HD2hZn4LTK42UWPK0Tlk1mDVEOJbhZOP1
	bwsGaYjp4Pijg52wnI+D/4uaEoa8vVy77YUcoKzzNr8JuTyYi9JOwZc=
X-Received: by 2002:a05:600c:1c09:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a1fdafd654mr107712815e9.14.1792678182521;
        Thu, 22 Oct 2026 07:09:42 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:42 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:35 +0200
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx95-verdin: Add Cortex-M7
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
Message-Id: <20261022-v1-imx95-overlays-v2-3-c769d6eb54fd@toradex.com>
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

Verdin UART_4 can be assigned to Cortex-M7 firmware. Label it uart_mcu
so the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Verdin iMX95 Development Board device tree to provide
a ready-to-use DTB for the WiFi SoM variant. Firmware must configure
the UART and its pads for the intended MCU application.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile          | 3 +++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 5ee9fa583515..f957797d90a6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -982,12 +982,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
index 72e7f1e88409..9aa4e8b23ceb 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
@@ -526,7 +526,7 @@ &lpuart1 {
 };
 
 /* Verdin UART_4 */
-&lpuart2 {
+uart_mcu: &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 };

-- 
2.43.0

