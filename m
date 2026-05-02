Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FD32989B7
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 05:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777699180; cv=none; b=eaQJjBBZwYkS0k6WYub+CdZsyNUlg41sI3lzMpqiVGhYCDbDi0WpmuFkpAkhVDTVsiaUacejAbM8YG2vCGamVMBRBntk6/H2SrfLiy8K5RgwASA2AqFtl5YLv0fV9SOyEck34DpmTDXwfgG/JdRBVIhq7VByobS/b4ZD072dqUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777699180; c=relaxed/simple;
	bh=qtCc8l42iSpmlm+/TE+Dk6gRBzfUYNmSbZRmXlS2lcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H8fc5s3xUaT6MzXrEp/WyOT2BIADmUvezU/ZPzGLatbjD54IDXC37W+tnh7FMaObMytAo+0qPv14wbu4KDRZ9q1h8zYp4ekGKoBIyxIMYrPcHus46/9qJ6Kg7d6QxtgyGtX1LOHr16pDeV+l9aC/+sVofgy+1kEHbSWF5ckNLsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbGj7iYS; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbGj7iYS"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82f4a53ae20so1773081b3a.3
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 22:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699179; x=1778303979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st+hd/tvQPpc4k0FLAyCqH2PohSvbWSzsdcaPi3SVuQ=;
        b=AbGj7iYSsdLyGbPs3EyhaIwdxMr/U0XiZH+RhcUlG5mXAbkgX148WS2JfA8XZSp96l
         6TU710hoIfJnHBaCwGnMC9TUvZqT3DqlL5A1/YXFgjMjsMSdeNbFmjV52hKGqdZM2fbR
         DTEHqA+FyTFt7wk4Q0oIPyNZJsbfeu17HOaeJSw2vPk8bD32a4hRZMcSde/VZr7DyPRZ
         APACbORiZYGgJI/Az/iAX20yM+ejztedvY3LSjfrrbd5NRO/GiikSpcOrqnDL/6hv9V7
         BRn4wWC/M+IScjrbhVKmixGW/Fq6IMn9ry/pvVsdPctD8/PAnDqGdU+P5jfPrDaE8rpM
         1hyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699179; x=1778303979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=st+hd/tvQPpc4k0FLAyCqH2PohSvbWSzsdcaPi3SVuQ=;
        b=rjIGMzD4yo14zwbJGWbnLlqmW063Si7of8+dXfB3q44hKBrrf2oLUQmAB7yS7r+Gij
         miQxNrwuD2xAZrn0w1H/CkxGHiuBvzIsI9Xdi7xHSjIgzkloweIpBNo1sjCbY3Gcw/2s
         +z/KFUh3mm/Has8Jr9vYfWlTyAXpVjkEHfghwUTM/qwFOvUjbiydETToSI7IHfvv9U3x
         /NLehiqQ1itzU/79gT3WUrw/f674Vh9dIzwLMUNlzFKoH5uxaiTZUbDAUJuCYvpwXF+m
         e1AtIw5y6Tzzysx8MmzGGDbE4SvqaGJ7e6iVABuBPeJmPeIV71QrKR3KaA+A3M5iOu40
         27wA==
X-Forwarded-Encrypted: i=1; AFNElJ8nFJoLggwih/ojNf78PWKKbdODNMPsqsore3HOMUhaxXJJc2M0SnJQi+CQrDvZfnBveBLJOJyOUORT@vger.kernel.org
X-Gm-Message-State: AOJu0YxOUoBdRdo14fdhz/Kug/rRv9ClQBrxcNOZpiwHTwacpOYRj9p9
	bw8GVZAvLCi+qz19kq9i3GYoah+Tyvd1JPXQQ0C8Kf5KMueI4HiMZzxE
X-Gm-Gg: AeBDiesO5NQ+IimXtlWq542HzKPK2OPet7IZriE6It0enMqTk5Xq65wN8dF89mIzzM6
	lhFJefwBIczFy4cfRHSi9L+UefmYHPRjiud98CfVdT4oYZttTZtby/ji6YsEOcAmQdcseh/+WK2
	KOufKiqBRaWiAl2LqIVwqCxPWIUiOgOu1VZEQJ1PPvgTaR2EaxPWAj0B53UfzAMR7LjYo4/vvGD
	fcqClHbAwhJigfvBM+4Ya1LnkLTwWtbpROLCUBhCNebd2DMrtP/STuOZITpUl5Uz1jUwYDwDyII
	FkhQ42BCA+Td9AhdVUHdANSA/ED4LFj0tjKeNMZWRxuwAhuty2AcnQ1IXm9i9wTSvYW79hWrN7d
	Alp6whdjNkAmPd2xS1YD3MXAb42H1bu/m+b3zI0UeM8khKFq5iBeJHaD0cejHovMM+icSUWUaoV
	eAMyG/jSVclEw0nm6OvB6iiQFruec3zw==
X-Received: by 2002:a05:6a00:4188:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-8352d29a99dmr1858138b3a.48.1777699178931;
        Fri, 01 May 2026 22:19:38 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:38 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 3/4] riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy
Date: Sat,  2 May 2026 10:48:56 +0530
Message-ID: <20260502051906.8160-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260502051906.8160-1-linux.amoon@gmail.com>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Link the usb3_hub_5v regulator to the USB controller’s vbus-supply to
ensure the USB 3.0 stack is properly powered as per the schematics.
In addition, align the USB hub regulator with the board schematics
by renaming it to VCC5V0_HUB and marking it as regulator-always-on
to maintain power stability.

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index c35f4763c800..3dbdf53b6d8e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -83,9 +83,10 @@ reg_5v_vbus: regulator-usb3-vbus-5v {
 
 	usb3_hub_5v: regulator-usb3-hub-5v {
 		compatible = "regulator-fixed";
-		regulator-name = "USB30_HUB";
+		regulator-name = "VCC5V0_HUB";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
 		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
@@ -361,6 +362,7 @@ &usb_dwc3 {
 	dr_mode = "host";
 	#address-cells = <1>;
 	#size-cells = <0>;
+	vbus-supply = <&usb3_hub_5v>;
 	status = "okay";
 
 	hub_2_0: hub@1 {
-- 
2.50.1

