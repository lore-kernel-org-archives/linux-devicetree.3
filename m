Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D674F4037
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686133; cv=none; b=jLCewHNDb7wSjc2Bq47Qz/JeXSN3d51IY/TxKVXuPf/wDN3MKBIWgyUgOfRqLY0P62FWtAKj0tS9+tK0+hQE4yFF729VTEYHnUmNbxVyCckYnyRa8GDxCKD0L0y9weraGyLEm8gXWh2imh2du3jAXO1xZPJZwEupEcmef4tA5ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686133; c=relaxed/simple;
	bh=sodi5mo9+5hIVHzuNMklVU1zg22b234UU22ndIKPhl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHmv3qDdgp4a9SHAuIPMIWtu+AKDckwAeeNgkX7fPoako/onQUlFQSn8tCyKkY05tXnLDEt4/bNMq3d/5eCgiWr/H/KNyGfKi0z+9scRl+/l8QCMjob8PX06E+g+DnFRU4Z8r29yWRWW5LWnc1CMlYrtyemSa5yw450ytySpCKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecVdvGLc; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecVdvGLc"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso2603741f8f.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686130; x=1791290930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBS2cw32SoCGmB2dOwtN0oqVWveJEaVstinaAnXIBvY=;
        b=ecVdvGLct2ks37fQmwLqIKiJXXfcpVo13TtCumS1UbYpJRrRg4nETDuFt+TPSYqHs9
         qTjecNcGXmS+Atl4CiNFibuBU05u2XHCmbjHyonb+tv2cyhCl/RM9sDJgc7VXzrDbVMx
         MKoiOGQt4fJmjEyP/Ym7qEAUmYwCDaKAl6RnBxU/gZioAAhMnC3+ruA3U2FXZ9dtvaYa
         Z0/QyPiSXwyc+qvYEEB/y8lCc0eU3ROk7X85wvff9af15QqOg/mGboZVHurE8FKc8Ahc
         2Ir+U1JaRgSoj3iIx7Sk3q7UG+XliPkgKoZX7tXz1RLsH16Q6+8otfuf3SRE3UzGcvqF
         iAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686130; x=1791290930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBS2cw32SoCGmB2dOwtN0oqVWveJEaVstinaAnXIBvY=;
        b=VBRwOqE/w/9Wbd0FQaHYZ+ZNTAKaN7x6lJdlSPos+1LFzQbttG4nvAq6/VFK1gIQNJ
         nxjrz1VxuLtdYKOl2VsS0QGZ7jsuj6R1UsuJRNNnnst3DdJ1dsGMarVxvJF/altbPNZL
         pnFe/4NAWeRAWq3fL0KDE/iG79k7Zw+XZ2djKdV6jU9YMGwGtBcLwREgHvBRdRB5nbH6
         ad32EfpXjJdT+bYNnmRJj0egCIWSXXTRMO6RGxP3GQMEZIrgiCIMueFrdKNpCbN3d3cz
         Id6tb8bmd43T2IeanB4RR6WBQF/GU/L+XR03EIlPxgfsCdBQwLbTJHx+gtfsnl1Wfien
         7zOw==
X-Forwarded-Encrypted: i=1; AKwUvByNAa8ZDMIpdKt5H7cEypqKSpmml+inFZS78BtaQN2dkEW1IrUFcHlEvRjb1lnot04mpL351swAXA3f@vger.kernel.org
X-Gm-Message-State: AFq9FYIuWag0coudlNLB91XMuH2d99mkqNyZqIZ2+qZICNQvjGcikjqe
	PWEWFtNBk+xVviI+6VGSqA/jU4NdmUx/dq/2AH+y7Oii7pktdPCLPQha
X-Gm-Gg: AYBFou0tAGqW7BPdgFyY3c9Bkz8IUEM8//pLf8uDDcaM0eoWjad3BGg3SNGCu/XLiWl
	/XKbLPMANvCA7j4MZhOes9e3ioJbSxF0SrfImzoebCm9Lugls07E5VTUzxCU0IGv8e83LxC+P1F
	DzJubVdngx+gGXErIhlkrhZ8GLJbKFfV4+0wYFTpMVz/oMprrwqB0j5Ykk36Jnn0noVimqfSN/A
	WqArKV+/ByrYc5ZoriTJM3VqR1GgddEF7gs/2+f5PBb+xEyOEiPSgs1fUZD+z/CPVdFBBtT2cjc
	lZ39eTrwOr2FkMr82jIL2wwJnQPANKN6/kzla+IYKrmWgb/Wpx0gt1BrolsN6czvKASE4w736pK
	h2XbillAo/gX5J0AlwNG4hdHA3R942Ifw3YZBEAjloSoGQatrsacDbhXhipskYAjEGgKn0tfuRR
	TBjQGw/GiXk5eS09qKb/ibTvHI/ShzVcFpA1KBrebnoap6kLATh/lWRE7FBKzcdWx4TESsoAHxq
	Vb5+8jSpbgWdVyvcBLf6J3Ay04Wxv3/yik6NNUIn6iJNvdWWAlknNIbVq/fNME/w/GBXeKD9ekw
	E41JhlIz3kj6kV03Lp+dadYGrTeZFQ==
X-Received: by 2002:a05:6000:40e1:b0:488:5fca:a837 with SMTP id ffacd0b85a97d-4887da11182mr23608421f8f.20.1790686130281;
        Tue, 29 Sep 2026 05:48:50 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] arm64: dts: renesas: r9a09g057: Add ADC node
Date: Tue, 29 Sep 2026 13:48:26 +0100
Message-ID: <20260929124829.237997-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the ADC device node to the RZ/V2H(P) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index bbaab75681c2..d40d38c6a31c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -608,6 +608,54 @@ wdt1: watchdog@14400000 {
 			status = "disabled";
 		};
 
+		adc: adc@11c00000 {
+			compatible = "renesas,r9a09g057-adc";
+			reg = <0 0x11c00000 0 0x400>;
+			interrupts = <GIC_SPI 918 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 919 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 920 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "adi", "gbadi", "gcadi",
+					  "cmpai", "cmpbi";
+			clocks = <&cpg CPG_MOD 0x108>, <&cpg CPG_MOD 0x107>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg 0xf6>;
+			power-domains = <&cpg>;
+			dmas = <&dmac0 0x24c8>, <&dmac1 0x24c8>, <&dmac2 0x24c8>,
+			       <&dmac3 0x24c8>, <&dmac4 0x24c8>;
+			dma-names = "rx", "rx", "rx", "rx", "rx";
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			channel@0 {
+				reg = <0>;
+			};
+			channel@1 {
+				reg = <1>;
+			};
+			channel@2 {
+				reg = <2>;
+			};
+			channel@3 {
+				reg = <3>;
+			};
+			channel@4 {
+				reg = <4>;
+			};
+			channel@5 {
+				reg = <5>;
+			};
+			channel@6 {
+				reg = <6>;
+			};
+			channel@7 {
+				reg = <7>;
+			};
+		};
+
 		rtc: rtc@11c00800 {
 			compatible = "renesas,r9a09g057-rtca3", "renesas,rz-rtca3";
 			reg = <0 0x11c00800 0 0x400>;
-- 
2.55.0

