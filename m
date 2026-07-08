Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F62D4A2E02
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 17:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783531747; cv=none; b=St6MatlizDCE1CGsz2/d1ZjTKqWF/1Z4T40jVr0RLwCc/IM13FK48oOmTO5v3J0El44Q24fVtfwpPs07ll9SkZikLB9SU5QBhxkFRzNWNhkewEtIQlL3xo8lZS9Su83BJtyAT/SAaEYA/dZ2KtVu+TKWXWi5u4/eZI6Es7CqAZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783531747; c=relaxed/simple;
	bh=ioCtDb6Hpyegnn4dLa/LBc0pEMO402CSdMCwg9kodwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwJxk0aB3uuzuCPkh7r3PVe/p7tBKPYTXn6zW1+jOZslxoBcjjhfAB1s6O53yxKOWGtR239RldxbjxQiRZE9VHHdwqIQR8H2eRf9Jv6K+1e8yzIR53/mJailTBHiMZeT4CRxeQza4VK3f4jBi/pxTXfvrxMyFnktjBTOQ2kgZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIL1vxxO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIL1vxxO"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4629051c9d1so566296f8f.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 10:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783531745; x=1784136545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKuTPeLP5x2TPSDUEcA4a1QbA/RpwWIA3uH8yYjcuQs=;
        b=mIL1vxxOWlPYE6Py0olswa6dnjNeZvzNpb+ZKO1DGGXlvpc8IqA3v0zzv8p6KGMJvS
         +LNLkZ/YmjqDYBTqX2cwxYAtErr6ZXuKJjn/NR7EJS38/sswjrtTl3yrVhLU44ZEG5YM
         t+rMvv/NLAze5ZWKVN74xIbqszJh6brlMlbSCAaL6+nrdn/WHOu2tO2D2UR1drwiI64K
         dAFy/LriVbAqyVjkmg43EmD60QovzhudLVSWPUAzFu5NXKKuPe+1FwE4em+03NuNmL+M
         zu509PcOmMr36sz4q12Uwv3wkxNmUxhF0miWjZis5Zlrh+8DNHHpwZlwI/4jvPybSzU3
         f46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783531745; x=1784136545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKuTPeLP5x2TPSDUEcA4a1QbA/RpwWIA3uH8yYjcuQs=;
        b=bldRWiSls9rDS+dYMwrhyVVfuiFS/QQiCOwQf2yeNORvAEnJ/FfoFvwtciwyCtOzQ6
         Gij5x0Jfe5Hcpk/+AZV+MhhFRC7n35wRF/UZ6lhZZgB0k4DLWe/6e3nTatGXrkAkBmie
         GnMQj8VFFGw3SPha5xMw4ma4U4BwEI472BIaA0nHdaqXMRuy90NQgomzP2VMq2dTwZ65
         VuUgMH5j30w89GMK4tCv5euba31evFkFjRr7puMM+KPoFHVzWs4fNIggD991QwqHevSC
         uENyyEjwDQ8qW6K8IOD7KuWIRNt0PVG0lSntjTVsrs0/T+3RRJpWTJG1KD4JXMKyfOLY
         uMZg==
X-Forwarded-Encrypted: i=1; AHgh+RrQG4qrtKr6jtu2ODj/iF2sTkqIswhX6+UD5ALBRmMjipIq+biPxRV/eYDfYh7pfkXDE+AOguOd137a@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/TWb+DBEbPNhPkjMvS9gBRUNz0aiHe89uEo2YgkQoTvq+sJYe
	d2sAJaFZWx63lX1txB81Gih81jk1ZJTOTeou7FKLZVRijh6jFncRgBHy
X-Gm-Gg: AfdE7cmr4gDTPfbJ7pfQiua3ANPCuGuXg0WD6Rh9tbeIQf1sC02aD1a3SkRZm7s2943
	+8hORhdwQrq4l3CSxuc7UOka6nT4Ow77L2ql7NS1wqB818Q7I/1v1k+eSuVF8l9gkw+VZ/daKaN
	x+uAumjeFX0Q64APZ6EZPMR8YsCtS9Mw51ZMKRtH+46INwpYzleBwWQH9h5GkDQL0KgTGv06Xh8
	FHMmwLaBMvbPz6jriVbx/wbPpPzieS51IwenhFIYGMqfd7lgA0J5BsZVP8EfxCG0FHUkE8VtGVH
	w2CGTqS8ksYiiodAMhUcPaEtjMBBIIMHyIJ/TZ5/ua7rOOMJ9q02nVK8S2fWGOoWGP/o2xQMckt
	FTjCf0WhQEdQ0E7xsJ0xLPtz8AFYqwBaBnyDAX7Ru4zMByAN1zbbSIe+cKOzwt+jtYcuj3j2+Ej
	ootoqWmWuyg5WiWaaFTKYg55c4GODJ9ywkakA0/HAwjScczy540rqb28hLhl6EyUgZBJJpmI+yt
	4Wla+hqlZMIeeRkDgl6d6PiCq4=
X-Received: by 2002:a05:6000:400a:b0:473:823:1924 with SMTP id ffacd0b85a97d-47df07f7654mr3574332f8f.39.1783531744610;
        Wed, 08 Jul 2026 10:29:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca98:2759:6fb2:4aa7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm46588469f8f.2.2026.07.08.10.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:29:04 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g047: Fix PCIe dma-ranges memory space code
Date: Wed,  8 Jul 2026 18:28:49 +0100
Message-ID: <20260708172849.227915-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G3E SoC supports up to 8 GiB of memory. Update the PCIe dma-ranges
property to use the 64-bit prefetchable memory space code.

Fixes: 1ac57c9830cb ("arm64: dts: renesas: r9a09g047: Add PCIe node")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 310f988a63c4..73757e8e2197 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1447,7 +1447,7 @@ pcie: pcie@13400000 {
 			reg = <0 0x13400000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
 				 <0x43000000 4 0x40000000 4 0x40000000 6 0x00000000>;
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 2 0x00000000>;
+			dma-ranges = <0x43000000 0 0x40000000 0 0x40000000 2 0x00000000>;
 			bus-range = <0x0 0xff>;
 			interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.54.0

