Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D8A3F4DE0
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371654; cv=none; b=aL5uJ9dIf3ZL/LfgtXZ4WW30bA8FN2GaNP0izw9e1LYcK3XhZ5FAskZDOfnbY70n/qA3MPV5f8AL99hcrytIDUlQx45s8fxMB36jwOpXDIk0MXxr36FFJmk9GQcx2oM59BrwzDYURUeNF2DEGOuiZkA9Zb3siaqTD+EV18eIi/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371654; c=relaxed/simple;
	bh=iUsMkpvBNFRusFAlt82Y749Vr0lq7pl4RQpg0fTX1zA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7p9/qGHm3Lr3svdeBv8w/d4XgzWlnBWZqviSIIyu/jCy/5rrWmXuT6E4sqSFhN7KOLzitg8UmFfvrJ+Tu0QnpUP0OC9wiO2KDkMfwcL0SGE+VQvwgItCbL6zN3E1dvg1REkqjfCSfK4hL04oR1ONDw3+IDBAZ1Ke9wwYYMDMAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYB3/OfB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYB3/OfB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49558ce01afso15132455e9.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371651; x=1786976451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSq7OZ0xeIWTiSwoTzu6Q+tT3niFPej9d4P2mwNfxe8=;
        b=QYB3/OfB5mz4Df7zvCae88Vc4wqZD1B27qHVRlG29RgS4wDB50rGaatg7OAj3sBgI8
         XVKiwcqdvwqaqJtJtHecvC35ah/YFWifA2034mVi42hU8H42UPRRhS6ypgh22kFZdSC9
         lXqVicXBu0C6gEMDUj1g8DH4OyfE6ONBWWO31ZhD08n+C88IyGHmHvoe7a6vppXVG2m+
         cGbG6dIlCwJlHzDssVbKQED/TD/5gYlfJVaQI31a8zY2EXzMYfnmtZTgqftf3xIKqWwK
         BnakvAzfCBBcWKAf3igdME6b+uuFEkCAPoAQoPEW96nVpdFTphVC5o7DHzAku1r+MP1O
         H+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371651; x=1786976451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSq7OZ0xeIWTiSwoTzu6Q+tT3niFPej9d4P2mwNfxe8=;
        b=sOv8PYWhLBaolYmACuVDadOJiZqcD4js1f2LRpTpBnnEV6n4toLkdxvO/QY86vLVfX
         m0Fr5ynmbfmGcHFWmX3YBcxoysPSWm1k3bDdg4DegXpHfV3RJhkeLFZ5T+hnWNYQfXcX
         1pvzDTBo93y5rL/4//O0YL3SnJEchx4Cm14N7xbqBmJrDYJ2owSeyg1wXw2Mum1pVadu
         BiOecAzGDnawyTfwbvOBPuXjk2epLLEXl3UvuVyOLhFkwAh/N49BWTEX/Q0i7uBKi5FG
         6pBDIYeRFFx1MpinJQDMofwXXGUZLkVBzWY7e0jd3mzyYtDPSmz7bF6z0fda2wdUkemL
         AEbA==
X-Forwarded-Encrypted: i=1; AHgh+Rpvomtk6zlB2DfvrfpAgWSRmEmo8CcFGldfR6LexC8V4K2wxl0jf50kkiy0V4sTOOr+V1LSs04NvY6+@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAg+6koyvBRhnFzg4Js/WkQC0fHEQWnw/aagYixSEo1IK0JFO
	sBXTxzZm+JdhxWS0g28+jM8ch8UawOuEYoRFRQx+GJe/x21YQdqr2n3/
X-Gm-Gg: AR+sD11cWQAK8/ckcQn7dt9J07ZUH3uBhhin4leIgf21JLqnYdwalEdoF6/oiu9EQIh
	zHXLsYwHvW5A/JJMtcwhbINil812oSGOpatuviY6pRYVqrUS0vDcNP3wB80hYQ+MpfqUAcsBzmb
	OrmSX6h1Sq7OR1a1BEmLBPlGQ9UOzvwQMxDpe0CNcGajQB9/c6Xe4QTYrVNGQ5okcRhasYu/ezc
	CoDwlREP7sFcdDTMg62pX6ck2TROzLmx7x30BBr8g63ceUqbHQuVwA9GLx0KmAHT3c2OvAXWP9G
	7VMnmO+wTq3vC2jdvV3EwbMnd6IPvm+t+WUxKFBcNNXcmcbCQbuF06KhKPizWdjavkpJ3M27ChD
	x3ongc6H0lBurWR53wC5jgiA3dhmsVElYUkGJ+xiiYkig5IL408jON2ucZBbTP8iyNgnxjqko9G
	qkXV1N1tG4K/wcnzhT6AlnvyChc9LYucW7Xu7vI8ohgq1pTgUwWlcMAl0iKad9byPBiCI=
X-Received: by 2002:a05:600c:4ed3:b0:493:e983:806e with SMTP id 5b1f17b1804b1-4994e72f795mr589286845e9.3.1786371650925;
        Mon, 10 Aug 2026 07:20:50 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm354413055e9.6.2026.08.10.07.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:20:50 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] ARM: dts: vf-colibri: name the SODIMM gpio lines
Date: Mon, 10 Aug 2026 16:20:45 +0200
Message-ID: <20260810142047.2811230-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810142047.2811230-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
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
index 74afc7b..04b5d53 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,120 @@
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
@@ -177,6 +291,36 @@
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

