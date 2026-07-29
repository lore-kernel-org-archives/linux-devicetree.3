Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616FF486631
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329775; cv=none; b=um2MYBRBP+8p6Jl+WHmZPeXl3tsEOIW1HDzgWL+4Dzi6vhyWUlTvMmrtsxSme+qsOER/5D3pBCE4fBk5FGUP8sUnc1DHmXkFBfj1JWyQFUkZON/EgAA1AQaeXOUgfW5Ut6LRdIUGHhZ0epntnGAUGFxNWp1LNSkJCfPeTrM3LYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329775; c=relaxed/simple;
	bh=v5TD73c14fBvGUqzvpEveOuuW8r1VEaiGuWjzI6l2AU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnQUAdlPbXCMcFeKwi3eT67iTBDD7MD7FMpajxwLxb0TN7V4L6biciN1AfJCMZnObDTPAcbiOn4RChomEst1LkQhW2arnlLTtXOuY3EAOtWvAQ6VjB7u8v6mkgJZqMATXdtD3nU4e+8pcAU3r4RCkFBq0TVgso0Jcd1cSj4PTFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7HH7JC3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7HH7JC3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-476a130c138so1036345f8f.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329742; x=1785934542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8f3N9RJ5+paWCMwW54eIfDA7ydsdinyye/pP58159A=;
        b=i7HH7JC3/47FhFYPAonKj6wDkKsaJtoYOE9CfoCrlQNq911Xu6mEqeKmNM8TGnSfOe
         HpESNHVotOj6wIevhG57Ag/OtUcO3JaqfXNE9Vkmf8svoyiJdVmvwY2S/rV+uNf4brLE
         4LUjnOdHfdQLscCajjlOzrtNSu/paQmXrvagiw7poZr/dXpKKwFU77QCfs96ZJ05TXQk
         N7zu2zzpG1vbfjq+U25O+jHx02QNwr5D5ux1va1E7G7GvEcsteD/gMont6LfriGZtWcD
         5Oca5BMw65llGu93Rob3uiizXSPmHo3LnNnNvo+INp8NUUutMcsDHUr3HMWGpYZX0sEI
         gV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329742; x=1785934542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8f3N9RJ5+paWCMwW54eIfDA7ydsdinyye/pP58159A=;
        b=BfaGN6xRCqNUZ+oMzwEY9j8pRY5bALDt8uOkPVpJaQvGi0K5VNI2RceLMPxryjK2H5
         ZOkOk5ntpUUP+KCdpcuDzDWW6CfDTrsBsSd/iKqaEgQ+TGzk4JXffMnaSJKvYVMPK6vr
         yTdvakapACFctX4ohb/bh4i+oIHu7aPXf7ZaYdl23eUuEOWpeQ8a6G392RQFlcjDNxpr
         jIcJohhHBxt8csfaOKYPLWMceej26EjTIg7ty9E1t74bPFjTWe0qG20sXL0JZO/MVnKK
         ix7d8DQSulqxCtfrvF12XSaQ+5dAJ3mTCxpo7ICrf+WqZFWD29wP6GRKvsnVAYz6pmbp
         8yPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRnh1Nvp3pzdU0z1gZr43jH5OGrU7fd64kbgg9YTBlfGhtPdzqYKIkMxpaSeVFN/+jC0HZgE3CJD2Z@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdelrvd3u4CrixQZzKfGy3wCBsJ+zmEn26bsqU7Tj+p+L9JvOH
	eSyhr7IIr3rc6+O4P/3VMe/GGTA6nTjGe41A2b+qkoPZ98jGZ6FoXxyS
X-Gm-Gg: AR+sD11yyrnCMrHvfvsfCHBH6hGeRNAb+EMEf36EVGBzsCeMLE1WhXtvXzhr6n5tO4u
	SheDhMb1NhmnHFuXP07bhgXyweEN9+cVbaHKarke31neuHES7G0qTZp42IKhJ93akDDrTVX1arh
	bo+a8fyqTwWwir2AX0xJRBS817afoH/rg/SSHQvauS9iWrD+rQnNEW1/Sk9EFR9XtidnJ6BDEaN
	m/WzJmnL3Mf46XJ6nwZsuhmkAihtt/10DBnzTtNxtKVwegZ4TZV/G4QTSUQZ8QKJ/GLJMHpibW2
	/+PFAM2sgveeS6rcVL+Ef8lTxRx+Fz0TiidX4O8x38LJDaZTZYuUMsRSYg1/xTd1VhGID5ifjZ2
	lCO9aP+zrwBkqYZvoufSw4nF7TCx7av+TK8HucxK051EYbZW4wMSiiq0pgo/4p9SuJOIlXC9Jnl
	ypxIfgnxw0OSwZMQEpBFZq0tmOdmREDA9PuCEEf7ZuwI/UOGmKsFcVvC8cyGZLC+n35t5sYO/wl
	JOAv7hMaLOt/Q==
X-Received: by 2002:a05:6000:2505:b0:47f:7c50:2222 with SMTP id ffacd0b85a97d-47fb1e95112mr7422725f8f.24.1785329742432;
        Wed, 29 Jul 2026 05:55:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:41 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 12/16] arm64: dts: renesas: r9a08g046: Add vspd node
Date: Wed, 29 Jul 2026 13:55:04 +0100
Message-ID: <20260729125516.230757-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add vspd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 03693f01228a..14c7f0b0b2a6 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,20 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		vspd: vsp@10870000 {
+			compatible = "renesas,r9a08g046-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x10870000 0 0x10000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
+
 		fcpvd: fcp@10880000 {
 			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
 			reg = <0 0x10880000 0 0x10000>;
-- 
2.43.0

