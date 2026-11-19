Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078515;
	b=ItL8UsTc4aXp2VnF+wtEi64JZZNLD17OZTyJ4XayKUapeInijExRFmCAvpKC1G8hyACz
	 pq6VgscGQEXrrwXpPIi5zZRiD67AcDGxWjxFlrhtWyp2ImooMqyxOJT+dtsJIj9XtiLkb
	 HWe3LdJseMRXkg0mDilBCHzq87HB+qCy9N9vlqA2gN/a0139iPD1C4gBIZTfIfAkeFJ4g
	 shTJ2AJ59pEl6HBtmUroU+Q3Dri32r0meghKbdQFyzIYenoMZIZwqmBXn2DMy+7f6jKQb
	 l0+DGSsIpZqwloMQGcEwyi/XXyCPXz5FilglRuJe9gEmrUevE8B9M93djWZwPrTrVlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
	b=CNPEAyokJVecU8hOORcDouSy6Gl7aLpa+VyzcZzq7o2PH+B2b6xlBpGtfxkC+ywD8anl
	 VaS98J7a6jYKGiRo/BRkJNqi+8vUQTgQ/yMwut1EujjFjkUmqL2xoopiIEC8+67JXSRKV
	 FMIVpRH8BCLb0hapmkHp/YVRdIIM34n9Ws76zVeOcAtxPLC+4/rby+2Cl1AO4SpbpnYa4
	 baf6ymFBRB1+iP+amsV8eJ4jCBZmWOWbCAmRGLkY8umXKmzRNG8BXXHBzQhEJBp8rFfXm
	 63fHg+WvqA/iVB471AIm46jl7d9ZW7LdtMLX+c9vQwTm4wj4Hj6ZkVW+kxMnKoMr1rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OHZIg8ET;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1045606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1045606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OHZIg8ET
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53644ab1f7bso15832441cf.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078513; x=1795683313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
        b=OHZIg8ETAk0DNT+aUkAwMYKWXfHsijcYNg5yRNZxsoUAde/6qykPfHTzWbF7RFZm2Y
         8PziS/WKuoFraXE35QGaUMT/N7ww/kxDtgd4X+AajGfqvXZSwz6js7bGPxGInQK+R92y
         o02l98qsFCRu5Kd9sQICUjG0PhVh8x8K1WlnfBunRClqI3nOs3aF2rQRpbBRceuozexK
         Uq5H6xEjTqcbhO3zxyE/dTovwUiMJRBAElIBNg0JTe+o+1jJ5Pz5LtupRZ9mT3+RAeTy
         PZeMOvI9lDK1ZuSq2hsjobRsOOU/pmBxDRWc2gdv0skIuN7r14sRt15J5RTRLFj4W0yP
         54Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078513; x=1795683313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
        b=BPMd67vAXWcuOAcLvIYsaUYzS8W4JOxyrvM1X73j1PgVBMdM1vQWBZJNBf3Fz22jD8
         KJc6z0lGSVDwHkZl36vxeHsq9Q0szVSvz6+uAGR86X8DTbA3su2zF4x4+X5GuP3rwke5
         uXkqRfuT5RNdCNLijBf7TDdGRxZWFIGFeb5pZ75kzsGMidMjRORgVMshayY3NUOKa7WS
         Lehv0IjwfWmYF1MerrQeo3/kZLcerdkqeoA3ArPr1ZlrxynALT49lHMD+3cVZS5FMqb8
         pJebXkxIXEcpv4t2xhTgfg3ORJbuVV5+Asw5+vv2yDvAo4WJwbtP2bi1zP2cI796vUNz
         PiAw==
X-Forwarded-Encrypted: i=1; AL+hErHuMaj2GDdBOEf1w+YEez/Teo6MQvANhqIz6ApkHqwkeq6yNAJ/nVVlVJ8oLhNx7xuNgQZYvxpJ9YNZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/UAcSTYlzwHqYEh2x/I2c/0AnuTGc/13ZJIeb4i6vWO1mviuge
	KgX+arqnaz05tJ9uXPMP0M4prstq4Pf8XBW0a7kcgf9dlEY3MTtFeebH
X-Gm-Gg: AYBFou14xJt6PZ027TRwCUiGH6+TTHBBACi2J+et3QKhNwizhIxwjHD7hdtYgLRngPZ
	zzE/1UorxS1z07QnRiGSqLiafOd6UolHml4GU7t3T8sUol/QHmVhtvB8wAxQfYTxLLCziJ05y7V
	c4tXD0g2vAr4nARS4jOCO7C5kT8JOQCDsh8PuX0E5tqAYsLwoUZ83jJASwRVjI5HZviR0lOzQ/r
	LyZ10rfo6/i/bMmF3V76f6Npei9qTVU75sCT3w8xKu4geYcpDWkZRjfBA4cfTner4QtWF0/vyDW
	mzwdS14nx24rcMEMFpfgZBIf/5TEcu9xyTacGM9AOriEFHcVqo5jgIuUnX0/jPeptqXyEYstao/
	MDAOn7deGkZDheEmL4y0YCHFhKhkHEOkP35n3v+dlXfxBEcKssYeI5mv/pDsZ2NMf7wRW12AlY5
	aUYlhEJE84UQ11srGxi+Hv+GoPAwwZO4wFfRWfYz6SIeiDZebFtiVDrKdrFtCRrlGPVclbAQL0X
	pvhOqe7QGSQZOg9zmrVgrTDHwH11CvOEehl8Mpc/kgOO20OdMKwzkXJYMUA8Gue91MMDJXIToSO
	FIqOWq/IilkFqV/z/9yzqQTCCYcPqJg7ED1x5fLaCj3/SwY54yCg3XSTwZ513Jtb6eFF3d+dEOk
	xJRLDQwyl5uMHyau81PghdBN+U6oXnSuJwEyvfRzFeaP+oJjlxu1j4EV1XVIleOdcq+0Cn/KTQ6
	5PSA==
X-Received: by 2002:a05:622a:550:b0:55c:b6e8:bb92 with SMTP id d75a77b69052e-55d5a67f8femr84858911cf.61.1795078513647;
        Thu, 19 Nov 2026 00:55:13 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:12 -0800 (PST)
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
Subject: [PATCH v2 01/22] ARM: dts: BCM5301X: AC56U: specify switch
Date: Thu, 19 Nov 2026 00:54:31 -0800
Message-ID: <20261119085452.75708-2-rosenp@gmail.com>
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
 .../dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index 708599f8c4be..574fc4f76e75 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -106,3 +106,40 @@ &gmac2 {
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

