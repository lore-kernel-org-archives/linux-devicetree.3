Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185727;
	b=ZvmX2szYXNZRH/JRX9diMgtqkW+5zwPQn+nQyRkR0cDP2RWj4vB5RaX3/wLCAoXi8DdG
	 N8s1t/OavNZbimxv2Fa0Tbft7+5t1vbUUwqMNyl42jLbecGRhYz9zDPM9+ZlsUKXhna2W
	 VLsBNjGMYMb/y0TahKR0k+zBO4k0aqTkOkhONJiTEB2LhOdCNx8QYCf4zZpVEi0OMw5zE
	 hGBHoBTND4h1TB/YT1Uk+G25JdCzuAHk4CoeeX/YwX1kAVuVKzzPudD/fzVCWWw7Al2jC
	 oX5WDRz8nBwn/4i2oBWv3VVY6pjdup4sC8oj50mka6c/NkJtlQe+XnhVixNuBrs00Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
	b=OA3rDrtk00foW6bkWLt6PvpFXCf7TD7oj4E0Gjbit0s+LvnO79MMBA9rG3P8+OdNxE4P
	 6VVZulaaWqUF8HQ4Xtd6NEPhT1meBmyULQkdtPGP+MzwjfhXidn+/jC0+T8tntucXOGTn
	 VTqRhCSlckuB+rduMlf1aijOzhjlr+k/lh7b7PKzb5N7H+Vm2Q7sbZA1t/mrGLjX3MStQ
	 lW8zFo7HB4MIX80yU3ez2hDiJJKfKnGdilUKyWxCskRXazrr6Um0JnUO8L5mXgHWbwXdY
	 jd+bwScbyHypA6AUhvdMfW0jP7U3WDP3/u13cHisxILhabb0GgnXxrZNmHlpEWMh6ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m6cWhX/h";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D724606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 14:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D724606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6cWhX/h
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04ad2c46dso3005665ad.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 06:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185727; x=1795790527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
        b=m6cWhX/h+b4vXn0BU65hYZ1zM6hIfx5Tbnm5Bv4U+zXZBnmCehNRvh8U2QNaXaJb2Q
         d0SAx0/VgeAnBdoq9aEBjAtKdSnOBiojRWOuacpCsyfzGqZdJX62SewIO6wagtcGd0dv
         X9MoGqeP5bKHbNozjErqxadLUf7+Ofe6EuwDLa9smiVJ4GeF+Uu8A3alGBCYD/OqrpZl
         JAyQHeRCXYOaFZwN8sBeQaAEeAQeokl4WreSuGNsd+OsMSnQXyBWruAWOunomuXNFD4H
         RGVy6leVWqPX1tRaQV6vHwT1NIoaZC3UsaaXEoEZP/tf1UWWiveMaCxRChwgp2Bdcec1
         i/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185727; x=1795790527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
        b=fcilZpijYkl6kLFi7Hnk/zCCgCdbGahLe6PVW0u4o8VkL9DTnIk7ywIXJUp5CkVM6w
         LfzpEA7m2JHe9tA/t1hWWgf+Wi5dQhrfvzGRPRqIuHCfTSlJx7BNR8Fe5MgORMZ35h6z
         Sb+7nIja0p62DbeXwDGdrLxJBXNE6IQaUcTttJraR1TXPKhDrnxB8LvlEa3DgNKQlZKu
         B3brylESgYM2cTMyCW3X1KGxH0/LCH8TMtAM5tOjTXpyNw4YrCPkZLw1a0+3Pr2z90zh
         9iUV/LFzjjdJVk6y5qEiU0YzSJVbaoPoXlXA+sIdQF7RCcSnDVlf8OLYXdeDCGWaUcWj
         d1/A==
X-Forwarded-Encrypted: i=1; AL+hErHyoqwXryiOc2IpnpF0oy3XvQMXEpbpBRdsvwXBdwh0tirK9aN/J4xMoI9HWREA67ctMDf37BAOgFZg@vger.kernel.org
X-Gm-Message-State: APuU4Z+OrQXTAnPhOWL/pgGzkAWUeE9s8+c0qigiChhqOllWKnaqhjTg
	9tuyorCRt0QBY65XhgIukz3ARhFZlz7EX3FPg5HdZjAQFFy0FuhzPhrP
