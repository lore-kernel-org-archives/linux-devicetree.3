Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649220;
	b=GSwJ3xSFEqsZWap5en2br80xIlEMAAKwgSfApYHTJS5gAgivMl3I0btrToDiySSAes/o
	 AjS2+CM6YOKUi5oOiXz6VTziu4OIe8zpwyEJMY2tEcZ/g/lUKUo1t24SKtGRaVhwxNNEP
	 BZiVnPI09EQjlmf88/R8jL5If8aavjuVCd/9uBZoN3GziZXlIuxKV0RFbpCOPWXXssH+7
	 RkMFmlYxl+eCJhdHGaRYbv3bPSTo3UbFW7jUuRmMNG22off0BOOXMFeph7CXhOwiYIpQ6
	 PRazSLfwoyoH3ftfARl99DGcwK3O9KgscGWz3NxT8r4FFz6LDesx3Ynd7BM6IISpPbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6xc/z4mGViwNXCDInd4Dq6eMgtyQh/VWtUKTEtky+Fs=;
	b=dPt3cQ2lcILvb6UC30U2b6LwVHZss8fY3orTAVmI0uDYcDrU1dJBuVmkKfWiGn/Zs0/Z
	 GySqYUL2lUDLM+Y3KpXq3XY+pQr/Q9tBW93Os8Zpdn8Rgyi+XItZDlHrr5kIqC1FpUl8q
	 6aWrlfSq6BVUStIr2ly5tDo9jU6ppVvO9IxveepIB10tVUpmFHrU6wAvDY8ffwFTA5Vdb
	 2e3FUf43bTiWcgW780e4Q8OmSHnSRcf4u2ImPCIHSicr56/H/SArfiPEnnTDjXl4Zo8YD
	 QSBCX9Pn41GzR1U4Ec6i8l3IfwR+hX1jy+0fW7Kp7KrivO/eTd9CCNut+18m0Bl+5Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CZG30O0e;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CF4606EEB9
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CF4606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CZG30O0e
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b042c0759so1780838f8f.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649219; x=1794254019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xc/z4mGViwNXCDInd4Dq6eMgtyQh/VWtUKTEtky+Fs=;
        b=CZG30O0eHcF47HD6dmaY2YcHN9EgyPb001GjtcfZ205JKhcdOmziqN4UL9ap9Xl4xO
         +gCMpO8Sp+aQAWjErgpSQvMRoDOmekLjOrqzm4Zras78P9UttQCpq+fZiNt9qQg9hNDs
         kcvhcsXlVp6bBlaO3RHZOnBBzT2MuJ5wxHSIzrTLHQ+lkMfqTjQKitU2j1xjNmNTwo9O
         C4EEhMEqBMaCZrbC403Gh8m82711y0quJpU9u5dJ34zFsyQIsUD78FMH88SCIPGgo99R
         ilTtyLjE4GFbNtLcgwO4vuJZHUkl+7oZkCiEuTRt/tgZkugTfXOpwIifo6fESTaiKL8U
         ye7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649219; x=1794254019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xc/z4mGViwNXCDInd4Dq6eMgtyQh/VWtUKTEtky+Fs=;
        b=ECVv/75M1TScAoZgWy6LSIbxIFp/yV80ZHiLF9SDzXIHcb9+qE5GU57AUSDVtLfIJI
         soY6jW2YJmXTSjllEXA9/7xgejknxwG0zEDPDJgEifNG95JqvokbOeWUTw2poRR2rqJg
         LDi6uvk5YQRTP45QvYsnWrvV+qp5rz4uBtWFBFd6Re1i4I3X+hczBNEmrGhYcfzhmBfz
         Tnbaimpg5qXfAvQyI5dch5m9gwEwiPcUXo9CKgMAfG+/KzHVuYezdLg4WNWzvFNaJDHf
         FmY9V2+U0wfcL6DV515ms8Y7t6t6o3rok8eZ+1QW/EINwvR22NOOkLkZ1a/QJkXfNtM/
         FNCg==
X-Forwarded-Encrypted: i=1; AKwUvBzP5KSy282MDxSwg39PKwgOPliBQgNT3nTzpqitJ008iy6+3pu/g7SHbydu3r8Tl5XOe9huydPg6aBz@vger.kernel.org
X-Gm-Message-State: APuU4Z+ayvv5b+p8x8PL3Jp/tPk51GLQHCu+w5X9KEQlvzX61vD1LSq+
	VIPXitIycpncSpRloA2d8rzZqBjL4IxLIgcZZ28zidbg1LwxZYU4yhQGyjqCTmkuT3c=
