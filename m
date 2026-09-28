Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279D04E3239
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607659; cv=none; b=Yh3hhEnjtY4AWz43t0Mf8Dwv/XOdueBisvQrwt/Fx9zkB1kJBzTIFzmC4zBrWwEIIb2ZtwV6n6HqcYtTixYT/TzZou+QTFY/YarrOcLMfBNgQynvn5hAGfTI+Y7+NL6fj0/DAiAN23fl4bwW69hR7xxzUwm1dvs5TkigfNCFebI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607659; c=relaxed/simple;
	bh=GXO6lAFxoFQEwQkkMLCI0y+cMQX6YMSHGHt+/E1eEYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uPh8DTFXA93bRAW22842GTW4QoAr6+e0rYhI+xUtA+mpVhVbVBlcMFauPa16a/QnJQENq411prjo2ecb44+dIfVVygyr5Ur3itHR+11tH9eaVVCxAEXSn+iv/+h+r5ta/0Yezai0czEFYOKtLUg4Jv19jCwtjii5YQVgBjvROzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBpHsL39; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBpHsL39"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so18050675e9.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790607656; x=1791212456; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PNRLh31Iy3KvKfoOWiJ4SBBap26RwlK370O1RZcEP7U=;
        b=rBpHsL39O+k1l9AUYeSXFOO3t+89j+XWHx09xnFuyUjXdsG9Z5q6AJQVwnwRB88Mo3
         1C+K6IxYtpiGJ24Xpec/jbR48xYBnw9uiql4QOinM7ccOLoqpv+oO4EkqKcvOEKcNzpP
         bJdcNVDAcVtzdNbMbr3gnuAIpH5GunfomdsNp93WNzpliSmpY+kAFTXcj+N8C8t7togX
         XbGwS52OqhH7ApSlregjT7eo9VQKZNRwBAivFTuYBNU42f0VKmi0kAcI8bjMfKZnX9/D
         1BPe7rWmoEZfpxZ4oDgewgtIg7PUhAeE3TyJC+ruhP+9+qcp3fVn/VhyAp5MoKyOybXt
         z0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607656; x=1791212456;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PNRLh31Iy3KvKfoOWiJ4SBBap26RwlK370O1RZcEP7U=;
        b=orxrL73X4jhuYqwjmXOlV8PyqoBGkwlWPjDkU/yHeJeg95Cmm1o+Nfh2bQB7Cu9G0y
         fuCBnuqYAtoX5kVR1fAtNdHO2teESs97eSzP2cxt/nXMp7km7yWjM6tU7MyrG7EKhTOy
         GOJsoSggwtswAyzFQTfFmmPg+7VOVfPWQgixfoZZHZnZc9GdHXStCnS+pIvfSlgOB81D
         Xuq9ANVxBGrh7eJEFAutjKG8y9z3r6KdvTK7oY4CVD54eGa9L8uohGFWoaloSpvzx1ea
         600sUEFEhYS0XXB4V8iA/Q5/0aM+pmZkOnv3AF2utLsqH1cv524VkVWl84ely5KNiL2l
         5gjA==
X-Gm-Message-State: AFuF++laCsUeiKX+kvIf+8erJd5AAwypsKs+dhU609XzT9m+ZEERdIT3
	8ZQztrSbaaQrB7Qnn4n4oZVBrdkTINL1tJlQFhKkGCifQx2mAWZveYT3
X-Gm-Gg: AYBFou31dJR4llgNt9Bnp7tqMH6oZwKR/mNvVYzzTA4AEvm3D722uFypvYxnrjxE3BB
	bBkUCyOXdPdVRg0xkE52rJT9PPPzmngIxYwnOpoQ49kYqFCocOCz6nFc8wSWxNlGXFWADl1fxJo
	5Y4OQqHSGONRTxOyrsJqbOjhr2aq3tOnSYtm9a3B/krpnGzWDZBwxGsigbE4MkVqi4OaVPnI4vZ
	o2s5TxMKZ6RKAhe5m0kq9+kwTRXRMseJQZGFgf2kr9yLEP8wVHwmQisNedBjb0SAs9rUtmBCQXF
	jz6yXFVCEWfn/QzTmIadsBDJ6hBACetrRh/YCk5DUvm6Pwr2R10QoIbSbalKDN/bk4G7XYsl1cr
	W5J1N5hlzqGtucQrCCby0AWsxWPMYwTr3Xt1UHzrTeDt9oexaFh6u7emE6UfQwprjffYVRxhVf5
	xB7EH9uRQ6gk5B9Ny0sCpRPhNX0z3nu8uhENj1C58aE8NMKZchQPu8qIlO3MkubTYB7LVWRMj3e
	yFAPo579a+3vnBtAxN1GzoQTNIr6UV7Vpilyt8bpIySy+nbTTy1CASTQLvT6UE+tshXFFXJQalo
	U4cVq3wCgTrtFJ+Ovd4Kqa+ktb7Zc4HnlOrOtiMbSDP2fzX/
X-Received: by 2002:a05:600c:3b05:b0:4a0:321:6ddd with SMTP id 5b1f17b1804b1-4a003217170mr61722025e9.34.1790607655941;
        Mon, 28 Sep 2026 08:00:55 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm151777245e9.15.2026.09.28.08.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:00:55 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Mon, 28 Sep 2026 17:00:46 +0200
Subject: [PATCH] arm64: dts: freescale: imx95-aquila: Enable I2C_3_DSI1 on
 Clover board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-imx95-aquila-clover-enable-lpi2c8-v1-1-9a9755acb8cf@toradex.com>
X-B4-Tracking: v=1; b=H4sIAB2BumoC/yXNQQ6CMBBG4auQWTsJHYNQr2JclPqrY2rBVggJ4
 e5WXX6b91bKSIpMx2qlhFmzDrHA7CrydxdvYL0Uk9RyqK10rM/FNuxekwbHPgwzEiO6PoDDqOI
 7RmvMvoE10gqVzphw1eX3OJ3/zlP/gH9/w7RtH2AAF+uFAAAA
X-Change-ID: 20260928-imx95-aquila-clover-enable-lpi2c8-e71135e91272
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

Enable lpi2c8, which is used for the I2C_3_DSI1 signals on the Clover
carrier board. It was left disabled by mistake in the initial commit.

Fixes: 3f519121e120 ("arm64: dts: freescale: imx95-aquila: Add Clover carrier board")
Cc: stable@vger.kernel.org
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index 365bce73eddd3..07bf53240958b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -197,6 +197,11 @@ &lpi2c5 {
 	status = "okay";
 };
 
+/* Aquila I2C_3_DSI1 */
+&lpi2c8 {
+	status = "okay";
+};
+
 /* Aquila SPI_1 */
 &lpspi6 {
 	pinctrl-names = "default";

---
base-commit: bf184a29ad1b33bd8922029eb0ca3f2866007258
change-id: 20260928-imx95-aquila-clover-enable-lpi2c8-e71135e91272

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

