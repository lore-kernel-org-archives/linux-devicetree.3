Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078542;
	b=uZT2XTc9BsLFzTrawC8Pabm/vGStn1QbpsmGiqMqvolax82E9npXDdc+2fXUc/OgLxof
	 ITdpcDzKRplT9d8L5bJDeewBqoMtJ3jUAD1liff22XfDN/T07GqL4aTYIgSeawmffAFwG
	 ID5eDUmLdoJGS46EBLaHQXCBWdy1mptiuaRZ1ojWfHzTP/Q30tR+gEEcFZkSEH7tpIxcO
	 iUNgaVbGqcjzVgGyE4IrGGCDwAhcr9AEG1J0eSMn0gWbOqJp6QmSs2mwmawtArFzR8E9H
	 pglg2P+mIuE0oWkD8REhMKfSBX5jvKtVlvfWer9/2hKjOXqNrfE0vPece9RG1FnUJtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OTgHFbj2wY5TghLiWIYijNXspkdDjNg1qUeCJ/ElGvc=;
	b=ewa66vCc0oBvJN7SoVXKzOXVlrlxLGMqJAk6c6qX0ls2/kM8PLeqDOBMPnuvLEMPf11F
	 PH8202C/iCNI8IPjJtSsWjQLrDSvHBF7QKJRQ5iiBS//2Nw0kDmDrYPW+435qKlHzgICu
	 FEDNcxTHL2btAcHemMTO8f2kucJIml36HxwIkb+81GbaHgBQHOfYQ9Qs9Q4Mtx/ApJUt8
	 0v2Wuegt6SAfXTi4vnRnX7se4YYzr+tl6YWlSsxw5JYsbpL4DHlosDlpz+JWhX5hMRZIg
	 lzMSDMmrrHiS1fx5Gp+6zE+zfIJEV5yHFe0eQ5ry0YOu+ZTQbNzBe7VUtTu2jVzL9FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qeplfkep;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1644606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1644606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qeplfkep
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55c4e670fc6so18662421cf.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078541; x=1795683341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTgHFbj2wY5TghLiWIYijNXspkdDjNg1qUeCJ/ElGvc=;
        b=qeplfkepIibdtMCnIeAXG0lMe+PFWN2QrlE/T2y+DMND7Gs+5Uu9VuTtwh2fsMJ+mY
         5jGJPo4jUzU2InJX3dxafw81H7B9M4c8+M8DuNUPfWR3hRkt+y/TC+5H5v+3yHlVSn7B
         XjHVvxhtAB4BpIoygcOCEbAZCgi2LDxc8R5sbM7cgjq989OK4nGRzd5+ZyGv+GJZTZem
         x3KkM2ING89k1RjkuNRYsMGqoC3qoEvRX4qQrcFVwnTuQ5IWHp6a63wi9IrtDO9zR/BD
         qNjGnMWR3KokUdAHzgMDkOypRO6+CXmFLumXpLnVKz5RWyJ6ST9iADhy6/QWmvHX8nuJ
         gmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078541; x=1795683341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTgHFbj2wY5TghLiWIYijNXspkdDjNg1qUeCJ/ElGvc=;
        b=PpN/TQYX6utd0YVnVCDG9LpGgz9N7/SLPDo8e8dKOvVNqTSk4Ov+Q/Wt+323a2yTl2
         to9SJUNoe+rwOaSov31lD75JMbiw6to8Q36EQJLjppb9/yr4gyMjAQgt5juzxRbMvq0R
         x+l0fyFWhSF6psfwBtxgc89gd0ILkEOUOHLd7Ya/cQEwGzKUMFIwNmZVk7wkco3NMES9
         mN8clupPHdPorOQSmXSfEWJ3o+Znyv2rg33ySCwQZ5rQ1gjhBVD6nRWvTefhmgLg8QPv
         BjDHU/oVYvyi/I6KTNyOAemXS27u4ikLdKDO56RIklt8YV0CsvCZja+1gYI8w8iPlOLh
         vY/g==
X-Forwarded-Encrypted: i=1; AL+hErF0ZlkN4I7g4ZoH9Hp/8/2UrpDpLJdDTgC0Tdp6t89fx5MLL0zFJbrOgddHWZZf5YU9uSJ//4efZ9TZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/zAMDJLPFrkxmiRGNDvfZKQGq76O8x/orP+ypDhZW38Ztwx4YF
	hoJBl0QKUb+ByGsbJJE0/uQDWysJpHby3Z9tLFW9LeilhTpS68tTQzI8
X-Gm-Gg: AYBFou3LCAvPztJAWnLFAv1Rr73xKMaVcOZZz4YVGP4H2WUOvsSK0VkADLxakAVbaeb
	RuVG5pENyRJc9+eGZe9Xz8C6aTzjnjX+CTitaUwilGgXHXpsw/ZgmLtxq0lWg0DgVy55+ERPoZf
	f7e832pjfMXNmGLy7dZ0Zqtn/w1uJy5FS6EmduUWSSz1xt4ExBrT96qGPDlptW+UJXBxiuIRWx6
	SAHOEQa5y9DVYvrMwZ4elgoZlvbyox3NCCxUHFIy3Q4ZR7D9ZreCQwB+gu+63RSWzr7hjnnttYa
	oWVNarfD72IkLbkAkotWg3CWBz3wc5jvhEvd9OL+AFvzoFAybcE4Xo454y6xpEOqpl7ZVIsEbcv
	XfR0MtVoTdi27+fCaEkLSGnclRMBpUTM376U1uDaPkUSdEK/n5l1A4UuGTJZ+1Xz2ktDD7mAbaG
	6Q0YAuAfnOmsiydPSYXH5p2aIYMehBPjE+xo7vyZWO0jqpXsUbCzGW85pLug4sWt5acVOqPT70K
	2n943nEV3NSucdw1KtBLf+6JHG3ANKE4MEgru49mI+vw1XjIIZwyOC27vkOjnsmjEWS0vLGYEJy
	1wkLSIEg6LOvOYTfvAuFDPvAgjQlwPgYlfEhxOYy5HMc4Z8h6KIqTFmOJpn6c+FsSCxXZu/yPoo
	yL4VAbsNw+2OKf60lb4rCfdkvoHtWciyUs/qnlpnVmlqWZCyBs+Tlqoe1+37gS58dOemEavCoSe
	+svA==
X-Received: by 2002:ac8:5dce:0:b0:537:a19d:41e5 with SMTP id d75a77b69052e-55d5a5b7f5cmr85412511cf.50.1795078540475;
        Thu, 19 Nov 2026 00:55:40 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:39 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 14/22] ARM: dts: BCM5301X: R8500: specify switch
Date: Thu, 19 Nov 2026 00:54:44 -0800
Message-ID: <20261119085452.75708-15-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
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

Add labels to clarify which port is what.

Also set the WAN MAC address from nvram, which is offset by 1.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm47094-netgear-r8500.dts   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
index d312afdb750f..2518f25b0eaa 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
@@ -108,3 +108,40 @@ &gmac2 {
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et2macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

