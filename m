Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897074;
	b=oKnoEqixE7XhNyj9nLlMV31ynrv12ytcQR5C0+u7RX7hhTh0CfdfRpluOmzr0sl2T4Jc
	 lD0p3Vy3Hsvc8axsRbjS37TQBvj8hxyB0FSlTlighBgLKLpY2WfxqdQb9lchw95lq+Ouw
	 mJK1BXsmVHFuydJE+hhNlhVcjI5jSc4/C6kJh5W2eSWd1PwpnqyOqsOdy9BmZGF+2Fe7N
	 dR/QU9YorkjkyN5TShqjMML3B2tkEyoH3j/8BflBcLIkAwYWMnRi1TWAsa5VOpiFcnv37
	 zYtaSZUMPb1PcRWivfrLZi78RbX14c4qki9dU/O6ouUe/H5JaS1KWYwlteh7BOXwDKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=yC83ESjOXOvwycANDHqMUIA/nyL5tEqJwdOrO5/UNYc=;
	b=gXvUddEk7l7cxvNGy9LsoMpH7d5VGoPFCNVvoq/SwBP41oSdd9PJ0g29xbBh4acb0YeQ
	 qM2KFLO/+FxyqEYp5O/a/T2XsfGRTsVqyI7MS6DNXAA0Cr92/X93TNOsb502lTkEzCoca
	 1BMxQ2llIw+LzMCZQ3O05xBPOnDrvCMTWSc+kgB1hIRkEmoQzpm7xEbzJuhVsNV0KxbOv
	 O3a4V9Un0kDgEahfq/gsRyc1HLproGoqahjvKmqQYJq9EenC/Zc99niNMs+xS83jzJ6Uh
	 +IXo1aQat+VHS6XYRTf0tXs0SrJkFK+WDBf+GNhv1dNgVWVEIFu3qwfbbOtVxnaRMnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xfIfLYcP;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFDE606A32D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 16:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DFDE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xfIfLYcP
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e30c26a4so181594266b.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793897072; x=1794501872; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yC83ESjOXOvwycANDHqMUIA/nyL5tEqJwdOrO5/UNYc=;
        b=xfIfLYcP64DFbq+WXEUe9TYpwTOFTkySIMUElL9UJ0zJsmsGjdUUciQoXTGP3wKcCo
         1XYgvft/Fv/0vFCllUsu0rxITDqYRLwtlkrRR7lIvP4FEHCYwhjN3uVlvnDpoqXCTdyN
         796+LDnAGjm+fL5Sc/0IWvBT8ZuXds9TSREtvCM9VKinLLCn5CVRD8puQMFZIfIpsyxY
         DxrA4lYIWf7bvJINbPD2tmaONSHIK0aPYwRxhwRUeH8y+C8Wkj2JkauvpVoHxozWKDnk
         nV7NMzCd0VIT9n6AQ2vl2kNPmXustP6x5H/QcsdvSfm9ao9GLQvFQHw54wGY/ZXrDpOQ
         zuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897072; x=1794501872;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yC83ESjOXOvwycANDHqMUIA/nyL5tEqJwdOrO5/UNYc=;
        b=fQbAqdgTzmKyc7XCRM6Rl3hMXXVS7AXdEzl15LUol6W5kjDNKVMkQXtU3JjsQ/9MkV
         R5ZeErAlZ2oqCwY/NvCCCLNGZL3HzHgzgkVpWOJ/9lpsZ+XHbozQgR7ZM73LYVXP+/DO
         wieSguhcvgRnnvd8+ZoWfuFud2TYNxHUfjwKqJhhrAqNbMZMnRBNNjqkY7mXnjqhnTJ/
         t6cgWUnHl3Emc8sReQe/LEKpuHKg1Jn2b+4m/haa5JauVEB5PJlidjFLj4G1BE+CqzGx
         vVtHrd20xMRTXfIra77nsIEALwMMcbdMgrk8FVkexmVjs9RfvuC8MoBFUT3NrDHZ/x3v
         Hs0w==
X-Forwarded-Encrypted: i=1; AKwUvBz64QxGwFrAC1q38yL/8Tb/1hYe8RXXcCJtonag9RSV91bJR+jn9bCNK7Nf/oCNPm/ONCUJt75MrFdv@vger.kernel.org
X-Gm-Message-State: APuU4Z+N1ebv3UYyWynD04FisUyaoOjTm+fUTHJPXBF/KRt91wwOMswT
	D+W/P5+adqTb+elJS5f52A5aM4AC1GfVLnsEcN6qqU9KcH/y5wyAT4avGVrMs9FJiSs=
