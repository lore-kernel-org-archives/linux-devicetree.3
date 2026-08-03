Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF70F33FE33
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774818; cv=none; b=CJgMy3NB/qgjhjJKqxrCZYwKM6EsARDJWKSKfp2Va0PVXLsuDrCr+e+iGmoQfOyhWP5596Xb8fpl0aFVSsxd2he1EPEgXh19EKZy4BlZl5FTCYI730qsE5E6ZJL2O6XThp49Y4GRsxYc88lN977F2F7pHmWx5nyWavNtEDcYodI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774818; c=relaxed/simple;
	bh=CJ30TTtBZNretgYhQgM+OVQp5KZCxXimsEsM2yrGCWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahJOyn09InwkpvmMl1zDhhdnTnp/kPk49WxzoIUqHnbpuax9F5wY6W2Ux02vy3YZfaCz+LOl/ubrxFiYpYqJ0S0WdHsw3B6Cs2TqR9AGo7RDnXNH8GHwiOcRJnZkm22I7HSLgd8aRTDhYBxCX3pLSqNrq8Ls8lDT4TZtwRZ7vxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Izrq7ey8; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Izrq7ey8"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e2061eed9so490244b3a.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785774816; x=1786379616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nFawlb/mI58C0kLJAoZYOhtyyWVaA7JzPyRY0wueT1M=;
        b=Izrq7ey8UVtBjO/K/rR5+1VIamPQDpluKIl5xwdlrVZmjt+YwDX5I2MT1MUd0GR4rS
         M7nYKFs9lXydFbNpyaMMI7o5Rf6E0h28W96+sVkTNxX8Bcs2udApqPJJ6Vv8sgseMDn1
         MveGEgZaE41wek5gkkhn9kTWYchQGQC73xxkQFOs6bFlTlRR/QOQ35clcFeq0/sLmNct
         mx3U+GSfi/9ahNvEbQ8LMB7oeHhd6QLhr3X62i73CqKF1qXwAIp0ij2JppQNIkAPn3lk
         gYSuMUUCgSDX02vPgPyygrGuDdLEzMx/ung7WlSZYRZRGmks/WxUNbADHcdT3kIBKrWf
         puxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785774816; x=1786379616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nFawlb/mI58C0kLJAoZYOhtyyWVaA7JzPyRY0wueT1M=;
        b=Jd1iATTRw6Wuv7JWltXyfYHwQDephvGXyUnnB8nJ38ggeWRyobZf2SRaDxQSNizoeg
         pO1FoROeu8NVtuzsr6+a61dlHYsFqaMAtiYW9R/4LNNcx6L2V7cI69PDlbxYvobr8ADZ
         wHqKH1Y472nbNz8t+U9C7TNNF7T3TbQVxezs77gyeEIqWNtDlLDt+B2MwUAtPmEiGIUE
         gMJCkCA06LOmoRzsNFWpoCmti3Kmzq3RkW1W4o+Ut/fTZb3j8QNt7qp5VK+pmss4lq4C
         lAcH3abIaNjlXE4bf+UrRNBI9AAqtMRMvT8gO9WONqfyv8bjlerLSGSc0TPSbPXwuglk
         3Zyg==
X-Forwarded-Encrypted: i=1; AHgh+Rph4U4WCO2V6qr07g8Pef2M4xupVP2CxiBbmn9SP3vBAdRRWEOESiT2soWG0XXfidA/VlORyMkdLEaM@vger.kernel.org
X-Gm-Message-State: AOJu0YyL5mofY0nTR/u7llyvCdGGWBRb5JYK4QhrTo95caD6wr7dTpb/
	lhSsdCSvyCKb07gMBjJnpRzhbP8/wG6bDE0SUMk6ikp3d/3phQ5o73q1
X-Gm-Gg: AR+sD11abKAsWS7DodBMwDexcHOU/OBmn+uLJTPR9p+LvwlWp3ru71/VehmYUVKkt8g
	TUiknN99FMpNqlz9YhUlGDAdKQtWhvhvcFbCbGt1x3qdCALufxpQKPYgVWNtOzRaAgTxIYclY57
	+Yb6Pw0C5AMOarTR62/o2h3Lfo21kfAm8LaApgEJmrMko/uP2xSYOmBbnxOK4dNKyjAnXvqlXB+
	KObWL8T2qznih5Rb15D1xWTHPIx/OnsNSMtFo9R1qLGMiU8C0+Xbcekt6/tvNA1lcCMBkb2TnuX
	h2pwmLj164upFTUTo3VUqvg3NVx/SoVY1RgekE5IB8u9YUSjDqNZqMwxJyX/YEKTlEs+Hht12as
	H0jZfW2ybboCBH7O0FcVDHhKLWpRtLaQ9I/2s1StJgpKFr8UdISM1TuO++viqs+wnLg4D3bfp7y
	feTU+HEVIV1ouV+k6tu23rht7vaYJVGrYFHR/GSEHACC56eYkbBZ9v1Jz0umvNhi7z3PPe2hjXJ
	AQ1YEkE5d4756jxZHKJ9BB9jGN4twC1Sq9LF8QjyAQaZC5Uo/VIF02NzA4LJWZZINjpBzKPMlSK
	4r/mVW625Nv8C3GwIz3ys2Q=
X-Received: by 2002:a05:6a00:4b08:b0:842:5a15:6fa6 with SMTP id d2e1a72fcca58-84ee495c2aemr12701073b3a.3.1785774816045;
        Mon, 03 Aug 2026 09:33:36 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe565d2sm4164845b3a.13.2026.08.03.09.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:33:34 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] riscv: dts: sophgo: Enable ethernet for Milk-V Duo 256M
Date: Tue,  4 Aug 2026 00:33:18 +0800
Message-ID: <20260803163323.74414-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SG2002 has an internal ethernet PHY, but on the Milk-V Duo 256M the
ethernet signals are only routed to the RJ45 connector of the optional
IO board.

Enable the GMAC and the MDIO multiplexer so that the interface is usable
when such a board is attached.

Tested on actual Milk-V Duo 256M hardware: the GMAC probes, the MDIO
multiplexer selects the internal bus and the internal EPHY is detected
at address 1:

  eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]

Link-up was not verified for lack of the IO board.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
index a2797c0bd767..1462a96a1c12 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -49,6 +49,14 @@ coprocessor_rtos: region@8fe00000 {
 	};
 };
 
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
 &osc {
 	clock-frequency = <25000000>;
 };

base-commit: 11881041b745b444e4f6c87a2748f1951cf02742
-- 
2.43.0

