Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F3743846C
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780489; cv=none; b=KKIAPQ+eY03gDQGs9HGIUAsEM1CwCimwgYPhz2rz88W0F6+WAyjJrTCrk+TrXltHrmCB8uxwaafMVJgtfxqFo0WZXYKF/mLvH5MzwW37/1SE/gDZHLhVzMm+NJjcfleX0dftNfqpk/eDI1r+exDNSCoekJLqpuUGc6apHDKWCIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780489; c=relaxed/simple;
	bh=PVzzc9du/j/IIUtVI0EpD2qkwZbInKS9/yBMHMA5D4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U14aHZoArNkEoKLAM3qrTyl8d8FqbqPmo2gONqm0MOcSEfay4E51szO/vyzaMwqbNmpRdR0/kpv1rFcc9iojZtvtiYhyayxZ+LAkbndOhS2BH3rwNJiHnyzCFj0E06lrEhzFj++Px7IYgUc30bsEtUL5Suw0NlHFE95+im4ZiYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLXj0ltx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLXj0ltx"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1871720f8f.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780486; x=1786385286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6BWR8dmRaEKQHkFK66ev0gVEIwNsNYFwR9W/SfWvzP8=;
        b=GLXj0ltxTXuBowk3JXfV28mbmq4UKfQ7/mmuS+BjJ5pslm9npFMa2JRcZejXKwjL9d
         sN1vIT4/PRu572j9P4rftUKKEp5cj9aWXLEzJbYkLzG55two+dHipp1LpngJGapDFNwm
         l3A3WpA4NunpD23SPp+4a7LW3TuoM3unKsxbI0UmZyeO7uCL59uSBnNaBpGz7ar4I1Q+
         AKW/1kfQ7b4xFvIHUZejiHvoSLQsfvoCDkTb5cLinz3ZP/+d12aFmfzS5Jg39sj1CvN3
         HVu8YDbRHwOcXAzoYHbWKsxLipfHjFS1akt0zcuG5JXQtf8znu6rC0lhYqoRsrf0bzsP
         dtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780486; x=1786385286;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6BWR8dmRaEKQHkFK66ev0gVEIwNsNYFwR9W/SfWvzP8=;
        b=ZDOFOZGjTB2PcBiNhihEYDpl6y9zN5vD+/wmYJDaTDUYXW7Ui4u5p6/wPnC5DC6ZwG
         LQ8O5BJJgT91AmOM3IvAAatOUvz9RB6e0YulXnV4zi9JfeKBtrExCVQB8t8dHBvX0HTC
         5N7DansWbcbWbFgUvMF9yHoTB7iN13paZ0b0uNs5hH4RsbVcugpvK++ezug/iWGCsojA
         /JdddGpJiHvCCzCndZdHwGNYCUMNJ4C8lK/sxQgLmQVrhERwDjZRrFJdtPCJFuMV7SYs
         inyJUDr0sKDSDd2HlQBOKluUhlCb7a+YSpTkzHNiAs/K2atgivpOEgLYUskhPcqh2C1J
         vKsw==
X-Forwarded-Encrypted: i=1; AHgh+RpzLkSlhz99fmqYciMAywCK+FJpK/bamyjuOJGToDNo4rMXUBsXd+GG3ds2vZBNFDfb/uYr5NabDDhn@vger.kernel.org
X-Gm-Message-State: AOJu0YwCnUnRcjOQzdF0+X3iPnkn8irWrIxRxkSyYZWB7ng3re0Lo6iN
	qCOYzIXJbwx/jS8gfuQlO12MWrFvmpbDBP4uq4e+lCU0UtJhnE+Qd/dF
X-Gm-Gg: AR+sD138K5rjqoiY+SzdTG2DtMA37P1v0wShqNiOQoUkQiXFi/7bJVrE0IpHV1rt5vc
	F5LtodVb3iCOPNceINXIzizwW1AsRKAYw59v/qKQ1f1YSeV0PyQUHiEMh+jCs6xkaeHmAy6Lfa1
	ZU01Hi1dzuVaYNb6VERQVSCBnHDLAIqN8bfMM+x1GOlH77QPSHTh1iw9C5U4rh367Q6dGKhpGnE
	AxSz1mxccj/VVrVsSSZ/kl3Je1DewaGWR8WtPSW5CeBdDe7+9roXZXHO1RCT6ZjUH5znXwL/3PQ
	veqLeqpam1qYq0Q3pGy3h1znn7HfygsX+KhE/5helfNzLcYSEaYBU0vSVypf5Szjs8/KbB5/sdx
	WYJJnITuI5LpNMZqVC9lLL7m632NnXEH7A66rprG9pmS+fQSAaN7SSzoVitUGQIK0P+9DZ/dCpe
	lngVGSsZ4BVpSidz9qG59Q+DQ6gLWvodyLykyk3frTEhsn72O7wA8gGfoHEX9zFXJ1KecIOp+NW
	MhaI7OsSliHQom3sMRWfxOg
X-Received: by 2002:a5d:59c8:0:b0:47f:9404:5185 with SMTP id ffacd0b85a97d-47fd72c78ebmr26973780f8f.24.1785780485932;
        Mon, 03 Aug 2026 11:08:05 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm37950955f8f.14.2026.08.03.11.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:08:05 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andre.przywara@arm.com,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: add GPU OPP table
Date: Mon,  3 Aug 2026 20:07:55 +0200
Message-ID: <20260803180755.288793-4-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
References: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the Mali-G57 operating points from the vendor BSP universal table
(150/200/300/400/600 MHz) so panfrost devfreq can scale the GPU instead
of running at the boot clock.

The table describes the SoC rather than any particular board, so it
lives in the .dtsi and is referenced from the GPU node there; every
A523/T527 board in tree already provides mali-supply.

The BSP universal table specifies 900 mV for all of these operating
points, so that is the target and minimum voltage.  The maximum is set
to 920 mV to also cover boards whose GPU rail is a fixed 920 mV supply
(the Orange Pi 4A drives it from AXP717 DCDC2, fixed at 920 mV), where
the voltage transitions are then no-ops.

The higher speed-bin points of the BSP (648-792 MHz) are not included:
they are gated by a SID efuse bin and need pll-gpu as a live parent.

Depends on the sun55i-a523 GPU clock divider fix: the OPP rates are only
produced correctly with the cycle-masking divider model.  Validated on
hardware with the Mali cycle counter: 149/199/300/399/597 MHz measured
under load, thermal-emulation throttling included.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..a3164b5dd609 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -85,6 +85,35 @@ osc24M: osc24M-clk {
 		clock-output-names = "osc24M";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -121,6 +150,7 @@ gpu: gpu@1800000 {
 			interrupt-names = "job", "mmu", "gpu";
 			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
 			clock-names = "core", "bus";
+			operating-points-v2 = <&gpu_opp_table>;
 			power-domains = <&pck600 PD_GPU>;
 			resets = <&ccu RST_BUS_GPU>;
 			status = "disabled";
-- 
2.47.3

