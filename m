Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626757;
	b=mwDT9QlWLAv3vKgpRgeL94LBw7NVSCj+MYkBUEeS9VsVYUPSIW8a/f4yAQqs0mrlYXw9
	 ZJeV/CFShfa7IqbY/pMchL1QJAW1dqaCvWSVuqdNy1XISQipbGEE47RUWGZ38Q/OyBefm
	 IhmqeC+yNtwmsuAG7SO7qx8dgPmpsW9RuV/7mm63CpQIYFEGnQEEKbkjeYP7lVq+Bpmx0
	 l7/zH48FN0NkPsJRntGiCpdNB2/WN44ATTWkoZIUNu9tlVwgA2QWF1R3gSORd8x7nEI7X
	 mkqlFq2Kj3tF+UNgU+/jEcH8XE1SQwgtZ397Xrh3UtOkTJBK70Nf61JUguT9VJSZ/eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626757;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=3Nxm9FZZhwQSOqcgrWRIzaG/kBVu7mlpp5pRc2EJUiQ=;
	b=dfgd0ORj8AFFq/4qEpbHSK53pmjim2eexKAKW28RxIjbpk89RsL+vHHzgPmCx3xXp9Tm
	 N4TYmw6tI0aGAfLU2Xcw//9L+IoL/CMqON5MJAzQarlyWxwLJTAXXQ0nVu++UJOVseXsu
	 Sw9wOxzHEUR/VeE/vUHWK5CM6z3FJ6Nzl/d9saGbyt9wL4ZZ+zoRW3E8BviDVoJy7A/TO
	 T756/10ZzZ7irV7TPPONXyygjUe/4XUMtgMbKz3NuohDmvl094dt6C0/Ybk99vZJwHDoO
	 ADxdoIEZdzz22SLQhgo0T9igQpMCkApUI2GxQvdcnM1iTOWEWDsZx/eQd+KLO4t9sEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=bBAgQl02;
	arc=none smtp.remote-ip=198.54.127.87
Received: from out-zbxj-a87.jellyfish.systems (out-zbxj-a87.jellyfish.systems [198.54.127.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40D3606A335
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F40D3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=bBAgQl02
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jRKJR4R7PzyNf;
	Sat, 14 Nov 2026 03:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794626735;
	bh=3Nxm9FZZhwQSOqcgrWRIzaG/kBVu7mlpp5pRc2EJUiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bBAgQl02WnTFSaHImU3GaP2RCrcFfwXpg3HUJSRO77zJLBtyuLEW7HgzV5EFRnc//
	 eueomcAwsIPPfI10ByZmHP5R0AObP2SByGbWAt4CFdmsZsL5HVXJYDdZI+s0tJFFVF
	 RPAQuNAhpG+KnY1hX+N+yoYgBZVL5Xmy5aLe1HTnkz3i6I8gFM6HtBefIqDWK1yOiq
	 XfxQmvT8NfOInUHxLhfXBQAASrESZKrSD/kBCrF6Ca5kvltCjk1EgKHoiBe0L8T7An
	 SfH6O0U26qqgecbcxTmm5YPBf+FcUne8of4na+ooE8SRx6jq0/tLMgPIIJv90ZRdn2
	 j+1E4vVsjiqAg==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH 1/3] mfd: tps65219: Correct the MASK_EFFECT field of MASK_CONFIG
Date: Sat, 14 Nov 2026 06:24:54 +0300
Message-ID: <20261114032457.3434248-2-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114032457.3434248-1-dev@chrispinetinega.com>
References: <20261114032457.3434248-1-dev@chrispinetinega.com>
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
X-Envelope-From: dev@chrispinetinega.com

MASK_EFFECT is bits 6:5 of MASK_CONFIG (0x25), per table 7-46 of the
TPS65219 datasheet (SLVSGA0D). Bits 2:1 are the warm masks of sensors 1
and 2. Nothing uses the macro yet, so nothing has written the wrong bits.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
 include/linux/mfd/tps65219.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 3abf93719..5a6be84e2 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -198,7 +198,7 @@ enum pmic_id {
 /* MASK Config */
 // SENSOR_N_WARM_MASK already defined in Thermal
 #define TPS65219_REG_MASK_INT_FOR_RV_MASK		BIT(4)
-#define TPS65219_REG_MASK_EFFECT_MASK			GENMASK(2, 1)
+#define TPS65219_REG_MASK_EFFECT_MASK			GENMASK(6, 5)
 #define TPS65219_REG_MASK_INT_FOR_PB_MASK		BIT(7)
 /* UnderVoltage - Short to GND - OverCurrent*/
 /* LDO3-4: only for TPS65219*/
-- 
2.53.0

