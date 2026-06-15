Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516543E5589
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524505; cv=none; b=lK4YZnykM7l/JLq4iaAZS1kTkb/BXOT5pvWTyTuLlKJ+66U6rDUg9ZFSTbZ0Fd0qwZftcd+trrjyNxbUD17gXB/QfAv9evb8YEVz8MuP8crdb+SK10MEqfxBTqttCzYQwu5f2WbsP7ZbRFXj40dbN2+wUxwXzA3PdrwWrCdEDGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524505; c=relaxed/simple;
	bh=dOvAhyLeHPBxGKHxf6UwxyFzijgxL/aM0Pz0STYAXLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNL0QO5gBhTtViNIHpAlf2GJunlxc4hW7U0V7nCkolxJK5ksUtepNAJiYmXS03QXgYVB19ohq+wjqp4Pcw1dkADBAaLhmfKRZyiNKCoUH44vRc3CZaC+luAe3ATd0YjEvpN6tRTFyTJNyZkaLpggPsBdhAzxVpqt3oGmgEUdbno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T360t0bg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T360t0bg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so36233215e9.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524502; x=1782129302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xC0wRTFMsREKYYVmQ4XdIJ67Rv22JHsPEOcdgYiJ+t4=;
        b=T360t0bg6MinfRTAId6CYTgWrcRAVbiGSuYtCPFJgUsoY+GnKheEjECCgpZV2juFu7
         RuL0yFL2Z7fXK1gaQjzc19rlev7vvPPUVcd49bPrAWpZWw/eI48z+81p+KiyQy3ao3OY
         doSEc8PFewQJLJKA54/JfaVIndqPMypU20DGNR1D9tbp1ABJllk3ZH85obwCjSwLXq7Z
         SpPk81Yr0aGhSqbEQxqOGMgwSfnKtU0gsR00s7sm9gOmyUxsCugnLJXhFv2tHVww41bo
         VQqCyCA6SPdYypRGvJZgKff75VhvjL5uUbF/uK8CLy1n9YjaenvVzadLlPnYUSFwcwcd
         LVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524502; x=1782129302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xC0wRTFMsREKYYVmQ4XdIJ67Rv22JHsPEOcdgYiJ+t4=;
        b=tSi48SN9i6+KMg0D3LQp49eYmK6ahZV3CMOCnPkA05CJZXvYnlYgCnBx1IALU0CoZc
         wtWqwVmUxa8Yiw9aY4XwRX/1yCUQDsj7lZmof6HTCQ+5YYSuZop3/g72Ocb+M4t8m5Be
         jh0xZ5wmo6XSMVmfF6wguzA5kzjJmOOu3k6MwRvJkvs37L+WKMHgpvATaYwbe6siViXL
         l+C891OU4AzTNXvgZhnbmP3/wMluIK2J6FPKmcegR09BhJQlORcEqyMvxrJ2Fu0kNGOZ
         KnROc4mZR3046nbZn79QoSJm+k5IulQZ8qDvrhun1SJorso9JMjwHvFqYszDpcC+/dbv
         BERA==
X-Forwarded-Encrypted: i=1; AFNElJ86c+Uq2nsTP8x2/3RR4ntKTVCqUV1/+eRB9m8XzuGDxqLfo6fvBHVi8GxVPTSU7NooTeoDabmBCHAq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8dTxrzFeFuJWaFWVkJc8IusyWUfsMcNCTnrUY2N4AAr7NtONM
	mTYza8lx93fs89egovP6krzoEURXvD5HEv+NHcmzTt2OvRlhQ08axDk3
X-Gm-Gg: Acq92OHD3mmTHAQk1MFtZUhDTaXOKvGcbnUrHJbh2w+AztIGa7ExnZIjyF+ks9NZyRf
	+4FJi1pk/hyB9C6pwHEYCKKQXEaKpr4/NQYJf3aPHj/1/lhoTWFM1XBc8jlkrDVamwEYWPA96fg
	R8et+E09/0FJtenW2uCYxEJCXC+ZZRqYHWXrpx2ac3KLo01nYlRL4H/fI5WT0/roXztz+vcgJRZ
	K6ryYFrxNCwXcyR4FL51ETeMhYdk4q/BPGHGgKRxwct4szrCkonJf6Zs/3JgbfN1GTi4cobMLFi
	EMxMFpDeGWWadDaB8lsF7WavgP88+7+FyCkZlZhbNl8Tnby7SQbY6CBVLNpcK+QVYYOG2pzEqXq
	1fPCV8OuGf0Wu3sNAWGZOvjmww165dycW9tVnLKbhKGKx5sFFns0GYPtUF1hH75mUosBTN/dlPJ
	DjWsH41IvdlYQnW7NEMmdwb3QDuJp7w6mlH4UTIKMehhf3cqyhhCft0BKQppUeeMZM6faR8pO7n
	d0Ev7WNKiuFnEhFsQhMQQxbElEXwp2RhdtIrUGomAtBtF0=
X-Received: by 2002:a05:600c:c107:b0:490:c2a3:1782 with SMTP id 5b1f17b1804b1-490ec50ad27mr206081755e9.35.1781524501706;
        Mon, 15 Jun 2026 04:55:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203dd0b9sm240455485e9.15.2026.06.15.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:55:01 -0700 (PDT)
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
Subject: [PATCH v2 2/5] arm64: dts: renesas: r9a09g077: Add DU node
Date: Mon, 15 Jun 2026 12:54:52 +0100
Message-ID: <20260615115455.1412098-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Display Unit (DU) node to SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index dda7008acdd9..93e792d0c4a0 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1377,6 +1377,30 @@ sdhi1_vqmmc: vqmmc-regulator {
 			};
 		};
 
+		du: display@920c0000 {
+			compatible = "renesas,r9a09g077-du";
+			reg = <0 0x920c0000 0 0x10000>;
+			interrupts = <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			renesas,vsps = <&vspd 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_rgb: endpoint {
+					};
+				};
+			};
+		};
+
 		fcpvd: fcp@920d0000 {
 			compatible = "renesas,r9a09g077-fcpvd", "renesas,fcpv";
 			reg = <0 0x920d0000 0 0x10000>;
-- 
2.54.0

