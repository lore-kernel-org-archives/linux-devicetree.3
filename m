Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220814;
	b=aFCdIDgezwIQlA9y38eKVd4RnWhiVDnpVRNHzNat0VMzk+Gpl21vVQ1nThaJhpzuKwla
	 qyl9An0Mz89nKNCw9HvRfwAth5b9qgp0rlwPAcQGfiz0WqhhjIUg6eBd3HhaDg/basFNT
	 B/yEWqV8ZhtlSNnyazzJx51PXvTIQ223w454OIs6eVPDn2KEAr3vKbKMk849VJG6QDPYl
	 cAaA5tkv/PC4oJVp/h0nE5FlSnkAQAJq0Fmqsi8auKxImytuUpaqpJ3qMhgNPLtYAO8kx
	 JOuyci0Lzqlg1rd/sSYXyTPYqrnz55XFfa6lrcekv7sElRaKeIYK8OQBBzFy1T29rTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qC04sYESKIvNrNBC6lt71Dnq5FvwTYiC8PJsJBqyNvw=;
	b=32PV2PV3u9FGmpECfxD0clY5LDV5scK4yWhLShDSMWoWLvAikFqF19/woLbntvhECuBL
	 0FcIKZux8tuoDlXf3LKsac59/NXdH8hrNkpgE/trr76bIwfe9sKhSXAb9PRQhiLGqVBcN
	 JZs5fiiCbXHgJaAVsbt9jG6D2hKTqrphG+vKXNGTvUhrK59KumUE670kUy2Q80MzhZI4Y
	 xl4T/g4XjvMKA1pA+E8X5hPciBkBeAs81KJ5HXQ7DN8zIHyo5P7PXg4S6Tm4njL6y7Qrq
	 ln92k7bM3fCazovgNHe3NdKNkeCffCWjHwzAMJ6KgTmGIxjPnW6NbZkwZz5oTZ0cupQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WvoD1Dnp;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43753606A695
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43753606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WvoD1Dnp
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b2382bf051so837753b3a.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220811; x=1795825611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qC04sYESKIvNrNBC6lt71Dnq5FvwTYiC8PJsJBqyNvw=;
        b=WvoD1DnpmAWUmPZagpeHn62IHX5IuFNqhV6Zt3dku28K8g3AKmoQO2BifMRbODnShS
         C+3uEA9fktYzmNnC9IHIf/mjti5oU8l/XhBoa7bh/tG5ptTc7Q3aUNCqF3vyCQb9q9ee
         2wkrvx6SwMDtNCTh0fSM7BvRfwJeeczHCZZdeBiJe9LryXHEvDV7Eg52chU4Z6D3vkV6
         RS1jCmNpX+4yDi1CC85+TzqXmTOzkEC+v8oZ+87cz7p0bbUz988LoLJxlzr/tSy/N3sB
         BZ0zckDpHdF1iRs83MUhPXSBxRyEDp9PBzGcIeuMizcVyDUR92IajohcU1WeMKxwzo2c
         tmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220811; x=1795825611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qC04sYESKIvNrNBC6lt71Dnq5FvwTYiC8PJsJBqyNvw=;
        b=XnaABFt8simFdpMzPUf3wDZwi3n9xhFSU+27TO4QhnYjve1uz3Sj2shCq+4UBPZQ2t
         sv4e2WThlQjrJTTnJ85yrjAcpME1D72ChDIXZTHo7e6ZPhjUBV/Q2v8w/8Q4embuq/BR
         0EcH1jBp1f7NieH5xSoczY8ySchbHu0JRmcLtzI0+X6dZAipVppztOUhmkH7w2lWNSN+
         7A2pmIiWlVJ6hU6TdWrul0qJGC11ZGcL3D8EdECmfridSIYn+fpdp0v9TXyhxx3IcScl
         zZ1V5KdkssGQfPS6lbw1HwV+IXW/W9R2yvJHVjPGYNgfNoPq/QNE+hQbYe78dfXvXkc9
         ppFA==
X-Forwarded-Encrypted: i=1; AL+hErEXnB82W1ItL33uemGWs0n0YytIxTG4Q3kkBG1kp7Y1dzGE+yfvfk9nK8DVjyZLVNk1sr+HasT7+5cx@vger.kernel.org
X-Gm-Message-State: APuU4Z/epjKG9ZKdJAGOgKLwEWkdb3ikUsJ1ZB2KczqJ7m/VCMRXM4VE
	J2HdmgTC7FVa7iaDzAeW8PDrEMeBbktU/J4Twe3PvX80QYGmQnE+/IIM
X-Gm-Gg: AYBFou1B94jmoc4tbb+2ZBQ5soKO+hrXhWeOIEmRIX+eTzmll58NNmnoeGBAHEmGNfY
	y9xff4XPCHPz4ioNQCuuTEKCaBBPeUfIAsECXk5b3jt5/ALfzemaY4PY0MMTlbWsYIoARL71gBq
	pvBvgeUsI81AFzs2s/YJ++Rjy1KB5BqBsoenVCXyvlvu0Nkzyy2Op8eY2D264T7yk2pnKpUflTi
	ZaTwfoxHo70YKXiMa06vbxbuFJSW4f+D8BsDUtAc1dJ8yZnAKGomxUKPyqnY20mCh4/IYngFzdb
	Kr49qwbGM6+Oc0fbZps7T8mM5BQtWMwMdGZLWij6/uxAFzY+VBGf5ExpBYN1joE2WpMKsi0LSWe
	Snc0Cas/Yef9RI9+wpCFGcoWzOQZYvyYHIoX6na67K5qfudBxsIKfWEWoCt8vT3s6hj0Y1W92or
	Ux//CccEeXZnAqAVdccWTSrop+FTvnUWD/jri9JP390+/2par2Kc0n13IVo07SGwzmYpFF0Bdbe
	fJiso+Hs1DZtHv9msvKf5369k9BJf+z15W+m/8t7AI1T4rpu4578n1P3O8mld6Y7L67THJyLfuK
	2ncDdsHBo51TJNUYX7Vkac8P//gdeJhclcWBVqEVzr1Q7J6SbL+szg/TT5H9Mo/1yD3KmxuEc3T
	w5xOuInMLLrplzf/AGyAC0c5IMreG9qbKS6ZAi0b/WqscqvFVobzB7Yj9rTpIQKD7jC1ekaniiE
	yaRpCPOfxhEdxq2B5CU4NnOT4=
X-Received: by 2002:a05:6a21:a97:b0:3f8:87a0:9267 with SMTP id adf61e73a8af0-4014cf529f1mr4954906637.62.1795220810578;
        Fri, 20 Nov 2026 16:26:50 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:50 -0800 (PST)
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
Subject: [PATCH v3 16/22] ARM: dts: BCM5301X: WZR-1750DHP: specify switch
Date: Fri, 20 Nov 2026 16:25:56 -0800
Message-ID: <20261121002603.25254-17-rosenp@gmail.com>
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
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
index 95ef6ca7210b..459ed246030b 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
@@ -149,3 +149,41 @@ &spi_nor {
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

