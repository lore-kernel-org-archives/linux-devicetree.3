Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294635;
	b=rjL5LMuubKPDfqLW746tpuUbYc77ouHk1Iw3fLIlpF/vATcRN8uOrfnchdWNb/QhOxqp
	 5ksK2rWZCASBC77R+psmHJl5v2wWMZiFQwyBQ0Xw8VQKrJJIZtaHf15ZolqZwkTkNQqC1
	 KAUndlz1R4tkEkbzheJfJskxN8td5vFCbY9HYUEh+rbKGV+B7GkGNov+c2OE6doxXpLC3
	 y3e3qxJZTB+5J6UTmYlCIJhZbyI9/8gM3U6bX2AtGcpMujHjmcoHsFcMe6zf4o/HU9p8e
	 aIsO/C3h2uLeNE+Daqb1H+Gq2G//P7fWo+uA7oQ6JdAwRGV6dZOfLzwGb89X7A5nahA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tY6q0/ZAtlO7c/3kJ3SDz18C60kPr8B6rEIMfU8K4HE=;
	b=n+I17/tYPbruao0qEuXo4xQ/ZSyma5cjWoSE1mflWqcCsR5i62gzj/rsy1N2p2nyL1Ee
	 7hzoOVRiMEO6V9/d06Vt064dYeGBOIzu8kvd/q0b2BMo29SAfHs4VJSZ3tdzuMY5xX+Pw
	 eQgkTis1xOPC3OgNQNkxz7IIxbDTOQsZtpkXSMk+SyVRJnJt5hZ0M3lXv7XLArxfcjw+l
	 5luBKzu9bIxM78k+6d9dLngPVBk+UvC+qtzie2RAcJr95EEF+brNDYAVXSVw0qJvwn1Ny
	 GvnRwzICLDBILCTr21FzXt6OJs1+OhwjGhrb221V1C1URg1GfhVCwjAxD/yN/4QCwkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWkixhna;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBB6606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 17:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CBB6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWkixhna
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9907fa1d2d1so661815241.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294633; x=1793899433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tY6q0/ZAtlO7c/3kJ3SDz18C60kPr8B6rEIMfU8K4HE=;
        b=EWkixhnao3nJnRtwfw5EvZLa6enZDMvgknCDeByS3I9hy/SdvyMvoA2P9cllkqLply
         1XlZsFMNi0c/ls38lTcr37I89CK+eijbwVcFLtRlvmCEY0vZ6dTBXHHOQ3DlCOYfehs2
         LI3OF3r1aPcqt2ZAf0uptkab2Z1Ubn+/e96z11gKW45GYHqMxStfxNUXBPswI+eYbPeU
         g8mNILrVf3D/La6CLwHJ8OVmTQz6uy2DDtpyt+Hq/q/i3j03NAohGUvh23TJaz3coT6n
         JSz9zVce6jaoHYFrjS4KxdtvNqdWP5/9sX14MgIgM8gFf6oObOIrRn/3IgxGr6vBL2r9
         2pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294633; x=1793899433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tY6q0/ZAtlO7c/3kJ3SDz18C60kPr8B6rEIMfU8K4HE=;
        b=r3+BZFeu9fy9Yjnko8qKIvic/PjpvzxNANeAl2CEHofhlKS8Co0zV3yTuZmm/4N3bi
         +Az7qHn5dSp8Tjj8ZlHHiBGC0mpiG2+jpq2jlFVBIs8tp9GhVvnoasP5YKtKTC8fK3ZT
         FiWZYHLlpxC9A7+tsAe3OYvMMWwhZFG2GdIf7hrcHmpSVkau6XHfkp93WKZWKCHoSubf
         88Tyue3PZ/6XrEwdI/Cyosb5Mk736zFn8fA7wLJnZaQCco1eiDNpyXOhF4YCyUn3xJbc
         V5nO8WJpq1HPY19DxJ+9BUKve5vGaGv5hO/p0qE7Q9acKDlsAhoCCQyO0h3hL5JF2cJL
         8dyw==
X-Forwarded-Encrypted: i=1; AKwUvBzQKNDZug0ICUS3Yx2tHMGWwRDgDaVBulKSIF4FkVpG5qX/d+PrQGXNqoepNqj93PhqeHnyXqqQXI4T@vger.kernel.org
X-Gm-Message-State: AFq9FYKyXIMqoUMd4P2PsUrQ21HQnGk8aZapKmRtcN5PMb/f5Kp5UOgD
	Zrk0xEfHGOw/uD6tXlh/dH6b6fei59GL74cQtGV2BAuFbOkbTvqjxo45
X-Gm-Gg: AYBFou1adjaQF3gpvpsjupxAgbdc4MsXoNX5IcNd4S92V4jUDmzqnkLJ+zn4vWv90dI
	zkrAlIMbqM4ZOQHgEBDxprvp8aniQh3TkTPd70F0qvb0uHcI4i7Jz6JMB2rPr7yJA0ptNo0q8GJ
	c+J5s9lLvQhue3NFzPpB7fwAp5JztmTx6KX1PVBFLnVp8i4Qu0SJ3nNHtDlkuNtccYqWHJSBI3y
	d34vbehyYh+y4tls3jZrAxJ/zq+tzTvFLknoaVItijAuyIUmUMeYd8QPsgtYJ+MIryvYJlCsBDj
	p/6zeGK96vbj82LVXtFLrMq8mWrra2/jW85Qii7Cyitm5lSKkRFxKS4KfR5r0ZVqh3cuTs1kwKA
	z2N9aC5ljgSNtk7Rr8QnO6rdDNrHSZ5wbbGfp4QIs8sTJiSaXO+bvT9+Lyz6zQi9GoQPQFTbJhN
	WUrk6gFXed+CHc2CLiwWuvl33nXUUPYP+uFpTx1NMeJEU6zMadIf2YsL5vqR3CiUQB0ZaFCeiKw
	AScYWwvp3M7xDpNAkYu25AAXxnSBidyokYiMxT11s0pn30OvwnTFihQHgBsBJC/FRZbcVb6w+42
	bqdEMQ9CUi7akW7QItboJ7plsH8okO6YtgmElU6ERw/bBl4He7X18cjugdHzekhRtpB8xTy5yta
	5GKJeF9iUyHufeNWwgpK4lWE8IJrUjNRAMGKH
X-Received: by 2002:a05:6102:1626:b0:7cc:2bb7:131d with SMTP id ada2fe7eead31-7d03a4eabe3mr2727809137.9.1793294633099;
        Thu, 29 Oct 2026 10:23:53 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d32a48sm9907357137.9.2026.10.29.10.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:23:52 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Date: Thu, 29 Oct 2026 14:23:24 -0300
Message-ID: <20261029172325.3425046-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
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

The USB 2.0 PHY in the Allwinner A733 works with the D1 settings of
the sun4i-usb driver. Add its compatible with the D1 fallback, as was
done for the A523.

It gets its own compatible because the driver has to clear SIDDQ
before releasing the PHY reset on this SoC.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index 580c3296a18d..da4ad6fb3531 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - allwinner,sun50i-a100-usb-phy
               - allwinner,sun55i-a523-usb-phy
+              - allwinner,sun60i-a733-usb-phy
           - const: allwinner,sun20i-d1-usb-phy
 
   reg:
-- 
2.43.0

