Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4013F5BD4
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066043; cv=none; b=KgtlRu70PQ1hmmsmFa0fz/JYVaGNQ4tjKrWaSCOPUvkd0MnD0u0qMLESCSoCH5nAcTWEiZlMGUATnoi4noNYSBDIIBFMBAH54UE0cODgOE12LdVq2l7B0I7wvIryAtA1LbLl17Ozf0Rr7j/Pa3f7IqmRtX6BH1wioKgo5gMtIxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066043; c=relaxed/simple;
	bh=MXKUBiJzlMVGpwrkomHvlBqgpgvg6/eq88jnOonGnfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WECDy5TjCN4M3AxD5HWddWhqBt0/ypuA+wi/f5tpjBlHDFyyJ2QGBeqbhFTGp+W3gJHysPxMLAAq3JYzWl00t1WpCBzPvra88OPmqYR2giS+qxwicdiNVuiMSUhR5XVbkQOE0d/TBoCyIVsolJ7Ahhzk9nbV+ZZyjCMlfxU6xJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=hRL+BMhG; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hRL+BMhG"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so633341f8f.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066039; x=1780670839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQULYkqXtjivJne37GxmOPps34TMKbzDHgmdioeMwjo=;
        b=hRL+BMhG3ADiorxr/PMg8bsPCjyvZk4/NBZg2G0bRJP7/aXi5+uKsGfhTpZPuTK3Mb
         HyW790cyT8OsjY6Um5LAA9IMlmS5SnWAvTvn6i23MUeZQoPxUBs76BU4QYoLy8IDQe8n
         e08SZl9xPLjRPOLQqIfmPCcBOjt8sdISMOa/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066039; x=1780670839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQULYkqXtjivJne37GxmOPps34TMKbzDHgmdioeMwjo=;
        b=EjLO3k7DvZ5gC5DzpDv8SqtpMZE/gvU4v/yTenVgNXLBAf4ovyyQYUZlwu+FWnVzPS
         LZu7uq8KYswdxS1e2nV6VWjoqtkX2nUhwyQQCP457y+OLfe5iVQOnWW/qAvn07lMac8q
         A7jf/XCF9TqsxPrkfInpkN0yIbelDpszAfbD75zPmJqJgp08aHJtNcI5Xcg3PpcI9GdJ
         zWGSzZBAs/Jc8ZncrPqxs5wdLliyR3RFLqQxnq6nJ7sQocUJV6vWiAfQEreQGaYIG7iF
         jXg2YLrxwPJnpkMFvgPFxHlFzsN2p33sm4P9gCjEbe+YOMRdTmvJYFHdwYA2WO8TlpLN
         nzgg==
X-Forwarded-Encrypted: i=1; AFNElJ8gumJfyvoTgw5mAH27RBXV2oz5LJkLUJ20SB3I9l/+eensvAcW7sa9/GJ6nGLYt0qKO+IwLDpQJKW5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx79zyJ68ldWN+pAeU5UgceC/ChuAJuaYHdoGzNKzUGPbwxNYM
	6YMzWrBr+BGpY0xD26PSOWwyF3urCzbbNPAJZ0wzw5Rxt9/cAUkJgEdq+S+UKjVqoGs=
X-Gm-Gg: Acq92OHG4XpaKonBYu0/vO64T4p6bB9tkL3oaIryLvvgSm8go4spQd319nzwyJGVOJx
	Fu80mXQhR06zhubynifVbMnKXZqRp57Zi779l8sXxRXxUacblCKiJMIKy6x5wC3fXYgwmhHTWTt
	MG0BgYQmfi0Az6mrQxBjwv+RjNG+lQ3Pz7AuMl+hien+b3d22wT1eHeCoMnYq8x6Bo9r6NRhD09
	JIPuJ/qqhG8+FgMJanQAdST2iUAHqL+QpTXeZZe12S2TsR7F/U1qbdiKB8wcYaJNvAj2HW12Rgk
	bpzKxdv7XGWCbG3/KnSwuT66vmCM64aBFs4kihdNBVattH6zb/blLuXqbSEc7m7xqN9KTLESMSn
	G3vwdWZU2S7P4+PLXyaB4T6jx2uuyvnm7JnVgBTVw8wTofmFtx7NMGZu2yyRgnPNvLME5mb59q2
	8QAzN6wRRVoof84DXPvA1KFanowZqzBCjac0rvl2UTEEavaCC4QWwgFK1zmDoiNDPr+sEykImMx
	z42sewbMxtPkAVcMGsAarcVkBy9nZfM52fdEh8j0R759/eLYckiukVjOw4=
X-Received: by 2002:a05:600c:458e:b0:490:5466:8576 with SMTP id 5b1f17b1804b1-4909c072597mr59852445e9.1.1780066039269;
        Fri, 29 May 2026 07:47:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 02/15] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Fri, 29 May 2026 16:46:16 +0200
Message-ID: <20260529144707.3931919-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..5e46024d2215 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1667,6 +1667,21 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0

