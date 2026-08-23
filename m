Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7983A217723
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787528847; cv=none; b=flQA76FqrW5yA7mysqjCBJq9132+Kor/YLBFFYRznE1UJXfGR3RrB7MLvOLKP/UBb1LVSwFqg0dSBH2jf0fyu6nkdePJAYTBdZfkM0jHEOmE0lxqDUVFvX8KyJGuwpbxLhOG4CWU4t7Z6PWDBFMxNhyamMk9OCC2p/3MZ0grIRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787528847; c=relaxed/simple;
	bh=4obUbmOGx4hCRl+KoVRfaNhchFlfxR7dKDEX+TRekQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wizv4h38czs8jo7T+i68Ca+8IMA3GD9cYepfVVuAyklUl+PkB7woKinkED3wjvK2we47QeoBT5DDIUV4UHM+1RHU1NmFD0mDy7ABNaunsJ9KoGchreZmVu+AnvIUAxz15uEt1caL+YPk4o1btukAUTIaTYrQ5k23dwWqCmXCQ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kF4uAC2j; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kF4uAC2j"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c2a818fc4so18954291cf.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 16:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787528845; x=1788133645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RxJ7bJC9fshEg18tC8CqCMJJPORI/U6b98X15Dyh4Vc=;
        b=kF4uAC2jnz4SNyyafLzVHUx7YI0Ln7wBNENDifhEzM+RSJmJtrXmzDTR8GQdYtEqkM
         kRAFrN8rdTHDy79u96L1My+X8CGCVYRbOiY/Ew72etjTZwixcuscEhMpVr3O5RxzxbrN
         q7q4Bcuh8GM4AbqOxAbUpyHOg9WiNpNKk6fp5lTc3nWLy4Xqj6KmPUmQ/rOCDm/94dbD
         V/AOtvRL0W9w2Z/eiF2wdSAzwfoBr6lm4U5g1E7tv+akk7AuzT+2v5uatY0b0X9dGrJS
         uJoqDCd46TDrr3RTdiKiahI7tFclV9lsEMONnOmFrX8XNgU693kUFvo3IIoDxTITaabA
         XJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787528845; x=1788133645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RxJ7bJC9fshEg18tC8CqCMJJPORI/U6b98X15Dyh4Vc=;
        b=Q+SOVcDvSWHCCnQLSZdIZtPbXyOcqvH6x/2PSxPy6w+n+/ySgQCBL/C1VOhEUiX7yd
         IiYYVSW63XN8xRZdWjxcZ0yeO62RL6+Lwlj50JgD3F7vio40mrsK6G0uGk6Mcso5eiPr
         BmdD50arlQuQc0eeKf7xS9trZjiDfd31c974GACSa/amWD58A2aKrcxK3WtTExxe+EO/
         muXkpmgGpFFMo8hy2MVzNCGbXZTTLO6czPYpeh9fnPi7OwM2cofCgfqSeHPSagHbK7Bn
         x60BIbdb46vwBezltzRNl9PiYUyyIpdo8YiAApW7B1Ol+mIDdoGzeNnYPf/urInB/5kW
         3mSA==
X-Gm-Message-State: AFuF++lNJIFIdWdupOFT8Q4pkCfZEKdoglYGgI1hnxBIweq7dAneWPMw
	akyJlepMXt4u9hJANJ9vGe01rEkQi/WUoHv5k8jtSiwC1kv/sU5FZ+RqWdleZg==
X-Gm-Gg: AR+sD10jLq6r6OCQAZHhxYSfuXAcynO7Gqq0UYZHz5t7da55tm30+mAlr5B/JUOOYN+
	iQvpDISFRx3PDB4VrFcHycTfTxXT66sGdW6YErxwK2KIvJZ1sSKgXNTtYZVGU6WhNwUTGn4YIo9
	nzO7AMughQIWy5w3TsUCWnVrsOZwZHaLouPNRJCwTw9LCtnoykRgYeZ8URmf/d0LBQ/ddI5A4Xp
	RSn2EPznAGB78x1GwhVGYAxFAzCw2lKugCu3PSClg+GrMgoNHbQMLCrtTpjOseKh/jLEqID1IwJ
	qnYbNpnW0VTGdTvRyr18HgZCMVS6bzsCArkE0v92fNzxnkEt4RwRQDWR99++bnS389HJ8woe9C5
	LtRczCxSOr2M7zgNG2HrV39azZQrzRqLeyLkcsPNGA8un/Y9aUhMaU0v+nYiY801uN5S6ACYDq2
	ErIHbWTpc+ubQNumuN/ZWK1BoKARX82QC8L4Z8dShDsb0lsZwlRJcQByPr1nzEHAB+uitwaDz4u
	ik5fJ6Ts89lVPpBq7BwqModSIvCkYZYdNKG9bP9hb6cG4B+2o501Hp4XGA0QsNtMWV8/bI4i0Eg
	Wq2on8Btk+RaZZ8plcsbR2DWRCbirdRqtG0Giw==
X-Received: by 2002:a05:622a:1c0c:b0:51c:a8:51cd with SMTP id d75a77b69052e-52e09b81035mr153613501cf.1.1787528845452;
        Sun, 23 Aug 2026 16:47:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aad030sm36778851cf.15.2026.08.23.16.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 16:47:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: marvell: add missing SDHCI clock-names
Date: Sun, 23 Aug 2026 16:47:21 -0700
Message-ID: <20260823234721.72903-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The marvell,armada-380-sdhci binding requires "clock-names", and
the sdhci-pxav3 driver requests its io clock by name before falling
back to an unnamed lookup. Both Armada 38x and 39x nodes only carry
an unnamed clocks reference, so dtbs_check reports "'clock-names'
is a required property" on every board.

Add clock-names = "io" to both nodes. No functional change: the
driver already obtains the clock through its fallback.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-38x.dtsi | 1 +
 arch/arm/boot/dts/marvell/armada-39x.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-38x.dtsi b/arch/arm/boot/dts/marvell/armada-38x.dtsi
index 1155bee20523..598022645dd2 100644
--- a/arch/arm/boot/dts/marvell/armada-38x.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-38x.dtsi
@@ -627,6 +627,7 @@ sdhci: mmc@d8000 {
 					<0x18454 0x4>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gateclk 17>;
+				clock-names = "io";
 				mrvl,clk-delay-cycles = <0x1F>;
 				status = "disabled";
 			};
diff --git a/arch/arm/boot/dts/marvell/armada-39x.dtsi b/arch/arm/boot/dts/marvell/armada-39x.dtsi
index 218fcf99ae07..81dd4ca5fbc9 100644
--- a/arch/arm/boot/dts/marvell/armada-39x.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-39x.dtsi
@@ -381,6 +381,7 @@ mmc@d8000 {
 					<0x18454 0x4>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gateclk 17>;
+				clock-names = "io";
 				mrvl,clk-delay-cycles = <0x1F>;
 				status = "disabled";
 			};
-- 
2.55.0

