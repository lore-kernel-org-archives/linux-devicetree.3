Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551BA3CF20A
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342818; cv=none; b=PYreKBqE0fBsoSRe4+iZwEP5iilc6cbKC0Dc9ZWGLglBWHJcMjV0NswMOj0UEyIAaJPQvIvT0A5P/SBpjV2oSJm/GAKM2rubYQvxOxp4aVemDbQnrbXKDdcbGVB7b4LnIqs1OWPVk7YEzAp0vXai9zmK0ucuTiXbRv4DzveBGbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342818; c=relaxed/simple;
	bh=j6QwPSkInJeEhrzmgYZqfRvcEPRt7b6y26e5smlmvys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=skbnLZ/BukNgn2DKhfNCcGlZEzmEx7wmCAWKtkDdX/sJ8eFJ+tijY/dBgHf0ouw+jlx4BAv+nJW2EKnb3pv/4bPBQa42rFWjmOEpU84Dnd5IMwPtw4oh3tSITteFteoaAAXMdpWkL+HhwdnA8Cpem7kYKz0TC5QpK1tX2EP6jpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXrVonlm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXrVonlm"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dee593f18so929586f8f.3
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792342814; x=1792947614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UqQp0/X3a9cfP9CawrgORU5i80U6c5G1RMObrYCGUFU=;
        b=CXrVonlmDqUhebkpmralhJWlPrtut9hsjF+Tw9UDzJU24bJ4YTwBGJAvKxWkW075Re
         4TLxIyhPLQGMS+H4ZtwF40pKK6ZmTaQbe6X++b2GZ2XFHPf7NSBSnOTRJ9NY4DeNU+y9
         abVWKfk4YDtjP67ZxONfFfP7+gjxApnS0A7AcfmKFgdfrDlfAgbQA/E3AufbX5gA2sXP
         w3sl/zQmcQa2ik2DRwB6r8mXN9JfZdSj5QQ44IITfvNLJ1M4MVqk07i3uWvCTov1dp1D
         AzdyaPBpOiiPKnRZHK8CxMVtG7CKZ0jI7q8OSF7QhZRYP5bPmueUj5CkngbZBNaMpN6C
         ayaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792342814; x=1792947614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqQp0/X3a9cfP9CawrgORU5i80U6c5G1RMObrYCGUFU=;
        b=yvy/PGIgsTycULtbHnoXM1NYb6S8UTSpSKdkWigZmuvH3fdpgAu1Zr6CHpvaXrHkWZ
         TIEe7ClRUjh9S7xBMuYAjaVFjrmdVW8XKzaAbwp89L0B4K64doGVLTDJVB8an8h3V2zx
         TxOIzYfqv2pq0BsZUJrOGog4e57eYEVKjT4kR3Qg9dqsKTLYwvc3zjhQuwLf8/egcRG+
         MwhDGcee9RkQqQL6efdNxoHZ6RKNjVQxlmvX0Mxtlun+lAwa/2/prPMO6e0cIfR67y93
         /PtW5bAAPEvEZoszxAY8CWyFDQjvdr4K1dNE/+CUeCXzAPZy4ZBcpNytW5A+c1Yk9EGB
         5kqw==
X-Forwarded-Encrypted: i=1; AKwUvBxBEEvhzrJsYr8+Qfd4qeQXPWbVg/Xd6a0UhtxAonHgzkfwgpnl2sReiRYg3zpq8TRTQP7LTzShkVrP@vger.kernel.org
X-Gm-Message-State: AFq9FYIwYK4+zUtleuw1e1uUywjTEktqNH2IHl4CJ1FcxTxJdSUtty9S
	udpVvaKcp3gSnFMWkVvM4CtLaQrLQApbFG2NxBIRXtvmGnpz+19tLWwHDhIkFA==
X-Gm-Gg: AYBFou2W7NfKkOgo/i9qbBNTiWIN1A42s58KFvO9UmfNt6bhF2QodlWuNRDIANdnNGy
	oiycqDPDopMyhPyT/ZTh83jrfG8vZsi7M4wtc8POKpVrXSf7pLcmst6cXMOk+a5nt3UHjUW5Wnc
	TQr7SoESQTb9Q4exHEQfhCiql6mrxxAL+5VK7O3fPJA9ePVCIz/oyWXOL07vaL9Y4WH3B/cSAVk
	Ig0q3MDF0lizeNwDrCeloecyBOtkscmlGLtVE1CW7vh1pNMo5t/EhYFpyqFylxllxrzw3Xp57Qk
	7NKQMPsrTVKNaCzhQ2Mg/lRg+q9akJ2tk5fMPeZpghgXyt2pELSZewSTKWv1+2AnIMiMrjaKT4Y
	wpfoF85grdaUFLQcliLs9AlkcD+rusxvStCdTnNsIYZzVyeGnjnHymY4I8WdmV0+ePO1Ch+vcOB
	pu/gucVBWt++9/fy5yUfxRJ7D10Oc0MKQvsgzBkw5DrdYk61U7BNqiSs35YdIJ3ELa6PRqrhyYl
	wjR1BkOoPsbJIz28OQnqZnhyRvQs90o8ep1jhmWORD36utQcibQER8GoGxTE3nTF/XjUy6onnWK
	wL91vrCGrq7xaYLDjdrN5Mc=
X-Received: by 2002:a5d:4390:0:b0:48d:f025:110d with SMTP id ffacd0b85a97d-48e07fa9d49mr7744225f8f.43.1792342813663;
        Sun, 18 Oct 2026 10:00:13 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm19744454f8f.27.2026.10.18.10.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:00:12 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var-som: fix touchscreen IRQ trigger
Date: Sun, 18 Oct 2026 19:00:07 +0200
Message-ID: <20261018170007.38381-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The touchscreen interrupt is configured as level-high, causing a
pending wakeup that prevents Symphony from entering suspend.

Change the interrupt to falling-edge so the board can suspend
with touchscreen wakeup enabled.

Fixes: 5f67317bd967 ("arm64: dts: imx8mm: correct interrupt flags")
Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index fd0a1862ce90..5a60430eb96a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -192,7 +192,7 @@ ft5x06_ts: touchscreen@38 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_captouch>;
 		interrupt-parent = <&gpio5>;
-		interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
 
 		touchscreen-size-x = <800>;
 		touchscreen-size-y = <480>;
-- 
2.47.3

