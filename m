Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A114D2EDE
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 19:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527157; cv=none; b=YPDv2ALZ6Qp0llKvvE0aDT6dAVRPJqOjJYJ2dS0TcbQvv5zgqBDXI+xtJaW/t2HhF0YqSqfplYGiKwT5MgoEfX00PKZyi7FKObGjOttRIKbltDcWLMWiobZgOiug/8bhZwIb0S1a0gWsKpkJv1cwy5t9ueo+OcI1/RiKjS6vNlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527157; c=relaxed/simple;
	bh=bRtHKL8Ghq1igkZvpCdDlmBm9XyVW19EMHHP+BJzPeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CC2mtUQ1Ml5H+p7vgf9NZg3Bsq8LavwMHYs8f381ocDRLYmYqe2cQmMNothrncdzYLcxcntp0TMQZyCyZAVv7SRe5GKGcuCvb5foVUCC49/ALoF2gEnpmfYgeP4socKGhzZeV5f4vX4iiYkDMEndpwzScjowt/95XlWMVbKEVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXG32A/X; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXG32A/X"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso15415315e9.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778527154; x=1779131954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POtlnulhl/F66NG/qN2X+H18Iihe7TwpdtVefEviDCE=;
        b=YXG32A/XZZ+8zSJWbfvSNysUE+YaEWVKjg4+GAc9udh5cmrHpZxFqesh2VXJ0bDvu1
         28LBjfkkZWhmsadbLmy5o48MglU2iHL6dnIYKkHZE8msCv3xuGSqj2fF4lyLCjCniAuw
         flvGlo/wuNsuzT6o0Z489bgskYG3ii/j49LV6R/cXgB3UT8wSAH30L+Wn4VKOTEmFT3L
         gYC7cgk9Fm8b/PHO+7dHLMghVhdKSP4W8PwOSKUWFiUpUBLzeh8SFuqG2BBQ2XWpF/tF
         lt3XLWPr1jQoYdaCsNRuxDc83nwKbc9vhMJxu06epaDQ9XV0WmV67nZsr1bHLF/WFmt3
         wznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778527154; x=1779131954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=POtlnulhl/F66NG/qN2X+H18Iihe7TwpdtVefEviDCE=;
        b=gMeElfqqovDKuQ6T6zkoShFtbIIFAA9xiGE78LO8kySCvp0owf4ocxQffop4OTZkFF
         9GXxPIUhOF8D1LPYIe/WwRR/FwkGpfGPZ/zuXfrFSM8fVf4a+CHTsRSUQFfXRa4AyX7+
         v+msYuoH15qT/HKCL8zM720pgawmO1UL/mrqGPwuvIDQ9lmBiV3JpIUYL1oGz0l0qg5f
         dbTGfxRFtmDLhbdzznQkZ5KTvo5FaXJSQh7xpPhisf8BGkGP4cKxNf49kLS6/KLHYv+W
         Qp3nrOCVoRVNofyu+gxHfDNy+au7Nc8OnsbyIKFfnBbZigDn1u9L2ggIYtEa0/CKirJ2
         YKkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZoQQ2gXTOWqUCz+RUJUwAK+7jhD3y2PNhE4j/QoZde18j74lQbwkUGvyvg8cO6sJ7wHLbT/2BJIBr@vger.kernel.org
X-Gm-Message-State: AOJu0YztES3AOKejwXVie9LrSOWlsWyp6nZr/QmPhQj20QqYKcWfd4wh
	PMJ/QHwNe/VIOCaLRdXnj1Y3xFLJdoywZPqDzokV2kJLoJBc41WEjVJd
X-Gm-Gg: Acq92OHs3sm+5+erZjStsI5Fyu1ErbViR9paqzBpHB5cfo+ealYoB+NYEwL79FqNAkM
	eLL0zIaM8wzfebIyyG6BaO3lnw2g30jnAx8GIGY/S1l8a7hfigBu3PFjsqGgWropEXZLZGh0GiI
	/fBP0iz0QZ7JJrDoGuucJSulaFwzRz7xnykWHI4MW3fGm60hBNxkBSu7ijyOnDaV2TtfTKGFl+l
	xX+Abr2NsOCeOAIhW/yG9QUs4+cSXXf8V3ESIRftJ6UCQ7+8DILF2Wz0q6loXbSAzFPC4/HnR72
	m9oOdZYidhLahExqaSFBADPT4SPF7GjJz/m58Qjkkgu1cJLgpwoAxVPqDCraYG+JVkIZ8TxjxLl
	RnlCneVcycFhWD71AMWuLkG6wG+YmNeRNQZOGJ1qj/U0nSzILQ1V05MITX59cXNMnDN/cFES4vv
	PFfKnQHeEdFbxCEgBpkUvSoSdwv33BCWsiicWlegqaL4JA8tK4u1mDuZBsH5+9Opk4gD9bRoP9U
	fuitous8WjMXbO6W5gruprN5ETb5za+/X+aVA==
X-Received: by 2002:a05:600c:1797:b0:48d:366:b962 with SMTP id 5b1f17b1804b1-48e51e0a8a8mr217354635e9.6.1778527154318;
        Mon, 11 May 2026 12:19:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7e45ff89sm150350725e9.8.2026.05.11.12.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:19:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
Date: Mon, 11 May 2026 20:19:09 +0100
Message-ID: <20260511191910.1945705-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
operating clock for LCDC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index c4863e444458..f6cb8d649a46 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G077_XSPI_CLK0		22
 #define R9A09G077_XSPI_CLK1		23
 #define R9A09G077_PCLKCAN		24
+#define R9A09G077_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 0d53f1e65077..312e563b322e 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G087_XSPI_CLK0		22
 #define R9A09G087_XSPI_CLK1		23
 #define R9A09G087_PCLKCAN		24
+#define R9A09G087_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.54.0

