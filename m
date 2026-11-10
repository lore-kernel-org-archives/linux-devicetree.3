Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274617;
	b=uUCJ84CoxXObLvO9GEaLvGH60onfOdbYWCVzYjNU1jblfLxWgUPLHCeqhw1E+WEX9ZC0
	 Cf570e8On3zPBZgX22CTxsfs2bUs/zLNz/WM9uda/cav3XeXEjRJkz1Isa8K2SW+vgfgL
	 54hlWgG5RyJYjVc2khz49BifqS7+JOx2HGpEVHVF0I77hI2YafhiheIKUmlVzX8lS5cJY
	 5IgXCVXN4/XpBz3mKAYWHnEvcN/DfNNI2dnCagvsm06Mz7PvlcIvUg7viMMBEktncAHvl
	 vWdARpKUTMMs1hFa9iLtSayIiKiz8EQNGOyEaGobe3l5ibh7YCk4yI5mh9ayAoenfgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4REj6Cc3PcYKPXeO0BJLjLikBlGobV/sM3/zRfrSm8A=;
	b=Ygf3umJcmK7Ws4fLBNoKbMuJSPAuEylApXQ0jlJYSRXT8OdddYEZK0ZsxPimskAE+5DZ
	 WZS4pqdO2pqB2VLgPoc0WGJSmojBzGmFJXmS7a93AbB5Xd/WVpt799Gr8HdJEnDsBzEln
	 CuAWcBrGDfplGI4tuwr7AJdRpz3KhGP1nEd2oghuo2wRuU5HRXUtAzZAq6R5pMaWu+3PM
	 G/v3QaLnPmUFpWCyGqUOV2uNKcaVIi74167Ud9vCAK5pHwVmSaQ7hrPm7oWY5XpDtjb9L
	 EmLV3nq2gCrmPQiFRTmw99YYhnoUXpoJdM6bR0KT0ZKf5+TkTgh53LIOv6cHW1RaflQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IifquLZD;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E5E606A333
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E5E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IifquLZD
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e946155442so12247705ad.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 17:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274617; x=1794879417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4REj6Cc3PcYKPXeO0BJLjLikBlGobV/sM3/zRfrSm8A=;
        b=IifquLZDZ+cGll9llv67+7ME61nc7o7FQKMoq1Pmy+5nIBxla61YJWHsHKruAn+vkt
         1E1pM0yuqw7uDjvRtjt+gY0g0we1m4sBlfJfOTOa4nQvvuD0+J9DogAgK4oUBSLcpFVH
         UKQmY4AJPzhsBAhfF6i5Z5PnBBLV68vn/QBCqHtNaVTaE/1uxslVDkwlgZEphqjCIUTR
         KmfsnLIwFB1oE/ZOPOmcHaUcp7dLiqOm2dzbJVwPUsPRP3XBJjNsRhiM+fCcKCv2eFgO
         amp/0xP1jIWUcIm9ebZV3I1M81tgb8OVHBAMhdDZR0FRk9wQMYooq4l+B4nuFWfj6Qfo
         aHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274617; x=1794879417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4REj6Cc3PcYKPXeO0BJLjLikBlGobV/sM3/zRfrSm8A=;
        b=xyh4AFsn16hCoJN+09jwJbVlpcw5VqHEou9yKhxdsi5jFjZnwZGgSMQu+zrsZKK/ha
         q8f2VEbxDhj6sg9BjpB/QRosCuZg7621aWFRfehEGyg9Wl4H7PsgYPndNNI9h2znVkrF
         0rjRCJWZfqqfRJEoa0cBqqv2aR1yuo1kme5cdkmxYXJtQPLn35oFqgsU5j8/mRt6n+wu
         MW5ZcDVyuXAb34Kcvv4tCRPmJbHP2JJzte9GyFc5TEYIpGk9uyRr3c1u6JnfIDn9JTmi
         vlqS43dOTQ/bEf7fxa3m9ILtWpJgAUAUhAuNTw7vVgT5ndrYG6N/T1yAzWC1hvdnt+4n
         YPWg==
X-Forwarded-Encrypted: i=1; AL+hErH6hfcWVq0w0DTBkIQ7d4VIzt9UTSGb92FFxrpXCYD/w7yxjaNLCi9LNkUpvmcrcpJpullT34ezK/T1@vger.kernel.org
X-Gm-Message-State: APuU4Z+tcIR+wOLBmxNYtOcVObjFj5hL4PMhOltCmxbvTpRTJZAcnhvV
	IDOekiwjA+rlrUiMYNB88Y5khyFwfZSoOQUc9HPb+u6xROHLgnhUS2tb
X-Gm-Gg: AYBFou0CDfP+ZRCxzAT8qYnuCFH2MUxW3tK4pymC1AU3WiRJU5Rs9TzkdWAaPJdCkUp
	uM73qgMc7Qxk8dM95CaF0fDXgg1McyhAP4ZsMs5bYD/Zx7QHFF2ySfBlMeXm85sPsfGnwB8cHEl
	ElFl07ipu9dOj9vYHVcFGYmqbOKKXEZuHMj61OJYJ2V89+lRZwX2/uTDNeZp2dWsHVKiUjQh0rk
	TZmWfqPsOT1xfXXF56M5X7aHrmIi6hZ1P19CE525Nd38zpjDJkjkI/R3GLGKSDDERbkCjpM7lb6
	dSveU6AtP9uYjQeT65sN+jBgyEU41vHMFNyRE5aGbdcAMIaay7VBRxnH/du3C/4V44mxXNbLK90
	k81ZEYKBhvg/0fgKTxjaREqdv22jpeN0w8ztKUs7opMZ6YqNGTHJM0awrFxNC9TyDHfTCi1/1M6
	GKYHJKzFbi34QKeF+47M3HLaWWYgYLJ9UPfUo6H6DENPAlrc7Mwjwynlanxe4kMlpdiFmKQxTLg
	7todrcxNutB9lbDRNtTE9rTe/GDSaxuzxhbPzygSAx88DzI4iJphEpCwUcT/FlCJ77cUAQ4AedE
	o3dRs9nKVg1dn+QWl0Qqv4hRLC/u3tcxD0nApUwtv10wj2IILLdOLwHoTL1r7x2DMgNiJIwvpOx
	VU1z22aVgJVsfcjKxThM44klhU+Ctuvwmv0v/degLEUyCIN8YKvluvIWhGGWSHhwWvh/3ckiUcb
	va0w66pK4O1SM/D3bsLAVh6jI=
X-Received: by 2002:a17:902:e944:b0:2ed:630:40a4 with SMTP id d9443c01a7336-2edb91f5535mr10276065ad.11.1794274616976;
        Mon, 09 Nov 2026 17:36:56 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/6] dt-bindings: clock: ath79: add the UART1 clock
Date: Mon,  9 Nov 2026 17:36:43 -0800
Message-ID: <20261110013646.1582970-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110013646.1582970-1-rosenp@gmail.com>
References: <20261110013646.1582970-1-rosenp@gmail.com>
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

AR934x has a second, high speed UART that is compatible with the
qca,ar9330-uart one and can run from a 100 MHz clock instead of the
reference clock. Add an ID for its clock.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index eec8f399b9e6..f8a98e4d206d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -11,7 +11,8 @@
 #define ATH79_CLK_AHB		2
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
+#define ATH79_CLK_UART1		5
 
-#define ATH79_CLK_END		5
+#define ATH79_CLK_END		6
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

