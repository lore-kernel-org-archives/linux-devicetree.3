Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A12541F352
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205289; cv=none; b=TDHBL/xr6SYq7wOBv7S74KM9RuhpnXp/SYvRjPUJpUbZ36PwHtkFFdcujs9VnLXVnHekS/zm2GlLIFsAZuJxbb4RUxFuz0r9x0UBQNOZuW2QaOGrDK1+fJgf+jcsEec9l53XBqy+fNpeyGO7eQyhwLxKrnQFPyi9QsC9UQ8jzpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205289; c=relaxed/simple;
	bh=Wa1AIz8mfbhk05oN15ZEbX3zyGwLprV0HUb4+AWMGuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fkaWHoTJamH1nRJBN3u4EuefnksXZqsKP6r9wUzYTOFgxWb27KldDxWutT7V6gLJ065+Q7n8Q6RN3naVo1aOwYz/eiwV0bli0OKrYxfqc5Zh7EsIrKMqifA5Bg3dmFq5KDOdxnfLDyckLMOGsOUydkk1pnG5MEiwCLUPYf9g/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lm4r0CS6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lm4r0CS6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so54028935e9.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205284; x=1784810084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56txH24bSU5dTrYzqbX8viqwb9q+gnv6llw5mdYhsk4=;
        b=Lm4r0CS6MzLgoOLNEmfL6oyWrcyf6m4W/mqffuLZu4mwSxt5p98Yh43ergf1pK0ahZ
         3gnK75Vks6cWv/houGNAMSDrI9xOa7JcL83LnKigUATyFnaxsAXEoBdouKCK59PSoYce
         A6RChHxCZb5SgFrsWnNxkZXRz5HWut0f54xeR2rVt0adtworvI1wEJ+MyCzWUvukxLQd
         yGbX/MhRGu4mcANpmPL/tauDeoXoXeQp8UEHtrlxVS9mfe/yWz7iCZaviG6Fus4r78L+
         83imvlGxh5ly+Hw4rlAtbmOS9S4NLrX3D9ch4GDmNaS/DBaa0DRB2Wg/sPedteXd5v44
         ldJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205284; x=1784810084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=56txH24bSU5dTrYzqbX8viqwb9q+gnv6llw5mdYhsk4=;
        b=Z6OAHIAqnUZ0zwvzbDBWOwnKmDxXSiK2QIfYn+QxtKBFnDejLpdbFfanVFfQJn8ci6
         qPJ8tdEuCcbZg0yqKW3dNO16iutkHI0+EUK0MURbBi5L3d0MCDB4myAVGY6GgGDcmm1l
         ts/y2enip6GQqkoZNzxDks3JLl5SL5cu+zyxl3L2w81uV1klKdBifLT80uD/LEw29bQm
         bte/armQMymJFGEyzz7pOqV79wfhP68UZ6uoljK78q4qvnQVaKlnr3oIl+7I4Rxg7Q/F
         F3GWU7CclHyuipCqCR8+oj9e5k0p6Y2ZlPPXUqQopMNUwhq0uPfgKMtneP5fvMOXxhfo
         goKg==
X-Forwarded-Encrypted: i=1; AHgh+Rp95tCbA7syv6rrY5mGUuskRiY4B46e/wZ1Cnu1ll5AwWVlAPuqHiev+OzTozZ1IUu/0fjUw3UL9T0L@vger.kernel.org
X-Gm-Message-State: AOJu0YzhWsK5iH5o+MNO0mOB0GlDL5dLAAixjVKIPUb/sa1IlpIcESCB
	GapQ8v59OHmbxBPzbTGrJJsP+IyQLcQFZxNC7LebLYcZ0XxU9oI0Bb7d
X-Gm-Gg: AfdE7cmQeMRXDBac6j1BI/jEEs0POexuHAXfHCDF5gxYS8nFDtHVHGpk1YK0GVFKeiV
	Iv2n2gXNCgAUR75jucHfXV1cLIybFes4fxk01tGHdxoheROjG+8TNQ0mNOgxs+QeXm0Ge3jqY4O
	QUCOOH0Ng+IGnNSgSTevx5YqkKIui1P8U70g5REjyPpzsYdSUKFCfiXVI89/EzdipqdPTzYqvaZ
	nbQbWeK3tmBAwQkqeGhbqiHAvjk75Qq15eFN0otbt4vUc1yzo2IEf5exZpHDBFwHx8ITrLPLZ+u
	Zk6y7WQpXFOzs3T/gLkxNqua6TwguIWQwvbc9Cp6FPrb4nHawlnlz8eL8Pe5IIuX/8Nxz5je9z4
	iyC7qAgnlnlu4d2CfnIfZ5c4IT8ty07juOBwhDKpia2GMeb78KkEOIC133iMc7wydSYLCTkSyCg
	6Fsj7QbCGDXuzrCwE9zdnK5c/5mv600So/Qk6bFkmi7cQri1LzHQEcPGgG4S4EXsBo8X5Hje7+L
	1oJnHjIuWLhDkJp
X-Received: by 2002:a05:600c:354e:b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-49538992ceamr112755955e9.3.1784205284363;
        Thu, 16 Jul 2026 05:34:44 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4150:a2d7:2b6b:840e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm48582645e9.6.2026.07.16.05.34.43
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
Subject: [PATCH v3 3/8] arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
Date: Thu, 16 Jul 2026 13:34:29 +0100
Message-ID: <20260716123434.2576253-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On the RZ/T2H SoC, the CPG/MSSR block is a multi-function block where,
apart from clock and reset handling, it supports other features including
clock monitoring, write protection, and peripheral configuration registers.
Expand the mapped register regions to cover the entire register space of
this block so these additional features can be utilized.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- new patch
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index bc109035fbac..9c45266ea595 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1048,8 +1048,8 @@ xspi1: spi@801c1000 {
 
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
2.54.0

