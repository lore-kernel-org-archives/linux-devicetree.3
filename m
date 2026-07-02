Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A4A480DD5
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995494; cv=none; b=gWHFKF8KVOTuSGvs2nmEyhZKtFlO6JVM8LNNGo31Ox2PxUiy6sKqRAXpaSQFCkM+RhkSyzXjK3NmGyT1bZzsTp9cwOfwNRpLsUbE9tVz/lgvUETm7AkcGGk7pLUtaLPaf7a9+pSpXn8fKCwiE5Z8lxYSzobIP0lgSj7SXoeDMSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995494; c=relaxed/simple;
	bh=KlT+vAqF3fImgRh+vi1G/HlEXKdYDmQI0eT/ODYlQg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PM3imRwQGRQHAHRuOXmv75/9PBbJffJGLZw4+/Xtk4tmSJPY4AZNVnCpYrn2CPwDkuNg2vk96F2nwU6T9u1Y5pBSpmeul6vz1THW5gu9xuK4NsB9Rq1NShJjiUzrYRux6H8klIzNdKGFtZMNUGi6biGvJSL/zcU7Y5Kh2dhqEbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ice2rAme; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ice2rAme"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-470174001a0so1305428f8f.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995488; x=1783600288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mht4rxb3FmKDNCITNNMglstOGe9jBi788HmIfrM2viw=;
        b=ice2rAmewA/0cKlxCDUKDKvdKv1h1+21KuCop0o38Q0McCyZhPPs4Tao41bKvUlh1Q
         RV2vfQNep18XHuZ5Uk3kOjZhK+K6tG9YroLfv7DJYHNaWiTICOe9hLP7EgheH9FoGEFN
         /+bUiETQTDwHKwookLXP63o9/mz0mvVJ/gWzoGmSIxuH/D6XqJFQfgyQhnMGDQ2R4xbf
         +N/ZTLVZt+bCR4dP+vwhcnk3avtSiWqdYN8dwMsYbPv7Q2zB9zVfiWRTG4KwQP0FiVeI
         fuOMNw98y2myMypsIufofeJR1bLCfKlejSQuss48UvQOR85OZCeiX+c+HQKkPnpoAqiy
         WVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995488; x=1783600288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mht4rxb3FmKDNCITNNMglstOGe9jBi788HmIfrM2viw=;
        b=qoNgHsMwRulivxx/AAp5e5/N2jb7dLCQvhej24DZY23ZoZZTpk4wd3iV//9AdIod/Z
         j8MjloN0WHwWuSVU082QAc/Emn3kwfK87COybHVJUC1X9XYt3cLNacIcgY9F86d8BQA7
         obiCTTUxhYMhTPO9Mr13rFXe7HtfMNcMlfCZe+6SrQJf/y8u+XI0mT/+rWq/yYn8FPO9
         cBqDen0Ol3OQYK0nqzarA1o6ZC5zo0geQfrEIIhUcMStS+Fv9jo+8Z3UfZsTaFe3aWty
         esMmhDs5dJ3ADgjWoGi0ChOr/oyFR9rr1GH5b01Xfib4+wP73wJCwj0sM14CW4PaM/Ko
         SwNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBz3UNqTVsc2vFmtYo33SMN96gHFRTobz2qACecoFMHt9BFzhyZXDM8oooC4QJia+ZKihaYU/+a4mn@vger.kernel.org
X-Gm-Message-State: AOJu0YxT7R1JWXet7CxuBK+0pKM2Xmxtf6UvUXW+1EE6qSFGSGol1bY7
	0qXqh77v3EDSXhaLGkBtsxdGZKlUPgMDmM8/8HBQLOuA8E/qqbTKTYON
X-Gm-Gg: AfdE7cnJNMzZ/wn2xAW8ycoD3kARyukJGdQZm8T0kCRC6+l801hKETSDZu7fFC9PYlv
	2vn9At8H0k8/KJ2iNaXFxvQuJydX0UhcIA0zrNX4KGW3bq1VmMUgxo6wGS0U9SfZfT0YnmFSc5w
	gdV/BMpxXSBlQUww5cqWtqYx561SD94yFYB/OqPu0CkhrtHGdvHpxT050o3syv+jG2dzJYxvalg
	5wjJ1Tpr+j0j4dphHTVcmSTa1uo1Et5w3yfMToq8tWF8ofnm3EVrO4QvtcT8ithqK2Fx6qBvM34
	YSV7MngcwBalG1126Enc8FLJPupBdlQv/HsYpQ2+w0xBAdItM3Ww1OsJ7RsNsF999Yz2vtp3fAE
	gE7i47mk+TqtyYV0K5AYlie+pzCf+NOY2HeOktsOarbcXEeWfQbx8oxmR6h/+408bz+0ucRSZ59
	tu12PCKIY2daAeg8hlrQJdE+MmW3BR4IxPUaGnTsS46sSnnXJHCPJhiFB7/Ng6Ngs9ghQaF7tFU
	tjyL6xkQLPWnESNvNWesei+aYw=
X-Received: by 2002:adf:ec49:0:b0:475:f0f0:9ecb with SMTP id ffacd0b85a97d-477b5d37949mr5581503f8f.54.1782995487566;
        Thu, 02 Jul 2026 05:31:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:27 -0700 (PDT)
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
Subject: [PATCH RFC v2 3/9] arm64: dts: renesas: r9a09g077: Add system controller child nodes
Date: Thu,  2 Jul 2026 13:31:06 +0100
Message-ID: <20260702123112.161160-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/T2H SoC contains system controller (SYSC) blocks for low-power
management and access control within the CPG/MSSR address space.

Represent these SYSC blocks as child nodes of the CPG/MSSR controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index bc109035fbac..6f4c1086afcd 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1055,6 +1055,20 @@ cpg: clock-controller@80280000 {
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