X-Gm-Gg: AZFdTZdWpGdyP8ZaMS+ygNCOCOjn+eq5QKRRr0OTh5Le1f38ZbJODEQahISxha4JaT9
	yuEVRyQq6eaw+Vu9OdACwoJsijTATO87tNk2DQGqny44JA+sxdlKnFLjylK370XrHadYd09PVYF
	/VFPnacviW4YAsoHCZ2RjWpj/rYi8uXENBOi6Ht7pRG5zsokMPD9RNH9YfR+kElOYcSXzPMlUhM
	Jf+lyu8fCovC9rLkWABM5e2Kc7/2VMqYjQsdvXO+2cEluEALMv9hGf9MI0zReY7DR0J2dXFWzOK
	jglPmeCgh0BIG0q3TftzOsZlz7KypLY6EaMdLIY6ZmLvnb+QzFHOR6xscDCgFOBUe9jc6lIz5NR
	Waum8WVEYdS+1Qs4eyfJLs1kGc5zpqr0GV8GMQ/oOALfs3v4TXIkckxsYYnRQmwA6Iu3PVxSezs
	+epiuVpVbWusJehCkmAiyaxz11IWQd+2I0bYy4HO7A0rlrPlEpc+SnrJgGTUKrb9fiRlrKlIyFs
	1zE9su8QX+8s4pnoG6W797AXqpJxtlFFfJ2RuHxEC1QaANR2HHsku3Rrg0Y+qb88yqi7Qs7JgcF
	dFvBfAbTNx4U8JxBAc0x3Eoy6+DiuPtuBLE3Mg==
X-Received: by 2002:a17:902:eccf:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2f03f17c766mr37267005ad.19.1795185726811;
        Fri, 20 Nov 2026 06:42:06 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:06 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:44 +0800
Subject: [PATCH v2 1/3] clk: mediatek: mt7629: move clock counts out of DT
 bindings
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
Message-Id: <20261120-b4-mt7629-rtc-v2-1-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

The clock counts used by clk-mt7629.c size the clock provider arrays.
They are driver implementation details rather than clock IDs used by
device tree consumers.

Move CLK_TOP_NR_CLK, CLK_INFRA_NR_CLK, CLK_PERI_NR_CLK and
CLK_APMIXED_NR_CLK into the driver. Keep their values and all clock IDs
unchanged.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c      | 5 +++++
 include/dt-bindings/clock/mt7629-clk.h | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index e154771b1b8b..517c43b19f18 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -17,6 +17,11 @@
 
 #include <dt-bindings/clock/mt7629-clk.h>
 
+#define CLK_TOP_NR_CLK		108
+#define CLK_INFRA_NR_CLK		6
+#define CLK_PERI_NR_CLK		22
+#define CLK_APMIXED_NR_CLK		7
+
 #define MT7629_PLL_FMAX		(2500UL * MHZ)
 #define CON0_MT7629_RST_BAR	BIT(24)
 
diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index ad8e6d7f0154..cff9a02e8302 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,7 +115,6 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
-#define CLK_TOP_NR_CLK			108
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0
@@ -124,7 +123,6 @@
 #define CLK_INFRA_DEVAPC_PD		3
 #define CLK_INFRA_APXGPT_PD		4
 #define CLK_INFRA_SEJ_PD		5
-#define CLK_INFRA_NR_CLK		6
 
 /* PERICFG */
 #define CLK_PERIBUS_SEL			0
@@ -149,7 +147,6 @@
 #define CLK_PERI_NFI_PD			19
 #define CLK_PERI_NFIECC_PD		20
 #define CLK_PERI_FLASH_PD		21
-#define CLK_PERI_NR_CLK			22
 
 /* APMIXEDSYS */
 #define CLK_APMIXED_ARMPLL		0
@@ -159,7 +156,6 @@
 #define CLK_APMIXED_ETH2PLL		4
 #define CLK_APMIXED_SGMIPLL		5
 #define CLK_APMIXED_MAIN_CORE_EN	6
-#define CLK_APMIXED_NR_CLK		7
 
 /* SSUSBSYS */
 #define CLK_SSUSB_U2_PHY_1P_EN		0

-- 
2.56.1

