Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220816;
	b=Ee3aIk4SrlK0HkJ+W0dSuC0g7DSn0yUh2e1+0AwAa5K14oRwwT7mTrt0y26r4i8n9Ndo
	 s5xscU4bFpshvuoUTJeOGjw/NKCWyxnctifm/Zqc9/x2HLKVoA/k75ep1IuidoJnbA+LX
	 pGI1q0e6fDV1gioX63CJ71gLTXIgAhqo7KmrTQo+atOUQYhRqtTehfKddzwKzOQvXDPLd
	 RQfDJ5vHWHyX05Yie3BVwKMKuooaoFVKhBBtShr9ndfLZnBrJRJ/fHnDIDh6XjwUXZkGM
	 D4V/E7HpIj7trneC0zjzhmBbN0iRE6nlz9sp0qu1N8px90qlosS7qecT/+E86/OJouw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AzuxyyEyd8XipbEeyh7V3cleeTOQNEaifusfdc/CbaU=;
	b=a5CUewqqfu451osfVo6C892yKdC3Cp8ujDtkvQAoj7uJs+vub3+PxaFwWyACwAs/FVXs
	 Mpo3Zc2knOwNprCUvE8/cdOLXSjcrt8AKqjHDqGy22NPO9RlaJbErlDFEyWK5o1a76FX5
	 LNHG/GVak1U8ZeRP1Z+dfu6oZT0YWHMJGNrCDN9iqedGiS/eoKZg4UJKVhXd+5llhbAl+
	 LeglOpSqzA/nCVbq6swvtmrjjRvPwt2ZhSJfOrZsiusD+cmFpEpGS2HUWkdrbY4RVMcCR
	 oGzPn2VsObeP/Fh/fncDZmxh92O7txntTMKAwUO3A6OwppeH0SojVFNILH5364AAB1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tk7j968m;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F453606A330
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F453606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tk7j968m
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb628232d2so854015a12.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220814; x=1795825614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzuxyyEyd8XipbEeyh7V3cleeTOQNEaifusfdc/CbaU=;
        b=Tk7j968m9rFRl2fwDI89+N3ECUWF1EoTYGNQm9oWMejDJZBejEOzJtdXNqpXxF1iVT
         kcHf+HkDjx/xmVq5HY2A9kFN/DhFkqtt7CsPo2PVpjzhZhrWA1TrUSVvOb1SPONePdL4
         HKli2xoa+sKiQyRC9CtfMO4Jp0B7eOAucSDLb7Y7r+0bjPFqP5mtZlAwP9jWBhDEGE0H
         QMETSDUu7HIFIPdLwf/vx09ItINowmItjytNUZxH8dYAtT40wVthVaDl31JOss26vAgw
         waNtW0Vy7XLk8MGYuP70zLtnvjtaTVxW1Dmgpla6Sv8SzgdABcgR+jDiZRyZMCbUCHrM
         DwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220814; x=1795825614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzuxyyEyd8XipbEeyh7V3cleeTOQNEaifusfdc/CbaU=;
        b=g2o5M3JJNRMrKlKW5Lwkg9xglb5UN6P0MB93wQSFH3OpDLVXTgxJLYsYHCE1GoLJHP
         iEjYBSJ2hE0rqzTjPHlOQH2MKwsdmAjOYH1OenVYEAj1yE0mTJH9JNhsGlP+zButDXBX
         TINoxZqI8VMTne/vXwMB1trXSid8nye6/DHY1lYoHI0sLujui+t0TOlUUmmQnf1BsbVh
         L0aPsDOLi10HpapHzEgX0qlG0Nl/EYe2rLgJruKAX3FF8slpTALMh70uOIpMpdYniDal
         iOB0ordnhXTPmLLOqw7ycAlUkGWjYs4v7kNcNWkZQIYjTEHiGOEUVqY0l7nNABD5GHAq
         2rbw==
X-Forwarded-Encrypted: i=1; AL+hErFDLKBFO726w/n7yYRVyun1+dvOUTJS84Qv+ut3F1cI0cl6yb/GTCaYTuOkZWughzzaQkB1odXMZUEQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9oNl1YkZqXnFRsDHIoDrY3UO7QQtSJgRaUUFu7CgxYWLIGsvVl
	yx8CCN0oNQKj6MoCBs7BSbsUabbF5xnsyKNRTeiyRhoxwz8NKPBfux61
X-Gm-Gg: AYBFou04vNK7W1ixXf6J+zRGheBVqovjvTjXgufY2o95CzS1Zh4lZAxyD1SGzQyQCWW
	3fOAGB4P/GQfgBnPN72nRZnaGA9MU0/P40INo9DF5p8GNlAkQVUd8ktT5CgxHjxaITWMf27r58+
	Gmj+xo9hMHSvI5f6MTd5CQKRYbXnR4ZKnW/3tvI5WS6tBSaT6TGVWJcopleJyZ3Cr+2osV0q+zZ
	+bTunXTHT2VmlIXbDK74kEiLgbVf53QneZKe6dKObRjzCPlNxKjZoMpG89BR7vxL9uig03fwaQk
	ERG6tkoDn+8zflGxn5BEXLq3nvc8EByHmZfXoVpEC3WH/oNei9dcranwypy7UBo+IeSu/WOKpu6
	mnbbzmRZxbjEkQK8ZGA49dNILZ/KgPal0xKeS9h5Fi1gKaAKUdKiAi0fmm0GQEhBKp5bci7VDQK
	Obu+Q8ppKApHP2OX3weG0SWHMVyZNO7UxQBUr3eh6HMOTMU2D8vkP48/pvwAUyRTRJzSsaXE/Vf
	0cyxnGj25g9ffjPXctF4N0mOrmoW4zr3u0QqZOxnKx7JRkkbOiKbD4pvoGtyvcRBz5oxZyTCIQu
	Rd1k9aaHM7I12+AmOplzmv2hhLkCTLyHIYZXKbD3rcjUtqYmSVslCBy+4gpPh56AGQhVbH4NQT1
	cNVFYCcK70UYWoHZdY6lAxKI7leOPKFhIUzRxlc651Y4DBNLMSsHNg44Mn1MQh245v81aA0IZXg
	0AzrdAqoy+8KziJU5zUW0ARy0=
X-Received: by 2002:a05:6a21:6812:b0:3f9:9975:4287 with SMTP id adf61e73a8af0-4014db58a21mr4661368637.45.1795220813857;
        Fri, 20 Nov 2026 16:26:53 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:52 -0800 (PST)
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
Subject: [PATCH v3 17/22] ARM: dts: BCM5301X: WXR-1900DHP: specify switch
Date: Fri, 20 Nov 2026 16:25:57 -0800
Message-ID: <20261121002603.25254-18-rosenp@gmail.com>
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
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
index b7cd2faa30ce..6543eb8aa9f5 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
@@ -130,3 +130,41 @@ &spi_nor {
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

