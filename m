Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F80540315F
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205289; cv=none; b=Rtge304pqE+vbeRekLu72NqHAHa8YYCpJHq9kl2fyGM74zB80mtg9rTOHEz3614ptZ/h1cr1WJCIxE25bRmuHRNX0iet8ediZHIvUN8Tnp2GdtGE+a4s8GoOaJ14Z3pC7obAai0wUXJK63DeEnnwC7VMI3uZ6WzFuPGVLzRAlmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205289; c=relaxed/simple;
	bh=/0p5Q0W3edFmMR0JKwMJPCO5SfDsNlcFcXuWBH5t3OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=knc52RGuFt3gvcPJ+DNerhV6n6UWi4eGo8kD9+g6rr8ebkzKGFgIohdNyGpTFRFyp5gWU1ESQ8WPMLsFc9paBhOGrBLAFvgslDDodDcbRgesiTzRgbTh2ziiTOtvEILVQ+FEnGUDF8wW7aQ66Yxnq9j/651BqNUhd69YAZgqDpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3/rc1Vg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3/rc1Vg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f45e20cdso38537975e9.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205285; x=1784810085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioMyijQQOZNtEM+SPBByFUPmrnpXCyySvgec/gk8ZJY=;
        b=j3/rc1Vg+PKv/i/+kT9ydO37rv38Xd0xcVT8cswXKnNapgL/cyl1oJix/ITnMxJqSM
         Ss4vzfpinKoUE3KmpdYORorG7+LALKydRAU7DgFVwGcGyhtuApJPTPynjDniDbXTtj7o
         Zmq4Yp6m2zAE1LngZVbZtUagD+luOdWqtAaTNSRw8OGaHU493xM5bti7v8nfGx38nNZu
         VINDaV6SNbc0MSFZgohdSZQnngoXrZZcrgcdMl8rGGoscFKAw2xXfh+d5zEIR1/AOofI
         2MKJZ84m7E3LAW/HMxtGNK3So9kDhNjC7ai0UwQkhZCK8yuaPuAMPhQlyAqVz+mFPr1I
         pt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205285; x=1784810085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ioMyijQQOZNtEM+SPBByFUPmrnpXCyySvgec/gk8ZJY=;
        b=RZjtySabMuFjpD+Hm/V9WoG6EBozp05Rr1Iln6JrDryR8BK2u+VpwYX2G7s2MehSh3
         olbd2j3Lvu9Emug4F6NG68gUqPwLtZ0y9bBL8tP57Mbk4svAeeACd8p6UI46wpsz2prv
         voEYbeoMVCM0TBiBuFhksJY/gklEmXSXFpvDzueTNlFpnoSm/F5AxbnmCeMlDcJBVCU1
         uP03da3xBSlvSb0SsGVyI3fa9vJqo2REhWDJHZOGQVwPTKPycmPiwVgNMGh1gyix8ioq
         AAOdycnZgfbTIX6FmlOVALRoSoGxQPp38oJ/X2/SFPo0hrivMQitlPsLwlCmd49SHc41
         aYRA==
X-Forwarded-Encrypted: i=1; AHgh+RpGybN/IVfpBvDb3QWwqKFEcVgjaXGWAIUVNTVvaIj8XzFiDn7/OzWqG9wyZOnCQ6JB+vh9bpHUGFjl@vger.kernel.org
X-Gm-Message-State: AOJu0YxH8bjrIy/FU9BZNJn1i4NB2cmBKAw3mgtcpuv/5cRl7R7D0j6q
	OHpPzoRuLzwjkdRzr4Oclp9BWkEWNSPSFvDPKkU8N3BDY5BpqyEkg/+v
X-Gm-Gg: AfdE7cmryl3QQ+mCb90SonPZMcYzqnUFnDNw7KNxyPc1O+mcFek6T+/w1vHlAupvmHl
	omYliIVtpnGFYwNvjauu2tiY20iS+kXrxxVeN3D7a40LiZ3M0eZVJf5/e6/6Q+Mmw1bxXcp9euJ
	nbPF5oi9fxWoId5QqFHdrTh8gTpNJmcKZz+cFUvpq1xeGn2aPPHP8vX3VYsXho/vsWKpnScoKlo
	CnBsx/F0HUoeQKyu2ECXBE6Vp5hF9yB82H6jsfOGfVXaSJF4XxBCOdhQUUZcHWoJ1z+N1ktbjE4
	8WMfxiypOvnkS+K550TTPANCcNVXsQ6GeKkHN6BH1ZLJBb6t+/TWJO4nYD1JdhdPintQ7ehRH2J
	gP4pX7PlVRhkxJ1ZpN9hQdy0lcBBR5TWw5i1yj9YiC3v6tDPx1fQgh6BrFhOx+P7JhLl0DVxW9z
	q7SFgzMh3fR+QojA08PoeOdBF3g0Z5x7NOfP7K8XOyc3oF1fxezx4GKMw1B6LHBe3l8Odqu+I/r
	L169XcX7Tc16QcLDo3BRh4/fvY=
X-Received: by 2002:a05:600c:1d16:b0:495:3b2f:df04 with SMTP id 5b1f17b1804b1-4953b2fe00emr83467695e9.34.1784205285272;
        Thu, 16 Jul 2026 05:34:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4150:a2d7:2b6b:840e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm48582645e9.6.2026.07.16.05.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:34:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 4/8] arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
Date: Thu, 16 Jul 2026 13:34:30 +0100
Message-ID: <20260716123434.2576253-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Increase the size of both CPG register regions from 64 KiB to 128 KiB.

On the RZ/N2H SoC, the CPG/MSSR block is a multi-function block where,
apart from clock and reset handling, it supports other features including
clock monitoring, write protection, and peripheral configuration registers.
Expand the mapped register regions to cover the entire register space of
this block so these additional features can be utilized.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- new patch
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 1f995d636dc3..718e6c06b9ba 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1051,8 +1051,8 @@ xspi1: spi@801c1000 {
 
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g087-cpg-mssr";
-			reg = <0 0x80280000 0 0x10000>,
-			      <0 0x81280000 0 0x10000>;
+			reg = <0 0x80280000 0 0x20000>,
+			      <0 0x81280000 0 0x20000>;
 			clocks = <&extal_clk>;
 			clock-names = "extal";
 			#clock-cells = <2>;
-- 
2.54.0

