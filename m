Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E60374A1E
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 02:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821490; cv=none; b=Qt0d0W3JrbZv1VTucXWLyV57KXdSlQDn9PXCdFCftBvO24XlZyfsP7REJet+/Jvf4sPmUtBE1GMm7CmSYSQxAz6J7uqHDm6x+OcrASx9HP+3dHvTrS8eYquGFoDEPCNGAahx1OZdWdkYhi/zpkTxkOMoJrQwnk5NatDFQ/H31gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821490; c=relaxed/simple;
	bh=OeSqZmhX2GeSBAZfyEhqUQJiD0Vs3BGdCEj0RuH2KlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7BQPBQlh2OHOLIN0SulQUTgOTvBCefDdQd09txNpGr0sSaCQklrQ2XWq6ekF4xnfzP0rlA6XamSAdxw+/JgJ8YwwSt2KTAobrL0IbeMENQJ5I0f+RBrTeNrj7mkbrLSkr+ODRskJiSZK8piasYjxvrwqh0zhYrQTvQ/pngckNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FD2KcB3N; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FD2KcB3N"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc79a5bdf9fso1145616a12.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 19:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821488; x=1791426288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7mGoZW6rOuJjzujzCIVEJDchDchUE3FU7yafH4ekeM=;
        b=FD2KcB3NQ+lRhEVmGOZbw3jraKzfVnlLCTwyoh0LMQXma0DqPHn+GWjDv5y2wqL9rO
         jJsJjGNTMrv3LBnyLjCHkYMhz5Qu8aqUqykIPPuWWiYovfzUlwCxFsCg3xECUTajReyJ
         /7Gj1BFLGX+9FteXMHqKYPRIOaTlV6Ausou4OwORc1I1qpKn60tnUL+DVhH8MX3YEmTS
         NBAI1McJnFZ3zOQSwjfV70VBHsSYrlCeNA64aPP7X/NwxOZupEYJ/d7xj7vKtTZ3J17z
         mw73FtJqb2j1V79D4P3cvPvosM3f11y03jyv7jivDvr6rMTjBdHbxUcDT5AVY9fAmUDc
         B7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821488; x=1791426288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V7mGoZW6rOuJjzujzCIVEJDchDchUE3FU7yafH4ekeM=;
        b=cLq02g3yDkdnnhfAT/rErAabAMfLRzUL2DxpOHKVMXdDa93BpHTdXVCAiB43Y4qWeX
         CnWLT5EXUyFLFfsUBdr0qH1ejU6Sl1n8/s/yqtbgdJGn1Kxu8vBl9o3Vfl0ul5VFJvzx
         ekEZ6tTI2CqXT2PbeAMhoS09Prd4Qe8D7kecSXhThNIGLo8u86bOms7jmyvr1UdsE4EB
         i4OXkDDmMxo7LAvJWSxXNfUClrqG7X0p0JFb5Nwv6dJlHvtVL0u+7pEnfJ9u7pBH5e3J
         tAtX7XAat9RcCSWjYba3F5LtYMCgDouk/aUHKi+V7aGSrRwBOTi6R8pUT4BDS7zW5P/m
         SwPQ==
X-Gm-Message-State: AFq9FYL7mmjq4JpOwFVP0ax8BR91SO+lnam2c1B5w87TYWowfLOdMtvL
	GIGR/qtHhwZZYHG9pjA5YUZW9pmUZJ6cVb/6AFu/ojmJ9wvZ/Letsmzy
X-Gm-Gg: AYBFou3W4gpAEakBrhzdC+IGbxlfpfJOvepgGlJlT07r9pzUni38f0CR6sYVbo78zlN
	D+xJ6a67XcmWA8RthJPEKZMxdhuZrnTIK2iQ9Rmq55tAaUswGJo8r7FNJecybMeuwsAcazJV7yI
	yYy51gp0/uLGHgj2zggITlHf8SVXFtYtqLH1ybqwuGhIiiibsdKRENX7fIxZLEAI1y5Aft+9igH
	x0saPNafCWa5FNTJt1iXRn9VEBAEA6mKqMpsAJ0PJPBkxgD4PdhNUOYgsSaAwV0d27QJmKLSsni
	PPDSvDqSX2tJRb7ofcN2Ox7idpJfL9jxVf1Z8yDVpdxEcow6XTjdJrG7755NBUHlcCGJYycDiHM
	bPQZZFCpVryam7kasZiS/KrMp/dNSbIBhpiW7XGn6KydZg+axe7RsuPZx2TNZzVKgGGTVF6RMcn
	NHLScErgFp8aPYfVxH3PPhQ+96me5fydvnxYpZfc2FCckxukUeEqIrd20YJMJ3FUis5M0U93u7
X-Received: by 2002:a17:90b:3c4c:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3a4f2afacd2mr752019a91.2.1790821488332;
        Wed, 30 Sep 2026 19:24:48 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:47 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 3/4] arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
Date: Thu,  1 Oct 2026 10:24:14 +0800
Message-ID: <20261001022415.913959-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the pin groups for the I2C0 (PH0/PH1) and I2C1 (PH2/PH3) controllers
that used on some A523 boards.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ff..0ec5d19f7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -147,6 +147,24 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			i2c0_pins: i2c0-pins {
+				pins = "PH0", "PH1";
+				function = "i2c0";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
+			/omit-if-no-ref/
+			i2c1_pins: i2c1-pins {
+				pins = "PH2", "PH3";
+				function = "i2c1";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
 			/omit-if-no-ref/
 			i2s2_pi_pins: i2s2-pi-pins {
 				pins = "PI2", "PI3", "PI4", "PI5";
-- 
2.55.0

