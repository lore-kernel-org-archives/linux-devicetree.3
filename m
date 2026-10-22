Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673655;
	b=doLdguJWaSfqfQFHfg47UMZoCiXl4Exop3RHaZrUjO7GOEP18jdjIoVYKcWR3xPvFq60
	 9CYd07Ck222f7SRDEwwEl9wrRuOiHVuIsuUhMFvn/k/b5r0Bve1fIb/XCTLqGg+nptLxf
	 5kLa9HzEKPXcHVDOJhCAAvC/FAZyRvwT60hBwlF3raW8gc6Qa7HjBwY0M4g5vSW3BZT3s
	 QLH1drgUq6CX9GvZAUPsBGI9x17J7dR6Pt0KODzNVr1tbqxpG7RJzOxdVjXTR5WuOME1p
	 LAj794IGQJMkNo2W3Ja5c8I0E7htPlWZfXyanRzQFuVm0IUm54WjrHLapQeDwd13tKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6/5wXgO+LxtHjUK045USqfI3dlUW80LCQmKUkVA8okc=;
	b=u0CCNxMktGedwwHGhZx6tWgpm7cN+yR79J7x3ByfLAeTJmKb5LVgC5GuVZ+KqCASJ7BJ
	 HVujUw4NeWe9L3MpW2oHv3w8aOcS1nrX587OtVwvBWQu+RnpUcQg4wh9lK7l8S2tNSgXZ
	 D7JE7KCEoxzENRaXgqPudCEMCHib4GblKgY3vNg6Ht9CKMeM1DlsYgE1fXLTGWEt7wsdS
	 +i2K/sIUujg/KMMQfJmqgdY8EnJXBJsm7ehkFQLppRUCk0x/RBE2RlPpTWn5GBsrarC4v
	 OBZI1TJ/Y4OzuY21qdrDa5kXORbcRO/IsTWIlEYibMRQg5te/KwKOgcWq+yoD3FztrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CH3f+a99;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C422606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C422606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CH3f+a99
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-87137a8f4a6so230926b3a.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673655; x=1793278455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/5wXgO+LxtHjUK045USqfI3dlUW80LCQmKUkVA8okc=;
        b=CH3f+a99vQRGNJSWuTQZ9HRli7fl/lWt7DyziEvRwOOAPQuyf4hdMnL5twyXjUmVN8
         Fb8mPn7txGLWwoRXJTW5N0/MRAIJlhmskc8BTit6Hhq+sGK5X6405xdti4JyFFwQBh/r
         6ci+uaLs2ZuntK3T2yfriTzRjkrIBZUbBhyHajbhyq5/n5GlPYnjkI38yaNjF/bdc2KG
         9p2RXLMBboK2Yyprh2wl3bm5PYWYXhqfnmtIp6z9oCJCHFL101EreQ7koX9D95XrRsej
         UHXP/mBSwbUaXV61Jim/rRJg+XHV/KEI48sULW7NhWdtUmCQvrC0R+LvuqGQ7aYFLHLs
         YTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673655; x=1793278455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/5wXgO+LxtHjUK045USqfI3dlUW80LCQmKUkVA8okc=;
        b=ST+6U6xNwNB3TSraijD7XAJn9/j/j7jXNE3ZaHnABqPWe8aCpRQr80AjBR0Mf7ZU+o
         8915tfWvlHY1e9HLhPJaeD8PjavZ2DT8//28SE6pEolQctMdocULjHAvQT/eXvkIur7S
         QMEqC9rigzeFasxtwBPOXJPTPW+i/fcat82hDQ3dsneqi6wX37KXH4H9q2X5qQeAmP6+
         7inaWfGKy5nf6FImp7nrH/miPqtKlMOsscO4pXkkOjPXlq/D6JOrYT0g68+xsG6Yok0e
         qrezq+5Yd9AEQ8pY5QZxtrh8O2NQ2iSGUNi1w5cfDaO7F5n+29eOZt7fhDxeByilvfGT
         zY6w==
X-Forwarded-Encrypted: i=1; AKwUvBxKvhZBZYCas746GqCyaPXSOHjz+BNzZDhqz3a4Ull2tBbRxzKCHMvCEp97ojw5ZIKtEM/f+PsA9qYG@vger.kernel.org
X-Gm-Message-State: AFq9FYKFPftK38cX5oz/CgwSHhSWq2JccI+RcMFIvMXMsC2LC/bKUFqS
	YXwC2ztFxQ92ZgrDI+ZedoWsr/22BnJW6XY8/W+cjWakdP9rvAm01oyK
X-Gm-Gg: AYBFou2VwcSq8odpWL/84pSlzxYLHKH7qgIZrzeftqtf4EdL6SoVuhHdqcmPiM8OkGk
	KKQtxGyD4BwQD0AvqWyiw2moKofTu4Ovmv5HZIEoXjQ3pOtWW3f7RgOTfeXy4/PMT7NWiKFfz+l
	w8ury+kV2qax3G6ABRRbIHLDlE5lA4P4bDFBDDffzOZUzQ49QQs5MxCRnd+lhlyx2JizeVJKEmj
	kpL7kj1hXcU6T97lmAS2B2PcXCCOS+GFoBI4lNesrA1J0xX87o0eARUMBPYcLMP018nJLaCoJKw
	/InpdyeXe9s1Ta3BfAODkbkMkPy+unnkLNOfDeLcz2sl20z5JMprGbvDfPCa1L92dYIg65kkGPf
	DiGSnPsQgODKA1Va65qHZkp4TEb8KYBpkVlHyZjomBoXcw/SZhFSKzq/u84OPV4fVjWUVLCcvw/
	NCUyEKajEP0EyIHrPGJWPkpgZ5v2RYkGV4l0pZqjol9rPg2oQvU06dQwTdaXFabb1KCynnrWfTP
	ZJnupswO/GlRsTXJMX5Qmpv+Zz9dyFdi0YA2+qG6F07TIxsjUg9aJCu1IU=
X-Received: by 2002:a17:902:c94d:b0:2df:8ab7:fe3a with SMTP id d9443c01a7336-2ea43d9222dmr65190615ad.4.1792673654906;
        Thu, 22 Oct 2026 05:54:14 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b435243sm23704165ad.31.2026.10.22.05.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:54:14 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: rockchip: Add ArmSoM Sige7s board
Date: Thu, 22 Oct 2026 20:52:54 +0800
Message-ID: <20261022125339.82746-4-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022125339.82746-1-liujianfeng1994@gmail.com>
References: <20261022125339.82746-1-liujianfeng1994@gmail.com>
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

The ArmSoM Sige7s shares its hardware design with the CoolPi 4B.

Add a board DTS that includes the shared CoolPi 4B description and
provides the ArmSoM model and board compatible. Retain coolpi,pi-4b
as a fallback compatible and register the new DTB in the Makefile.

Link: https://docs.armsom.org/armsom-sige7s

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 arch/arm64/boot/dts/rockchip/Makefile                  |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 442d322a20cf7..c8a5a88a0e46a 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -231,6 +231,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-vicharak-axon.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-vicharak-vaaman2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-youyeetoo-yy3588.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-armsom-sige7s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-coolpi-4b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-gameforce-ace.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts b/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
new file mode 100644
index 0000000000000..f17f0d632b1d1
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588s-coolpi-4b.dtsi"
+
+/ {
+	model = "ArmSoM Sige7s";
+	compatible = "armsom,sige7s", "coolpi,pi-4b", "rockchip,rk3588s";
+};
-- 
2.47.3

