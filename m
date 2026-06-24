Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63823B71BE
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309480; cv=none; b=n4ZrXQ6p+ZuFx+8s/8v99V/uQQyjdXfsuIPFM+BP0//d7/b3oph4M8/0CBNmvlCCXIydbaM0fSuAyYwp20XXEQnPrNymo7DWK4zNirbD/KKB8HDyiQHueahaD599EOOaT8cEVCf4uDydD8ZroS3rnlcQ+OlBtPgmNUkuJRlUrPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309480; c=relaxed/simple;
	bh=ZqZCkDmY3c0/kditj/CSeHwbumIJp/ak3XkyRMjjrv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adZXUIk24xFYSTA7zkpRi+xHk3QzPyneRKESOLTz3cv3fhBI62SABK0QL5rouJJqt+WklVEKzfazgZpSagllaQg8E9P1OXwR3a89m/pnqILS3VNYT6tq/jnVI1N8k5W3RK6Ixy4BbJTE3Zj4IoQ0QEqmE2KsjjJDnmj1OCv8NbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovaxky6f; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovaxky6f"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9666739d3bcso373739241.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309477; x=1782914277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=;
        b=ovaxky6fUtFpoioJK/Fe30gZdjv2QNfqd89z1ufqps9w0/ONOCpgEkByDn/Ua5z0m8
         mTZ/Q+jLo7lQBlIKaOcb/6cAVyAILR6gvQFzdLZ+uaGONtYkOO3IhluR2EbKqTC3ik50
         Ib+YT/TKAXYeUZQUnq6FFonv5fP1x9Zq8Fghtpfclm24YpR4i/HZ3DT4L4HQy3tXLe9F
         52M9vqSvNzMtfrURNkruh4Du7BLEqIhee/Udki0bFTcgJmYWvMUA9B7Xpe+suIohUs4D
         dbQHzTTBq2CwGkfYgYhSD4wVAJEyx+OtcvPQoSq81v65tTtlAQxLuNnKjIYeNdzuQ/CD
         urZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309477; x=1782914277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=;
        b=YyriUABpSsNoGTy73OEnWEPSGgJXYQyuD0C3dnYtt5o1ZLnORSMoMJcGVfUaSYQdGf
         kAc2aQIyTLQCKfUbJ4etNaq5Y9P4xLYqWOAAPGIQzcJYHS0lx7z3E97AVJtvAj+ZYqZ+
         AfQvy/mM4VWMO11KQ2Sz/ZsQ3j8geXEz/t1E18y03h4c7FAlEf1F1WwEeTLVQzUcpS8e
         abNTX7kioVCa2e3zP8+9ciHpfLouPggZvuHYGK6XJWd8Bo+YfcskuemkUW43QaSS888l
         Ihon+g6vBpc/NzjBCoyOLRrCg/GKcbm1+/XVA+ziKSA/EIqG965tdCgkk0I4l4JK8jMY
         rm6g==
X-Forwarded-Encrypted: i=1; AHgh+RpiPhY7lF+2vVPT4ATRSKnWf6DNH1sa44aEqXFOF/8jRUtvkG1Nz+dcnFYiTxIL/qhv1FAa2kIlc5Ai@vger.kernel.org
X-Gm-Message-State: AOJu0YyJzj8NUZeBehpNzJIKO8b7LjtDFkm5P/vul6K/VH0+nu6mRDqn
	1LKX9W1uGkVRzRnt0FuKUsaHSIiv935uh3Sg22z/Z6PXUvqx81JYni2k
X-Gm-Gg: AfdE7clpjV+EUNAoks53E0sQJCQbaF252p9/P8Sodiggb0LxTp87dujlOUuNgzj8STa
	EyJ3ACfK9T1dv5pDIpDAAqgSNma7hYwHeOg0cxhYkuCpnGl6PU0XjqPMRkRPNNrwepFRQVEftQ2
	izDOfquIn4Pcz590xsgpDk+U1eh8EJg2s+FZYMDe8JxQr1Y0HhFe9+N2dPuSTH0zK4kVyjJqV2v
	z8iCOvTJTbF6JjQZP+8aw9gkBZnVKriVPpMgrIZuvZA6u33KDBEegIGWmETe+gK7m7MNsdOlmiJ
	Ul5ZGf43ckNBCzY5jpmA/LCLgc1FiMyc97FxwPWrncPx4zyg4fiN8YXCu+AGlALTg4n6uBjyBPy
	LVc9V+jnRGAr3pXOjc4NjC8RM+1lY5yFWHzumnh3t4Nz3NpWZCOtw5iQa9cnsF4BIkHBYg0Ed8d
	PtdIJDNtz8TkoogISnorTGwXNNjYdvaoFcn2s=
X-Received: by 2002:a05:6102:f09:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-731157322acmr1460988137.23.1782309476725;
        Wed, 24 Jun 2026 06:57:56 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:57:56 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Wed, 24 Jun 2026 21:56:43 +0800
Message-ID: <20260624135650.727077-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the pcie_phy node to "disabled" as it is not used on some boards
and should be enabled per-board when necessary.

This change suppresses the deferred probe warning:

platform ff644000.phy: deferred probe pending: (reason unknown)

The meson-axg dtsi now disables pcie_phy by default, so enable it
for the s400 board to support PCIe functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 285c6ac1dd61..7ba249cc3d56 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -448,6 +448,10 @@ &pcieB {
 	status = "okay";
 };
 
+&pcie_phy {
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 8ca3ac09b306..5b8ef98f6d03 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -328,6 +328,7 @@ pcie_phy: phy@ff644000 {
 			phys = <&mipi_pcie_analog_dphy>;
 			phy-names = "analog";
 			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		pdm: audio-controller@ff632000 {
-- 
2.54.0

