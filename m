Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C83AC0E6
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273130; cv=none; b=MHRmL79lDpqdGNcAe01N/0n+E80PdAFJkEIh2+J3XcqyBz9Nh4gCnP3aZuUYtgjpm1b23tOefmZJwRLoYlJMraNtT1LdoJwHfFBZ6vglIcZd9yYuJmdDTXQ/+T3Oi3OWE/b0A57Ot6ZrgYBVaYNAEkH2QGIz+qr3Mk+E0ACIuwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273130; c=relaxed/simple;
	bh=j2KJsUuvzGGf1CfWEwTwFG42x5CMZoMq+03WHd8ylpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvhqDNSx6VGnWKOVoyOeeUt9unoXkd8l4nFFXRxCY6MN7zfQkmVfvNXqRQ5BQno2e3X/GWSyaMaP7g2E1e+j1J0tIVzey5flu3s2ug52TCxjKHKs49KQh/UmB/+/ilBoEit1hXDoAjpG+1uVdhGw2KsLBDfgdlDy+NcdV2y2y0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DapoqAW3; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DapoqAW3"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82985f42664so159649b3a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273128; x=1774877928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDljdw5WjH7cE6e1zkkdtoj0KrIOCGPQnFgDwGkvqO8=;
        b=DapoqAW3HUqtN24Yz7fIVn3exfcoPv7JGl+X5l8DhajT+1kH5a/9VP7EIjIg7njC29
         ujJ2XmhVuqoi4dcpr2hpbV2pRgwyIFth4VFCMKQUdyUdWGuBMNZe6YWiULpPhX1xT2KP
         SYSQ5jvOgUpFwWUwxhvbMoDTlNQASqQbuOUfaX9uXXw5FEkghGRO+4RCjVsyDKQiU5ep
         sUI4r9XfDl1tzaFADiq8AwbPE6nDwdklsp8glxEuvt8VQxhUcvPu99RVOg3B9E8bnhhs
         LKEON9nMcaMXYnsM4hZkeVUEozr04sdV4/IeG8MyuNJwXVZwQRTRrZi254NPTKerN6nt
         9b+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273128; x=1774877928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rDljdw5WjH7cE6e1zkkdtoj0KrIOCGPQnFgDwGkvqO8=;
        b=ec55reFBM49W4WwSdHm8PJS5Co/j9oC3vnFLddgXRo2tUNUDs89Kn6haTpTOUUZBtR
         6W+7KYwwsB0oDRGe7VhB0i2r9zFGJ6jt70dlE1OKJlS+t0nAe/Bf6Otb8sviAc5Imio1
         iDnZlM2E6yVoxpAlU06Dq0UA7b9T9XZgyEDEuWB4dJVKLDntrnD4TfUhA513DFR0sJ9q
         /GuPyXeA+RQYwuEc6oBbFwXmMQ12MMqJulB7k4hWQxXbYxrpj6hE4uydnRzVnU/8Uls3
         GArTTpoBHhZpexhvbKig71HHe91z2SZBBTq9ijW6U25RCp7GrCIcJaKvQuXtpqNKodvv
         bgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF6fFy53t1+18G2NO7UFscUuvWj76iFFuFzsmS5DeT61g5pmLCTNfe+98IYxx8Hy4HTWzUu2cdgSGx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxn1Ew5/KLsxkYjKgtAkZbadF56rYzj4xnXjYb2aj3Ks1XTQg/
	WF3RFS++v0yIedeM9lFOXfEsSTPTmys2Hx8CM1Gj3scsylzTViHqsEAz
X-Gm-Gg: ATEYQzxP1bdfh+BtpTdlUxZA6c3DDoRhqWmmBW553K4gJ48Ee9cey+N5ky9dv9bGDi7
	dvofE5JDTcif09IeWcyc4D6vxQ7A60alk/Bc8daG47fntdx4YTNmfTUqpLMIWEgcEl0X1Q+nY3c
	ZrM3q9GZwORuuvpio123lPNNhGe+3KwuSaarnLl/FJR1bdpj4rdACSF3ECnFHosaYVn5js5cUvr
	OioSM3+FYtFI8Wkc32SjJu9R78c+PGjaGXs4m/JtZdE0rmGmp9Zt2HTLv7xOZKN/QSMCXuXYl37
	5Xk9G9ahUFvYliu06MKIa0SxNWYpZd6zO66ckVZ2IFUreXU4T4TF56CGropRGkgFq+KLqoBndgj
	5jtcXlZ7QnZYfr1m7HtAL8yCxH2YoC7nm34LxkLrnFIlZMkEHgEYAtzX/Z01lSC5MCw7Sj40s6P
	kYxW1f5xJrD2yTJGXXi7XxgTENDgNtNGOEHaGXUIE67xNNj5L+6U7/AqZDwcfNOwFifmtUVF96k
	UM=
X-Received: by 2002:a05:6a00:14c1:b0:824:9ffc:256c with SMTP id d2e1a72fcca58-82a8c392254mr10063609b3a.43.1774273128123;
        Mon, 23 Mar 2026 06:38:48 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410b1bdsm12069224b3a.57.2026.03.23.06.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:38:47 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH 2/2] ARM: dts: st: spear: fix dtbs warning on spear thermal sensor
Date: Mon, 23 Mar 2026 19:08:09 +0530
Message-ID: <20260323133814.14152-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260323133814.14152-1-krishnagopi487@gmail.com>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running DTBS checks on st/spear1340-evb.dtb results in the following
warning:

thermal@e07008c4 (st,thermal-spear1340): Unevaluated properties are not allowed ('thermal_flags' was unexpected)
  from schema $id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml

Rename thermal_flags to st,thermal-flags to fix the warning.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 arch/arm/boot/dts/st/spear13xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 159e941708ca..97357680dd51 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -332,7 +332,7 @@ wdt@ec800620 {
 			thermal@e07008c4 {
 				compatible = "st,thermal-spear1340";
 				reg = <0xe07008c4 0x4>;
-				thermal_flags = <0x7000>;
+				st,thermal-flags = <0x7000>;
 			};
 		};
 	};
-- 
2.52.0

