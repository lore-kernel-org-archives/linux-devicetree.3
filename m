Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96EC36828A
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497890; cv=none; b=MBZo+bKjCaA4gXASI5RPBz5iJtyvqJ/G7n/pQJ98oqnr+x0SxnRihsgT1xGTaQjJRlGnzPLaBsmO83Tstvbdv9re+/LBctyoZZnBrJJD3t0edU0KCK38WzZCS5uIo2PtOeTZxMjzRyzJzHpnJrpOF92jw1Nr/KImg0ngDWq9lwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497890; c=relaxed/simple;
	bh=yAZziDQoNfZz+a9I9ktnZW0m54pQi+joUOUK/8VVPDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iScym+PFYX3A8kle5S36ieNNMpa5Q3+yn1uqUCOwH0xEIMX8SaHHvNzoNv0fR1Dl0tIXHZ2iwkgQpcz/nPnVwOehxA+Ync3IFGSx4QX7IziePU5V86cNUv1uUh4Z82+iF+3kFzT2CrHjO1u6Aa2bISbCcqvjYBp12aAjshfczOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnYpOuDr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnYpOuDr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891b0786beso27229525e9.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 04:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497886; x=1779102686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=879kJdymdXBFu58jnCcAvuFoRWhDTaO96RlJIip9kww=;
        b=YnYpOuDreQev1tqm1skY8PoQXGsD0W61vmYakIPgn02OE11fQfwpNNbmxbPEk2aTcT
         qG9yhxrP4Ju8zT1GbuaflgTQh+R3Qc4C8krEeitu7N/BDXJ7m7l4hHG766CKHV7L4ZLf
         qMgayfNioh6tuNWkG1zqTzEQ0qSzOaBuX+RXZkbVJ+hFrhRsTCXqZPLSspSL1alkq8dq
         cH9wvzPV+OIU2v5k1fyoEaIWHVF3CqzB6ULYhPZblS9l8bNPdmKaC0cUni7hLfscSho4
         ITuAmILh5K/4v5BkLEV61TEyX4qRo5ZZIK5N6uxWJzlLPUesPO297Qr7ZPknUWgr/u9a
         Pbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497886; x=1779102686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=879kJdymdXBFu58jnCcAvuFoRWhDTaO96RlJIip9kww=;
        b=R+hpd3KpAHwU8FJcuanhT1koJhSX3QxtNXGkXqUDpzQ4lzARbF1rHqEJe3A+wrg4Cz
         UXEeejVTxXXLKg6umxjo2IJqCXw6NbzMW01usT84WxsT3gQXh8t4pZwRmrkugAX7N8ps
         AxC0SRcxEeEhUQHw+1TAClL5EAL9lGi5XaWQdL67Okcrl0ZebZedwXb2b57mGL1dUp2e
         +jNnnYxY08WnKRlyjxBMgZWGMfzn8kGVlSmRMRN4PPwCdK+7kEqgRCeq0/Ndl+fkgi6k
         58arbqZpwLIAtmdajQQNCl6rvMtxaXY7Yp9R5/OD7l6/g8XBRiK48Mn7hoeR4lifzQpi
         zmQA==
X-Gm-Message-State: AOJu0YwRL6uVHf1lIKPfZk7+XwoTYImCUdRClyeiswoOnP0gOSGGTRbQ
	USZSH5+D0WX2s9QzKK6nIP5qTEjluA/ZCFbmksiloY8slJQih9d8LqoQ
X-Gm-Gg: Acq92OF15kI14FsYkpsyc5tmKwsVHCLZNUsNGM2TZdQdufb2CshhxbQqWKfR7UrrWjC
	vFSQo9V4O4elTta4cwvmfzXDj2dxIxtgsFP9NoNbx5RaIfuYAC8YaG6I3e9c84LRGRIrrwseZjA
	0kKIxrioIIbclrynCmRQl+vFPbx5SlbT7d6r1ITRWgPpYtYQnTnPFp6U/xlRqoESaea2M2VjUn8
	UvaxFL4ZJkX3fZXpuyfyqX7LRp4gYahhOsw7z6Zs6tMek/GEfiZDSAe8XntQUkXzx6b1OzI6r5s
	DOuNrmn4o5buh6NyWoncfqHm81/y8G+C5Ce3HTLismo8VXdGAtHURJGmgDfPgNte3Oa8dw1t+jX
	satVp6XKvumxVTaHY6RV1xlOme4QqNF49FWYJo7tOg6j5hXUgjy0k2MNKmrGQv7V+P9cAFkn2Iz
	lHrWUmX76w31B7WX49B+3BXJU7DdPhvugZWxeLSiFMZ+FwA8by5QgEPth/o1ZcUT6Fz1w3HgRXI
	WkQ
X-Received: by 2002:a05:600c:17d4:b0:488:c014:34da with SMTP id 5b1f17b1804b1-48e51f4cde9mr227432505e9.26.1778497886135;
        Mon, 11 May 2026 04:11:26 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:25 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
Date: Mon, 11 May 2026 13:11:12 +0200
Message-ID: <20260511111116.1109643-6-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the two PCIe controller along with and their associated PHYs. They
are routed to the M.2 M-key connector and to the PCIe slot.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 9c90c2817ecb7..2d3e30f0bd806 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -36,6 +36,24 @@ led1 {
 		};
 	};
 
+	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
+
+	mpcie_vcc_3v3: regulator-mpcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "MPCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
+
 	reg_usb_vbus: regulator-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USBVBUS";
@@ -275,6 +293,38 @@ dldo7 {
 	};
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie1_port {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+};
+
+&pcie1 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie2_port {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&mpcie_vcc_3v3>;
+};
+
+&pcie2 {
+	vpcie3v3-supply = <&mpcie_vcc_3v3>;
+	status = "okay";
+};
+
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&qspi_cfg>;
-- 
2.53.0

