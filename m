Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB75B480DEA
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995496; cv=none; b=fofPNk1lhknXqpQ0+KIQSe0vY/+eA6bcb8UhwLQEO1LdSnSvVD+VtjBOZCt0GNm8uldSG2IroZFrmUQOCpPlyOOxRUiGkF1Ag8TicrZOn0y9Bn4m0Ek0wWDHvUckR+2shtrRBPiht4dv2Vjxrh/N/CB0is6VBj25L5m+MtPw6BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995496; c=relaxed/simple;
	bh=UzE1TRKwehJAZlNkapkZ7z4b5Yc503wNlGsoLYPnPAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+ZD1fPHoXPLeeydC0elHokZlgi2LhoZLmbSk7ilRTucKTOR1mqfw24qbCGASkRgS+DIxHkQIQOk63kLkKrQ5TvnJ6pm8zQmVso4XwSNm/w+znT0/hGNKhtXqGO0cdf6eV7wa/FkyQKMjk8r4QjDVszxtsbTzgLQgyRcVEMFqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1cUvoBQ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1cUvoBQ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-474e7ba9fd6so1025024f8f.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995489; x=1783600289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PW0IVejhflePMMHQrOFWvkpZ6B6V9/DHbdAKT2t+clM=;
        b=O1cUvoBQ7xh3i6A7eZKns/c68nvlClmPmIOs4i8Ua59MJHnIiHldLR29xbXmLf81y2
         qGpKsxDexBQ75U192gLsOuwCdDvhIzFOMGRdshVzQMKW6Gb4PJvBmwzsDHzkpreKArg3
         5YZ3Wcn/bA6Erj0gpTZq5BJrqDZm7jsbAYG1aB/DUvWJlo3saBgfpYH2OXSo5mh+PQCA
         5sdNSlIFyzBk9kzb92O7rmDAzESbkLGnFf9pN2YyOnLpeNG/Op9VdF2KLr7So4d3ILSX
         y8S3LXg2tOp4mpafuZGgSiQ4SMDstR1k4Ulrm/HXnwjqOU9du/sP7bKOhvuS77lALdAT
         mN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995489; x=1783600289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PW0IVejhflePMMHQrOFWvkpZ6B6V9/DHbdAKT2t+clM=;
        b=WTBUomNLDEzjZFqvkf799TG9OtiZjElycaotbyMLCJ4WwU2RVi7Vfex2ivlZ/KmUZs
         sw3s9cF4o0bdwhOEjrpWcr/d7RC/esA0mnwSwvJy4Je8Rjj6Ic8N9Yj4cUYaLvjXLDRm
         tqhY0Xl8LBi5ZRfBQ/3wx+PF/rkuOeFpXEQ7FUVZ90LpyKiuoaUiaBdxoawZuVmReWvU
         BEYE/hjRaffh7zcWr1BDh58wT81ANE0RW+Bdg30PzIh1/usiCsEUc80tqCMTAq+gsosh
         AsKlzIsKom5R8zKAHjINoHMo0WOkb4XrKRY5laAb1EtsZ0hGVh2s1fN6nO8KObbQ57R4
         /iww==
X-Forwarded-Encrypted: i=1; AHgh+Rol+uebvtsM6UOVBAgbpHkfm3uDk96gGYRXAzjFhGzVznpsDLdSQp+HyFU3z0T6xDz8s70s5opchO3F@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+JTQyz46PcMcUlP8EiZwSntjPpmrCSk+TBTodnWx3AXJObjc6
	HXUzjwEzvd3W6FKcnECSymESiqEfTvLWyycQaik6vX6NQGE3Ru7ssigw
X-Gm-Gg: AfdE7cl4bLrR46m1DgMb3tH31R3YtGSK6KxsOz5t1L/S4BByTwKKelsUfXj6/1hOWzA
	xPRNUH5A3Mgz0OwM0UiX+bGfqID6Z3vNTND2YkOSsnJT8PVF8GE/b+B1a+GPFjkqONJB2My7Dbr
	jc+/YZ6ibqn8N/Qx3vrLdeMZDMsIlyy1qwamb7OfzSLF3sINfh2v2OOk4Jc9LPQ89Eo0mFy8bI9
	Ep9Ym7Vyrlaqbilek2tA+bE3WY/ldT4y4zolDWWno4ncy58o0JfWs3KSfFkoqZHsIlWjOGx2+nR
	Rw0SIXU/arIT4GzoJXjA15ZF8wBbda/wBsDolL+7ERPc2MYgBPELKTsNpFKZU4N4S/O48ETn4wB
	H83A4nhxPWSis+fAFGb1//qmck1m0u6Eo6bGkxJflIaGooK3Yk1QcOc1W6380HXL1wTTJEMbWQ/
	CQbb/hAQjUec50eSrd/bUiV2INIwmOaDaJ/NT+YTrp564oIVpIUNjJwn8qCBx3xAUSOyp50z8tu
	koYuPa4EZvXFap+bGlHj2QjFjPXH6p0dwGcaw==
X-Received: by 2002:a5d:5d82:0:b0:475:f0f0:9ef8 with SMTP id ffacd0b85a97d-4775b930513mr9177821f8f.61.1782995488349;
        Thu, 02 Jul 2026 05:31:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:28 -0700 (PDT)
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
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 4/9] arm64: dts: renesas: r9a09g087: Add system controller child nodes
Date: Thu,  2 Jul 2026 13:31:07 +0100
Message-ID: <20260702123112.161160-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/N2H SoC contains system controller (SYSC) blocks for low-power
management and access control within the CPG/MSSR address space.

Represent these SYSC blocks as child nodes of the CPG/MSSR controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 1f995d636dc3..165c404dfd36 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1058,6 +1058,20 @@ cpg: clock-controller@80280000 {
 			#clock-cells = <2>;
 			#reset-cells = <1>;
 			#power-domain-cells = <0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			sys0: system-controller@80290000 {
+				reg = <0 0x80290000 0 0x10000>;
+				renesas,sys-block = <0>;
+			};
+
+			sys1: system-controller@81290000 {
+				reg = <0 0x81290000 0 0x10000>;
+				renesas,sys-block = <1>;
+			};
 		};
 
 		icu: interrupt-controller@802a0000 {
-- 
2.54.0

