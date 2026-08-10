Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BA021A447
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370461; cv=none; b=a7IWVH7MA+Ep4YxXUrDwB5ldOKxHpAdO0KdTfEtrR16ueC0K0vkIetD3ZXcBz7O8nhHNm2zfMulRoqJVr5xRxXlv7VKPxLWs+hAQavNrjMeV3glHHEvdq9RY08lYnpFQCGmctf18YzsYeH7KIoUzWYmT1EwdlZ62d67qp1Ax8mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370461; c=relaxed/simple;
	bh=iUsMkpvBNFRusFAlt82Y749Vr0lq7pl4RQpg0fTX1zA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9M+QTfL5PqR9e1t05RqU+Vl965rXnCA9hmM3j2MaiWN9OVLCHST7UxUU8dYsqmR/4ikUYb7YPzytncCuczAvxtLx392gBAjFHXrNTFujkE4Hn3jtzXunuO6h3pD7o3V5RujW2vb+B9e+YSKkBrZDgrB5kRH5tQ3cAzE1iW5M+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYvtwx3B; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYvtwx3B"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495635a85d2so17244245e9.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786370458; x=1786975258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSq7OZ0xeIWTiSwoTzu6Q+tT3niFPej9d4P2mwNfxe8=;
        b=lYvtwx3BshLBPVH0Zls+ffLXkB1iOOkpiOHFfkRBKFG8Z8E0lknQoL6UxShnnQ2TzG
         tvT3vy5jOzqoejRAb4URpCLsyM9dn5JkI7idj/H8J6JQaOfxy9x1la86wVZWk7RF201B
         5JZH9tjWL97Swhmw7ojBtnihRb/jrfWDMB9+1XiFlTbqPDVzpcQp8Kh57XQG4oCtKmk0
         LA843LoX6KFBPfXj5n/ShrF25MmW1eO1JRFIe7Put28vKdx5R/OMwxCYG8r4rE53E/LW
         taO2c9MZpoLllyQKXPwtbI6HZFqDReR5zq6vvSJiZRq+k5gVEwwNbD4Y3LkeeYZ+f31U
         lxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370458; x=1786975258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSq7OZ0xeIWTiSwoTzu6Q+tT3niFPej9d4P2mwNfxe8=;
        b=tXYhq12IAZ+U4vH+TrKKhqnVTw0ZtV4gDPvlt2dho5f2cBm6Ka4i+VoWZ/sk2C5WPS
         PHWOyF56FmV2h9dyQ8/AAZvG3Ir1RsaXmsyTYyMz2DJd2MjEckqI3Z29WDBKK7EvT5hp
         6RB4LUgXjHs5xjGSV/LkmWGaaHUnP4h6RU2vGo3hkoGQPEkhrv2KwepkSZVi763irLtc
         jVzGMyXeGMMZTHVZ4A8kNZ5xTFjFvzxeyh233uhoCeyOpIMAxM9YF5sDoUAyDPCcsMvk
         1rCFtoJP9Ud0/txd3nI3g/pYI9KjrDIIz6RHhVjZmeuo0SeK1tvLtOE+l9CIK7zz3bcx
         pxmA==
X-Forwarded-Encrypted: i=1; AHgh+RqMec+Yepd93CG3uI+1lfBrzukModyA+XcKObXprsK5MOLhMHrndKCzlbven9zpWhRJDLjl8YIssNz+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Lf5OubOnj/LZj4v+UctqI8dyTucoMrUtrK/SgxT49aKGQS5B
	cn3ZRs37jWHgjY7cc8f9iQH1NP78+mPqHXjkmNhZ2xNmRuPLEtbTkEoM
X-Gm-Gg: AR+sD12tXYyKQkVRvPaz/pfkAXH0r/lcKU224RrRh2+ixWyeHTCuF+qhR7gZf7Jj/Ov
	ioR3b+82flNcytlOTucHIbVWa2Ar9yQPCydGuNPPG07fvZf8idqawnmvmivCsK/y5JmJwgVg+jh
	QVIlrA1Onwjz1AkZ1j+n1XHiCKw/Sr16QN60NTr3ounA7GGfwNChtqtQq920lfQWtLHuhG1Wewi
	tok1mPZD8FMX8hKTOEJApOOp2L/s9NU/k9rKsUGE5kyWooj9FiOMtOmCfVXNbddzuDurWJk2mOa
	fHURPzZK1SsO3xlEgMdB6++sHdnbXWqoqND1RKokFFECoCck6a1uTy7WZ/VmMy2uGtZikokaC/4
	c/lJ+YVbf+M55D+ESz6klB1JPoCUjBcLemPCvmsTGK0CbukO0/f0aC6Avkv70UUHWe3t29+umXW
	pm6wdFKBY7br1J8I7Y9r5dr8PzO14XW4nvwiz3/u1vwxl5e/NV5DQAeE0QGwbI4g2J8Ec=
X-Received: by 2002:a05:600c:620e:b0:495:6274:56c2 with SMTP id 5b1f17b1804b1-4994e70a6f5mr708499675e9.2.1786370457505;
        Mon, 10 Aug 2026 07:00:57 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm291661565e9.4.2026.08.10.07.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:00:56 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: vf-colibri: name the SODIMM gpio lines
Date: Mon, 10 Aug 2026 16:00:52 +0200
Message-ID: <20260810140053.2793495-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810140053.2793495-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
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

