Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934229;
	b=l+/EkWj63jXVZPVLe6v7qwShk/ggFslE19arcQjMXFnNeX0VTe8MGn6q86ojAWta2pwz
	 kMVKL3Qlt8ftHpFpP0/qM1gXvoi6xkkHP/U0xrj14pcO/MxeiyjL9i7Xz8AIBjRWK7P55
	 SPdGWCvnUZBKD0t+EESZF3H4+6ydX8JdZJHd2fUUs4mNrDIzUQayJaUfkRnqHp6TB4ph1
	 gQeMDRIz0J2dTT7SlQwCGj+C5TUNUUQbFOA/R/WefzQeRBZZEKg19ANBSYb+BFvmKXq1u
	 o+TG58HYludZFbGr64njlBHvX1UpJIDj1kC2TXACOyxVslDjPdVJbxwEOsQ2Qj4xoOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6pgUzHBMcni0x6QQo/FZyS4Wix+7yma0HG0CtbjYw9s=;
	b=q0b7dv7JVB6OptU+x/jvgJ/z4heMc3FoXp17GAKLPxrbqT31hm0i6EV+RyrgVE/v2lVn
	 9Shxm2tSaQbAF5dJ1Hs5xwus0YU9TduXGe1Sq84wFyQR8audFogqq0aoQjDG6rZbcMMnU
	 U+jsgV1OKPOLo/IkWD4Qxt95feYQ6FyLfCXkn3eTtIY76aYqfCHrWeQE2Da2V9XwGElrp
	 +X7GMrppeWVp4xiiS0jYUeprmxEGGU3SOisp2hrAnczyjQD1UK4w/3YpPAltVrPv3dn43
	 awEoJk4Q5dwrIW5nmBJY46x2t3NS9h66h77/4cc+/XiGPnlefIfHu47OldsRGE5LSng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gzWSAcwq;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9975606A328
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9975606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gzWSAcwq
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e98798cbddso818995ad.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 19:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934228; x=1794539028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pgUzHBMcni0x6QQo/FZyS4Wix+7yma0HG0CtbjYw9s=;
        b=gzWSAcwqLhy49ecsDFREsKHaaWHQWJ8zNrp2Bm+B3BFf/pmIeWXDVJRzRK5/eMJuz9
         AMstDe2HFiGaARWBczByLHMwCnJ6CCOx4Bmdk/g00lxdsr20PKxQkkfWGCgVeeZ6J35C
         Cu+ohYj9w10k0ADrbOu+vWjABGH9lc6PWFufcbQfHA+o7Jd2IGGoOfgfJCCkleZ5Y5w8
         5QeaY+2fYQZgLmOS6JxEhCv0un+sIrbMFb3/TV6HPNrpfELSnhGQnUkcqoQrHOP2Io8a
         nDTfNyVF9HKiG7m/edh2fJUAcuOMvoQnmKfHoRby8IlDftr+iT9J6ICwmIShKZ6yn0up
         h8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934228; x=1794539028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pgUzHBMcni0x6QQo/FZyS4Wix+7yma0HG0CtbjYw9s=;
        b=lpfeWe6p0qHwa2XEsrN9wsOBzwlNAQDkt8zyHAfmuX0sdXShMUmLil3Onl1mP+/9G/
         dc8CP3QxI9H2DdGMXA/BaZ1VAm6bGA+TPUiRjmbTUdEGIhhcL926yECrkEll4DvAExhd
         ylNiZfoVfrbDjMrAltABIh0zv98qWOiKp3az68vKtUZJoFeiCZGSX9NDeLQdg9eYvgIn
         v0s7Hj2SRhxhef4OPdqbCvzstxvNM0keC0r1e7bqLswkPWRXM4MZqaTjN1qpbGlHis+d
         XxrXBW02vre10JrwCnN+YjvUMjznFtk4UhNai0xgFMI2lyvK+QlL8Ty9jSoNNqpi5CLA
         GaPQ==
X-Gm-Message-State: APuU4Z+nHP8RXbJPQERZ63jukzt1J9l2/f92luz9zs2Dl9qShJh7XlHA
	rADpW5nDklvQrLKP+TX8SLF6YcfJGx8DExe4jqSlP+kseSMpKCqkT9Dt
