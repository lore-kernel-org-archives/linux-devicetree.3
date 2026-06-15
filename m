Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EBB3E557F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524504; cv=none; b=hR5mjsn05owXarYOGo19EjKZ/MZSpOVb5V6ILs2lihbzCBhv1G6Brxqrs0zi94xYdnIICkv1qbD1CmBssfXiU1aaDUiUFOeIl/gaMciB7LKQ+GfC+YsqouazHwrNENK0XbUbmue2+XBvj19/LsIYoYf42JW0d76ZcWtIQBdChjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524504; c=relaxed/simple;
	bh=CAqf5MAhtuSR9/qho2Pm3TPruwPFe8x3Q4OewUbagt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAJ9plxfO3f6RIHpjUJPIH4/3qm76sZBc65L32n6EGrYvdwEx093+I9bQKFIIAGGUUNPalxp5sW6GV2JJzeUALqQGRtuhv3cQ9eLV1DMUT9o3awPu+bbtXqBcw7vlHRDet2wXyLU8JUkP0VNdrvAhkp9K6Sf1YaS+TmhTSl62aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNtUYkkd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNtUYkkd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490ac357c55so31275865e9.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524501; x=1782129301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGDe5LgTfC/lO3z2JZe0ong7tYBmEptG67RUGytDybc=;
        b=UNtUYkkdlcHdJ3sWzkGnia2hGMJ8HV+yITRMP/4qnFKmrvJWcPbBywEqmPhuWYkZ/M
         CtGD9zNT/HAFBgXTDXwgrsSyPgdMaV8B3h2Biy97HNu+u7ol4YbdD8crq3SYchT9gU7Y
         QqUzqaHoJ1KHeYLv747C1n+7dZYLxnpo51PDPJ1qeR7j+TSjGcVNVtSvnqfoiZ77NoEE
         O5MEIMXltaBfo5RF2Rz2W3KJQJEp3Z1z95QSlBWs3QBd1CZnBre0zBb+0dPs78F9p97R
         HuuNDfnyrjsa1lspmpfCPl7wFTnz7Fm7NrKHhbD8cqBGqyptSy2nInc0naLU5YMv+ZRu
         X64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524501; x=1782129301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGDe5LgTfC/lO3z2JZe0ong7tYBmEptG67RUGytDybc=;
        b=MrsRZoQDJGiYMfEFEcaXhTnSIrRW1LTb/v9KBbozbQmwEMVWbgnod4Be4RvJRpd5VG
         xY7BN34kZt6d7zb03InU1K6HkBBYAtW2hx0dC+SkoLO49mo1YPD6qQWwGOXkIbk2wfvq
         KBP06mZ2hvyfyfUvPBWejvo+CQ1tMeaZadsTEgREM/EQEZQjUtL6Qaqu5LQFcv6Hwjl4
         ZtQC9qk7nnRF1B0p8QBgZOMhbtEX4Pd/Zi3DVbs6VL4hxkw5RnglkTxS3sbkN8L15r6y
         wcl3OuMK8DTnt91XMSX+rvy35zVfHHIv1HXBDwFbEL8KIBgPpqkKrtcZ4PxzWhTzL1rt
         yoSA==
X-Forwarded-Encrypted: i=1; AFNElJ9CEp7Id5HeDHnLg+N9stkBLtfq4eW++mW4ghBJ70TMbBJ+T3T4HZfYOMcLDGG5ISxjdVkCCO8VkdmJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6g0HwfpElAAqlNh85C6Sff5Mbzfj4sSbzOT8fk++p6EMbSLkX
	bvB15dJZ9i05hvVi816U2DX4gEWag5T7u4zQnZTnBV6uJ6NbkeeoN4Hr
X-Gm-Gg: Acq92OElTPdvUddZ8bO520dxnVlhymUysBZivPdklj3EIULl7B9Z2YsPB3rT13fcxpH
	pKBnWGcfEL4Ji05SJdiVZ9+C+GEwInBb3Jvn4DVkSF/A3lUg1vcaVmgPiTyCrsyXab7MU85Jn4I
	KUVe7NxAhPI2zbuNlI+3ZDDg0IoVe7RQ9v2bTQ3wr1tdH0W7avStwKTaXA2VX4BC3lwqFBkHGN1
	3n9qdvVWQQEzZIyuZgR7btXh6AsLa75fZTkkqe52skmGVifmLdmO1BxFdJXMYIEE1rwIiMF53sk
	iP507j+SAaE1y/TPF8mi5exatOuTSCcdNhqxY/GVeTBuQ/4iaNlEN1xtUhf0HVX2PqKhboVqIHQ
	Ynn4eOZ8G0c7JsJC3hXYKnU0Pwfm56F+D9GRB64tqgJD0qJjiKq4r/wRu1q76o0zEkXmx6JbARX
	AtmyGop5k9uxFT4ywHHb9OdLeCL45l06YybfYLjO6ut+EFf1VnO+KfV5aYr8ypEmxRhgPpFZTeT
	kU3gqgRyziIL0C4lqDyiqdQfJbijsbLISVu
X-Received: by 2002:a05:600c:4f94:b0:490:bd66:e522 with SMTP id 5b1f17b1804b1-490ec50075fmr173214955e9.29.1781524500720;
        Mon, 15 Jun 2026 04:55:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203dd0b9sm240455485e9.15.2026.06.15.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:55:00 -0700 (PDT)
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
Subject: [PATCH v2 1/5] arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
Date: Mon, 15 Jun 2026 12:54:51 +0100
Message-ID: <20260615115455.1412098-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add VSPD and FCPVD nodes to RZ/T2H SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 40494159831d..dda7008acdd9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1376,6 +1376,28 @@ sdhi1_vqmmc: vqmmc-regulator {
 				status = "disabled";
 			};
 		};
+
+		fcpvd: fcp@920d0000 {
+			compatible = "renesas,r9a09g077-fcpvd", "renesas,fcpv";
+			reg = <0 0x920d0000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+		};
+
+		vspd: vsp@920e0000 {
+			compatible = "renesas,r9a09g077-vsp2", "renesas,r9a07g044-vsp2";
+			reg = <0 0x920e0000 0 0x8000>;
+			interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.54.0

