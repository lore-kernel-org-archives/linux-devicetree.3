Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67C43AE18C
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742971; cv=none; b=RDH539/ghEKT34ml+vswIc4j2gojP63e0mT5YQTV7hNYw4g1XNH3LeK9OdRBbb0tPDXdOt1IeG4dZ6wpBeX/IK4pYJF1ywvPk6sSqBonwp5MadD7cCaLKJE7McEG8WVFf9YmdCuTN2zK+EXkIHaq2B4jftE+nKTuhZoNngVEDtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742971; c=relaxed/simple;
	bh=u9m2WwsAUh5Coh/I3NjhlkfL1KrpsMcmoa+vDwMzK1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFJeipu7ljYUUOxnqeQ05d/hQss+XoeBd+M3YpHRef5ylrQlTAo1XE3Cc6uGDcRqpQDRYFTMZs+09utRlTfrqRAJdOnlaO98CVCWEK6uWUCo/e42esvOZv1C8x6T8nFL6FqqRMfn/cWqegZRWT8aIMEGhhr+bGlDa2um1TDJEM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=QyQXhOv4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QyQXhOv4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1493384f8f.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742968; x=1786347768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=QyQXhOv4KcNNbAtmhj/A13sPVYtwaulQMAILPZ+1Kbvzjo1KJCee2ySw80/2M748iq
         M1ee95JRwB5hwl+awBjcYiRTVaCvuUwsqMk2iuV4yVkZ3PJ/qLHfhQ5urKicjhVT0ZX2
         TjRblKru5G4W7IayYra9FS7BPqtlZugjhYX+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742968; x=1786347768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=LqXtcXi1XzwOLeKB8O0BydPgmVBy7WFVyT0IRTxj7E8lV6FRs9M3aBhStuKh+6Sdi8
         BE35prvbFlSW7X5uKpwugVwRmehk6e4ulmb/PML1kOFC6P59k8lvC7x3vuOwd/7vC0rK
         63DIkW8Q0496bI85daIcHRc5fMavbve8w2AOCmX6183nZ622Wpy6DjsjG2dCcBUufzcA
         T3UOq8V6toUB54Ll5eNW55PavS+piN+fd9AkumLOWm7o4C7UIGuqe2U2tHicH9fFmWhE
         kn58mLkz/fy23D5bv446xn3eKItWmbMzlTrUimlfYMotv42Ie8w7tOqwg6N/kWhGcjul
         smDg==
X-Forwarded-Encrypted: i=1; AHgh+RrYmnTICnU57ft4uH4FeIrTuXYHqNivXd0ZPjaq4YN7n5i9a1tlU/yv9CfVDUyGF6YuWbMrPVWSP4d2@vger.kernel.org
X-Gm-Message-State: AOJu0YwjlOygdh5HBNwxxaoYJbZ9iSgD1ym4+sZFDsUBMB9O0IbEqvh6
	JDaKqXCzzPrFpnhzlQF5RShYIe2bEjZkJZIOez1xrkVwsEqu6mRVVtMxO68YHQeWInc=
X-Gm-Gg: AR+sD13Iq9zZFl5ODooS7AepyZbhwzI/OBWExRRCDm4/YZClhOAWLxFxIDjuV0fXKYU
	FKGTc7tgyjky6wrlXvwx7lZ6Qgn17m7mxl7Z1YrGpdflY3TkEV3I3j0jzYXQ3oDF0wov832IvxR
	1XT2MZUEiR6/XEhwjOYbBeJSIGGJEzBVwBwhMZZJZIfi1IZ1CTVq/knRa8537vK3wrAbrGgHRrH
	tIoAafeeA/Q0oTlpGjMLNOYHmfHB9Bil/+kFcuQahDwuOy30mDwcfUjpBYUeTp2ck9TA6Zo0xsX
	8oL1NJtRbGfmEsu9Z9+hyjAcy8PlsOWjTfPo8+WkEjgn0PfXR6l4Sc5gaHCjsNBXxF3afanLJGm
	VE2GvTyszKgGD/eODtFnVUvDqt9xwUsN6wRsHFK15P8I9IP/7zrYiDtiItMoM6DPHCXQs4/zub1
	UcVcTh6WWr+/c5V/5og1tWsYhZp6DFL1vMfkpq5G8VP/Iv1KdwCQv7+M2EP625OqOpLH+FaA8Tv
	EQyhNhuLw+6lTUfXwOvaXxrSL+QPeKyo7DNgTXvzByNNTkriPu5YyjKpMmNerucxvejPfG7tzKp
	JW4PZIl+xhxcOWjnQRiwwaWiHD4LYeffz0a8+l4EyuXvYt/AIsAEem+KTYlqEN+Q
X-Received: by 2002:a05:6000:25fa:b0:47f:8f8f:e493 with SMTP id ffacd0b85a97d-47fd72ba69cmr21247856f8f.3.1785742968144;
        Mon, 03 Aug 2026 00:42:48 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 05/16] arm64: dts: st: add CAN1 support on stm32mp25
Date: Mon,  3 Aug 2026 09:26:00 +0200
Message-ID: <20260803074224.3821911-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Add resets property to dts CAN node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..7e82f01fdc10 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,22 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0

