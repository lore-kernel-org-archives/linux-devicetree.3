Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721605;
	b=Xfm2nFR3s/ZrD8t5ane8ZjRXtG32hZs0dPzmlljiLtWHCsx4jLmeeDybOUGZAMKr1Xo1
	 gMkidAqN1GNoSef3N+1KL2tUTacEUyCnMqiaLnssge4dRxC5cyGZBT9qBHR2zTVJNo8E5
	 uyqfVSaqzebZXNjkXCc+znPkzuSLTdFD5ms7o1fczdgmYPESYc25TG4Rih1lAkyC6sd11
	 Ox2T9+BHpqG+b2W7wr5dNEehp04nEigsBBrW81zYIZ4GJpoirXI4PSIzl3Bqsh3So+ZJG
	 W1oSFxBnhvYEidNrNEl9lC3kxBBKn9ua2s3is7/URe8XO4yL3Zns5Qt78pH0AlL6a6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
	b=gvbk1UzGFckphjfqh+OLEyn/zubXDRJyxNSB/pIKqDFWmB9Me2/qt1wOrZI6l2xFvYdr
	 0CiGhmRWaeKAIPmwXP8u1eEveB7iqEdXK9cxLI/0bezdv8QeGBxBs73+HCBpYPrIn5c2W
	 7Qoq/k9q+MraW9KC4v4VGEFZsWTHltRl9lARDIYO6hFHD4aYJq3uc6ZDJlj6aK8BYg9+q
	 uQ+Ky/qX2pBkTY0MdCmF4okWQF0u8E9gu9+uizaV1Qa5mp3fioIdoHuMHvcDvR2VB5YIN
	 Omw7OtBDnTwB5oRI+GCWxoh8/Zs7udh1bWvB15n30nxzRAJOY8Ye/ytDmbleJoprrzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhYPefAu;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB48606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AB48606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhYPefAu
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso52982845e9.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721604; x=1796326404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
        b=EhYPefAusGPmoB/IQaaCviMmVmd3aEFWZHmY615tiNrhrj+js7SMBsIdObpnT1/Lc7
         XJmUicrtw8B1wiXaB1A64+/UVkzoq6zcEjX7NMKXmdrGOO+2AiAZA0BYwy9KZRJzLetJ
         skTrFXyy4Qbk7sHrN6OQuYqIjoAoebRhG0Ic7Gv8csbb/sFJF7t7gNm7HuCMexZneFya
         FDXNSo5JFWEknNeifM+MbmCfeXMlpObWPZ03OAmX+g6zsvv8ap72p4+KQjbdA1la2mxm
         NW1nDTpGJm9g4/x3kQGVb65bXdf1fZxCz67u9EOCiS+nrn/7jHOqAzUQQ7mCaorTmrQV
         KIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721604; x=1796326404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
        b=OQ2iXWf3Q24XprMiQxLVGvTemgmOqLezIIXCdb2saokv/NhpTFByDSt6zc7hiNgayS
         d01UgS71G9ZoSAO6YUPPoy5OK/32NCmLrQBXVG5LWOeMM9awAaABXNGfevp7e87KY2D5
         pRMlw5qTH8zkMOgnLL4C9un32Y2egjSkBa4A1qCwQju9NCRK1130LM7yXZRwcQ5UTsQ/
         Q3JMDiBa7/xS2mTBFxtDrul1tpQsfomJ3AfN9NzHG6PMp+drS6Cq3064qw2TJun+Y49z
         lh6cDd7781xjKBCIbvmHa7W63XGyGvZ6txjzqxh23W3HHr74FwMC29E72N0fTwAa4QRp
         nA7w==
X-Forwarded-Encrypted: i=1; AL+hErHFcBxeRno1lofU99gXf/F6b/vUMFWi7nqRVfH5VfgZ/8fbSqXTMZez85TDiRyJyVtO/moW778tUhWP@vger.kernel.org
X-Gm-Message-State: APuU4Z8EIDup/Wc1Le/1gJH2MJdIWiL+i9GzWr34aexn6xHXs71USIcw
	qt9krebbOnIwT5vIFJeRLFRvetAg0wKb8W8b7syf79SbIeIa61Dn/RJl
X-Gm-Gg: AZFdTZcU300fXSnOSqxugCw4AopzOZq7h+FTEq/QvzYMZKwhns5neMazKfx7e157FWV
	XPpnhJB7g7swb3qoIaQKWzpjl4impi4hjo2nhn0eZxjxGx3+opThENECMYXjk0RzydP2R8MrJTL
	gNPhPTR7lIVpSJoNNfxfIHzPPuEXIUVtN/DEL1gnS8Sb+5Lbif5atB4F3ohiThny6pXE/2+WoNf
	Z2JAJTthdW6yIYk6q0R3v27bocir4u5VI2QGVl9xaJhNB66fGSxmNGMu1Y17NRJcgr547fQZLUp
	EOHQJa1VoTAXQABAKN9945tXG7V2wZAfGhEBFcR5C9cATJE4Z4l2o5Jjj0FoNpv+QuMbaywSpvA
	R2kouvDB181RAN0aJ2DysWRUf3BpquXLC9zC+CbHII9TuIgblh/0cHVLW8BbpAQv5oiMrqRtF29
	2/5kiecpCTanb7Cd3cFFOXP2n0E/FcXPneN7RpUiFomoKOwYhk3C3ImGVHHz8JmDY5hs/0wISF9
	gwc59u//2EGsVajHjyf9Vi6GZQbrIild648Mj3rvPWglPT6o92r4mjEHpW3eB07vpEt10ddGR3v
	XCg/5yt45X+JEkV0XR+nsh6McpLxpJFsLY+IWbHWOYJPBA==
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr424253185e9.32.1795721604012;
        Thu, 26 Nov 2026 11:33:24 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:23 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 16/25] crypto: amlogic - Add support for AXG-series
Date: Thu, 26 Nov 2026 20:32:32 +0100
Message-ID: <20261126193241.1471372-17-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 0fb0da20e06b..08d89db14788 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -290,6 +290,14 @@ static const struct meson_pdata meson_g12a_pdata = {
 	.support_192bit_key = false,
 };
 
+static const struct meson_pdata meson_axg_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 3,
+	.hasher_supported = true,
+	.support_192bit_key = true,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
@@ -299,6 +307,10 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 		.compatible = "amlogic,g12a-crypto",
 		.data = &meson_g12a_pdata,
 	},
+	{
+		.compatible = "amlogic,axg-crypto",
+		.data = &meson_axg_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.47.3

