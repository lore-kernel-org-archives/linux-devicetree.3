Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D002931D7
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056847; cv=none; b=TcOupdXIeieR4rvtDN4gEfXvR87DIPmaNdG01N4Y3FUuQ7MVgtVTbVqla8DADANueBJPuCvh2aNi6HCT0VInljLf3WO10pqAnfOhDppqOt4vkq9ibXJmrzQOTXDZU5nV2bFliUkaAn5viM6ftRflorKmM+NAAdZPOlFCIxQ9qUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056847; c=relaxed/simple;
	bh=+a7dMFgf/n2MevzTFmfFzUf2OfUrlBy9Gq2CMG89zaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZMwc6SRzianRypTJjTfhDIaiVtT/PB3PMEAcx7zU3W3Ftm0cdycSdYN6n4D6UtWCQ8v7CBqgjbNiO4hyfwJwI5GijNaL+4aIH607pjBpk4UJXdcXDmBZHFKNRd9y7bh8jKyGg7koecZ4D2A/g2ADt+UdECH68Y3vkMNQYyF7JD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gMrjWilC; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gMrjWilC"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9f5637634so815906a34.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784056844; x=1784661644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO2pL/LPzAk6bW0DPdWAZBSTIMWvqbQFEPPgH78ikCE=;
        b=gMrjWilCankaLnA1qyWFGlYPzSQ0kiBL4XbO3J5Sn4PBSfNAq51sLEZ7e+HumC88qF
         JYPnLVRSU9VwVXKA9zLyjRvUulxVOYFKfOCAfLiGUQeyQN0zJ6OPBhb5dVlDCYvEZj4T
         /BwsTMenv65fml5dkZJHjxISwJFosFY4e6/q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056844; x=1784661644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO2pL/LPzAk6bW0DPdWAZBSTIMWvqbQFEPPgH78ikCE=;
        b=YK62+i3psT0jIqd/Km8vdAgrRNwICrfmzrxsJK9mM94rpWaHwaN2FSx5vpYzwe8Py+
         5TtmcrJzgygUI0mRnQUyyMioDdOswrCn4dHxAkHoG5tQMMZ1AesL3D1Wd7f6FhtBcTvO
         QMtUL4xD4IbEZQ2pwl+GG5RLvR/UNTye+RPt5+5Ki6eOXIGODSbhqELvKT8yUO01sSmD
         /PQo2EnLYFySreqbUdo8/ys1xpL2RaKDCF6337Ra7STZXMvTMuRlMPlPb04g0cwfXfG/
         Fa8sZJgWys+p76nHo6dRtQrXyl1DGmysRIp2+s3/s6Ru1xqLZMjEzi7NFKOZHlyk6LP1
         +z+w==
X-Forwarded-Encrypted: i=1; AFNElJ+f+zm0BDmMtHETSVZdIC4GS6YT5QEK05BOHLVhMEOBOfe3gB+gZblsw2IbsOMR4Wyg8hpx22EfQ6GB@vger.kernel.org
X-Gm-Message-State: AOJu0YzelPaBV0/3O95lOoB8cdSn6YQmO/8SrMxwqs7lGO0YWpIpl5F9
	L3wUSA2YmSScLVLMAKzD8Y96nCZl+aonQlo1mPbauDJQYfsDICzmyXeYgvoJvUKfBw==
X-Gm-Gg: AfdE7cko2/DER84K8DzVO8xfdpYKJxrtCn1NjZMoz02WeCo1usR18xh/+Zd7goyHU2D
	gF48GAlz1/tlFdB4zFJ2583nvAZBz6orxEoBvK41BfduHTtVqA0iaS9cY7QEa4IF/wsflIvA4mo
	uyIJlUMOcTFSx+LPXP9OVuS18VJsKSSx+H0kLDXGzx0a2MgngFkFfi4Vpk5CHZxzKMTFpc3T4br
	XhkV6U1WbTZCt1ign/KO4eQghsK5yBE6axP5ThdoeXwucEzwGn9mC2G8wZ7p/r/hVkwNGJZJ7Jr
	EmU9gy2Yg8j+zZCxXgWe+D+hnGSMsbo8U+mn+VqFIys3ZvigaWveMNKMSBZG3vaBeHMQsP3kSF1
	cX+zAyqr6Aejj/pkSSuDtcYroUwUStUwx5OO4QRTcSnprQn/d6/kEn1mlzKB0gNMYvGQtdh0Hmh
	iAnG8QVHc=
X-Received: by 2002:a05:6830:4490:b0:7eb:d848:c867 with SMTP id 46e09a7af769-7ec095dba6emr9656696a34.6.1784056843773;
        Tue, 14 Jul 2026 12:20:43 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb3f27besm15476081a34.25.2026.07.14.12.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:20:43 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: serial: snps-dw-apb-uart: Add RV1106 compatible
Date: Tue, 14 Jul 2026 13:20:36 -0600
Message-ID: <20260714132035.v2.1.c1d92213393f49330ec14d0c670a802181b4fcbf@changeid>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the UARTs of the Rockchip RV1106, which are
compatible with the Synopsys DesignWare APB UART.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Split out into its own patch

 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 49f51b002879..c0d0524458c1 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -72,6 +72,7 @@ properties:
               - rockchip,rk3576-uart
               - rockchip,rk3588-uart
               - rockchip,rv1103b-uart
+              - rockchip,rv1106-uart
               - rockchip,rv1108-uart
               - rockchip,rv1126-uart
               - sophgo,sg2044-uart
---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
branch: rv1106c2

-- 
2.43.0

