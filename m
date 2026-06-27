Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246FB3AEB35
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562506; cv=none; b=mAQBvEXS7nr+c7N79WatYrlJRXda9pxlFXMP4kDgLfUhe1jS0Hr1BIBib3AhoRq9kZ1t4bgzE19Q/zJhfpC7BgJj8n/IhaXEve7xg5hG9H8l72kT52J2ErdfMOJNWgP8aDPtT9uZsBsY6l+TICgRqLrcw+BndF3XWkbljWITTC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562506; c=relaxed/simple;
	bh=5cZJrlPKOxxy55cU1I+05GjtpUsf/PqzQR7YobX8VZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCZas6YcU6PMfhPiCn3pzzteZsLTAW2619EmZjSAtKse7ke5S6G18Gj9FPSSQ76qrv5DVmm8R3t9tCHf1UE6alm/gEJZXm6TQ3z7TZQFzIF+MfkB517icRZGBkjmP/gCV6N/GYa6FaA0q1984Ao9fFefxgC6wcxmJ8tDSKH9bt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFoSnGKD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFoSnGKD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49258ac7294so13275845e9.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562501; x=1783167301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=iFoSnGKDTDoVjV9ZO4L7oaMPM5xAiGSbk5f6ESpfWfYr6Iv4S4GA4H9IGRhYq/2Jiz
         HUJEWbtreC9/7pfwx1yjIkA2YXWMRaNjuF6Z7zQEYknm7rMoputFmk3il7y8s9YOCNkL
         6C3Qx/ehBw8q57LfKIkOU6INeK0OYPAG8u0vmWwNgYtdXNtImLx8SfLeD+UrN3nxfy+7
         A8Fv/qRElyjzAjVWa1jsihR6/dyVpMPDhLUcojH3F7BAVqVaYvvblVAoKkTA4N9xl4Y4
         G6Fdy3Mz98ZH7U+EbVbGlxG53JlUChPnbaRZA0aove3dMIPu/u3AESmJV4hTzEyaIjbW
         pm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562502; x=1783167302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=BqdoSRVDU32fkBc6Tf5Vfj9w1MwYgf4FSk6J/zfzVvx+UXFwQ1Ohh/zBR2OhwljtNj
         sJeKXgBPRuANKWnu94diI5ooUrUnYo1gV4m8gZTZESEKDcFsER9o6WiHfkm4tfJRiUyX
         XauCGO8UBUyCJhQkmuBHo0YG94OLHBS33cVZKl4Ii/dLqL5UALmD9GVz4QR+1M6GEjTr
         s40vr5BcS6T8IjkUybA4ENgDcxG78I5ACbA7OahojTtWH2ur7C95NyoL9OpN834p/1LT
         aPEk2r3YMHdbbkZs9/mOXQeXFaXhmt3daNkcyVCRi4TerBlqXAhfyw7obw8Dj9j1vdsl
         6iCw==
X-Forwarded-Encrypted: i=1; AFNElJ8PxfBcwnxrCCHTCZdlnDFizeLoAjygWJMUHY1ikiAW+DIRgl11+iXYlPsk7yfJKFGOkTB1dvXBfghK@vger.kernel.org
X-Gm-Message-State: AOJu0YyUJUAc/FC5cOb4jtpuHCRffqRcgFOxwZOonX8Nuqf17O5nD7fL
	oNODDNjn0MFuyI0psnefSyST+0dieod5U/h28GT4snl3GlAkJPtUCOyW
X-Gm-Gg: AfdE7clZhMDfpEwjKXWYcqbxYyyCHCvRJoKXbIp4aPi0e8jbNl2rSQDxqlZwuTWs9uh
	oihyOEP65Xijm66BQMAHe3FdgxLOseiUG6mG2rEsfkLN6dbJkwAcZRy7f8ba95kZdKf4yYtlRof
	OF9za0HIV/aGx2bOajy0XLAM/rOn2sR+bVEnEsWFvt/QFdEBX9djS7YfoMvxQV+zOI7t4+MOuFS
	p/fc0YNXOTXUS8G4IR2Ue+yupo1qkFyGXTyUiT3+pr/H0cCF2GU7qFu5eoudj+6u+CQ/LR9hRy5
	2ecme5HY1LM5UYgdXZDP0rGGn04A5rDqjwoYP8BKKNH+dM5p65ZR4iXwDnWVwIszyw7ZS5bIAnG
	/6GHsEEwvDrpsQ15+nmqsCM/50+RHZegVMcoBGcxEmY1df1NkQLod4KRh4THQNlk953/gjqP7F9
	TM5YsUHuYSBzkxL+bdIenqooFvZFsWQsnsdpaw3ZiJ0zU3QwXXxAPo8MeVZh6LUQ==
X-Received: by 2002:a05:600c:3b24:b0:492:3fcb:22fe with SMTP id 5b1f17b1804b1-492668551dbmr160952675e9.1.1782562501557;
        Sat, 27 Jun 2026 05:15:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:15:00 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Sat, 27 Jun 2026 14:14:42 +0200
Message-ID: <20260627121450.3529133-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627121450.3529133-1-ansuelsmth@gmail.com>
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
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

