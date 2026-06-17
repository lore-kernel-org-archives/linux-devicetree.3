Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FBA4219F7
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703146; cv=none; b=uYdI0BZ8XDkY9KuqV+SNqPqLYCHXjvpv9UGnnQcOLhdgq4onWDT/SJ6Ii2Uhn60lu3NWUPbPkw9MyFOpJ3Zx46bLTBdp8C3rX4Q4J7wAAictgXtDh6XE27MmoxkJ58lXsZ453rq7E+wRKWMmLwLqwVm2ACVjfnCls0FOy7vS4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703146; c=relaxed/simple;
	bh=4L59kWPU2GTK4BDITFqFCB5wF5Pp+LPTRabGv6hHYj8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G8/tRJfefN3c8/PJeT+Y7tN442QgrvXQgGVDeGT21gUPIxTdsXGNoW7h0wP1P0mf7BQpTES3WXLhJVacJ+rsQ6hhxUgFMPEqCXjVgygCReDx8fU3+h86xKe02qrHCFMJoQ89C3Z6NLuk/2sj0K+/f98ezaYfveuk/8qDOkms5fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBnqVoU/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBnqVoU/"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4629d80fa08so735741f8f.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781703144; x=1782307944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVsayAMQyYoUASQDp6CaRR3SeM73nxQGt/zbkOc5q+o=;
        b=dBnqVoU/P53L8FYpKLygkv95m76LRMwkcYh6T/p/DVLlmNwcW/qQAhywPIHySwV48y
         e8lkWDaZmfcwv+Dgc/bCPCHBv5YAQ1Tdq8EwygGmxRey9SRxEA3zXg1i8imTX4kmtFwY
         QYTLWn/zdyQKU4rS3jRS8raNY4b60g82jBGQLNpAk/sjwjesDzXOLfySRPQAv18eEBrH
         P4nwtEL50r23TwUqUxpFA/vSecOg8Er0sL3PwZjylbFL0TqRMxKVUt8TdKjxzfTEAHWK
         +1sqALYMhp4JTQ4gKiQE43mxzJR7/GJmbXYMGE5xF+/H4g+kjpD8dvrUi012ZyDBWBQA
         P6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781703144; x=1782307944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVsayAMQyYoUASQDp6CaRR3SeM73nxQGt/zbkOc5q+o=;
        b=URJxQ3pObt4sxgaGiCF8M0oGs3ghpyPuaWfWPbU/Nbuq5G/C2G744kx1on8zsbn6x5
         cRqfu/Ns91Ds5DOddfuDK+VUHMGKfDQ45L1EQSNiejCCX9ouiVnaIAN1n1n22cj7U17S
         cGOfrXQQ8dxHNxEqZcnMgvjc860Oq8LEP+ULvaA08LBJZcy8EuqBIsuc0rxMJPacPYbz
         6h1Rcv99Upf3dxJ8/Qb7vE6PviLTmXEEfRy+sphEb69Go23IqdJzI+cXYVs3H68FzC75
         vwewvxHzKul6Akh1qBK3qF7InnapvCHut8mUKOwkFaurZkoNXAlL480o6rnsni31ZO5C
         0UNQ==
X-Forwarded-Encrypted: i=1; AFNElJ838P4a9xGaDMWGdNnmgptIGm5o/OczwoZT+RbwDjVz5ADwMjvqps/LPYxqJzdof6h5pse4nE7H9Can@vger.kernel.org
X-Gm-Message-State: AOJu0YzfbLrl43009JRGsfvA3mUYlL8jtuwH5aVTyWZRvggxDGncdoJ8
	pgyOKlYA45vQE5OpYKGjNlK+7mYYybxVOwW7oKoTpbZwXJNd4VccQ2OF
X-Gm-Gg: Acq92OH1aFl4fSmo3cHFoLEs4eIVPpVkzM6/SmizLw2bNTRPlccoLDlxjRji1sNnDBp
	DDVPMoivJRq4LpGvc5ivu4Xhy8z5vo/tCcIM+pfXgpeRuf3GVYqwSzZD4UJB4S4LMNHzvW6AaVI
	hFCZJNSb5swlQLZm6l2joejyITKp+cwCB0Edia1UmZcp3SBm+KnnV/LGEzeRBK2fOnZBrw/xS12
	TyO76AIlfo+n+a5dshdYQmYAKSNo+nA4gZzyAiWuMHAmvQk5NlovJhTTUje+lI6Zjuj/Ykan9c3
	CchF1/8xUpaRqgX8f1TiIAUu6U1QnG/LJsMSXKJj8YJevax67YZoSd3XTejP0rmTv8hTI9vGyeC
	vxnWJE/6c8pj1Me2D+K3VJtfL5tr3Am/QPBT4EwpKOYifHY0Oz30vq3tqIHrvDCHfmQt/x6SYX4
	XYp02zr0l0Mc7LAJlBcs1Xmpk=
X-Received: by 2002:a05:600c:8287:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-492333d785dmr70645425e9.25.1781703143318;
        Wed, 17 Jun 2026 06:32:23 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a0e9e4sm147795145e9.0.2026.06.17.06.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:32:22 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v6 2/4] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Wed, 17 Jun 2026 16:32:10 +0300
Message-Id: <20260617133212.287768-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260617133212.287768-1-tmaimon77@gmail.com>
References: <20260617133212.287768-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the timer0 and PECI nodes so the APB children are ordered by
ascending unit address.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 9e4fa2669f4d..0e5feabf2d71 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -59,15 +59,6 @@ apb {
 			ranges = <0x0 0x0 0xf0000000 0x00300000>,
 				<0xfff00000 0x0 0xfff00000 0x00016000>;
 
-			peci: peci-controller@100000 {
-				compatible = "nuvoton,npcm845-peci";
-				reg = <0x100000 0x1000>;
-				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk NPCM8XX_CLK_APB3>;
-				cmd-timeout-ms = <1000>;
-				status = "disabled";
-			};
-
 			timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
@@ -138,6 +129,13 @@ serial6: serial@6000 {
 				status = "disabled";
 			};
 
+			timer0: timer@8000 {
+				compatible = "nuvoton,npcm845-timer";
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x8000 0x1C>;
+				clocks = <&refclk>;
+			};
+
 			watchdog0: watchdog@801c {
 				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -161,6 +159,15 @@ watchdog2: watchdog@a01c {
 				status = "disabled";
 				clocks = <&refclk>;
 			};
+
+			peci: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.34.1