X-Gm-Gg: AYBFou20jBSLwFVzzzzXp55RKvAabPsn0jMRs9uehElIYnpbO/l9Ezr1xOwslV8FaUc
	jQ2nvB0MseF+m1OYi5o8q7KbLtk6+jqKorLwHUwykCMPPv7mWEQY0HzHpc4T+tuJsgUThGuHucK
	og6ZmXkZ0fP6XDTG9nNrujnBCb8DHE/ObBm6QXnEAXoSXB4d1+eYiGzwmt3+7ci6h/W2Ufi0HCW
	OeW30p6vGEowe21HSnHqddt51RIBphPO607qzsEobjMKNV3wgpqm85/qmLxmmvIfP+Bp/tQrl1H
	2nhoou/03XuwJHlWpOTZ8NRAXjimceleDJ+Aac7FXACUPdDMhyb6si/MSxPb7P/lHAAtr/Akl9U
	yuErJyTMjC8gshJ6HHlsR9FogpjfaAzc/Q4I1GNX4qgDUFbb/dRxCfh/E1QUanEzxm9b+WY/p7a
	O4lZjJL1vR5QQ3O6zm1UdrfayAdR42z1QSurRy/BBCySSLovHXohCMx/QSQaM6jL/xWE78cxhEc
	nqoh0KBTSx0TAjOKK7dZWYmXaRrPmoho6t/uGXmJmUXILmVULW/pLx7r7kn+vxRnP4GWlmE1yoj
	RNSpfuBdZDjCkY3UXg0aA2rovqILv/aN+B2DOfcgQmfMt2McvJZrxcH+q2pbXfLCzXUJGEWDxrm
	O2ZYx+8Eo1hckL0Q=
X-Received: by 2002:a17:90b:3950:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b0db6f6c35mr1062138a91.62.1793934228109;
        Thu, 05 Nov 2026 19:03:48 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a04a39sm118179a12.15.2026.11.05.19.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:03:46 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 06 Nov 2026 11:08:04 +0800
Subject: [PATCH 3/3] ARM: dts: aspeed: ventura2: Name the USB-UART bridge
 reset GPIOs
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-ventura2-dts-update-v1-3-b085ece9bf57@gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
In-Reply-To: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=JErXBRcaQqttTRbJYkhlXXvroT4ugDdSkuI4a3TfxsQ=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq7USWOSM+Se8JtxUUwtmuKQLlZfQThISypYBKs
 cRvRTZN/aiJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCau1ElgAKCRClg0K3CVbE
 gTnNB/9gX6LuenOCksACETKUVDRyzmW1xPaQiXCUzc3TTNnKY5mK80xYSM49pNtveFr/8gL9L1A
 4ZTufnTHOb/E1VsKBVmkHFP3tWQSskkBAlnMrvXeOd3N+edRLpX63+IKV+eKhChv6SxYyZmc+u3
 zEi27kslPErTUrWnjUKy2O8vpSLYLBLw3NOHCo/nweTGmxqnMat8zZwPczvXM9kS/b9HROaXEiN
 p9E6HlSi8G3q/mdZreGKcID0wHtwd/VagH7BxR4E+tLjYnpX2VVGiblyJa9VgBSu8RnDRyJPyVz
 3t+HZ4TLKxdxa2ruyituo3pcO5ZAB3zSAPQ/hO//B75hvGtd
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Lines 2-4 of the PCA9555 at address 0x20 on I2C bus 6 drive the reset
of the three USB-to-UART bridges. Name them RST_FT4232_{1,2,3}_BMC_N_R
after the schematic nets so userspace can reset the bridges.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index a9c5990ef969..af26256f19f4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -1937,8 +1937,8 @@ gpio@20 {
 
 		gpio-line-names =
 			"", "",
-			"", "",
-			"", "PRSNT_FANBP_0_PWR_N",
+			"RST_FT4232_1_BMC_N_R", "RST_FT4232_2_BMC_N_R",
+			"RST_FT4232_3_BMC_N_R", "PRSNT_FANBP_0_PWR_N",
 			"PRSNT_FANBP_0_SIG_N", "PRSNT_POE_PWR_N",
 			"PRSNT_POE_SIG_N", "",
 			"PWRGD_P3V3_ISO_POE_BMC_R", "",

-- 
2.34.1

