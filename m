Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F2C50C2BC
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677751; cv=none; b=myuBDHQD9Me2YxAEThknCL1gug/4Xyci6LK5qD04Llz6vNUgbdwa3RhsRgM/0XMecljn9Ou43uEiUu4qKPlcXHbb7rGTnChNWpEe9errzy/js+mWg3nqejqhKguF8zYSLX3jZyqOSWNtehya0yoYmYh9NFhTF3eINbqA6PIcwJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677751; c=relaxed/simple;
	bh=mMiA4dH7y9LdOOVFFONMqDGxfntbpR+c/GSXExdAUbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LgncfDHXmzsDbxoWilOpAZDQxrxO8Q/2LWP0qU1Syof4bllSV+OmTzL492n79EXJSed0dteeZ/RXGPL+Oq217O4krUhgGIrHI/+7cYz/eCil+c5hmrfB5fJfeWouAWjWs3RmYA/DbXJRHPQrGtJLKHbZ/9XUI3oA722IZPzzGFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=rpcovV1N; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="rpcovV1N"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so37806285e9.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790677726; x=1791282526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dj92lTF8akr3d6vO83htUPeUraoOhuGYgiyg/qVoz2E=;
        b=rpcovV1NneIC9WvjOBZaSNa1hv8UUcoJhhBu1AcQAHlwzKRpm7zq9Ni4RzSwTzLIxH
         V3Kvudu49DUcvXyPUt0fF/A+su8LjlKVd/SQXkA7/ScyFuzNmdejwr1L0VVcqhbNvcqb
         Ae+jirL/+qyaCP6LhHzpY+jfafEQuu2mb2pcqXoXFVJ3JadSWmB8u5QcIs060za2G73F
         Pa554ATHqbtGzmoe91eHKNSMqTr+CDFym7PgqIvLq0yR4qa3Y4p6YgYXxxvCeiCrgCvk
         0o/0Q5kKcLnxzNNojBxwsqPFHo9zk1oe+YDVykvfc+m6QaDmNgjZq6dAGRqu2czo5lL8
         7BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677726; x=1791282526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dj92lTF8akr3d6vO83htUPeUraoOhuGYgiyg/qVoz2E=;
        b=nt9kQ2s9MzD70MP0nJaom88pIsGObbGyue6nOFki8UFHvSn87PNFXDvbE8sE5/sgtW
         yCK7saST0/oR4JUieaYblAkLcgbHYk0v3WouWuQjA//b5UOxQov1Ih5bXsphkBvnA+54
         TKuehZWmYAcmdur6njYvukqz8WFnmAjpAvYupR+Dp2i/VIqXKUR0FWJdIqHEr2zSHwEU
         Fs1SrTRfu2Ot77/qRWsvn1eCHn6a4iFbhGpp2jNQHNEcOwlAhPBNcTvZNpvA4Gs7UAh3
         yOMLn1H4bF1ien8xRK03MyDFjtviO3OGYKbksA3Zb0KyOXU6LgeDL+fYUIc2W5aTBzJ5
         TZug==
X-Forwarded-Encrypted: i=1; AKwUvBx9Im8wkEx2jK7DcPLUkYogMxqxXIdPdfSb7THh80uiqmqGLIojSwoualaa2tfyEQGy0DCR9vFv/bKD@vger.kernel.org
X-Gm-Message-State: AFuF++kNBA6IfBF20FEliEBSfx71qa0PGL7XbzA6O4zlk+8nucwd8rvS
	Y/lLR2z5YKeUDBmhveHp91YKKzLfd85MxYjOWLGw5TozFk4+ZXBQJgF4nIUkhsxC5B4=
X-Gm-Gg: AYBFou3Lr5Kn61Ub6bZT2k0sBllyjzDJw5CrDzdclAgeboT+js34iwPhvvMFJvFtmTb
	Y/JqZY9mct3BMnVC8CP3K7cyWp9KDrKSvyS+CsYXH8SKryEH/tyAK1GCfqBO7BszLs2rc9mAAYA
	gBCUJoWxjhegltSeIaotUr0jZUZ53P9xT7AAjxLVW7SMj4sCAjQUoEHAIvTO/Crd6L+56yYk3Ml
	XmbQqWA28KCjjfoHnJHB9WmDBy14Or8XQkioG/0wunKitsubRhGYr2S+R6VjpN/j2JDvXt9Y3G0
	xsSXai+JyC/SKgI5Qp8INmHcVE/W/vh6WtCAeqI1E1qgD7yxksI/u4ZUffluzv6A/Wd7A+pVL3q
	N/N2T8gIszxdUeSzaM88NG7sxbwnn2840DqQeYzltwqwf0d9IDq8XJFEGOOeLNMFJLdDOPCzi/C
	FvJeTGOjsfm0uhhrAXT3UMZrIamsx3lb4ESB9t26IZMQEBY+yTgsxyN2zcP6YpT3YXHghMKNhqN
	qvQDiPUugYrBcGMaZI=
X-Received: by 2002:a05:600c:154c:b0:4a0:4c7:e0c4 with SMTP id 5b1f17b1804b1-4a004c7e4e7mr94742415e9.1.1790677726105;
        Tue, 29 Sep 2026 03:28:46 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm66579305e9.15.2026.09.29.03.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:28:45 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:28:22 +0400
Subject: [PATCH v2 5/5] arm64: dts: rockchip: name the reboot mode supplies
 on RK3576 EVB1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rk3576-reboot-mode-v2-5-5a34ca72065a@flipper.net>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763; i=alchark@flipper.net;
 h=from:subject:message-id; bh=mMiA4dH7y9LdOOVFFONMqDGxfntbpR+c/GSXExdAUbM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtnnTpUMvFF8mX5jK+uFhmtP1CbqJ19qeLF2Wa8621T
 GK3WhkadkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVIRcZ/le3n0m/lHc7etP22Ijt/POniCazTSn5nx50xnHpou9ltw4y/Gb18fr
 gf9L+nY2A8IUohoMWDzb6vgvYa8fxieNl3MmiFmYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A reset that carries a boot mode request has to leave the mode register
intact, so it also leaves the regulators as the running system left
them. The DDR firmware that runs next configures bus QoS in the
interconnect, in CCI_GRF, DDR_GRF and NPU_GRF, and faults if a supply
behind any of those is down. The NPU rail is the one most easily left
unpowered, as nothing else on the board needs it.

Name every supply those blocks sit behind, so that requesting a boot
mode powers them regardless of what the running system happened to keep
enabled.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index 4c82980a9f63..55951f290906 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -957,6 +957,22 @@ wifi_wake_host: wifi-wake-host {
 	};
 };
 
+&reboot_mode {
+	/*
+	 * A reset that carries a boot mode request leaves the regulators as
+	 * the running system left them, while the DDR firmware that runs next
+	 * configures bus QoS in the interconnect, CCI_GRF, DDR_GRF and
+	 * NPU_GRF, and it runs into a synchronous abort if any of the blocks
+	 * is unpowered when it accesses them.
+	 */
+	ddr-supply = <&vdd_ddr_s0>;
+	ddr2-supply = <&vdd2_ddr_s3>;
+	ddr-pll-supply = <&vdda_ddr_pll_s0>;
+	ddrq-supply = <&vddq_ddr_s0>;
+	logic-supply = <&vdd_logic_s0>;
+	npu-supply = <&vdd_npu_s0>;
+};
+
 &sai1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sai1m0_lrck

-- 
2.55.0

