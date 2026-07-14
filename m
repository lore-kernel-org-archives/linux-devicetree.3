Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D35386C1B
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030341; cv=none; b=SjzvIFJBN0epj3U2HH/E3ieKQNitrZ8YTheYhSLus7O7r2rXFp32EZtaVyOTmGOZeatNThkojVW4dYGB11jEQtexen8rSA18RQB7IvkM5LIRXqMLtGUjg3rrHx1k32RDihOOL5uxWNBSBRZJN5ebrcYTRRxon0WAdMu4dM4CZp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030341; c=relaxed/simple;
	bh=5cZJrlPKOxxy55cU1I+05GjtpUsf/PqzQR7YobX8VZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utuaXdbV6ySveLtR62CnoPSv8mmPk8BG/30btWrhKrLmGYQv2DN6A6Vp9FA/MhEIk9T47phiAwwj9UtTQeAadEX66SFqrel3dd5Dx89THuKO2KV3q3OWpJ+J0uMQ94b3pxuqlMzIdTlZnJDoe2aC6OPeNm8jJSiKdCcXFVGRWqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCQLP9se; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCQLP9se"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso36619735e9.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030338; x=1784635138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=HCQLP9seJ/OMZ9pdnNmy/3nG+QrYLB1r10xrbFaXqXomVSPZPY3rju14Oute2kvBbq
         AJZYspx3jG6ndRKMWsjr+rDDZTPePrhVQEHLdUkOOkEgL9Th3Cp0MeOnUETvgqwKn/2S
         iCWm75ELh8Qph3A2ehEh51+B7+vnuLLFcb/Hgok0I2ItkJtEEvs2V+0L23YG9xVbFbY+
         WXRALB1nl8N2sSsf2p0CE87wMv+8yj/39NLmqDL8nDk1daqzxAJQgxSkUcfwqYdtXzUK
         +8TW/I62YkLgijucIzwuB/ty2Ze27HGpRypkLanYIcy0IhSqty7ME2WKLVdbxKA3ujwD
         DO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030338; x=1784635138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=ECWkI4ySZgGpqQOwc3L+Z6uVsR5h3k3pRMVcDkDEJVFkbyOwkYjKJB4Z/ddp2yyjvK
         +KjNYkfepQriGtTksIwZA1686QJaXZCch82lAc7Rr8rGfQP0iayfEObmIuI7ZERYgnx2
         6w8vr2FQkg+TMSuq51COQONQxg/PQg+/WyROZ9Q1eJHN/VdY0MN3J8HuFdZ6WN+gLhnk
         mtDAyAg24HsdRxQFwgLnvwz3ef/tR6yy7z2173blEPF9MbbdqZSsgTWfmAscLHxeATFw
         JiAhI0vDXc8qCkJgITMUituLKWJExrXrC/Eh8nrvNUzpp0BE6U+mSEghA1hO/aZvXQol
         aAzQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOW9FrNEIgYkM+RHsaRKPHOINFPYdiPrYU2SUBwxpvrH2QM7FtFrsmgE/YXFravWoe0VkA+H7KAIjV@vger.kernel.org
X-Gm-Message-State: AOJu0YwzxsJdE7o7q1PVkfNXElJtTzP2q2ZjEPMzIyK4A1dsSg/1VvpP
	hbqkg3bC2TwcSvLFrbuLd97n1rslNdfg/ctPanydLNLWl0qEYvGVR7vH
X-Gm-Gg: AfdE7cmAqqxw0BVXzzIQIkSkym30S6HO48R3mflj1Rw7FQYBeEP/+dpHJf5IfY43tZT
	GdvdA75LUAv9nZHwoHtkqUj8zFozYakBxJRn/9aPj1kREKzNgPyRPKIcYj5vHoZ5DCtB+8NvRzh
	GyCYGWRxCfF53ddgCTPXIytlAf0C2uHiZqCnmy/6Gbzw3hs6Og26raZdzaE+uK//vz5wa92rDzT
	0fqlFOkDiRVFhbBAngrhGwd1HsTBlmukxChZ1HcSh07xnGMgJd2y+D19kIFsTe3oZCIygxgMka5
	/SzSPMt83fBytLf9WqqR/lWSph4KXn0nEHSSYfhiO8BrsKLGRC/T6sS2gpcyeHsPh+++0lNIVAn
	iclbjLsv3B2cG18Vt3on4gS5P1RjCzRBSOHnZacfEjDSruGKwd6ABzRG15R+tluMiXeRL28QoBb
	R0jwkF/vNerEy89KLheTO4RTkMgiH5zysdCJfV35WY8Wzkg11nyQn33GqXWft32whsqksYYmsNJ
	CCceYWW
X-Received: by 2002:a05:600c:1f94:b0:493:c8c6:4989 with SMTP id 5b1f17b1804b1-4953909f29cmr16692335e9.6.1784030337488;
        Tue, 14 Jul 2026 04:58:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm180531655e9.2.2026.07.14.04.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:58:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Tue, 14 Jul 2026 13:58:43 +0200
Message-ID: <20260714115848.8537-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714115848.8537-1-ansuelsmth@gmail.com>
References: <20260714115848.8537-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add additional reset to control PCIe PERSTOUT reset line for each of the 3
PCIe lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/reset/airoha,en7581-reset.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/include/dt-bindings/reset/airoha,en7581-reset.h
index 6544a1790b83..25e75534daa9 100644
--- a/include/dt-bindings/reset/airoha,en7581-reset.h
+++ b/include/dt-bindings/reset/airoha,en7581-reset.h
@@ -62,5 +62,9 @@
 #define EN7581_CPU_TIMER_RST		50
 #define EN7581_PCIE_HB_RST		51
 #define EN7581_XPON_MAC_RST		52
+/* RST_PCIC */
+#define EN7581_PCIC_PERSTOUT0_RST	53
+#define EN7581_PCIC_PERSTOUT1_RST	54
+#define EN7581_PCIC_PERSTOUT2_RST	55
 
 #endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_ */
-- 
2.53.0

