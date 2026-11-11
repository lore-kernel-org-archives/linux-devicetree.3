Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434262;
	b=uXa7YuXrNRybLwShhMZDoJXZVwRmuiAc89asr1s7uP5xcKDGu798T53TCQzgOG+2r/vM
	 Kj3m9W2CUOW+rb21Gn5hQ/ZxnCi/gzl1gC0IMP4STTE/OEmttN1NKfUcH2aiXT/JbH9ca
	 yCaenhOA5voosSKMYQMo2y3w47bLocJIGj3i6FdSiyu92bTlJQAlwwltUaXuWqZxjR05h
	 rMM93VHPZJZ+gDNx83bhrIRwI5hIwDKI//aJCdRvII8qN8DAKvtaZMbRi//7erjeidvdm
	 K0UaoZHn4KDA5UVbSyZcGoSclNEB/ZTDrRBnyWZpWYUZRLZvBBxyCFt0YlxPA8Bw1Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0SxbXbiAkUu/9xk8uRLM8Bu8VTt+3N8T+dREW501N3Q=;
	b=WcQZQ/GpA9eVVogKT/W0Scs1Un6ejhgbqNwoKnD4ivK6oe3ysvcYtFP3qZpdGS+XKZx7
	 PCekRPYIh32w/uR0TWzAQxIXrmcxAHWbAGK3aVHlSjigDpYyhVR6iklRXd6SSxABBhAoh
	 fU3kgy5/4u6nGrxV5CZP4PnmRp5jVKo6ekrDAzM7AJX+h+mOn8B79hrxIRvA4NIGIFr5d
	 oO421BlilV9RV5WyarjPWhk62VZlHqWpcA0vDpweeIGm1pgrob6GlRIckaXI/IRdoLEHu
	 283qZBF/OZuTFlAlE2TtIb691Zt4wkvyePWI2YYfwmUBDE8LJLZA43NwSSQZ4TheWMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zye+u06M;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5ED606A8BE
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 21:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5ED606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zye+u06M
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1842772a91.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434262; x=1795039062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SxbXbiAkUu/9xk8uRLM8Bu8VTt+3N8T+dREW501N3Q=;
        b=Zye+u06MWPnI/iZ9Dvf8g7kNiCqjl8bBx5B9PgvrMRhL965Tb+ZA81cHu7ySSpTHRa
         /vN7WyNneVWe4nb2axIJEbaOE6JLWqKdt45FQOi3j/WT05ZlAD6eRIlxPX6IykdQ2zCT
         XZmXrCggIgVSQMRZj0XpsYTP00aFNq7A0fFaoSId9V+rqnk2Z+nrQPr7eI2GaaYS4kXv
         WRnUdG/+96JvWJeH50HjrK/XOZGRBlVPPhGuFmmaMEx+euYJcFBH8WQ+Zk96dGKEo7ic
         3OjUsz57osZ3fPVTvVjlcRDn3I1xf4TIQ+5RVhrcast4d/9TUdXu5B4T7DCeTssuRBYG
         I4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434262; x=1795039062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SxbXbiAkUu/9xk8uRLM8Bu8VTt+3N8T+dREW501N3Q=;
        b=1zzLB7iPrWNW+mQvjinO35rOQeBhmjKkIt2xlvRjdL2J+kVCYWQ7MDHNpagcqGyJc8
         8Twk6KeaNn/znmaRege/YpV12PJK8ZNmQ8eoayPbDJW0chEWTz6yMoSr48wnDJBMKzpz
         mawoafwI42ycPDS1Hqzr2kc+5KGvAzMKK7bw9FyH8gGZIqk7ShbMB9AIsRQF3h3uoLWG
         F7lm/X+vp14MuXlra/0dTK89BjubWTF1ypuKfSy240skyA1aj/UDa8bWFtmIKKdL/ZoC
         7eNr88cMRLliMwKkcn679wQyIyr+sEnjjpplUsGWtMHqsH2/7TgcS4XmHzCOOmAdciw9
         +FsA==
