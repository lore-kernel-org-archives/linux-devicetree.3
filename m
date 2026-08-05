Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F03DD854
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 19:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956531; cv=none; b=YkiwicJqX28JXUEVT2OT6LCAWbyJCH2OkQpLbGkWy0Sj9ktAENuEwI+ucinwNh1bZQhdIUXqgzVz5EdwKJpKscyYLo7IkammwZPWaFMJtM1it2vH/Xat3viteWyWuJec+G5M56D2iUFDjzhC7WdEuVyWMZRXwBxZz2xQbTMINak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956531; c=relaxed/simple;
	bh=MGOH5AclWmwDYubwBefKCLObf1oOBAcUcYiE7XtJYDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQdkYzz4Q7auIY6aFcZHdUG6yu3vtj5z36FTky0dXzNL+L2PPwgFMcTlBI7oh3ZTA82roQp7hRygme0sVkVJ4SIB14VGyLzhCn2tAxiCrckFJwF39Qm5OJ9YRm4BKKtNPc1M9xeV9B/N5B/lJuBDXZ4S26qmqQMtO2fy7W0Mbpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSO6ps+s; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSO6ps+s"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1190933a91.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 12:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956519; x=1786561319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqFqTq8OtkT49OqMWSzdruXl5NKOkBcHfD9uz8H4myk=;
        b=ZSO6ps+sYYnI5U1AJa6GTvQlKlNekhe/5ZKz+zLOTEzkVl6nNweS3eq6aN3iaA0K1l
         3unUSOqjLGthcLzBqG3fsF24eSM0PeCHvAUSxIyw9/Rojgis+lRpEEJcA+A+1FwaSI+F
         t8mAt0hVWIQqOrxlW2MYqS4MIKjBUJOnxYeZzLCHPMBmG8v3V+59fClOzxq+te61JqoM
         7Q+gTRC8GdZbv7nPfJjQwCgRGDcINNBKSGjhUyNppXVW91XImubVLwJNef1fXLZV/8MP
         xUO7UIEIv8zeNmKS1ej9+rSeTnepPrztFjbNjFnj8uRS7D5Q63jvM13+/LQOntvGf7Ij
         grwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956519; x=1786561319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqFqTq8OtkT49OqMWSzdruXl5NKOkBcHfD9uz8H4myk=;
        b=TDELKVvGNz0P/t9DYBdjyrtFS/ZLkmhFRSxhltVLqT0VZDNs5gU6shlL5nkJ1a+8J9
         +bkMiI1jyqxqu+Mme2zJ7zheNQcI7TDZZirZUiKZxo4kNBqMoD3Le1GInekJQoz27fYm
         q/cdFai/sRaptIdO6J34l8NzgHcB8qOdBvOH9ATBMgTTRqSZwQb8b3Vq7m80BqYTiHYf
         Yir0f3OxS0NW8zQiEKPO3Z3OlZFXrfSXJBozrBdUzMF1DAzPaPBnc6qQY39R/bGIueBQ
         3k1ZLbqsC4e1/XcpNSUkz2ZeVsE9BsGbB6NO0eToWgGVYHbTSrqgwWIa2v5DLaOvtncH
         A/xg==
X-Gm-Message-State: AOJu0YyIHgXiLUQeWkb+a86Do/B0Zy9GcU4miyX5DDRe2DQINk/mfrPN
	jA/d3lW3F0bh9YFA+PmjmGDlZywiAd6RjDOXiv6n1v6z2oyuOFCPdcdbNwq1mg==
X-Gm-Gg: AR+sD13aiqp3pF2pr3mcTAqlhOYKGzKpMiP7FTkjQDkvtOQvm6zmm3v4RR8b28tcS8d
	BYdoXDHyvFm5rnfArEU+aprFeE5vaJF204JSd928q4i4Ks+XoYG650ou9C574u7a6TF9ha1+MrZ
	kDxzMnwDf9Le/rW89E5dJCIDpK5ovdfExRKXrwfPBrHdgCuo/lCRk8SeQ30N8+VAKmewj2ccIGy
	IBU4hAGUERlWKnBD+BxWKqtqCASdjd50S75A4bBhgkg2LWJVK7VGE6r5ce71d+wLZVmY710RZdG
	h00LCSZbCOejkRSYeXdVKfqnTwyXHkFb9085R1VO+m9R0P/DO7zyQDiJPceCLJFFarSs8/nQ4z/
	4ih579Kkj8emTHylLfmB+J76OrIklJQMECuDs+iM+XHIcXYXJn98GVz3HCiyxBwphWtNAm2NaeA
	8FQZ20ni5PF/5JhdCau8OpWlWuFAWLJopOCZSz8jk/Y98FdLaBCZwviRihbJ5L775/lOTnyQLOm
	ZGwjv8AqPu/KcOk/UFZt4Ht9StAOHqXovNYthwLgnMDOPWDLg4RlCFduZitHuUURxfO4Mi0yEbP
	NbwaAzU/6aY8HOU0Tmiq9Cbd0n/hg31+AbkOxQ==
X-Received: by 2002:a17:90b:3f43:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-3903c6798bdmr10543809a91.21.1785956519158;
        Wed, 05 Aug 2026 12:01:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903f5e21c7sm2023350a91.3.2026.08.05.12.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:01:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: AC68U: set WAN MAC from nvram
Date: Wed,  5 Aug 2026 12:01:56 -0700
Message-ID: <20260805190156.6942-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
userspace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 3fe17bd7b86d..af20d38fa90d 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -83,3 +92,49 @@ button-rfkill {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
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
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.55.0

