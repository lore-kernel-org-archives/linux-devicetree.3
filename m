Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5E9481252
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629968; cv=none; b=VioiQlyCWQGwaKgwOJrAefS2o62xXvTUZljPuTuP1jgxTVtSxBsB9WbtnUnKVGIfvQE4lXY5+PfiauCcURa1pcp/O4fE6ufTpgyQwE/udlTyp1l9VZ1dXrJ6krIYElXOyaRDEsVPkHP981oK4DNkDqt7w5qoMpY2/hYozVz3xgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629968; c=relaxed/simple;
	bh=DtBBey4d64BzrmJQjWf7nGu7p4IWW0scWJqjk2ftmDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cl15AjyN7OSe1llGqz7QUiiEwII5zmQg9JNIkuf1VlUHTRcJXeMnwNz8IBua147iX1VLQgNtD/yrfNLxBfvaFsiJQpy+XVwe521yJLbQo6+fAB5A8ipRIxw27FvQxxjfprynzZwSm+NlA3INwnfKHrp4HxQqQCmERzhF4Tmlm5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtibF8Wc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtibF8Wc"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fd66a094eso846939f8f.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629964; x=1787234764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLxuxkEWmtkrUuXmIVaZI8Xooy+ldmx3AqQ9q/E6uec=;
        b=BtibF8WcHJchqRCHq/J6GMS1CqU+eiRudXfT0nn4damBPWjgrigMBjDg1fMrUGizHC
         V5271UFrjWArdRhQ3JFan+meQnylBLQQN/zBiv3dNjDLBxe/+DHhp4O+MZYhJcOUExb6
         gA+kYXPNIpCDjC4fT/EH10J/BPXD3/v4JFhHejH8JJXf94oMLYXn0SxtkQFqWaQfVFEq
         aky87+W8nwTFBTJw5IkGG5iSBZ7DkuBv10F/BCQwL2xawbNKOUGG1xCeOorTUsJUtEn9
         6Gqe41sGmXhqVgve2H7hK8sO250ldQIfAEKOsHN5k40StRLuiVv3/ydSrISgle9jLR00
         eoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629964; x=1787234764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XLxuxkEWmtkrUuXmIVaZI8Xooy+ldmx3AqQ9q/E6uec=;
        b=Bggab6Eq5JXEIBbS9keDb03V1HQZxS+1K/AolyNEn/iWlTknA88da2TNk+YN5dIXbc
         v8euUWhklxrc5SMTG5JaUG5flbU08s5nJCzEV4hBACc1Apq1IXHKc4Y3nFFFGnxU7mRZ
         6sLE2dU1leQlkt86o/ROdSjMsKkBm01ndYttByHKxJDv5qZPmlQ9fGkZZ4S1FJSY/h8x
         rEkrMl6o8kgKRwY0LMeqI7LZCZcPjDxlM9ZbyagDndTP7qh/UJSr9+qlu6vCJK4q7nCj
         DjZS7t+cr2GfXssmVBEs0AxyzNIKkoKAS1fF4e9gPTcN86saPSLEWG8r7hXQWqblb1ve
         Widw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8HVB9gV2yV/qcsO9I4Johybr76yefcEJ7fySLUgTieY/XTQeJHFX6zGiTfWZTxpUIxU/axdp/Advi@vger.kernel.org
X-Gm-Message-State: AOJu0YwIpMf2uMkdkerNEiLisrrXk9a18/9d35ncn/ZH2AH9cPu3/zYQ
	eWUQxfP9/VQehrotnQNujaUCfrg3iBz64sCXLa67A3pF7f/bvfQxDvAd
X-Gm-Gg: AR+sD10aLsJbDVc/BpMYeZvD1sB+QaWDYNAyXPeji6Xqr/cMvQ6khlFixK0KHsnxMi9
	mmLflrKTNv+H2JYkLZGgvrbAdBHPUPYD2LGHVkCezQ1t0u+bYoGTdp9XBcypKRjJ8QGawF2UAth
	ojeS1VcKBYjkLXoTXS/qZWd69O9G/EVjCXggrCKlE+/LPhntMaGj3jlKoDSS7yJPJsObWByQ94n
	vygxsQeIvusPbT5rbsieHdmsTjcUF2bWFSja0CvmK2hBzjUyr1+EaH21j1UkDcYAg8vzlYrltTb
	UDlGCSegJrEGhnLzjPa8a2h1mM95KD87xo0xnFydQvC/a4Qb1aEznjG4RK2JnKv/CT2PeIbrXK0
	lZrb7kFlgXgqnotnLbOQNT1npXic/XErIupEZOhWUrVWP4pQt6uz3JWzqoI0U+L4dy1qt8jYdcM
	8rQprxXJDQbdE9u6qSDdRauwjVUr6YrZSlm/8GLiSpmPIVswlUrurcr4u9u8T7rpEz+E/eIBFNa
	itF
