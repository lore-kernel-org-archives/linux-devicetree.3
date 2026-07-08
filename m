Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C99435EC3
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783528398; cv=none; b=l9epNRqkOedhh7y7l94SIaGQBw5xTOs2JSWDDZ6+/Te3lU/f0tr1rs2pK8nTPhcQStuqG7w5Mg6yTFaEjQIGlEa/cwn0J270lhoGjEHhaeWiqu/at+LoZYqHv+z7oKzuSKYab/s5JCsfpWn/NjSOIfqZCd52XMfYbLko93mzcaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783528398; c=relaxed/simple;
	bh=wyk/xM3ADbKZ5QPCezueW1oPACFQtAd6OjaDEzyDxwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QjLNxAaL6AbzKd5NzOlehcp1wN+NEJ5h1NZ10dHupNKzQMCAb2yKS/TRNXCKnp9XgXwSxqIRM+0rv1hXYgsfFKwGbS+4zo96xA2TG3SvDTWqWOuBshx6Jj3bZQNaysH9Qw2RJew+0WSZW1hBFROhOfP0mCpr1T2cCqS8Fn1mdUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbOYI0aT; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbOYI0aT"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47df4e62d2bso148200f8f.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783528396; x=1784133196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBjGhmS+fP7ovy2DuZDgJwEAVTUlrOrDD2aUojFKQQQ=;
        b=bbOYI0aTu0yDjfP3gWKH+PZiLPjb0d0fgVkXTGQpc6rc/eo5m9OOOsYLrhiLRx1Kg5
         HThNMiUU9/IuSzCkaaJ94KUKMeEPGb2vBDVq9ncT2ZYlRIpghC7WB5BRUja5323N0skr
         GGJw59x/q6O/mOIMaJLiIRsluvRXViyP8cm/MnUkuz6Ds+IZPSadt56nStUqRpvZus23
         gltElc+XT2IlMp7UWsX9HtQQepQ4EEl1n7S7tZxVzOTk6QN+D5t6339bRFIamVaudNct
         UYKrHjhE1vImBUhEiuwUkJJy+69WhFDAWgAhYq5pT1fW/BdDqXni9KiJMZlaN/proExS
         hL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783528396; x=1784133196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBjGhmS+fP7ovy2DuZDgJwEAVTUlrOrDD2aUojFKQQQ=;
        b=DqcouRhL0bKSCTc+onhux0WXg4MmrBm/RJYklL9WCCTVkFmirtzxTBtN+mIRbKwA1N
         TULVB9FQ8Z4SsijDXsny56dSh1s/UQtj8euTEe9huNbNd+qlMdKMZd/pnVLJnqmidpLY
         cyY3Mi3TVwm3wtD15WOsu3M7BlN+E/a1NF4v4o6NC+nDo1Ep4ESc9bM97WS9ceQykr/p
         QxCZg0crbB+oo06x7uX3uNqSgIDQg5J8nILcHKZT8Q6ONHVDUkjJvefNEZDD8CbEYxnh
         nIyGMM0JhyQ7TYpCxCFbT/w6pnRtuF5Kaf+SLPcob9LZyGPzO00l7/KvEMmSpRCafRZJ
         beLw==
X-Forwarded-Encrypted: i=1; AHgh+RqEVppE04wpQPa8aJq7UICFB0ngdI9IB/D98y1HGKX29Sua8XbmTwNzoGIJIbPk+9Lh2zt6y2K5C4nH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1jYWIapYNgVfh12E7J6wUe0LbDWQgOexclIhqJWwNqzecHKLJ
	tFMmGU9EK6HUkHz66BBQSO1qHIEWGs0IWpR9Amtmm+g7qvzGURGxkWcH
X-Gm-Gg: AfdE7cluK6iT5+tJqV+IaaeLZzbES/to//f0fEa0a5t7IENuCMKLDSO4ahNljZ9eP1w
	e6I604n0cz1FDzoqK7s5b7sFobRPOp2QFmlzweRJNMVx75ShDO5bt2SJ1r1mcBDF0UxDA7EUThU
	LbjYk4n4eAkfXs4qCH0fhzkEgrv1bvrlKQqYaM8hhf4de0lUx0J4Y2WAfVs3YuJ5Sa/l44yOcs9
	5Dv5CE0HyV8kMCXguAwbVWEY/ahzuxwaFVs77rrWbLO27a/gktbz/yJopTHbAoFlW2fcxiemIYj
	0y4ZvWDKixAu+mpcTC72INLE57P4IiD8gx3GB7COLybMtMtRQ/7zb0u64Qodhl8SA7svEoiP6dw
	s2XMgdU5w1lkMX8XfQOBOO8uGTUPukJccu5wB+OrVeRZrMQ4HL7QGBFhfPYEST5wK/7/tDyYBTP
	aXR3So8+V5OY8fHlzRP6II9awNMb8HI/4wYsGoN2/HyzeFVSGB+KH5bpMySdNRoC/tJsUyQEP8O
	iWGhzHho5zs9N12MY7weUR5m88=
X-Received: by 2002:a05:6000:2303:b0:475:f100:35ff with SMTP id ffacd0b85a97d-47df07896e9mr3637017f8f.60.1783528395671;
        Wed, 08 Jul 2026 09:33:15 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca98:2759:6fb2:4aa7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm40184167f8f.30.2026.07.08.09.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:33:15 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe
Date: Wed,  8 Jul 2026 17:33:11 +0100
Message-ID: <20260708163311.222176-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708163311.222176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260708163311.222176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the PCIE1 slot which is connected to PCIe0 channel.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Renamed the node name from pcie to pcie0.
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 3c1ddacc0944..637fc92dcc26 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -384,6 +384,18 @@ &ostm7 {
 	status = "okay";
 };
 
+&pcie0 {
+	pinctrl-0 = <&pcie0_pins>;
+	pinctrl-names = "default";
+	num-lanes = <4>;
+	status = "okay";
+};
+
+&pcie_port0 {
+	clocks = <&versa3 5>;
+	clock-names = "ref";
+};
+
 &pinctrl {
 	eth0_pins: eth0 {
 		pins = "ET0_TXC_TXCLK";
@@ -430,6 +442,12 @@ i2c8_pins: i2c8 {
 			 <RZV2H_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
 	};
 
+	pcie0_pins: pcie0 {
+		pins = "PCIE0_RSTOUTB";
+		slew-rate = <0>;
+		renesas,output-impedance = <2>;
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
-- 
2.54.0

