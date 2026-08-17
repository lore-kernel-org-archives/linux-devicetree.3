Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFA54399C4
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786994768; cv=none; b=t4rli4RDAZBKR3Fkqn03egB3zhbGx1jqTySi8l6TvDZooEKYzOjoEPh+wH5hs+hJ2tmYAALAS39YQqIypnNr4YCsGO98FKuaMJ55hHqZ6F+qmj5JvRgm9Ka2RUDBfZZ/xrCwSjV23b+3jMdYH01NDznkAOG8fB8isr3uVKJBiN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786994768; c=relaxed/simple;
	bh=m1g97T0KsI8+u2/mma+fo4wXtJYWPRQtDXxF8ylWrvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mY2OqzHlSG7yw8cKknSZ57cDx1cbYg4tOxOAVnKSqNAFof1nsNcFhULPxie1KTUCHAvMrF/eOhN5hJtkCpkSHEHQsZzAtZjOnkZiqcOQOFRKCj5lNYsRaN0ZNkhIYsjFmoHQjIBa6M2q9NWmGKXXORRDzCONkVs/2Yu3EESa5PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeMWyMG9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeMWyMG9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cedda2ce6fso24929765ad.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786994767; x=1787599567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdPzWqXXmK+PEpzF2FUddkIJQuQSykw2wIqGTSDwjWo=;
        b=EeMWyMG9qF51p6EmfCbpgubzHrya4dCICsQnjkkRIo1Kt+JKPRxAc9zMBvinEpuJDX
         V1zhLHy8d753KgT5aeNTqEeCnfRMu4FYvS8GY7kTM53Q133uC/dU7TFvGgxA5kKe7zxT
         czg1Uae0GMu8wrS4qEywCy4KP72BfybPbBQRqVoq6rJ7ypupJZnpUAEe/JxpLNprEl8D
         wX8dmAmWBa9fuFBjzW8r5AJtP+MAA9WawcIEI98HARJ9liwK0H8spcCK4qQuEkIpj7Cy
         gQG+LARzlXL5c4ECUvH0VNO6bi4yd7KzLAQQbQ+8tFowpH1s7G3D4/B5ovG5O9BFCnV+
         UQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786994767; x=1787599567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdPzWqXXmK+PEpzF2FUddkIJQuQSykw2wIqGTSDwjWo=;
        b=rRM+6rvsQLnEgLvKgj4qKUVsDKQCOLLk2KVya7X41ZY646cpQSIeFaQj6sWCrwh5ob
         7p/yYW7roojJ6q86v88QxxMzHJu9IUZcdK7ijHrFFG5KJLGDMJDsY9iZsnsEA35F9I71
         UFtp2uT0wMUMhdIWY9JrcX/KMFMYBYbvB9wqG3q12TyDYRqtb1WLOeKwT0Ie9es+e0aP
         tI8vJ9qs6GtTJmPIQ981q3jVSQ/cB7YXFqM4VOOsKcAxCJlXsBHCbGMecosLOW4oiQHu
         MnRBuPuLAhkNVxGnR3sJm9MFT088l3jX1tFdxqLR+ONgySgvxhiFZkdS1UiTygI+Ldnh
         hQjw==
X-Forwarded-Encrypted: i=1; AHgh+RoH8H5k2BnE0MSJG0G0b36hF2oMvyvDi/bU0s+ajCTqmspuqu0cbU96DYwBH0/NUXCeH+dCwQgyZy1y@vger.kernel.org
X-Gm-Message-State: AOJu0YwEGn75lT0G3SO7Z09bwtkz39r7cst99vpqmrL5dBcNooWL01h+
	Xeyna5U0M1nYL05OKAoWrj3ydyVqTx4SEtmVq6+UcewTVwV1AVGat0xE
X-Gm-Gg: AR+sD11b1Aapz0dLT0DD7mXPjLZBaK6Og/EXN3KEngBBFPeBDJUDqDB1X2bZuOTl3OJ
	cthSwS8XDMsvINNb9WXFLUdFgFlU2HNwrtXQAee7Zq3iqOmOb5sSqc8JTTWQJ4Ns9wxpuIzNM1M
	06i7VC++YJsRzZmpKW47fRyTBSSgwvEHhOYG9z6sboCLurTZpwX3rJUnHX91S1zd2TlRsT66WAs
	/2zE4oTdUJpRpUgDiRRWEcleJO1s6a4Q6OKYwUXNfQcmLf6uF2WRoaG9r9L+EKpxvMfqmHgJ5y0
	k/DGtS8G6FnpOsBE6tbKJvTwkro5Bn/1CH4eX2EebVK5VV8N8GZT6qMXaGFJbxKxlHZqXeSWuau
	iwS6XMcWK4dOeTK9kDeJjLIXfkQRPbtWa3Tok+uVBZAyf4MU+o8b8TivH30WmGBNL4UQHgWduKq
	4Xya+7dxzaDTBTE6SyzMZL38k2z61nqNLnJSGri1UJkY261LnVIl9SJkfVWvFkXUJ8hWj9GNEE1
	Byb9+5mPpo/EO4goeU+VHN0Mi2+hoqGxxB5TimzJ6xLlp7f0ZfpVtI7oKStkWAeZVOHQg+QvFSU
	Ms5hojbJyw==
X-Received: by 2002:a17:903:1a0e:b0:2c9:d55d:2d3 with SMTP id d9443c01a7336-2d5c5148ff7mr25131325ad.15.1786994766706;
        Mon, 17 Aug 2026 12:26:06 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c06:2735:f886:32ae:1e17:ec13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm10218757eec.13.2026.08.17.12.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 12:26:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/7] arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
Date: Mon, 17 Aug 2026 20:25:35 +0100
Message-ID: <20260817192540.423994-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Increase the size of both CPG register regions from 64 KiB to 128 KiB.

On the RZ/T2H SoC, the CPG/MSSR block is a multi-function block where,
apart from clock and reset handling, it supports other features including
clock monitoring, write protection, and peripheral configuration registers.
Expand the mapped register regions to cover the entire register space of
this block so these additional features can be utilized.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- new patch
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 33f953c110bb..de20bed2797b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1075,8 +1075,8 @@ xspi1: spi@801c1000 {
 
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g077-cpg-mssr";
-			reg = <0 0x80280000 0 0x10000>,
-			      <0 0x81280000 0 0x10000>;
+			reg = <0 0x80280000 0 0x20000>,
+			      <0 0x81280000 0 0x20000>;
 			clocks = <&extal_clk>;
 			clock-names = "extal";
 			#clock-cells = <2>;
-- 
2.43.0

