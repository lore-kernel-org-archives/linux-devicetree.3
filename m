Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220804;
	b=USugNv1CYIKHXzNThBm4kAvgqGG+J77AInc2hSiFraJHFZgy82atfBvOL1uAeQEpb4bx
	 s6kQ/RHypDEioLvNtp9Ro1puylCt+v7DyLEx1rrBWz868wiGQsztU9lyHA3z6NAqY1Gnn
	 weDkzRr8thECx6t4HQe/HLEkQnxMFdG5J1f08Rw5ftomIziKJQuu2+PbTsbkC73gc7D6v
	 iztgC6bPt4NLNWPPcR5dxTgUY89KU0K46cdQW0iS5fj8KwtB2BdkQ1aPo0FOiJq/Y2q9R
	 yqCGmqDJdNcZd82mMVapo+P+jeNjPG2STGPkh7HaR6EU6P2u25PhZ0rpmnBRnku5ZDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
	b=0s3dpKbRlOTrllkeWkaYTkkvIF5Jjo2p6zFB/5CQ36NWiS9oqeMpMhV4brftGRCzdVbY
	 ph1sM11dlpSlrwjJ86sNRHPhrciDLXvvoCJH8J3E8Ncm5H+35hzy4Eb9YR4YNqMTgVP1U
	 i4Rl45aVnLpvXwHFIFJt2sKLQKWFv166k3VGpd1aRKZDP77zwtXqFGmsftloXvPJVvN4o
	 c84xlt5z8KSDTcOYHbCNJDsk++03jPACj6foNk8Xb5Q49bttE+ygXpgVyY9ByTan1i1YX
	 539G1uxgkysHPdRj3Vt5NQG7qvGc7xsvTOc9Tx6m29bOjzFQUaXjnvUXoGK+U9AUO9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMZye2qQ;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E53606A6AB
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79E53606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMZye2qQ
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8c6c06b3321so1303587b3a.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220796; x=1795825596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
        b=mMZye2qQbsATCy7dJQzhAnAjFi0fWYc689rHGFa8joovg00NTNocJ1wFrhwh8hvrKS
         4dTl8pcXNbC+kwgmTrTmaHl/OIWjy2SOnY1w4cBuRMA23LnaDBl5cbiuDnArwckYr66D
         SsHFtkEIv+yxnQkYFUys2u4MxINZPrauSfyObRFOlsWvLViyYoPBOrsCtpX7AzD9jeTp
         D3RAhWWmttBEVsdS9YCifDfCn4gep16iWJriXdhtMgrLfPaJMCyiO6aQbtcTjFNVH2Sv
         d25pCL5reZoappZ5cEoqGEhYaF9uVxOsb9IH5vyJfamqibCTHbSmqSvhxCPemrnbEZtP
         PhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220796; x=1795825596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
        b=gpeDy7YsXJBTxQSGlY7dyVtIT5BURRSMgmJ4TmTA/VKGb+y+U5EOhFpeabS9yfi0Lv
         UNGj7UEwrsX3qqkMiuOTn+97ezx1eAkvxQAdavAzoDNiYpjtMl7d7RsW8CU+R0Lce7a0
         Xi5k5FpF+GXk9MjYq/hHdhes7QSMVvfa2z1VZVI/DASS2WNGi7RRGVVy9kr5S5Mx8zBF
         g1SD7w2oCGb7U1XT+k8LMSoCcbpKTQt38DsMrcZzE8o9tv3zotFAxlOgDMypucGTtjfR
         Y5GR2mQfHv3XP49DUoGrLq2szEtM3BR1OLFc0U2dw4RC5bk9VMJ7TG5NOeEQHgqE8iTx
         ML4w==
X-Forwarded-Encrypted: i=1; AL+hErFIuc9s2EtUjGmwh1hmHggrk3HrCmpuSVa8gfqkawLLGwPj4W6LgzVWs6p+EI8IKBu2+QFiy/WJYMBs@vger.kernel.org
X-Gm-Message-State: APuU4Z9b3XKe0ONGkMwhsvn8ro4iQnmZXoSWiz33Qen3Qg49tIV8CKS6
	nhHDcpOsdGwVOiWZtdF+ONLA6ve/lNc8gxV/HFmSvGgLowvOZVQue1Yw
X-Gm-Gg: AYBFou2aJm0MjPJ5qoKvzQs35NS0xJUYmyk43IlDjN9DW8LAtRYzlNbEknpBqSDQUZq
	r9RuCMke6pVBoLKI6J7aHbDQE+USuTE00J3Jvy7Bjb+DzGzcEZcGBbU5N9Lu0+i+6A9Ynrd48io
	G+LwC2HSySb0eIkOU3peJSJRbBOeIaMirRcY/2g4cRz0DR7Mxsj9Pael9uBuOrAlAip0on2bSs1
	MaE66uy1et0WGQo3nlfUPsEXRxrKtpdaYIJk1j70M+tf9ozua/62Xb5gMRPndpPEbxBz1Qm4BJD
	kmnoBHxtjk16IczwtobqPQ8ZDqSR5Ps8NOSrig+2cWXcOZ2nQqDnR7avGPWKQsu55IUVS0urmkj
	uiaVzFKsRpCr5yUqJKe4BYPdHeZVhFc/eg9dzfu23B9j+4jEP5u4/SRf0vkCLWzc1hwNxHDrsEh
	sDD9F7uB7Ysih7CracIQHMw0qL6BEr3pRdy7k146lapuulrtl1MK7/SqgD+zcIuKiPBzo98m9oG
	/e2DT043CUhs6fby/HfysMdNqHGBOZ55/cG6zGHjkJq+yZDsMA0fFvpus3cfJs5NVIEv2y5eIkO
	A3CiVKQ56FQuTkvthu9POD5B/+FQRHTYPedSU5DsFV5kIabgCtlEFDrq2AR0QJJu/iAbNzPeMxE
	OiL5VHpoLuNPfNHnvjzQd1jVN354khy/xpwJoCQmx1v8dIQFG6bQI5qo6IrGfaUu2D09u3Av+l6
	pniBou/h4XnALBuf/bo1WRpI8=
X-Received: by 2002:a05:6a21:7e83:b0:3e2:b561:2b23 with SMTP id adf61e73a8af0-4014c250045mr2849998637.18.1795220795744;
        Fri, 20 Nov 2026 16:26:35 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:34 -0800 (PST)
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
Subject: [PATCH v3 06/22] ARM: dts: BCM5301X: EA6300: specify switch
Date: Fri, 20 Nov 2026 16:25:46 -0800
Message-ID: <20261121002603.25254-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
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

bcm-ns.dtsi specifies a default layout that is not correct for the
EA6300. Also allows setting the WAN MAC address properly.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index f8dd08cc7cca..bca4c440a499 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -59,3 +59,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
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

