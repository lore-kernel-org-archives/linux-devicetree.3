Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1260A3E9C19
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465650; cv=none; b=D4UN7Nh27lKccHcICXZ9ZTeJd1HGqGDPvirZJEogH27iD/VaWwHOPDwH9YnoDc52yUJ50GsaF6a9OfCvZqSuocjk9lqTGNZk+m5Rcs/e3QVHps7+yT2w0OGE+c9deb2mE8yYblHEw7Jt3+W0dPjmR2VDVyZAiH05z+o/goC/cJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465650; c=relaxed/simple;
	bh=ZuNZE8rcXpZILcOaEBKLDnkP7uQZIoXjCu/kApiOj7o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wdt4BGuFKb4WdvM7a94Bw9lqZ98YW3AKMKUH/v7YaVZacEpsXlF6DAT6dOmhsd7uHWDvEed7kr72yb4UQ/g9I0gQbP7CuVxqvM/icN5h1g4xCGcKHd4BBzmzNCczEps7zMoN70C0tm8pFmTWBk0+mVcCNmemqZpC0pmMq0lHiJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmwn+f+h; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmwn+f+h"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49222b6e871so4262355e9.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465645; x=1783070445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=Tmwn+f+hQLjT613ft4JfBaBwQNbRP2Ksy0+mh6WwztCeTSm+/2/I3DE4SmNH3X75G9
         +TCizRPIIxrdzi6Ihdg3FRlAr1ZGCndG9ev/oAZOSY/70Q/vxJdZjBtQkHTLkgfH25y6
         j7zYwWclwZVZH2VXCyvMq6itKa+66k0GaxEndBfCtDXvii+n7VZ3xBDxiLCQq15K2TpJ
         R8xKwQyHZbLOJ9vNUFd+99hp1cMRrFgfdE9rFMD4/bksOCJdJiebtSUwZeg+0oYupmt2
         INsVsYtd8hzTGIjkpigJmKhep8vdch43Yzt7ZPPB0PtIFsm10UX9tIFN0ns6dbXpPZz2
         ef/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465645; x=1783070445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=EN93ZvTxVuc1FZCverGqk9k/izLhZI3SDFRUqoKl77iaJpcG/btSzJkPtumbAOFFp1
         b7CS7TrATMiB/XXbwCAxVV4lrVMUf4tm63njn0eiKECO1KJsw2n8cnlq6lQYyXmp2m7X
         EyCwBKjHnas3HiwFdnbZAvvPDnhtxc3ThWITPBywj+FEGBEVN+jsc+I/6wwJqUcQvLJ6
         VAx7556btmvGt4pPfoOjGkyT71GeGDnXhS4yXfUFqWnkouIHyL1Lca6CjZvsnqt9h/lm
         iPayJUDoGNFUSg3TA6zjnODu0Djnj+zWK7G52goglkKTim1D8opuSZA/wrNOek826A3w
         ELeg==
X-Forwarded-Encrypted: i=1; AFNElJ9No1VbuTEzuKThr8ElHYheSMJ5NJWcDkhSCBxOnCeez+yCv2RWsX2KFvJ3nss/jRdUPN3j8xvCVS4l@vger.kernel.org
X-Gm-Message-State: AOJu0YwrUrKaofT2SBFaAeeWhbHFrq9LrSvfFP7KbrNy3QO9Me2EcijP
	JkbDt/MWt/26CKx3zHBq12tho6Gt3czQSw8rGYnJPQsANYO3UHslgG8D
X-Gm-Gg: AfdE7cmrjpFRFZd3IvIRN0nCKyemfk2WJcKlIXd5l9DktHodr+NwM0FrBG7KJW19B42
	1ZkJ+74vryn/UrClvYutPVq3O0DQCJOJXPxzmnD0f0ZSxqBJWp55zw+hRReNTGGhVdGsnqn97bB
	56psP5FhFc4jjpipEEUxCBk5BfdDPg0CRoTjHxdX949E1jvppJ4nhsG9vhKB/HmXzZnm8ZKm2yU
	wjKdaHlyyuWxTnCyQTVbgirK9LdUVOfn1vORR99k6xevY0YTUvEJidCDPdUYT2IzxX7fyH6WCeW
	8aXD3wYzBGNemyxdo7ira79LldYmoSpkLU9wgvJrNh15RHnG6fCD5E10ls56F2ecfyPopw1jfL2
	nSVL7r0DUwDi9s8gFWcS7TcoSU8Cogv8AVWjZZiUBY4jz5IpFCrZwmQbG2cNvBc4Y8HIg7t2MyE
	5jihJXatatAsJBZ38ZhLxlRcgBFY87GgX0qF7kRYcYj3I/ETiOyRRyCHwVAyklwUqh4Ay6vrRNA
	UAJGn5dv5ai
X-Received: by 2002:a05:600c:1c05:b0:490:ea8a:32da with SMTP id 5b1f17b1804b1-4926689ee78mr79972515e9.26.1782465644046;
        Fri, 26 Jun 2026 02:20:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:43 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Fri, 26 Jun 2026 11:20:25 +0200
Message-ID: <20260626092029.3525264-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626092029.3525264-1-ansuelsmth@gmail.com>
References: <20260626092029.3525264-1-ansuelsmth@gmail.com>
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