X-Received: by 2002:a05:6000:46c9:b0:47f:e877:641b with SMTP id ffacd0b85a97d-48159cc7ec8mr5524380f8f.11.1786629963875;
        Thu, 13 Aug 2026 07:06:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 2/4] ARM: dts: vf-colibri: name the SODIMM gpio lines
Date: Thu, 13 Aug 2026 16:05:58 +0200
Message-ID: <20260813140600.1824949-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813140600.1824949-1-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Colibri modules expose most of their GPIOs on numbered SODIMM pins,
and the i.MX ones already carry those numbers as gpio-line-names, so the
gpiod tools print SODIMM_43 rather than a bank and an offset. Do the same
for the Vybrid modules.

The 99 names come from the pinout table of the Colibri VFxx datasheet
(Toradex 101355). Verified on a Colibri VF50, where gpioinfo now names
every pin the datasheet lists.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 144 +++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 74afc7b0d74b..04b5d532b2c5 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,120 @@ &usbphy1 {
 	status = "okay";
 };
 
+&gpio0 {
+	gpio-line-names = "",
+			  "",
+			  "SODIMM_89",
+			  "",
+			  "",
+			  "SODIMM_102",
+			  "SODIMM_18",
+			  "SODIMM_134",
+			  "SODIMM_16",
+			  "SODIMM_14",
+			  "SODIMM_23",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_47",
+			  "SODIMM_190",
+			  "SODIMM_192",
+			  "SODIMM_49",
+			  "SODIMM_51",
+			  "SODIMM_53",
+			  "SODIMM_37",
+			  "SODIMM_29",
+			  "",
+			  "SODIMM_30",
+			  "SODIMM_20",
+			  "SODIMM_24",
+			  "SODIMM_21",
+			  "SODIMM_19",
+			  "SODIMM_94",
+			  "SODIMM_81",
+			  "SODIMM_28";
+};
+
+&gpio1 {
+	gpio-line-names = "SODIMM_35",
+			  "SODIMM_33",
+			  "SODIMM_27",
+			  "SODIMM_25",
+			  "SODIMM_196",
+			  "SODIMM_194",
+			  "SODIMM_63",
+			  "SODIMM_55",
+			  "SODIMM_65",
+			  "SODIMM_45",
+			  "SODIMM_43",
+			  "SODIMM_73",
+			  "SODIMM_77",
+			  "SODIMM_71",
+			  "SODIMM_98",
+			  "SODIMM_101",
+			  "SODIMM_103",
+			  "SODIMM_79",
+			  "SODIMM_97",
+			  "",
+			  "",
+			  "SODIMM_85",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_106";
+};
+
+&gpio3 {
+	gpio-line-names = "SODIMM_105",
+			  "",
+			  "SODIMM_93",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_95",
+			  "SODIMM_22",
+			  "SODIMM_68",
+			  "SODIMM_82",
+			  "SODIMM_56",
+			  "SODIMM_131",
+			  "SODIMM_44",
+			  "SODIMM_144",
+			  "SODIMM_146",
+			  "SODIMM_52",
+			  "SODIMM_54",
+			  "SODIMM_66",
+			  "SODIMM_64",
+			  "SODIMM_57",
+			  "SODIMM_61",
+			  "SODIMM_140",
+			  "SODIMM_142",
+			  "SODIMM_80",
+			  "SODIMM_46",
+			  "SODIMM_62",
+			  "SODIMM_48",
+			  "SODIMM_74",
+			  "SODIMM_50",
+			  "SODIMM_136",
+			  "SODIMM_138";
+};
+
+&gpio4 {
+	gpio-line-names = "SODIMM_76",
+			  "SODIMM_70",
+			  "SODIMM_60",
+			  "SODIMM_58",
+			  "SODIMM_78",
+			  "SODIMM_72",
+			  "SODIMM_96";
+};
+
 &gpio2 {
 	/*
 	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
@@ -177,6 +291,36 @@ &gpio2 {
 	 */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_ext>;
+
+	gpio-line-names = "SODIMM_69",
+			  "SODIMM_99",
+			  "SODIMM_104",
+			  "SODIMM_107",
+			  "SODIMM_127",
+			  "SODIMM_184",
+			  "SODIMM_186",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_38",
+			  "SODIMM_36",
+			  "SODIMM_34",
+			  "SODIMM_32",
+			  "SODIMM_129",
+			  "SODIMM_86",
+			  "SODIMM_90",
+			  "SODIMM_92",
+			  "SODIMM_88",
+			  "SODIMM_133",
+			  "SODIMM_135",
+			  "SODIMM_188",
+			  "SODIMM_75",
+			  "SODIMM_100";
 };
 
 &iomuxc {
-- 
2.54.0

