Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BEF4908D2
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784833315; cv=none; b=peiArdS+KXG0KSUqF4euVZeYgQ+sZ1HsNbcS4kk2rI4+zTxALKaJXdkTWnTLaceJChDzB4Og8VRiUifzBpup6kDf34Cp2tOTEnESJ9Fou1novtNssoPwJD6yIGV9nb1v4Lqtdh221bioRWmmKuvezUm7+FiOiXd5FlTaVpck4XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784833315; c=relaxed/simple;
	bh=5cZJrlPKOxxy55cU1I+05GjtpUsf/PqzQR7YobX8VZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sfB4Bl+dt4Jr1nWQCzJxPFYfa5WpunKKIVgHR+7mLRDAxFB6ACtINP4+8iEMC4O/GCY4LyK8jwiRoVfcVzblE5UySSDvXHlzt7Lc1lFVgReSrTOemqs91huPrCzZkRRLlo0NUWyueC+EIWoHIUas/AgJJ2712HR87kxN3wvZRsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+4ojjIp; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+4ojjIp"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so644281f8f.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784833309; x=1785438109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=o+4ojjIpHiv9VwF2RZql45lORwVH1nS/DmPRwxjhWa+8UP9XdvRnm5neHqlDOMh+h0
         h1dAQh3HryrR0o0+mG5wnRZVKevJcePL/ndVuhYQ3LS+LY/YBeHFuvvBHVt827PWsWOV
         ABoj4zjMcMqY32vBzUAafvKQTar7YbnDXDfea3tWfdngM0Fy2Xn8toFHIFYiUUioq21B
         5ABNeIo1zLlwoBz+8AQclvNU9rED0B2DnakHBvwqGiigvuXb0hiQD1vrk2x157VSv5vV
         hMOgje1Y1KdkNJPu2vB2B6ctCQx+1v6IMHGZ3Ddh7Nq+YWuhRSnqQPQ8ISKdcNf6VLUy
         VLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784833309; x=1785438109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=k5fqgAeZXEvTzWVosOCersTC/+aa3/3fHqkL8dsKf/1dbDAwXPBi8JYR3sMDECStUn
         suuihshCTFbZUGZZ7aT0jeYiX7WiroF+V3DVKxhYht7/PrryvAfn7jUnZXzYgg9aq4vN
         ItF4VF7Y7CqYENyNqWE3dJL7g0bmRImrB7YHs9Y4ua0HqEftwqne+xrvpqkpNaljhn9W
         QeSKNIgpPFtPFrzLrfiXefr7qLCezBI9G09m8uUFU1p1kaJdfT6XF91zc+8fLoFTaGZ6
         eZwmnMq8w7/nhlBqgpSzTmHnUi6fURVlSnrEUTCLqEc7J5b9qOfTUF5+itBI9Rt898yJ
         HUww==
X-Forwarded-Encrypted: i=1; AHgh+RrA8VZiO/n/fMdLgrMEY6Xjctl14RifrOv8GgK7GjUY57lPdtsD6sunW2yMx/5T46QOuJM9Nc7fPGUl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Ey3IBNL2mJDHF+ULHDxdjUwZAdnGG4ACPAgXFo/5VtiW5937
	vl6UAbeYU6E9hzCxTkpuy7qmmck22FLhliIRZwjvt+0npJudsiQYzoYx
X-Gm-Gg: AR+sD13JM02CVehw4vgFa2Gn4aEetyfnZlHrgHA4c+sDrmezsR4WV5bMEpVECjXihb2
	syNufQNSARkXM187QPt1z3NcCsUUmeozEROSvi5+oxgSraNLbZWtl1VhtU3VihYTrJUw1Jx6c20
	63kIWdyPg6jlL6vlFVYq9noNKxSxtkBcGkjaqdMUlPE3OkOiLwx4GAv8qGsc26wm5pqag5cg8bL
	o/BAHuo9YlLEUs0bRMIWmhaJYyKcgH+oSnxmecmpID5axMveLr7YyMeCBGfIu2wiGlvyRHmif+H
	z3I/8FNVpkbvFO7uvuXE5TjzWp7AdZFsP4renfx36uDsmy1GnmW36yNXpQPCHl/1usrJNvlwp3B
	4f6V3CsrybHZrRk+PE/rDas6xtDXsGIJ3rUotJHJU2WgEgg5WygHYmksZnDhlcqy9DFe0BLRHjJ
	JXdnaiuvWWtWC7ZCT1on8pWvM+S90/URNfhtRafT5kIfPbOSMj3kHVCBMYbaFDar+I+ibX/Ah/P
	C0=
X-Received: by 2002:a05:6000:178d:b0:47f:7005:2893 with SMTP id ffacd0b85a97d-47f8da5ad3dmr5571990f8f.58.1784833309413;
        Thu, 23 Jul 2026 12:01:49 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm16912197f8f.5.2026.07.23.12.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:01:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Thu, 23 Jul 2026 21:01:30 +0200
Message-ID: <20260723190133.22577-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
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