X-Gm-Gg: AYBFou2RF8lzIpE8ns4MiAUEFE71RouzDAvGn82c2e1bxfqprYGB9C0PKUyK4bggFLb
	idjkbpzwVcDazq1Q1FnQPualB0EdilvXgs7Ekx8kyPY+3MaHGEs3oBvvB/Zc0KAI4r2CfnIMk4p
	dCPSFlgKPsm24Fr1jiD2HlFkzQZmbVI2x4ZC2WxcT+fd3uj4orpG/xZYRGlOB6SmeVtb8IEICq/
	+ZlBnHJhk0TioJhJ4Z3iauDvchQGUGeSr0XYxs4uPnQm7nNY1n3mhrXkZTCz8AblUltZosnbCJq
	+LDYUSoSA/EEcfugPVKlWIu9qF/nKO4gxPVTFSCNouhmluCt+UBaiqr/THGFNz0Z+L5JbUxYCGe
	dlce8OmzoBZhJnSM1RK9s3SEUo8tqCjv+iV2Mr6k45U4fliztZaidEnpfHzhnnByB7Xdg1TQWSq
	T3CBifvfozEFblgA8PfurIcXjP6JRV1oMQmI4sQovRXzL4t8SDcrbh5K8dkW746+PclfE/GKpBj
	GnJLCv0vEQv/xr/n5wj+fczB9u2bQhTxjZO2BUHf0EhGGuosQIhgRHg3LaUXaD2DJFRKPESFynh
	irMBhOa/kijAVnWhMQpPGZUdFqjPYG63P9GvHQhaSjfWluuezT6onyTPfdPhAdM9irRugQBX4RY
	QiWK42dE8E6QMvkp8xetl
X-Received: by 2002:a17:907:86a3:b0:c46:9745:ac13 with SMTP id a640c23a62f3a-c4d207ef40cmr272696766b.32.1793897071769;
        Thu, 05 Nov 2026 08:44:31 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e48d0dcsm186593666b.70.2026.11.05.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:44:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Nov 2026 16:44:29 +0000
Subject: [PATCH] Revert "arm64: dts: exynos: gs101-oriole: add pd-disable
 and typec-power-opmode"
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-gs101-tcpci-bootloader-dt-v1-1-4b7e373778f2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAG2y7GoC/x2MywqAIBAAfyX23IIuRY9fiQ6mWy1EhkoE0r8nz
 W0OMxkiB+EIY5Uh8C1R/FlE1xXY3Zwbo7jiQIpaXcAtaqUx2csKLt6nwxvHAV1C6hpue9PTQAp
 KfwVe5fnf0/y+H+0rQNNrAAAA
X-Change-ID: 20251111-gs101-tcpci-bootloader-dt-274e58a82920
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

This reverts commit 817473b6ddaf9eb5f2bc7d6dce9fa13a921477a0.

The Pixel 6 / 6 Pro bootloader version 17.0-15681480, part of the
Android 17.0.0 release, knows about the upstream DT and disables power
delivery itself when the serial console is enabled. The workaround is
therefore not needed anymore and can be reverted, as anticipated in the
commit message of the above commit.

Since then, the node has moved to gs101-pixel-common.dtsi, so this now
applies to both Pixel 6 (oriole) and Pixel 6 Pro (raven).

With older bootloaders, enabling the serial console will again result
in endless TCPCI interrupts.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index e5736c39d1e0..dc908dd7e1c6 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -662,6 +662,7 @@ connector {
 			self-powered;
 			try-power-role = "sink";
 			op-sink-microwatt = <2600000>;
+			new-source-frs-typec-current = <FRS_5V_1P5A>;
 			slow-charger-loop;
 			pd-revision = /bits/ 8 <0x03 0x01 0x01 0x08>;
 			cc-debounce-time-ms = <170>;
@@ -704,12 +705,6 @@ VDO_DFP(DFP_VDO_VER1_1,
 						0, 0, 0x18d1)
 					VDO_CERT(0x0)
 					VDO_PRODUCT(0x4ee1, 0x0)>;
-			/*
-			 * Until bootloader is updated to set those two when
-			 * console is enabled, we disable PD here.
-			 */
-			pd-disable;
-			typec-power-opmode = "default";
 
 			ports {
 				#address-cells = <1>;

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20251111-gs101-tcpci-bootloader-dt-274e58a82920

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

