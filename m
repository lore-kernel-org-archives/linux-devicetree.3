Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078518;
	b=Psx9QnygioJZNT/A55rGvDkqa5MxI4gRGHejZoDLJKHhlTaPCANMOx2Rxl9G9qNxNpI+
	 hOmYWZxVjD5BryIWfB14kmK+S6ZPitT6VxOgy21MlEZ63EpHv76ic/J16aPa4YKYuFWr+
	 MxR0INULOgSqDiymlinkwnI4G6ZaXFb5EY0Ocl3XeySDHFf2cy8KgpcFAywkPQzBsKt2O
	 uyd9SSucZSGcHsg3nDdi75PwjzkdJ/Yyt7lC04ZjVMY+8Y/xwlCStZOAH1q6Wb0EhQ28T
	 ffAXsME+hW7cKRl1VNuyc0WYOA98K+r5DDQtmPii8t2Me2J7sQcCLPDrK01AlJojoJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
	b=nh7XjIw+wTILRkYSBi4QAca1Zk7E3Aj43SnoNFEgUB/QR28FQdkxfol+W/XMcCmRDPy2
	 GmIywFGeTvaWpa6iJUOUfVcElDUV6a4rMVw0VeAGHALRELvZm6SeGDTHn9OiD5Z4lXzGH
	 25y3uegbXmJctfCBK9lJ3CCYTUSx8a37G8XPtAzvEHYPduazLGQBJNboDdJpMGDfnJoru
	 RCgD2KS3HYPB49R3aXBlxYO6GVJC6Lbp/9rl4lyezDQpmHOwQ7yqRjl9s/5Onu1U5ljwc
	 8WKrf9chEF2dTU63TmRcT8J5qdDYv/b2cSZLNHTYJ3HFJ5m7q3TqQeYUpwN9n+hgaWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFkXxzzS;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B86606A326
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62B86606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFkXxzzS
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55d03bfd477so20940081cf.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078517; x=1795683317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
        b=iFkXxzzSpvJH2hN26Lkla+tBbK+EGwAL8o3OxhapEpSMWOGKa6wDhjfk8TogQo+0m8
         AqI4ajjLQpYoBaPIszin/P1HiOdAMzZGCtGHAbbZBSjlu81Hqezc8AWCb7dMu2EsX1EM
         1seruBN8OT8BvnnSwXcqBJGISMCNEGa2jam3tksF2WHlG1Nt3Sfg36VUD9IZ3Krd13xW
         WAoC1U3//iJvsITuQIH9QITElJHhwLwv5yY4BrteWs+Gb6kJVqRs0qQb1NjjeeydOxra
         k49mM/50FqRLgZyi0IH/thfwqX4UAtehGDdEgKJJIEVmvnpZUcuZZmAxHU3HKM8Fxg8p
         LHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078517; x=1795683317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
        b=iUNTP3uBynCuLB54XnGif3nsbJieL8caNUczqvj08SUUsJJb6LrS9u5eAqGdx7BzJ8
         CoQCILoetm8JZOLwH5ofPMvvYdCr+tVPA5kkFaUdIWXuJ/U733kvdWkBJ96hmDBWMYXh
         BxHs4LatLZxkW3agk9jiq12tvIrXpo6u08nhszuFpok1MATrEH1vTxLhhnqESCvdAo63
         lvNtKhTdq+5i90lDd2uFjjRAYNEYNy64iJOBRjWDVAJMcyGROp1tOio80JQJZdpLhqjV
         I8KThYz2fnWDlEkxMkcieiACf1yuFzYZXgWLz1IsER5D9AYzUoLArkfS3aXmAGhoeW5u
         JIxA==
X-Forwarded-Encrypted: i=1; AL+hErHdB8Si9D1ZbHyrvHWnUKghHsO3+8DTz0qfGgHwSjiRQ6Tg6CfBX5kezZYte/oUTxtwUXLcTJ7hv3K3@vger.kernel.org
X-Gm-Message-State: APuU4Z/4pyjzpUmCbWCCwn42MoJ0X5++FWElOHmJzgW0Dx4lc6JTbXhP
	BNTcXJUwFYUwtL623YgiX//O1OTn8QhXw8yTW/wzvo5JWXZhgXGgLXIq
X-Gm-Gg: AYBFou0hFqrR/F7vGRS7U1fHKcqlyl08ZOxDYg4yX2y36I0evejByJyclB5e8ESnHyV
	q9mhTZJoOjBmF74DFp5qCbSGMYEpPjAlZJ3tRGT+k0wtHPaLKwEOZtAQ2TQ4mwrDKWLznctPXU/
	IgyFqZMrGA2IiONO42n4A1dhF5j9++FQB5tRa00qgheDWsL9vsVAihM/fCjcGnLDOZvuEy2HhMc
	x0DgwCmtLd/KdfDqRmOmviP9dUYFmAZByzdbNC0PkiqZ4HE10dKtEZgl1bXiYNywvrRdsIAhXyZ
	U1pYyA1O6VLhyickHZg1S/T3lCwNl6HjKSvSbe0tXzKVvkS0blkWLHbZASNn4rx/wJQ1Wg+Lqvt
	9OJraQxjoDwPwKkzvjQd9TkcqXSG0Pcr6ckdnR4nuZJnl/KD1lZpewHff47F0tnEz+OeFj2Usj8
	UO8iVWOEMFKM4LI636rDoap3WZ+XJym8jt5PbfEjLO5uUCBjDYoY4jhN491h0OCJc0Ro3iXZcJf
	WvExpFV3KkKDpCAXlpC+pY4Wqz+6TpjBoJVDDABc2QtOI6HOhCpFD1rs8T9ZstevrLSGR4y7AyB
	czw1Rqz8wxtHtH7NpYGjRDDIqQsUg8uN2YV1Cb9yAYy0/wmhVUurXsgBeTh+W/i0x3qpzoSTBXv
	eJwPQCBA3sanuchejqRP22K8T3ftOCt+0AbjmAfrI+3aGp2TS2M16fZAmPXF0fRI4Kbg5vzZg7o
	AhKw==
X-Received: by 2002:ac8:5f90:0:b0:53e:35dc:9bcb with SMTP id d75a77b69052e-55d5a6a942bmr88333111cf.61.1795078517303;
        Thu, 19 Nov 2026 00:55:17 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:16 -0800 (PST)
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
Subject: [PATCH v2 03/22] ARM: dts: BCM5301X: N18U: specify switch
Date: Thu, 19 Nov 2026 00:54:33 -0800
Message-ID: <20261119085452.75708-4-rosenp@gmail.com>
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

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm47081-asus-rt-n18u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 5874e6b606de..4ae4e2d00b7c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -91,3 +91,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
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
+			nvmem-cells = <&et0macaddr 1>;
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