X-Gm-Gg: AYBFou0kiJWnBOdqHqIZhOYebVDO1k0qXvjImBtb/b8fGr+63fy9NP9A2rp5h5U069z
	5hEBibpQVojDya2MNq480wsi8Iw6CBtPpMxP+7s6HMrWlRYny4SZCNsdPVcsoNBGvKPrZjLHzXB
	SJO/w7wpyHPoG9AuwaNMG/6SisXfNL5uyW7tE95HGXy7KU2O/qivhead6B7gL3iAaUfrr8UlhpM
	v0PF2e0X6Gpwt4GjJvYIGXNYucsBx817tKn5tJF+X0xz5MDsXUmcJHakaTpR88/8WC8wzYQd+u+
	aC8V/bJvlAWgI1ztoCskqq/Uk+MNH7LkjXsb/M/jA+Kyed49LCrCm/5e8IUtm2jCXxAUAMrBKnq
	h90YW6qCdAQl8qs4L37gB35+sRnUeUa4pDDfe+QZHWtvffhf8YcOq1S8cNDC9GL01OxZS/2uotO
	kf+QqyxNLBjJYmGr+zHfHOONwbTEijigIpPt4sscJ2jp9tLMjeApKctpXC1dS1CkM7ChwK+33mH
	1Exez463IGtEDQcQQhyaXFLLfs/kslZv9+nVUbZsT5DGByIaPy6Hxm4ucqFivpn/9d+K/OzJXFr
	iX077dh6dshqNCgoKxfVJFIIXSExkEswyd1O+hVLpb1WEh6qnNR7VnM1GZ+Z0v23HjehRzIDH/B
	g7IEQRvxXzF3NFlAuYColQqGvQWQ=
X-Received: by 2002:a05:6000:260d:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48e6e521406mr25540676f8f.57.1793649218827;
        Mon, 02 Nov 2026 11:53:38 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:38 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:54 +0100
Subject: [PATCH v3 8/9] ARM: dts: omap: dm8168-evm: Correct SD card pinmux
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-8-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=2155;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=83Hmt2YYwsYCIfUczSaxPVDOXa1KO6SZNJLSBdpkV5o=;
 b=TLBdM1+sU+wTuaQpo94tDJqhnYNjg8MUQxSIk4PZnYVzOAOkVVw7lGekklx4Cq3Ehj9UD9D0n
 dl2n0uUP2tLBPCNhdpI91bIrVmPTfvcydc/9Amkd5hC+OuD442bSYeU
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The SD card lines use external pullups and so the internal pullups need
to be disabled so that they do not cause contention on the lines.
This bug was revealed by correcting the effective bit mask of
the pinctrl device. Use the correct macro for DM8168.

Also fix typo in comment SD_DAT2->SD_DAT3.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
[ettore.chimenti@linaro.org: squashed after fixing DM816x macros ]
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index 81450e15b889..a6d42766a496 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -45,13 +45,13 @@ DM816X_IOPAD(0x0aac, MUX_MODE0)			/* SPI_D1 */
 
 	mmc_pins: mmc-pins {
 		pinctrl-single,pins = <
-			DM816X_IOPAD(0x0a70, MUX_MODE0)			/* SD_POW */
-			DM816X_IOPAD(0x0a74, MUX_MODE0)			/* SD_CLK */
-			DM816X_IOPAD(0x0a78, MUX_MODE0)			/* SD_CMD */
-			DM816X_IOPAD(0x0a7C, MUX_MODE0)			/* SD_DAT0 */
-			DM816X_IOPAD(0x0a80, MUX_MODE0)			/* SD_DAT1 */
-			DM816X_IOPAD(0x0a84, MUX_MODE0)			/* SD_DAT2 */
-			DM816X_IOPAD(0x0a88, MUX_MODE0)			/* SD_DAT2 */
+			DM816X_IOPAD(0x0a70, PULL_DIS | MUX_MODE0)	/* SD_POW */
+			DM816X_IOPAD(0x0a74, PULL_DIS | MUX_MODE0)	/* SD_CLK */
+			DM816X_IOPAD(0x0a78, PULL_DIS | MUX_MODE0)	/* SD_CMD */
+			DM816X_IOPAD(0x0a7C, PULL_DIS | MUX_MODE0)	/* SD_DAT0 */
+			DM816X_IOPAD(0x0a80, PULL_DIS | MUX_MODE0)	/* SD_DAT1 */
+			DM816X_IOPAD(0x0a84, PULL_DIS | MUX_MODE0)	/* SD_DAT2 */
+			DM816X_IOPAD(0x0a88, PULL_DIS | MUX_MODE0)	/* SD_DAT3 */
 			DM816X_IOPAD(0x0a8c, MUX_MODE2)			/* GP1[7] */
 			DM816X_IOPAD(0x0a90, MUX_MODE2)			/* GP1[8] */
 		>;

-- 
2.56.0

