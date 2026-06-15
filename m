Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A473F4DC6
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534404; cv=none; b=hpuOUbzPyfEjKNwWh8vpo7UBsUZqYcYGxnE1XMKcVx5GKsILLj6/T9MrgzQhnnhW9CSsPzwF5zsIBqigzhwXG2N5RdjwojnIS5xV1UpBs3pTHpljOF1bQZqr7yyv3Rl2CJXNRJfJJ34EHJY6rX2sT1IofW4XXfAN2Jx+ImsQazQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534404; c=relaxed/simple;
	bh=RPYCKUoaLHx21mEpdL26fmX9w4xAgCZxloQUVPzEaaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lb9bbzLBKYlQStb5kJi6S+SFVbiwaiTFs5VUMar7egNBdjrmnWTQrbMGmM9WLvlGBF/H9rpf+nuW19HTLJScGVDUBEk/w6svvoHMyMfE/gaHXrdFQx84VH+3yCVk4cywdvQyJYX0JjdQyq5miCG0adanRkycKoXT8o2v+j+mKSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNHajxpP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNHajxpP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so23050905e9.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781534402; x=1782139202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eOE2cW5CuMlltMnNIAtALpjm3kz28XwuEUz1GGDmxQ=;
        b=RNHajxpP9OT7RBWJDkxfPGRnH+aeTYtSjVibR6AwR53qdyiQ8zL4Ln52zpVJhnrbRI
         KiXZAQwS3ilMZdcvEoqYwNjqPwu2+vvcl5jeLM3Gc4D1zBTZpwh0H+BqSvPYmexdNNsj
         bXiGLzzp6pKyZmibSBUp6O3f//it++Y9+nMopopQ3JovHfAxa+RqYU7KVhL4pi4LPdn4
         pkCX+Zd/huVLT23nw5NiwUxItqGT6pVYYe7D8O20vfmzBRvUtvZ3WKKOJsihJSVS1Z6S
         3N/xLpaunucSJdNvlgbBepeTtPcBqiBQ9BcQ5UTta7loOiOOzykCXdtykMawQK21cdEJ
         Z1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534402; x=1782139202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4eOE2cW5CuMlltMnNIAtALpjm3kz28XwuEUz1GGDmxQ=;
        b=phErxtCcHS6Z6ZGpAuiF79sFaUnk9goqyNca/+jH0tMK5e1MpJc8nE4JFQykBTquxT
         SAIRPNhTQqte2Hui6S8eYnoIFzM/iPA3JO3kLIq3B41ha8FctyOrkE+hHMPTjiZK/XvQ
         EhdqYPJHoA8BMaLUKzRHwRcWWvXYJ/Ah/Su8ydyGGviv7ieqYMtUjJlnb435wnm1acsJ
         qFk04hFJJ6abMfokxHNVUzNXjmRBlr+1VNsCz9UXnkOOFp1e5SmeTSLTNsC7QzWACw9V
         l5E2uGkqdXyPu8tHVMaBHFLLwMKBSM13GivHpnoNuqww9V8126Q+xFQLP5QsFpPWLBdt
         7Lrg==
X-Forwarded-Encrypted: i=1; AFNElJ+uBJL/B5EYEppXy9xA8Z3fVIEDPBO4siMPm9kn+DWEIJMaOoB3SHEtC53L/CDv0VMKR7szP6d5uBgU@vger.kernel.org
X-Gm-Message-State: AOJu0YyqLEb59flvfWqfeZHIyYs8fCirxZDRa5BNMXPMWxvVFxS86kdV
	ZxVm/45WYIvqboTFue9r4i3CC4YorrcSHB3/XmKx9u2MZYug7MX/QaeU
X-Gm-Gg: Acq92OFkGE58yh6VSCGSwNOQxLeSCgLK+paJNh09i0xpuqBAMYsNp1h1YWHeOKNsuEb
	7CxYkMr7IomCkVOxCXvPupXqb1AWjf103q90QOaT0eKvMZClU4ZpAcOo0LZKOWVY6xsHXuBh4xS
	OM0DM4I3KwvM9huqnLB1YIURf5KaCPmKv3ourh85SvuCGMVTtA7HPeDpnsr6Te93lxMenZW6C/Q
	D2Y78KQIFY0J92y7iOk2FT9C7llAGFN6kFRe5SkZeQPrn9baPNguboAKxr/dmD2NEWdeg89zlaN
	uoJk+d/dXWAD6hS3q6nhi/4UOR5lJZ2/eNkJocLu76DLtIp0PcVO0veTOz0FLU9078KdFgODbVZ
	9WOjXtdk1HkxqwW2Nf6mq9sKQKTZYcd+atY7HwXhBxDTzq5J9pvI7ZguGyhUCk+I3ASKvWNWNEx
	DgYEHTigwTPyH+dM0Sh1sjEbRNbhXXvLNCOV5IVkGnoZqcC6s0aM7M1XyqB7/FdT4BFkW/o8w9W
	B0RcO8vAZSSOla7qjITSVTojcjLXgS/FU9ftZHBVhMkzEU=
X-Received: by 2002:a05:600c:4709:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-4922007472cmr139483105e9.11.1781534401612;
        Mon, 15 Jun 2026 07:40:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c05ebsm256627915e9.9.2026.06.15.07.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:40:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC clock ID
Date: Mon, 15 Jun 2026 15:39:42 +0100
Message-ID: <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the peripheral clock ID definition for the Real-Time Clock (PCLKRTC)
on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.

Note that the LCDC_CLKD clock is utilized as the operating clock source
for the RTC IP.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index f6cb8d649a46..aa47685f329a 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -35,5 +35,6 @@
 #define R9A09G077_XSPI_CLK1		23
 #define R9A09G077_PCLKCAN		24
 #define R9A09G077_LCDC_CLKD		25
+#define R9A09G077_PCLKRTC		26
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 312e563b322e..1c73d0dcef18 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -35,5 +35,6 @@
 #define R9A09G087_XSPI_CLK1		23
 #define R9A09G087_PCLKCAN		24
 #define R9A09G087_LCDC_CLKD		25
+#define R9A09G087_PCLKRTC		26
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.54.0