X-Forwarded-Encrypted: i=1; AL+hErFEPxmpLA9JUU8kiBf1bV6WJe7K0JOEFU4kOsCq4IOhw95745CTaCG49M+DotS1+TMmPyYOj5JoOH7B@vger.kernel.org
X-Gm-Message-State: APuU4Z9X7rq1HD4XHSBaUxzsfwPbJUoHVk+PQ/6ddaFp9mzz7qSEiFrD
	dVmNkIMtNiV3XMWUWBCdlhephGhHSNJlNwqJh8dx1Cst8sE83HwK3Pgz
X-Gm-Gg: AYBFou2gWtH+tV1gf3UigCOcjfivnXEw1peI3ja7AKB6HViKR3a3/VY+ZYIFbalf5Fg
	6Gga3VrhQzX04zMASBfWDy8CffjEQ8ZlYeUvVbZXbIu7woeXTmQ17X8ekn1YV+4ISTo6JuXBNNS
	r1M6EFHHcr1ZVXyPikzBnJhB/9Zzff0VTjNCjgqnznQWYSGuSo6VK3m4t8KiKtx0vtVvksNuVK/
	+2I5FNNVFV2CN4tDEKIdtNmk6L3bjilQJL/igVnUOU30Aid6Grwq7nPUYgvaAVTq+R3CRyA+eWY
	YFhbG0B/PqQX0kXI/1BSL6fG5aFTeklHqgSz19TDbasKVCJ2CVmP3FL7PbOxbODzRdbx+Bh3p5e
	LJU1tGPvDSUWdz24U6aSh0INMrqNusZsdHXDKdX4vtO4WsxMekAcOb/qXsuGWNShyjK8s07DqOg
	XM9r0O/mRpY0HD91P7MEv8yoFUmZ6Aem3FBNZ82ZXsI9N90RCyhNwiPRV/EjlV9ebffed3wGRQb
	OIdf+8a3gpeCUwB+yJyYae1od36Gr0WIHbv5VjY+DLSSLVZa8MUUe1Rpy2bpsr9njWlJr3E+dYF
	EHsiysNYrdS/uMwe7pOl8XYy5ESATVAApK3bNH9YtHdEkh2EA3Gzhj6pbLgY7tUSUuMZpbTFbSQ
	HSJGFMipvaQ9+Aj0q1Wwf9yZ/nEFBiRN+Y6ycp3fbnq4Fa5iFnruh4BhLfD4VPCijyuvZagRUM5
	wazA==
X-Received: by 2002:a17:90b:2649:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3b182f2381fmr3592513a91.44.1794434261873;
        Wed, 11 Nov 2026 13:57:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:41 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/7] MIPS: ath79: stop using ATH79_CLK_END
Date: Wed, 11 Nov 2026 13:57:25 -0800
Message-ID: <20261111215729.10683-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111215729.10683-1-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
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

ATH79_CLK_END counts the clocks in the dt-bindings header, which means
it has to change whenever a clock is added, but it is not part of the
ABI. Size the clock table from the IDs that the clock code uses
instead, so the define can be dropped from the header.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 6a8bef782186..55d8ef8c1c8c 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -25,13 +25,15 @@
 #include <asm/mach-ath79/ar71xx_regs.h>
 #include "common.h"
 
-static struct clk *clks[ATH79_CLK_END];
+#define ATH79_CLK_NUM	(ATH79_CLK_MDIO + 1)
+
+static struct clk *clks[ATH79_CLK_NUM];
 static struct clk_onecell_data clk_data = {
 	.clks = clks,
 	.clk_num = ARRAY_SIZE(clks),
 };
 
-static const char * const clk_names[ATH79_CLK_END] = {
+static const char * const clk_names[ATH79_CLK_NUM] = {
 	[ATH79_CLK_CPU] = "cpu",
 	[ATH79_CLK_DDR] = "ddr",
 	[ATH79_CLK_AHB] = "ahb",
-- 
2.56.0

