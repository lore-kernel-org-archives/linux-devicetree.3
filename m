Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220815;
	b=UAZjB4Kccr0q+axLEbFotXnIHmU0pRclRIwiyMMGsBcV7RNomyAiPCr0TbU81ON+8TlC
	 KWJt5cmpuPlwiscCyDPXU/jmFfB9G20BZh3yP3kq4/E/ZxoHsC+6ejl+uI3B+slPbhfrJ
	 hAmcadYlWELUe55Y67Wau6idymreXr8ONemlkXpPSDHyv+hEfO7g+OyCmQAGp8jXE3qZZ
	 O3mTCEz3F+6G2eBmBe/pH/c8q/3u7vLS0U9cbKtkbD3WVMSuEy0zUoz8zz/CdY0oYq0qt
	 Bnq4dioH0wRiaepxKC/EfAd6G9oljtbeGzMQl4v3K5XXexcQrq+e2gLlI4GCplca9YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ne2ANG2AcfQBisFLtvaPDWEXZjvBiN9ucVQ2DRwlTus=;
	b=l1ld5YTjRK03jiDerVPrPdTAJgD0dr9bs/C1rWsBXVyPeosDenbZkPsKKeKtPlQlrcz5
	 fdTgWbfwfNrcaQLjFX1xW0cxiD2be1Mw3QnG2xpLGMlIj7x5OGXk4F/+MM+kDNgR7bsZY
	 +kMy7LSlE7nXHwaIkl/tWyu+i4nsDs9G76ehttgjDAc9HCcRV8qxTr+PVHTV5QggoyKp/
	 2SCSEwXUkwkGknmG2xbA3lgv2ejCbLilrz+tNjlIXzms1l7/EE4wE0vmWo7ZB0yGDjawL
	 upGk3Nzx8KEl0iQ6tajJRWhrIXFED7LJIQE8tiW6DWr7W7zbOB5F8vZ7Ut9jTWWxPZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxDqoTxa;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9802606A68C
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9802606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxDqoTxa
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04e3bf46dso8358805ad.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220809; x=1795825609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ne2ANG2AcfQBisFLtvaPDWEXZjvBiN9ucVQ2DRwlTus=;
        b=xxDqoTxabcMdIA1bWh6qnrv4lyHbVGSF/Ib8q3TqcIWmf+MUvxSC++bd5sZKqJz8Aj
         0k5N+ozHxfHh/B9vejWsOlgnfFPNNUp30cJieRzxwiGkG+5SYhMWVzDEoXQL3t9UVFWs
         jCKYpsR17AtDn9LEvQ99ENJBRB52o6m7EVYXCKwMVEEXGwsHzSYz7Wy0upM3X18x3HNf
         kbNCDWGTVPm53sW+e/leQPnqJowiwLNdhQ/D8040Zvh394t1ENuShzsYbGZyE1UOb8in
         muMyqBVnRPblYrmP7EX1mW8DpwmjUQBjxbh4/nVb4nm8hDRYLGwBO9ynw/08ArUR3KIC
         45DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220809; x=1795825609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ne2ANG2AcfQBisFLtvaPDWEXZjvBiN9ucVQ2DRwlTus=;
        b=dZFYa8l+/nDdcmx3+OFkOVANC0oqRU5ZWKmXvo2I5ZjJk4J34wTSC5DPwtlNf0xM25
         YAG+DmcmrupQhFuCuroVdGdX0NM4qLpbZyVHfYDyVyp4xv0DouCnLmZiyK/KJvkf8p7e
         o0UCHv6VHZ3PWC/hLn0YSqodykaNtUffL3o6cqxB3m2wlc6vor3+JDi3UeM26B1hHmDg
         Xxwcn3REVnwnLZR5Flg2I4lF69dfKScHJ2z074U1aGtHETl7hPY3DZFTXc3McJmEjc4N
         +4zRJlPMgJjPRXsBdqbgbwpjZ0jdYObCmL1x/s7Q+nE3Oss2PiZFTzKV/SCco6t4dtbB
         RCVQ==
X-Forwarded-Encrypted: i=1; AL+hErFi9Po9vckser2HBkk4oZDpF8Isg6Fb0TxZTSLfxu6kzraIuXXLjg9CJk8DbkMsPTW/EVlEJ98waMZq@vger.kernel.org
X-Gm-Message-State: APuU4Z8uElRrOrMc8nS0wUU5tBPkolKmuxCG8XJrZgB0vkGpWY0c5dfy
	jNu55CmddWJFRfHQbmcRdscLa4FYchVy4aFE7HwxpUDKaq5xSEi6JgcK
X-Gm-Gg: AZFdTZcMglemzrD5jXC/VAQ3dWFj482GrGEZZQqQhTjXoSkluXodsES6lhh6Fz2kf3r
	qPdeEBuTtojUGFrawwkTH3iusUXwpdaVbO9DryOr5kzEVADPiYgz/9hmC9n1Tju92NddNstoupT
	uX7KqlbMt6r8Q/4PPL1wfKeBQrvZvsj3LkhKXHblPzYuF7Mr8LEEoic3TErCQl04i5zg3hIJ0Df
	WlOKBifaUhLoO6wPdHqQ74RH9731QMukHrMcAf50KmiKkd/sTNdaVEleVIzIRQa+nZ41aEP2xs9
	BdEkpOGSIsF0K7M5qpxUh4akcCVCKP2ubLqHT2xikUzQ7LfNS7/YIIbrqEx6hVtNSMlZpjTxbUg
	4lJb6voMLugGO440aJBhKiz+GD9CpKBILE0auBnf6Y2lYNlxQHBtHgZ9naM9q303n4UP8kAcPSY
	197MfRjvHKf/k2l8X+bEcDIKkjKLj+Yq5AYbxw4YnbE7HpW5aTUrCWPiEvC+VJYnxT9XqLEtxIb
	NexP2wqVNng13ao/Zd8tt/RD4/zcCZQ7HyAUR/k71sXk7dy15Gycf2NqQTKCnz4FWwKCxtjsbq1
	6ARuVrXZIfSEHLZVVWQZQa5Qs/nf7x5yXIdwBiWeS79musRRX181jkNMGojeXsDFl11ozwN6KFr
	IZMgUaLjfrHydk6jhaFTrro03o/60hY/7Q9yL8xexjjujPIo//4cO2upmvOa8trBPlbWE/52TtW
	znVw==
X-Received: by 2002:a17:90b:3d4d:b0:3ac:95d7:2fa5 with SMTP id 98e67ed59e1d1-3b41c959e14mr4595823a91.44.1795220809250;
        Fri, 20 Nov 2026 16:26:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:47 -0800 (PST)
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
Subject: [PATCH v3 15/22] ARM: dts: BCM5301X: WZR-900DHP: specify switch
Date: Fri, 20 Nov 2026 16:25:55 -0800
Message-ID: <20261121002603.25254-16-rosenp@gmail.com>
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

Add labels to clarify which port is what.

Use port 5 (gmac0) as the CPU port. No MAC address is described for the
board, so gmac2 would get the SPROM fallback et2macaddr, which these
boards do not set, while gmac0 gets et0macaddr.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm47081-buffalo-wzr-900dhp.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
index 7655e4ff2d1c..6cb27ea2dd94 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
@@ -107,3 +107,41 @@ button-restart {
 &usb3_phy {
 	status = "okay";
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
2.56.1

