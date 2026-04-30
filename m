Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68870410D29
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553634; cv=none; b=XQiU/FtSez2MC3yI52V310dp1n6q/EHn2NstcnI/C4UqXL5vpkyD+1muZmtuAHHdHJk0Kwy1lses0Cy/I9F1Dpy/1VDWRg7xyYYY/pnyAvLLFcGsfTuZep7eXB7qnIuKEk7aDKMW127lon4qFSarW6Gktn8S+gnoDWVz1kLJxNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553634; c=relaxed/simple;
	bh=INKQTjnc4gXfGLcAFwX/mVmmHq3ablouYeEAF7QF/bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJ4aadX8dmhd5ZsjLVVwe9kWaw9kscDJ8/DhckVPjprBpHn/im9ZMGY4W+ox899oA/Xd3hh8mOOIz7flvzgs4oaNpLHIgOO//R3nkuGqp/KQsxt3yavbgsWw0jB+J3CsjF//ArT7Z4A4NGdY+u26K08HB2l6V4GKLBLj58mfriU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7EzO455; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7EzO455"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so15010845e9.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777553630; x=1778158430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ta/S7lNS0mA62qqrUFlhRV3CLDAhS4Lgnzi4/r8QKpc=;
        b=U7EzO455iDhgqDQRvEvLm2MtdnRjTsrx+CwSkFjraEzaULyBNtkkgBoEBmpgTIKksF
         cmqweK+92BnTqUhBAFai8RCuKjq3zk9dQrbKznizLA646+03If5m+Y88WXRHxrHbUrXV
         56CwX/HgKvCw1YvnOb09aOhdu/sIxZQ5w+MEZb+SHknNwjRnnYDDpnSsMsCfifq4FM2l
         sFYeTOb94I+6giRr3J4YFzMP0TVJzE7+ZlA0dG3bbUw5qDBqgpkALbGoRGveB+tU+1ek
         qrBCQKNFZebARfFz55u6WndDr/hrvze55ZdH8qZvlRS+I8eEuhH7IB2OxsKQlLVccQo3
         lDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553630; x=1778158430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ta/S7lNS0mA62qqrUFlhRV3CLDAhS4Lgnzi4/r8QKpc=;
        b=IvqH9gNaEBjzbpGKNfvYV9haS1F2MKUmBjcZCzS0ni7mMYtGZdb2AskWnWUFvFFAe0
         yYio8FzvPCu1vDuh/ELzvHo4d70LkFjihV3/78squ728ugIPOmv/ycD7ugm7xezpjRcC
         PS/fWypgB/UrD3w6Dg3Q9Sp+iGXP2GwkQiKd6NYsXcOv7siwmdbScqTcW7MG+izDSmeS
         AN++mKXhddNu2321iog+vEDhDSTg3+D7KpmPGDQrZW/YQLRlIChnjhjpO2tbP8ZG4CTD
         fWqD5wv3q53Kt+m4kuRfbh2lnny669zFR58DoHVhAGmTFLsyTnpKK0bOJvKFbH3if6Go
         QuNA==
X-Forwarded-Encrypted: i=1; AFNElJ+8GS8nXHd+IA4oN7cRIkjHnBOT0CsSmrv0i/98Wx2HHi/dHdpICa5gsMOcYnXUqzls59RMSqNG2ROy@vger.kernel.org
X-Gm-Message-State: AOJu0YwDt799lK2KpuShlWi2eF3WXgM9gNq+HTk1wUgiPNNmGmuuTIBg
	cj7WWkNldBinLrCx5+91Sogf/BMgbHEHeiaKfpVKXaXzgLKyF++fvTq2
X-Gm-Gg: AeBDievTgzwfr7dOQhJLelRA9XQj1dwxmC28fxCl6O5ODfK9zE0iVywtw0PQnr3WdQX
	kyBetIvSe0wQ1FdOk9cgWGR8W6gm/tnqXiRWh4/tf+V/Z/5oyVq5Js1SZ2wrJ7dqLP+DSUtmoLG
	3XJHJRSbwqJCGK/4FemWTlWlojM7J9aQ9LPOHiPaCedWiM27fUd9l+epK1M9x69G6Vdl6KmK3vJ
	4ZO/aCEGeBcs3rp5kp0UpKaYnlgEf8g3CPZWe4c6VdeiZtYUFMOgaD7yF+TTeePvIPkOJF/TTi0
	zMnokgnNyXg8LbbSBCr/zwNhIivb9EBOwiPbZ5gVrp3xYdV4jjjj1aKI/kdDbuoSCgJSHitaTED
	L7qmjURiaNRsrM759NOl+drK1MdV/7hiU/DSbcQQPk+TX39CZVf2X7c2GHS6LJEc20keq7U16sk
	eOruyRLVbEP3jCVF+Rp2vAa3gyr/TzcWPcB9VjJAfCuUfyUYBrCg==
X-Received: by 2002:a05:600c:6d2:b0:48a:7b7b:c2b9 with SMTP id 5b1f17b1804b1-48a8425667emr27776485e9.4.1777553630392;
        Thu, 30 Apr 2026 05:53:50 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057ecsm40995825e9.20.2026.04.30.05.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:50 -0700 (PDT)
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
Subject: [PATCH v3 3/6] arm64: dts: renesas: r9a08g046: Add pincontrol node
Date: Thu, 30 Apr 2026 13:53:07 +0100
Message-ID: <20260430125342.439755-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add pincontrol node to RZ/G3L ("R9A08G046") SoC DTSI and set the icu as
the interrupt-parent of the pin controller to route GPIO interrupts
through the IA55 interrupt controller.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added icu as interrupt-parent.
 * Updated the commit description.
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 232a0e299df7..0cedf5a38291 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -204,10 +204,21 @@ sysc: system-controller@11020000 {
 		};
 
 		pinctrl: pinctrl@11030000 {
+			compatible = "renesas,r9a08g046-pinctrl";
 			reg = <0 0x11030000 0 0x10000>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			/* placeholder */
+			gpio-ranges = <&pinctrl 0 0 232>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&icu>;
+			clocks = <&cpg CPG_MOD R9A08G046_GPIO_HCLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_GPIO_RSTN>,
+				 <&cpg R9A08G046_GPIO_PORT_RESETN>,
+				 <&cpg R9A08G046_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
+			renesas,clonech = <&sysc 0xe2c>;
 		};
 
 		icu: interrupt-controller@11050000 {
-- 
2.43.0

