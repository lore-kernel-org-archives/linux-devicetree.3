Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E2F51A12A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750497; cv=none; b=QfEGTgisSz+pQylETdc2L05CK3hzzHMC3WV+C0qU2ZTbzmYCmt/ad1yIdol+PfHyB9b1U69q5KpYt7mKs4jmB2/svDcSRENrKiYVGqF03/unbXWyEC0/Uo4S78Vznptcl12AHJQf/q5WI5REpBbNjesA6Dl0BYCNDrONwSkBuUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750497; c=relaxed/simple;
	bh=QBrUOsRZe10rMUp1TXePAvpVVpwDarhSFSq4iF1D2Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKObH5Z2WLnURkhpqpilhc8Bs4IZ+UQocz1Hl5v63eZwAuGB1JKuSl/3P06ADzXJuI4DxwswwN2A3Ituw+Fo8la7ybMokzKav/ji8kv2d9+LfvMKR4UJX0HfPGASCBXztOdAftUB4hYxR7NgY9v6RRJ2o1ZBTHsE5Y0jiVI8icw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bh0CWQKy; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bh0CWQKy"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so622361a12.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750493; x=1790355293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0V52zqrzqSXOjtcPE4YmALB+veTpIXrkLmMEtjpOEI=;
        b=Bh0CWQKyvheAwGb8oGfMpm0enrdKR25bcqW15Jl5H5yXioBXcrUsSD5upvRHKwGq8A
         Uf9VmneIc5QyUcUxjubScI/RHygfXmSXO2izZhVEcweqw7KMGd7eftklx+shOGX6f7R4
         W2Tmghn6vw3UFGuH2qihM+80B0yki0QIoZ/XFeuc9rq2F1u9Etdua5KUqsxEW1gzxOlc
         yVsgrn4/3PU5V7u+FXGxLWN2qXPNRQu95rVo0FpaHx2xpIjambFICN0EjQ1HUXtBmr4J
         S5qqZRRkoz6DVpKUED1NvUyFz2JPs10lvaBYe36UjSk8wS2TivU0ybBinTITk+yq83ks
         medQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750493; x=1790355293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0V52zqrzqSXOjtcPE4YmALB+veTpIXrkLmMEtjpOEI=;
        b=WLTGMtx3Xlqf8LLrIfY0zs+D5eENeZkLq9jPOAqb65/uRB0GEelkGgmmwdspFu7ueP
         c9dagXoHFf70M1J+sUwaIzXr9fz0LmElH8aD8gRcBRmzKc68ZFS+INRsoh5/TcjgSJW8
         +nRDNhzFebB1h5TKyko9sqAsIdcXfV8o9Xy0HkZ81fLSXp/C+ruhWmuUXCy3PTDzKVlZ
         YJwLk8Ex2OUJx8oZrr3WOCItIUaC2aGRfbZoGLie6qLIM6+uDlzREuhmdI4fOZHkhnKJ
         0s3uAE9Vuq5SO7ctYRtW3B7DcigQAVa4rodxHo84bMA7sDX5sHBUvbiwEaKm0OxwcNKv
         Jp4A==
X-Gm-Message-State: AFuF++mWnqDXsx+6838qQn6M0CTOScSwHvbm+P68FcJoiph45kx21Xhx
	DfGH7r1Vtz0HFwlMj6XkzDCQ/NZW6SFi+13B3j+64hGpIqvz3Jd3MI8L
X-Gm-Gg: AYBFou16uc9Ncx61JA512Iyz39vdDhw39igXvoZ99TiLe/STqa50Kvhjs00gEWXlGQW
	evZnyvP3PJvh2I1thgfSENdCkaFYHH9cnDeUTIrEBgzvcxuzSh+nt2+Er3neCrrt0PFwdGjFLlF
	PPAnF122X3Z6/jlUoIRJh+TE1zxJMetBrGxXixnCH5erlut7NNc5GDxeZmvxEjVpMgN4tSRDnaE
	RgCwLpBf7dNGguW25Ez7fkLo/vX5g+pZcX8/Cgtd8z1nYimej+aN5+7vC8M8vO9yzyYL8o+5oGl
	YTDsxpQxLxVkUdceuUxN/TKERqEDp0bBfp6/4okjeDAYtdtMdn7Rh6tA3hMWGwyRkBbiXTmeFZm
	wYxjUtWqv2aizUVkbF0RcuG5PCAzPGvYdEveak3xQTw6uNuUMVCyGB9TxiG5PQalmRZM18GrrYG
	lulbqUD8e6Xa8XfY6fg+UmH153NzbN/m8/EUhPd+onKbHTfFiIDZ6A1yQcwATutvM0tkcsonrCA
	g==
X-Received: by 2002:a17:90b:4403:b0:39e:6a81:f34b with SMTP id 98e67ed59e1d1-39e6a81fd03mr775333a91.37.1789750492700;
        Fri, 18 Sep 2026 09:54:52 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:52 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 3/4] arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
Date: Sat, 19 Sep 2026 00:54:13 +0800
Message-ID: <20260918165414.1129076-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the pin groups for the I2C0 (PH0/PH1) and I2C1 (PH2/PH3) controllers
that used on some A523 boards.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ff..0ec5d19f7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -147,6 +147,24 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			i2c0_pins: i2c0-pins {
+				pins = "PH0", "PH1";
+				function = "i2c0";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
+			/omit-if-no-ref/
+			i2c1_pins: i2c1-pins {
+				pins = "PH2", "PH3";
+				function = "i2c1";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
 			/omit-if-no-ref/
 			i2s2_pi_pins: i2s2-pi-pins {
 				pins = "PI2", "PI3", "PI4", "PI5";
-- 
2.55.0

