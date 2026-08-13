Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8125848C3FF
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637469; cv=none; b=Y8HlFpv3+HEguKf+MpY5h11NaqjCT/wKgD397MaKwJthmL6ZJ5eFcPZqlHbje9lD3/03rmE7XSBrNf3HdeJWM9jd17ckdhzRuvbRtxc+ylJhSAB5asbziHeB/c6LbqsnENeNzYsBMXEGWJLZH3mJxDef3ylddBjG/J6lom4110Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637469; c=relaxed/simple;
	bh=6nVCymDshiLBnvd0Lbn5kEqBkJVHBIOcBWVQLVhrldo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kOzFpXvmvG87IqBdRKxUmtd7xuMRsBNZ4Bq70QFhcqKfklJn4gfRxGAjwVW2AkjSSMNOabguOvX5TD8GG7o/pg/Uc0ql4p3VUMbNOLXyBsmkwFXPEzDsvZ94fVEayKQsoRX6WhAilk+qBlXEmk+KPX++77eYckrAi3IdMd5p7Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iE0IcDsc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iE0IcDsc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso2282f8f.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637465; x=1787242265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYhCVw+NpWfIZb24NzCd/Bpfh96NwI4s0HyFWrf+QtM=;
        b=iE0IcDscgsNKiY5wNF1rAipVaBxAGvAWp5c304WOHhlemwFKH7bm7ppRN+0cQp323y
         oyt+/1YhH/yb3zfkOXc5nu3muRoyjHBnUjmnCjYJaIAofwQA5vXEgfmX0iuyaPXjbKpy
         jfS6PfB/nkbNr2tcY0q5YHBOQFTa1BhQMtIn9waJ8i0ddfd/TF2gDqtPZrTlmfK2cr9S
         WFG4Yr7A/43equ5KDwZaIk3vTG/0rKoGeSmy2Y6JiMqwj9vawyJRnrB2C17cCJOCtIcY
         MjIb6bM/CWFDK2q4drtCWCAIRtOPQ/Wj7riBz3iRVmijEaFeIZKuYgxq4sKDwfRnuQz7
         3iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637465; x=1787242265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYhCVw+NpWfIZb24NzCd/Bpfh96NwI4s0HyFWrf+QtM=;
        b=k3l57vTAefx/dgDjBps218KBfs5vNLVCPuvlpsdiVjcfbeWZgr03oBU7RqnB2VidXS
         bfEa8iKZDOcZc5LOhfwos0niukAFo9f+6WPUmfmMOgpT7dDc64r0bkLQiVBvMHJSjw44
         Lgr4baL9mbUj0dXT9SS9AO40XJm+0gC4AiTchY8QOo7bFf0j+hcr83s5J8y556n6NIKc
         22bepj1wJ8Bo6bCWvRzOXLa8KnD0TxdLE2cC95NBa/MU37xkJae+yj4gt2sYx60PojdU
         Oa1l5ArheEGleo8E242xXAk9bSYMcks3JbCqZxlu93uzEAcqILin45/jF0WnDiOXPaYw
         Hqxw==
X-Forwarded-Encrypted: i=1; AHgh+RpUHECc8bLEGTkfxb+joEuLtuXm3KBH3SIQFVYOMY3rrN8/MIVGzB+5Wo3lhrrACFNP7MyPUfNq2blU@vger.kernel.org
X-Gm-Message-State: AOJu0YyDawmWGoNXVVQIixL4DSHvlAUkpgdsO9migzaBHw8hchvpv2Am
	YgApV9wBOSFdX5lYvDg+hTW6PLAuP8/T/bYN7YaEsW2ZbzJ38wKTlDQA
X-Gm-Gg: AR+sD10KGUS+basQuPOjf3w3+FEYiQvoZVErrHZqdYo5rJPB1UUuv2UqwLhEinvkP3x
	pjADHGk/ZEJBqfJUuZkCUf45cPtBXu8QPeuUqwr/tyVpNFg/SI48anDDU8yBJXmuKPFtttPY7X5
	D2txtC9yBlfIo0dcYJWhyuHiQ2tRa+bPCBDeLHJuQoLRDEtHSDuGL68i4itt/npyPc8WXKgaIIO
	n/gLsCoDuIdmqBFEDEyzgJ8f4UKOhnPEcloeQyyJ/dTsMQUPRqdaPGcmZvrpPhTx68elPp4HQft
	7f0zfraUAQIWbTbO9ZSrpsRjq4AO9jhruVNU8fE+Fpucbg0M36yBDX+TquzP7cHVuEr4rb/BC29
	u0sSkyXkzn4EdMALRtehesNPZoMfMwV0sWsYenQAL4QassPWHGD8O2lgegKhGj/5n9NcXKJomKe
	PmIsnDB7cOTZozm9aIv1DocIm+wtpljQ5SbJzSTjoqeUWL3l7mslurRy0ihJEHroCsIw==
