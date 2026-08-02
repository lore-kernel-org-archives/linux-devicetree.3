Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5253B3C15
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785682283; cv=none; b=CKo/JfonMvjBXrvCj7gOSqTh7CqRIxgDo/hK1VxQ1r+WdrIzDC1Yw3NvwmV7re0jV12yT61vQRoW+ZOvqRQ12rb1mQsZd7jAjRqSAghUOc2D9Plkkso8lPx6Vr0mhZFz7THuKgzw6mpp9MnGaELE2rDxawYnTGsY4y757/oOmsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785682283; c=relaxed/simple;
	bh=B8yYm5LklzgC4SuWrvgjSaEp1OEArgcYzgXwPZ2Q/hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpYeEVb6YgQINcCv9VEI7Wo5zyIGjRQVXpPgXDR/gP9d2RGYBb0UMsICxozKW6HVoWAz2tNP+/4UACQGYd7rcJI3ylIg8G/BnSZsNAvW3Vg0rO2bNlBCX427wEBLgsoecLjUhYUMdL81olbvq32AuK9gKGUM09zcBHZ6z1VOEwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5EOCU3u; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5EOCU3u"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so13114615e9.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785682280; x=1786287080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3oOyzEJqd6PpLuVoK+OLiYrq0YcXHeXdEUT4Q8GRzQ=;
        b=S5EOCU3uo8+z0yNpsLxd/wV6m3sovB3hYZ518v2zCSnhPD7471PZS6rieeNT/wkT3z
         5BU4Yf5Q5dCI8nonsJuEYhJpMDrKcjkVeNurZvsVwCd8AaEAAtWCkgMdydbwxL8shMTf
         YKP13XUFJnNA2Nz9sHCBHITxcAzQ8z5UGzAVxRFXULQL2ZUFBDSKnDA720QO2BgVVwJi
         56pvXecK41dObPk169/ar561eTrz17k4C23SBWYc06stEWyPFQkbVczbVW5rqmHYnINh
         3B5dA6Vvs+b/kHooFA/U3kq32irsohwcoQtUeHGm/qavZdBU/nrDuDqp3lY8GprPwKPa
         rs6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785682280; x=1786287080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3oOyzEJqd6PpLuVoK+OLiYrq0YcXHeXdEUT4Q8GRzQ=;
        b=c3aNCGRRbg63Qvja6IivQJDM9tWNTi0HqKJzTFEs5pwZroBNYygcWfvtUiaaUTfcRC
         wwRrP6HP5JktGPxwJH3Z2BQQtYnra179zDvOcLzh0Q3Hwo4XFSGCvKiAT0iDXHpVavjc
         zc6U5WXP4ihYTt/30CZMG/n/nO5sUtq/FmlMGGx3VFGW3u8qXp6pS2odvgodArmio78O
         1rOjZepNpAWfy3XF7WzGPz9L1DNTfrjoDyyfVNWerhJwRjhIoQn1MhIZxZEJKIfim06B
         jooOLkS8DV4JjORe7hqXpFLS7FYyeNIwje7MgE9R3nuGmeB1eJ7RCuDlMhM+v8QWSqgu
         Cdbw==
X-Forwarded-Encrypted: i=1; AHgh+RpFMuFIrXW/V3CtZZ6qwJNZh7R8xwrX9ScbAFls3yuMGBV4A84lnK/tFz50CpZpd3VUcXhTeQ8QUNC9@vger.kernel.org
X-Gm-Message-State: AOJu0YzOVPzwd7sVmVzAb+dF+YGgIFSS1o8/n4vz4dyaVBzjrNXj7ir0
	fIwLR/Pz3dHruOsRwli13ooX64SIVQPD1O2ez1K2lQ31V7R99e45Up3y
X-Gm-Gg: AR+sD10SimRPDhh46pfCW13foGGgZIq2TxCk8ZgyHE31yZ+a2FJBamCK/GVjPSjaPqF
	+Uq18Px+3/m0pe1zh23fAqnaTOYHvV+D3fRhHX0MSF2WBFnmODbJkpNYTCFilpnvs9um7WwESzZ
	WtKb+Iesvy4ymLn86Sn+Td94TjFGaAjdiJMugQef51Aykm44rrrIa3VIZVycCiJWKGS1lUQNg/2
	wRWHs9JGnrf+ZQpQXm0HoOCp9B8yarde2XlswMOPexVEBh5vqHktatnUGB34gNEPOIodyGnXotK
	5dBrJ+5Fql/7Dbo28cKhyHEqV6RKahJfLYzKsMYVZfuINB6Pn8quSrTRX8HuKZ5kMn1gxHp9ygH
	oCzDBL3h3n7aZEI3zUbnVMzD6S5STnxww4naQJroYMdSI54j5BBJfuTobq8u80SUnKE0sCDmbsG
	GPbEeMECMl1g/ZFn3yZ6XEOzPqVywtMHIA4BaxCLHDPrKsnqAGT1zsq7ZNgwHGTlqjKdKn3yAEL
	5Yypk4mIau2BXif0mqPSWcc5rn1WVOhxOLOwIfCr3/N+Qc7pxnZGASy06zFRvFXe2lN+sb0jraH
	92MZ+ie2MmQijQ1V2uvOl8KsP20khHmE32UEnNG1FkVFGajYuZZtGrjnzZ9Rs6RXUWJHoaTgZ4k
	CjppO6LnV8XCuMNBl85DtQW0Xr4fzZ+0gsR8IYLen4YvS7WVigZxooTY14IAz99/pO/uD9Ac=
X-Received: by 2002:a05:600c:8b33:b0:495:779a:ed33 with SMTP id 5b1f17b1804b1-4980c66c798mr151895165e9.7.1785682279780;
        Sun, 02 Aug 2026 07:51:19 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm234526335e9.13.2026.08.02.07.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:51:19 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 1/3] arm64: dts: broadcom: bcm2712: add arm PMU
Date: Sun,  2 Aug 2026 15:50:52 +0100
Message-ID: <20260802145109.728793-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802145109.728793-1-pbrobinson@gmail.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bcm2712 SoC in the Raspberry Pi 5 has a standard
arm performance management unit that aligns with the
Cortex-A76 cores that are in the SoC so add the details
in so it can be used.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 9b36ecd7bba54..ae1fc9d728c00 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -10,6 +10,15 @@ / {
 
 	interrupt-parent = <&gicv2>;
 
+	arm-pmu {
+		compatible = "arm,cortex-a76-pmu";
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
 	clocks {
 		/* The oscillator is the root of the clock tree. */
 		clk_osc: clk-osc {
-- 
2.55.0

