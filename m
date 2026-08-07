Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4E23DFC6D
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 11:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786101891; cv=none; b=BM7LUiPjcYkvDkGynzmcmEKb1ZkfFzc+OrDtKmS92bFOwho+dcROg3WPzmn6TSH1QSqryYodkCkzP4rnr7lx6dAL5IBHflzf0ytEC/pU0toxVAcI7kZ58o07jg69C0kxYdzjRIu2M2iRpPESDyJZXeY9Gpt/ZPe7rDBsPpCx7ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786101891; c=relaxed/simple;
	bh=4CBR16Gjr/QE8k0Gw3mQbfVuOnxB47yseDW6ekLlAvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvi25g5eYlFn7p2uMTqCJ82kRDzJnI1vCTy5vCT1Fb04/0CjlgEYRLsgRmI3IVLn6yiUSDBC6tS4lNQJiO3SPux3iKYg/EeqDnMMbqDO6H86uDrvrN21l9SXqsbn+/QqX5eQUUcvEAB1raZLPYkl/VLGb6dTsqM1f/u04ERzyQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rk+f8PKU; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rk+f8PKU"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8487088510aso4707313b3a.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 04:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786101890; x=1786706690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5riwbZHq+AMgQ552tOielo/7w+UwrIhHqPxa46W+qA=;
        b=Rk+f8PKUfUPEI/yvinXLnlNBKPxSFp4r+Hs4RNF1Jv2kgmPI0iYC+oCR8rAKzKJd18
         ouR3RpAEy5ecPaWa83Z0dflhPhOmuRyft+VfCNMJeXH1KNelFt3nDqHhOp+CM3oxo+09
         9l/pUL8quGzjnAkakybwYZCYYWDazJo48t8iGzQ8/o+sT/TtnMYDy758exvbZHZ2vdcb
         wXsbjElMVJa5S/nDGvfAMZTME7k9NE85C7FytBVdqZ5fmUDMxjRJueI+fUgcbLiaCZew
         24/oZg057mfKqWZH0achKuQLVyXw01NW/UaE5fYLNpozbAMyZig2Y4Vt8DxDvIfSgDlp
         nAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786101890; x=1786706690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M5riwbZHq+AMgQ552tOielo/7w+UwrIhHqPxa46W+qA=;
        b=IYVG/tNRAoOVGUG8dv6Lv/CrZsC6VUnI2F2wUrVzOc4Se48N+krwhiKkhP3msdybDi
         xSyE9QUOdbKNXrILEC7izLAbH4QM7V9+f31BLAhgSDeAYKfgwOldEif5F9IyRGdFnNSx
         67UFCXIxXUbE2CAghtwR3CnHLPo5rcAg+6fiyWON1E+bL7h8gFijoXXGNvqaumzvIKKa
         ewmelUyBEMzyDDI6+/HxkkhVBTL+1+DU7j702NTY5jd0oU34nPER6Unvp6gqcOSiTNvV
         auaHfuYoTYSkSWb4y/ualt4ocZCRuAs9EsyV8gm4phKTJhen2Lc5/KCLQqw56y8bvhV/
         dU0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoQGmUQWe4C+pXlUN4fZVlDLMBCVVV/f2HIiyGqK30tQBZcLTCpqolBfr8dDk57eE2JH/1KfMBsiOPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YywWG69iluP4xRWrLYj+6SBI6EsT0Gkja5xQ+2THBwVtwWpn9qn
	eiprh8pajD9KoAbTxfAPrBKChg/GztfQgG8QwzNu7qoarw3sbYmdtagr
X-Gm-Gg: AR+sD11E2n2nXw9OvVii16ETO2Ox/opqNpauM4aCLWiupiIg/7PLorbQo3bZbj/Z8R8
	dDScm3MxbW8PgxyE1rMv73M2Dv92ZHFzVwl7b9pxubK2WcmsYVKM9+pHOShlSaCTneVn8ljR0vD
	wW8GYBLgryT04/HNsDSP25kHtHiOfnmZeX8TnEj+LhwJ03si7HSdkhuR90b26ocXyIsEGQzWxx5
	bVTfMRC2lXmEnHPFALXuKSaQjpylEU3CQiwhR6AuQvD7EYSIA0hdaplKiZscFJLYX9stbzFERZk
	qdQXLfNYPdh4rJ38XgRiKtjWgqS4GvCzWBivF48GKBotQA1acWqedIWfeDY6XNsqkTLx10S7jux
	1u2ZX1llnoWR0OP00KtUZZzfyGAz6OJ3EoDJKBJOjZuLopJRGopdwd/x1EH8r9YUlKjb45exUnF
	EV/dc8gJwbbISeCmIW3k862OVsQejo1tu/HwZgWaCMzKNfQTSiiYUAMxKGJBHuzKsxEN3WxoElv
	Ux0+y4zEdMIioodqdbdOW9eOzouI+i/EWDbCQ==
X-Received: by 2002:a05:6a21:46c9:b0:3b1:882a:607b with SMTP id adf61e73a8af0-3cb85e6c917mr25902715637.22.1786101889728;
        Fri, 07 Aug 2026 04:24:49 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:e1cd:daf4:8fac:b7e6:4f37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199bfd8sm6349351c88.2.2026.08.07.04.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:24:49 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-leez-p710
Date: Fri,  7 Aug 2026 08:24:32 -0300
Message-ID: <20260807112432.49685-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807112432.49685-1-festevam@gmail.com>
References: <20260807112432.49685-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to brcm,bluetooth.yaml, the correct clock-names to describe
the 32768kHz Low Power Oscillator is "lpo".

Change it accordingly to fix the following dt-schema warning:

clock-names: 'oneOf' conditional failed, one must be fixed:
        ['ext_clock'] is too short
        'extclk' was expected
        'txco' was expected
        'lpo' was expected

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use "lpo" name instead. (Sashiko)

 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
index 2cdc2013c320..c449eaa84edc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
@@ -588,7 +588,7 @@ &uart0 {
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		clocks = <&rk808 1>;
-		clock-names = "ext_clock";
+		clock-names = "lpo";
 		device-wakeup-gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
 		shutdown-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
-- 
2.43.0

