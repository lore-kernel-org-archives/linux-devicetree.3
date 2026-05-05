Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F049C48B38D
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997194; cv=none; b=VDXVwgxVrydhZy2tzrZa/93nI0DlHEwfV/x1NYvTq/adKz+PwsI5sCj8M3JtGmKpZTwxdgiQdqb5Osnykbmcfbad4JjrenusEJq2/JQYCKFbh6SWN/EpMMrPQNnp4yULDoV06YvumDE9D7Kt2FS+zeR1xz5IFO8ayD+VDev0x+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997194; c=relaxed/simple;
	bh=UX9TvseaOrqVn8GZy8hKrojLPdk3nOofrI1Vgc1wgWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jc5PG5zOPmRHiaoS3zSwxcj9f23td/x0fEoc8KpMwPdLnR1qrYu1Qv5CpikbBxDEWvJj326EfoMMiEkPmGKxLLjxCzSOuEMSBwDXUfLM5+iyw9G0bFP+VJ86tw/he6nlZRNAg7hMLdMA2sV2hkPqjBQR9Nt2cggS+T+pIdmhNrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAHXRHvy; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAHXRHvy"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so919763966b.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997191; x=1778601991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFVRK+/tJ5TyBkXs2ToW3IvAArIzFRTr/jPdIAnnb/Y=;
        b=iAHXRHvyv7E4gWZLBo1JXL4o8FtrUbVCYPrXLy9OvgddxjJlce7riARva1mDzoJWlH
         06ApbNICI4V1TZHGOicRk/6+kRdS8MOP9+uAyrBPGrqyKQKhk11p1hMhZGqLXA85ypOW
         Iiig2jtMuWI7xPernOX7IqOlDuEqncQOeZ2447w7OhDWT3nHSFMAVOjNUWdZ7J9xQqVZ
         ypL/q+6MVcJFflEZFlw18apNxp2TOcH+mbIxDEPESLwheHe3k9fCROzzEMPWWwTZGNJW
         o9tAGhFfkXlNFWGw9iIiCA2eg4/56QCMs30DOb+trAC84V+DlS6D5Pte71DgGKEYsw4z
         6oIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997191; x=1778601991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uFVRK+/tJ5TyBkXs2ToW3IvAArIzFRTr/jPdIAnnb/Y=;
        b=M9eQYrmZbbhNT/yvjU4frxX6ccJcdgyk8Uq9MzpHtF+gP/TDpR3JwvaI4ZqMz+HyRj
         +k7DAYJHZ8MdB1i4bQu3GpZ5FQvl8j0zJdVJkf1nW8EUQs5KxVzsmQjZIY6zMkDKrFh+
         3AcsOYqhz7za5MMZDX3pa/oDzKpglfekyG1Qj5bAhE6A7VFa5VALqgcMt7AVNJJKUhJe
         AkFm8AgoaezvWgHn693UOEToX815MR5K0TYDH0ZRRtU35yl2MkT6BfoXUSTwI7SD5qB1
         rk4bkrm4REhwFMdt0JrEOUgcJnH9SIZkDpvaFCXB7jy5Vmg+aWY2pKq81uC777sz6VH2
         TItg==
X-Gm-Message-State: AOJu0Yx/wMFK127/5C5HCydLmjsG14p6qQOva+PXBbvNXbS4flsWPS+E
	nrr3PX25gRgS8c/Cm20HKrt7aORh/XO+SACn0Wn7O2hqtFD1FiOj0oJQ
X-Gm-Gg: AeBDiesvCBZ+IGfO6+LxjHr2XwTxPUGrDX+BVRg1PRNB90HmTGsk1aeW71cXUclKGxH
	MSYlzB/+G4GHcBMtYI1Rd59BO7sAkwUfmZi7wnswBi6tvrXyNIk/C8WmYCO/wVW0AhJL1asFIEC
	9dc28WDeJxexX23UeMDZAYQPesJSfDhSP/RQ3kiFS7aZD5/2jR8L+TcdNJrRTVKTtrt8xISxLDf
	kltbexa5KaegTIBLWmbd1DOZZ5L5cLakX0uJETiFxtjYhyNQy+PgnR4fu54nGwm0n8qe2e9A65C
	brsiT0R8RLkNBdH5k5rPuWFv3UZoUV+D7KSi5G3yQPttieJXtddGxvyi2k2q+pMq63vhm4wZaXx
	UOvNBphaRImWAf/n73QrmPaYfcyNHVUuCH7BvYApuSsyUIwgd3exk3qLmbDzGV0zMuVeC3nWxIG
	vr8H0iCAly/T/7MKzfcWaUe7jTvC8E0BjX4/DS+UuRNzQCiiQkbIHYYh6MvNRVnRzCzQfr+PxRk
	fpyp4Q=
X-Received: by 2002:a17:907:868d:b0:b9c:b069:8ab6 with SMTP id a640c23a62f3a-bc40f43860dmr230618766b.7.1777997191045;
        Tue, 05 May 2026 09:06:31 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:30 -0700 (PDT)
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
Subject: [PATCH 4/6] riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
Date: Tue,  5 May 2026 18:06:18 +0200
Message-ID: <20260505160623.1369347-5-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the DWC3 USB 3.0 controller, its associated combo_phy (USB 3 PHY)
and usbphy2 (USB 2 PHY) on the MusePi Pro board.

The board uses a VLI VL817 hub, providing four ports.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 32599082b3c36..869172d23e259 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -54,6 +54,28 @@ reg_vcc_5v0_sys: regulator-vcc5v0-sys {
 		regulator-always-on;
 		vin-supply = <&reg_usb_vbus>;
 	};
+
+	reg_5v_vbus: regulator-5v-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "5V_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc_5v0_sys>;
+		gpio = <&gpio K1_GPIO(79) GPIO_ACTIVE_HIGH>; /* USB3_PWREN */
+		enable-active-high;
+	};
+
+	reg_vcc5v_hub: regulator-vcc5v-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V0_HUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc_5v0_sys>;
+		gpio = <&gpio K1_GPIO(127) GPIO_ACTIVE_HIGH>; /* HUB_PWREN */
+		enable-active-high;
+	};
 };
 
 &emmc {
@@ -66,6 +88,10 @@ &emmc {
 	status = "okay";
 };
 
+&combo_phy {
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -295,3 +321,31 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usbphy2 {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vbus-supply = <&reg_5v_vbus>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <0x1>;
+		vdd-supply = <&reg_vcc5v_hub>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <0x2>;
+		vdd-supply = <&reg_vcc5v_hub>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
+	};
+};
-- 
2.53.0

