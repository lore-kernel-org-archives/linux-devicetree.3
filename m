Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071B6502D6F
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 23:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637581; cv=none; b=VD0XsAhz0EbB7odX0fJp+bO0WQtmclJJViz1nx4MWHrBS5fWr2iSnyypBquaMeRoHJqsHCz7f3K2e7lUI9QYTdv6/192eswfkXEnk1qE7SFJv7F8DpzDqbiwsFmONHcHy486NV8yPQeYKy4Ik+JeKto2DOQ0YfwFE6I4D8quXdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637581; c=relaxed/simple;
	bh=8zeoktIy+usUIFH1w4ionuLiRCFm3l7V7ss5bkINDA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+sxAhGwrm6cmDft7tFisRBs4ZpvjzITJzZfnAJdpzImt4EDoSxrsh2arQiSgZ/GnDkpDMeF9NTtAMDvVsL3bk3oDqpg7ohi1brNk3liEVB5Nb/Lka/Tt7wS5XUbCrWCZESGQOrsbgJNoBaixntaN+xgutEsihNZLDvJOAhVx5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JMS0wEUO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nyBuVHg0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JMS0wEUO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nyBuVHg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3yDoqQ26YFmJbrXP16xbG9Lltps7LHScJ0yfk3VKi1o=;
	b=JMS0wEUOLyKJDjPrEcKSe6mbsrYRwTVcEeG//jEBcJVzEx8azm3QYxxgxN+Ohx2Yw+y99z
	XoMYbhNCsvDYg//4QLN2gQNqXjYFJUERj+4Vl9yxDQ1wf4gvioEJP5YxKJN/D8bDW8A2Ge
	53cA9e3u24vS/bcOZYyLzVY/R1vS5xI=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-W0-6qn5vNsS7OSK26leMhQ-1; Mon, 28 Sep 2026 19:19:37 -0400
X-MC-Unique: W0-6qn5vNsS7OSK26leMhQ-1
X-Mimecast-MFC-AGG-ID: W0-6qn5vNsS7OSK26leMhQ_1790637577
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8a847ac0386so8589057b3.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 16:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790637577; x=1791242377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3yDoqQ26YFmJbrXP16xbG9Lltps7LHScJ0yfk3VKi1o=;
        b=nyBuVHg0sACxnIPNEtg1NUQtISMplQVqp7Db7r/qmPejKzNsumIk46FdW9P6bbrAFj
         4FXRiRb6R9SfJhrrJxlIoGgZ1LonJUeFesGqMnNRVSpVSs2hKRiSJ0Qn6Th1ly1OzZaF
         mxnxZ+YStbtlV6fK5Qc1qfadWYsgpEILDxCZfDeTl/NN4zoOwmztZPYljqW2UouvMTT7
         FMPZ6Cz96CckSsylh6CTfZ9mJbUmlcfkFt/IC0TA99csuX6ASehJzAedrAzHa4HLKoFQ
         GRpAxtyRxYwZCE0Ybt72/JflHpNvboWmmtV91H4yl/IYjZpn1BkLGhX/pUuVnlKvChQ5
         P/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637577; x=1791242377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3yDoqQ26YFmJbrXP16xbG9Lltps7LHScJ0yfk3VKi1o=;
        b=ftULENFt4y3ROVLijTINEVKAZCRiYx7UL3pi91tsiyGUz9Ew2ae1JTgd/YUEO3cjXE
         htpTCRpLXR1Ex43VD3FiMNKYf4+yquKgr5l2J+6QUh7s962p6wdMdpgn1m6OvLN+5VLA
         yA/1bMxfoxN0I3ZA+OYwksAbQ8K4a16Y0X9HsSsAronZtN/14oIqeZo3yHU+JzK4h9At
         3wu6Lv5BkFX8ra/G1rdVO8/3gYnwsPnQVZbroUOjtV3nPG2kkUbCl09dRiFSwmX+P/6M
         XRxVO36Rzt5WZoZsO++o1NhukkU/LD3dA2ZDJGTzAumm2GdPF08BS4AgrwqzRj+iivzk
         K7wQ==
X-Gm-Message-State: AFq9FYI1KRcDRpu0poGvx4JvcvgE6EPRitXORwjmDgq/CKVFA9QoNDNj
	l6QXL6tCxp4cttfXPtJHYy2wbRSyWPUkIiDKRtTSrar3yCzIPN4BsuXrcJjHVliQ2tLH/QnyqsR
	yM/5NMarxG7ztsdnwtrwuad8Upx7FaGaSL6XJbIz49wGqAN5a3ert9O0+0EdwEjc=
X-Gm-Gg: AYBFou3Vtf9GvKIZ4xxitd+B31rikXxxriBSfEdqbRYsnE9znJxZJ5NFdXrfwAIQ77H
	EtKbHtExG5bM7ji7upKpj0wbVF3FeVk2CsjA0PByMX8J4S0jyom/iUQhHMcvMRtyTjCc87AhiFA
	D0va0lkEbyNuSrMoPUow+GDelz75Ku23fpHxMPHwjqwJGhUChQZpKrUEXRRSP83I42XgnqB14db
	bvguTdmeafgYEy7kYJ5C4ZziD7ETfHhuy7lTmTQrilEAW7C8D5b4bLb7xmwupNpb/8vSNc74lmf
	FeH3f/zZFb20Q7G37xXjhkvj0rc6KZeaIXLcupv9Q7UDvhzOuNY4kw==
X-Received: by 2002:a05:690c:60c5:b0:873:5c6b:a304 with SMTP id 00721157ae682-8a86d7e29bdmr40056047b3.50.1790637576913;
        Mon, 28 Sep 2026 16:19:36 -0700 (PDT)
X-Received: by 2002:a05:690c:60c5:b0:873:5c6b:a304 with SMTP id 00721157ae682-8a86d7e29bdmr40055957b3.50.1790637576516;
        Mon, 28 Sep 2026 16:19:36 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:36 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 2/4] riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
Date: Mon, 28 Sep 2026 19:18:05 -0400
Message-ID: <20260928231807.1757995-3-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

K3 CoM260 IFX uses usb3b for a VL817 hub providing 4x USB 3.0 ports and
usb2_host for Bluetooth through the M.2 E-Key slot.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index a5c08a7a781a9..a4dfa25c837fe 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -3,6 +3,7 @@
  * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
  * Copyright (c) 2026 Yixun Lan <dlan@kernel.org>
  */
+#include <dt-bindings/phy/phy.h>
 
 #include "k3-com260.dtsi"
 
@@ -18,6 +19,31 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_hub_5v: regulator-usb3-hub-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_HUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_5v_sys>;
+	};
+
+	reg_vbus_5v: regulator-usb3-vbus-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_5v_sys>;
+		gpio = <&gpio K3_GPIO(67) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x14>;
+	status = "okay";
 };
 
 &i2c1 {
@@ -35,6 +61,43 @@ eeprom@50 {
 	};
 };
 
+&usb2_host {
+	status = "okay";
+};
+
+&usb2_phy {
+	status = "okay";
+};
+
+&usb3b {
+	phys = <&usb3b_u2phy>, <&combophy 2 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+	vbus-supply = <&reg_vbus_5v>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <1>;
+		vdd-supply = <&reg_hub_5v>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K3_GPIO(53) GPIO_ACTIVE_LOW>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <2>;
+		vdd-supply = <&reg_hub_5v>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K3_GPIO(53) GPIO_ACTIVE_LOW>;
+	};
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
 &sdhci0 {
 	pinctrl-names = "default","uhs";
 	pinctrl-0 = <&mmc1_cfg>;
-- 
2.55.0