X-Received: by 2002:a05:6000:41d5:b0:481:568d:f118 with SMTP id ffacd0b85a97d-4815a02d66dmr11430093f8f.30.1786637465222;
        Thu, 13 Aug 2026 09:11:05 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:04 -0700 (PDT)
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
Subject: [PATCH v4 2/4] ARM: dts: vf-colibri: name the SODIMM gpio lines
Date: Thu, 13 Aug 2026 18:10:59 +0200
Message-ID: <20260813161101.2274327-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
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
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 74afc7b0d74b..a9269857df2c 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,44 @@ &usbphy1 {
 	status = "okay";
 };
 
+&gpio0 {
+	gpio-line-names = "", "", "SODIMM_89", "",
+			  "", "SODIMM_102", "SODIMM_18", "SODIMM_134",
+			  "SODIMM_16", "SODIMM_14", "SODIMM_23", "",
+			  "", "", "SODIMM_47", "SODIMM_190",
+			  "SODIMM_192", "SODIMM_49", "SODIMM_51", "SODIMM_53",
+			  "SODIMM_37", "SODIMM_29", "", "SODIMM_30",
+			  "SODIMM_20", "SODIMM_24", "SODIMM_21", "SODIMM_19",
+			  "SODIMM_94", "SODIMM_81", "SODIMM_28";
+};
+
+&gpio1 {
+	gpio-line-names = "SODIMM_35", "SODIMM_33", "SODIMM_27", "SODIMM_25",
+			  "SODIMM_196", "SODIMM_194", "SODIMM_63", "SODIMM_55",
+			  "SODIMM_65", "SODIMM_45", "SODIMM_43", "SODIMM_73",
+			  "SODIMM_77", "SODIMM_71", "SODIMM_98", "SODIMM_101",
+			  "SODIMM_103", "SODIMM_79", "SODIMM_97", "",
+			  "", "SODIMM_85", "", "",
+			  "", "", "", "",
+			  "", "", "", "SODIMM_106";
+};
+
+&gpio3 {
+	gpio-line-names = "SODIMM_105", "", "SODIMM_93", "",
+			  "", "", "", "SODIMM_95",
+			  "SODIMM_22", "SODIMM_68", "SODIMM_82", "SODIMM_56",
+			  "SODIMM_131", "SODIMM_44", "SODIMM_144", "SODIMM_146",
+			  "SODIMM_52", "SODIMM_54", "SODIMM_66", "SODIMM_64",
+			  "SODIMM_57", "SODIMM_61", "SODIMM_140", "SODIMM_142",
+			  "SODIMM_80", "SODIMM_46", "SODIMM_62", "SODIMM_48",
+			  "SODIMM_74", "SODIMM_50", "SODIMM_136", "SODIMM_138";
+};
+
+&gpio4 {
+	gpio-line-names = "SODIMM_76", "SODIMM_70", "SODIMM_60", "SODIMM_58",
+			  "SODIMM_78", "SODIMM_72", "SODIMM_96";
+};
+
 &gpio2 {
 	/*
 	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
@@ -177,6 +215,15 @@ &gpio2 {
 	 */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_ext>;
+
+	gpio-line-names = "SODIMM_69", "SODIMM_99", "SODIMM_104", "SODIMM_107",
+			  "SODIMM_127", "SODIMM_184", "SODIMM_186", "",
+			  "", "", "", "",
+			  "", "", "", "SODIMM_38",
+			  "SODIMM_36", "SODIMM_34", "SODIMM_32", "SODIMM_129",
+			  "SODIMM_86", "SODIMM_90", "SODIMM_92", "SODIMM_88",
+			  "SODIMM_133", "SODIMM_135", "SODIMM_188", "SODIMM_75",
+			  "SODIMM_100";
 };
 
 &iomuxc {
-- 
2.54.0

