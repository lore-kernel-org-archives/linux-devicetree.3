Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397C84192EE
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009689; cv=none; b=YFzcsCtA710Rb0cvXe0ck6JPxVf/Rw7PpN5E8mPg733iUU+hLdF7U1+Up6P1pHVgSzBMg+ZzJBbafKKi6MBq8csniINv+pLuOHyplkJnSAiNE6RD7mm4y0gdJ+At+0AXZdOZvb82xcdcssoc/u7xTK9t+vmsOaVdmioMjN8CSCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009689; c=relaxed/simple;
	bh=QWHKMECdkDgTHMEhYoueuEWaT+qT7FqBN2oGC03gpKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PynAaZLMKnCRqWqaQmV06CT0lspuXDt8UpjujATCi1Bqo4FXCmdSdt3SEKS61je3yHEaPJl6OtcMf/d2oaGUn5WvUXhTl+nKejDqcKWXXVusc1sDpaHwfhxZkWqdOi66Ij3GWKlqgrX5YPd5WjUEU6+7dckhugUl+muy8KHjGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVulrFFe; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVulrFFe"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso38885005e9.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009685; x=1781614485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qu7loVp/RhhbK5pFGzQisJHK7vzMUicuCCUYX824N9E=;
        b=NVulrFFeZuaYN0nM9hekFSYfJTPreCaWPvuMFH8X+Hv4l0LNUbrnIlu6/7ybM49Neh
         IRTvPhm/s6l/9EKuGn6TBarmeeSwtQTHM3OdezqCnHI3o30QoMzWC/iHWeKf1hbdqpxE
         HMIzkEaOnWSr9Xo1wqgpmK309vnT4HE+fL3ybPVy8l6hYLIW0wBrLTCXInZTuIwgPUt2
         dkl8OuBlD+SW8IRmjUJWKVjmRQwxw1omuyxLoTcN8NsmLUZVf8glzQfUewjlI5XxxuaQ
         l5GxayXhT93/U+coACh5eROyzp2aUGSMleK+S/X3T0/MyhXz9HYhZSpnotVegKa6+fOe
         AKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009685; x=1781614485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qu7loVp/RhhbK5pFGzQisJHK7vzMUicuCCUYX824N9E=;
        b=WsceebJUIPBwTlsitOQgxGWDtR1xTWlt0KoB94bV0GmEUC0V1dh8EaOKBdFCGdxvgS
         XXxn+kTMLMzhMWPj+lGZwsa664lmuunLVq3MkeAN2ljKFAwptTBqwIfnki2/rhJrb5LW
         fplpCfb5ZhcGRc4EBx8ihV3aj+PLOFkRhRwy5Vhc6L/Mnd4MyhZxkpmZAgGb57XJS4hd
         1MWnsjmMoNfVdkkFyJG0Izcycm34hlWg6d6HgjRwz4K7ICfQR8eUGKfxVMIfWRt3Bvr3
         VzqGBLy0ydaKqV2bk19UDe0p+lP19QnW+/co53T18uFgCArRLZzX6bFXVYqdsOvBODOO
         hF/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/bmSXi7Snx1cNXkOdF4Kpe5f8zmDpwMCXWOpn6BY+KKGJFDrgEr8CMfQcNLhpqlYXExauC1Xmo+ViX@vger.kernel.org
X-Gm-Message-State: AOJu0YztxyQqXLtSxwOdrcFFFrO7PWgPLodhHC9/vCG2tOl+oB7aCVUX
	39HWuCuTfijREYVY/3Tmu0e/Nv8JRH2AX5oPi3OgbsbkaoZoXiSh12AfVjAm+Zon
X-Gm-Gg: Acq92OGjHJYL80xD/Jw5kHgwDnZrnL+T0tSzcXHxAheHJNYVfQURsV807d+AIdFFia7
	x7bkoM8SGib2M2nLWXCwiMrjYckgoHysLlijqRS0ZjMp5WhGvdwCp8t/7S8YNR/mmC9LIkrKKBD
	GBMZEKGHLPPijm7RWCwvRSZ1wQYJcqIMes4CCWzi8qsZjGWXw86etQ9zfT30/2t40qFjMbJqH7v
	AFjs+6v6mGD6/AGqHptoeZHy+xeDAOlSpbqoKuYv2HPaLGlV4hYGC897leSugquSB2u9dmfWEeq
	p5GWDVWP1W/YWY+A0uRQ4sdvBlOBh+cLGPMmzfe47yrF27H1v+wKYVzUZ9z1sLeak4BcMuyfiFR
	0VwfjqVwgVRVrUrnWWs7vsnp2rawHvO6OUWp0Vgu4CzBU5UuAFxbRiRrVbgHy1V7k6DuW2e6/kb
	In6YNgvt9099OZmgj4LQQZ1o/UOXixVagFtfXxwVEc0ZJ2QseSR26MW+xnWHIRkcAwJJLcuqTmf
	eh4anASQaX2zXXZx2cGBUrbrd+vSf7kyNO4ZlwHNVtszQdQL5ktuoGLVA==
X-Received: by 2002:a05:600c:1c20:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-490c259eaccmr310171145e9.10.1781009685453;
        Tue, 09 Jun 2026 05:54:45 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm435968425e9.3.2026.06.09.05.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:54:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/5] arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
Date: Tue,  9 Jun 2026 13:53:51 +0100
Message-ID: <20260609125353.401124-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add VSPD and FCPVD nodes to RZ/N2H SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index e8d4f76949cc..174f683fa68d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1379,6 +1379,28 @@ sdhi1_vqmmc: vqmmc-regulator {
 				status = "disabled";
 			};
 		};
+
+		fcpvd: fcp@920d0000 {
+			compatible = "renesas,r9a09g087-fcpvd", "renesas,fcpv";
+			reg = <0 0x920d0000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+		};
+
+		vspd: vsp@920e0000 {
+			compatible = "renesas,r9a09g087-vsp2", "renesas,r9a07g044-vsp2";
+			reg = <0 0x920e0000 0 0x8000>;
+			interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.54.0

