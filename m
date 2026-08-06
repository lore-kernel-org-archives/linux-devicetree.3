Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7711444E642
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011773; cv=none; b=svrFakwJ0RNp46KF6CzqDtZ+kyyb6dISEiI5kvy858j3he8DVRraXtlUAJ6W9+bxGb73UOurZCGUI9/FAvvhSN+4suB5iCK1w8LDF6yaWzazJ+BcNMf/I9ZfDE4WS938RK1ykQqwzaT4xJfgwg8IeolW/HMRnjFI5zAeNZU9pd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011773; c=relaxed/simple;
	bh=gfkMS6eWCk5oR6ED6A/K8/atxPuQQfqZSoybnWP6lv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGmZesH8B86Ug7X1emsAS1vYoc26+r36AdtMli0dZf5+428Mxbi+1DBOmGy8NoAM5KO/aJsKYAQQ+RLaUi3xh2upYPXcTFntNIBN0CQYsmCXHCPsmpiJRp6cLx2wjZHbkjOPc4fgeEecTvqKAiEq6iiapZIydHpTPsxWMmn7iV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwDaPTy/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwDaPTy/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so4386645e9.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011768; x=1786616568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8zgSk0cJL2xA/gsDWtUjojCnhT9i9FEuOvZpCrKndJo=;
        b=kwDaPTy/4cr+bRkijQ2dnJPwIwhrL2Tmpa7EhrL1T9F+bverapLdV4vThRhwb4swDX
         p4MG6KV11I1ObzxE9wy1oxn45SX/LyofyJDiG8JX0qDVRmEK701lpYhXXa/twPk0fFUS
         hOrz2WpHv1ptq4SDWb6Tofx6uw+hg7onSPMGZ4RCco1p5fEN8DIdkiGrzchY5K5uAQ+4
         lz/hNUoG8RHZ5PRZrER+5qlnYbN9qhfD7V7dZKvGN9XuUxL2dFON30oCZoVQt/s2Ns6H
         99vUPQx4QSsq7oRLgWqfpkABvRzgHRyfTdLtQEXKdRAYCIGLBYPUjBOMY/NBXH3g4B8O
         cIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011768; x=1786616568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8zgSk0cJL2xA/gsDWtUjojCnhT9i9FEuOvZpCrKndJo=;
        b=Obv/ymUdJvAC0er0QKgtclberg2EHdPKSX7HDvmnJpVX7Nha2xdvTqQqO20J5qNCIB
         f1yl/KYHQY9tNUNVReuLi965ehRdJp3aKNZKGJFBRUZcjgoGGPh5aan5mEsDZl/MTvbQ
         e7Do2RxVbNvqoS+e2YVEJxMyICA6SSMJp9rKfyBCul8f7rQgje4PxYPQZm22BPcaYq9L
         lHa1jAChhRMI2yWi9AYCAmMqBufe5aISNsTcIJ+vjWB6GpEk5YCtqL7jzuVXLVNzG1qg
         I5+3dzo11hZWtLP4JCtua9xGBV0nmhJIEJzM1w9x289zmsILDv5ql5goM3QvYQ3n4Vbm
         Gtjg==
X-Forwarded-Encrypted: i=1; AHgh+RqjRgBXf0ivH/EUcLnXdrZp6VbmOhT8EmSHwP2Qzacg+fgbkZ3YIeElX6II3swzX+Mqi4ERMd+r2/LS@vger.kernel.org
X-Gm-Message-State: AOJu0YwK32QjyqompJiXHanZBccvMJyQD36spXr/bD5kJeX+30FDsW2a
	Usf+pRPfwfUd7TdX7t33iqYjyU9z5d4ftG7+utEe3PRuy+uer7Zk09wjQLT8KA==
X-Gm-Gg: AR+sD109tozkPa6XPUhx/O3E54UPmD/52YW7YaGceH3lyYezY2vU5GiQB4a6sHiurKL
	LOb/PZXSXnfD4btpjeZJhnQ21Q5iXW8zSJN0eowmQ1uTSF42393gDG2/OPs7TF52B6kK8yxXlqi
	o9LWqbQNv1DAIL/iq5ozEK1N7yRM3Bj23I6Hx5dGCUSoCqPQK2ZgnpN1HByd6vzxZVzSUEORb74
	PEUe6q2khXskrx8xt8PzNkyux+i1RXR28MOIWiqvjvfFcCn1OeHLGG7yjEOuwmRS/DIPMYqZh7z
	ZZhH5Q5QJZVB6KrF6zrvjgrGZNQhLTu3KaXJwR3ziDFNHsCcaCaSmKpdRaZfNYtAa3fXrFq5V0y
	hu+C6Z1gRP6SKBmuiUyMu1nFL2uaZgLLZTsy1pFwQChKr+ryNd6DquSqF87YhElHdxzXZjYYgUJ
	GoPyekt+g8I7yX/rxVzEN4wZY4moYJLOfT94g89LEe6qljKBWyOlaSk+I4EUsBbFqUDQT1lqKln
	kbzTLPmGtRk
X-Received: by 2002:a05:600c:4ed1:b0:498:1577:e11a with SMTP id 5b1f17b1804b1-49952ef4740mr63833245e9.5.1786011768349;
        Thu, 06 Aug 2026 03:22:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:48 -0700 (PDT)
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
Subject: [PATCH v6 10/10] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
Date: Thu,  6 Aug 2026 11:22:29 +0100
Message-ID: <20260806102236.149159-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable USB2.0 on the RZ/G3L SMARC board (r9a08g046l48-smarc).

Port 0 (ehci0, ohci0, usb2_phy0) is configured as OTG with
usb0_pins pinmux (USB20_OVRCUR, USB20_VBUSEN) and usb0_vbus_otg
as the VBUS supply. Port 1 (ehci1, ohci1, usb2_phy1) is configured
as host-only with usb1_pins pinmux (USB21_OVRCUR, USB21_VBUSEN),
usb1_vbus_otg as the VBUS supply, and renesas,no-otg-pins set to
indicate no OTG pin routing. The phyrst USB PHY reset controller is
also enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 96cc7ee46a6a..b189ae8e808d 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -87,6 +87,16 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 #endif
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -138,6 +148,20 @@ &keys {
 #endif
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clk_pins: audio-clock {
 		pinmux = <RZG3L_PORT_PINMUX(H, 4, 6)>, /* AUDIO_CLK_B */
@@ -259,6 +283,16 @@ ssi0_pins: ssi0 {
 			 <RZG3L_PORT_PINMUX(H, 2, 9)>, /* SSIF0_RCK */
 			 <RZG3L_PORT_PINMUX(H, 3, 9)>; /* SSIF0_TXD */
 	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZG3L_PORT_PINMUX(3, 0, 12)>, /* USB20_OVRCUR */
+			 <RZG3L_PORT_PINMUX(3, 1, 12)>; /* USB20_VBUSEN */
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG3L_PORT_PINMUX(3, 4, 12)>, /* USB21_OVRCUR */
+			 <RZG3L_PORT_PINMUX(3, 5, 12)>; /* USB21_VBUSEN */
+	};
 };
 
 #if SW_SER0_PMOD
@@ -330,3 +364,18 @@ &ssi0 {
 	status = "okay";
 };
 #endif
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb1_vbus_otg>;
+	renesas,no-otg-pins;
+	status = "okay";
+};
-- 
2.43.0

