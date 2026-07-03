Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0050C38AC92
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068387; cv=none; b=sAp0f4f/4F776zCmWMdk3DX9o9HYnllhb1pNCylkZg3kBCHTXmb59F5EW1ClDG8UL+x/LPip/hyhl2L0uQQxKjfBp4CEQvlHx/RVzhNErk5nN9mQLsxG9XqALF5K5FhJ7M6gVuDAgmaB08PiEVglKKEw6T17lwPLBYV+58IUuEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068387; c=relaxed/simple;
	bh=xAsE4BKzmNkSHJQwJA0mpLBNj278efleZCG33iR50lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tR6XOekwmm2qVOqGxHhFQcbF/3ZWmCpqOGVUr+Bws8V66CxAsMAzfGRit6hxJMIQEMk/09tYWnd/QeID+Cd5CSDX3LTpZwdZmeCIfG94gQR9o31hUGKuXKV7twGOQaK3/15MKn1H4/2TXUCXPwA/R7wqHVIz0TKZ0xxyL73BIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZP8P5XKn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZP8P5XKn"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c19bad03so2630665e9.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068384; x=1783673184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+UNia9moTKDJ9co1FJK0IMviLV0v2Ow9qfVtGCiwwk=;
        b=ZP8P5XKnwQDEwtqFLaVcXSlA//q3K1bZpOIbGgeVQqAPfCfIGTTI6FjAibIazb5R2G
         v44Xrctmum9hW1r0hMGd75QfiLnDaaIw5V1fcnTsOta17c4fXP0270O9P6O3rTOmanWE
         GuM4kPG3B/vWA3TT6kEJshtqoDKRbcpT/TJzCA6981j93YLgdnNZlX9AhvwmIPF/W8KQ
         h0CYTAFAtMgGCBJxAdcnCwzMPlZI0W3vKmFIWOauPvUyqv6nr2dGIvKcwDTE+MgjRdzx
         LxDqUmJKNQzPP5ZHMhJLhdONpDvMZ7dcjYKlirYG/tC6CvZ+HQeBhmE98/ghhn1SqMh2
         E65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068384; x=1783673184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+UNia9moTKDJ9co1FJK0IMviLV0v2Ow9qfVtGCiwwk=;
        b=owsTIzxv66Edzqa1hSwIiPyvxYqlBluoIKr1d9XPcsk9zp1hETNnEi19mE+Q6ak6eh
         oXq6zP9/8XDLASB0XjVLUErOm+Fxjr7l0qUqwqoUolXbR8sXcrfIBN1KaA2CM5e/8jZh
         xIHKE5s4JRVU7CAXrC/LhAc4E4sZF94ZWWvdECH2WdTQulhc+DLnRZ1qPBu6RsaCh5F7
         c604kYXPNm/L4npzyVkQnvt2kDUhaVkTvzTaBDPdwPwn3fI+370wsP/dUWl6Zg8gFi5u
         RvGv2YYYqEB3kc3AHkwcR/JQjkw635mlBKv0rGW1zMQbu4IZjfTiIVCsSL05/u1tGc77
         aiCA==
X-Forwarded-Encrypted: i=1; AFNElJ+grrh71RYLQWUnaiuATToNg0ll8gNDz9U6JUnft1Y2iSkl5fNnMMkSLhiqRMwWF1Lc1UzAuwBGR+15@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6sKDL900YsFLycu4kobuIWrOMJ7UBWsWqCj6bwm/IVQcx4d1a
	raMArlqvckpWzpHkTxh4YlGc7Mp/waGTqOsgla4yX4oRLSuS6gDYYxaV
X-Gm-Gg: AfdE7cnyNUA8nwavkiJ10lsZkJWFJUUFi+Sv5myUBfqTI4L0g9LMYlpkF6+7Y45vwwp
	5IkXcC2rfDmuA/C19kHLc+uRi/BrXDWloMfGKTPwbGK7yd7nYMMPqB6T/8jZCV5PWl0Heud9M3A
	dHvT9DtjBn/ps1D1fIS8D3RU87pypOh6hjqA5/SG9G6SSn8Me7BRp7l5e5yWYT5VB4JWFfi7OfV
	c2UNZRWUGdxykKVK9QUWiBzeygsyOyqI3+LiafXnEcoRbCUCuSsXQmeJh0OqrijGl6qXA+kFbmB
	6TFChf49dIblou1PuG7kxo0vUams1nQ0w3ZN0hdCbJzz1cCGBzFyPqtRnPro170l+/kcWboSCME
	Ezq7gfIeHiYvmtEh1Ms2v9EmZqWIwnU8QpHt87F+XbUS+Vvfk+GirfgoCFs/qs1w35oxcohS85U
	usnRBe0+6Y7NZZ9EHx/6bTF9SAeD0yKtpWXBkirKTZ1w5i0iLMJHTbkI7tKPMHyBhDKI/OCOwe2
	rVeiI6BGt6gYF1jle8pgXvO4Q==
X-Received: by 2002:a05:600c:34d4:b0:493:b8cf:cc8a with SMTP id 5b1f17b1804b1-493c2b3ccd2mr119335125e9.4.1783068384366;
        Fri, 03 Jul 2026 01:46:24 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:24 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 15/15] arm64: dts: imx8mn-var-som-symphony: Disable internal RTC
Date: Fri,  3 Jul 2026 10:46:02 +0200
Message-ID: <1581109f79e902429e291b0e7760a81ecc4bd0e0.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Disable the internal SNVS RTC on the Symphony carrier board and use the
external DS1337 RTC instead.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 2afb5b438b68..364127257309 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -223,6 +223,10 @@ &pwm1 {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3

